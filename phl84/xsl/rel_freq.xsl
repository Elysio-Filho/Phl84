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

    <table border="1" cellpadding="2" cellspacing="0" width="100%" class="xx">
      <tr bgcolor="#D3D3D3">
        <td width="50%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="dados/link_chave"/></xsl:attribute>Chave</a></td>
        <td width="50%" align="center"><a class="link"><xsl:attribute name="href"><xsl:value-of select="dados/link_post"/></xsl:attribute>Quantidade</a></td>
      </tr>
      
      <xsl:for-each select="dados/reg">
      <xsl:sort select="ordem" />
      <tr>
        <td width="50%" align="right"><xsl:value-of select="chave"/></td>
        <td width="50%" align="left"><xsl:value-of select="post"/></td>
      </tr>
      </xsl:for-each>
    </table>

    <font class="xx"><b><xsl:value-of select="dados/total"/></b></font>
    
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
