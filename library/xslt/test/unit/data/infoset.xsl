<!--@Copyright: Microsoft Corporation 2002 -->
<!-- Amended by Colin Adams to remove use of namespace axis -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method = "xml" encoding ="UTF-8" omit-xml-declaration = "yes"/>
  <xsl:preserve-space elements="*" />
  <xsl:template match="/">
    <document>
      <children>
	<xsl:apply-templates/>
      </children>
    </document>
  </xsl:template>

  <!-- Templates for each node type follows.-->
  
  <xsl:template match="*">
    <xsl:element name="element">
      <localName><xsl:value-of select="local-name()"/></localName>
      <namespaceName><xsl:value-of select="namespace-uri()"/></namespaceName>
      <children>
	<xsl:apply-templates/>
      </children>
      <attributes>
	<xsl:apply-templates select = "@*"><xsl:sort select="name()"/></xsl:apply-templates>
      </attributes>
      <inScopeNamespaces>
	<xsl:variable name="current-element" select="."/>
	<xsl:variable name="namespaces">
	  <xsl:for-each select="in-scope-prefixes(.)">
	    <xsl:sequence select="namespace-uri-for-prefix(., $current-element)" />
	  </xsl:for-each>
	</xsl:variable>
	<xsl:for-each select="tokenize($namespaces, '\s+')">
	  <xsl:sort select="."/>
	  <xsl:element name="namespace" >
	    <xsl:value-of select = "."/>
	  </xsl:element>
	</xsl:for-each>
      </inScopeNamespaces>
    </xsl:element>
  </xsl:template>
  <xsl:template match="@*">	
    <xsl:element name="attribute">
      <namespaceName><xsl:value-of select="namespace-uri()"/></namespaceName>
      <localName><xsl:value-of select="local-name()"/></localName>		
      <normalizedValue><xsl:value-of select = "."/></normalizedValue>
    </xsl:element>
  </xsl:template>
  <xsl:template match="processing-instruction()" xml:space="preserve">
    <xsl:element name="processingInstruction">
      <target><xsl:value-of select = "name()"/></target>
      <content><xsl:value-of select = "."/></content>
    </xsl:element>
  </xsl:template>
  <!-- Template for text nodes -->
  <xsl:template match="text()">
    <xsl:element name="text" xml:space="preserve">
      <xsl:value-of select = "."/>
    </xsl:element>
  </xsl:template>
  
  <!-- Template for comment nodes -->
  <xsl:template match="comment()" xml:space="preserve">
    <xsl:element name="comment" >
      <content><xsl:value-of select = "."/></content> 
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
<!--
	  
-->
