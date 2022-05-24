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

<table border="0" align="center">
<tr><td class="ti1"><b><xsl:value-of select="db/biblioteca"/></b></td></tr>
<tr><td class="ti2" align="center"><xsl:value-of select="db/cabecalho"/></td></tr>
</table>

<table border="0" width="100%" class="tx">
  <tr bgcolor="#D3D3D3">
  <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_dev"/></xsl:attribute><xsl:value-of select="db/devtxt"/></a></th>
  <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_tbo"/></xsl:attribute><xsl:value-of select="db/tbotxt"/></a></th>
  <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_cod"/></xsl:attribute>Cod</a></th>
  <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_usr"/></xsl:attribute><xsl:value-of select="db/usrtxt"/></a></th>
  <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_tit"/></xsl:attribute><xsl:value-of select="db/tittxt"/></a></th>
  </tr>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<tr>
<td width="10%" align="center"><xsl:value-of select="rel_emp_dev"/></td>
<td width="10%" align="center"><xsl:value-of select="rel_emp_tbo"/></td>
<td width="5%" align="center"><xsl:value-of select="rel_emp_cod"/></td>
<td width="35%" align="left"><a><xsl:attribute name="href">mailto:<xsl:value-of select="correio"/></xsl:attribute><xsl:value-of select="rel_emp_usr"/></a><br/><xsl:value-of select="fone"/></td>
<td width="35%" align="left"><xsl:value-of select="rel_emp_tit"/></td>
</tr>
</xsl:for-each>
</table>
<hr/>
<xsl:for-each select="db">
<center>
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
</center>
</xsl:for-each>

</body>
</html>

</xsl:template>
</xsl:stylesheet>
