<!-- Gera arquivo temporário
     04/11/2010 15:51:28 
     22/09/2011 11:37:43 Eliminada a opção de cookie 
     28/12/2011 10:37:50 Incluido opcao de cookie utilizada pelo formato FRBR 
     28/03/2014 11:15:50 Incluido rotina de geracao de indice para a base de dados de acessos (phl_idx)
     -->

     <function name="010">

     <!-- Importa variaveis para uso da funcao -->
          <field action="import" tag="list">3000,3003</field>
          
          <!--
          ^a - idioma
          ^b - cipar
          ^c - copyright
          ^d - data da conexao
          ^e - REMOTE_ADDR
          ^f - SERVER_SOFTWARE
          ^g - SERVER_PORT
          ^h - REQUEST_METHOD
          ^i - PATH_INFO
          ^j - PATH_TRANSLATED
          ^k - SCRIPT_NAME
          ^l - REMOTE_HOST
          ^1 - biblioteca do funcionário
          ^2 - matricula do usuário ou login do funcionário
          ^3 - status
          ^4 - MFN: phl_pwd
          ^5 - senha do usuário
          ^6 - SERVER_NAME
          ^7 - Registro da biblioteca
          -->

      <file action="close" type="database">phl_idx</file>
      
      <display><pft>'<script>document.cookie = "phl=^m'mfn'^c'v3000^b'";</script>'</pft></display>

      <do task="update">
       <parm name="db">phl_idx</parm>
       <parm name="mfn">New</parm>
       <parm name="fst"><pft>,cat('phl_idx.fst'),</pft></parm>
       
       <parm name="uctab"><pft>cat('uctab')</pft></parm>
       <parm name="actab"><pft>cat('actab')</pft></parm>

       <field action="define" tag="1003">Isis_Status</field>
       <update>
         <field action="import" tag="list">3000,3003</field>
         <field action="replace" tag="3000">
         <pft>,
         '^a',v3000^a,
         '^b',v3000^b,
         '^c',v3000^c,
         '^d',v3000^d,
         '^e',v3000^e,
         '^f',getenv('SERVER_SOFTWARE'),
         '^g',getenv('SERVER_PORT'),
         '^h',getenv('REQUEST_METHOD'),
         '^i',getenv('PATH_INFO'),
         '^j',getenv('PATH_TRANSLATED'),
         '^k',getenv('SCRIPT_NAME'),
         '^l',getenv('REMOTE_HOST'),
              v3003,
         '^6'getenv('SERVER_NAME')
         '^7'ref(['phl_set']l(['phl_set']'ACV='v3003^1),v638)
         </pft>
         </field>
         <field action="export" tag="list">3000</field>
         <field action="delete" tag="list">3003</field>
         <write>Unlock</write>
         <field action="import" tag="list">2000,3000,3004,4001,7003</field>
         <field action="replace" tag="3000"><pft>,v3000,'^w'v1003,'^x'mstname,'^y'mfn,'^zNEW|010.fnc'/,</pft></field>
         <call name="log">now</call>
         
         <!-- Armazena dados da sessao corrente em tempfile do servidor -->
              <file action="create" type="tempfile">4001</file>
              <file action="append" type="output"><pft>,v4001,</pft></file>
              <display><pft>,'^m'mfn'^c'v3000^b,</pft></display>
              <file action="close" type="output"><pft>,v4001,</pft></file>
              <field action="export" tag="list">4001</field>

       </update>
     </do>
          
     <!-- Exporta variável 3000 para uso do script -->
          <field action="export" tag="list">3000,4001</field>

</function>