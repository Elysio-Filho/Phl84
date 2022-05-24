<!-- Obtem e ordena a lista dos tipos de idiomas -->
     <function name="preferencia.idioma">

     <do task="keyrange">
       <parm name="db">phl_acv</parm>
       <parm name="from">IDM=</parm>
       <parm name="to">IDM=X</parm>
       <field action="define" tag="1">Isis_Key</field>
       <list action="delete">now</list>
       <loop>
         <list action="load" type="sort">
         <pft>,v1*4/,</pft>
         </list>
       </loop>
     </do>
     <file action="close" type="database">phl_acv</file>

     <do task="list">
       <field action="define" tag="3026">Isis_Item</field>
       <loop>
	<field action="import" tag="list">3078</field>
	<field action="replace" tag="3078" split="occ"><pft>,(v3078/),v3026/,</pft></field>
	<field action="export" tag="3078">3078</field>
       </loop>
     </do>
     <list action="delete">now</list>
     <field action="delete" tag="3026">ALL</field>

     <field action="export" tag="3078">3078</field>

     </function>