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

%token T_TOKEN T_LEFT T_RIGHT T_NONASSOC T_EXPECT T_PREC T_START T_TYPE
%token T_2PERCENTS T_UNKNOWN

%token <STRING>		T_EIFFEL T_IDENTIFIER T_ACTION T_USER_CODE T_CHAR
%token <STRING>		T_INTEGER T_BOOLEAN T_CHARACTER T_REAL T_DOUBLE T_POINTER
%token <INTEGER>	T_NUMBER '|' ':'

%type <STRING>		Identifier
%type <PR_TOKEN>	Terminal Token Left_token Right_token Nonassoc_token
%type <PR_TYPE>		Eiffel_type
%type <DS_ARRAYED_LIST [PR_TYPE]>	Eiffel_type_list Eiffel_generics

%expect 7

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

Declarations: -- Empty
		{
			precedence := 1
		}
	| Declarations Declaration
	;

Declaration: T_EIFFEL
		{
			last_grammar.eiffel_header.force_last ($1)
		}
	| T_TOKEN Symbol_type Token_declaration_list
		{
			type := Void
		}
	| T_TYPE Symbol_type Type_declaration_list
		{
			type := Void
		}
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
	| T_START Identifier
		{
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make ($2, line_nb)
			end
		}
	| T_EXPECT T_NUMBER
		{
			last_grammar.set_expected_conflicts ($2)
		}
	;

Symbol_type: -- Empty
		{
			type := No_type
		}
	| '<' Eiffel_type '>'
		{
			type := $2
		}
	;

Eiffel_type: T_IDENTIFIER
		{
			$$ := new_type ($1)
		}
	| T_INTEGER
		{
			$$ := new_basic_type ($1)
		}
	| T_BOOLEAN
		{
			$$ := new_basic_type ($1)
		}
	| T_CHARACTER
		{
			$$ := new_basic_type ($1)
		}
	| T_REAL
		{
			$$ := new_basic_type ($1)
		}
	| T_DOUBLE
		{
			$$ := new_basic_type ($1)
		}
	| T_POINTER
		{
			$$ := new_basic_type ($1)
		}
	| T_IDENTIFIER Eiffel_generics
		{
			$$ := new_generic_type ($1, $2)
		}
	;

Eiffel_generics: '[' Eiffel_type_list ']'
		{
			$$ := $2
		}
	;

Eiffel_type_list: -- Empty
		{
			$$ := Void
		}
	| Eiffel_type
		{
			!! $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_type_list ',' Eiffel_type
		{
			$$ := $1
			$$.force_last ($3)
		}
	;

Token_declaration_list: -- Empty
	| Token_declaration_list Token_declaration
	| Token_declaration_list ',' Token_declaration
	;

Token_declaration: Token
	| Token T_NUMBER
		{
			($1).set_token_id ($2)
		}
	;

Token: Identifier
		{
			$$ := new_terminal ($1, type)
		}
	| T_CHAR
		{
			$$ := new_char_terminal ($1, type)
		}
	;

Left_declaration_list: -- Empty
	| Left_declaration_list Left_declaration
	| Left_declaration_list ',' Left_declaration
	;

Left_declaration: Left_token
	| Left_token T_NUMBER
		{
			($1).set_token_id ($2)
		}
	;

Left_token: Identifier
		{
			$$ := new_left_terminal ($1, precedence)
		}
	| T_CHAR
		{
			$$ := new_left_char_terminal ($1, precedence)
		}
	;

Right_declaration_list: -- Empty
	| Right_declaration_list Right_declaration
	| Right_declaration_list ',' Right_declaration
	;

Right_declaration: Right_token
	| Right_token T_NUMBER
		{
			($1).set_token_id ($2)
		}
	;

Right_token: Identifier
		{
			$$ := new_right_terminal ($1, precedence)
		}
	| T_CHAR
		{
			$$ := new_right_char_terminal ($1, precedence)
		}
	;

Nonassoc_declaration_list: -- Empty
	| Nonassoc_declaration_list Nonassoc_declaration
	| Nonassoc_declaration_list ',' Nonassoc_declaration
	;

Nonassoc_declaration: Nonassoc_token
	| Nonassoc_token T_NUMBER
		{
			($1).set_token_id ($2)
		}
	;

Nonassoc_token: Identifier
		{
			$$ := new_nonassoc_terminal ($1, precedence)
		}
	| T_CHAR
		{
			$$ := new_nonassoc_char_terminal ($1, precedence)
		}
	;

Type_declaration_list: -- Empty
	| Type_declaration_list Nonterminal_declaration
	| Type_declaration_list ',' Nonterminal_declaration
	;

Nonterminal_declaration: Identifier
		{
			$$ := new_nonterminal ($1, type)
		}
	;

Rules: -- Empty
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

Lhs: Identifier
		{
			if is_terminal ($1) then
				report_lhs_symbol_token_error ($1)
				rule := new_rule (new_dummy_variable)
			else
				rule := new_rule (new_variable ($1))
				if rule.lhs.rules.count > 1 then
					report_rule_declared_twice_warning ($1)
				end
			end
			precedence_token := Void
			put_rule (rule)
		}
	;

Colon: ':'
		{
			rule.set_line_nb ($1)
		}
	;

Rhs_list: Rhs
	| Rhs_list Bar Rhs
	;

Rhs: -- Empty
	| Rhs Identifier
		{
			put_symbol (new_symbol ($2), rule)
		}
	| Rhs T_CHAR
		{
			put_symbol (new_char_token ($2), rule)
		}
	| Rhs T_ACTION
		{
			put_action (new_action ($2), rule)
		}
	| Rhs T_PREC Terminal
		{
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := $3
			end
		}
	;

Terminal: Identifier
		{
			if is_terminal ($1) then
				$$ := new_token ($1)
			else
				report_prec_not_token_error ($1)
				$$ := new_char_token ("'a'")
			end
		}
	| T_CHAR
		{
			$$ := new_char_token ($1)
		}
	;

Bar: '|'
		{
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb ($1)
			put_rule (rule)
		}
	;

User_code: -- Empty
	| T_2PERCENTS
	| T_2PERCENTS T_USER_CODE
		{
			last_grammar.set_eiffel_code ($2)
		}
	;

Identifier: T_IDENTIFIER
		{ $$ := $1 }
	| T_INTEGER
		{ $$ := $1 }
	| T_BOOLEAN
		{ $$ := $1 }
	| T_CHARACTER
		{ $$ := $1 }
	| T_REAL
		{ $$ := $1 }
	| T_DOUBLE
		{ $$ := $1 }
	| T_POINTER
		{ $$ := $1 }
	;

%%

end -- class PR_YACC_PARSER
