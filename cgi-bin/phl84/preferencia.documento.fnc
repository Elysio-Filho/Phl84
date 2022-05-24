<!-- Obtem e ordena a lista dos tipos de documentos -->
     <function name="preferencia.documento">

     <do task="keyrange">
       <parm name="db">phl_acv</parm>
       <parm name="from">TIP=</parm>
       <parm name="to">TIP=X</parm>
       <field action="define" tag="1">Isis_Key</field>
       <list action="delete">now</list>
       <loop>
         <list action="load" type="sort">
         <pft>,'^a',ref(['phl_tdo']val(v1*4),@tab_txt.pft,),'^b'v1*4/,</pft>
         </list>
       </loop>
     </do>
     <file action="close" type="database">phl_acv</file>

      <do task="list">
      <field action="define" tag="3026">Isis_Item</field>
      <loop>
        <field action="import" tag="list">3077</field>
        <field action="replace" tag="3077" split="occ"><pft>,(v3077/),v3026/,</pft></field>
        <field action="export" tag="3077">3077</field>
      </loop>
    </do>
    <list action="delete">now</list>

    <field action="delete" tag="3026">ALL</field>

    <field action="export" tag="3077">3077</field>

    </function>