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
   table {font-family:Arial, Helvetica, sans-serif; width:100%; color:#006699; font-size: 12px;}
   th {color:#006699; background-color:#CEDFEF;}
   a {color:#0000CD; text-decoration:none;}
   a:hover {color:#FFD700; background-color:#6487DC; text-decoration:none;}
  .botao {background-color:#CEDFEF; font-weight:bold; font-size:12px; padding:2px; margin-top:10px; color:#006699;}  
  </style>
  
<form action="/cgi-bin/wxis.exe" method="POST" target="result">
 <input type="hidden">
   <xsl:attribute name="name">IsisScript</xsl:attribute>
   <xsl:attribute name="value">phl84/003.xis</xsl:attribute>
 </input>
 
 <input type="hidden">
   <xsl:attribute name="name">tmp</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tmp"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">opc</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="opc"/></xsl:attribute>
 </input>
 
 <input type="hidden">
   <xsl:attribute name="name">acv</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="acv"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">col</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="col"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">tag</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tag"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">pft</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="pft"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">rpp</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="rpp"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">idm</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="idm"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">tip</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="tip"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">spt</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="spt"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">cnt</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="cnt"/></xsl:attribute>
 </input>

 <input type="hidden">
   <xsl:attribute name="name">stf</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="stf"/></xsl:attribute>
 </input>
 
<table>
  <xsl:attribute name="width">100%</xsl:attribute>
  <xsl:attribute name="align">center</xsl:attribute>
  <xsl:attribute name="bgcolor"><xsl:value-of select="bgcolor"/></xsl:attribute>
  <tr>
    <td width="70%" align="center">
    
    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">and</xsl:attribute>
      <xsl:if test="bool = 'and'"><xsl:attribute name="checked" /></xsl:if>
      Todas as palavras
    </input>

    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">or</xsl:attribute>
      <xsl:if test="bool = 'or'"><xsl:attribute name="checked" /></xsl:if>
      Qualquer palavra
    </input>

    <input type="radio">
      <xsl:attribute name="name">bool</xsl:attribute>
      <xsl:attribute name="value">exp</xsl:attribute>
      <xsl:if test="bool = 'exp'"><xsl:attribute name="checked" /></xsl:if>
      Expressao booleana
    </input>

    <br/>
    
    <input type="text">
     <xsl:attribute name="size">60</xsl:attribute>
     <xsl:attribute name="name">exp</xsl:attribute>
     <xsl:attribute name="value"><xsl:value-of select="exp"/></xsl:attribute>
    </input>

    <input type="submit" class="botao">
      <xsl:attribute name="value">
        <xsl:value-of select="submit"/>
      </xsl:attribute>
    </input>
    </td>
    <td width="30%" align="center">

    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="link_filtro"/>
      </xsl:attribute>
      <b>* <xsl:value-of select="filtro"/></b>
    </a><br/>

    </td>
  </tr>
  <tr><td></td><td> </td></tr>
</table>
</form>

<p class="xy">Total encontrado: <xsl:value-of select="db/reg/hits"/><br/>
<b><xsl:value-of select="db/texto"/></b>
<a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_au"/>
</xsl:attribute> Autor</a> |
<a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_ti"/>
</xsl:attribute>Titulo</a> |
<a class="link"><xsl:attribute name="href"><xsl:value-of select="db/link_data"/>
</xsl:attribute>Data</a></p>

<xsl:for-each select="db/reg">
<xsl:sort select="ordem" />
<hr/>
<table class="xx" border="0" width="100%">
<tr><td width="5%">
</td><td width="90%">
<xsl:value-of select="ref/a"/>
<b><xsl:value-of select="ref/b"/></b>
<b><xsl:value-of select="ref/r"/></b>
<xsl:value-of select="ref/c"/>
<xsl:value-of select="ref/d"/>
</td><td width="10%"><xsl:value-of select="ref/e"/> ex.</td>
</tr></table>
</xsl:for-each>
<hr/>
<p class="xx" align="right">Total: <xsl:value-of select="sum(/db/reg/ref/e[number()=number()])" /> ex.</p>
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