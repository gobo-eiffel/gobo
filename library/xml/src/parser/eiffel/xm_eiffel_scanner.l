%{
note

	description: 

		"Scanners for an XML parser"

	implements: "XML 1.0 Second Edition - W3C Recommendation 6 October 2000 (referred as 'XML1.0')"
	noncompliance_unicode: "UTF8 is assumed and all chars >255 are assumed to be LETTERS"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

	-- TODO:
	-- system literal accepts non-CHAR
	-- use NOAPOSCHAR/NOQUOTCHAR for attribute value?

class XM_EIFFEL_SCANNER

inherit

	XM_EIFFEL_SCANNER_SKELETON

create

	make_scanner

%}


-- XML1.0:85 non-conformance: unicode letters
-- XML1.0:88 non-conformance: unicode digits
-- XML1.0:89 extender &xb7; + unicode

APOS [']
QUOT ["]
SPACECHAR [\r\n\t ]

NOSPASCIICHAR [\x21-\x7F]
UTF8CHAR (([\xC2-\xDF][\x80-\xBF])|(\xE0[\xA0-\xBF][\x80-\xBF])|([\xE1-\xEF][\x80-\xBF][\x80-\xBF])|(\xF0[\x90-\xBF][\x80-\xBF][\x80-\xBF])|([\xF1-\xF7][\x80-\xBF][\x80-\xBF][\x80-\xBF]))

-- CHARUTF8 only accepts legal UTF8 sequences.
--
-- this include disallowing sequence encoding below the minimum number of
-- bits, so the data part may not be zero in either the first or 
-- the second byte of the encoding.
--
--          zero		  min           max            first trail   trail  min   total
-- 2 bytes  -			  110 00010 C2  110 11111 DF   10000000 80   6      8     11
-- 3 bytes  1110 0000 E0  1110 0001 E1  1110 1111 EF   10100000 A0   12     12    16
-- 4 bytes  11110 000 F0  11110 001 F1  11110 111 F7   10010000 90   18     17    21
-- trail                  10 000000 80  10 111111 BF
--
-- open issue: disable surrogates, max char 10FFFF?


XMLENCODING [a-zA-Z0-9\x2D]+

CONTENTCHARASCII [\x21-\x25\x27-\x3B\x3D-\X5C\x5E-\x7F]
-- = NOSPASCIICHAR less &<]

PIASCIICHAR [\x21-\x3E\x40-\x7F]
-- = NOSPASCIICHAR less "?" = \x3F

CDATAASCIICHAR [\t\x20-\x5C\x5E-\x7F]
-- = SPACECHAR less \r\n, NOSPASCIICHAR less ]

COMMENTASCIICHAR [\x20-\x2C\x2E-\x7F]
-- = NOSPASCIICHAR less -, " "

ATTRIBUTECHAR [\x21\x23-\x25\x28-\x3B\x3D-\x7F]
-- = NOSPASCIICHAR less " & ' <

ENTITYCHAR [\x21\x23\x24\x28-\x7F]
-- = NOSPASCIICHAR less " % & ' 

NAMECHAR [:A-Za-z0-9._\-]
NAMECHAR_NOCOLON [A-Za-z0-9._\-]

NAMECHAR_FIRST [:A-Za-z_]
NAMECHAR_FIRST_NOCOLON [A-Za-z_]


-- PUBIDLITERAL class has no ' when starting with '
-- SYSTEMLITERAL class is CHAR - quote

PUBIDLITERAL ((['][ \r\na-zA-Z0-9\-()+,./:=?;!*#@$_%]*['])|(["][' \r\na-zA-Z0-9\-()+,./:=?;!*#@$_%]*["]))

