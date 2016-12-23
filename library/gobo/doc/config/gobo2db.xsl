<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml"/>

<xsl:template match="anchor">
	<anchor>
		<xsl:attribute name="id">
			<xsl:value-of select="translate(concat(ancestor-or-self::chapter/@id,'.',@id),'_/','-.')"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</anchor>
</xsl:template>

<xsl:template match="area">
	<area>
		<xsl:attribute name="coords">
			<xsl:value-of select="@coords"/>
		</xsl:attribute>
		<xsl:attribute name="linkends">
			<xsl:call-template name="linked-to-id">
				<xsl:with-param name="linkend">
					<xsl:value-of select="@linkend"/>
				</xsl:with-param>
				<xsl:with-param name="chapter-id">
					<xsl:value-of select="ancestor-or-self::chapter/@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:apply-templates/>
	</area>
</xsl:template>

<xsl:template match="areaspec">
	<areaspec><xsl:apply-templates/></areaspec>
</xsl:template>

<xsl:template match="argument">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<function>
				<xsl:apply-templates select="." mode="inline"/>
			</function>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="argument" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="argument" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="assign">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="assign" mode="listing">
	<xsl:apply-templates select="target" mode="listing"/>
	<xsl:text> := </xsl:text>
	<xsl:apply-templates select="expression" mode="listing"/>
</xsl:template>

<xsl:template match="assign" mode="inline">
	<xsl:apply-templates select="target" mode="inline"/>
	<xsl:text> := </xsl:text>
	<xsl:apply-templates select="expression" mode="inline"/>
</xsl:template>

<xsl:template match="author">
	<author><xsl:apply-templates/></author>
</xsl:template>

<xsl:template match="blockquote">
	<blockquote><xsl:apply-templates/></blockquote>
</xsl:template>

<xsl:template match="chapter">
	<chapter>
		<xsl:attribute name="id">
			<xsl:value-of select="translate(concat(@id,'.top'),'_/','-.')"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</chapter>
</xsl:template>

<xsl:template match="chapterinfo">
	<docinfo><xsl:apply-templates/></docinfo>
</xsl:template>

<xsl:template match="citetitle">
	<citetitle>
		<xsl:if test="@pubwork">
			<xsl:attribute name="pubwork">
				<xsl:value-of select="@pubwork"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</citetitle>
</xsl:template>

<xsl:template match="classname">
	<xsl:choose>
		<xsl:when test="@linkend">
			<link>
				<xsl:attribute name="linkend">
					<xsl:call-template name="linked-to-id">
						<xsl:with-param name="linkend">
							<xsl:value-of select="@linkend"/>
						</xsl:with-param>
						<xsl:with-param name="chapter-id">
							<xsl:value-of select="ancestor-or-self::chapter/@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<classname><xsl:apply-templates/></classname>
			</link>
		</xsl:when>
		<xsl:when test="@flatshort='true'">
			<link>
				<xsl:attribute name="linkend">
					<xsl:call-template name="linked-to-id">
						<xsl:with-param name="linkend">
							<xsl:text>flatshort/</xsl:text>
							<xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
						</xsl:with-param>
						<xsl:with-param name="chapter-id">
							<xsl:value-of select="ancestor-or-self::chapter/@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<classname><xsl:apply-templates/></classname>
			</link>
		</xsl:when>
		<xsl:otherwise>
			<classname><xsl:apply-templates/></classname>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="comment">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="comment" mode="listing">
	<xsl:text>-- </xsl:text><xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="comment" mode="inline">
	<xsl:text>-- </xsl:text><xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="compound">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
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
	<literal><xsl:apply-templates/></literal>
</xsl:template>

<xsl:template match="copyright">
	<copyright><xsl:apply-templates/></copyright>
</xsl:template>

<xsl:template match="date">
	<date><xsl:apply-templates/></date>
</xsl:template>

<xsl:template match="email">
	<xsl:choose>
		<xsl:when test="parent::chapterinfo">
			<address><email><xsl:apply-templates/></email></address>
		</xsl:when>
		<xsl:otherwise>
			<email><xsl:apply-templates/></email>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="emphasis">
	<xsl:choose>
		<xsl:when test="ancestor::warning">
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<emphasis>
				<xsl:if test="@role">
					<xsl:attribute name="role">
						<xsl:value-of select="@role"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates/>
			</emphasis>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="entry">
	<entry><xsl:apply-templates/></entry>
</xsl:template>

