<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0">


<xsl:template name="initial" >
  <output>
    <xsl:value-of select="document('books3.xml#S')"/>
  </output>
</xsl:template>

</xsl:transform>	
