﻿%{
note

	description:

		"Parsers for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class PR_YACC_PARSER

inherit

	PR_YACC_PARSER_SKELETON

	PR_YACC_SCANNER
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
		undefine
			report_invalid_unicode_character_error
		end

create

	make

%}

%token T_TOKEN T_LEFT T_RIGHT T_NONASSOC T_EXPECT T_PREC T_START T_TYPE
%token T_2PERCENTS T_UNKNOWN

%token <STRING_32> T_CHAR
%token <STRING> T_EIFFEL T_IDENTIFIER T_ACTION T_USER_CODE T_STR
%token <STRING> T_BOOLEAN T_POINTER T_TUPLE T_AS
%token <STRING> T_INTEGER T_INTEGER_8 T_INTEGER_16 T_INTEGER_32 T_INTEGER_64
%token <STRING> T_NATURAL T_NATURAL_8 T_NATURAL_16 T_NATURAL_32 T_NATURAL_64
%token <STRING> T_REAL T_REAL_32 T_REAL_64 T_DOUBLE
%token <STRING> T_CHARACTER T_CHARACTER_8 T_CHARACTER_32
%token <STRING> T_LIKE T_CURRENT T_EXPANDED T_REFERENCE T_SEPARATE T_ATTACHED T_DETACHABLE
%token <INTEGER> T_NUMBER T_ERROR '|' ':'

%type <STRING> Identifier Eiffel_basic_type_name Qualified_identifiers
%type <detachable STRING> Type_mark Type_mark_no_expanded_reference Type_mark_no_expanded_reference_opt
%type <PR_TOKEN> Terminal Token_declaration Left_declaration Right_declaration Nonassoc_declaration
%type <PR_TYPE> Eiffel_type Eiffel_type_no_identifier
%type <DS_ARRAYED_LIST [PR_TYPE]> Eiffel_type_list Eiffel_generics
%type <DS_ARRAYED_LIST [PR_LABELED_TYPE]> Eiffel_labeled_type_list Eiffel_labeled_generics
%type <PR_LABELED_TYPE> Eiffel_labeled_type

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
	| T_TOKEN Token_symbol_type Token_declaration_list
		{
			type := Void
		}
	| T_TYPE Type_symbol_type Type_declaration_list
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

Token_symbol_type: -- Empty
		{
			type := No_type
		}
	| '<' Eiffel_type '>'
		{
			check attached $2 as l_type then
				type := l_type
				set_no_alias_name (l_type)
			end
		}
	| '<' Eiffel_type T_AS Identifier '>'
		{
			check attached $2 as l_type then
				type := l_type
				set_alias_name (l_type, $4)
			end
		}
	;

Type_symbol_type: -- Empty
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
			$$ := new_type (Void, $1)
		}
	| Eiffel_basic_type_name
		{
			$$ := new_basic_type (Void, $1)
		}
	| T_TUPLE
		{
			$$ := new_type (Void, $1)
		}
	| Eiffel_type_no_identifier
		{ $$ := $1 }
	;

Eiffel_type_no_identifier: Type_mark T_IDENTIFIER
		{
			$$ := new_type ($1, $2)
		}
	| Type_mark Eiffel_basic_type_name
		{
			$$ := new_basic_type ($1, $2)
		}
	| Type_mark T_IDENTIFIER Open_bracket Close_bracket
		{
			$$ := new_type ($1, $2)
		}
	| T_IDENTIFIER Open_bracket Close_bracket
		{
			$$ := new_type (Void, $1)
		}
	| Type_mark T_IDENTIFIER Eiffel_generics
		{
			$$ := new_generic_type ($1, $2, $3)
		}
	| T_IDENTIFIER Eiffel_generics
		{
			$$ := new_generic_type (Void, $1, $2)
		}
	| Type_mark_no_expanded_reference T_TUPLE
		{
			$$ := new_type ($1, $2)
		}
	| Type_mark_no_expanded_reference T_TUPLE Open_bracket Close_bracket
		{
			$$ := new_type ($1, $2)
		}
	| T_TUPLE Open_bracket Close_bracket
		{
			$$ := new_type (Void, $1)
		}
	| Type_mark_no_expanded_reference T_TUPLE Eiffel_generics
		{
			$$ := new_generic_type ($1, $2, $3)
		}
	| T_TUPLE Eiffel_generics
		{
			$$ := new_generic_type (Void, $1, $2)
		}
	| Type_mark_no_expanded_reference T_TUPLE Eiffel_labeled_generics
		{
			$$ := new_labeled_tuple_type ($1, $2, $3)
		}
	| T_TUPLE Eiffel_labeled_generics
		{
			$$ := new_labeled_tuple_type (Void, $1, $2)
		}
	| Type_mark_no_expanded_reference_opt T_LIKE T_IDENTIFIER
		{
			$$ := new_anchored_type ($1, $3)
		}
	| Type_mark_no_expanded_reference_opt T_LIKE T_CURRENT
		{
			$$ := new_like_current_type ($1)
		}
	| Type_mark_no_expanded_reference_opt T_LIKE T_IDENTIFIER Qualified_identifiers
		{
			$$ := new_anchored_type ($1, $3 + $4)
		}
	| Type_mark_no_expanded_reference_opt T_LIKE T_CURRENT Qualified_identifiers
		{
			$$ := new_anchored_type ($1, $3 + $4)
		}
	| Type_mark_no_expanded_reference_opt T_LIKE '{' Eiffel_type '}' Qualified_identifiers
		{
			$$ := new_qualified_anchored_type ($1, $4, $6)
		}
	;

