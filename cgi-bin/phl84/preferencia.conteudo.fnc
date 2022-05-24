<!-- Obtem e ordena a lista dos tipos de conteudo -->
     <function name="preferencia.conteudo">

     <do task="keyrange">
       <parm name="db">phl_acv</parm>
       <parm name="from">CNT=</parm>
       <parm name="to">CNT=X</parm>
       <field action="define" tag="1">Isis_Key</field>
       <list action="delete">now</list>
       <loop>
         <list action="load" type="sort">
         <!-- 14/12/2017 10:03:14 --> <pft>,v1*4/,</pft>
         </list>
       </loop>
     </do>
     <file action="close" type="database">phl_acv</file>

	<do task="list">
      <field action="define" tag="3026">Isis_Item</field>
      <loop>
	    <field action="import" tag="list">3075</field>
		<field action="replace" tag="3075" split="occ"><pft>,(v3075/),v3026/,</pft></field>
	    <field action="export" tag="3075">3075</field>	
	  </loop>
    </do>
    <list action="delete">now</list>
    <field action="delete" tag="3026">ALL</field>

    <field action="export" tag="3075">3075</field>

    </function>