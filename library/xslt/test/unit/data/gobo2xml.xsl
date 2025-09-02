<?xml version="1.0"?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">

<xsl:param name="previous"/>
<xsl:param name="next"/>
<xsl:param name="toc"/>

<xsl:output
  method="xml"
  indent="yes"
  version="1.0"
  include-content-type="no"
  omit-xml-declaration="no"
  encoding="ISO-8859-1"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
/>


<xsl:template match="anchor">
	<a>
		<xsl:attribute name="name">
			<xsl:value-of select="@id"/>
		</xsl:attribute>
	</a>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="argument">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="argument" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="argument" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="assign">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="assign" mode="listing">
	<xsl:apply-templates select="target" mode="listing"/>
	<tt><xsl:text> := </xsl:text></tt>
	<xsl:apply-templates select="expression" mode="listing"/>
</xsl:template>

<xsl:template match="assign" mode="inline">
	<xsl:apply-templates select="target" mode="inline"/>
	<tt><xsl:text> := </xsl:text></tt>
	<xsl:apply-templates select="expression" mode="inline"/>
</xsl:template>

<xsl:template match="blockquote">
	<blockquote>
		<xsl:apply-templates/>
	</blockquote>
</xsl:template>

<xsl:template match="chapter">
	<html lang="en" xml:lang="en">
	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>
			<xsl:value-of select="title"/>
		</title>
    <style type="text/css">
body {
  background-color: white;
  color: black;
}

address {
 font-size: smaller;
}

hr {
  height: 1;
}

img {
  border: none;
}

span.classname-inline {
  color: #008080;
  font-family: monospace;
  font-style: italic;
}

span.featurename-inline {
  color: #008080;
  font-family: monospace;
  font-style: italic;
}

span.returnvalue-inline {
  color: #008080;
  font-family: monospace;
  font-style: italic;
}

table {
  empty-cells: show;
  border-spacing: 0;
  border-collapse: collapse;
  margin-left: 2em;
  margin-right: 2em;
}

table tbody tr td {
  padding-right: 1em;
  border: 1pt solid black;
}

table thead tr td {
  border: 1pt solid black;
}

/* Documentation's footer is formatted with a table */
table.footer {
  border: none;
  width: 100%;
}

table.footer tbody tr td {
  border: none;
}

/* Documentation's header is formatted with a table */
table.header {
  border: none;
  width: 100%;
}

table.header tbody tr td {
  border: none;
}
    </style>
	</head>
	<body>
		<xsl:apply-templates select="." mode="header"/>
		<xsl:apply-templates select="itemizedlist|orderedlist|para|programlisting|sect1|synopsis|table"/>
		<xsl:apply-templates select="." mode="footer"/>
	</body>
	</html>
</xsl:template>

<xsl:template match="chapter" mode="header">
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
	<hr/>
</xsl:template>

<xsl:template match="chapter" mode="footer">
	<hr/>
	<table class="footer">
	<tr>
		<td>
			<address>
				<xsl:apply-templates select="chapterinfo/copyright" mode="footer"/>
				<br/>
				<xsl:apply-templates select="chapterinfo/email" mode="footer"/>
				<br/>
				<b>https://</b><a href="https://www.gobosoft.com">www.gobosoft.com</a>
				<br/>
				<xsl:apply-templates select="chapterinfo/date" mode="footer"/>
			</address>
		</td>
		<td align="right" valign="top">
			<a href="https://www.gobosoft.com">
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

<xsl:template match="citetitle">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="classname">
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
					<xsl:when test="ancestor::programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::title">
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
					<xsl:when test="ancestor::programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::title">
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
				<xsl:when test="ancestor::programlisting">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:when>
				<xsl:when test="ancestor::title">
					<xsl:apply-templates select="." mode="inline"/>
				</xsl:when>
				<xsl:otherwise>
          <xsl:apply-templates select="." mode="inline"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="classname" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="classname" mode="inline">
<span class="classname-inline"><xsl:apply-templates mode="inline"/></span>
</xsl:template>

<xsl:template match="comment">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="comment" mode="listing">
	<font color="#008000"><tt><xsl:text>-- </xsl:text><xsl:apply-templates mode="listing"/></tt></font>
</xsl:template>