Qualified_identifiers: '.' T_IDENTIFIER
		{
			$$ := "." + $2
		}
	| Qualified_identifiers '.' T_IDENTIFIER
		{
			$$ := $1 + "." + $3
		}
	;
	
Eiffel_basic_type_name: T_INTEGER
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
	;

Type_mark: T_EXPANDED
		{ $$ := $1 }
	| T_REFERENCE
		{ $$ := $1 }
	| T_SEPARATE
		{ $$ := $1 }
	| T_ATTACHED
		{ $$ := $1 }
	| T_ATTACHED T_SEPARATE
		{ $$ := $1 + " " + $2 }
	| T_DETACHABLE
		{ $$ := $1 }
	| T_DETACHABLE T_SEPARATE
		{ $$ := $1 + " " + $2 }
	| '!'
		{ $$ := "!" }
	| '!' T_SEPARATE
		{ $$ := "! " + $2 }
	| '?'
		{ $$ := "?" }
	| '?' T_SEPARATE
		{ $$ := "? " + $2 }
	;

Type_mark_no_expanded_reference: T_SEPARATE
		{ $$ := $1 }
	| T_ATTACHED
		{ $$ := $1 }
	| T_ATTACHED T_SEPARATE
		{ $$ := $1 + " " + $2 }
	| T_DETACHABLE
		{ $$ := $1 }
	| T_DETACHABLE T_SEPARATE
		{ $$ := $1 + " " + $2 }
	| '!'
		{ $$ := "!" }
	| '!' T_SEPARATE
		{ $$ := "! " + $2 }
	| '?'
		{ $$ := "?" }
	| '?' T_SEPARATE
		{ $$ := "? " + $2 }
	;
	
Type_mark_no_expanded_reference_opt: -- Empty
		{ $$ := Void }
	| Type_mark_no_expanded_reference
		{ $$ := $1 }
	;

Eiffel_generics: Open_bracket Eiffel_type_list Close_bracket
		{
			$$ := $2
		}
	;

Open_bracket: '['
		{
			in_generics := in_generics + 1
		}
	;

Close_bracket: ']'
		{
			in_generics := in_generics - 1
		}
	;
	
