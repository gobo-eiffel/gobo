<?xml version="1.0"?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:gexslt="http://www.gobosoft.com/eiffel/gobo/gexslt/extension"
	xmlns:gobodoc="http://www.gobosoft.com/eiffel/gobo/documentation"
	gexslt:explain="no"
	exclude-result-prefixes="xs gexslt gobodoc"
	version="2.0">

<xsl:param name="previous"/>
<xsl:param name="next"/>
<xsl:param name="toc"/>
<xsl:param name="path_to_doc" select="''"/>
<xsl:param name="path_to_gobo" select="concat($path_to_doc,'../../../')"/>
<xsl:param name="images" select="concat($path_to_doc,'image/')"/>

<xsl:output
	method="xhtml"
	indent="yes"
	gexslt:indent-spaces="1"
	gexslt:byte-order-mark="no"
	gexslt:character-representation="entity;decimal"
	version="1.0"
	include-content-type="yes"
	omit-xml-declaration="no"
	encoding="ISO-8859-1"
   />

<xsl:template match="gobodoc:anchor">
	<a>
		<xsl:attribute name="name">
			<xsl:value-of select="@id"/>
		</xsl:attribute>
	</a>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="gobodoc:argument">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:argument" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:argument" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:assign">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:assign" mode="listing">
	<xsl:apply-templates select="gobodoc:target" mode="listing"/>
	<tt><xsl:text> := </xsl:text></tt>
	<xsl:apply-templates select="gobodoc:expression" mode="listing"/>
</xsl:template>

<xsl:template match="gobodoc:assign" mode="inline">
	<xsl:apply-templates select="gobodoc:target" mode="inline"/>
	<tt><xsl:text> := </xsl:text></tt>
	<xsl:apply-templates select="gobodoc:expression" mode="inline"/>
</xsl:template>

<xsl:template match="gobodoc:blockquote">
	<blockquote>
		<xsl:apply-templates/>
	</blockquote>
</xsl:template>

<xsl:template match="gobodoc:chapter">
	<html lang="en" xml:lang="en">
	<head>
		<title>
			<xsl:value-of select="gobodoc:title"/>
		</title>
	</head>
	<body bgcolor="#FFFFFF">
		<xsl:apply-templates select="." mode="header"/>
		<xsl:apply-templates select="gobodoc:variablelist|gobodoc:itemizedlist|gobodoc:orderedlist|gobodoc:para|gobodoc:programlisting|gobodoc:section|gobodoc:synopsis|gobodoc:table"/>
		<xsl:apply-templates select="." mode="footer"/>
	</body>
	</html>
</xsl:template>

<xsl:template match="gobodoc:chapter" mode="header">
	<table border="0" width="100%">
	<tr>
		<td>
			<font size="6"><strong><xsl:value-of select="gobodoc:title"/></strong></font>
		</td>
		<td align="right">
			<xsl:choose>
				<xsl:when test="$previous!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$previous"/>
						</xsl:attribute>
						<img src="{$images}previous.gif" alt="Previous" border="0"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="{$images}previous.gif" alt="Previous" border="0"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$next"/>
						</xsl:attribute>
						<img src="{$images}next.gif" alt="Next" border="0"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="{$images}next.gif" alt="Next" border="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>
	</table>
	<hr size="1"/>
</xsl:template>

<xsl:template match="gobodoc:chapter" mode="footer">
	<hr size="1"/>
	<table border="0" width="100%">
	<tr>
		<td>
			<address><font size="2">
				<xsl:apply-templates select="gobodoc:chapterinfo/gobodoc:copyright" mode="footer"/>
				<br/>
				<xsl:apply-templates select="gobodoc:chapterinfo/gobodoc:email" mode="footer"/>
				<br/>
				<b>http://</b><a href="http://www.gobosoft.com">www.gobosoft.com</a>
				<br/>
				<xsl:apply-templates select="gobodoc:chapterinfo/gobodoc:date" mode="footer"/>
			</font></address>
		</td>
		<td align="right" valign="top">
			<a href="http://www.gobosoft.com">
				<img src="{$images}home.gif" alt="Home" border="0"/>
			</a>
			<xsl:choose>
				<xsl:when test="$toc!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$toc"/>
						</xsl:attribute>
						<img src="{$images}toc.gif" alt="Toc" border="0"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="{$images}toc.gif" alt="Toc" border="0"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$previous!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$previous"/>
						</xsl:attribute>
						<img src="{$images}previous.gif" alt="Previous" border="0"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="{$images}previous.gif" alt="Previous" border="0"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$next!=''">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$next"/>
						</xsl:attribute>
						<img src="{$images}next.gif" alt="Next" border="0"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<img src="{$images}next.gif" alt="Next" border="0"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</tr>
	</table>
