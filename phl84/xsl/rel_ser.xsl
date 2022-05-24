<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<body>

  <style>
   .ti1 {
	COLOR: #006699;
        FONT-FAMILY: Arial, Helvetica, sans-serif;
        FONT-SIZE: 14px;
        FONT-WEIGHT: bold;
        text-align: Center
        }
   .ti2 {
	COLOR: #006699;
        FONT-FAMILY: Arial, Helvetica, sans-serif;
        FONT-SIZE: 12px;
        text-align: Center
        }

   .tx    {
	COLOR: #006699;
        FONT-FAMILY: Arial, Helvetica, sans-serif;
        FONT-SIZE: 12px;
        }
   .link {
	COLOR: #0000FF;
        FONT-FAMILY: Arial, Helvetica, sans-serif;
        FONT-SIZE: 12px;
        LINE-HEIGHT: 12pt;
        TEXT-DECORATION: none}
        
   .link:hover {
	COLOR: #FFFFFF;
        FONT-FAMILY: Arial, Helvetica, sans-serif;
        FONT-SIZE: 12px;
        LINE-HEIGHT: 12pt;
        TEXT-DECORATION: none
        }
  </style>

<xsl:for-each select="db">
<table border="0" width="570" align="center">
<tr>
<td class="ti1"><xsl:value-of select="biblioteca"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="periodo"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="cabecalho"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="emissao"/></td></tr>
</table>

<table width="570" border="0" align="center">
  <tr bgcolor="#D3D3D3">
  <td width="50" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_num"/></xsl:attribute>ID</a></td>
  <td width="150" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_tit"/></xsl:attribute>Título</a></td>
  <td width="60" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_dtr"/></xsl:attribute>Ren. em:</a></td>
  <td width="80" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_dta"/></xsl:attribute>Data/Ass.</a></td>
  <td width="100" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_age"/></xsl:attribute>Agente</a></td>
  <td width="60" align="center" class="link">Valor</td>
  </tr></table>
</xsl:for-each>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<table border="0" align="center" width="570" class="tx">
<tr>
<td width="50" valign="top" align="center"><xsl:value-of select="rel_ser_num"/></td>
<td width="150" valign="top" align="left"><xsl:value-of select="rel_ser_tit"/></td>
<td width="60" valign="top" align="center"><xsl:value-of select="rel_ser_dtr"/></td>
<td width="80" valign="top" align="center"><xsl:value-of select="rel_ser_dta"/></td>
<td width="100" valign="top" align="left"><xsl:value-of select="rel_ser_age"/></td>
<td width="60" valign="top" align="right"><xsl:value-of select="rel_ser_val"/></td>
</tr></table>
</xsl:for-each>

<xsl:for-each select="db">
<table border="0" align="center" width="570" class="tx">
<tr><td align="center">
<a><xsl:attribute name="href">javascript:print()</xsl:attribute>
  <xsl:element name="img">
  <xsl:attribute name="src"><xsl:value-of select="imprimir"/></xsl:attribute>
  <xsl:attribute name="border">0</xsl:attribute>
  </xsl:element></a>
<a><xsl:attribute name="href">javascript:history.back();</xsl:attribute>
  <xsl:element name="img">
  <xsl:attribute name="src"><xsl:value-of select="voltar"/></xsl:attribute>
  <xsl:attribute name="border">0</xsl:attribute>
  </xsl:element></a>
</td></tr></table>
</xsl:for-each>

</body>
</html>

</xsl:template>
</xsl:stylesheet>
