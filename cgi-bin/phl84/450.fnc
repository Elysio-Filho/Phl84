<!-- Rotina de atualização das bases de controle de autoridades
     25/10/2010 15:31:36 -->
         
     <function name="450">

<!-- Importa para a funcao as variáveis de configuracao -->
      <field action="import" tag="list">16,10,17,11,3000</field>
      <field action="replace" split="occ" tag="10"><pft>(v10/)</pft></field>
      <field action="replace" split="occ" tag="11"><pft>(v11/)</pft></field>
      <field action="replace" split="occ" tag="16"><pft>(v16/)</pft></field>
      <field action="replace" split="occ" tag="17"><pft>(v17/)</pft></field>

<!-- Carrega lista de autores -->
     <list action="load" type="freq"><pft>,(v16^*/,v17^*/,v10^*/,v11^*/),</pft></list>

<!-- Processa cada item da lista de autores obtidos do documento catalogado -->
     <do task="list">
       <field action="define" tag="450">Isis_Item</field>
       <loop>
         <field action="import" tag="list">3000</field>

         <flow action="jump">
           <pft>,if npost(['phl_aut']'AUT='v450)=0 then 'grava_aut' else 'loop' fi,</pft>
         </flow>

         <label>grava_aut</label>
         <file action="close" type="database">phl_aut</file>

         <do task="update">
           <parm name="db">phl_aut</parm>
           <parm name="mfn">New</parm>
           <parm name="fst"><pft>cat('phl_aut.fst')</pft></parm>
           <field action="define" tag="1003">Isis_Status</field>
           <update>
             <field action="import" tag="list">450,3000</field>
             <field action="add" tag="999"><pft>'^d's(date).8,'^h's(date)*9.4,'^b'v3000^2,</pft></field>
             <field action="delete" tag="list">3000</field>
             <write>Unlock</write>
             <field action="import" tag="list">3000</field>
             <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zNEW|450.fnc'/,</pft></field>
             <call name="log">now</call>
           </update>
         </do>
         <file action="close" type="database">phl_aut</file>

       <label>loop</label>
       </loop>
     </do>
     <list action="delete">now</list>
              
</function>