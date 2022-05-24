<!-- Obtem atrasos do usuário em todas as bibliotecas
     26/07/2006 11:11:55 Revisado -->
     
     <function name="emp_data">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">,951,1022,3000,4001</field>

<!-- Busca unidades do sistema na base de dados de bibliotecas -->
     <do task="mfnrange">
       <parm name="db">phl_set</parm>
       <loop>
         <field action="import" tag="list">951,1022,3000,4001</field>
         
         <field action="statusdb" tag="1092"><pft>,v601'_emp',</pft></field>
         <file action="close" type="database"><pft>,v601'_emp',</pft></file>
         
         <flow action="jump">
           <pft>
             if v1092^s='mi' then 'busca_atraso' else 'loop' fi
           </pft>
         </flow>

         <label>busca_atraso</label>

         <do task="search">
           <parm name="db"><pft>,v601'_emp',</pft></parm>
           <parm name="expression"><pft>,'USR='v951,</pft></parm>
           <loop>

            <field action="import" tag="list">1022,3000,4001</field>
            <flow action="jump">
              <pft>,if val(v1022)<=val(v900^n) then 'proximo' else 'atraso_sim' fi,</pft>
            </flow>
            
            <label>atraso_sim</label>
            <call name="atraso">now</call>

            <flow action="skip">
              <pft>,if val(v3)=0 then 'Next' else putenv('atraso=sim') 'Quit' fi,</pft>
            </flow>
            
            <label>proximo</label>
           </loop>
        </do>
        <file action="close" type="database"><pft>,v601'_emp',</pft></file>
       <label>loop</label>

       </loop>
     </do>

     <file action="close" type="database">phl_set</file>

</function>
