<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

  <!-- test of xsl:namespace -->

  <xsl:template name="first">
    <p:item xmlns:p="p.uri" xsl:exclude-result-prefixes="p"><xsl:namespace name="p">q.uri</xsl:namespace></p:item>
  </xsl:template>
  
</xsl:transform>
