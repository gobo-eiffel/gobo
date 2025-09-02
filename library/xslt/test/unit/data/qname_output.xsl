<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gexslt-examples="https://www.gobosoft.com/eiffel/gobo/tool/gexslt/doc/extension/example"
  version="2.0"
  exclude-result-prefixes="gexslt-examples"
>

<xsl:output method="gexslt-examples:xml" use-character-maps="entities"
	    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	    indent="yes"
	    gexslt-examples:internal-subset="&lt;!ENTITY fred &quot;Frederick&quot;>"
/>

<xsl:character-map name="entities">
  <xsl:output-character character="&#xE400;" string="&amp;fred;" />
</xsl:character-map>

<xsl:template name="first">
  <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    &#xE400;
  </html>
</xsl:template>

</xsl:transform>
