%{

indexing
	
	description: 
	
		"Scanner for an XML parser"
	
	library: "Gobo XML library"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"		

	implements: "XML 1.0 Second Edition - W3C Recommendation 6 October 2000 (referred as 'XML1.0')"
	noncompliance_unicode: "UTF8 is assumed and all chars >255 are assumed to be LETTERS"
	revision: "$Id$"

	-- todo:
	-- system literal accepts non-CHAR
	-- use CONTENTCHAR+ for attribute value?

class XF_FULL_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_stdin
		redefine
			reset,
			fatal_error
		end

	XF_PARSER_TOKENS
		export
			{NONE} all
		end

	XF_PARSER_ERRORS
		export
			{NONE} all
		end
				
	XF_UTF8_PRIVATE_ROUTINES
	
creation
	make_scanner

%}


-- NAMECHAR* is too tolerant: all >= 0x80 accepted (more or less works with UTF8)
-- XML1.0:85 non-conformance: unicode letters
-- XML1.0:88 non-conformance: unicode digits
-- XML1.0:89 extender &xb7; + unicode

APOS [']
QUOT ["]
CHAR [\r\n\t\x20-\xFF]
SPACECHAR [\r\n\t ]

VALIDENCODING (("us-ascii"|"US-ASCII")|(("utf-"|"UTF-")("8"|"16")))

EQUAL [\r\n\t ]*[=][\r\n\t ]*

-- CONTENTCHAR = CHAR - [\r\n\t&<]]
-- COMMENTCHAR = CHAR - [\r\n\t\-]

CONTENTCHAR [\x21-\x25\x27-\x3B\x3D-\x5C\x5E-\xFF] 
COMMENTCHAR [\x20-\x2C\x2E-\xFF]

NAMECHAR [:A-Za-z0-9._\-\x80-\xFF]
NAMECHAR_NOCOLON [A-Za-z0-9._\-\x80-\xFF]

NAMECHAR_FIRST [:A-Za-z_\x80-\xFF]
NAMECHAR_FIRST_NOCOLON [A-Za-z_\x80-\xFF]

-- PUBIDLITERAL class has no ' when starting with '
-- SYSTEMLITERAL class is CHAR - quote

PUBIDLITERAL ((['][ \r\na-zA-Z0-9\-()+,./:=?;!*#@$_%]*['])|(["][' \r\na-zA-Z0-9\-()+,./:=?;!*#@$_%]*["]))
SYSTEMLITERAL ((['][\r\n\t\x20-&(-\xFF]*['])|(["][\r\n\t\x20-!#-\xFF]*["]))


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
%x dtd_in
%x dtd_element
%x dtd_attlist
%x dtd_entity
%x dtd_notation
%x dtd_ignore

%option line nodefault

%%

-- useless rule for avoiding SmallEiffel empty-when bug.
-- obsolete Gobo 2.0 and new smalleiffel
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
		
		{COMMENTCHAR}+ {
			set_last_token (CHARDATA)
			last_value := text
		}
			
		{CHAR} {
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

-- Processing Instruction and XML Declaration


<initial,doctype>{

		"<?xml"{SPACECHAR}+ {
			set_last_token (XMLDECLARATION_START)
			push_start_condition (xmldeclaration)
		}

		"<?"[Xx][Mm][Ll]({SPACECHAR}+|"?>") {
			-- "<?xml" matched by previous rule when allowed
			set_last_token (PI_RESERVED)
		}
		"<?" {
			-- <?xml caught by previous rules
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

		-- Version declaration
		"version"{EQUAL}({APOS}"1.0"{APOS}|{QUOT}"1.0"{QUOT}) {
			set_last_token (XMLDECLARATION_VERSION) 
		}

		-- Standalone declaration
		"standalone"{EQUAL}({APOS}"yes"{APOS}|{QUOT}"yes"{QUOT}) {
			set_last_token (XMLDECLARATION_STANDALONE_YES) 
		}
		
		"standalone"{EQUAL}({APOS}"no"{APOS}|{QUOT}"no"{QUOT}) {
			set_last_token (XMLDECLARATION_STANDALONE_NO) 
		}
	
		"encoding"{EQUAL}({APOS}{VALIDENCODING}{APOS}|{QUOT}{VALIDENCODING}{QUOT}) {
			set_last_token (XMLDECLARATION_ENCODING)
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
		{SPACECHAR}+ {
			set_last_token (SPACE)
			last_value := text
		}
		{NAMECHAR}+ {
			-- get more than one at a time
			set_last_token (CHARDATA)
			last_value := text
		}
		{CHAR} { 
			set_last_token (CHARDATA) 
			last_value := text
		}
	}
		
-- CDATA section

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
		{CONTENTCHAR}+ {
			-- big chunks in last_value
			set_last_token (CHARDATA)
			last_value := text
		}
		{CHAR} { 
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
		-- NAME matches: "SYSTEM" "PUBLIC"
		
		"[" {
			set_last_token (DOCTYPE_DECLARATION_START)
			push_start_condition (doctype) -- same, but balances end
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
			push_start_condition (dtd_ignore) -- self, for exit
		}

		"]]>" {
			set_last_token (DOCTYPE_CONDITIONAL_END)
			pop_start_condition
		}

		{CHAR} {
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
		{SPACECHAR}+ {
			set_last_token (SPACE)
		}
	}
	
<doctype, dtd_in, dtd_entity, dtd_notation> {

		-- system_literal_text does microparsing of last quoted 
		-- value. inelegant to do microparsing in a scanner, but 
		-- PUBLIC and SYSTEM are not keywords and can also be 
		-- names. PUBIDLITERAL and SYSTEMLITERAL also match quoted 
		-- values which are not literals.
		
		-- problem: if declaration merged from processing entity 
		-- (PE cuts on space token boundaries)
		
		"PUBLIC"{SPACECHAR}+{PUBIDLITERAL}{SPACECHAR}+{SYSTEMLITERAL} {
			set_last_token (DOCTYPE_SYSTEM)
			last_value := system_literal_text
		}

		"PUBLIC"{SPACECHAR}+{PUBIDLITERAL} {
			set_last_token (DOCTYPE_PUBLIC)
			last_value := system_literal_text
		}

		"SYSTEM"{SPACECHAR}+{SYSTEMLITERAL} {
			set_last_token (DOCTYPE_SYSTEM)
			last_value := system_literal_text
		}
	}

<dtd_element, dtd_attlist>
	{
		"|" { set_last_token (DOCTYPE_GROUP_OR) }
		"," { set_last_token (DOCTYPE_GROUP_SEQ) }
		"(" { set_last_token (DOCTYPE_GROUP_START) }
		")" { set_last_token (DOCTYPE_GROUP_END) }
		"?" { set_last_token (DOCTYPE_GROUP_ZEROMORE) }
		"*" { set_last_token (DOCTYPE_GROUP_ANY) }
		"+" { set_last_token (DOCTYPE_GROUP_ONEMORE) }
		
		{NAMECHAR}+ {
			set_last_token (NMTOKEN) 
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

<doctype,dtd_element,dtd_attlist> -- also entity/notation?
	{
		"%"{NAMECHAR_FIRST}{NAMECHAR}*";" {
			set_last_token (DOCTYPE_PEREFERENCE)
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
	}
	
<doctype,dtd_element,dtd_attlist,entity_value_single,entity_value_double>
	{
		"%" {
			set_last_token (ENTITY_INVALID)
		}
	}

-- Elements

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
		{NAMECHAR_NOCOLON}+ { 
			set_last_token (TAG_NAME_ATOM) 
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

-- Entities

	
-- named entities are not interpreted in an entity_value

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
	}
	
<entity_value_single,entity_value_double>
	{
		"&"{NAMECHAR_FIRST}{NAMECHAR}*";" { 
				set_last_token (CHARDATA) -- Bypassed
				last_value := text
			}
			
		-- double quote and single quote char entities not interpreted
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

		"<" {
			set_last_token (ATTRIBUTE_LT) -- conformance error
			last_value := text
		}
		{SPACECHAR}+ {
			-- XML1.0:3.3.3 Attribute value normalisation
			set_last_token (CHARDATA)
			last_value := Normalized_space
		}
	}


<initial,attribute_value_single,attribute_value_double,entity_value_single,entity_value_double>
	{
		"&#"[0-9]+; { 
			character_entity.from_decimal (text_substring (3, text_count -	1))
			if character_entity.is_valid then
				set_last_token (CHARDATA)
				last_value := character_entity.as_string
			else
				set_last_token (ENTITY_INVALID)
			end
		}

		"&#x"[0-9a-fA-F]+";" {
			character_entity.from_hexadecimal (text_substring (4, text_count -	1))
			if character_entity.is_valid then
				set_last_token (CHARDATA)
				last_value := character_entity.as_string
			else
				set_last_token (ENTITY_INVALID)
			end
		}
			
		"&" {
			set_last_token (ENTITY_INVALID)
			last_value := text
		}
	}

<attribute_value_single, entity_value_single>
	{
		{APOS} { 
			set_last_token (VALUE_END) 
			pop_start_condition
		}
		{CHAR} {
			-- after apos
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
		{CHAR} {
			-- after quot
			set_last_token (CHARDATA) 
			last_value := text
		}
	}

-- content

"]]>" {
	-- XML1.0:14 ]]> not allowed in markup
	last_token := CONTENT_CONDITIONAL_END
	last_value := text
}

\r\n {
	 -- end of line handling XML1.0:2.11
	set_last_token (SPACE)
	last_value := Normalized_newline
}

\r { 
	set_last_token (SPACE) 
	last_value := Normalized_newline
}

\n {
	set_last_token (SPACE) 
	last_value := Normalized_newline
}

{SPACECHAR}+ {
	-- space not matched by newline normalization
	set_last_token (SPACE)
	last_value := text
}

{CONTENTCHAR}+ { 
	-- get more than one at a time. could be more formal...
	set_last_token (CHARDATA)
	last_value := text
}

{CHAR} { 
	-- catch remaining correct characters
	set_last_token (CHARDATA) 
	last_value := text
}

<*>. {
	-- default rule
	set_last_token (INPUT_INVALID)
	last_value := text
}

%%

feature {NONE} -- Creation

	make_scanner is
			-- Initialise.
		do
			!! character_entity.make
			make_with_buffer (Empty_buffer)
			reset
		end
		
feature -- Reset

	push_start_condition_dtd_ignore is
		do
			push_start_condition (dtd_ignore)
		end
		
	reset is
			-- Reset.
		do
			Precursor
			filename := "-"
			last_error := Void
			!! start_conditions.make
		end
		
feature -- Input

	set_input_file (a_name: STRING) is
			-- Parse file.
			-- Set `last _input_file_opened' to status.
		require
			not_void: a_name /= Void
		local
			a_file: XF_UTF16_INPUT_STREAM
			a_buffer: YY_FILE_BUFFER
		do
			filename := a_name
			!! a_file.make (filename)
			last_input_file_opened := a_file.is_open_read
			if last_input_file_opened then
				!! a_buffer.make (a_file)
				set_input_buffer (a_buffer)
			else
				fatal_error (Error_cannot_read_file)
			end
		ensure
			keep_copy: a_name = filename
		end
	
	fatal_error (a_message: STRING) is
			-- A fatal error occurred.
		do
			last_error := a_message
		end

	last_input_file_opened: BOOLEAN

feature -- Error reportring

	has_error: BOOLEAN is
			-- Was there an error?
		do
			Result := last_error /= Void
		end
		
	last_error: STRING
		
	filename: STRING
	
feature -- Last value

	last_value: ANY

feature {NONE} -- Character entity
	
	character_entity: XF_CHARACTER_ENTITY
			-- Character entity manager (class once)
			
feature {NONE} -- Start condition stack

	push_start_condition (a_condition: INTEGER) is
			-- Set start condition and add previous to stack.
		do
			start_conditions.force (start_condition)
			set_start_condition (a_condition)
		end

	pop_start_condition is
			-- Restore previous start condition.
		do
			if not start_conditions.is_empty then
				-- this would be a precondtion save for 
				-- invalid input document
				set_start_condition (start_conditions.item)
				start_conditions.remove
			-- else error, later in parser hopefully
			end
		end

	start_conditions: DS_LINKED_STACK[INTEGER]

feature {NONE} -- System literal

	system_literal_text: STRING is
			-- Find last quoted substring in scanner text.
			-- (this is microparsing, justified above)
		require
			quote_at_end: text_item (text_count) = '%'' or text_item (text_count) = '%"'
			--quote_in: text_substring (1, text_count-1).has (text_item (text_count))
		local
			i: INTEGER
			a_quote: CHARACTER
		do
			from
				a_quote := text_item (text_count)
				i := text_count - 1
			invariant
				i >= 0
			variant
				i
			until
				text_item (i) = a_quote
			loop
				i := i - 1
			end
			Result := text_substring (i + 1, text_count - 1)
		end
		
feature {NONE} -- Constants

	Normalized_newline: STRING is once Result := "%N" end
	Normalized_space: STRING is once Result := " " end

invariant
	start_not_void: start_conditions /= Void
	character_entity_not_void: character_entity /= Void
	
end

