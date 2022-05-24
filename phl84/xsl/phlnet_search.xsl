<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>

  <style>
   .xx    {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px;}
   .xy    {background-color: #D3D3D3; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .link  {background-color: #D3D3D3; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .link:hover {COLOR: #FFFFFF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
   .foot {background-color: #FFFFFF; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .foot:hover {background-color: #FFFFFF; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; FONT-WEIGHT: bold; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
  </style>

<xsl:for-each select="db"><p class="xy">
<xsl:value-of select="total"/>: <xsl:value-of select="reg/hits"/><br/>
<b><xsl:value-of select="texto"/></b><a class="link"><xsl:attribute name="href"><xsl:value-of select="link_au"/>
</xsl:attribute> <xsl:value-of select="head_autor"/></a> |
<a class="link"><xsl:attribute name="href"><xsl:value-of select="link_ti"/>
</xsl:attribute><xsl:value-of select="head_titulo"/></a> |
<a class="link"><xsl:attribute name="href"><xsl:value-of select="link_data"/>
</xsl:attribute><xsl:value-of select="head_data"/></a> |
<a class="link"><xsl:attribute name="href"><xsl:value-of select="link_cla"/>
</xsl:attribute><xsl:value-of select="head_classe"/></a></p>
</xsl:for-each>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<hr/>
<table class="xx" border="0" width="100%">
<tr><td width="10%" align="center">
<xsl:value-of select="corrente"/>/<xsl:value-of select="hits"/><BR />
<a>
<xsl:attribute name="href">
<xsl:value-of select="exportacao"/>
</xsl:attribute>
[<b>PHL</b>]
</a>
</td><td width="90%">
<xsl:value-of select="chamada"/>
<xsl:value-of select="cutter"/>
<xsl:value-of select="volume"/><br/>
<xsl:value-of select="ref/a"/>
<b><xsl:value-of select="ref/b"/></b>
<b><xsl:value-of select="ref/r"/></b>
<xsl:value-of select="ref/c"/>
<xsl:value-of select="ref/d"/>
</td></tr></table>
</xsl:for-each>

<hr/>
<center>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_prim"/></xsl:attribute>Primeira | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_ante"/></xsl:attribute>Anterior | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_prox"/></xsl:attribute>Próxima | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_ulti"/></xsl:attribute>Última</a>
</center>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