</xsl:template>

<xsl:template match="gobodoc:citetitle">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="gobodoc:classname">
	<xsl:choose>
		<xsl:when test="@linkend">
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="linkend-to-url">
						<xsl:with-param name="linkend">
							<xsl:value-of select="@linkend"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::gobodoc:programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::gobodoc:title">
						<xsl:apply-templates select="." mode="inline"/>
					</xsl:when>
					<xsl:otherwise>
						<font color="#008080">
							<xsl:apply-templates select="." mode="inline"/>
						</font>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</xsl:when>
		<xsl:when test="@flatshort='true'">
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="linkend-to-url">
						<xsl:with-param name="linkend">
							<xsl:text>flatshort/</xsl:text>
							<xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::gobodoc:programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::gobodoc:title">
						<xsl:apply-templates select="." mode="inline"/>
					</xsl:when>
					<xsl:otherwise>
						<font color="#008080">
							<xsl:apply-templates select="." mode="inline"/>
						</font>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="ancestor::gobodoc:programlisting">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:when>
				<xsl:when test="ancestor::gobodoc:title">
					<xsl:apply-templates select="." mode="inline"/>
				</xsl:when>
				<xsl:otherwise>
					<font color="#008080">
						<xsl:apply-templates select="." mode="inline"/>
					</font>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:classname" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:classname" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:comment">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:comment" mode="listing">
	<font color="#008000"><tt><xsl:text>-- </xsl:text><xsl:apply-templates mode="listing"/></tt></font>
</xsl:template>

<xsl:template match="gobodoc:comment" mode="inline">
	<font color="#008000"><tt><xsl:text>-- </xsl:text><xsl:apply-templates mode="inline"/></tt></font>
</xsl:template>

<xsl:template match="gobodoc:compound">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:compound" mode="listing">
	<xsl:for-each select="gobodoc:*">
		<xsl:apply-templates select="." mode="indent"/>
		<xsl:apply-templates select="." mode="listing"/>
		<xsl:if test="position()!=last()">
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gobodoc:compound" mode="inline">
	<xsl:for-each select="gobodoc:*">
		<xsl:apply-templates select="." mode="indent"/>
		<xsl:apply-templates select="." mode="inline"/>
		<xsl:if test="position()!=last()">
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gobodoc:constructname">
	<tt><xsl:apply-templates/></tt>
</xsl:template>

<xsl:template match="gobodoc:copyright" mode="footer">
	<b>
	<xsl:text>Copyright &#169; </xsl:text>
	<xsl:for-each select="gobodoc:year">
		<xsl:apply-templates/>
		<xsl:text>, </xsl:text>
	</xsl:for-each>
	<xsl:for-each select="gobodoc:holder">
		<xsl:apply-templates/>
		<xsl:if test="position()!=last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:for-each>
	</b>
</xsl:template>

<xsl:template match="gobodoc:date" mode="footer">
	<b><xsl:text>Last Updated: </xsl:text></b>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="gobodoc:email" mode="footer">
	<b><xsl:text>mailto:</xsl:text></b>
	<a>
		<xsl:attribute name="href">
			<xsl:text>mailto:</xsl:text>
			<xsl:apply-templates/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="gobodoc:emphasis">
	<xsl:choose>
		<xsl:when test="@role='strong'">
			<i><b><xsl:apply-templates/></b></i>
		</xsl:when>
		<xsl:otherwise>
			<i><xsl:apply-templates/></i>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:entry" mode="tbody">
	<td><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="gobodoc:entry" mode="tfoot">
	<td><xsl:apply-templates/></td>
</xsl:template>

<xsl:template match="gobodoc:entry" mode="thead">
	<td><b><xsl:apply-templates/></b></td>
</xsl:template>

