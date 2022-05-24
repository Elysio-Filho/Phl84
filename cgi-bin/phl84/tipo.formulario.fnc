<!-- Obtem e ordena a lista dos tipos de formularios -->
     <function name="tipo.formulario">

     <do task="search">
       <parm name="db">phl_acv_fmt</parm>
       <parm name="expression">$</parm>
       <list action="delete">now</list>
       <loop>
	<list action="load" type="sort">
        <pft>,mhu,@tab_txt.pft,mpl,'^a',@tab_txt.pft,'^b'mfn(1)/,</pft>
      </list>
      </loop>
      </do>
      <file action="close" type="database">phl_acv_fmt</file>

      <do task="list">
      <field action="define" tag="3026">Isis_Item</field>
      <loop>
        <field action="import" tag="list">3073</field>
        <field action="replace" tag="3073" split="occ"><pft>,(v3073/),v3026/,</pft></field>
        <field action="export" tag="3073">3073</field>
      </loop>
    </do>
    <list action="delete">now</list>

    <field action="delete" tag="3026">ALL</field>

    <field action="export" tag="3073">3073</field>

    </function>