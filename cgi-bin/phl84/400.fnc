<!-- Obtém regras para o empréstimo
     26/07/2006 11:11:55 Revisado -->

     <function name="400">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">100,500,900,3000</field>

<!-- Verifica se existe regra específica de emprestimo -->

     <flow action="jump">
       <pft>,if npost(['phl_pqt'],v100^e'#'v500^b,)>0 then 'regra_especifica' else 'regra_padrao' fi,</pft>
     </flow>

     <file action="close" type="database">phl_pqt</file>
     <flow action="exit">1</flow>

     <label>regra_especifica</label>

     <!-- Obtem dados sobre prazos e quantidades
       ^a Prazo de emprestimo
       ^b Quantidade permitida
       ^c Penalidade
       ^d Tipo de pena
       ^e Prazo de empréstimo em dias úteis ou corridos
       ^f Forma de cálculo da penalidade no atraso da devolucao (dias úteis ou corridos)
       ^g renovar ou nao
        -->
     <field action="add" tag="400">
          <pft>,
            ref(['phl_pqt']l(['phl_pqt'],v100^e'#'v500^b),
            '^a'v673,
            '^b'v674,
            '^c'f(val(v676),0,2),
            '^d'v677,
            '^e'v678,
            '^f'v679,
            '^g'v680,
            ,)
          </pft>
        </field>
      <file action="close" type="database">phl_pqt</file>
      <flow action="jump">exporta_variavel</flow>

      <label>regra_padrao</label>
      
      <field action="add" tag="400">
        <pft>
         ,ref(['phl_set']l(['phl_set'],'ACV='v3000^1),'^a'v613,'^b'v614,'^c'v623,'^d'v622,'^eC','^fC',),
        </pft>
      </field>
      
<!-- Exporta variavel 400 para o script que chamou a função -->

     <label>exporta_variavel</label>
     <field action="export" tag="400">400</field>
     
</function>
