<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  exclude-result-prefixes="saxon"
  extension-element-prefixes="saxon"
  version="2.0">

<xsl:output method="text" />

<xsl:template name="first">
  <saxon:call-template name="{$fred}">
    <xsl:fallback>
      <xsl:value-of select="'OK'" />
    </xsl:fallback>
  </saxon:call-template>
</xsl:template>

</xsl:transform>
