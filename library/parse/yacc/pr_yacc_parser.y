%{
indexing

	description:

		"Parsers for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_YACC_PARSER

inherit

	PR_YACC_PARSER_SKELETON

	PR_YACC_SCANNER
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
		end

create

	make

%}

%token T_TOKEN T_LEFT T_RIGHT T_NONASSOC T_EXPECT T_PREC T_START T_TYPE
%token T_2PERCENTS T_UNKNOWN

%token <STRING> T_EIFFEL T_IDENTIFIER T_ACTION T_USER_CODE T_CHAR T_STR
%token <STRING> T_BOOLEAN T_POINTER T_TUPLE
%token <STRING> T_INTEGER T_INTEGER_8 T_INTEGER_16 T_INTEGER_32 T_INTEGER_64
%token <STRING> T_NATURAL T_NATURAL_8 T_NATURAL_16 T_NATURAL_32 T_NATURAL_64
%token <STRING> T_REAL T_REAL_32 T_REAL_64 T_DOUBLE
%token <STRING> T_CHARACTER T_CHARACTER_8 T_CHARACTER_32
%token <STRING> T_LIKE T_CURRENT T_EXPANDED T_REFERENCE T_SEPARATE T_ATTACHED T_DETACHABLE
%token <INTEGER> T_NUMBER T_ERROR '|' ':'

%type <STRING> Identifier
%type <STRING> Type_mark_opt Attached_type_mark_opt
%type <PR_TOKEN> Terminal Token_declaration Left_declaration Right_declaration Nonassoc_declaration
%type <PR_TYPE> Eiffel_type
%type <DS_ARRAYED_LIST [PR_TYPE]> Eiffel_type_list Eiffel_generics
%type <DS_ARRAYED_LIST [PR_LABELED_TYPE]> Eiffel_labeled_type_list Eiffel_labeled_generics
%type <PR_LABELED_TYPE> Eiffel_labeled_type
%type <DS_ARRAYED_LIST [STRING]> Eiffel_identifier_list

%expect 29

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
				create start_symbol.make ($2, line_nb)
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

Eiffel_type: Type_mark_opt T_IDENTIFIER
		{
			$$ := new_type ($1, $2)
		}
	| Type_mark_opt T_INTEGER
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_INTEGER_8
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_INTEGER_16
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_INTEGER_32
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_INTEGER_64
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_NATURAL
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_NATURAL_8
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_NATURAL_16
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_NATURAL_32
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_NATURAL_64
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_BOOLEAN
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_CHARACTER
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_CHARACTER_8
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_CHARACTER_32
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_REAL
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_REAL_32
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_REAL_64
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_DOUBLE
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_POINTER
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark_opt T_IDENTIFIER '[' ']'
		{
			$$ := new_type ($1, $2)
		}
	| Type_mark_opt T_IDENTIFIER Eiffel_generics
		{
			$$ := new_generic_type ($1, $2, $3)
		}
	| Attached_type_mark_opt T_TUPLE
		{
			$$ := new_type ($1, $2)
		}
	| Attached_type_mark_opt T_TUPLE '[' ']'
		{
			$$ := new_type ($1, $2)
		}
	| Attached_type_mark_opt T_TUPLE Eiffel_generics
		{
			$$ := new_generic_type ($1, $2, $3)
		}
	| Attached_type_mark_opt T_TUPLE Eiffel_labeled_generics
		{
			$$ := new_labeled_tuple_type ($1, $2, $3)
		}
	| Attached_type_mark_opt T_LIKE T_IDENTIFIER
		{
			$$ := new_anchored_type ($1, $3)
		}
	| Attached_type_mark_opt T_LIKE T_CURRENT
		{
			$$ := new_like_current_type ($1)
		}
	;

Type_mark_opt: -- Empty
	| T_EXPANDED
		{ $$ := $1 }
	| T_REFERENCE
		{ $$ := $1 }
	| T_SEPARATE
		{ $$ := $1 }
	| T_ATTACHED
		{ $$ := $1 }
	| T_DETACHABLE
		{ $$ := $1 }
	| '!'
		{ $$ := "!" }
	| '?'
		{ $$ := "?" }
	;

Attached_type_mark_opt: -- Empty
	| T_ATTACHED
		{ $$ := $1 }
	| T_DETACHABLE
		{ $$ := $1 }
	| '!'
		{ $$ := "!" }
	| '?'
		{ $$ := "?" }
	;

Eiffel_generics: '[' Eiffel_type_list ']'
		{
			$$ := $2
		}
	;

