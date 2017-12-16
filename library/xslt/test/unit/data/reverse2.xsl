<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:str="http://example.com/namespace"
  version="2.0"
  exclude-result-prefixes="str">

  <xsl:function name="str:reverse" as="xs:string">
    <xsl:param name="sentence" as="xs:string"/>
    <xsl:choose>
      <xsl:when test="contains($sentence, ' ')">  
	<xsl:sequence select="concat(str:reverse(substring-after($sentence, ' ')),
		      ' ',
		      substring-before($sentence, ' '))"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:sequence select="$sentence"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:function>

<xsl:template name="first">
<output>
  <xsl:value-of select="str:reverse('DOG BITES MAN')"/>
</output>
</xsl:template>

</xsl:transform>
