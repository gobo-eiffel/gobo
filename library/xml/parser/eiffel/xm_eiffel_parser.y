%{
indexing

	description: 

		"XML parsers using a native Eiffel parser"

	implements: "XML 1.0 (Second Edition) - W3C Recommendation 6 October 2000"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_EIFFEL_PARSER

inherit

	XM_EIFFEL_PARSER_SKELETON
		redefine
			parse
		end

create

	make

%}

-- TODO:
-- character classes validation: external
-- pi: should have space after PI_TARGET?
-- getting error messages from scanner
-- check no external entity or DTD for standalone docs
-- xml declaration in external entities
-- DTD external id lacks base

%type <XM_EIFFEL_PARSER_NAME> namespace_name s_tag_name s_tag e_tag attribute
%type <DS_HASH_SET [XM_EIFFEL_PARSER_NAME]> s_tag_trail
%type <STRING> namespace_name_second nm_token doctype_name doctype_system_token
%type <STRING> char_data tagname_first tagname_atom name_token pi_target_token 
%type <STRING> doctype_pe_reference entityvalue_pe_reference
%type <STRING> entity_value entity_value_trail entity_value_trail_item
%type <STRING> att_value att_value_trail att_value_trail_item
%type <STRING> value_reference entity_value_reference
%type <STRING> comment_content comment_content_trail comment_content_item 
%type <STRING> pi_content pi_content_first pi_content_trail pi_content_item
%type <STRING> cdata_body cdata_body_item content_text
%type <XM_DTD_EXTERNAL_ID> external_id public_id doctype_decl_external_name
%type <STRING> ndata_decl doctype_name_space
%type <XM_DTD_ELEMENT_CONTENT> content_spec children cp choice choice_trail seq seq_trail mixed mixed_trail
%type <STRING> repetition 
%type <DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]> attlist_decl_trail
%type <XM_DTD_ATTRIBUTE_CONTENT> att_def att_type att_tokenized_type enumerated_type default_decl
%type <DS_BILINKED_LIST [STRING]> enumeration enumeration_trail
%type <STRING> version_info encoding_decl space_eq
%type <BOOLEAN> sd_decl
%type <XM_EIFFEL_DECLARATION> xml_decl xml_decl_opt xml_decl_misc

%token <STRING> NAME NAME_UTF8
%token <STRING> NMTOKEN NMTOKEN_UTF8
%token <STRING> EQ
%token <STRING> SPACE
%token <STRING> APOS QUOT
%token <STRING> CHARDATA CHARDATA_UTF8
%token <STRING> COMMENT_START COMMENT_END COMMENT_DASHDASH
%token <STRING> PI_START PI_TARGET PI_TARGET_UTF8 PI_END PI_RESERVED
%token <STRING> XMLDECLARATION_START
%token <STRING> XMLDECLARATION_END
%token <STRING> XMLDECLARATION_VERSION
%token <STRING> XMLDECLARATION_VERSION_10
%token <STRING> XMLDECLARATION_STANDALONE
%token <STRING> XMLDECLARATION_STANDALONE_YES XMLDECLARATION_STANDALONE_NO
%token <STRING> XMLDECLARATION_ENCODING XMLDECLARATION_ENCODING_VALUE
%token <STRING> CDATA_START
%token <STRING> CDATA_END
%token <STRING> DOCTYPE_START
%token <STRING> DOCTYPE_END
%token <STRING> DOCTYPE_DECLARATION_START DOCTYPE_DECLARATION_END
%token <STRING> DOCTYPE_ELEMENT_EMPTY DOCTYPE_ELEMENT_ANY
%token <STRING> DOCTYPE_ELEMENT DOCTYPE_ATTLIST DOCTYPE_ENTITY DOCTYPE_NOTATION
%token <STRING> DOCTYPE_GROUP_START DOCTYPE_GROUP_END
%token <STRING> DOCTYPE_GROUP_OR DOCTYPE_GROUP_SEQ
%token <STRING> DOCTYPE_GROUP_ZEROONE DOCTYPE_GROUP_ANY DOCTYPE_GROUP_ONEMORE
%token <STRING> DOCTYPE_PCDATA
%token <STRING> DOCTYPE_PUBLIC
%token <STRING> DOCTYPE_SYSTEM DOCTYPE_SYSTEM_UTF8
%token <STRING> DOCTYPE_REQUIRED DOCTYPE_IMPLIED DOCTYPE_FIXED
%token <STRING> DOCTYPE_ATT_CDATA DOCTYPE_ATT_ID 
%token <STRING> DOCTYPE_ATT_IDREF DOCTYPE_ATT_IDREFS
%token <STRING> DOCTYPE_ATT_ENTITY DOCTYPE_ATT_ENTITIES 
%token <STRING> DOCTYPE_ATT_NMTOKEN DOCTYPE_ATT_NMTOKENS
%token <STRING> DOCTYPE_ATT_NOTATION
%token <STRING> DOCTYPE_PERCENT
%token <STRING> DOCTYPE_PEREFERENCE DOCTYPE_PEREFERENCE_UTF8
%token <STRING> ENTITYVALUE_PEREFERENCE ENTITYVALUE_PEREFERENCE_UTF8
%token <STRING> DOCTYPE_IGNORE DOCTYPE_INCLUDE
%token <STRING> DOCTYPE_NDATA
%token <STRING> DOCTYPE_CONDITIONAL_START
%token <STRING> DOCTYPE_CONDITIONAL_END
%token <STRING> DOCTYPE_CONDITIONAL_IGNORE
%token <STRING> VALUE_START
%token <STRING> VALUE_END
%token <STRING> TAG_START
%token <STRING> TAG_START_END
%token <STRING> TAG_END_EMPTY
%token <STRING> TAG_END
%token <STRING> TAG_NAME_FIRST TAG_NAME_FIRST_UTF8
%token <STRING> TAG_NAME_ATOM TAG_NAME_ATOM_UTF8
%token <STRING> TAG_NAME_COLON
%token <STRING> CONTENT_ENTITY CONTENT_ENTITY_UTF8 CONTENT_CONDITIONAL_END
%token <STRING> ATTRIBUTE_ENTITY ATTRIBUTE_ENTITY_UTF8 ATTRIBUTE_LT
%token <STRING> ENTITY_INVALID INPUT_INVALID