<xsl:template match="equal">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="equal" mode="listing">
	<xsl:for-each select="expression">
		<xsl:if test="position()=1">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:text> = </xsl:text>
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
	<xsl:text> = </xsl:text>
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
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
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
			<function>
				<xsl:apply-templates select="." mode="inline"/>
			</function>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="featurecall" mode="listing">
	<xsl:if test="target">
		<xsl:apply-templates select="target" mode="listing"/>
		<xsl:text>.</xsl:text>
	</xsl:if>
	<xsl:apply-templates select="featurename" mode="listing"/>
	<xsl:if test="arguments">
		<xsl:text> (</xsl:text>
		<xsl:for-each select="arguments/*">
			<xsl:apply-templates select="." mode="listing"/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="featurecall" mode="inline">
	<xsl:if test="target">
		<xsl:apply-templates select="target" mode="inline"/>
		<xsl:text>.</xsl:text>
	</xsl:if>
	<xsl:apply-templates select="featurename" mode="inline"/>
	<xsl:if test="arguments">
		<xsl:text> (</xsl:text>
		<xsl:for-each select="arguments/*">
			<xsl:apply-templates select="." mode="inline"/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="featurename">
	<xsl:choose>
		<xsl:when test="@linkend">
			<link>
				<xsl:attribute name="linkend">
					<xsl:call-template name="linked-to-id">
						<xsl:with-param name="linkend">
							<xsl:value-of select="@linkend"/>
						</xsl:with-param>
						<xsl:with-param name="chapter-id">
							<xsl:value-of select="ancestor-or-self::chapter/@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::warning">
						<xsl:apply-templates select="." mode="inline"/>
					</xsl:when>
					<xsl:otherwise>
						<function>
							<xsl:apply-templates select="." mode="inline"/>
						</function>
					</xsl:otherwise>
				</xsl:choose>
			</link>
		</xsl:when>
		<xsl:when test="@flatshort">
			<link>
				<xsl:attribute name="linkend">
					<xsl:call-template name="linked-to-id">
						<xsl:with-param name="linkend">
							<xsl:text>flatshort/</xsl:text>
							<xsl:value-of select="translate(@flatshort,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
							<xsl:text>#</xsl:text>
							<xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
						</xsl:with-param>
						<xsl:with-param name="chapter-id">
							<xsl:value-of select="ancestor-or-self::chapter/@id"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="ancestor::programlisting">
						<xsl:apply-templates select="." mode="listing"/>
					</xsl:when>
					<xsl:when test="ancestor::warning">
						<xsl:apply-templates select="." mode="inline"/>
					</xsl:when>
					<xsl:otherwise>
						<function>
							<xsl:apply-templates select="." mode="inline"/>
						</function>
					</xsl:otherwise>
				</xsl:choose>
			</link>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="ancestor::programlisting">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:when>
				<xsl:when test="ancestor::warning">
					<xsl:apply-templates select="." mode="inline"/>
				</xsl:when>
				<xsl:otherwise>
					<function>
						<xsl:apply-templates select="." mode="inline"/>
					</function>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="featurename" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="featurename" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="filename">
	<filename>
		<xsl:if test="@class">
			<xsl:attribute name="class">
				<xsl:value-of select="@class"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</filename>
</xsl:template>

<xsl:template match="firstname">
	<firstname><xsl:apply-templates/></firstname>
</xsl:template>

<xsl:template match="imageobject/imagedata">
	<graphic>
		<xsl:if test="@align">
			<xsl:attribute name="align">
				<xsl:value-of select="@align"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:attribute name="fileref">
			<xsl:value-of select="@fileref"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</graphic>
</xsl:template>

<xsl:template match="mediaobjectco/imageobjectco">
	<graphicco><xsl:apply-templates/></graphicco>
</xsl:template>

<xsl:template match="holder">
	<holder><xsl:apply-templates/></holder>
</xsl:template>

<xsl:template match="if">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="if" mode="listing">
	<xsl:text>if</xsl:text>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="expression" mode="listing"/>
	<xsl:call-template name="space"/>
	<xsl:text>then</xsl:text>
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
			<xsl:text>else</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="listing"/>
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:apply-templates select="." mode="indent"/>
	<xsl:text>end</xsl:text>
</xsl:template>

<xsl:template match="if" mode="inline">
	<xsl:text>if</xsl:text>
	<xsl:call-template name="space"/>
	<xsl:apply-templates select="expression" mode="inline"/>
	<xsl:call-template name="space"/>
	<xsl:text>then</xsl:text>
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
			<xsl:text>else</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="inline"/>
			<xsl:call-template name="newline"/>
		</xsl:if>
	</xsl:for-each>
	<xsl:apply-templates select="." mode="indent"/>
	<xsl:text>end</xsl:text>
</xsl:template>

<xsl:template match="infixname">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<function>
				<xsl:apply-templates select="." mode="inline"/>
			</function>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="infixname" mode="listing">
	<xsl:text>infix &quot;</xsl:text>
	<xsl:apply-templates mode="listing"/>
	<xsl:text>&quot;</xsl:text>
</xsl:template>

<xsl:template match="infixname" mode="inline">
	<xsl:text>infix &quot;</xsl:text>
	<xsl:apply-templates mode="inline"/>
	<xsl:text>&quot;</xsl:text>
</xsl:template>

<xsl:template match="informalexample">
	<blockquote><informalexample>
		<xsl:apply-templates/>
	</informalexample></blockquote>
</xsl:template>

<xsl:template match="integer">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="integer" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="integer" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="itemizedlist">
	<itemizedlist><xsl:apply-templates/></itemizedlist>
</xsl:template>

<xsl:template match="libraryname">
	<application><xsl:apply-templates/></application>
</xsl:template>

<xsl:template match="link">
	<link>
		<xsl:attribute name="linkend">
			<xsl:call-template name="linked-to-id">
				<xsl:with-param name="linkend">
					<xsl:value-of select="@linkend"/>
				</xsl:with-param>
				<xsl:with-param name="chapter-id">
					<xsl:value-of select="ancestor-or-self::chapter/@id"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:attribute>
		<xsl:apply-templates/>
	</link>
</xsl:template>

<xsl:template match="listitem">
	<listitem><xsl:apply-templates/></listitem>
</xsl:template>

<xsl:template match="local">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<function>
				<xsl:apply-templates select="." mode="inline"/>
			</function>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="local" mode="listing">
	<xsl:apply-templates mode="listing"/>
</xsl:template>

<xsl:template match="local" mode="inline">
	<xsl:apply-templates mode="inline"/>
</xsl:template>

<xsl:template match="loop">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="loop" mode="listing">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<xsl:text>from</xsl:text>
			<xsl:call-template name="space"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="*">
						<xsl:apply-templates select="." mode="listing"/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="space"/>
			<xsl:text>until</xsl:text>
			<xsl:call-template name="space"/>
			<xsl:apply-templates select="until/expression" mode="listing"/>
			<xsl:call-template name="space"/>
			<xsl:text>loop</xsl:text>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>from</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:apply-templates select="." mode="listing"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:text>until</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:call-template name="indent"/>
			<xsl:apply-templates select="until/expression" mode="listing"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:text>loop</xsl:text>
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
	<xsl:text>end</xsl:text>
</xsl:template>

<xsl:template match="loop" mode="inline">
	<xsl:choose>
		<xsl:when test="@indent='false'">
			<xsl:text>from</xsl:text>
			<xsl:call-template name="space"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:for-each select="*">
						<xsl:apply-templates select="." mode="inline"/>
						<xsl:if test="position()!=last()">
							<xsl:text>; </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="space"/>
			<xsl:text>until</xsl:text>
			<xsl:call-template name="space"/>
			<xsl:apply-templates select="until/expression" mode="inline"/>
			<xsl:call-template name="space"/>
			<xsl:text>loop</xsl:text>
			<xsl:call-template name="newline"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>from</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:for-each select="compound">
				<xsl:if test="@role='from'">
					<xsl:apply-templates select="." mode="inline"/>
				</xsl:if>
			</xsl:for-each>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:text>until</xsl:text>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:call-template name="indent"/>
			<xsl:apply-templates select="until/expression" mode="inline"/>
			<xsl:call-template name="newline"/>
			<xsl:apply-templates select="." mode="indent"/>
			<xsl:text>loop</xsl:text>
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
	<xsl:text>end</xsl:text>
</xsl:template>

<xsl:template match="para">
	<para><xsl:apply-templates/></para>
</xsl:template>

<xsl:template match="projectname">
	<application><xsl:apply-templates/></application>
</xsl:template>

<xsl:template match="programlisting">
	<programlisting>
		<xsl:apply-templates/>
	</programlisting>
</xsl:template>

<xsl:template match="quote">
	<quote><xsl:apply-templates/></quote>
</xsl:template>

<xsl:template match="row">
	<row><xsl:apply-templates/></row>
</xsl:template>

<xsl:template match="sect1">
	<sect1>
		<xsl:if test="@id">
			<xsl:attribute name="id">
				<xsl:value-of select="translate(concat(ancestor-or-self::chapter/@id,'.',@id),'_/','-.')"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</sect1>
</xsl:template>

<xsl:template match="surname">
	<surname><xsl:apply-templates/></surname>
</xsl:template>

<xsl:template match="synopsis">
	<synopsis><xsl:apply-templates/></synopsis>
</xsl:template>

<xsl:template match="table">
	<table><xsl:apply-templates/></table>
</xsl:template>

<xsl:template match="target">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<function>
				<xsl:apply-templates select="." mode="inline"/>
			</function>
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
	<tbody><xsl:apply-templates/></tbody>
</xsl:template>

<xsl:template match="term">
	<term><xsl:apply-templates/></term>
</xsl:template>

<xsl:template match="tfoot">
	<tfoot><xsl:apply-templates/></tfoot>
</xsl:template>

<xsl:template match="tgroup">
	<tgroup><xsl:apply-templates/></tgroup>
</xsl:template>

<xsl:template match="thead">
	<thead><xsl:apply-templates/></thead>
</xsl:template>

<xsl:template match="title">
	<title><xsl:apply-templates/></title>
</xsl:template>

<xsl:template match="true">
	<xsl:choose>
		<xsl:when test="ancestor::programlisting">
			<xsl:apply-templates select="." mode="listing"/>
		</xsl:when>
		<xsl:otherwise>
			<literal>
				<xsl:apply-templates select="." mode="inline"/>
			</literal>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="true" mode="listing">
	<xsl:text>True</xsl:text>
</xsl:template>

<xsl:template match="true" mode="inline">
	<xsl:text>True</xsl:text>
</xsl:template>

<xsl:template match="ulink">
	<ulink>
		<xsl:attribute name="url">
			<xsl:value-of select="@url"/>
		</xsl:attribute>
		<xsl:apply-templates/>
	</ulink>
</xsl:template>

<xsl:template match="variablelist">
	<variablelist><xsl:apply-templates/></variablelist>
</xsl:template>

<xsl:template match="varlistentry">
	<varlistentry><xsl:apply-templates/></varlistentry>
</xsl:template>

<xsl:template match="warning">
	<warning>
		<xsl:apply-templates/>
	</warning>
</xsl:template>

<xsl:template match="year">
	<year><xsl:apply-templates/></year>
</xsl:template>




<xsl:template name="indent">
		<!--
			Indentation in programlisting.
		-->
	<xsl:text>    </xsl:text>
</xsl:template>

<xsl:template name="newline">
		<!--
			New-line in programlisting.
		-->
<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template name="space">
		<!--
			Space character in programlisting.
		-->
	<xsl:text> </xsl:text>
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





<xsl:template name="linked-to-id">
		<!--
			Replace linkend by id.
			For example:
				linkend: xxx/yyy
				chapter-id: aaa/bbb
				result: aaa.xxx.yyy.top
			Another example:
				linkend: ../xxx/yyy#zzz
				chapter-id: aaa/bbb/ccc
				result: aaa.xxx.yyy.zzz
		-->
	<xsl:param name="linkend"/>
	<xsl:param name="chapter-id"/>
	<xsl:choose>
		<xsl:when test="starts-with($linkend,'../')">
			<xsl:variable name="new-linkend">
				<xsl:value-of select="substring-after($linkend,'../')"/>
			</xsl:variable>
			<xsl:variable name="new-chapter-id">
				<xsl:call-template name="dirname">
					<xsl:with-param name="file">
						<xsl:value-of select="$chapter-id"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:call-template name="linked-to-id">
				<xsl:with-param name="linkend">
					<xsl:value-of select="$new-linkend"/>
				</xsl:with-param>
				<xsl:with-param name="chapter-id">
					<xsl:value-of select="$new-chapter-id"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="chapter-dirname">
				<xsl:call-template name="dirname">
					<xsl:with-param name="file">
						<xsl:value-of select="$chapter-id"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
			<xsl:variable name="full-linkend">
				<xsl:choose>
					<xsl:when test="$chapter-dirname=''">
						<xsl:value-of select="$linkend"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($chapter-dirname,'/',$linkend)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="contains($full-linkend,'#')">
					<xsl:value-of select="translate($full-linkend,'#/_','..-')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="translate(concat($full-linkend,'.top'),'/_','.-')"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="dirname">
		<!--
			Dirname of a file.
			For example:
				file: xxx/yyy
				result: xxx
			Another example:
				file: xxx
				result: 
		-->
	<xsl:param name="file"/>
	<xsl:if test="contains($file,'/')">
		<xsl:value-of select="substring-before($file,'/')"/>
		<xsl:if test="contains(substring-after($file,'/'),'/')">
			<xsl:text>/</xsl:text>
			<xsl:call-template name="dirname">
				<xsl:with-param name="file">
					<xsl:value-of select="substring-after($file,'/')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
