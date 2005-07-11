<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                
<!-- XSLT 2.0 shuoldn't allows two local parameters to have the same name --> 
           
  
  <xsl:template match="/">
    <xsl:apply-templates select="*">
      <xsl:with-param name="mod" select="3"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="*">
    <xsl:param name="mod" select="1"/>
    <xsl:param name="mod" select="2"/>
    <out result="{$mod}"/>
  </xsl:template>
  
</xsl:stylesheet>
