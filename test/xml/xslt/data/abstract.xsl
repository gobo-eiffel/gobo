<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="xml" />

<xsl:template match="/doc">
  <xsl:apply-templates />
</xsl:template>

<xsl:template match="abstract">
  <abstract>
    <xsl:analyze-string select="." regex="\n">
      <xsl:matching-substring>
	<br/>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
	<xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </abstract>
</xsl:template>

</xsl:transform>