<xsl:template match="gobodoc:equal">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:equal" mode="listing">
	<xsl:for-each select="gobodoc:expression">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<tt><xsl:text> = </xsl:text></tt>
	<xsl:for-each select="gobodoc:expression">
		<xsl:if test="position()=last()">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gobodoc:equal" mode="inline">
	<xsl:for-each select="gobodoc:expression">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<tt><xsl:text> = </xsl:text></tt>
	<xsl:for-each select="gobodoc:expression">
		<xsl:if test="position()=last()">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gobodoc:expression">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:expression" mode="listing">
	<xsl:apply-templates select="gobodoc:*" mode="listing"/>
</xsl:template>

<xsl:template match="gobodoc:expression" mode="inline">
	<xsl:apply-templates select="gobodoc:*" mode="inline"/>
</xsl:template>

<xsl:template match="gobodoc:featurecall">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:featurecall" mode="listing">
	<xsl:if test="gobodoc:target">
		<xsl:apply-templates select="gobodoc:target" mode="listing"/>
		<tt><xsl:text>.</xsl:text></tt>
	</xsl:if>
	<xsl:apply-templates select="gobodoc:featurename" mode="listing"/>
	<xsl:if test="gobodoc:arguments">
		<tt><xsl:text> (</xsl:text></tt>
		<xsl:for-each select="gobodoc:arguments/*">
			<xsl:apply-templates select="." mode="listing"/>
			<xsl:if test="position()!=last()">
				<tt><xsl:text>, </xsl:text></tt>
			</xsl:if>
		</xsl:for-each>
		<tt><xsl:text>)</xsl:text></tt>
	</xsl:if>
</xsl:template>

<xsl:template match="gobodoc:featurecall" mode="inline">
	<xsl:if test="gobodoc:target">
		<xsl:apply-templates select="gobodoc:target" mode="inline"/>
		<tt><xsl:text>.</xsl:text></tt>
	</xsl:if>
	<xsl:apply-templates select="gobodoc:featurename" mode="inline"/>
	<xsl:if test="gobodoc:arguments">
		<tt><xsl:text> (</xsl:text></tt>
		<xsl:for-each select="gobodoc:arguments/*">
			<xsl:apply-templates select="." mode="inline"/>
			<xsl:if test="position()!=last()">
				<tt><xsl:text>, </xsl:text></tt>
			</xsl:if>
		</xsl:for-each>
		<tt><xsl:text>)</xsl:text></tt>
	</xsl:if>
</xsl:template>

<xsl:template match="gobodoc:featurename">
	<xsl:choose>
		<xsl:when test="@linkend">
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="linkend-to-url">
						<xsl:with-param name="linkend">
							<xsl:value-of select="@linkend"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::gobodoc:programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:otherwise>
						<font color="#008080">
							<xsl:apply-templates select="." mode="inline"/>
						</font>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</xsl:when>
		<xsl:when test="@flatshort">
			<a>
				<xsl:attribute name="href">
					<xsl:call-template name="linkend-to-url">
						<xsl:with-param name="linkend">
							<xsl:text>flatshort/</xsl:text>
							<xsl:value-of select="translate(@flatshort,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
							<xsl:text>#</xsl:text>
							<xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::gobodoc:programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:otherwise>
						<font color="#008080">
							<xsl:apply-templates select="." mode="inline"/>
						</font>
					</xsl:otherwise>
				</xsl:choose>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="ancestor::gobodoc:programlisting">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:when>
				<xsl:otherwise>
					<font color="#008080">
						<xsl:apply-templates select="." mode="inline"/>
					</font>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:featurename" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:featurename" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:filename">
	<font color="#800000"><i><tt>
		<xsl:apply-templates/>
	</tt></i></font>
</xsl:template>

<xsl:template match="gobodoc:exmlsyntax">
	<font color="#008080">
		<xsl:apply-templates/>
	</font>
</xsl:template>

<xsl:template match="gobodoc:envar">
	<font color="#008080">
		<xsl:apply-templates/>
	</font>
</xsl:template>

<xsl:template match="gobodoc:uri">
	<font color="#008080">
		<xsl:apply-templates/>
	</font>
</xsl:template>

<xsl:template match="gobodoc:xpath">
	<font color="#008080">
		<xsl:apply-templates/>
	</font>
</xsl:template>

<xsl:template match="gobodoc:xslt">
	<font color="#008080">
		<xsl:apply-templates/>
	</font>
</xsl:template>

