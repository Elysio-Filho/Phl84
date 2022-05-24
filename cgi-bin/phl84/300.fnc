<!-- Obtem dados do regulamento para o tipo de usuário
     14/04/2007 - Revisado -->

     <function name="300">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">100</field>

<!-- Obtem dados do regulamento -->
     
     <field action="add" tag="300">
       <pft>,ref(['phl_rgl']val(v100^e),
             '^a'v550,/* Não renovar se usuário estiver com cadastro vencido*/
             '^b'v551,/* Não renovar se usuário estiver suspenso*/
             '^c'v552,/* Não renovar se existir reserva para outro usuário*/
             '^d'v553,/* Não renovar se prazo estiver expirado*/
             '^e'v554,/* Não renovar se usuário tiver penalidades*/
             '^f'v555,/* Não renovar se usuário tiver outros objetos atrasados*/
             '^g'v528,/* Limite de renovações*/
             '^h'v520,/* Não emprestar se usuário estiver com cadastro vencido*/
             '^i'v521,/* Não emprestar se usuário tiver objetos atrasados*/
             '^j'v522,/* Não emprestar se usuário estiver suspenso*/
             '^k'v523,/* Não emprestar se usuário tiver débitos ou penalidade*/
             '^l'v524,/* Não emprestar se houver reserva para outro usuário*/
             '^m'v525,/* Não emprestar se limite foi ultrapassado*/
             '^n'v526,/* Não emprestar mais que um exemplar para um mesmo usuário*/
             '^o'v527,/* Limite de objetos*/
             '^p'v529,/* Não solicitar senha do usuário*/
             '^q'v530,/* Não permitir que usuário suspenso efetue reservas*/
             '^r'v531,/* Não permitir que usuário com débitos efetue reservas*/
             '^s'v532,/* Não permitir que usuário com cadastro vencido efetue reservas*/
             '^t'v533,/* Não permitir que usuário com atrasos efetue reservas*/
             '^u'v534,/* Não permitir que usuário reserve um título que está em seu poder*/
             '^v'v535,/* Não permitir que usuário efetue várias reservas do mesmo título*/
             '^w'v536,/* Não permitir reservas para títulos disponíveis*/
             '^x'v538,"999"n538,/* Limite de reservas*/
             '^y'v537,

             )
       </pft>
     </field>
     
<!-- Exporta variável 300 para o script que chamou a função -->
     <field action="export" tag="300">300</field>
     
</function>
