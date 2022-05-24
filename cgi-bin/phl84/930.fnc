<!-- Funcao de atualização da lista de reservas e geracao de avisos de disponibilidade -->

     <function name="930">
     
<!-- Importa para a funcao as variáveis de configuracao -->
     <field action="import" tag="list">3000,7003</field>

<!-- Armazena em v1007 o MFN da data de hoje -->
     <field action="add" tag="1007">
       <pft>,ref([v3000^1'_cal']l([v3000^1'_cal'],v7003.8),mfn(1)),</pft>
     </field>
     <file action="close" type="database"><pft>,v3000^1'_cal',</pft></file>

<!-- Atualiza lista de espera conforme disponibilidade -->
     
     <do task="search">
       <parm name="db">phl_res</parm>
       <parm name="expression"><pft>,'ACV='v3000^1'*ESP',</pft></parm>
       <loop>
         <list action="load" type="freq"><pft>,'^t'v930^a,'^o'v930^o,</pft></list>
       </loop>
     </do>
     <file action="close" type="database">phl_res</file>
     
     <do task="list">
       <field action="define" tag="1001">Isis_Current</field>
       <field action="define" tag="1002">Isis_Itens</field>
       <field action="define" tag="1">Isis_Item</field>
       <loop>
       <field action="import" tag="list">1007,3000</field>
       
        <!-- Armazena em v100 a quantidade de exemplares circulantes -->
        
             <field action="add" tag="100"><pft>,f(npost([v1^o'_tbo'],v1^t'#1',),0,0),</pft></field>
             <file action="close" type="database"><pft>,v1^o'_tbo'</pft></file>
        
       <!-- Armazena em v200 a quantidade de exemplares emprestados
            Todos os emprestados exceto os TOP=LOC (empréstimos de consulta local) -->

            <do task="search">
              <parm name="db"><pft>,v1^o'_emp'</pft></parm>
              <parm name="expression"><pft>,'TIT='v1^t'*(TOP=EMP+TOP=REN)',</pft></parm>
              <field action="define" tag="200">Isis_Total</field>
              <loop></loop>
            <field action="export" tag="200">200</field>
            </do>
            <file action="close" type="database"><pft>,v1^o'_emp'</pft></file>

       <!-- Armazena em v210 a quantidade de exemplares reservados -->

            <field action="add" tag="210"><pft>,f(npost(['phl_res'],v1^t'#R',),0,0),</pft></field>
            <file action="close" type="database">phl_res</file>

       <!-- Armazena em v300 a quantidade de exemplares disponiveis -->

            <field action="add" tag="300"><pft>,f(val(v100)-( val(v200)+val(v210) ),0,0),</pft></field>

            <flow action="jump"><pft>,if val(v300)>=1 then 'upd' else 'fim' fi,</pft></flow>

              <label>upd</label>
              <field action="add" tag="2051"><pft>f(val(v1007)+1,0,0)</pft></field>
         
              <field action="add" tag="2052">
                <pft>,ref([v1^o'_cal']val(v2051),v323,v322,v320),</pft>
              </field>
              <file action="close" type="database"><pft>,v1^o'_cal',</pft></file>

              <!-- Obtém o próximo dia útil e define como data de validade da reserva -->

              <do task="keyrange">
                <parm name="db"><pft>,v1^o'_cal'</pft></parm>
                <parm name="from"><pft>'UTL='v2052,</pft></parm>
                <field action="define" tag="1001">Isis_Current</field>
                <field action="define" tag="1002">Isis_Total</field>
                <field action="define" tag="11">Isis_Key</field>
                <field action="define" tag="21">Isis_Posting</field>
                <parm name="posting">All</parm>
                <parm name="count">1</parm>
                <loop>
                 <display>
                   <pft>
                     ,putenv('dia='v11*4)
                     ,putenv('val='v21^m),
                   </pft>
                 </display>
                </loop>
              </do>
              <file action="close" type="database"><pft>,v1^o'_cal'</pft></file>
              
              <!-- Obtém usuários em lista de espera em número equivalente as disponibilidades -->
              
              <do task="search">
              <parm name="db">phl_res</parm>
              <parm name="expression"><pft>,v1^t'#E',</pft></parm>
              <parm name="count"><pft>,v300,</pft></parm>
              <loop>
              <field action="import" tag="list">1,3000,4001,9010,</field>
              
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
                    <field action="import" tag="list">3000,7003</field>
                    <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zMOD|930.fnc'/,</pft></field>
                    <call name="log">now</call>
                  </update>
                  <field action="export" tag="930">930</field>
               </do>

             </loop>
            </do>
            <file action="close" type="database">phl_res</file>
            
       <label>fim</label>
       </loop>
     </do>
     
<!-- Obtém reservas de objetos disponíveis -->

     <do task="search">
       <parm name="db">phl_res</parm>
       <parm name="expression"><pft>,'ACV='v3000^1'*RES',</pft></parm>
       <loop>

       <field action="import" tag="list">1007,4001,3000</field>

       <flow action="jump">
         <pft>,/* Verifica se é para eliminar a reserva com validade vencida */,
              ,if ref(['phl_rgl']val(v930^c),v537)='' then 'loop' fi,
         </pft>
      </flow>

      <flow action="jump">
        <pft>,/* Verifica se o limite da reserva está no prazo */,
             ,if val(v1007)>val(v930^n) then 'elimina' else 'loop' fi,
        </pft>
      </flow>

      <label>elimina</label>
      <!-- 30/09/2008 06:16:49 --><file action="close" type="database">phl_res</file>

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
            <field action="export" tag="list">930</field>
            <field action="delete" tag="list">ALL</field>
            <write>Delete</write>
            <field action="import" tag="list">930,3000,7003</field>
            <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zCAN|930.fnc'/,</pft></field>
            <call name="log">now</call>
          </update>
      </do>

      <label>loop</label>
      </loop>
     </do>
     <file action="close" type="database">phl_res</file>

</function>
