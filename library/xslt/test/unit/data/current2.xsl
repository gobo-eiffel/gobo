<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gexslt="http://www.gobosoft.com/eiffel/gobo/gexslt/extension"  
  version="2.0">

<xsl:output method="text" />

<xsl:template match="/">
  <xsl:for-each select="BOOKLIST/BOOKS">
    <xsl:for-each select="ITEM[current()/count (child::ITEM) eq 8]">
      <xsl:value-of gexslt:explain="no" select="TITLE/text()[current()/@CAT eq 'X']" />
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

</xsl:transform>