%%
-- This grammar is heavily based on the standard's EBNF productions.
-- Production names are the same as far as sensible and the productions 
-- are in the same order as in the standard text, whose section headings 
-- are included.

-- 2.1 Well formed XML documents

document: prolog element misc_maybe
	;

-- Convenience productions (out of the standard)

-- Namespace handling: to be fully compatible with XML 1.0 which allows 
-- any number of colons in names while still be ready to support namespaces,
-- namespace names (outside of DTD declarations) are handled as a list 
-- of colon-separated atoms.

namespace_name: tagname_first
		{
			$$ := new_namespace_name
			namespace_force_last ($$, $1)
		}
	| TAG_NAME_COLON
		{
			$$ := new_namespace_name
			namespace_force_last ($$, shared_empty_string)
			namespace_force_last ($$, shared_empty_string)
		}
	| TAG_NAME_COLON namespace_name_second
		{ 
			$$ := new_namespace_name
			namespace_force_last ($$, shared_empty_string)
			namespace_force_last ($$, $2)
		}
	| namespace_name TAG_NAME_COLON namespace_name_second
		{ 
			$$ := $1
			namespace_force_last ($$, $3)
		}
	| namespace_name TAG_NAME_COLON
		{
			$$ := $1
			namespace_force_last ($$, shared_empty_string)
		}
	;

namespace_name_second: tagname_atom { $$ := $1 }
	| tagname_first { $$ := $1 }
	;

	
-- Common for split UTF8/ascii tokens


char_data: CHARDATA { $$ := onstring_ascii ($1) }
	| CHARDATA_UTF8 { $$ := onstring_utf8 ($1) }
	;
	
tagname_first: TAG_NAME_FIRST { $$ := onstring_ascii ($1) }
	| TAG_NAME_FIRST_UTF8 { $$ := onstring_utf8 ($1) }
	;

tagname_atom: TAG_NAME_ATOM { $$ := onstring_ascii ($1) }
	| TAG_NAME_ATOM_UTF8 { $$ := onstring_utf8 ($1) }
	;

nm_token: doctype_name { $$ := $1 }
	| NMTOKEN { $$ := onstring_ascii ($1) }
	| NMTOKEN_UTF8 { $$ := onstring_utf8 ($1) }
	;

name_token: NAME { $$ := onstring_ascii ($1) }
	| NAME_UTF8 { $$ := onstring_utf8 ($1) }
	;

pi_target_token: PI_TARGET { $$ := onstring_ascii ($1) }
	| PI_TARGET_UTF8 { $$ := onstring_utf8 ($1) }
	;

doctype_pe_reference: DOCTYPE_PEREFERENCE { $$ := onstring_ascii ($1) }
	| DOCTYPE_PEREFERENCE_UTF8 { $$ := onstring_utf8 ($1) }
	;

entityvalue_pe_reference: ENTITYVALUE_PEREFERENCE { $$ := onstring_ascii ($1) }
	| ENTITYVALUE_PEREFERENCE_UTF8 { $$ := onstring_utf8 ($1) }
	;

doctype_system_token: DOCTYPE_SYSTEM { $$ := onstring_ascii ($1) }
	| DOCTYPE_SYSTEM_UTF8 { $$ := onstring_utf8 ($1) }
	;

-- Within the DTD name = keywords + ordinary words
-- This is not handled within the scanner because the position 
-- of a word determines whether it is a keyword or not.

doctype_name: name_token { $$ := $1 }
	| DOCTYPE_ATT_CDATA { $$ := $1 }
	| DOCTYPE_ATT_ID { $$ := $1 }
	| DOCTYPE_ATT_IDREF { $$ := $1 }
	| DOCTYPE_ATT_IDREFS { $$ := $1 }
	| DOCTYPE_ATT_ENTITY { $$ := $1 }
	| DOCTYPE_ATT_ENTITIES { $$ := $1 }
	| DOCTYPE_ATT_NMTOKEN { $$ := $1 }
	| DOCTYPE_ATT_NMTOKENS { $$ := $1 }
	| DOCTYPE_ATT_NOTATION { $$ := $1 }
	| DOCTYPE_ELEMENT_EMPTY { $$ := $1 }
	| DOCTYPE_ELEMENT_ANY { $$ := $1 }
	| DOCTYPE_IGNORE { $$ := $1 }
	| DOCTYPE_INCLUDE { $$ := $1 }
	| DOCTYPE_NDATA { $$ := $1 }
	;