<xsl:template match="comment" mode="inline">
	<font color="#008000"><tt><xsl:text>-- </xsl:text><xsl:apply-templates mode="inline"/></tt></font>
</xsl:template>

<xsl:template match="compound">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="compound" mode="listing">
	<xsl:for-each select="*">
		<xsl:apply-templates select="." mode="indent"/>
		<xsl:apply-templates select="." mode="listing"/>
		<xsl:if test="position()!=last()">
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="compound" mode="inline">
	<xsl:for-each select="*">
		<xsl:apply-templates select="." mode="indent"/>
		<xsl:apply-templates select="." mode="inline"/>
		<xsl:if test="position()!=last()">
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="constructname">
	<tt><xsl:apply-templates/></tt>
</xsl:template>

<xsl:template match="copyright" mode="footer">
	<b>
	<xsl:text>Copyright &#169; </xsl:text>
	<xsl:for-each select="year">
		<xsl:apply-templates/>
		<xsl:text>, </xsl:text>
	</xsl:for-each>
	<xsl:for-each select="holder">
		<xsl:apply-templates/>
		<xsl:if test="position()!=last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:for-each>
	</b>
</xsl:template>

<xsl:template match="date" mode="footer">
	<b><xsl:text>Last Updated: </xsl:text></b>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="email" mode="footer">
	<b><xsl:text>mailto:</xsl:text></b>
	<a>
		<xsl:attribute name="href">
			<xsl:text>mailto:</xsl:text>
			<xsl:apply-templates/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="emphasis">
	<xsl:choose>
		<xsl:when test="@role='strong'">
			<i><b><xsl:apply-templates/></b></i>
		</xsl:when>
		<xsl:otherwise>
			<i><xsl:apply-templates/></i>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="entry" mode="tbody">
<td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="entry" mode="tfoot">
<td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="entry" mode="thead">
<td><xsl:value-of select="."/></td>
</xsl:template>

<xsl:template match="equal">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="equal" mode="listing">
	<xsl:for-each select="expression">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<tt><xsl:text> = </xsl:text></tt>
	<xsl:for-each select="expression">
		<xsl:if test="position()=last()">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="equal" mode="inline">
	<xsl:for-each select="expression">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<tt><xsl:text> = </xsl:text></tt>
	<xsl:for-each select="expression">
		<xsl:if test="position()=last()">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="expression">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="expression" mode="listing">
	<xsl:apply-templates select="*" mode="listing"/>
</xsl:template>

<xsl:template match="expression" mode="inline">
	<xsl:apply-templates select="*" mode="inline"/>
</xsl:template>

<xsl:template match="featurecall">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="featurecall" mode="listing">
	<xsl:if test="target">
		<xsl:apply-templates select="target" mode="listing"/>
		<tt><xsl:text>.</xsl:text></tt>
	</xsl:if>
	<xsl:apply-templates select="featurename" mode="listing"/>
	<xsl:if test="arguments">
		<tt><xsl:text> (</xsl:text></tt>
		<xsl:for-each select="arguments/*">
			<xsl:apply-templates select="." mode="listing"/>
			<xsl:if test="position()!=last()">
				<tt><xsl:text>, </xsl:text></tt>
			</xsl:if>
		</xsl:for-each>
		<tt><xsl:text>)</xsl:text></tt>
	</xsl:if>
</xsl:template>

<xsl:template match="featurecall" mode="inline">
	<xsl:if test="target">
		<xsl:apply-templates select="target" mode="inline"/>
		<tt><xsl:text>.</xsl:text></tt>
	</xsl:if>
	<xsl:apply-templates select="featurename" mode="inline"/>
	<xsl:if test="arguments">
		<tt><xsl:text> (</xsl:text></tt>
		<xsl:for-each select="arguments/*">
			<xsl:apply-templates select="." mode="inline"/>
			<xsl:if test="position()!=last()">
				<tt><xsl:text>, </xsl:text></tt>
			</xsl:if>
		</xsl:for-each>
		<tt><xsl:text>)</xsl:text></tt>
	</xsl:if>
</xsl:template>

<xsl:template match="featurename">
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
					<xsl:when test="ancestor::programlisting">
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
					<xsl:when test="ancestor::programlisting">
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
				<xsl:when test="ancestor::programlisting">
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

