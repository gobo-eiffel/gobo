%{
indexing

	description:

		"Parsers for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value
		end

	LX_WILDCARD_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value
		end

create

	make, make_from_description

feature
%}

%token STAR_STAR_SLASH STAR_PAREN
%token <INTEGER> CHAR
%token <LX_SYMBOL_CLASS> CCL_OP
%token <STRING> '['

%type <LX_NFA> Rule Pattern_list Series Singleton String
%type <LX_SYMBOL_CLASS> CCl Full_CCl

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
			$$ := new_nfa_from_character ($1)
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
			$$ := new_symbol_class_nfa (question_character_class)
			$$.build_closure
		}
	| '?'
		{
			$$ := new_symbol_class_nfa (question_character_class)
		}
	| STAR_STAR_SLASH
		{
			$$ := new_symbol_class_nfa (question_character_class)
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
	| '"' String '"'
		{
			$$ := $2
		}
	;

Full_CCl: '[' CCl ']'
		{
			$$ := $2
			character_classes.force ($$, $1)
		}
	| '[' '^' CCl  ']'
		{
			$$ := $3
			$$.set_negated (True)
			character_classes.force ($$, $1)
		}
	;

CCl: CHAR
		{
			$$ := append_character_to_character_class ($1, new_character_class)
		}
	| CCl CHAR
		{
			$$ := append_character_to_character_class ($2, $1)
		}
	| CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class
				($1, $3, new_character_class)
		}
	| CCl CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class ($2, $4, $1)
		}
	;
	
String: -- Empty
		{
			$$ := new_epsilon_nfa
		}
	| String CHAR
		{
			$$ := append_character_to_string ($2, $1)
		}
	;

%%

feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS is
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING
			equiv_classes: LX_EQUIVALENCE_CLASSES
		do
			question_string := "?"
			if character_classes.has (question_string) then
				Result := character_classes.item (question_string)
			else
				create Result.make (1)
				Result.put (Slash_code)
				Result.set_negated (True)
				equiv_classes := description.equiv_classes
				if equiv_classes /= Void then
					equiv_classes.add (Result)
				end
				character_classes.force (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end

end
