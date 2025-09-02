<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gexslt="https://www.gobosoft.com/eiffel/gobo/tool/gexslt/doc/extension"
  version="2.0">

<xsl:output method="gexslt:chain" gexslt:next-in-chain="./example.xsl"/>


<xsl:template name="initial">
  <example/>
</xsl:template>

</xsl:transform>
