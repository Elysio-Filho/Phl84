<!-- Verifica disponibilidade para o empréstimo -->

     <function name="800">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">1,2</field>
     
<!-- Armazena em 2002 total de exemplares circulantes -->

     <field action="replace" tag="2002"><pft>,f(npost([v1'_tbo'],v2'#1',),0,0),</pft></field>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Obtém quantidade de exemplares emprestados
     Todos os emprestados exceto os TOP=LOC (empréstimos de consulta local) -->
          
          <file action="close" type="database"><pft>,v1'_emp',</pft></file>
          <do task="search">
           <parm name="db"><pft>,v1'_emp'</pft></parm>
           <parm name="expression"><pft>,'TIT='v2'*(TOP=EMP+TOP=REN)',</pft></parm>
           <field action="define" tag="501">Isis_Total</field>

           <loop>

           </loop>

           <field action="export" tag="501">501</field>
          </do>
          <file action="close" type="database"><pft>,v1'_emp'</pft></file>

     <!-- Obtém quantidade de reservas -->

          <field action="replace" tag="502">
            <pft>,f(npost(['phl_res'],'TIT='v2,),0,0),</pft>
          </field>
          <file action="close" type="database">phl_res</file>

     <!-- Obtém quantidade disponível no acervo -->
          
          <field action="replace" tag="503">
            <pft>,f( val(v2002)-val(v501),0,0)</pft>
          </field>
         
     <!-- Obtém quantidade disponível para empréstimo -->

          <field action="replace" tag="5030">
            <pft>,f( val(v2002)-( val(v501)+val(v502) ),0,0)</pft>
          </field>
          
<!-- Exporta variável 5030 com quantidade disponível para empréstimo -->
     <field action="export" tag="list">502,503,5030</field>
          
</function>
