<!-- Funcao que obtem dados do tombo para fins de emprestimo
     14/04/2007 - Revisado -->
     
     <function name="013">

<!-- Importa variaveis para uso da funcao
       1 = codigo da biblioteca
       2 = codigo de identificacao do titulo
     952 = numero do tombo -->
     <field action="import" tag="list">1,2,952</field>

<!-- Abre base de dados do tombo -->
     <do task="search">
       <parm name="db"><pft>,v1'_tbo',</pft></parm>
       <parm name="expression"><pft>,'TBO='v952,</pft></parm>
       <parm name="count">1</parm>
       <loop>
       <field action="add" tag="8000">
        <pft>
          "^a"v807,
          "^c"v803,
          "^d"v801,
          "^e"v825,
          '^m'mfn(1),
        </pft>
       </field>
       <field action="export" tag="8000">8000</field>
       </loop>  
       <field action="export" tag="8000">8000</field>
     </do>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8001 total de exemplares -->
     <field action="add" tag="8001"><pft>,f(npost([v1'_tbo'],'X'v2,),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8002 total de exemplares circulantes -->
     <field action="add" tag="8002"><pft>,f(npost([v1'_tbo'],v2'#1',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8003 total de exemplares de consulta local -->
     <field action="add" tag="8003"><pft>,f(npost([v1'_tbo'],v2'#2',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8004 total de exemplares indisponíveis -->
     <field action="add" tag="8004"><pft>,f(npost([v1'_tbo'],v2'#0',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

     <field action="export" tag="list">8000/8004</field>

</function>
