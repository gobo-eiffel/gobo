%{
indexing

	description:

		"Parsers for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_PARSER

inherit

	LX_LEX_PARSER_SKELETON

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		end

creation

	make, make_from_description

%}

%token CHAR NUMBER ENDSECT NAME EOF_OP CCL_OP
%token EIF_CODE PIPED EMPTY

%start Scanner_description

%%

Scanner_description: Section1 Section2 Init_rule Section3
		{
			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		}
	;

Section1: ENDSECT
		{
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
			end
		}
	;

Section2: -- /* empty */
	| Section2 Start_condition Init_rule Pattern Action
		{
			start_condition_stack.keep_first (dollar_integer ($2))
		}
	| Section2 Start_condition '{' Section2 '}'
		{
			start_condition_stack.keep_first (dollar_integer ($2))
		}
	;

Action: -- /* empty */
	| EIF_CODE
		{
			set_action (dollar_string ($1))
		}
	| PIPED
	| EMPTY
		{
			set_action ("")
		}
	;

Init_rule: -- /* empty */
		{
				-- Initialize for a parse of one rule.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (rules.count + 1)
		}
	;

Start_condition: -- /* empty */
		{
			$$ := start_condition_stack.count
		}
	| Less_than '*' '>'
		{
			start_condition_stack.append_start_conditions (start_conditions)
		}
	| Less_than Name_list '>'
	;

Less_than: '<'
		{
			$$ := start_condition_stack.count
		}
	;

Name_list: NAME
		{
			push_start_condition (dollar_string ($1), start_condition_stack)
		}
	| Name_list ',' NAME
		{
			push_start_condition (dollar_string ($3), start_condition_stack)
		}
	| error
		{
			report_bad_start_condition_list_error
		}
	;

Pattern: '^' Rule
		{
			process_bol_rule (dollar_nfa ($2))
		}
	| Rule
		{
			process_rule (dollar_nfa ($1))
		}
	| EOF_OP
		{
			process_eof_rule
		}
	| error
		{
			report_unrecognized_rule_error
		}
	;

Rule: Regular_expression2 Regular_expression
		{
			$$ := append_trail_context_to_regexp
				(dollar_nfa ($2), dollar_nfa ($1))
		}
	| Regular_expression '$'
		{
			$$ := append_eol_to_regexp (dollar_nfa ($1))
		}
	| Regular_expression
		{
			-- $$ := $1
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
	| Regular_expression '|' Series
		{
			variable_length := True
			$$ := dollar_nfa ($1) | dollar_nfa ($3)
		}
	;

Regular_expression2: Regular_expression '/'
		{
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
	| Series Singleton
		{
			$$ := dollar_nfa ($1) & dollar_nfa ($2)
		}
	;

Singleton: CHAR
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character (dollar_integer ($1))
		}
	| Singleton '*'
		{
			variable_length := True
			$$ := |*| dollar_nfa ($1)
		}
	| Singleton '+'
		{
			variable_length := True
			$$ := |+| dollar_nfa ($1)
		}
	| Singleton '?'
		{
			variable_length := True
			$$ := |?| dollar_nfa ($1)
		}
	| Singleton '{' NUMBER ',' NUMBER '}'
		{
			variable_length := True
			$$ := new_bounded_iteration_nfa
				(dollar_nfa ($1), dollar_integer ($3), dollar_integer ($5))
		}
	| Singleton '{' NUMBER ',' '}'
		{
			variable_length := True
			$$ := new_unbounded_iteration_nfa
				(dollar_nfa ($1), dollar_integer ($3))
		}
	| Singleton '{' NUMBER '}'
		{
				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			$$ := new_iteration_nfa (dollar_nfa ($1), dollar_integer ($3))
		}
	| '.'
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa (dot_character_class)
		}
	| CCL_OP
		{
			rule_length := rule_length + 1
			$$ := new_symbol_class_nfa (dollar_symbol_class ($1))
		}
	| Full_CCl
		{
			rule_length := rule_length + 1
			$$ := new_nfa_from_character_class (dollar_symbol_class ($1))
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
			character_classes.force
				(dollar_symbol_class ($2), dollar_string ($1))
			$$ := $2
		}
	| '[' '^' CCl  ']'
		{
			dollar_symbol_class ($3).set_negated (True)
			character_classes.force
				(dollar_symbol_class ($3), dollar_string ($1))
			$$ := $3
		}
	;

CCl: CHAR
		{
			$$ := append_character_to_character_class
				(dollar_integer ($1), new_character_class)
		}
	| CCl CHAR
		{
			$$ := append_character_to_character_class
				(dollar_integer ($2), dollar_symbol_class ($1))
		}
	| CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class
				(dollar_integer ($1), dollar_integer ($3),
				new_character_class)
		}
	| CCl CHAR '-' CHAR
		{
			$$ := append_character_set_to_character_class
				(dollar_integer ($2), dollar_integer ($4),
				dollar_symbol_class ($1))
		}
	;
	
String: -- /* empty */
		{
			$$ := new_epsilon_nfa
		}
	| String CHAR
		{
			rule_length := rule_length + 1
			$$ := append_character_to_string
				(dollar_integer ($2), dollar_nfa ($1))
		}
	;

Section3: -- /* empty */
	| ENDSECT
	| ENDSECT EIF_CODE
		{
			eiffel_code := dollar_string ($2)
		}
	;

%%

end -- class LX_LEX_PARSER