NOAPOSSYSLITCHAR [\r\n\t\x20-&(-\x7F]
NOQUOTSYSLITCHAR [\r\n\t\x20-!#-\x7F]

%x comment_state
%x processinginstruction
%x xmldeclaration
%x cdata
%x tag
%x attribute_value_single
%x attribute_value_double
%x entity_value_single
%x entity_value_double
%x doctype
%x public_system
%x dtd_in
%x dtd_element
%x dtd_attlist
%x dtd_entity
%x dtd_notation
%x dtd_ignore

%option line position nodefault

%%

-- Useless rule for avoiding SmartEiffel empty-when bug.
-- obsolete Gobo 2.0 and new SmartEiffel
--<*><<EOF>> { terminate }

-- Comment

<initial,doctype>
	{
		"<!--" { 
			set_last_token (COMMENT_START)
			push_start_condition (comment_state)
		}
	}

<comment_state>
	{ 
		"-->" {
			set_last_token (COMMENT_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		
		"--" { 
			set_last_token (COMMENT_DASHDASH) -- conformance error XML1.0:2.5
			last_value := text
		}
		
		({SPACECHAR})+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		
		({COMMENTASCIICHAR})+ {
			set_last_token (CHARDATA)
			last_value := text
		}
			
		({COMMENTASCIICHAR}|{UTF8CHAR})+ {
			set_last_token (CHARDATA_UTF8)
			last_value := text
		}
		
		"-" {
			set_last_token (CHARDATA)
			last_value := text
		}
	}

-- Processing Instruction and XML Declaration.


<initial,doctype>{

		"<?xml"{SPACECHAR}+ {
			set_last_token (XMLDECLARATION_START)
			push_start_condition (xmldeclaration)
		}

		"<?"[Xx][Mm][Ll]({SPACECHAR}+|"?>") {
				-- "<?xml" matched by previous rule when allowed.
			set_last_token (PI_RESERVED)
		}
		"<?" {
				-- <?xml caught by previous rules.
			set_last_token (PI_START)
			push_start_condition (processinginstruction)
		}
	}

<xmldeclaration> 
	{
		"?>" {
			set_last_token (XMLDECLARATION_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}

			-- Version declaration.
		"version" {
			set_last_token (XMLDECLARATION_VERSION)
		}

		"1.0" {
			set_last_token (XMLDECLARATION_VERSION_10)
			last_value := text
		}

			-- Standalone declaration.
		"standalone" {
			set_last_token (XMLDECLARATION_STANDALONE) 
		}
		
		"yes" {
			set_last_token (XMLDECLARATION_STANDALONE_YES)
			last_value := text
		}
		
		"no" {
			set_last_token (XMLDECLARATION_STANDALONE_NO)
			last_value := text
		}

			-- Encoding
		"encoding" {
			set_last_token (XMLDECLARATION_ENCODING)
		}
			
		{XMLENCODING} {
			-- 'yes' 'no' '1.0' caught by previous rules
			set_last_token (XMLDECLARATION_ENCODING_VALUE)
			last_value := text
		}

		"=" {
			set_last_token (EQ)
		}
		
		{APOS} {
			set_last_token (APOS)
		}
		
		{QUOT} {
			set_last_token (QUOT)
		}

		{SPACECHAR}+ { 
			set_last_token (SPACE) 
		}
	}

<processinginstruction>
	{
		"?>" {
			set_last_token (PI_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		{NAMECHAR_FIRST}{NAMECHAR}* {
			set_last_token (PI_TARGET)
			last_value := text
		}
		
		({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})* {
			set_last_token (PI_TARGET_UTF8)
			last_value := text
		}
		
		{SPACECHAR}+ {
			set_last_token (SPACE)
			last_value := text
		}
		({PIASCIICHAR})+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		({PIASCIICHAR}|{UTF8CHAR})+ {
			set_last_token (CHARDATA_UTF8)
			last_value := text
		}
		-- stand alone "?"
		"?" { 
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

-- CDATA section.

"<![CDATA[" {
	set_last_token (CDATA_START)
	push_start_condition (cdata)
}

<cdata> 
	{
		"]]>" { 
			set_last_token (CDATA_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		("\r\n"|"\r"|"\n") {
				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		}
		-- ASCIICHAR less ]
		({CDATAASCIICHAR})+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		({CDATAASCIICHAR}|{UTF8CHAR})+ {
				-- Big chunks in `last_value'.
			set_last_token (CHARDATA_UTF8)
			last_value := text
		}
		-- standalone "]"
		"]" { 
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

"<!DOCTYPE" {
		set_last_token (DOCTYPE_START)
		push_start_condition (dtd_in)
	}

<dtd_attlist>
	{
		"#REQUIRED" { set_last_token (DOCTYPE_REQUIRED) }
		"#IMPLIED" { set_last_token (DOCTYPE_IMPLIED) }
		"#FIXED" { set_last_token (DOCTYPE_FIXED) }
		"CDATA" {
			set_last_token (DOCTYPE_ATT_CDATA) 
			last_value := text
		}
		"ID" {
			set_last_token (DOCTYPE_ATT_ID) 
			last_value := text
		}
		"IDREF" {
			set_last_token (DOCTYPE_ATT_IDREF)
			last_value := text
		}
		"IDREFS" {
			set_last_token (DOCTYPE_ATT_IDREFS)
			last_value := text
		}
		"ENTITY" {
			set_last_token (DOCTYPE_ATT_ENTITY)
			last_value := text
		}
		"ENTITIES" {
			set_last_token (DOCTYPE_ATT_ENTITIES) 
			last_value := text
		}
		"NMTOKEN" {
			set_last_token (DOCTYPE_ATT_NMTOKEN) 
			last_value := text
		}
		"NMTOKENS" {
			set_last_token (DOCTYPE_ATT_NMTOKENS)
			last_value := text
		}
		"NOTATION" {
			set_last_token (DOCTYPE_ATT_NOTATION)
			last_value := text
		}
		{APOS} {
			set_last_token (VALUE_START)
			push_start_condition (attribute_value_single)
		}
		{QUOT} {
			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		}
	}

<dtd_in>
	{
		"[" {
			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype)
		}
	}

<doctype>
	{
		-- NAME matches: "SYSTEM" "PUBLIC".

		"[" {
			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype) -- Same, but balances end.
		}

		"]" {
			set_last_token (DOCTYPE_DECLARATION_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}

		"<!ELEMENT" {
			set_last_token (DOCTYPE_ELEMENT)
			push_start_condition (dtd_element)
		}
		"<!ATTLIST" {
			set_last_token (DOCTYPE_ATTLIST)
			push_start_condition (dtd_attlist)
		}
		"<!ENTITY" {
			set_last_token (DOCTYPE_ENTITY)
			push_start_condition (dtd_entity)
		}
		"<!NOTATION" {
			set_last_token (DOCTYPE_NOTATION)
			push_start_condition (dtd_notation)
		}

		"IGNORE" {
			set_last_token (DOCTYPE_IGNORE)
			last_value := text
		}

		"INCLUDE" {
			set_last_token (DOCTYPE_INCLUDE)
			last_value := text
		}

		"<![" {
			set_last_token (DOCTYPE_CONDITIONAL_START)
		}

		"]]>" {
			set_last_token (DOCTYPE_CONDITIONAL_END)
		}
	}

<dtd_ignore> 
	{
		"<![" {
			set_last_token (DOCTYPE_CONDITIONAL_START)
			push_start_condition (dtd_ignore) -- Self, for exit.
		}

		"]]>" {
			set_last_token (DOCTYPE_CONDITIONAL_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}

		({NOSPASCIICHAR}|{UTF8CHAR}) {
			set_last_token (CHARDATA)
		}

		{SPACECHAR} {
			set_last_token (CHARDATA) 
		}
	}

<dtd_element>
	{
		"#PCDATA" { set_last_token (DOCTYPE_PCDATA) }

		"EMPTY" {
			set_last_token (DOCTYPE_ELEMENT_EMPTY)
			last_value := text
		}

		"ANY" {
			set_last_token (DOCTYPE_ELEMENT_ANY)
			last_value := text
		}
	}

<dtd_entity>
	{
		"NDATA" {
			set_last_token (DOCTYPE_NDATA)
			last_value := text
		}
	}

<doctype, dtd_in, dtd_element, dtd_attlist, dtd_entity, dtd_notation> 
	{
		">" { 
			set_last_token (DOCTYPE_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}

		{NAMECHAR_FIRST}{NAMECHAR}* { 
			set_last_token (NAME) 
			last_value := text
		}
		({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})* { 
			set_last_token (NAME_UTF8) 
			last_value := text
		}
		{SPACECHAR}+ {
			set_last_token (SPACE)
		}
	}

<doctype, dtd_in, dtd_entity, dtd_notation> {

		-- `system_literal_text' does microparsing of last quoted 
		-- value. Inelegant to do microparsing in a scanner, but 
		-- PUBLIC and SYSTEM are not keywords and can also be 
		-- names. The quoted values after PUBLIC and SYSTEM also 
		-- match quoted values which are not literals, but 
		-- they allow a different character set.

		-- Problem: if declaration merged from processing entity 
		-- (PE cuts on space token boundaries).

		"SYSTEM"{SPACECHAR}+(([']{NOAPOSSYSLITCHAR}*['])|(["]{NOQUOTSYSLITCHAR}*["])) {
			set_last_token (DOCTYPE_SYSTEM)
			last_value := system_literal_text
		}

		"SYSTEM"{SPACECHAR}+(([']({NOAPOSSYSLITCHAR}|{UTF8CHAR})*['])|(["]({NOQUOTSYSLITCHAR}|{UTF8CHAR})*["])) {
			set_last_token (DOCTYPE_SYSTEM_UTF8)
			last_value := system_literal_text
		}
		
		"PUBLIC"{SPACECHAR}+{PUBIDLITERAL} {
			set_last_token (DOCTYPE_PUBLIC)
			last_value := system_literal_text
			push_start_condition (public_system)
		}

	}

<public_system> {
		{SPACECHAR}+(([']{NOAPOSSYSLITCHAR}*['])|(["]{NOQUOTSYSLITCHAR}*["])) {
				set_last_token (DOCTYPE_SYSTEM)
				last_value := system_literal_text
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
			}
		
		{SPACECHAR}+(([']({NOAPOSSYSLITCHAR}|{UTF8CHAR})*['])|(["]({NOQUOTSYSLITCHAR}|{UTF8CHAR})*["])) {
				set_last_token (DOCTYPE_SYSTEM_UTF8)
				last_value := system_literal_text
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
			}

		-- this covers the case of dtd_notation, which allows a PUBLIC id with or without 
		-- a system part. When there is no system part, DOCTYPE_END is the only valid token.
		-- If there is a system part, the next token is handled by the regular 
		-- DTD notation.
		{SPACECHAR}*">" {
				set_last_token (DOCTYPE_END)
				if pushed_start_condition_count > 0 then
					pop_start_condition
				else
					-- Error, to be reported later in parser hopefully.
				end
				if pushed_start_condition_count > 0 then
					pop_start_condition -- go out of dtd_notation
				else
					-- Error, to be reported later in parser hopefully.
				end
			}
		
		"\n" {
				-- the global INPUT_INVALID does not catch \n, which is caught
				-- explicitly under other start conditions.
			set_last_token (INPUT_INVALID)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
	}
	
<dtd_element, dtd_attlist>
	{
		"|" { set_last_token (DOCTYPE_GROUP_OR) }
		"," { set_last_token (DOCTYPE_GROUP_SEQ) }
		"(" { set_last_token (DOCTYPE_GROUP_START) }
		")" { set_last_token (DOCTYPE_GROUP_END) }
		"?" { set_last_token (DOCTYPE_GROUP_ZEROONE) }
		"*" { set_last_token (DOCTYPE_GROUP_ANY) }
		"+" { set_last_token (DOCTYPE_GROUP_ONEMORE) }

		{NAMECHAR}+ {
			set_last_token (NMTOKEN) 
			last_value := text
		}
		({NAMECHAR}|{UTF8CHAR})+ {
			set_last_token (NMTOKEN_UTF8) 
			last_value := text
		}
	}

<dtd_entity>
	{
		"%" { 
			set_last_token (DOCTYPE_PERCENT) 
		}
		{APOS} {
			set_last_token (VALUE_START)
			push_start_condition (entity_value_single)
		}
		{QUOT} {
			set_last_token (VALUE_START)
			push_start_condition (entity_value_double)
		}
	}

<doctype,dtd_element,dtd_attlist> -- Also entity/notation?
	{
		"%"{NAMECHAR_FIRST}{NAMECHAR}*";" {
			set_last_token (DOCTYPE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		}
		
		"%"({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})*";" {
			set_last_token (DOCTYPE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		}
		"%" {
			set_last_token (ENTITY_INVALID)
		}
	}

<entity_value_single,entity_value_double>
	{
		"%"{NAMECHAR_FIRST}{NAMECHAR}*";" {
			set_last_token (ENTITYVALUE_PEREFERENCE)
			last_value := text_substring (2, text_count - 1)
		}
		"%"({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})*";" {
			set_last_token (ENTITYVALUE_PEREFERENCE_UTF8)
			last_value := text_substring (2, text_count - 1)
		}
	}

<doctype,dtd_element,dtd_attlist,entity_value_single,entity_value_double>
	{
		"%" {
			set_last_token (ENTITY_INVALID)
		}
	}

-- Elements.

"</" {
	set_last_token (TAG_START_END)
	push_start_condition (tag)
}

"<" {
	set_last_token (TAG_START)
	push_start_condition (tag)
}

<tag>
	{
		{SPACECHAR}*"/>" {
			set_last_token (TAG_END_EMPTY)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}

		{SPACECHAR}*">" { 
			set_last_token (TAG_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		-- Name decomposed for easier parsing of namespaces into:
		-- (Name - ':') ':' (NmToken - ':') ...
		":" {
			 set_last_token (TAG_NAME_COLON) 
		}
		{NAMECHAR_FIRST_NOCOLON}{NAMECHAR_NOCOLON}* { 
			set_last_token (TAG_NAME_FIRST)
			last_value := text
		}
		({NAMECHAR_FIRST_NOCOLON}|{UTF8CHAR})({NAMECHAR_NOCOLON}|{UTF8CHAR})* { 
			set_last_token (TAG_NAME_FIRST_UTF8)
			last_value := text
		}
		{NAMECHAR_NOCOLON}+ { 
			set_last_token (TAG_NAME_ATOM) 
			last_value := text
		}
		({NAMECHAR_NOCOLON}|{UTF8CHAR})+ { 
			set_last_token (TAG_NAME_ATOM_UTF8) 
			last_value := text
		}
		{SPACECHAR}+ {
			set_last_token (SPACE) 
		}
		{SPACECHAR}*"="{SPACECHAR}* {
			set_last_token (EQ) 
		}

		{APOS} { 
			set_last_token (VALUE_START) 
			push_start_condition (attribute_value_single)
		}
		{QUOT} {
			set_last_token (VALUE_START)
			push_start_condition (attribute_value_double)
		}
	}

-- Entities.


-- Named entities are not interpreted in an 'entity_value'.

<initial,attribute_value_single,attribute_value_double>
	{
		"&apos;" {
				set_last_token (CHARDATA)
				last_value := "%'"
			}
		"&quot;" {
				set_last_token (CHARDATA)
				last_value := "%""
			}
		"&lt;" {
				set_last_token (CHARDATA)
				last_value := "<"
			}
		"&gt;" {
				set_last_token (CHARDATA)
				last_value := ">"
			}
		"&amp;" {
				set_last_token (CHARDATA)
				last_value := "&"
			}
	}

<initial>
	{
		"&"{NAMECHAR_FIRST}{NAMECHAR}*";" { 
				set_last_token (CONTENT_ENTITY) 
				last_value := text_substring (2, text_count - 1)
			}
		"&"({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})*";" { 
				set_last_token (CONTENT_ENTITY_UTF8) 
				last_value := text_substring (2, text_count - 1)
			}
	}

<entity_value_single,entity_value_double>
	{
		"&"{NAMECHAR_FIRST}{NAMECHAR}*";" { 
				set_last_token (CHARDATA) -- Bypassed
				last_value := text
			}
		"&"({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})*";" { 
				set_last_token (CHARDATA_UTF8) -- Bypassed
				last_value := text
			}

		-- Double quote and single quote char entities not interpreted
		-- as char entities XML1.0:4.4.5
		("&#34;"|"&#x22;"|"&#39;"|"&#x27;") {
			set_last_token (CHARDATA)
			last_value := text
		}
	}

<attribute_value_single, attribute_value_double>
	{
		"&"{NAMECHAR_FIRST}{NAMECHAR}*";" { 
				set_last_token (ATTRIBUTE_ENTITY)
				last_value := text_substring (2, text_count - 1)
			}
		"&"({NAMECHAR_FIRST}|{UTF8CHAR})({NAMECHAR}|{UTF8CHAR})*";" { 
				set_last_token (ATTRIBUTE_ENTITY_UTF8)
				last_value := text_substring (2, text_count - 1)
			}

		"<" {
			set_last_token (ATTRIBUTE_LT) -- Conformance error.
			last_value := text
		}
		"\r\n" {
				-- XML1.0:3.3.3 Attribute value normalization.
			set_last_token (CHARDATA)
			if has_normalized_newline then
				last_value := two_normalized_spaces
			else
				last_value := normalized_space
			end
		}
		{SPACECHAR} {
				-- XML1.0:3.3.3 Attribute value normalization.
			set_last_token (CHARDATA)
			last_value := normalized_space
		}
		{ATTRIBUTECHAR}+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		({ATTRIBUTECHAR}|{UTF8CHAR})+ {
			set_last_token (CHARDATA_UTF8)
			last_value := text
		}
	}

<initial,attribute_value_single,attribute_value_double,entity_value_single,entity_value_double>
	{
		"&#"[0-9]+";" { 
			character_entity.from_decimal (text_substring (3, text_count - 1))
			if character_entity.is_valid then
				if character_entity.is_ascii then
					set_last_token (CHARDATA)
				else
					set_last_token (CHARDATA_UTF8)
				end
				last_value := character_entity.to_utf8
			else
				set_last_token (ENTITY_INVALID)
			end
		}

		"&#x"[0-9a-fA-F]+";" {
			character_entity.from_hexadecimal (text_substring (4, text_count - 1))
			if character_entity.is_valid then
				if character_entity.is_ascii then
					set_last_token (CHARDATA)
				else
					set_last_token (CHARDATA_UTF8)
				end
				last_value := character_entity.to_utf8
			else
				set_last_token (ENTITY_INVALID)
			end
		}


		"&" {
			set_last_token (ENTITY_INVALID)
			last_value := text
		}
	}

<entity_value_single, entity_value_double>
	{
		("\r\n"|"\r"|"\n") {
				-- End of line handling XML1.0:2.11.
			set_last_token (CHARDATA)
			last_value := normalized_newline
		}
		{SPACECHAR}+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		({ENTITYCHAR})+ {
			set_last_token (CHARDATA)
			last_value := text
		}
		({ENTITYCHAR}|{UTF8CHAR})+ {
			set_last_token (CHARDATA_UTF8)
			last_value := text
		}
	}

<attribute_value_single, entity_value_single>
	{
		{APOS} { 
			set_last_token (VALUE_END) 
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		{QUOT} {
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

<attribute_value_double, entity_value_double>
	{
		{QUOT} {
			set_last_token (VALUE_END)
			if pushed_start_condition_count > 0 then
				pop_start_condition
			else
				-- Error, to be reported later in parser hopefully.
			end
		}
		{APOS} {
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

-- Content.

"]]>" {
		-- XML1.0:14 ]]> not allowed in markup.
	last_token := CONTENT_CONDITIONAL_END
	last_value := text
}

\r\n {
		-- End of line handling XML1.0:2.11.
	set_last_token (SPACE)
	last_value := normalized_newline
}

\r { 
	set_last_token (SPACE) 
	last_value := normalized_newline
}

\n {
	set_last_token (SPACE) 
	last_value := normalized_newline
}

[ \t]+ {
		-- Space not matched by newline normalization.
	set_last_token (SPACE)
	last_value := text
}

{CONTENTCHARASCII}+ { 
	set_last_token (CHARDATA)
	last_value := text
}

({CONTENTCHARASCII}|{UTF8CHAR})+ { 
	set_last_token (CHARDATA_UTF8)
	last_value := text
}

"]" {
	set_last_token (CHARDATA)
	last_value := text
}

<*>. {
		-- Default rule.
	set_last_token (INPUT_INVALID)
	last_value := text
}

%%

end