Eiffel_type_list: Eiffel_type
		{
			create $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_type_list ',' Eiffel_type
		{
			$$ := $1
			$$.force_last ($3)
		}
	;

Eiffel_labeled_generics: '[' Eiffel_labeled_type_list ']'
		{
			$$ := $2
		}
	;

Eiffel_labeled_type_list: Eiffel_labeled_type
		{
			create $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_labeled_type_list ';' Eiffel_labeled_type
		{
			$$ := $1
			$$.force_last ($3)
		}
	;

Eiffel_labeled_type: Eiffel_identifier_list ':' Eiffel_type
		{
			$$ := new_labeled_type ($1, $3)
		}
	;

Eiffel_identifier_list: T_IDENTIFIER
		{
			create $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_identifier_list ',' T_IDENTIFIER
		{
			$$ := $1
			$$.force_last ($3)
		}
	;

Token_declaration_list: -- Empty
	| Token_declaration_list Token_declaration
	| Token_declaration_list ',' Token_declaration
	;

Token_declaration: Identifier
		{
			$$ := new_terminal ($1, type)
		}
	| Identifier T_NUMBER
		{
			$$ := new_terminal ($1, type)
			set_token_id ($$, $2)
		}
	| Identifier T_STR
		{
			$$ := new_terminal ($1, type)
			set_literal_string ($$, $2)
		}
	| Identifier T_NUMBER T_STR
		{
			$$ := new_terminal ($1, type)
			set_token_id ($$, $2)
			set_literal_string ($$, $3)
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

Left_declaration: Identifier
		{
			$$ := new_left_terminal ($1, precedence)
		}
	| Identifier T_NUMBER
		{
			$$ := new_left_terminal ($1, precedence)
			set_token_id ($$, $2)
		}
	| Identifier T_STR
		{
			$$ := new_left_terminal ($1, precedence)
			set_literal_string ($$, $2)
		}
	| Identifier T_NUMBER T_STR
		{
			$$ := new_left_terminal ($1, precedence)
			set_token_id ($$, $2)
			set_literal_string ($$, $3)
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

Right_declaration: Identifier
		{
			$$ := new_right_terminal ($1, precedence)
		}
	| Identifier T_NUMBER
		{
			$$ := new_right_terminal ($1, precedence)
			set_token_id ($$, $2)
		}
	| Identifier T_STR
		{
			$$ := new_right_terminal ($1, precedence)
			set_literal_string ($$, $2)
		}
	| Identifier T_NUMBER T_STR
		{
			$$ := new_right_terminal ($1, precedence)
			set_token_id ($$, $2)
			set_literal_string ($$, $3)
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

Nonassoc_declaration: Identifier
		{
			$$ := new_nonassoc_terminal ($1, precedence)
		}
	| Identifier T_NUMBER
		{
			$$ := new_nonassoc_terminal ($1, precedence)
			set_token_id ($$, $2)
		}
	| Identifier T_STR
		{
			$$ := new_nonassoc_terminal ($1, precedence)
			set_literal_string ($$, $2)
		}
	| Identifier T_NUMBER T_STR
		{
			$$ := new_nonassoc_terminal ($1, precedence)
			set_token_id ($$, $2)
			set_literal_string ($$, $3)
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

Rhs_list: Rhs_errors
	| Rhs_list Bar Rhs_errors
	;

Rhs_errors: Rhs
	| Rhs_errors T_ERROR '(' T_NUMBER ')' T_ACTION
		{
			if $4 < 1 or $4 > rule.error_actions.count then
				report_invalid_error_n_error ($4)
			else
				put_error_action (new_error_action ($6, $2), $4, rule)
			end
		}
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
	| Rhs T_STR
		{
			put_symbol (new_string_token ($2), rule)
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
	| T_INTEGER_8
		{ $$ := $1 }
	| T_INTEGER_16
		{ $$ := $1 }
	| T_INTEGER_32
		{ $$ := $1 }
	| T_INTEGER_64
		{ $$ := $1 }
	| T_NATURAL
		{ $$ := $1 }
	| T_NATURAL_8
		{ $$ := $1 }
	| T_NATURAL_16
		{ $$ := $1 }
	| T_NATURAL_32
		{ $$ := $1 }
	| T_NATURAL_64
		{ $$ := $1 }
	| T_BOOLEAN
		{ $$ := $1 }
	| T_CHARACTER
		{ $$ := $1 }
	| T_CHARACTER_8
		{ $$ := $1 }
	| T_CHARACTER_32
		{ $$ := $1 }
	| T_REAL
		{ $$ := $1 }
	| T_REAL_32
		{ $$ := $1 }
	| T_REAL_64
		{ $$ := $1 }
	| T_DOUBLE
		{ $$ := $1 }
	| T_POINTER
		{ $$ := $1 }
	| T_TUPLE
		{ $$ := $1 }
	| T_LIKE
		{ $$ := $1 }
	| T_CURRENT
		{ $$ := $1 }
	| T_EXPANDED
		{ $$ := $1 }
	| T_REFERENCE
		{ $$ := $1 }
	| T_SEPARATE
		{ $$ := $1 }
	| T_ATTACHED
		{ $$ := $1 }
	| T_DETACHABLE
		{ $$ := $1 }
	;

%%

end
