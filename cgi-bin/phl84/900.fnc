<!-- Obtem do registro de empréstimo
     26/07/2006 11:11:55 Revisado -->

     <function name="900">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">953,957</field>

<!-- Carrega no campo 900 do registro CGI, informacoes do registro de
     emprestimo
                ^a - Número de identificação
                ^t - Tombo emprestado
                ^u - Usuário
                ^c - tipo de usuário
                ^e - tipo de objeto
                ^z - mfn
                ^r - renovações -->

     <field action="add" tag="900">
      <pft>
        ,ref([v953'_emp']val(v957),v900,'^z',mfn(1)),
      </pft>
     </field>

     <file action="close" type="database"><pft>,v953'_emp',</pft></file>
     
<!-- Exporta conteúdo da variavel 900 para o script que chamou a funcao -->
     <field action="export" tag="900">900</field>
     
</function>
          