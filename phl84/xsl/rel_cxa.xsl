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
<table border="0" align="center">
<tr><td class="ti1"><xsl:value-of select="biblioteca"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="periodo"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="cabecalho"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="emissao"/></td></tr>
</table>

<table border="0" width="100%">
  <tr bgcolor="#D3D3D3">
  <td width="10%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_dta"/></xsl:attribute><xsl:value-of select="dtatxt"/></a></td>
  <td width="10%" align="center" class="link"><xsl:value-of select="multxt"/></td>
  <td width="10%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_tbo"/></xsl:attribute><xsl:value-of select="tbotxt"/></a></td>
  <td width="10%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_mat"/></xsl:attribute><xsl:value-of select="mattxt"/></a></td>
  <td width="50%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_usr"/></xsl:attribute><xsl:value-of select="usrtxt"/></a></td>
  <td width="10%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_bib"/></xsl:attribute><xsl:value-of select="bibtxt"/></a></td>
  </tr></table>
</xsl:for-each>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<table border="0" width="100%" class="tx">
<tr>
<td width="10%" align="center"><xsl:value-of select="rel_cxa_dta"/></td>
<td width="10%" align="center"><xsl:value-of select="rel_cxa_mul"/></td>
<td width="10%" align="center"><xsl:value-of select="rel_cxa_tbo"/></td>
<td width="10%" align="center"><xsl:value-of select="rel_cxa_mat"/></td>
<td width="50%" align="left"><xsl:value-of select="rel_cxa_usr"/></td>
<td width="10%" align="center"><xsl:value-of select="rel_cxa_bib"/></td>

</tr></table>
</xsl:for-each>

<hr/>
<xsl:for-each select="db">
<center>
<center><p class="tx"><b>Total:</b> R$<xsl:value-of select="rel_cxa_tot"/></p></center>
<a class="link"><xsl:attribute name="href">javascript:print()</xsl:attribute>Imprimir | </a>
<a class="link"><xsl:attribute name="href">javascript:history.back();</xsl:attribute>Voltar</a>
</center>
</xsl:for-each>


</body>
</html>

</xsl:template>
</xsl:stylesheet>
