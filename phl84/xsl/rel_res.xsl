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
<tr>
<td class="ti1"><xsl:value-of select="biblioteca"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="periodo"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="cabecalho"/></td></tr>
<tr><td class="ti2"><xsl:value-of select="emissao"/></td></tr>
</table>

<table border="0" width="100%">
  <tr bgcolor="#D3D3D3">
  <td width="5%" class="link"></td>
  <td width="10%"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_dta"/></xsl:attribute><xsl:value-of select="dtatxt"/></a></td>
  <td width="30%"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_usr"/></xsl:attribute><xsl:value-of select="usrtxt"/></a></td>
  <td width="40%"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_tit"/></xsl:attribute><xsl:value-of select="tittxt"/></a></td>
  <td width="15%"><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_cla"/></xsl:attribute><xsl:value-of select="clatxt"/></a></td>
  </tr></table>
</xsl:for-each>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<table border="0" width="100%" class="tx">
  <tr>
    <td width="5%" valign="top" align="center">
      <xsl:element name="img">
        <xsl:attribute name="src">
          <xsl:value-of select="rel_res_sta"/>
        </xsl:attribute>
        <xsl:attribute name="border">0</xsl:attribute>
     </xsl:element>
  </td>
  <td width="10%" valign="top" align="center">
    <xsl:value-of select="rel_res_dta"/>
  </td>
  <td width="30%" valign="top" align="left">
    
    <xsl:if test="disponivel">
    <a>
      <xsl:attribute name="href">mailto:<xsl:value-of select="disponivel"/></xsl:attribute>
      <xsl:value-of select="rel_res_usr"/>
    </a>
    </xsl:if>
    
    <xsl:if test="indisponivel">
      <xsl:value-of select="indisponivel"/>
    </xsl:if>

    <br/>
    <xsl:value-of select="rel_res_tel"/>
  </td>
  <td width="40%" valign="top" align="left"><xsl:value-of select="rel_res_tit"/></td>
  <td width="15%" valign="top" align="left"><xsl:value-of select="rel_res_cla"/></td>
  </tr></table>
</xsl:for-each>

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
