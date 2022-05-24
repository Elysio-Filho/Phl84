<!-- Obtem e ordena a lista das opcoes de coleções -->
     <function name="preferencia.colecao">

     <do task="keyrange">
       <parm name="db">phl_acv</parm>
       <parm name="from">COL=</parm>
       <parm name="to">COL=Z</parm>
       <field action="define" tag="1">Isis_Key</field>
       <list action="delete">now</list>
       <loop>
         <list action="load" type="sort">
         <pft>,'^a',ref(['phl_col']val(v1*4),@tab_txt.pft,),'^b'v1*4/,</pft>
         </list>
       </loop>
     </do>
     <file action="close" type="database">phl_acv</file>

     <do task="list">
      <field action="define" tag="3026">Isis_Item</field>
      <loop>
	    <field action="import" tag="list">3091</field>
		<field action="replace" tag="3091" split="occ"><pft>,(v3091/),v3026/,</pft></field>
	    <field action="export" tag="3091">3091</field>
	  </loop>
    </do>
	<list action="delete">now</list>
    <field action="delete" tag="3026">ALL</field>

    <field action="export" tag="3091">3091</field>

    </function>