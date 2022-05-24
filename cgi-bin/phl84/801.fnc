<!-- Funcao que obtem dados do tombo
     14/04/2007 - Revisado -->
     
     <function name="801">
     
<!-- Importa variaveis para uso da funcao
       1 = codigo da biblioteca
       2 = codigo de identificacao do titulo -->

     <field action="import" tag="list">1,2</field>

<!-- Abre base de dados do tombo -->
     
<!-- Abre base de dados de tombo para coleta de dados -->

     <do task="search">
       <parm name="db"><pft>,v1'_tbo',</pft></parm>
       <parm name="expression"><pft>,'X'v2,</pft></parm>

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
             '^m'mfn(1),/* mfn do tombo */
            </pft>
         </field>

         <field action="replace" tag="8000" split="occ"><pft>,(v8000/),</pft></field>
         <field action="export" tag="8000">8000</field>

       </loop>
     </do>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8001 total de exemplares -->

     <field action="add" tag="8001"><pft>,f(npost([v1'_tbo'],'X'v2,),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8002 total de exemplares circulantes -->

     <field action="add" tag="8002"><pft>,f(npost([v1'_tbo'],v2'#1',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8003 total de exemplares não circulantes -->

     <field action="add" tag="8003"><pft>,f(npost([v1'_tbo'],v2'#2',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Armazena em 8004 total de exemplares indisponíveis -->

     <field action="add" tag="8004"><pft>,f(npost([v1'_tbo'],v2'#0',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

     <field action="export" tag="list">8000/8004</field>

</function>
