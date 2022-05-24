<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>
  <style>
   .ti1 {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 14px; FONT-WEIGHT: bold; text-align: Center; TEXT-DECORATION: none}
   .ti2 {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; text-align: Center; TEXT-DECORATION: none}
   .tx  {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; TEXT-DECORATION: none}
   .link {COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
   .link:hover {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
  </style>

  <table border="0" align="center">
    <tr><td class="ti1"><b><xsl:value-of select="db/biblioteca"/></b></td></tr>
    <tr><td class="ti2"><xsl:value-of select="db/cabecalho"/></td></tr>
    <tr><td class="ti2">Relatório emitido em: <xsl:value-of select="db/data_emissao"/></td></tr>
    <tr><td class="ti2">Período considerado: <xsl:value-of select="db/conjunto_ano"/> * <xsl:value-of select="db/conjunto_mes"/> * <xsl:value-of select="db/conjunto_dia"/></td></tr>
    <tr>
      <td class="ti2"><u><xsl:value-of select="db/legenda"/></u>:
        <xsl:element name="img">
          <xsl:attribute name="src">
            <xsl:value-of select="db/bol_red"/>
          </xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
        </xsl:element> -- <xsl:value-of select="db/vencido"/> |
        <xsl:element name="img">
         <xsl:attribute name="src">
           <xsl:value-of select="db/bol_green"/>
         </xsl:attribute>
         <xsl:attribute name="border">0</xsl:attribute>
        </xsl:element> -- <xsl:value-of select="db/no_prazo"/>
      </td>
    </tr>
  </table>

  <br/>
    <table border="1" width="100%" cellspacing="0" cellpadding="5" class="tx">
      <tr bgcolor="#D3D3D3">
        <th><a class="link">ST</a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_emp"/></xsl:attribute><xsl:value-of select="db/emptxt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_dev"/></xsl:attribute><xsl:value-of select="db/devtxt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_tus"/></xsl:attribute>Usuário</a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_mat"/></xsl:attribute><xsl:value-of select="db/mattxt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_usr"/></xsl:attribute><xsl:value-of select="db/usrtxt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_cod"/></xsl:attribute>Objeto</a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_tbo"/></xsl:attribute><xsl:value-of select="db/tbotxt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_tit"/></xsl:attribute><xsl:value-of select="db/tittxt"/></a></th>
      </tr>

      <xsl:for-each select="db/mfn">
      <xsl:sort select="ordem" />
      <tr>
        <td width="3%" align="center"><xsl:element name="img"><xsl:attribute name="src"><xsl:value-of select="status"/></xsl:attribute><xsl:attribute name="border">0</xsl:attribute></xsl:element></td>
        <td width="5%" align="center"><xsl:value-of select="data_emprestimo"/></td>
        <td width="5%" align="center"><xsl:value-of select="data_devolucao"/></td>
        <td width="5%" align="center"><xsl:value-of select="tipo_usuario"/></td>
        <td width="5%" align="center"><xsl:value-of select="matricula_usuario"/></td>
        
        <xsl:if test="email_atraso">
          <td width="22%"><a class="link"><xsl:attribute name="href">mailto:<xsl:value-of select="email_atraso"/></xsl:attribute><xsl:value-of select="nome_usuario_mail"/></a></td>
        </xsl:if>
        
        <xsl:if test="email_alerta">
          <td width="22%">
            <a class="link"><xsl:attribute name="href">mailto:<xsl:value-of select="email_alerta"/></xsl:attribute><xsl:value-of select="nome_usuario_mail"/></a>
          </td>
        </xsl:if>
        
        <xsl:if test="nome_usuario">
          <td width="22%"><xsl:value-of select="nome_usuario"/></td>
        </xsl:if>

        <td width="5%" align="center"><xsl:value-of select="tipo_objeto"/></td>
        <td width="5%" align="center"><xsl:value-of select="tombo_emprestado"/></td>
        <td width="45%"><xsl:value-of select="titulo_emprestado"/></td>
      </tr>
      </xsl:for-each>
    </table>
    <br />
    <center>
    <a class="link"><xsl:attribute name="href">javascript:print()</xsl:attribute>Imprimir</a>
    <a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_anterior"/></xsl:attribute> -------- Voltar para menu de opções</a>
    <xsl:if test="db/link_data_emprestimo">
    <a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_data_emprestimo"/></xsl:attribute> -------- Novo filtro por data do empréstimo</a>
    </xsl:if>
    <xsl:if test="db/link_data_devolucao">
    <a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_data_devolucao"/></xsl:attribute> -------- Novo filtro por data de devolução</a>
    </xsl:if>
    
    </center>

  </body>
  </html>
  
</xsl:template>
</xsl:stylesheet>