<xsl:template match="gobodoc:if">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:if" mode="listing">
	<i><b><tt><font color="#000080"><xsl:text>if</xsl:text></font></tt></b></i>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="gobodoc:expression" mode="listing"/>
	<xsl:call-template name="space"/>
	<i><b><tt><font color="#000080"><xsl:text>then</xsl:text></font></tt></b></i>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='then'">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='else'">
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><font color="#000080"><xsl:text>else</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="listing"/>
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><font color="#000080"><xsl:text>end</xsl:text></font></tt></b></i>
</xsl:template>

<xsl:template match="gobodoc:if" mode="inline">
	<i><b><tt><xsl:text>if</xsl:text></tt></b></i>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="gobodoc:expression" mode="inline"/>
	<xsl:call-template name="space"/>
	<i><b><tt><xsl:text>then</xsl:text></tt></b></i>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='then'">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='else'">
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><xsl:text>else</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="inline"/>
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><xsl:text>end</xsl:text></tt></b></i>
</xsl:template>

<xsl:template match="gobodoc:mediaobjectco/gobodoc:imageobjectco">
	<p>
		<xsl:if test="gobodoc:imageobject/gobodoc:imagedata/@align">
			<xsl:attribute name="align">
				<xsl:value-of select="gobodoc:imageobject/gobodoc:imagedata/@align"/>
			</xsl:attribute>
		</xsl:if>
		<map>
			<xsl:attribute name="name">
				<xsl:value-of select="generate-id(.)"/>
			</xsl:attribute>
			<xsl:for-each select="gobodoc:areaspec/gobodoc:area">
				<area shape="rect">
					<xsl:attribute name="coords">
						<xsl:value-of select="@coords"/>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:call-template name="linkend-to-url">
							<xsl:with-param name="linkend">
								<xsl:value-of select="@linkend"/>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:attribute>
				</area>
			</xsl:for-each>
		</map>
		<img border="0">
			<xsl:attribute name="src">
				<xsl:value-of select="gobodoc:imageobject/gobodoc:imagedata/@fileref"/>
			</xsl:attribute>
			<xsl:attribute name="usemap">
				<xsl:text>#</xsl:text><xsl:value-of select="generate-id(.)"/>
			</xsl:attribute>
		</img>
	</p>
</xsl:template>

<xsl:template match="gobodoc:infixname">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:infixname" mode="listing">
	<tt><i><b>infix</b></i><xsl:text> &quot;</xsl:text><i>
	<xsl:apply-templates mode="listing"/>
	</i><xsl:text>&quot;</xsl:text></tt>
</xsl:template>

<xsl:template match="gobodoc:infixname" mode="inline">
	<tt><i><b>infix</b></i><xsl:text> &quot;</xsl:text><i>
	<xsl:apply-templates mode="inline"/>
	</i><xsl:text>&quot;</xsl:text></tt>
</xsl:template>

<xsl:template match="gobodoc:informalexample">
	<blockquote>
		<xsl:apply-templates/>
	</blockquote>
</xsl:template>

<xsl:template match="gobodoc:integer">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:integer" mode="listing">
	<i><tt><font color="#808000">
	<xsl:apply-templates mode="listing"/>
	</font></tt></i>
</xsl:template>

<xsl:template match="gobodoc:integer" mode="inline">
	<i><tt>
	<xsl:apply-templates mode="inline"/>
	</tt></i>
</xsl:template>

<xsl:template match="gobodoc:itemizedlist">
	<ul>
		<xsl:for-each select="gobodoc:listitem">
			<li>
				<xsl:for-each select="gobodoc:*">
					<xsl:choose>
						<xsl:when test="position()=1 and name(.)='para'">
							<xsl:apply-templates/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template match="gobodoc:libraryname">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="gobodoc:link">
	<a>
		<xsl:attribute name="href">
			<xsl:call-template name="linkend-to-url">
				<xsl:with-param name="linkend">
					<xsl:value-of select="@linkend"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="gobodoc:local">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:local" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:local" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="gobodoc:loop">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:loop" mode="listing">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<i><b><tt><font color="#000080"><xsl:text>from</xsl:text></font></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:for-each select="gobodoc:compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="gobodoc:*">
						<xsl:apply-templates select="." mode="listing"/>
						<xsl:if test="position()!=last()">
							<tt><xsl:text>; </xsl:text></tt>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="space"/>
			<i><b><tt><font color="#000080"><xsl:text>until</xsl:text></font></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:apply-templates select="gobodoc:until/gobodoc:expression" mode="listing"/>
			<xsl:call-template name="space"/>
			<i><b><tt><font color="#000080"><xsl:text>loop</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<i><b><tt><font color="#000080"><xsl:text>from</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="gobodoc:compound">
				<xsl:if test="@role='from'">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><font color="#000080"><xsl:text>until</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:call-template name="indent"/>
			<xsl:apply-templates select="gobodoc:until/gobodoc:expression" mode="listing"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><font color="#000080"><xsl:text>loop</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='loop'">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><font color="#000080"><xsl:text>end</xsl:text></font></tt></b></i>
