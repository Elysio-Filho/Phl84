<!-- Funcao que obtem MFN da data de hoje
     29/03/2007 - Revisado -->
     
     <function name="200">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">953,7003</field>

     <field action="add" tag="1022">
       <pft>
          ,ref([v953'_cal']l([v953'_cal'],v7003.8,),mfn(1),),
       </pft>
     </field>
     <file action="close" type="database"><pft>,v953'_cal',</pft></file>
     
<!-- Exporta variavel para script que chamou a função -->
     <field action="export" tag="list">1022</field>
     
</function>
