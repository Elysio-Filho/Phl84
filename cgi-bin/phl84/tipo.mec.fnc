<function name="tipo.mec">

 <!-- Compões box de categorias para os formulários -->
	
	<do task="mfnrange">
	  <parm name="db">phl_mec</parm>
	  <loop>
            <list action="load" type="sort">
	    <pft>,'^a',@tab_txt.pft,'^b'mfn(1)/,</pft>
          </list>
          </loop>
	</do>

	<do task="list">
          <field action="define" tag="3598">Isis_Item</field>
          <loop>
	    <field action="import" tag="list">3501</field>
		<field action="replace" tag="3501" split="occ"><pft>,(v3501/),v3598/,</pft></field>
	    <field action="export" tag="3501">3501</field>	
	  </loop>
        </do>
	<list action="delete">now</list>
        <field action="export" tag="list">3501</field>

</function>

        
