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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_WILDCARD_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

create

	make, make_from_description

%}

%token STAR_STAR_SLASH STAR_PAREN

%token <STRING> CCL_BRACKET UCCL_BRACKET
%token <INTEGER> CHAR BCHAR UCHAR
%token <LX_SYMBOL_CLASS> CCL_OP
%token <LX_UNICODE_CHARACTER_CLASS> UCCL_OP

%type <INTEGER> CCl_char UCCl_char
%type <LX_NFA> Rule Pattern_list Series Singleton String
%type <LX_SYMBOL_CLASS> CCl Full_CCl
%type <LX_UNICODE_CHARACTER_CLASS> UCCl Full_UCCl

%start Wildcard

%%

Wildcard: Init_pattern Pattern
		{
			if description.equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		}
	;

Init_pattern: -- Empty
		{
			if description.equiv_classes_used then
				description.create_equiv_classes
			end
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
			if unicode_mode.item and $1 > {CHARACTER_8}.max_ascii_value then
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
	| BCHAR
		{
			$$ := new_nfa_from_character ($1)
		}
	| UCHAR
		{
			if $1 <= {CHARACTER_8}.max_ascii_value then
				$$ := new_nfa_from_character ($1)
			else
				$$ := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, $1)
				from i_ := 1 until i_ > buffer.count loop
					$$ := append_character_to_string (buffer.item_code (i_), $$)
					i_ := i_ + 1
				end
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
			if unicode_mode.item then
				$$ := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				$$ := new_symbol_class_nfa (question_character_class)
			end
			$$.build_closure
		}
	| '?'
		{
			if unicode_mode.item then
				$$ := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				$$ := new_symbol_class_nfa (question_character_class)
			end
		}
	| STAR_STAR_SLASH
		{
			if unicode_mode.item then
				$$ := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				$$ := new_symbol_class_nfa (question_character_class)
			end
			$$.build_positive_closure
			$$.build_concatenation (new_nfa_from_character (Slash_code))
			$$.build_closure
		}
	| CCL_OP
		{
			$$ := new_symbol_class_nfa ($1)
		}
	| Full_CCl
		{
			$$ := new_nfa_from_character_class ($1)
		}
	| UCCL_OP
		{
			$$ := new_nfa_from_unicode_character_class ($1)
		}
	| Full_UCCl
		{
			$$ := new_nfa_from_unicode_character_class ($1)
		}
	| '"' String '"'
		{
			$$ := $2
		}
	;

Full_CCl: CCL_BRACKET CCl ']'
		{
			$$ := $2
			character_classes.force ($$, $1)
		}
	| CCL_BRACKET '^' CCl ']'
		{
			$$ := $3
			$$.set_negated (True)
			character_classes.force ($$, $1)
		}
	;

Full_UCCl: UCCL_BRACKET UCCl ']'
		{
			$$ := $2
			unicode_character_classes.force ($$, $1)
		}
	| UCCL_BRACKET '^' UCCl ']'
		{
			$$ := $3
			$$.set_negated (True)
			unicode_character_classes.force ($$, $1)
		}
	;
	
CCl: CCl_char
		{
			$$ := append_character_to_character_class ($1, new_character_class)
		}
	| CCl CCl_char
		{
			$$ := append_character_to_character_class ($2, $1)
		}
	| CCl_char '-' CCl_char
		{
			$$ := append_character_set_to_character_class ($1, $3, new_character_class)
		}
	| CCl CCl_char '-' CCl_char
		{
			$$ := append_character_set_to_character_class ($2, $4, $1)
		}
	;

CCl_char: CHAR
		{
			$$ := $1
		}
	| BCHAR
		{
			$$ := $1
		}
	;
	
UCCl: UCCl_char
		{
			$$ := append_character_to_unicode_character_class ($1, new_unicode_character_class)
		}
	| UCCl UCCl_char
		{
			$$ := append_character_to_unicode_character_class ($2, $1)
		}
	| UCCl_char '-' UCCl_char
		{
			$$ := append_character_set_to_unicode_character_class ($1, $3, new_unicode_character_class)
		}
	| UCCl UCCl_char '-' UCCl_char
		{
			$$ := append_character_set_to_unicode_character_class ($2, $4, $1)
		}
	;

UCCl_char: CHAR
		{
			$$ := $1
		}
	| UCHAR
		{
			$$ := $1
		}
	;

String: -- Empty
		{
			$$ := new_epsilon_nfa
		}
	| String CHAR
		{
			if unicode_mode.item and $2 > {CHARACTER_8}.max_ascii_value then
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
	| String BCHAR
		{
			$$ := append_character_to_string ($2, $1)
		}
	| String UCHAR
		{
			if $2 <= {CHARACTER_8}.max_ascii_value then
				$$ := append_character_to_string ($2, $1)
			else
				$$ := $1
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, $2)
				from i_ := 1 until i_ > buffer.count loop
					$$ := append_character_to_string (buffer.item_code (i_), $$)
					i_ := i_ + 1
				end
			end
		}
	;

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING
			equiv_classes: detachable LX_EQUIVALENCE_CLASSES
		do
			question_string := "?"
			character_classes.search (question_string)
			if character_classes.found then
				Result := character_classes.found_item
			else
				create Result.make (description.minimum_symbol, description.maximum_symbol)
				Result.add_character (Slash_code)
				Result.set_negated (True)
				equiv_classes := description.equiv_classes
				if equiv_classes /= Void then
					equiv_classes.add (Result)
				end
				character_classes.force_new (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end

	question_unicode_character_class: LX_UNICODE_CHARACTER_CLASS
			-- "?" Unicode character class (i.e. all Unicode characters except /)
		local
			question_string: STRING
		do
			question_string := "?"
			unicode_character_classes.search (question_string)
			if unicode_character_classes.found then
				Result := unicode_character_classes.found_item
			else
				create Result.make_unicode (0, {UC_UNICODE_CONSTANTS}.maximum_unicode_character_code)
				Result.add_character (Slash_code)
				Result.set_negated (True)
				unicode_character_classes.force_new (Result, question_string)
			end
		ensure
			question_unicode_character_class_not_void: Result /= Void
		end
		
end
