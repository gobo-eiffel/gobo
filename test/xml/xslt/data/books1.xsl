<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0">


<xsl:template match="/" >
  <output>Document root</output>
</xsl:template>

<xsl:template match="*" >
  <output>
    <xsl:value-of select="."/>
  </output>
</xsl:template>

<xsl:template match="AUTHOR" >
  <output>
    <xsl:value-of select="."/>
  </output>
</xsl:template>

</xsl:transform>	
