<!-- Obtem e ordena a lista das bibliotecas -->
     <function name="rede.bibliotecas">

     <do task="search">
       <parm name="db">phl_set</parm>
       <parm name="expression">$</parm>
       <list action="delete">now</list>
       <loop>
	<list action="load" type="sort">
        <pft>,'^a',v601,'^b'v602/,</pft>
      </list>
      </loop>
      </do>
      <file action="close" type="database">phl_set</file>

      <do task="list">
        <field action="define" tag="3600">Isis_Item</field>
          <loop>
	    <field action="import" tag="list">3601</field>
	    <field action="replace" tag="3601" split="occ"><pft>,(v3601/),v3600/,</pft></field>
	    <field action="export" tag="3601">3601</field>
          </loop>
      </do>
      <list action="delete">now</list>
      <field action="delete" tag="3600">ALL</field>

      <field action="export" tag="3601">3601</field>

    </function>