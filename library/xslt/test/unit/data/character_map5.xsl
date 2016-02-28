<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:import href="./character_map3.xsl" />
<xsl:output method="text" use-character-maps="html-doc" />


<xsl:template name="first">
  <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <body>
      <img src="./a-url-that-needs-escaping-because-of-&#xE405;-is-in-the-path-although-the-following-should-remain-as-an-entity-&amp;nbsp;" />
      <p>
	&#160;fred&#161;jim&#xE400;harry&#xE401;jill&#xE402;tab-to-three-spaces&#x9;CRLF&#xA;
      </p>
    </body>
  </html>
</xsl:template>

</xsl:transform>