<xsl:template match="featurename" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="featurename" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<!-- berend: full support for function perhaps missing? -->
<xsl:template match="function">
  <span class="featurename-inline"><xsl:apply-templates mode="inline"/></span>
</xsl:template>

<xsl:template match="filename">
	<font color="#800000"><i><tt>
		<xsl:apply-templates/>
	</tt></i></font>
</xsl:template>

<xsl:template match="if">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="if" mode="listing">
	<i><b><tt><font color="#000080"><xsl:text>if</xsl:text></font></tt></b></i>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="expression" mode="listing"/>
	<xsl:call-template name="space"/>
	<i><b><tt><font color="#000080"><xsl:text>then</xsl:text></font></tt></b></i>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="compound">
		<xsl:if test="@role='then'">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="compound">
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

<xsl:template match="if" mode="inline">
	<i><b><tt><xsl:text>if</xsl:text></tt></b></i>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="expression" mode="inline"/>
	<xsl:call-template name="space"/>
	<i><b><tt><xsl:text>then</xsl:text></tt></b></i>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="compound">
		<xsl:if test="@role='then'">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:for-each select="compound">
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

<xsl:template match="mediaobjectco/imageobjectco">
	<p>
		<xsl:if test="imageobject/imagedata/@align">
			<xsl:attribute name="align">
				<xsl:value-of select="imageobject/imagedata/@align"/>
			</xsl:attribute>
		</xsl:if>
		<map>
			<xsl:attribute name="name">
				<xsl:value-of select="generate-id(.)"/>
			</xsl:attribute>
			<xsl:for-each select="areaspec/area">
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
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="imageobject/imagedata/@fileref"/>
			</xsl:attribute>
			<xsl:attribute name="usemap">
				<xsl:text>#</xsl:text><xsl:value-of select="generate-id(.)"/>
			</xsl:attribute>
		</img>
	</p>
</xsl:template>

<xsl:template match="infixname">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="infixname" mode="listing">
	<tt><i><b>infix</b></i><xsl:text> &quot;</xsl:text><i>
	<xsl:apply-templates mode="listing"/>
	</i><xsl:text>&quot;</xsl:text></tt>
</xsl:template>

<xsl:template match="infixname" mode="inline">
	<tt><i><b>infix</b></i><xsl:text> &quot;</xsl:text><i>
	<xsl:apply-templates mode="inline"/>
	</i><xsl:text>&quot;</xsl:text></tt>
</xsl:template>

<xsl:template match="informalexample">
	<blockquote>
		<xsl:apply-templates/>
	</blockquote>
</xsl:template>

<xsl:template match="integer">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="integer" mode="listing">
	<i><tt><font color="#808000">
	<xsl:apply-templates mode="listing"/>
	</font></tt></i>
</xsl:template>

<xsl:template match="integer" mode="inline">
	<i><tt>
	<xsl:apply-templates mode="inline"/>
	</tt></i>
</xsl:template>

<xsl:template match="itemizedlist">
	<ul>
		<xsl:for-each select="listitem">
			<li>
				<xsl:for-each select="*">
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

<xsl:template match="libraryname">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="link">
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

<xsl:template match="local">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="local" mode="listing">
	<i><tt><xsl:apply-templates mode="listing"/></tt></i>
</xsl:template>

<xsl:template match="local" mode="inline">
	<i><tt><xsl:apply-templates mode="inline"/></tt></i>
</xsl:template>

<xsl:template match="loop">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="loop" mode="listing">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<i><b><tt><font color="#000080"><xsl:text>from</xsl:text></font></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="*">
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
			<xsl:apply-templates select="until/expression" mode="listing"/>
			<xsl:call-template name="space"/>
			<i><b><tt><font color="#000080"><xsl:text>loop</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<i><b><tt><font color="#000080"><xsl:text>from</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="compound">
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
			<xsl:apply-templates select="until/expression" mode="listing"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><font color="#000080"><xsl:text>loop</xsl:text></font></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:for-each select="compound">
		<xsl:if test="@role='loop'">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><font color="#000080"><xsl:text>end</xsl:text></font></tt></b></i>
</xsl:template>

