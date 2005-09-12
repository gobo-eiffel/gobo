<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="text" />

<xsl:template name="first">
  <xsl:sequence select="unparsed-text('iago_16.txt')" />
</xsl:template>

</xsl:transform>
