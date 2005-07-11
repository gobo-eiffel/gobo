<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0">


<xsl:template name="initial" >
  <output>
    <xsl:value-of select="document('../../xpath/data/books.xml#element(/1/1/1/1)')"/>
  </output>
</xsl:template>

</xsl:transform>	
