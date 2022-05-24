<!-- Atualiza lista de tombos no catálogo -->
    
     <function name="008">
     
     <!-- Importa variáveis para uso da função -->
          <field action="import" tag="list">2000,3000,3004,4001,5000,7003</field>
                  
                  <file action="close" type="database">phl_acv</file>

                  <do task="update">
                    <parm name="db">phl_acv</parm>
                    <parm name="mfn"><pft>,v5000,</pft></parm>
                    <parm name="fst"><pft>,cat('phl_acv.fst'),</pft></parm>
                    <parm name="uctab"><pft>cat('uctab')</pft></parm>
                    <parm name="actab"><pft>cat('actab')</pft></parm>
                    <parm name="buffersize">90000</parm>
                    <parm name="expire">60</parm>
                    <parm name="lockid"><pft>,v3000^2,</pft></parm>
                    <field action="define" tag="1003">Isis_Status</field>
                    <field action="define" tag="1105">Isis_Lock</field>

                    <update>
                    <field action="import" tag="list">2000,3000/3004,4001</field>
         
                    <do task="search">
                      <parm name="db"><pft>,v1'_tbo',</pft></parm>
                      <parm name="expression"><pft>,'X'v2,</pft></parm>
                      <field action="define" tag="8001">Isis_Total</field>
                      <loop>
                      <field action="import" tag="list">8000</field>
                      <field action="add" tag="8000">
                      <pft>
                      "^a"v801,/* tombo */
                      "^b"v803,/* exemplar */
                      "^c"v819,/* forma de aquisicao */
                      "^d"v820,/* data da aquisicao */
                      "^e"v807,/* status da circulação */
                      "^f"v825,/* prazo excepcional */
                      '^m'mfn(1),/* mfn_tbo */
                      </pft>
                      </field>
                      <field action="replace" tag="8000" split="occ"><pft>,(v8000/),</pft></field>
                      <field action="export" tag="list">8000/8001</field>
                      </loop>
                    </do>
                    <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

                    <field action="replace" tag="7" split="occ"><pft>,(v8000/),</pft></field>
                    <field action="delete" tag="list">160,2000/8004</field>

                    <write>Unlock</write>
                    <field action="import" tag="list">2000,3000,3004,4001,7003</field>
                    <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zMOD|008.fnc'/,</pft></field>
                    <call name="log">now</call>
                    <call name="801">now</call>
                    
                    <display><htmlpft><pft>,ref(['tab_pft']1,'[pft]',v4,'[/pft]',),</pft></htmlpft></display>
                    <display><htmlpft><pft>,ref(['tab_fmx']198,v4),</pft></htmlpft></display>
                    
            <file action="close" type="database">phl_aut</file>
            <file action="close" type="database">phl_cnf</file>
            <file action="close" type="database">phl_cnt</file>
            <file action="close" type="database">phl_cur</file>
            <file action="close" type="database">phl_idm</file>
            <file action="close" type="database">phl_mec</file>
            <file action="close" type="database">phl_set</file>
            <file action="close" type="database">phl_spt</file>
            <file action="close" type="database">phl_acv_fmt</file>
            <file action="close" type="database">phl_voc</file>
            <file action="close" type="database"><pft>,v3000^1'_ser',</pft></file>
            <file action="close" type="database"><pft>,v3000^1'_tbo',</pft></file>
            <file action="close" type="database"><pft>,v3000^1'_emp',</pft></file>
            
                    <field action="add" tag="5000"><pft>,ref(['phl_tdo']val(v5),v350),</pft></field>
                    <display><htmlpft><pft>,@tab_dag.pft,</pft></htmlpft></display>

                   </update>

                 </do>

                 <file action="close" type="database">phl_acv</file>
                 
     </function>