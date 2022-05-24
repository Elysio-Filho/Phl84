<!-- Funcao que obtem horários de funcionamento da biblioteca
     29/03/2007 - Revisado -->
     
     <function name="159">

<!-- Importa variaveis para uso da funcao -->

     <field action="import" tag="list">3000,7003</field>
     
          <!-- Carrega dados de configuração da biblioteca
             159^a horário de abertura do dia
             159^b horário de encerramento do dia -->

             <field action="add" tag="159">
             <pft>,
              ,ref(['phl_set']l(['phl_set'],'ACV='v3000^1),
              select v7003*16.1
              case '6' : v641
              elsecase v640
              endsel,
              )
             </pft>
             </field>
             <file action="close" type="database">phl_set</file>
             
<!-- Exporta variável para script que chamou a função -->
     <field action="export" tag="159">159</field>
     
</function>                  