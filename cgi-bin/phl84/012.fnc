<!-- Debitos pendente do usuario
     14/04/2007 - Revisado -->

     <function name="012">

<!-- Importa variaveis que serao utilizadas pela funcao -->
     <field action="import" tag="list">951,3000,4001</field>
     
<!-- Abre base de dados de penalidades -->
     <do task="search">
       <parm name="db">phl_pen</parm>
       <parm name="expression"><pft>,'USR='v951,</pft></parm>

       <loop>
        <field action="import" tag="list">110,111</field>
        <field action="replace" tag="110"><pft>,f(val(v940^m)+val(v110),0,2),</pft></field>
        <field action="replace" tag="111"><pft>,if val(v940^p)>val(v111) then v940^p else v111 fi,</pft></field>
        <field action="export" tag="list">110,111</field>
       </loop>
       <field action="export" tag="list">110,111</field>
    </do>
    <file action="close" type="database">phl_pen</file>

<!-- Exporta variaveis que serao utilizadas pelo script que chamou a funcao -->
     <field action="export" tag="list">110,111</field>

</function>
