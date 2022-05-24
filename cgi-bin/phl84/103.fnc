<!-- Totaliza multas do usuário -->

     <function name="103">

<!-- Importa variaveis para a funcao -->
     <field action="import" tag="list">951,3000,4001,7003</field>
 
 <!-- Verifica multas do usuário -->
      <do task="search">
        <parm name="db">phl_pen</parm>
        <parm name="expression"><pft>,'USR='v951,</pft></parm>
        <field action="define" tag="1022">Isis_Total</field>
        <loop>
          <list action="load" type="list">
            <pft>,v940^m,</pft>
          </list>
       </loop>
     </do>
     <file action="close" type="database">phl_pen</file>
         

 <!-- Totaliza multas -->

      <do task="list">
        <field action="define" tag="1001">Isis_Current</field>
        <field action="define" tag="1002">Isis_Itens</field>
        <field action="define" tag="743">Isis_Item</field>
        <display><pft>,putenv('multa=0'),</pft></display>
        <loop>
          <display><pft>,putenv('multa='f(val(v743)+val(getenv('multa')),0,2))</pft></display>
        </loop>
      </do>
      <field action="add" tag="743"><pft>,getenv('multa'),</pft></field>
      
<!-- Exporta variável 743 para o script que chamou a função -->
     <field action="export" tag="743">743</field>

</function>