maybe_space: -- Empty
	| req_space
	;
	
req_space: space_item
	| req_space space_item
	;

space_item: SPACE
	| doctype_pe_reference 
		{ 
				-- Really applies only in DTD, but token cannot appear in content
				-- and test above would catch, if unintentionally.
			if not in_external_dtd then 
				force_error (Error_doctype_peref_only_in_dtd) 
			end 
		}
	;

-- 2.3 Common syntactic constructs

entity_value: VALUE_START VALUE_END
		{ $$ := shared_empty_string }
	| VALUE_START entity_value_trail_item VALUE_END
		{ $$ := $2 }
	| VALUE_START entity_value_trail VALUE_END
		{ $$ := $2 }
	;

entity_value_trail: entity_value_trail_item entity_value_trail_item
		{ $$ := STRING_.concat ($1, $2) }
	| entity_value_trail entity_value_trail_item
		{ $$ := STRING_.appended_string ($1, $2) }
	;

entity_value_trail_item: char_data
		{ $$ := $1 }
	| entity_value_reference
		{ $$ := $1 }
	;
	
entity_value_reference: entityvalue_pe_reference
		{ $$ := entity_referenced_in_entity_value ($1) }
-- character_reference now char_data
-- bypassed entity handled by scanner
	;

att_value: VALUE_START VALUE_END
		{ $$ := shared_empty_string }
	| VALUE_START att_value_trail_item VALUE_END
		{ $$ := $2 }
	| VALUE_START att_value_trail VALUE_END
		{ $$ := $2 }
	;

att_value_trail: att_value_trail_item att_value_trail_item
		{ $$ := STRING_.concat ($1, $2) }
	| att_value_trail att_value_trail_item
		{ $$ := STRING_.appended_string ($1, $2) }
	;

att_value_trail_item: char_data { $$ := $1 }
	| value_reference { $$ := $1 }
	| ATTRIBUTE_LT { force_error (Error_lt_not_allowed_attribute_value) }
	;

