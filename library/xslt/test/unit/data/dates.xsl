<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="xml" />

<xsl:variable name="months" select="'January', 'February', 'March',  'April', 'May', 'June', 'July'"/>

<xsl:template match="/doc">
  <doc><xsl:apply-templates /></doc>
</xsl:template>

<xsl:template match="date">
  <date><xsl:analyze-string select="normalize-space(.)" 
    regex="([0-9]{{1,2}})\s([A-Z][a-z]+)\s([0-9]{{4}})">
    <xsl:matching-substring>
      <xsl:number value="regex-group(3)" format="0001"/>          
      <xsl:text>-</xsl:text>
      <xsl:number value="index-of($months, regex-group(2))" format="01"/>
      <xsl:text>-</xsl:text>
      <xsl:number value="regex-group(1)" format="01"/>
    </xsl:matching-substring>
  </xsl:analyze-string></date>
</xsl:template>

</xsl:transform>
