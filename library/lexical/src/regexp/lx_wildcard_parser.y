%{
note

	description:

		"Parsers for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_WILDCARD_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description

%}

%token STAR_STAR_SLASH STAR_PAREN

%token <STRING_32> CCL_BRACKET
%token <INTEGER> CHAR
%token <LX_SYMBOL_CLASS> CCL_OP
%left CCL_PLUS CCL_MINUS

%type <LX_NFA> Rule Pattern_list Series Singleton String
%type <LX_SYMBOL_CLASS> CCl CCl_single Full_CCl CCl_content 
%type <LX_SYMBOL_CLASS> CCl_expression CCl_parenthesized_expression CCl_left_operand CCl_right_operand

%start Wildcard
%expect 1

%%

Wildcard: Init_pattern Pattern
		{
			set_maximum_symbol_equivalence_class
			if description.equiv_classes_used then
				build_equiv_classes
			end
			check_options
		}
	;

Init_pattern: -- Empty
		{
				-- Initialize for a parse of one pattern.
			in_trail_context := False
			create rule.make_default (1)
		}
	;

Pattern: Rule
		{
			process_rule ($1)
		}
	| error
		{
			report_unrecognized_rule_error
		}
	;

Rule: Series
		{
			$$ := $1
			has_trail_context := False
			head_count := Zero_or_more
			head_line := Zero_or_more
			head_column := Zero_or_more
			trail_count := 0
		}
	;

Pattern_list: Series
		{
			$$ := $1
		}
	| Pattern_list '|' Series
		{
			$$ := $1
			$$.build_union ($3)
		}
	;

Series: Singleton
		{
			$$ := $1
		}
	| Series Singleton
		{
			$$ := $1
			$$.build_concatenation ($2)
		}
	;

Singleton: CHAR
		{
			if utf8_mode.item and $1 > {CHARACTER_8}.max_ascii_value then
				$$ := new_epsilon_nfa
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, $1)
				from i_ := 1 until i_ > buffer.count loop
					$$ := append_character_to_string (buffer.item_code (i_), $$)
					i_ := i_ + 1
				end
			else
				$$ := new_nfa_from_character ($1)
			end
		}
	| STAR_PAREN Pattern_list ')'
		{
			$$ := $2
			$$.build_closure
		}
	| '+' '(' Pattern_list ')'
		{
			$$ := $3
			$$.build_positive_closure
		}
	| '?' '(' Pattern_list ')'
		{
			$$ := $3
			$$.build_optional
		}
	| '@' '(' Pattern_list ')'
		{
			$$ := $3
		}
	| '*'
		{
			$$ := new_nfa_from_character_class (question_character_class)
			$$.build_closure
		}
	| '?'
		{
			$$ := new_nfa_from_character_class (question_character_class)
		}
	| STAR_STAR_SLASH
		{
			$$ := new_nfa_from_character_class (question_character_class)
			$$.build_positive_closure
			$$.build_concatenation (new_nfa_from_character (Slash_code))
			$$.build_closure
		}
	| CCl
		{
			$$ := new_nfa_from_character_class ($1)
		}
	| '"' String '"'
		{
			$$ := $2
		}
	;

CCl: CCl_single
		{ $$ := $1 }
	| CCl_expression
		{ $$ := $1 }
	| CCl_parenthesized_expression
		{ $$ := $1 }
	;

CCl_single: CCL_OP
		{ $$ := $1 }
	| Full_CCl
		{ $$ := $1 }
	| '(' CCl_single ')'
		{ $$ := $2 }
	;
	
Full_CCl: CCL_BRACKET CCl_content ']'
		{
			$$ := $2
			character_classes.search ($$)
			if character_classes.found then
				$$ := character_classes.found_item
			else
				character_classes.force_new ($$)
			end
			character_classes_by_name.force ($$, $1)
		}
	| CCL_BRACKET '^' CCl_content ']'
		{
			$$ := $3
			$$.set_negated (True)
			character_classes.search ($$)
			if character_classes.found then
				$$ := character_classes.found_item
			else
				character_classes.force_new ($$)
			end
			character_classes_by_name.force ($$, $1)
		}
	;
	
CCl_content: CHAR
		{
			$$ := append_character_to_character_class ($1, new_character_class)
		}
	| CCl_content CHAR
		{
			$$ := append_character_to_character_class ($2, $1)
		}
	| CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class ($1, $3, new_character_class)
		}
	| CCl_content CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class ($2, $4, $1)
		}
	;

CCl_expression: CCl_left_operand CCL_PLUS CCl_right_operand
		{
			$$ := $1
			$$.add_symbol_class ($3)
		}
	| CCl_left_operand CCL_MINUS CCl_right_operand
		{
			$$ := $1
			$$.remove_symbol_class ($3)
		}
	;

CCl_parenthesized_expression: '(' CCl_expression ')'
		{ $$ := $2 }
	| '(' CCl_parenthesized_expression ')'
		{ $$ := $2 }
	;

CCl_left_operand: CCl_single
		{ $$ := $1.twin }
	| CCl_expression
		{ $$ := $1 }
	| CCl_parenthesized_expression
		{ $$ := $1 }
	;

CCl_right_operand: CCl_single
		{ $$ := $1 }
	| CCl_parenthesized_expression
		{ $$ := $1 }
	;

String: -- Empty
		{
			$$ := new_epsilon_nfa
		}
	| String CHAR
		{
			if utf8_mode.item and $2 > {CHARACTER_8}.max_ascii_value then
				$$ := $1
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, $2)
				from i_ := 1 until i_ > buffer.count loop
					$$ := append_character_to_string (buffer.item_code (i_), $$)
					i_ := i_ + 1
				end
			else
				$$ := append_character_to_string ($2, $1)
			end
		}
	;

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING_32
			l_character_classes_by_name: like character_classes_by_name
		do
			create question_string.make (1)
			question_string.append_character ({CHARACTER_32} '?')
			if utf8_mode.item then
				l_character_classes_by_name := utf8_character_classes_by_name
			else
				l_character_classes_by_name := character_classes_by_name
			end
			l_character_classes_by_name.search (question_string)
			if l_character_classes_by_name.found then
				Result := l_character_classes_by_name.found_item
			else
				Result := new_character_class 
				Result.add_symbol (Slash_code)
				Result.set_negated (True)
				character_classes.search (Result)
				if character_classes.found then
					Result := character_classes.found_item
				else
					character_classes.force_new (Result)
				end
				l_character_classes_by_name.force_new (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end
		
end
