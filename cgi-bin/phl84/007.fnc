<!-- Extrato do usuario -->

     <function name="007">

<!-- Importa variaveis para a funcao -->
     <field action="import" tag="list">951,3000,4001,7003</field>
 
<!-- Verifica emprestimos em todas as bibliotecas -->
     <do task="mfnrange">
       <parm name="db">phl_set</parm>
       <loop>
         <field action="import" tag="951">951</field>
         
             <do task="search">
               <parm name="db"><pft>,v601'_emp',</pft></parm>
               <parm name="expression"><pft>,'USR='v951,</pft></parm>
                 <loop>
                 <field action="import" tag="list">601</field>
                 <list action="load" type="sort">
                   <pft>,
                     '^d'v900^d,
                     '^y'v601,
                     '^oemp',
                     '^t'v900^t,
                     '^a'v900^a,
                     '^n'mfn(1),
                     '^v'v900^v/,
                    </pft>
                 </list>
                 </loop>
             </do>
             <file action="close" type="database"><pft>,v601'_emp',</pft></file>
             </loop>
          </do>
      <file action="close" type="database">phl_set</file>

 <!-- Verifica penalidades -->
      <do task="search">
        <parm name="db">phl_pen</parm>
        <parm name="expression"><pft>,'USR='v951,</pft></parm>
        <field action="define" tag="1022">Isis_Total</field>
        <loop>
          <list action="load" type="list">
            <pft>,
                 '^y'v940^a,
                 '^o'v940^o,
                 '^d'v940^d,
                 '^t'v940^t,
                 '^n'mfn(1),
                 '^m'v940^m,
                 '^p'v940^p/,
            </pft>
          </list>
       </loop>
     </do>
     <file action="close" type="database">phl_pen</file>
         
<!-- Verifica reservas -->
     <do task="search">
       <parm name="db">phl_res</parm>
       <parm name="expression"><pft>,'USR='v951,</pft></parm>
       <loop>
         <list action="load" type="list">
           <pft>,
              ref(['phl_acv']l(['phl_acv'],'TIT='v930^a),'^y'v1)
               '^ores',
               '^d'v930^e,
               "^n"v930^n,
               '^r'mfn(1),
               '^a'v930^a/
           </pft>
         </list>
         <file action="close" type="database">phl_acv</file>
        </loop>
      </do>
      <file action="close" type="database">phl_res</file>

 <!-- Imprime extrato -->        
      <display><htmlpft><pft>,ref(['tab_fmx']120,v4),</pft></htmlpft></display>

      <do task="list">
        <field action="define" tag="1001">Isis_Current</field>
        <field action="define" tag="1002">Isis_Itens</field>
        <field action="define" tag="1">Isis_Item</field>
        <display><pft>,putenv('multa=0'),</pft></display>
        <loop>
          <field action="import" tag="list">951,3000,4001,7003</field>
          <display><pft>,putenv('multa='f(val(v1^m)+val(getenv('multa')),0,2))</pft></display>
          <display><htmlpft><pft>,ref(['tab_fmx']119,v4),</pft></htmlpft></display>
        </loop>
      </do>
      <field action="add" tag="1"><pft>,'^m',getenv('multa'),</pft></field>
      <display><htmlpft><pft>,ref(['tab_fmx']118,v4),</pft></htmlpft></display>
         
</function>
