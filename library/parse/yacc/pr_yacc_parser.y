%{
indexing

	description:

		"Parsers for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_YACC_PARSER

inherit

	PR_YACC_PARSER_SKELETON

	PR_YACC_SCANNER
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
		end

creation

	make

%}

%token T_TOKEN T_LEFT T_RIGHT T_NONASSOC T_EXPECT T_PREC T_START
%token T_EIFFEL T_2PERCENTS T_IDENTIFIER T_NUMBER T_ACTION
%token T_USER_CODE T_CHAR T_UNKNOWN

%expect 1

%start Grammar

%%

Grammar:
		{
			initialize_grammar
		}
	Declarations T_2PERCENTS Rules User_code
		{
			if successful then
				set_start_symbol
				process_symbols
			end
		}
	;

Declarations: -- /* empty */
		{
			precedence := 1
		}
	| Declarations Declaration
	;

Declaration: T_EIFFEL
		{
			last_grammar.eiffel_header.force_last (dollar_string ($1))
		}
	| T_TOKEN Token_declaration_list
	| T_LEFT Left_declaration_list
		{
			precedence := precedence + 1
		}
	| T_RIGHT Right_declaration_list
		{
			precedence := precedence + 1
		}
	| T_NONASSOC Nonassoc_declaration_list
		{
			precedence := precedence + 1
		}
	| T_START T_IDENTIFIER
		{
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make (dollar_string ($2), line_nb)
			end
		}
	| T_EXPECT T_NUMBER
		{
			last_grammar.set_expected_conflicts (dollar_integer ($2))
		}
	;

Token_declaration_list: -- /* empty */
	| Token_declaration_list Terminal_declaration
	| Token_declaration_list ',' Terminal_declaration
	;

Left_declaration_list: -- /* empty */
	| Left_declaration_list Terminal_declaration
		{
			set_left_associative (dollar_token ($2))
		}
	| Left_declaration_list ',' Terminal_declaration
		{
			set_left_associative (dollar_token ($3))
		}
	;

Right_declaration_list: -- /* empty */
	| Right_declaration_list Terminal_declaration
		{
			set_right_associative (dollar_token ($2))
		}
	| Right_declaration_list ',' Terminal_declaration
		{
			set_right_associative (dollar_token ($3))
		}
	;

Nonassoc_declaration_list: -- /* empty */
	| Nonassoc_declaration_list Terminal_declaration
		{
			set_non_associative (dollar_token ($2))
		}
	| Nonassoc_declaration_list ',' Terminal_declaration
		{
			set_non_associative (dollar_token ($3))
		}
	;

Terminal_declaration: T_IDENTIFIER
		{
			$$ := new_token (dollar_string ($1))
		}
	| T_CHAR
		{
			$$ := new_char_token (dollar_string ($1))
		}
	| T_IDENTIFIER T_NUMBER
		{
			$$ := new_token_with_id (dollar_string ($1), dollar_integer ($2))
		}
	| T_CHAR T_NUMBER
		{
			$$ := new_char_token_with_id (dollar_string ($1), dollar_integer ($2))
		}
	;

Rules: -- /* empty */
		{
			report_no_rules_error
		}
	| Rule
	| Rules Rule
	;

Rule: Lhs Colon Rhs_list ';'
		{
			process_rule (rule)
			rule := Void
			precedence_token := Void
		}
	;

Lhs: T_IDENTIFIER
		{
			if is_terminal (dollar_string ($1)) then
				report_lhs_symbol_token_error (dollar_string ($1))
				rule := new_rule (new_dummy_variable)
			else
				rule := new_rule (new_variable (dollar_string ($1)))
				if rule.lhs.rules.count > 1 then
					report_rule_declared_twice_warning (dollar_string ($1))
				end
			end
			precedence_token := Void
			put_rule (rule)
		}
	;

Colon: ':'
		{
			rule.set_line_nb (dollar_integer ($1))
		}
	;

Rhs_list: Rhs
	| Rhs_list Bar Rhs
	;

Rhs: -- /* empty */
		{
			nb_rhs := 0
		}
	| Rhs T_IDENTIFIER
		{
			put_symbol (new_symbol (dollar_string ($2)), rule)
			nb_rhs := nb_rhs + 1
		}
	| Rhs T_CHAR
		{
			put_symbol (new_char_token (dollar_string ($2)), rule)
			nb_rhs := nb_rhs + 1
		}
	| Rhs T_ACTION
		{
			put_action (new_action (dollar_string ($2)), rule)
			nb_rhs := nb_rhs + 1
		}
	| Rhs T_PREC Terminal
		{
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := dollar_token ($3)
			end
		}
	;

Terminal: T_IDENTIFIER
		{
			if is_terminal (dollar_string ($1)) then
				$$ := new_token (dollar_string ($1))
			else
				report_prec_not_token_error (dollar_string ($1))
				$$ := new_char_token ("'a'")
			end
		}
	| T_CHAR
		{
			$$ := new_char_token (dollar_string ($1))
		}
	;

Bar: '|'
		{
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (dollar_integer ($1))
			put_rule (rule)
		}
	;

User_code: -- /* empty */
	| T_2PERCENTS
	| T_2PERCENTS T_USER_CODE
		{
			last_grammar.set_eiffel_code (dollar_string ($2))
		}
	;

%%

end -- class PR_YACC_PARSER