Eiffel_type_list: Eiffel_type
		{
			create $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_type_no_identifier ',' Eiffel_type_list
		{
			$$ := $3
			$$.force_first ($1)
		}
	| T_IDENTIFIER ',' Eiffel_type_list
		{
			$$ := $3
			$$.force_first (new_type (Void, $1))
		}
	| Eiffel_basic_type_name ',' Eiffel_type_list
		{
			$$ := $3
			$$.force_first (new_basic_type (Void, $1))
		}
	| T_TUPLE ',' Eiffel_type_list
		{
			$$ := $3
			$$.force_first (new_type (Void, $1))
		}
	;

Eiffel_labeled_generics: Open_bracket Eiffel_labeled_type_list Close_bracket
		{
			$$ := $2
		}
	;

Eiffel_labeled_type_list: Eiffel_labeled_type
		{
			create $$.make (5)
			$$.force_last ($1)
		}
	| Eiffel_labeled_type ';' Eiffel_labeled_type_list
		{
			$$ := $3
			$$.force_first ($1)
		}
	| T_IDENTIFIER ',' Eiffel_labeled_type_list
		{
			$$ := $3
			$$.first.labels.force_first ($1)
		}
	| Eiffel_basic_type_name ',' Eiffel_labeled_type_list
		{
			$$ := $3
			$$.first.labels.force_first ($1)
		}
	| T_TUPLE ',' Eiffel_labeled_type_list
		{
			$$ := $3
			$$.first.labels.force_first ($1)
		}
	;

Eiffel_labeled_type: T_IDENTIFIER ':' Eiffel_type
		{
			$$ := new_labeled_type ($1, $3)
		}
	;

Token_declaration_list: -- Empty
	| Token_declaration_list Token_declaration
	| Token_declaration_list ',' Token_declaration
	;

Token_declaration: Identifier
		{
			check type_not_void: attached type as l_type then
				$$ := new_terminal ($1, l_type)
			end
		}
	| Identifier T_NUMBER
		{
			check type_not_void: attached type as l_type then
				$$ := new_terminal ($1, l_type)
				set_token_id ($$, $2)
			end
		}
	| Identifier T_STR
		{
			check type_not_void: attached type as l_type then
				$$ := new_terminal ($1, l_type)
				set_literal_string ($$, $2)
			end
		}
	| Identifier T_NUMBER T_STR
		{
			check type_not_void: attached type as l_type then
				$$ := new_terminal ($1, l_type)
				set_token_id ($$, $2)
				set_literal_string ($$, $3)
			end
		}
	| T_CHAR
		{
			check type_not_void: attached type as l_type then
				$$ := new_char_terminal ($1, l_type)
			end
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
			check type_not_void: attached type as l_type then
				$$ := new_nonterminal ($1, l_type)
			end
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
			check rule_not_void: attached rule as l_rule then
				process_rule (l_rule)
				rule := Void
				precedence_token := Void
			end
		}
	;

Lhs: Identifier
		{
			if is_terminal ($1) then
				report_lhs_symbol_token_error ($1)
				check rule_not_void: attached new_rule (new_midrule_variable) as l_rule then
					rule := l_rule
					put_rule (l_rule)
				end
			else
				check rule_not_void: attached new_rule (new_variable ($1)) as l_rule then
					rule := l_rule
					if l_rule.lhs.rules.count > 1 then
						report_rule_declared_twice_warning ($1)
					end
					put_rule (l_rule)
				end
			end
			precedence_token := Void
		}
	;

Colon: ':'
		{
			check rule_not_void: attached rule as l_rule then
				l_rule.set_line_nb ($1)
			end
		}
	;

Rhs_list: Rhs_errors
	| Rhs_list Bar Rhs_errors
	;

Rhs_errors: Rhs
	| Rhs_errors T_ERROR '(' T_NUMBER ')' T_ACTION
		{
			check rule_not_void: attached rule as l_rule then
				if $4 < 1 or $4 > l_rule.error_actions.count then
					report_invalid_error_n_error ($4)
				else
					put_error_action (new_error_action ($6, $2), $4, l_rule)
				end
			end
		}
	;

Rhs: -- Empty
	| Rhs Identifier
		{
			check rule_not_void: attached rule as l_rule then
				put_symbol (new_symbol ($2), l_rule)
			end
		}
	| Rhs T_CHAR
		{
			check rule_not_void: attached rule as l_rule then
				put_symbol (new_char_token ($2), l_rule)
			end
		}
	| Rhs T_STR
		{
			check rule_not_void: attached rule as l_rule then
				put_symbol (new_string_token ($2), l_rule)
			end
		}
	| Rhs T_ACTION
		{
			check rule_not_void: attached rule as l_rule then
				put_action (new_action ($2), l_rule)
			end
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
			check rule_not_void: attached rule as l_rule then
				process_rule (l_rule)
				check new_rule_not_void: attached new_rule (l_rule.lhs) as l_new_rule then
					rule := l_new_rule
					precedence_token := Void
					l_new_rule.set_line_nb ($1)
					put_rule (l_new_rule)
				end
			end
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
	| Eiffel_basic_type_name
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
	| T_AS
		{ $$ := $1 }
	;

%%

end
