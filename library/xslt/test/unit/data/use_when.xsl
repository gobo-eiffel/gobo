<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="text" />

<xsl:import-schema schema-location="http://example.com/schema"
              use-when="system-property('xsl:is-schema-aware')='yes'"/>

<xsl:template name="first" use-when="system-property('xsl:is-schema-aware')='no'">
  <xsl:value-of select="'OK'" />
</xsl:template>

<xsl:template name="first" use-when="system-property('xsl:is-schema-aware')='yes'">
  <xsl:result-document validation="strict">
    Not OK
  </xsl:result-document>
</xsl:template>

</xsl:transform>
