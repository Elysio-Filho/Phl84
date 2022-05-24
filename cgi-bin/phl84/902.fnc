<!-- Formulario de filtro de datas para relatorios de empréstimos
     14/04/2007 - Revisado -->
     
     <function name="902">

<!-- Importa variaveis para funcao -->
     <field action="import" tag="list">950,956,3000,4001</field>
     
     <display><htmlpft><pft>,ref(['tab_fmx']204,v4),</pft></htmlpft></display>

        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">DTVANO=0</parm>
        <parm name="to">DTVANO=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<tr align="center"><td>',ref(['tab_txt']9,@tab_txt.pft,),':<br>
        <select size="-1" name="ano">
        <option value="(DTVANO=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*7,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td>',</pft></display>
        
        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">DTVMES=0</parm>
        <parm name="to">DTVMES=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<td>',ref(['tab_txt']210,@tab_txt.pft,),':<br>
        <select size="-1" name="mes">
        <option value="(DTVMES=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*7,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td>',</pft></display>

        <do task="keyrange">
        <parm name="db"><pft>,v956,</pft></parm>
        <parm name="from">DTVDIA=0</parm>
        <parm name="to">DTVDIA=Z</parm>
        <field action="define" tag="1">Isis_Key</field>
        <display><pft>'<td>',ref(['tab_txt']96,@tab_txt.pft,),':</br>
        <select size="-1" name="dia">
        <option value="(DTVDIA=$)">',ref(['tab_txt']366,@tab_txt.pft,),'</option>'</pft></display>
        <loop>
          <display><pft>,'<option value="',v1,'">',v1*7,'</option>',</pft></display>
        </loop>
        </do>
        <display><pft>,'</select></td></tr></table>

        <center><br>
        <input class="botao" type="submit" value="Confirmar">
        </center></tr></table></form></body></html>',
        </pft></display>

</function>
