<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:output method="xml" use-character-maps="jsp" />

<xsl:character-map name="jsp">
  <xsl:output-character character="«" string="&lt;%"/>
  <xsl:output-character character="»" string="%&gt;"/>
  <xsl:output-character character="§" string='"'/>
</xsl:character-map>

<xsl:template name="first">
  <setProperty name="user" property="id" value='«= §id§ + idValue »'/>
</xsl:template>

</xsl:transform>
