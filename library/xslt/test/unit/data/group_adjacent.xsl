<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:transform 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
<xsl:template match="p">
    <xsl:for-each-group select="node()" 
            group-adjacent="self::ul or self::ol">
        <xsl:choose>
            <xsl:when test="current-grouping-key()">
                <xsl:copy-of select="current-group()"/>  
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:copy-of select="current-group()"/>
                </p>
            </xsl:otherwise>  
        </xsl:choose>
    </xsl:for-each-group>
</xsl:template>
</xsl:transform>
