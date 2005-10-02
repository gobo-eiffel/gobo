<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

<xsl:output method="text" />

<xsl:template name="first">
  <xsl:sequence select="format-date(xs:date ('2002-12-31'), '[D1o] [MNn], [Y]', 'en', (), ())"/>
</xsl:template>

</xsl:transform>
