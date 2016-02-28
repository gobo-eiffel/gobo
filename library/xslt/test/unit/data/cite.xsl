<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="xml" />

<xsl:template match="/doc">
  <body>
    <xsl:analyze-string select="body" regex="\[(.*?)\]">
      <xsl:matching-substring>
	<cite><xsl:value-of select="regex-group(1)"/></cite>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
	<xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </body>
</xsl:template>

</xsl:transform>
