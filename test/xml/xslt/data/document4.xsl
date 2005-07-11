<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="2.0">


<xsl:template name="initial" >
  <output>
    <xsl:value-of select="document('../../xpath/data/books3.xml#xmlns(gexslt%20=%20http://www.gobosoft.com/eiffel/gobo/gexslt/extension)gexslt:xpath(/BOOKLIST/BOOKS/ITEM%5B1%5D/TITLE)')"/>
  </output>
</xsl:template>

</xsl:transform>	
