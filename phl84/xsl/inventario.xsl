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
    <tr><td class="ti1"><b><xsl:value-of select="lista/biblioteca"/></b></td></tr>
    <tr><td class="ti2"><xsl:value-of select="lista/cabecalho"/></td></tr>
    <tr><td class="ti2">Relatório emitido em: <xsl:value-of select="lista/data_emissao"/></td></tr>
  </table>

  <p class="ti2" align="center">
    <i><u>Nota</u>:  </i>
    <i>Clicando sobre o nome de cada coluna é possível alterar a ordem de seus elementos.</i>
  </p>

    <table border="1" width="100%" cellspacing="0" cellpadding="5" class="tx">
      <tr bgcolor="#D3D3D3">
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="lista/link_c1"/></xsl:attribute><xsl:value-of select="lista/c1txt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="lista/link_c2"/></xsl:attribute><xsl:value-of select="lista/c2txt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="lista/link_c3"/></xsl:attribute><xsl:value-of select="lista/c3txt"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="lista/link_c4"/></xsl:attribute><xsl:value-of select="lista/c4txt"/></a></th>
     </tr>

      <xsl:for-each select="lista/registro">
      <xsl:sort select="ordem" />
      <tr>
        <td width="5%" align="left"><xsl:value-of select="status"/></td>
        <td width="30%" align="left"><xsl:value-of select="chamada"/></td>
        <td width="60%" align="left"><xsl:value-of select="titulo"/></td>
        <td width="5%" align="left"><xsl:value-of select="tombo"/></td>
      </tr>
      </xsl:for-each>
    </table>
    
    <br />
    <center>
    <a class="link"><xsl:attribute name="href">javascript:print()</xsl:attribute>Imprimir</a><br/>
    </center>

  </body>
  </html>
  
</xsl:template>
</xsl:stylesheet>
