<!-- Obtem dados do cadastro do usuario
     11/02/2009 07:14:13 Revisado -->

     <function name="100">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">951,7003</field>

     <field action="add" tag="100">
          <pft>,
           ref(['phl_usr']l(['phl_usr'],'USR='v951,),
            "^a"v703,/* status */
            '^b',v704,if a(v704) then s(date).8 fi,/* validade da matrícula */
            "^c"v701,/* matricula */
            "^d"v702,/* senha */,
            "^e"v723,/* tipo de usuario */,
            "^f"v705,/* nome do usuário */,
            "^g"v713,/* curso */,
            "^x"v719,/* foto do usuário */,
            "^h"v720,/* departamento */,
            "^i"v710[1],/* fone */,
            "^m"v714[1],/* email */,
            "^n"v716,/* expressao de busca DSI */
            "^o"v724,/* alerta */
            '^k'mfn(1),
            )
          </pft>
        </field>
     <file action="close" type="database">phl_usr</file>
     
<!-- Exporta variável 100 para script que chamou a função -->
     
     <field action="export" tag="100">100</field>
     
</function>
