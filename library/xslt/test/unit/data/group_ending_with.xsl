<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
<xsl:template match="doc">
<doc>
  <xsl:for-each-group select="*" 
                      group-ending-with="page[not(@continued='yes')]">
    <pageset>
      <xsl:for-each select="current-group()">
        <page><xsl:value-of select="."/></page>
      </xsl:for-each> 
    </pageset>
  </xsl:for-each-group>
</doc>
</xsl:template>
</xsl:transform>
