<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
        
<xsl:template match="/">
  <xsl:result-document href="fred">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head><title>Table of Contents</title></head>
      <body>
        <h1>Table of Contents</h1>
        <xsl:for-each select="/*/xhtml:body/(*[1] | xhtml:h1)">
          <p><a href="section{position()}.html"><xsl:value-of select="."/></a></p>
        </xsl:for-each>
      </body>
    </html>
  </xsl:result-document>
  <xsl:for-each-group select="/*/xhtml:body/*" group-starting-with="xhtml:h1">
    <xsl:result-document indent="no" href="fred"
                         validation="strip">         
      <html xmlns="http://www.w3.org/1999/xhtml">
        <head><title><xsl:value-of select="."/></title></head>
        <body>
          <xsl:copy-of select="current-group()"/>
        </body>
      </html>
    </xsl:result-document>
  </xsl:for-each-group>
</xsl:template>

</xsl:stylesheet>
