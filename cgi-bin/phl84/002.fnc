<!-- Registra data de cancelamento automático da reserva -->

     <function name="002">

     <!-- Importa variáveis para uso da função -->
          <field action="import" tag="list">900,3000,4001,7003</field>

     <!-- Obtém o MFN da data de validade da reserva -->

          <do task="keyrange">
            <parm name="db"><pft>,v3000^1'_cal'</pft></parm>
            <parm name="from"><pft>'UTL='v7003.8,</pft></parm>
            <field action="define" tag="1001">Isis_Current</field>
            <field action="define" tag="1002">Isis_Total</field>
            <field action="define" tag="1">Isis_Key</field>
            <field action="define" tag="21">Isis_Posting</field>
            <parm name="posting">All</parm>
            <parm name="count">2</parm>
            <loop>
              <display>
                <pft>,if val(v1001)=2 then putenv('dia='v1*4),putenv('val='v21^m) else fi,</pft>
              </display>
            </loop>
          </do>
          <file action="close" type="database"><pft>,v3000^1'_cal'</pft></file>

     <!-- Verifica se título devolvido está em lista de espera -->

          <do task="search">
            <parm name="db">phl_res</parm>
            <parm name="expression"><pft>,'TIT='v900^a,'*ESP'</pft></parm>
            <parm name="count">1</parm>
       
            <loop>
            <field action="import" tag="list">3000,4001,7003</field>
         
            <!-- Agrega data de aviso no primeiro da lista de espera -->

                <file action="close" type="database">phl_res</file>

                <do task="update">
                  <parm name="db">phl_res</parm>
                  <parm name="mfn"><pft>,mfn(1),</pft></parm>
                  <parm name="fst"><pft>,cat('phl_res.fst'),</pft></parm>
                  <parm name="uctab"><pft>,cat('uctab'),</pft></parm>
                  <parm name="actab"><pft>,cat('actab'),</pft></parm>
                  <parm name="expire">60</parm>
                  <parm name="lockid"><pft>,v3000^2,</pft></parm>
                  <field action="define" tag="1105">Isis_Lock</field>
                  <field action="define" tag="1003">Isis_Status</field>

                  <update>
                    <field action="replace" tag="930"><pft>,v930,'^n'getenv('val'),</pft></field>
                    <field action="export" tag="930">930</field>
                    <write>Unlock</write>
                    <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zMOD|002.fnc'/,</pft></field>
                    <call name="log">now</call>
                  </update>
                
                </do>
                <file action="close" type="database">phl_res</file>
        
            </loop>
          </do>
          <file action="close" type="database">phl_res</file>
          
</function>