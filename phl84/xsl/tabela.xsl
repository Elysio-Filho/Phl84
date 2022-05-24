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

    <table border="0" width="100%" class="xx">
      <tr bgcolor="#D3D3D3">
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="catalog/link_cl"/></xsl:attribute><xsl:value-of select="catalog/head_chamada"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="catalog/link_au"/></xsl:attribute><xsl:value-of select="catalog/head_autor"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="catalog/link_ti"/></xsl:attribute><xsl:value-of select="catalog/head_titulo"/></a></th>
        <th><a class="link"><xsl:attribute name="href"><xsl:value-of select="catalog/link_dt"/></xsl:attribute><xsl:value-of select="catalog/head_data"/></a></th>
      </tr>
      <xsl:for-each select="catalog/cd">
      <xsl:sort select="ordem" />
      <tr>
        <td width="20%"><xsl:value-of select="chamada"/></td>
        <td width="30%"><xsl:value-of select="autor"/></td>
        <td width="40%"><xsl:value-of select="titulo"/></td>
        <td width="10%"><xsl:value-of select="data"/></td>
      </tr>
      </xsl:for-each>
    </table>
    
<hr/>
<center>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="catalog/link_prim"/></xsl:attribute><xsl:value-of select="catalog/foot_primeira"/> | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="catalog/link_ante"/></xsl:attribute><xsl:value-of select="catalog/foot_anterior"/> | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="catalog/link_prox"/></xsl:attribute><xsl:value-of select="catalog/foot_proxima"/> | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="catalog/link_ulti"/></xsl:attribute><xsl:value-of select="catalog/foot_ultima"/></a>
</center>

  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
