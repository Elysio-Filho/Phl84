<!-- Obtem atrasos do usuário em todas as bibliotecas
     17/11/2010 09:36:41 - Revisado -->

     <function name="101">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">951,1022</field>

<!-- Obtém informações sobre objetos em atraso em poder do usuário -->
     
     <do task="mfnrange">
       <parm name="db">phl_set</parm>
       <loop>
         <field action="import" tag="list">951,1022</field>
         
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
           
             <field action="import" tag="list">1022</field>

             <flow action="skip">
               <pft>,if val(v1022)<=val(v900^n) then 'Next' else putenv('atraso=sim') 'Quit' fi,</pft>
             </flow>

           </loop>
         </do>
         <file action="close" type="database"><pft>,v601'_emp',</pft></file>

       </loop>
     </do>
     <file action="close" type="database">phl_set</file>
     

</function>