%{
note

	description: 

		"Scanners for an XML parser"

	implements: "XML 1.0 Second Edition - W3C Recommendation 6 October 2000 (referred as 'XML1.0')"
	noncompliance_unicode: "UTF8 is assumed and all chars >255 are assumed to be LETTERS"

	library: "Gobo Eiffel XML library"
	copyright: "Copyright (c) 2002-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

	-- TODO:
	-- system literal accepts non-CHAR
	-- use NOAPOSCHAR/NOQUOTCHAR for attribute value?

class XM_EIFFEL_SCANNER

inherit

	XM_EIFFEL_SCANNER_SKELETON
		redefine
			read_token
		end

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
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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
				pop_start_condition
			}
		
		{SPACECHAR}+(([']({NOAPOSSYSLITCHAR}|{UTF8CHAR})*['])|(["]({NOQUOTSYSLITCHAR}|{UTF8CHAR})*["])) {
				set_last_token (DOCTYPE_SYSTEM_UTF8)
				last_value := system_literal_text
				pop_start_condition
			}

		-- this covers the case of dtd_notation, which allows a PUBLIC id with or without 
		-- a system part. When there is no system part, DOCTYPE_END is the only valid token.
		-- If there is a system part, the next token is handled by the regular 
		-- DTD notation.
		{SPACECHAR}*">" {
				set_last_token (DOCTYPE_END)
				pop_start_condition
				pop_start_condition -- go out of dtd_notation
			}
		
		"\n" {
				-- the global INPUT_INVALID does not catch \n, which is caught
				-- explicitly under other start conditions.
			set_last_token (INPUT_INVALID)
			pop_start_condition
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
			pop_start_condition
		}

		{SPACECHAR}*">" { 
			set_last_token (TAG_END) 
			pop_start_condition
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
			pop_start_condition
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
			pop_start_condition
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

feature -- Scanning

	read_token is
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_COMPRESSED_SCANNER_SKELETON CLASS, FOR OPTIMISATION
			-- WITH ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_COMPRESSED_SCANNER_SKELETON).)

			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		local
			yy_cp, yy_bp: INTEGER
			yy_current_state: INTEGER
			yy_next_state: INTEGER
			yy_matched_count: INTEGER
			yy_act: INTEGER
			yy_goto: INTEGER
			yy_c: INTEGER
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
			yy_done: BOOLEAN
			l_content_area: like yy_content_area
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast scanning routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				last_token := yyUnknown_token
				yy_goto := yyNext_token
			until
				last_token /= yyUnknown_token
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := yy_end - yy_start
						yy_more_flag := False
					else
						yy_more_len := 0
						line := yy_line
						column := yy_column
						position := yy_position
					end
					yy_cp := yy_end
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
					-- START INLINING 'yy_at_beginning_of_line'
					-- yy_current_state := yy_start_state + yy_at_beginning_of_line
					if input_buffer.beginning_of_line then
						yy_current_state := yy_start_state + 1
					else
						yy_current_state := yy_start_state
					end
					-- END INLINING 'yy_at_beginning_of_line'
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						yy_state_stack.put (yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
					l_content_area := yy_content_area
						-- Find the next match.
					from
						yy_done := False
					until
						yy_done
					loop
						if yy_ec /= Void then
							if l_content_area /= Void then
								yy_c := yy_ec.item (l_content_area.item (yy_cp).code)
							else
								yy_c := yy_ec.item (yy_content.item (yy_cp).code)
							end
						else
							if l_content_area /= Void then
								yy_c := l_content_area.item (yy_cp).code
							else
								yy_c := yy_content.item (yy_cp).code
							end
						end
						if
							not yyReject_or_variable_trail_context and then
							yy_accept.item (yy_current_state) /= 0
						then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if
								yy_meta /= Void and then
								yy_current_state >= yyTemplate_mark
							then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_stack.put (yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
						yy_done := (yy_current_state = yyJam_state)
					end
					if not yyReject_or_variable_trail_context then
							-- Do the guaranteed-needed backing up
							-- to find out the match.
						yy_cp := yy_last_accepting_cpos
						yy_current_state := yy_last_accepting_state
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
						yy_goto := yyDo_action
					else
						yy_state_count := yy_state_count - 1
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_lp := yy_accept.item (yy_current_state)
						yy_goto := yyFind_rule
					end
				when yyFind_rule then
						-- We branch here when backing up.
					check reject_used: yyReject_or_variable_trail_context end
					from yy_found := False until yy_found loop
						if
							yy_lp /= 0 and
							yy_lp < yy_accept.item (yy_current_state + 1)
						then
							yy_act := yy_acclist.item (yy_lp)
							if yyVariable_trail_context then
								if
									yy_act < - yyNb_rules or
									yy_looking_for_trail_begin /= 0
								then
									if yy_act = yy_looking_for_trail_begin then
										yy_looking_for_trail_begin := 0
										yy_act := - yy_act - yyNb_rules
										yy_found := True
									else
										yy_lp := yy_lp + 1
									end
								elseif yy_act < 0 then
									yy_looking_for_trail_begin := yy_act - yyNb_rules
									if yyReject_used then
											-- Remember matched text in case
											-- we back up due to `reject'.
										yy_full_match := yy_cp
										yy_full_state := yy_state_count
										yy_full_lp := yy_lp
									end
									yy_lp := yy_lp + 1
								else
									yy_full_match := yy_cp
									yy_full_state := yy_state_count
									yy_full_lp := yy_lp
									yy_found := True
								end
							else
								yy_full_match := yy_cp
								yy_found := True
							end
						else
							yy_cp := yy_cp - 1
							yy_state_count := yy_state_count - 1
							yy_current_state := yy_state_stack.item (yy_state_count)
							yy_lp := yy_accept.item (yy_current_state)
						end
					end
					yy_rejected_line := yy_line
					yy_rejected_column := yy_column
					yy_rejected_position := yy_position
					yy_goto := yyDo_action
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
							-- Must back up.
						if not yyReject_or_variable_trail_context then
								-- Backing-up info for compressed tables is
								-- taken after `yy_cp' has been incremented
								-- for the next state.
							yy_cp := yy_last_accepting_cpos
							yy_bp := yy_bp + yy_more_len
							yy_current_state := yy_last_accepting_state
							yy_goto := yyFind_action
						else
							last_token := yyError_token
							fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_end' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_end' will already have been 
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the 
							-- end-of-buffer state). Contrast this with the
							-- test in `read_character'.
						if yy_end <= input_buffer.count + 1 then
								-- This was really a NULL character.
							yy_end := yy_bp + yy_matched_count
							yy_current_state := yy_previous_state
								-- We're now positioned to make the NULL
								-- transition. We couldn't have
								-- `yy_previous_state' go ahead and do it
								-- for us because it doesn't know how to deal
								-- with the possibility of jamming (and we
								-- don't want to build jamming into it because
								-- then it will run more slowly).
							yy_next_state := yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								if yyReject_or_variable_trail_context then
										-- Still need to initialize `yy_cp',
										-- though `yy_current_state' was set
										-- up by `yy_previous_state'.
									yy_cp := yy_end
										-- Remove the state which was inserted
										-- in `yy_state_stack' by the call to
										-- `yy_null_trans_state'.
									yy_state_count := yy_state_count - 1
								else
										-- Do the guaranteed-needed backing up
										-- then figure out the match.
									yy_cp := yy_last_accepting_cpos
									yy_current_state := yy_last_accepting_state
								end
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_end := yy_end - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyMatch
							elseif
								yy_end - yy_start - yy_more_len /= 0
							then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched, 
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start
									yy_cp := yy_end
									yy_execute_eof_action ((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
							yy_line := yy_rejected_line
							yy_column := yy_rejected_column
							yy_position := yy_rejected_position
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state := yy_state_stack.item (yy_state_count - 1)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
			debug ("GELEX")
				print_last_token
			end
		end

end
