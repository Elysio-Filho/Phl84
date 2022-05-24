<!-- Obtem e ordena a lista dos tipos de suporte -->
     <function name="preferencia.suporte">

     <do task="keyrange">
       <parm name="db">phl_acv</parm>
       <parm name="from">SPT=</parm>
       <parm name="to">SPT=X</parm>
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
	    <field action="import" tag="list">3074</field>
		<field action="replace" tag="3074" split="occ"><pft>,(v3074/),v3026/,</pft></field>
	    <field action="export" tag="3074">3074</field>	
	  </loop>
    </do>
	<list action="delete">now</list>
    <field action="delete" tag="3026">ALL</field>

    <field action="export" tag="3074">3074</field>

    </function>