<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">

<xsl:character-map name="html-doc"
  use-character-maps="html-chars doc-entities windows-format" />
  
<xsl:character-map name="html-chars"
  use-character-maps="latin1" />

<xsl:character-map name="latin1">
  <xsl:output-character character="&#160;" string="&amp;nbsp;" />
  <xsl:output-character character="&#161;" string="&amp;iexcl;" />
</xsl:character-map>

<xsl:character-map name="doc-entities">
  <xsl:output-character character="&#xE400;" string="&amp;t-and-c;" />
  <xsl:output-character character="&#xE401;" string="&amp;chap1;" />
  <xsl:output-character character="&#xE402;" string="&amp;chap2;" />
</xsl:character-map>

<xsl:character-map name="windows-format">
  <!-- newlines as CRLF -->
  <xsl:output-character character="&#xA;" string="&#xD;&#xA;" />

  <!-- tabs as three spaces -->
  <xsl:output-character character="&#x9;" string="   " />

</xsl:character-map>

<xsl:template name="first">
  <html>
    <body>
      <img src="./a-url-that-needs-escaping-because-of-&#xE405;-is-in-the-path-although-the-following-should-remain-as-an-entity-&amp;nbsp;" />
      <p>
	&#160;fred&#161;jim&#xE400;harry&#xE401;jill&#xE402;tab-to-three-spaces&#x9;CRLF&#xA;
      </p>
    </body>
  </html>
</xsl:template>

</xsl:transform>
