<!-- Status do titulo
     04/05/2012 09:22:05  Substituido de subcampo "n" para subcampo "m" o campo de armazenagem do MFN do título para não conflitar com o 
     subcampo "n" do MFN da data de validade da reserva -->
     
     <function name="003">

<!-- Importa variaveis para uso da funcao -->
     <field action="import" tag="list">2,953,3000,4001,8000/8004</field>
     
<!-- Obtém código da unidade a qual o título pertence -->

     <field action="replace" tag="1">
       <pft>
         ,ref(['phl_acv']l(['phl_acv'],'TIT='v2),v1),
       </pft>
     </field>
     <file action="close" type="database">phl_acv</file>

<!-- Apresenta status do titulo -->

     <display><htmlpft><pft>,ref(['tab_fmx']11,v4),</pft></htmlpft></display>
     
 <!-- Gera lista com todos os exemplares do título -->

     <do task="search">
       <parm name="db"><pft>,v1'_tbo',</pft></parm>
       <parm name="expression"><pft>,'X'v2,</pft></parm>
       <field action="define" tag="1001">Isis_Current</field>
       <field action="define" tag="1002">Isis_Total</field>
       <loop>
         <field action="import" tag="list">1,4001</field>
         <display><htmlpft><pft>,ref(['tab_fmx']152,v4),</pft></htmlpft></display>
         <file action="close" type="database"><pft>,v1'_emp',</pft></file>
         <file action="close" type="database">phl_set</file>
       </loop>
     </do>
     <file action="close" type="database"><pft>,v1'_tbo',</pft></file>

<!-- Obtém reservas do título -->

     <do task="search">
       <parm name="db">phl_res</parm>
       <parm name="expression"><pft>,'TIT=',v2,</pft></parm>
       <loop>
         <field action="import" tag="2020">2020</field>
         <!-- 04/05/2012 09:22:29 --> <field action="add" tag="2020"><pft>,v930,'^g'mstname,'^m'mfn(1),</pft></field>
         <field action="replace" tag="2020" split="occ"><pft>,(v2020/),</pft></field>
         <field action="export" tag="list">2020</field>
       </loop>
       <field action="export" tag="2020">2020</field>
     </do>
     <file action="close" type="database">phl_res</file>
    
<!-- Atribui posição do usuário na lista de reservas -->

     <field action="add" tag="1213"><pft>,,('^z'f(iocc,0,0),v2020/),</pft></field>
     <field action="add" tag="930" split="occ"><pft>,(v1213/),</pft></field>

<!-- Apresenta lista se houver reservas para algum usuário -->
     <display><htmlpft><pft>,if v930^u<>'' then ref(['tab_fmx']129,v4),fi,</pft></htmlpft></display>
             
<!-- Apresenta links de voltar ou imprimir a lista -->
     <display><htmlpft><pft>,ref(['tab_fmx']51,v4),</pft></htmlpft></display>

</function>
