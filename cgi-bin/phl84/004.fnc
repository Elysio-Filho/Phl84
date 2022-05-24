<!--  Lê o calendário a partir da data de devolução e contabiliza os dias úteis de atraso
      para efeito de cálculo de multas ou suspensões. 
      20/04/2006 07:20:57 - Inserção de comentários
      26/07/2006 14:52:51 - Revisado -->

     <function name="atraso">

<!-- Importa variáveis para uso da função 
      900 - dados do registro do empréstimo
     1022 - mfn do calendário correspondente a data de hoje
     3000 - registro de parametros da conexao -->

     <field action="import" tag="list">900,1022,3000,4001</field>
     
<!-- Verifica se existe atraso na data de devolução -->
     <flow action="jump">
       <pft>
         ,if val(v1022)>val(v900^n) then 'le_calendario' fi,
       </pft>
     </flow>
     <flow action="exit">1</flow>

<!-- Abre calendário a partir da data de devolução e carrega status da data 
     324 = 1 (dia útil)
     324 = 0 (feriado) -->
     
     <label>le_calendario</label>
     <do task="mfnrange">
       <parm name="db"><pft>,v3000^1'_cal'</pft></parm>
       <parm name="from"><pft>,v900^n,</pft></parm>
       <parm name="to"><pft>f((val(v1022)-1),0,0)</pft></parm>
       <loop>
         <list action="load" type="freq"><pft>,v324,</pft></list>
       </loop>
     </do>
     <file action="close" type="database"><pft>,v3000^1'_cal',</pft></file>

<!-- Carrega na variável #3 a quantidade de dias úteis de atraso -->
     <do task="list">
       <field action="define" tag="1">Isis_Item</field>
       <field action="define" tag="2">Isis_Value</field>
       <loop>
         <field action="add" tag="3"><pft>,if val(v1)=1 then v2 fi,</pft></field>
         <field action="export" tag="3">3</field>
      </loop>
     </do>
     <file action="close" type="database"><pft>,v3000^1'_cal',</pft></file>

<!-- Exporta a variável #3 para o script que chamou esta função -->
     <field action="export" tag="3">3</field>

</function>