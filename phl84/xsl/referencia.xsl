<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>

  <style>
   .xx    {COLOR: #006699; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px;}
   .xy    {FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .link  {background-color: #D3D3D3; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .link:hover {COLOR: #FFFFFF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
   .foot {background-color: #FFFFFF; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; LINE-HEIGHT: 12pt; text-align: Center; TEXT-DECORATION: none}
   .foot:hover {background-color: #FFFFFF; COLOR: #0000FF; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-SIZE: 12px; FONT-WEIGHT: bold; LINE-HEIGHT: 12pt; TEXT-DECORATION: none}
   table {font-family:Arial, Helvetica, sans-serif; width:100%; color:#006699; font-size: 12px;}
   th {color:#006699; background-color:#CEDFEF;}
   a {color:#0000CD; text-decoration:none;}
   a:hover {color:#FFD700; background-color:#6487DC; text-decoration:none;}
  .botao {background-color:#CEDFEF; font-weight:bold; font-size:12px; padding:2px; margin-top:10px; color:#006699;}
  </style>
  
<xsl:for-each select="db"><p class="xy">

<form action="/cgi-bin/wxis.exe" method="POST" target="result">
 <input type="hidden">
   <xsl:attribute name="name">IsisScript</xsl:attribute>
   <xsl:attribute name="value">phl84/003.xis</xsl:attribute>
 </input>
 
 <input type="hidden">
   <xsl:attribute name="name">tmp</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tmp" /></xsl:attribute>
 </input>
 
 <input type="hidden">
   <xsl:attribute name="name">opc</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="opc" /></xsl:attribute>
 </input>
 
 <input type="hidden">
   <xsl:attribute name="name">acv</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="acv" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">col</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="col" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">tag</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tag" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">pft</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="pft" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">rpp</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="rpp" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">idm</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="idm" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">tip</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tip" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">spt</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="spt" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">cnt</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="cnt" /></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">stf</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="stf" /></xsl:attribute>
 </input>
 
<table>
  <xsl:attribute name="width">100%</xsl:attribute>
  <xsl:attribute name="align">center</xsl:attribute>
  <xsl:attribute name="bgcolor"><xsl:value-of select="bgcolor" /></xsl:attribute>
  <tr>
    <td width="70%" align="center">
    
    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">and</xsl:attribute>
      <xsl:if test="bool = 'and'"><xsl:attribute name="checked" /></xsl:if>
    </input>
    <xsl:value-of select="opc1" />

    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">or</xsl:attribute>
      <xsl:if test="bool = 'or'"><xsl:attribute name="checked" /></xsl:if>
    </input>
    <xsl:value-of select="opc2" />

    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">exp</xsl:attribute>
      <xsl:if test="bool = 'exp'"><xsl:attribute name="checked" /></xsl:if>
    </input>
    <xsl:value-of select="opc3" />

    <br/>
    
    <input type="text">
     <xsl:attribute name="size">60</xsl:attribute>
     <xsl:attribute name="name">exp</xsl:attribute>
     <xsl:attribute name="value"><xsl:value-of select="exp" /></xsl:attribute>
    </input>

    <input type="submit" class="botao">
      <xsl:attribute name="value">
        <xsl:value-of select="submit" />
      </xsl:attribute>
    </input>
    </td>
    <td width="30%" align="center">

    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="link_filtro" />
      </xsl:attribute>
      <b>* <xsl:value-of select="filtro" /></b>
    </a><br/>

    </td>
  </tr>
  <tr><td></td><td> </td></tr>
</table>
</form>

<xsl:value-of select="total"/>: <xsl:value-of select="reg/hits" /><br/>
<b><xsl:value-of select="texto"/></b>

<a>
  <xsl:attribute name="href">
    <xsl:value-of select="link_au" />
  </xsl:attribute>
  <xsl:value-of select="head_autor" />
</a> |
<a><xsl:attribute name="href"><xsl:value-of select="link_ti" />
</xsl:attribute><xsl:value-of select="head_titulo"/></a> |
<a><xsl:attribute name="href"><xsl:value-of select="link_data" />
</xsl:attribute><xsl:value-of select="head_data"/></a> |
<a><xsl:attribute name="href"><xsl:value-of select="link_cla" />
</xsl:attribute><xsl:value-of select="head_classe"/></a></p>
</xsl:for-each>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<hr/>
<table border="0" width="100%">
<tr><td width="5%">
<a><xsl:attribute name="href"><xsl:value-of select="decorado" />
</xsl:attribute>
<xsl:element name="img">
<xsl:attribute name="src"><xsl:value-of select="gif"/></xsl:attribute>
<xsl:attribute name="border">0</xsl:attribute>
</xsl:element></a>
</td><td width="90%">
<xsl:value-of select="chamada"/>
<xsl:value-of select="cutter"/>
<xsl:value-of select="volume"/><br/>
<xsl:value-of select="ref/a"/>
<b><xsl:value-of select="ref/b"/></b>
<b><xsl:value-of select="ref/r"/></b>
<xsl:value-of select="ref/c"/>
<xsl:value-of select="ref/d"/>
</td>
<td width="5%">
<xsl:value-of select="ref/e"/>
</td>
</tr></table>
</xsl:for-each>

<hr/>
<center>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_prim"/></xsl:attribute>Primeira | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_ante"/></xsl:attribute>Anterior | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_prox"/></xsl:attribute>Próxima | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_ulti"/></xsl:attribute>Última | </a>
<a class="foot"><xsl:attribute name="href"><xsl:value-of select="db/link_prt" /></xsl:attribute>Imprimir</a>
</center>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
