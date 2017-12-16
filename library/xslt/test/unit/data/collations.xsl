<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gexslt="http://www.gobosoft.com/eiffel/gobo/gexslt/extension"
  version="2.0"
  exclude-result-prefixes="gexslt"
>

<gexslt:collation name="http://fred" />

<xsl:output method="text"/>

<xsl:template name="first">
  <!-- the next line should not produce an error -->
  <xsl:value-of select="compare ('abc', 'def', 'http://fred')" />
</xsl:template>

</xsl:transform>
