<!-- Carrega quantidade de objetos do mesmo tipo em poder do usuário
     26/07/2006 11:11:55 Revisado -->

     <function name="701">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">100,500,951</field>

     <!-- Carrega quantidade de objetos do mesmo tipo em poder do usuário -->

          <do task="mfnrange">
            <parm name="db">phl_set</parm>
            <loop>
             <field action="import" tag="list">100,500,951</field>
         
             <field action="statusdb" tag="1092"><pft>,v601'_emp',</pft></field>
             <file action="close" type="database"><pft>,v601'_emp',</pft></file>
         
             <flow action="jump">
              <pft>
               if v1092^s='mi' then 'busca_emp' else 'loop' fi
              </pft>
             </flow>

             <label>busca_emp</label>
             
             <do task="search">
               <parm name="db"><pft>,v601'_emp',</pft></parm>
               <parm name="expression"><pft>,'QTD='v951,v100^e'#'v500^b,</pft></parm>
               <field action="define" tag="4022">Isis_Total</field>
               <loop>
                 <list action="load" type="list"><pft>,v900/,</pft></list>
               </loop>
             </do>
             <file action="close" type="database"><pft>,v601'_emp',</pft></file>
           </loop>

         </do>
         
         <do task="list">
            <field action=define tag="130">Isis_Itens</field>
            <field action=define tag="1001">Isis_Item</field>
            <loop></loop> 
         </do>
         <list action="delete">now</list>
        <file action="close" type="database">phl_set</file>
        
<!-- Exporta variável para uso do script que chamou a função -->
     <field action="export" tag="list">130</field>
        
</function>