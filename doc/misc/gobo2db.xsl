<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml"/>

<xsl:template match="anchor">
	<anchor>
		<xsl:attribute name="id">
			<xsl:value-of select="@id"/>
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
			<xsl:value-of select="translate(@linkend,'_','-')"/>
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
			<xsl:value-of select="translate(@id,'_','-')"/>
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
	<classname><xsl:apply-templates/></classname>
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
			<xsl:apply-templates mode="listing"/>
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
			<xsl:apply-templates mode="inline"/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template match="featurename">
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
			<xsl:value-of select="translate(@linkend,'_','-')"/>
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

<xsl:template match="sect1">
	<sect1>
		<xsl:if test="@id">
			<xsl:attribute name="id">
				<xsl:value-of select="translate(@id,'_','-')"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:apply-templates/>
	</sect1>
</xsl:template>

<xsl:template match="surname">
	<surname><xsl:apply-templates/></surname>
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

<xsl:template match="term">
	<term><xsl:apply-templates/></term>
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

</xsl:stylesheet>
