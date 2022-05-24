<!-- Armazena variaveis do cliente
     31/12/2011 08:53:59 Incluida rotina que verifica prazo de conexao quando PHL estiver em ambiente WWW, ou seja, IP<>127.0.0.1 [Elysio]
     31/12/2011 08:59:00 Alterado prazo padrao de 1 minuto para 4 horas [Elysio] 
     05/03/2013 10:32:31 Incluido limitação de 2 minutos na conexão de usuários
     -->

     <function name="001">
     
<!-- Importa nome do arquivo temporario quando houver   -->
     <field action="cgi" tag="4001">tmp</field>
     <field action="replace" tag="4001"><pft>,replace(v4001,'\','/'),</pft></field>

     <!--
     <field action="add" tag="3009"><pft>,getenv('HTTP_COOKIE'),</pft></field>
     <field action="replace" tag="3009" split="occ"><pft>,replace(v3009,'; ',s('',#)),</pft></field>
     <field action="replace" tag="3009" split="occ"><pft>,(if v3009.4='phl=' then v3009*4 fi,),</pft></field>
     -->

<!-- funcao que armazena os dados da sessao corrente em tempfile -->
     <field action="add" tag="3009"><pft>,cat(v4001),</pft></field>
     
     <parm name="cipar"><pft>,cat(v3009^c),</pft></parm>
     <field action="add" tag="3000"><pft>,ref(['phl_idx']val(v3009^m),v3000)</pft></field>
     <display><pft>,putenv('cod.idioma='v3000^a),</pft></display>

<!-- 22/09/2011 08:48:13 verifica se o prazo de conexão expirou
      -->

      <!-- Define o tempo de conexão para usuário, em 120 minutos e o tempo para funcionários de acordo com o conteúdo da variável #219 da base de dados de configuração do sistema -->
      <field action="add" tag="9191">
        <pft>,
          if v3000^3='usuario' then '120' else
          ,ref(['phl_cnf']1,if val(v219)<1 then '240' else v219 fi),
          ,fi
        </pft>
      </field>

      <field action="add" tag="9192"><pft>,getenv('REMOTE_ADDR'),</pft></field>
<!--      
      <flow action="jump">
      <pft>,if v9192<>'127.0.0.1' then 'verifica_prazo_conexao' else 'no_prazo' fi,</pft>
      </flow>
      <flow action="exit">0</flow>
-->      
      <!-- habilitar para não ter verificação de tempo de conexão 
           <flow action="jump">no_prazo</flow> -->

      <!-- Desabilitar aqui para eliminar verificação -->
<!--
      <flow action="jump">
      <pft>
         e1:=seconds(v3000^d)/60
         e2:=seconds(date)/60
         ,if s(v9192)=s(v3000^e) then
          ,if (e2-e1)<=val(v9191) then 'no_prazo' else 'prazo_expirado' fi,
            else 'prazo_expirado' 
          fi,
      </pft>
      </flow>
      <flow action="exit">1</flow>
--> 
      <!-- até aqui -->
<!--      
      <label>prazo_expirado</label>
      <display>
       <pft>
        '<center>
         <hr>
         O tempo de sua sessão expirou!<br>
         Feche seu navegador e inicie uma nova sessão.<br>
         A limitação do tempo de sua sessão é uma medida de segurança do PHL.<br>
         Para ampliar este limite, altere o valor registrado no campo #219 da tabela de configuração do sistema.
         <hr>
        </center>
       </pft>
      </display>
      <flow action="exit">1</flow>
-->      

     <label>no_prazo</label>
<!-- 26/10/2008 16:51:20 
     funcao que define ano,mes,dia e hora com base no fuso horario do servidor  
  -->
     <field action="replace" tag="7003">
       <pft>,
        select ref(['phl_set']val(v3000^1),v644)
         case '-9':,datex(seconds(date)-(9*3600)),
         case '-8':,datex(seconds(date)-(8*3600)),
         case '-7':,datex(seconds(date)-(7*3600)),
         case '-6':,datex(seconds(date)-(6*3600)),
         case '-5':,datex(seconds(date)-(5*3600)),
         case '-4':,datex(seconds(date)-(4*3600)),
         case '-3':,datex(seconds(date)-(3*3600)),
         case '-2':,datex(seconds(date)-(2*3600)),
         case '-1':,datex(seconds(date)-3600),
         case '+0':,s(date),
         case '+1':,datex(seconds(date)+3600),
         case '+2':,datex(seconds(date)+(2*3600)),
         case '+3':,datex(seconds(date)+(3*3600)),
         case '+4':,datex(seconds(date)+(4*3600)),
         case '+5':,datex(seconds(date)+(5*3600)),
         case '+6':,datex(seconds(date)+(6*3600)),
         case '+7':,datex(seconds(date)+(7*3600)),
         case '+8':,datex(seconds(date)+(8*3600)),
         case '+9':,datex(seconds(date)+(9*3600)),
         case '+10':,datex(seconds(date)+(10*3600)),
         case '+11':,datex(seconds(date)+(11*3600)),
         case '+12':,datex(seconds(date)+(12*3600)),
         case '+13':,datex(seconds(date)+(13*3600)),
         case '+14':,datex(seconds(date)+(14*3600)),
         case '+15':,datex(seconds(date)+(15*3600)),
         elsecase s(date),
        endsel,
       </pft>
     </field>
     

     
<!-- Exporta variáveis para o script que chamou a funcao -->
     <field action="export" tag="list">3000,4001,7003</field>

     </function>