value_reference: ATTRIBUTE_ENTITY { $$ := shared_empty_string } -- really handled by `read_token'
	| ATTRIBUTE_ENTITY_UTF8 { $$ := shared_empty_string }
	;

-- 2.5 Comments

comment: COMMENT_START comment_content COMMENT_END
		{ on_comment ($2) }
	| COMMENT_START COMMENT_END
		{ on_comment (shared_empty_string) }
	;

dtd_comment: COMMENT_START comment_content COMMENT_END
		{ on_dtd_comment ($2) }
	| COMMENT_START COMMENT_END
		{ on_dtd_comment (shared_empty_string) }
	;

comment_content: comment_content_item
		{ $$ := $1 }
	| comment_content_trail
		{ $$ := $1 }
	;

comment_content_trail: comment_content_item comment_content_item
		{ $$ := STRING_.concat ($1, $2) }
	| comment_content_trail comment_content_item
		{ $$ := STRING_.appended_string ($1, $2) }
	;

comment_content_item: char_data { $$ := $1 }
	| COMMENT_DASHDASH { force_error (Error_no_dash_dash_in_comment) }
	;

-- 2.6 Processing instructions

pi: PI_START pi_target_token req_space pi_content PI_END
		{ on_processing_instruction ($2, $4) }
	| PI_START pi_target_token maybe_space PI_END
		{ on_processing_instruction ($2, shared_empty_string) }
	| PI_RESERVED { force_error (Error_pi_xml_reserved) }
	;

dtd_pi: PI_START pi_target_token req_space pi_content PI_END
		{ on_dtd_processing_instruction ($2, $4) }
	| PI_START pi_target_token maybe_space PI_END
		{ on_dtd_processing_instruction ($2, shared_empty_string) }
	| PI_RESERVED { force_error (Error_pi_xml_reserved) }
	;

pi_content: pi_content_first pi_content_item
		{ $$ := STRING_.concat ($1, $2) }
	| pi_content_first pi_content_trail
		{ $$ := STRING_.concat ($1, $2) }
	| pi_content_first
		{ $$ := $1 }
	;
	
pi_content_trail: pi_content_item pi_content_item
		{ $$ := STRING_.concat ($1, $2) }
	| pi_content_trail pi_content_item
		{ $$ := STRING_.appended_string ($1, $2) }
	;

pi_content_item: char_data { $$ := $1 }
	| pi_target_token { $$ := $1 }
	| SPACE { $$ := $1 }
	;

pi_content_first: char_data { $$ := $1 }
	| pi_target_token { $$ := $1 }
	;

-- 2.7 CDATA section

cd_sect: CDATA_START CDATA_END
	| CDATA_START cdata_body CDATA_END
	;

cdata_body: cdata_body_item
	| cdata_body cdata_body_item
	;

cdata_body_item: char_data
		{ on_content ($1) }
	;

-- 2.8 Prolog and DTD

prolog: xml_decl_misc doctype_decl_misc
		{
			apply_encoding ($1.encoding)
			$1.process (Current) -- event
		}
	;

xml_decl_misc: misc_maybe
		{ create $$.make }
	| xml_decl
		{ $$ := $1 }
	| xml_decl misc_trail
		{ $$ := $1 }
	;

doctype_decl_misc: -- Empty
	| doctype_decl
	| doctype_decl misc_trail
	;

misc_maybe: -- Empty
	| misc_trail
	;

misc_trail: misc
	| misc_trail misc
	;

xml_decl: XMLDECLARATION_START version_info xml_decl_opt XMLDECLARATION_END
		{ 
			$3.set_version ($2)
			$$ := $3
		}
	| XMLDECLARATION_START error { force_error (Error_xml_declaration) }
	;

xml_decl_opt: maybe_space
		{ create $$.make }
	| req_space sd_decl maybe_space
		{ 
			create $$.make 
			$$.set_stand_alone ($2)
		}
	| req_space encoding_decl maybe_space
		{ 
			create $$.make 
			$$.set_encoding ($2)
			apply_encoding ($2)
		}
	| req_space encoding_decl req_space sd_decl maybe_space
		{ 
			create $$.make;
			$$.set_encoding ($2)
			$$.set_stand_alone ($4) 
			apply_encoding ($2)
		}
	;

space_eq: EQ
	| SPACE EQ
	| EQ SPACE
	| SPACE EQ SPACE
	;
	
version_info: XMLDECLARATION_VERSION space_eq APOS XMLDECLARATION_VERSION_10 APOS
		{ $$ := $4 }
	| XMLDECLARATION_VERSION space_eq QUOT XMLDECLARATION_VERSION_10 QUOT
		{ $$ := $4 }
	;

misc: comment
	| pi
	| SPACE
	;

doctype_decl: doctype_decl_internal
	| doctype_decl_external doctype_decl_dtd
	;

doctype_decl_internal_name: doctype_name maybe_space 
		{ on_doctype ($1, Void, True) }
	;
	
doctype_decl_internal: DOCTYPE_START req_space doctype_decl_internal_name doctype_decl_declaration DOCTYPE_END
		{ on_dtd_end }
	;

doctype_decl_external_name: doctype_name req_space external_id maybe_space
		{ 
			on_doctype ($1, $3, False) 
			$$ := $3
		}
	;
	
doctype_decl_external: DOCTYPE_START req_space doctype_decl_external_name doctype_decl_declaration DOCTYPE_END
		{
			debug ("xml_parser")
				std.error.put_string ("[dtd: in]")
			end
			in_external_dtd := True
			when_external_dtd ($3) 
			on_dtd_end
		}
	;

-- External DTD

doctype_decl_dtd: DOCTYPE_DECLARATION_START text_decl doctype_decl_dtd_content DOCTYPE_DECLARATION_END
		{
			if not in_external_dtd then
				force_error (Error_misplaced_dtd_declaration)
			end
			debug ("xml_parser")
				std.error.put_string ("[dtd: out]")
			end
			in_external_dtd := False
		}
	;

doctype_decl_dtd_content: -- Empty
	| doctype_decl_dtd_items
	;

doctype_decl_dtd_items: doctype_decl_dtd_item
	| doctype_decl_dtd_items doctype_decl_dtd_item
	;

doctype_decl_dtd_item: markup_decl
	| conditional_sect
	;

-- Internal DTD

doctype_decl_declaration: -- Empty
	| DOCTYPE_DECLARATION_START DOCTYPE_DECLARATION_END maybe_space
	| DOCTYPE_DECLARATION_START doctype_decl_declaration_content DOCTYPE_DECLARATION_END maybe_space
	;

doctype_decl_declaration_content: markup_decl
	| doctype_decl_declaration_content markup_decl
	;

-- DTD body

markup_decl: element_decl
	| attlist_decl
	| entity_decl
	| notation_decl
	| dtd_pi
	| dtd_comment
	| SPACE -- not in XML1.0:29?
	| doctype_pe_reference
	;

-- 2.9 Stand-alone document declaration

sd_decl: XMLDECLARATION_STANDALONE space_eq APOS XMLDECLARATION_STANDALONE_YES APOS { $$ := True }
	| XMLDECLARATION_STANDALONE space_eq QUOT XMLDECLARATION_STANDALONE_YES QUOT { $$ := True }
	| XMLDECLARATION_STANDALONE space_eq APOS XMLDECLARATION_STANDALONE_NO APOS { $$ := False }
	| XMLDECLARATION_STANDALONE space_eq QUOT XMLDECLARATION_STANDALONE_NO QUOT { $$ := False }
	;

-- 3. Element

element: empty_elem_tag
	| s_tag e_tag 
		{
			if not $1.is_equal ($2) then
				force_error (Error_end_tag_mismatch)
			end
		}
	| s_tag content e_tag
		{
			if not $1.is_equal ($3) then
				force_error (Error_end_tag_mismatch)
			end
		}
	| s_tag content error { force_error (Error_element_end_tag) }
	| s_tag error { force_error (Error_element_content) }
	;


-- 3.1 Element tags

s_tag: TAG_START s_tag_name TAG_END
		{
			$$ := $2
			on_start_tag_finish
		}
	| TAG_START s_tag_name req_space s_tag_trail TAG_END
		{
			$$ := $2
			on_start_tag_finish
		}
	| TAG_START error { force_error (Error_start_tag) }
	;

empty_elem_tag: TAG_START s_tag_name TAG_END_EMPTY
		{
			on_start_tag_finish -- makes empty attributes
			on_end_tag (Void, $2.ns_prefix, $2.local_part)
		}
	| TAG_START s_tag_name req_space s_tag_trail TAG_END_EMPTY
		{
			on_start_tag_finish
			on_end_tag (Void, $2.ns_prefix, $2.local_part)
		}
	;

s_tag_name: namespace_name
		{
			$$ := $1
			on_start_tag (Void, $1.ns_prefix, $1.local_part)
		}
	;

s_tag_trail: attribute
		{
			$$ := new_name_set
			$$.force_new ($1)
		}
	| s_tag_trail req_space attribute
		{
			$$ := $1
			if ($$).has ($3) then
				force_error (Error_attribute_duplicate)
			else
				$$.force_new ($3)
			end
		}
	;

attribute: namespace_name EQ att_value
		{
			$$ := $1
			on_attribute (Void, $1.ns_prefix, $1.local_part, $3)
		}
	| namespace_name error 
		{ force_error (Error_attribute) }
	;

e_tag: TAG_START_END namespace_name TAG_END
		{
			$$ := $2
			on_end_tag (Void, $2.ns_prefix, $2.local_part)
		}
	| TAG_START_END error { force_error (Error_end_tag) }
	;

content: content_item
	| content content_item
	;

content_item: content_text { on_content ($1) }
	| cd_sect
	| element
	| pi
	| comment
	| CONTENT_CONDITIONAL_END { force_error (Error_no_cdata_end_in_content) }
	| entity_in_content
	;

entity_in_content: CONTENT_ENTITY -- no action, switched in read_token
	| CONTENT_ENTITY_UTF8 -- no action, switched in read_token
	| XMLDECLARATION_END { force_error (Error_entity_xml_declaration) }
	;

content_text: char_data -- includes character_reference
		{ $$ := $1 }
	| SPACE 
		{ $$ := $1 }
	;

-- 3.2 Element type declaration

element_decl: DOCTYPE_ELEMENT req_space doctype_name req_space content_spec DOCTYPE_END
		{ on_element_declaration ($3,$5) }
	| DOCTYPE_ELEMENT error { force_error (Error_doctype_element) }
	;

content_spec: DOCTYPE_ELEMENT_EMPTY maybe_space
		{ create $$.make_empty }
	| DOCTYPE_ELEMENT_ANY maybe_space
		{ create $$.make_any }
	| mixed maybe_space
		{ $$ := $1 }
	| children
		{ $$ := $1 }
	;

children: choice maybe_space
		{ $$ := $1 }
	| choice repetition
		{ $$ := $1; set_element_repetition ($$, $2) }
	| seq maybe_space
		{ $$ := $1 }
	| seq repetition
		{ $$ := $1; set_element_repetition ($$, $2) }
	;

cp: doctype_name_space
		{ $$ := element_name ($1) }
	| doctype_name repetition
		{ $$ := element_name ($1); set_element_repetition ($$, $2) }
	| choice maybe_space
		{ $$ := $1 }
	| choice repetition
		{ $$ := $1; set_element_repetition ($$, $2) }
	| seq maybe_space
		{ $$ := $1 }
	| seq repetition
		{ $$ := $1; set_element_repetition ($$, $2) }
	;

repetition: DOCTYPE_GROUP_ANY maybe_space
		{ $$ := Zero_or_more_repetition }
	| DOCTYPE_GROUP_ONEMORE maybe_space
		{ $$ := One_or_more_repetition }
	| DOCTYPE_GROUP_ZEROONE maybe_space
		{ $$ := Zero_or_one_repetition }
	;

choice: group_start cp group_or choice_trail group_end
		{ $$ := $4; $$.items.force_first ($2) }
	;-- ensure choice.is_choice (that's why $4 is used)

choice_trail: cp
		{ create $$.make_choice; $$.items.force_last ($1) }
	| choice_trail group_or cp
		{ $$ := $1; $$.items.force_last ($3) }
	; -- ensure choice_trail.is_choice


seq: group_start seq_trail group_end
		{ $$ := $2 }
	;

seq_trail: cp
		{ create $$.make_sequence; $$.items.force_last ($1) }
	| seq_trail group_seq cp
		{ $$ := $1; $$.items.force_last ($3) }
	; -- ensure seq_trail.is_sequence

mixed: group_start pc_data group_end
		{ create $$.make_mixed }
	| group_start pc_data group_end DOCTYPE_GROUP_ANY
		{ create $$.make_mixed; $$.set_zero_or_more } 
	| group_start pc_data group_or mixed_trail group_end DOCTYPE_GROUP_ANY
		{ $$ := $4; $$.set_zero_or_more }
	; -- ensure mixed.is_content_mixed

mixed_trail: doctype_name_space
		{ create $$.make_mixed; $$.items.force_last (element_name ($1)) }
	| mixed_trail group_or doctype_name_space
		{ $$ := $1; $$.items.force_last (element_name ($3)) }
	; -- ensure mixed_trail.is_content_mixed

-- Primitives with space

doctype_name_space: DOCTYPE_NAME maybe_space
		{ $$ := $1 }
	;

group_start: DOCTYPE_GROUP_START maybe_space
	;

group_or: DOCTYPE_GROUP_OR maybe_space
	;

group_seq: DOCTYPE_GROUP_SEQ maybe_space
	;

group_end: DOCTYPE_GROUP_END
	;

pc_data: DOCTYPE_PCDATA maybe_space
	;

-- 3.3 Attribute list declaration

attlist_decl: DOCTYPE_ATTLIST req_space doctype_name maybe_space DOCTYPE_END
		-- empty declaration, what to do?
	| DOCTYPE_ATTLIST req_space doctype_name attlist_decl_trail maybe_space DOCTYPE_END
		{  on_attribute_declarations ($3, $4) }
	| DOCTYPE_ATTLIST error 
		{ force_error (Error_doctype_attribute) }
	;

attlist_decl_trail: att_def
		{ $$ := new_dtd_attribute_content_list; $$.force_last ($1) }
	|  attlist_decl_trail att_def
		{ $$ := $1; $$.force_last ($2) }
	;

att_def: req_space doctype_name req_space att_type req_space default_decl
		{ $$ := $4; $$.set_name ($2); $$.copy_default ($6) }
	| req_space doctype_name error { force_error (Error_doctype_attribute_item) }
	;

att_type: DOCTYPE_ATT_CDATA -- string_type
		{ $$ := new_dtd_attribute_content; $$.set_data }
	| att_tokenized_type
		{ $$ := $1 }
	| enumerated_type
		{ $$ := $1 }
	;

att_tokenized_type: DOCTYPE_ATT_ID
		{ $$ := new_dtd_attribute_content; $$.set_id }
	| DOCTYPE_ATT_IDREF
		{ $$ := new_dtd_attribute_content; $$.set_id_ref }
	| DOCTYPE_ATT_IDREFS
		{ $$ := new_dtd_attribute_content; $$.set_id_ref; $$.set_list_type }
	| DOCTYPE_ATT_ENTITY
		{ $$ := new_dtd_attribute_content; $$.set_entity }
	| DOCTYPE_ATT_ENTITIES
		{ $$ := new_dtd_attribute_content; $$.set_entity; $$.set_list_type }
	| DOCTYPE_ATT_NMTOKEN
		{ $$ := new_dtd_attribute_content; $$.set_token }
	| DOCTYPE_ATT_NMTOKENS
		{ $$ := new_dtd_attribute_content; $$.set_token; $$.set_list_type }
	;

enumerated_type: notation_type
		{ $$ := new_dtd_attribute_content; $$.set_notation }
	| enumeration
		{ $$ := new_dtd_attribute_content; $$.set_enumeration_list ($1) }
	;

notation_type: DOCTYPE_ATT_NOTATION req_space group_start notation_type_trail DOCTYPE_GROUP_END
	;

notation_type_trail: doctype_name_space
	| notation_type_trail group_or doctype_name_space
	;

enumeration: group_start enumeration_trail group_end
		{ $$ := $2 }
	;

enumeration_trail: nm_token maybe_space
		{ $$ := new_string_bilinked_list; $$.force_last ($1) }
	| enumeration_trail group_or nm_token maybe_space
		{ $$ := $1; $$.force_last ($3) }
	;

default_decl: DOCTYPE_REQUIRED
		{ $$ := new_dtd_attribute_content; $$.set_value_required }
	| DOCTYPE_IMPLIED
		{ $$ := new_dtd_attribute_content; $$.set_value_implied }
	| DOCTYPE_FIXED req_space att_value
		{ $$ := new_dtd_attribute_content; $$.set_value_fixed ($3) }
	| att_value
		{ $$ := new_dtd_attribute_content; $$.set_default_value ($1) }
	;

-- 3.4 Conditional section

conditional_sect: include_sect
	| ignore_sect
	| DOCTYPE_CONDITIONAL_START error { force_error (Error_doctype_conditional_section) }
	;

include_sect: include_header DOCTYPE_CONDITIONAL_END
	| include_header doctype_decl_dtd_items DOCTYPE_CONDITIONAL_END
	;

include_header: DOCTYPE_CONDITIONAL_START maybe_space DOCTYPE_INCLUDE maybe_space DOCTYPE_DECLARATION_START
	;

ignore_sect: ignore_header ignore_sect_content DOCTYPE_CONDITIONAL_END
	;

ignore_header: DOCTYPE_CONDITIONAL_START maybe_space DOCTYPE_IGNORE maybe_space DOCTYPE_DECLARATION_START
		{ scanner.push_start_condition_dtd_ignore }
	;

ignore_sect_content: -- Empty
	| ignore_sect_items
	;

ignore_sect_items: ignore_sect_item
	| ignore_sect_items ignore_sect_item
	;

ignore_sect_item: char_data
	| DOCTYPE_CONDITIONAL_START ignore_sect_content DOCTYPE_CONDITIONAL_END
	;

-- 4.1 Reference

-- reference: ENTITY is used directly depending on context

-- 4.2 Entity declarations

entity_decl: ge_decl 
	| pe_decl
	| DOCTYPE_ENTITY error { force_error (Error_doctype_entity) }
	;

ge_decl: DOCTYPE_ENTITY req_space doctype_name req_space entity_value maybe_space DOCTYPE_END
		{
				-- Internal entity.
			when_entity_declared ($3, new_literal_entity ($3, $5))
			on_entity_declaration ($3, False, $5, Void, Void)
		}
	| DOCTYPE_ENTITY req_space doctype_name req_space external_id maybe_space DOCTYPE_END
		{
				-- External entity.
			when_entity_declared ($3, new_external_entity ($5))
			on_entity_declaration ($3, False, Void, $5, Void)
		}
	| DOCTYPE_ENTITY req_space doctype_name req_space external_id ndata_decl maybe_space DOCTYPE_END
		{
				-- Unparsed NDATA entity.
			on_entity_declaration ($3, False, Void, $5, $6)
		}
	;

pe_decl: DOCTYPE_ENTITY req_space DOCTYPE_PERCENT req_space doctype_name req_space entity_value maybe_space DOCTYPE_END
		{
				-- Internal PE entity.
			when_pe_entity_declared ($5, new_literal_entity ($5, $7))
			on_entity_declaration ($5, True, $7, Void, Void) 
		}
	| DOCTYPE_ENTITY req_space DOCTYPE_PERCENT req_space doctype_name req_space external_id maybe_space DOCTYPE_END
		{
				-- External PE entity.
			when_pe_entity_declared ($5, new_external_entity ($7)) 
			on_entity_declaration ($5, True, Void, $7, Void)
		}
	;

external_id: doctype_system_token
		{ $$ := new_dtd_external_id; $$.set_system ($1) }
	| DOCTYPE_PUBLIC doctype_system_token
		{ $$ := new_dtd_external_id; $$.set_public ($1); $$.set_system ($2) }
	;

ndata_decl: req_space DOCTYPE_NDATA req_space doctype_name -- $2 is 'NDATA'
	{ $$ := $4 }
	;

-- 4.3 Parsed entities

text_decl: -- Empty
	| XMLDECLARATION_START encoding_decl maybe_space XMLDECLARATION_END
	| XMLDECLARATION_START version_info req_space encoding_decl maybe_space XMLDECLARATION_END
	| XMLDECLARATION_START error { force_error (Error_xml_declaration) }
	;

encoding_decl: XMLDECLARATION_ENCODING space_eq APOS XMLDECLARATION_ENCODING_VALUE APOS
		{ $$ := $4 }
	| XMLDECLARATION_ENCODING space_eq QUOT XMLDECLARATION_ENCODING_VALUE QUOT
		{ $$ := $4 }
	;

-- 4.7 Notation declaration

notation_decl: DOCTYPE_NOTATION req_space doctype_name req_space external_id maybe_space DOCTYPE_END
		{ on_notation_declaration ($3, $5) }
	| DOCTYPE_NOTATION req_space doctype_name req_space public_id maybe_space DOCTYPE_END
		{ on_notation_declaration ($3, $5) }
	| DOCTYPE_NOTATION error
		{ force_error (Error_doctype_notation) }
	;

public_id: DOCTYPE_PUBLIC
		{ $$ := new_dtd_external_id; $$.set_system ($1) }
	;

%%

feature -- Parsing

	parse is
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_PARSER_SKELETON CLASS, FOR OPTIMISATION WITH
			-- ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_PARSER_SKELETON).)

			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		local
			yystacksize: INTEGER
			yystate: INTEGER
			yyn: INTEGER
			yychar1: INTEGER
			index, yyss_top: INTEGER
			yy_goto: INTEGER
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
				-- ugly but fast parsing routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				if yy_parsing_status = yySuspended then
					yystacksize := yy_suspended_yystacksize
					yystate := yy_suspended_yystate
					yyn := yy_suspended_yyn
					yychar1 := yy_suspended_yychar1
					index := yy_suspended_index
					yyss_top := yy_suspended_yyss_top
					yy_goto := yy_suspended_yy_goto
					yy_parsing_status := yyContinue
				else
					error_count := 0
					yy_lookahead_needed := True
					yyerrstatus := 0
					yy_init_value_stacks
					yyssp := -1
					yystacksize := yyss.count
					yy_parsing_status := yyContinue
					yy_goto := yyNewstate
				end
			until
				yy_parsing_status /= yyContinue
			loop
				inspect yy_goto
				when yyNewstate then
					yyssp := yyssp + 1
					if yyssp >= yystacksize then
						yystacksize := yystacksize + yyInitial_stack_size
						yyss := SPECIAL_INTEGER_.resize (yyss, yystacksize)
						debug ("GEYACC")
							std.error.put_string ("Stack (yyss) size increased to ")
							std.error.put_integer (yystacksize)
							std.error.put_character ('%N')
						end
					end
					debug ("GEYACC")
						std.error.put_string ("Entering state ")
						std.error.put_integer (yystate)
						std.error.put_character ('%N')
					end
					yyss.put (yystate, yyssp)
						-- Do appropriate processing given the current state.
						-- Read a lookahead token if one is needed.
					yyn := yypact.item (yystate)
						-- First try to decide what to do without reference
						-- lookahead token.
					if yyn = yyFlag then
						yy_goto := yyDefault
					else
							-- Not known => get a lookahead token if don't
							-- already have one.
						if yy_lookahead_needed then
							debug ("GEYACC")
								std.error.put_string ("Reading a token%N")
							end
							read_token
							yy_lookahead_needed := False
						end
							-- Convert token to internal form (in `yychar1')
							-- for indexing tables.
						if last_token > yyEof then
							debug ("GEYACC")
								std.error.put_string ("Next token is ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
								-- Translate lexical token `last_token' into
								-- geyacc internal token code.
							if last_token <= yyMax_token then
								yychar1 := yytranslate.item (last_token)
							else
								yychar1 := yyNsyms
							end
							yyn := yyn + yychar1
						elseif last_token = yyEof then
								-- This means end of input.
							debug ("GEYACC")
								std.error.put_string ("Now at end of input.%N")
							end
							yychar1 := 0
						else
								-- An error occurred in the scanner.
							debug ("GEYACC")
								std.error.put_string ("Error in scanner.%N")
							end
							error_count := error_count + 1
							yy_do_error_action (yystate)
							abort
								-- Skip next conditional instruction:
							yyn := -1
						end
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yychar1
						then
							yy_goto := yyDefault
						else
							yyn := yytable.item (yyn)
								-- `yyn' is what to do for this token type in
								-- this state:
								-- Negative => reduce, -`yyn' is rule number.
								-- Positive => shift, `yyn' is new state.
								-- New state is final state => don't bother to
								-- shift, just return success.
								-- 0, or most negative number => error.
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrlab
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrlab
							elseif yyn = yyFinal then
								accept
							else
									-- Shift the lookahead token.
								debug ("GEYACC")
									std.error.put_string ("Shifting token ")
									std.error.put_integer (last_token)
									std.error.put_character ('%N')
								end
									-- Discard the token being shifted
									-- unless it is eof.
								if last_token > yyEof then
									yy_lookahead_needed := True
								end
								yy_push_last_value (yychar1)
									-- Count tokens shifted since error;
									-- after three, turn off error status.
								if yyerrstatus /= 0 then
									yyerrstatus := yyerrstatus - 1
								end
								yystate := yyn
								check
									newstate: yy_goto = yyNewstate
								end
							end
						end
					end
				when yyDefault then
						-- Do the default action for the current state.
					yyn := yydefact.item (yystate)
					if yyn = 0 then
						yy_goto := yyErrlab
					else
						yy_goto := yyReduce
					end
				when yyReduce then
						-- Do a reduction. `yyn' is the number of a rule
						-- to reduce with.
					debug ("GEYACC")
						std.error.put_string ("Reducing via rule #")
						std.error.put_integer (yyn)
						std.error.put_character ('%N')
					end
					yy_do_action (yyn)
					inspect yy_parsing_status
					when yyContinue then
							-- Now "shift" the result of the reduction.
							-- Determine what state that goes to,
							-- based on the state we popped back to
							-- and the rule number reduced by.
						yyn := yyr1.item (yyn)
						yyss_top := yyss.item (yyssp)
						index := yyn - yyNtbase
						yystate := yypgoto.item (index) + yyss_top
						if
							(yystate >= 0 and yystate <= yyLast) and then
							yycheck.item (yystate) = yyss_top
						then
							yystate := yytable.item (yystate)
						else
							yystate := yydefgoto.item (index)
						end
						yy_goto := yyNewstate
					when yySuspended then
						yy_suspended_yystacksize := yystacksize
						yy_suspended_yystate := yystate
						yy_suspended_yyn := yyn
						yy_suspended_yychar1 := yychar1
						yy_suspended_index := index
						yy_suspended_yyss_top := yyss_top
						yy_suspended_yy_goto := yy_goto
					when yyError_raised then
							-- Handle error raised explicitly by an action.
						yy_parsing_status := yyContinue
						yy_goto := yyErrlab
					else
							-- Accepted or aborted.
					end
				when yyErrlab then
						-- Detect error.
					if yyerrstatus = 3 then
							-- If just tried and failed to reuse lookahead
							-- token after an error, discard it. Return
							-- failure if at end of input.
						if last_token <= yyEof then
							abort
						else
							debug ("GEYACC")
								std.error.put_string ("Discarding token ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
							yy_lookahead_needed := True
							yy_goto := yyErrhandle
						end
					else
						if yyerrstatus = 0 then
								-- If not already recovering from an error,
								-- report this error.
							error_count := error_count + 1
							yy_do_error_action (yystate)
						end
						yyerrstatus := 3
						yy_goto := yyErrhandle
					end
				when yyErrhandle then
						-- Handle error.
					yyn := yypact.item (yystate)
					if yyn = yyFlag then
						yy_goto := yyErrpop
					else
						yyn := yyn + yyTerror
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yyTerror
						then
							yy_goto := yyErrpop
						else
							yyn := yytable.item (yyn)
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrpop
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrpop
							elseif yyn = yyFinal then
								accept
							else
								yy_push_error_value
								yystate := yyn
								yy_goto := yyNewstate
							end
						end
					end
				when yyErrpop then
						-- Pop the current state because it cannot handle
						-- the error token.
					if yyssp = 0 then
						abort
					else
						yy_pop_last_value (yystate)
						yyssp := yyssp - 1
						yystate := yyss.item (yyssp)
						yy_goto := yyErrhandle
					end
				end
			end
			if yy_parsing_status /= yySuspended then
				yy_clear_all
			end
		rescue
			debug ("GEYACC")
				std.error.put_line ("Entering rescue clause of parser")
			end
			abort
			yy_clear_all
		end

end
