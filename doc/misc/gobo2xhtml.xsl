<?xml version='1.0'?>

<!--

Gobo specific XHTML output style sheet. It utilizes the docbook stylesheet:

  http://docbook.sourceforge.net/

but tries to output the original Gobo output as clos as possible.

-->


<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version='1.0'
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="#default">

<xsl:import href="xhtml/docbook.xsl"/>


<xsl:param name="previous"/>
<xsl:param name="next"/>
<xsl:param name="toc"/>


<xsl:output
  method="xml"
  version="1.0"
  omit-xml-declaration="no"
  encoding="ISO-8859-1"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
/>


<!-- Include a style sheet -->
<xsl:template name="user.head.content">
<link rel="stylesheet" type="text/css" href="../misc/gobo.css" title="Gobo Default Style" />
</xsl:template>


<!-- We have our own header and footer -->

<xsl:template name="user.header.content">
  <table class="header">
	<tr>
		<td>
      <h1><xsl:value-of select="title"/></h1>
		</td>
		<td align="right">
			<xsl:choose>
				<xsl:when test="$previous!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$previous"/>
						</xsl:attribute>
						<img src="../image/previous.gif" alt="Previous"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="../image/previous.gif" alt="Previous"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$next"/>
						</xsl:attribute>
						<img src="../image/next.gif" alt="Next"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="../image/next.gif" alt="Next"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>
	</table>
	<hr/><xsl:text>&#xa;</xsl:text>
</xsl:template>


<xsl:template name="user.footer.content">
	<hr/>
	<table class="footer">
	<tr>
		<td>
			<address>
				<xsl:apply-templates select="chapterinfo/copyright" mode="footer"/>
				<br/>
				<xsl:apply-templates select="chapterinfo/email" mode="footer"/>
				<br/>
				<b>http://</b><a href="http://www.gobosoft.com">www.gobosoft.com</a>
				<br/>
				<xsl:apply-templates select="chapterinfo/date" mode="footer"/>
			</address>
		</td>
		<td align="right" valign="top">
			<a href="http://www.gobosoft.com">
				<img src="../image/home.gif" alt="Home"/>
			</a>
			<xsl:choose>
				<xsl:when test="$toc!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$toc"/>
						</xsl:attribute>
						<img src="../image/toc.gif" alt="Toc"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="../image/toc.gif" alt="Toc"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$previous!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$previous"/>
						</xsl:attribute>
						<img src="../image/previous.gif" alt="Previous"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="../image/previous.gif" alt="Previous"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$next"/>
						</xsl:attribute>
						<img src="../image/next.gif" alt="Next"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="../image/next.gif" alt="Next"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>
	</table>
</xsl:template>


<!-- Chapters don't have a title page or table of contents -->

<xsl:template name="chapter.titlepage">
</xsl:template>

<xsl:template name="component.toc">
</xsl:template>


<!-- we use only a very constrained version of link -->

<xsl:template match="link" name="link">
<a href="{@linkend}.html">
  <xsl:if test="count(child::node()) &gt; 0">
    <!-- If it has content, use it -->
    <xsl:apply-templates/>
  </xsl:if>
</a>
</xsl:template>


<!-- Eiffel code formatting -->

<xsl:template match="classname">
  <span class="classname"><xsl:call-template name="inline.italicmonoseq"/></span>
</xsl:template>

<xsl:template match="constructname">
  <span class="constructname"><xsl:call-template name="inline.monoseq"/></span>
</xsl:template>

<xsl:template match="featurename|function">
  <xsl:choose>
    <xsl:when test="$function.parens != '0' and (parameter or function or replaceable)">
      <xsl:variable name="nodes" select="text()|*"/>
      <xsl:call-template name="inline.monoseq">
        <xsl:with-param name="content">
          <xsl:call-template name="simple.xlink">
            <xsl:with-param name="content">
              <xsl:apply-templates select="$nodes[1]"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:text>(</xsl:text>
      <xsl:apply-templates select="$nodes[position()&gt;1]"/>
      <xsl:text>)</xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <span class="featurename"><xsl:call-template name="inline.monoseq"/></span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="tagname">
  <span class="tagname"><xsl:call-template name="inline.monoseq"/></span>
</xsl:template>


</xsl:stylesheet>