%{
indexing

	description:

		"Parsers for regular expressions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_REGEXP_PARSER

inherit

	LX_LEX_PARSER_SKELETON

	LX_REGEXP_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		end

creation

	make, make_from_description

feature
%}

%token <INTEGER>			CHAR NUMBER
%token <LX_SYMBOL_CLASS>	CCL_OP
%token <STRING>				'['

%type <LX_NFA>				Rule Regular_expression Regular_expression2
							Series Singleton String
%type <LX_SYMBOL_CLASS>		CCl Full_CCl

%start Regexp

%%

Regexp: Init_pattern Pattern
		{
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		}
	;

Init_pattern: -- Empty
		{
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
			end
				-- Initialize for a parse of one pattern.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (1)
		}
	;

Pattern: '^' Rule
		{
			process_bol_rule ($2)
		}
	| Rule
		{
			process_rule ($1)
		}
	| error
		{
			report_unrecognized_rule_error
		}
	;

Rule: Regular_expression2 Regular_expression
		{
			$$ := append_trail_context_to_regexp ($2, $1)
		}
	| Regular_expression '$'
		{
			$$ := append_eol_to_regexp ($1)
		}
	| Regular_expression
		{
			$$ := $1
		}
	| Regular_expression2 Regular_expression2
		{
			report_trailing_context_used_twice_error
		}
	| Regular_expression2 Regular_expression '$'
		{
			report_trailing_context_used_twice_error
		}
	;

Regular_expression: Series
		{ $$ := $1 }
	| Regular_expression '|' Series
		{
			variable_length := True
			$$ := $1 | $3
		}
	;

Regular_expression2: Regular_expression '/'
		{
			$$ := $1
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			if variable_length then
					-- We hope the trailing context is fixed-length.
				variable_length := False
			else
				head_count := rule_length
			end
			rule_length := 0
			in_trail_context := True
		}
	;

Series: Singleton
		{ $$ := $1 }
	| Series Singleton
		{
			$$ := $1 & $2
		}
	;

Singleton: CHAR
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character ($1)
		}
	| Singleton '*'
		{
			variable_length := True
			$$ := |*| $1
		}
	| Singleton '+'
		{
			variable_length := True
			$$ := |+| $1
		}
	| Singleton '?'
		{
			variable_length := True
			$$ := |?| $1
		}
	| Singleton '{' NUMBER ',' NUMBER '}'
		{
			variable_length := True
			$$ := new_bounded_iteration_nfa ($1, $3, $5)
		}
	| Singleton '{' NUMBER ',' '}'
		{
			variable_length := True
			$$ := new_unbounded_iteration_nfa ($1, $3)
		}
	| Singleton '{' NUMBER '}'
		{
				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			$$ := new_iteration_nfa ($1, $3)
		}
	| '.'
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa (dot_character_class)
		}
	| CCL_OP
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa ($1)
		}
	| Full_CCl
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character_class ($1)
		}
	| '"' String '"'
		{
			$$ := $2
		}
	| '(' Regular_expression ')'
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
			rule_length := rule_length + 1
			$$ := append_character_to_string ($2, $1)
		}
	;

%%

end -- class LX_REGEXP_PARSER