</xsl:template>

<xsl:template match="gobodoc:loop" mode="inline">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<i><b><tt><xsl:text>from</xsl:text></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:for-each select="gobodoc:compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="gobodoc:*">
						<xsl:apply-templates select="." mode="inline"/>
						<xsl:if test="position()!=last()">
							<tt><xsl:text>; </xsl:text></tt>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="space"/>
			<i><b><tt><xsl:text>until</xsl:text></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:apply-templates select="gobodoc:until/gobodoc:expression" mode="inline"/>
			<xsl:call-template name="space"/>
			<i><b><tt><xsl:text>loop</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<i><b><tt><xsl:text>from</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="gobodoc:compound">
				<xsl:if test="@role='from'">
					<xsl:apply-templates select="." mode="inline"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><xsl:text>until</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:call-template name="indent"/>
			<xsl:apply-templates select="gobodoc:until/gobodoc:expression" mode="inline"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><xsl:text>loop</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:for-each select="gobodoc:compound">
		<xsl:if test="@role='loop'">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><xsl:text>end</xsl:text></tt></b></i>
</xsl:template>

<xsl:template match="gobodoc:orderedlist">
	<ol>
		<xsl:for-each select="gobodoc:listitem">
			<li>
				<xsl:for-each select="gobodoc:*">
					<xsl:choose>
						<xsl:when test="position()=1 and name(.)='para'">
							<xsl:apply-templates/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="."/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</li>
		</xsl:for-each>
	</ol>
</xsl:template>

<xsl:template match="gobodoc:para">
	<p>
		<xsl:apply-templates/>
	</p>
</xsl:template>

<xsl:template match="gobodoc:projectname">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="gobodoc:programlisting">
	<pre>
		<xsl:apply-templates/>
	</pre>
</xsl:template>

<xsl:template match="gobodoc:quote">
	<xsl:text>&#147;</xsl:text><xsl:apply-templates/><xsl:text>&#148;</xsl:text>
</xsl:template>

<xsl:template match="gobodoc:section">
	<div>
	<xsl:if test="@id">
		<a>
			<xsl:attribute name="name">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
		</a>
	</xsl:if>
	<xsl:apply-templates/>
	</div>
</xsl:template>

<xsl:template match="gobodoc:row" mode="tbody">
	<tr>
		<xsl:apply-templates select="gobodoc:entry" mode="tbody"/>
	</tr>
</xsl:template>

<xsl:template match="gobodoc:row" mode="tfoot">
	<tr>
		<xsl:apply-templates select="gobodoc:entry" mode="tfoot"/>
	</tr>
</xsl:template>

<xsl:template match="gobodoc:row" mode="thead">
	<tr>
		<xsl:apply-templates select="gobodoc:entry" mode="thead"/>
	</tr>
</xsl:template>

<xsl:template match="gobodoc:section/gobodoc:title">
	<xsl:variable gexslt:explain="no" name="section_level" select="count(ancestor::gobodoc:section) + 1"/>
	<xsl:variable name="header_name">
		<xsl:choose>
			<xsl:when test="$section_level &lt; 7">h<xsl:value-of select="string($section_level)"/></xsl:when>
			<xsl:otherwise>p</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:element name="{$header_name}" namespace="http://www.w3.org/1999/xhtml">
		<xsl:apply-templates/>
	</xsl:element>
</xsl:template>

<xsl:template match="gobodoc:synopsis">
<pre>
<xsl:value-of select="."/>
</pre>
</xsl:template>

<xsl:template match="gobodoc:table">
	<table border="2" alt="{gobodoc:title}">
		<caption><xsl:value-of select="gobodoc:title"/></caption>
		<col span="{gobodoc:tgroup/@cols}"/>
		<!-- support only one group... -->
		<xsl:apply-templates select="gobodoc:tgroup/gobodoc:thead"/>
		<xsl:apply-templates select="gobodoc:tgroup/gobodoc:tfoot"/>
		<xsl:apply-templates select="gobodoc:tgroup/gobodoc:tbody"/>
	</table>
