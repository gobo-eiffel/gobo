<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <!-- test error on tunnel parameter with required="yes" -->
  
  <xsl:template match="/">
    <out>
      <xsl:apply-templates>
	<xsl:with-param name="t1" select="17" tunnel="yes"/>
	<xsl:with-param name="t2" select="18" tunnel="yes"/>
      </xsl:apply-templates>
    </out>
  </xsl:template>
  
  <xsl:template match="b">
    <xsl:param name="t2" select="18" tunnel="yes"/>
    <b>
      <xsl:apply-templates>
	<xsl:with-param name="t2" select="28" tunnel="yes"/>
	<xsl:with-param name="t3" select="38" tunnel="yes"/>
      </xsl:apply-templates>
    </b>
    <old><xsl:value-of select="$t2"/></old>
  </xsl:template>
  
  <xsl:template match="d">
    <xsl:param name="t4" tunnel="yes" required="yes"/>
    <xsl:param name="t2" tunnel="yes" select="-1" required="no"/>
    <xsl:param name="t3" tunnel="yes" select="-1"/>        
    <d t4="{$t4}" t2="{$t2}" t3="{$t3}"/>
  </xsl:template>

</xsl:stylesheet>
