<?xml version="1.0" encoding="ISO-8859-1"?>
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
  </table>
  
  <p class="ti2" align="center">
    <i><u>Nota</u>:  </i>
    <i>Clicando sobre o nome de cada coluna é possível alterar a ordem de seus elementos.</i>
  </p>

    <table border="1" width="100%" cellspacing="0" cellpadding="5" class="tx">
      <tr bgcolor="#D3D3D3">
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_c1"/></xsl:attribute><xsl:value-of select="db/c1txt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_qtd"/></xsl:attribute><xsl:value-of select="db/qtdtxt"/></a></th>
     </tr>

      <xsl:for-each select="db/mfn">
      <xsl:sort select="ordem" />
      <tr>
        <td width="90%" align="left"><xsl:value-of select="c1"/></td>
        <td width="10%" align="right"><xsl:value-of select="qtd"/></td>
      </tr>
      </xsl:for-each>
    </table>
    
    <table border="1" width="100%" cellspacing="0" cellpadding="5" class="tx">
      <tr bgcolor="#D3D3D3">
        <td width="90%" align="left"><b>Total</b></td>
        <td width="10%" align="right"><b><xsl:value-of select="db/tot" /></b></td>
      </tr>
    </table>

    <br />
    <center>
    <a class="link"><xsl:attribute name="href">javascript:print()</xsl:attribute>Imprimir</a><br/>
    <a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_anterior"/></xsl:attribute>Voltar para menu de opções</a>
    </center>
    
  </body>
  </html>
  
</xsl:template>
</xsl:stylesheet>