</xsl:template>

<xsl:template match="gobodoc:target">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:target" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="gobodoc:target" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="gobodoc:tbody">
	<tbody>
		<xsl:apply-templates select="gobodoc:row" mode="tbody"/>
	</tbody>
</xsl:template>

<xsl:template match="gobodoc:tfoot">
	<tfoot>
		<xsl:apply-templates select="gobodoc:row" mode="tfoot"/>
	</tfoot>
</xsl:template>

<xsl:template match="gobodoc:thead">
	<thead>
		<xsl:apply-templates select="gobodoc:row" mode="thead"/>
	</thead>
</xsl:template>

<xsl:template match="gobodoc:true">
	<xsl:choose>
		<xsl:when test="ancestor::gobodoc:programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="gobodoc:true" mode="listing">
	<i><tt><font color="#808000"><xsl:text>True</xsl:text></font></tt></i>
</xsl:template>

<xsl:template match="gobodoc:true" mode="inline">
	<i><tt><xsl:text>True</xsl:text></tt></i>
</xsl:template>

<xsl:template match="gobodoc:ulink">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="@url"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="gobodoc:variablelist">
	<dl>
		<xsl:apply-templates/>
	</dl>
</xsl:template>

<xsl:template match="gobodoc:varlistentry">
	<xsl:for-each select="gobodoc:term">
	<dt>
		<xsl:apply-templates select="."/>
	</dt>
	</xsl:for-each>
	<dd>
		<xsl:for-each select="gobodoc:listitem/*">
			<xsl:choose>
				<xsl:when test="position()=1 and name(.)='para'">
					<xsl:apply-templates/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</dd>
</xsl:template>

<xsl:template match="gobodoc:warning">
	<p><font color="#FF0000">
		<xsl:apply-templates/>
	</font></p>
</xsl:template>




<xsl:template name="indent">
		<!--
			Indentation in programlisting.
		-->
	<tt><xsl:text>    </xsl:text></tt>
</xsl:template>

<xsl:template name="newline">
		<!--
			New-line in programlisting.
		-->
<tt><xsl:text>
</xsl:text></tt>
</xsl:template>

<xsl:template name="space">
		<!--
			Space character in programlisting.
		-->
	<tt><xsl:text> </xsl:text></tt>
</xsl:template>

<xsl:template match="gobodoc:*" mode="indent">
		<!--
			Add indentation per nested compounds in programlisting.
		-->
	<xsl:for-each select="ancestor::gobodoc:compound">
		<xsl:if test="position()!=last()">
			<xsl:call-template name="indent"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template name="linkend-to-url">
		<!--
			Replace id by URL.
			For example:
				linkend: xxx/yyy
				result: xxx/yyy.html
			Another example:
				linkend: xxx/yyy#zzz
				result: xxx/yyy.html#zzz
		-->
	<xsl:param name="linkend"/>
	<xsl:if test="starts-with($linkend,'${library/') or starts-with($linkend,'${tool/')">
		<xsl:variable name="linkend_kind_name" select="substring-before(substring-after($linkend,'/'),'}/')"/>
		<xsl:variable name="linkend_kind_type" select="substring-before(substring-after($linkend,'${'),'/')"/>
		<xsl:value-of select="$path_to_gobo"/>
		<xsl:if test="not(ends-with($path_to_gobo,'/'))">
			<xsl:value-of select="'/'"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="starts-with($path_to_gobo,'http')">
				<xsl:if test="compare($linkend_kind_name,'gobo')!=0">
					<xsl:value-of select="concat($linkend_kind_name,'/')"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($linkend_kind_type,'/',$linkend_kind_name,'/doc/')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>
	<xsl:variable name="linkend_relative_name">
		<xsl:choose>
			<xsl:when test="starts-with($linkend,'${library/') or starts-with($linkend,'${tool/')">
				<xsl:value-of select="substring-after($linkend,'}/')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$linkend"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="contains($linkend_relative_name,'#')">
			<xsl:value-of select="concat(substring-before($linkend_relative_name,'#'),'.html#',substring-after($linkend_relative_name,'#'))"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="concat($linkend_relative_name,'.html')"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
