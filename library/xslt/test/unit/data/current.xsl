<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gexslt="https://www.gobosoft.com/eiffel/gobo/tool/gexslt/doc/xtension"  
  version="2.0">

<xsl:output method="text" />

<xsl:template match="/">
  <xsl:for-each select="BOOKLIST/BOOKS/ITEM">
    <xsl:value-of gexslt:explain="no" select="TITLE/text()[current()/@CAT eq 'X']" />
  </xsl:for-each>
</xsl:template>

</xsl:transform>
