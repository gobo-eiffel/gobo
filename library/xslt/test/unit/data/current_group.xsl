<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
<xsl:template match="titles">
    <xsl:for-each-group select="title" group-by="ix">
      <h2><xsl:value-of select="current-grouping-key()"/></h2>
      <xsl:for-each select="current-group()">
        <p><xsl:value-of select="."/></p>
      </xsl:for-each>
    </xsl:for-each-group>
</xsl:template>
</xsl:transform>
