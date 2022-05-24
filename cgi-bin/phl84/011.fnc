<!-- Formulario de filtro de datas para relatorios
     18/09/2008 17:24:39 Revisado -->
     
     <function name="011">

<!-- Importa variaveis para funcao -->
     <field action="import" tag="list">950,956,3000,4001,</field>
     
     <display><htmlpft><pft>,ref(['tab_fmx']197,v4),</pft></htmlpft></display>

        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">ANO=0</parm>
        <parm name="to">ANO=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<tr align="center"><td>',ref(['tab_txt']9,@tab_txt.pft,),':<br>
        <select size="-1" name="ano">
        <option value="(ANO=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*4,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td>',</pft></display>
        
        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">MES=0</parm>
        <parm name="to">MES=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<td>',ref(['tab_txt']210,@tab_txt.pft,),':<br>
        <select size="-1" name="mes">
        <option value="(MES=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*4,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td>',</pft></display>

        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">DIA=0</parm>
        <parm name="to">DIA=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<td>',ref(['tab_txt']96,@tab_txt.pft,),':</br>
        <select size="-1" name="dia">
        <option value="(DIA=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*4,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td></tr></table>
        <center><br>
        <input class="botao" type="submit" value="'ref(['tab_txt']62,@tab_txt.pft,)'">
        </center></tr></table></form></body></html>',
        </pft></display>

</function>