<xsl:template match="loop" mode="inline">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<i><b><tt><xsl:text>from</xsl:text></tt></b></i>
			<xsl:call-template name="space"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="*">
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
			<xsl:apply-templates select="until/expression" mode="inline"/>
			<xsl:call-template name="space"/>
			<i><b><tt><xsl:text>loop</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<i><b><tt><xsl:text>from</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="compound">
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
			<xsl:apply-templates select="until/expression" mode="inline"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<i><b><tt><xsl:text>loop</xsl:text></tt></b></i>
			<xsl:call-template name="newline"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:for-each select="compound">
		<xsl:if test="@role='loop'">
			<xsl:apply-templates select="." mode="inline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:call-template name="newline"/>
	<xsl:apply-templates select="." mode="indent"/>
	<i><b><tt><xsl:text>end</xsl:text></tt></b></i>
</xsl:template>

<xsl:template match="orderedlist">
	<ol>
		<xsl:for-each select="listitem">
			<li>
				<xsl:for-each select="*">
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

<xsl:template match="para">
	<p>
		<xsl:apply-templates/>
	</p>
</xsl:template>

<xsl:template match="projectname">
	<i><xsl:apply-templates/></i>
</xsl:template>

<xsl:template match="programlisting">
	<pre>
		<xsl:apply-templates/>
	</pre>
</xsl:template>

<xsl:template match="quote">
	<xsl:text>&#147;</xsl:text><xsl:apply-templates/><xsl:text>&#148;</xsl:text>
</xsl:template>

<xsl:template match="returnvalue">
  <span class="returnvalue-inline"><xsl:apply-templates/></span>
</xsl:template>

<xsl:template match="sect1">
	<xsl:if test="@id">
		<a>
			<xsl:attribute name="name">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
		</a>
	</xsl:if>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="row" mode="tbody">
<tr>
  <xsl:apply-templates select="entry" mode="tbody"/>
</tr>
</xsl:template>

<xsl:template match="row" mode="tfoot">
<tr>
  <xsl:apply-templates select="entry" mode="tfoot"/>
</tr>
</xsl:template>

<xsl:template match="row" mode="thead">
<tr>
  <xsl:apply-templates select="entry" mode="thead"/>
</tr>
</xsl:template>

<xsl:template match="sect1/title">
	<h2>
		<xsl:apply-templates/>
	</h2>
</xsl:template>


<xsl:template match="synopsis">
<pre>
<xsl:value-of select="."/>
</pre>
</xsl:template>

<xsl:template match="table">
<table alt="{title}">
  <caption><xsl:value-of select="title"/></caption>
  <col span="{tgroup/cols}"/>
  <!-- support only one group... -->
  <xsl:apply-templates select="tgroup/thead"/>
  <xsl:apply-templates select="tgroup/tfoot"/>
  <xsl:apply-templates select="tgroup/tbody"/>
</table>
</xsl:template>

<xsl:template match="target">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="target" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="target" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="tbody">
<tbody>
  <xsl:apply-templates select="row" mode="tbody"/>
</tbody>
</xsl:template>

<xsl:template match="tfoot">
<tfoot>
  <xsl:apply-templates select="row" mode="tfoot"/>
</tfoot>
</xsl:template>

<xsl:template match="thead">
<thead>
  <xsl:apply-templates select="row" mode="thead"/>
</thead>
</xsl:template>

<xsl:template match="true">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<font color="#008080">
				<xsl:apply-templates select="." mode="inline"/>
			</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="true" mode="listing">
	<i><tt><font color="#808000"><xsl:text>True</xsl:text></font></tt></i>
</xsl:template>

<xsl:template match="true" mode="inline">
	<i><tt><xsl:text>True</xsl:text></tt></i>
</xsl:template>

<xsl:template match="ulink">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="@url"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</a>
</xsl:template>

<xsl:template match="variablelist">
	<dl>
		<xsl:apply-templates/>
	</dl>
</xsl:template>

<xsl:template match="varlistentry">
	<dt>
		<xsl:for-each select="term">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</dt>
	<dd>
		<xsl:for-each select="listitem/*">
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

<xsl:template match="warning">
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

<xsl:template match="*" mode="indent">
		<!--
			Add indentation per nested compounds in programlisting.
		-->
	<xsl:for-each select="ancestor::compound">
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
	<xsl:choose>
		<xsl:when test="contains($linkend,'#')">
			<xsl:value-of select="concat(substring-before($linkend,'#'),'.html#',substring-after($linkend,'#'))"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="concat($linkend,'.html')"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
