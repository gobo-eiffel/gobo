%{
note

	description:

		"Eiffel type parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_PARSER

inherit

	ET_TYPE_PARSER_SKELETON
		undefine
			read_token
		redefine
			system_processor
		end

	ET_TYPE_SCANNER
		rename
			make as make_type_scanner
		undefine
			reset, set_syntax_error
		redefine
			system_processor
		end

create

	make

%}

%token <detachable ET_KEYWORD> E_ALIAS E_ALL E_AS E_CHECK
%token <detachable ET_KEYWORD> E_CLASS E_CREATE E_CREATION E_DEBUG
%token <detachable ET_KEYWORD> E_DO E_ELSE E_ELSEIF E_END E_ENSURE
%token <detachable ET_KEYWORD> E_EXPORT E_EXTERNAL E_FEATURE E_FROM E_FROZEN
%token <detachable ET_KEYWORD> E_IF E_INDEXING E_INHERIT E_INSPECT
%token <detachable ET_KEYWORD> E_IS E_LIKE E_LOCAL E_LOOP E_NOTE E_OBSOLETE
%token <detachable ET_KEYWORD> E_ONCE E_ONCE_STRING E_REDEFINE E_RENAME E_REQUIRE
%token <detachable ET_KEYWORD> E_RESCUE E_SELECT E_STRIP E_WHEN
%token <detachable ET_KEYWORD> E_THEN E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT
%token <detachable ET_KEYWORD> E_DEFERRED E_EXPANDED E_REFERENCE E_SEPARATE
%token <detachable ET_KEYWORD> E_ATTACHED E_DETACHABLE
%token <detachable ET_KEYWORD> E_ATTRIBUTE E_CONVERT E_ASSIGN
%token <detachable ET_KEYWORD> E_ACROSS E_SOME
%token <detachable ET_AGENT_KEYWORD> E_AGENT
%token <detachable ET_INVARIANT_KEYWORD> E_INVARIANT
%token <detachable ET_PRECURSOR_KEYWORD> E_PRECURSOR
%token <detachable ET_BOOLEAN_CONSTANT> E_FALSE E_TRUE
%token <detachable ET_CURRENT> E_CURRENT
%token <detachable ET_IDENTIFIER> E_IDENTIFIER E_TUPLE E_NONE
%token <detachable ET_KEYWORD_OPERATOR> E_AND E_OR E_XOR E_NOT E_IMPLIES
%token <detachable ET_RESULT> E_RESULT
%token <detachable ET_RETRY_INSTRUCTION> E_RETRY
%token <detachable ET_VOID> E_VOID
%token <detachable ET_KEYWORD> E_OLD

%token <detachable ET_POSITION> E_UNKNOWN

%token <detachable ET_SYMBOL> '{' '}'
%token <detachable ET_SYMBOL> '(' ')' ':' ',' ']' '.' '!'
%token <detachable ET_SEMICOLON_SYMBOL> ';'
%token <detachable ET_BRACKET_SYMBOL> '['
%token <detachable ET_QUESTION_MARK_SYMBOL> '?'

%type <detachable ET_ACTUAL_PARAMETER_ITEM> Type_no_identifier_comma
%type <detachable ET_ACTUAL_PARAMETER_ITEM> Tuple_labeled_actual_parameter Tuple_labeled_actual_parameter_semicolon
%type <detachable ET_ACTUAL_PARAMETER_LIST> Actual_parameters_opt Actual_parameter_list Actual_parameters
%type <detachable ET_ACTUAL_PARAMETER_LIST> Tuple_actual_parameters_opt Tuple_actual_parameters
%type <detachable ET_ACTUAL_PARAMETER_LIST> Tuple_labeled_actual_parameter_list
%type <detachable ET_IDENTIFIER> Identifier Class_name
%type <detachable ET_LIKE_TYPE> Anchored_type Anchored_type_with_no_type_mark
%type <detachable ET_QUALIFIED_LIKE_IDENTIFIER> Qualified_anchored_type Qualified_anchored_type_with_no_type_mark
%type <detachable ET_SEMICOLON_SYMBOL> Semicolon
%type <detachable ET_TYPE> Root_type Type Type_no_class_name Type_no_identifier

%start Root_type

%%
------------------------------------------------------------------------------------

Root_type: Type
		{ last_type := $1 }
	;

Type: Class_name
		{ $$ := new_named_type (Void, $1, Void) }
	| Type_no_class_name
		{ $$ := $1 }
	;
	
Type_no_class_name: Class_name Actual_parameters
		{ $$ := new_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_ATTACHED Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| '!' E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| '?' E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| Anchored_type
		{ $$ := $1 }
	| E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (Void, $1, $2) }
	| E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_ATTACHED E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '!' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '?' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	;

Type_no_identifier: Class_name Actual_parameters
		{ $$ := new_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_ATTACHED Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| '!' E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| '?' E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| Anchored_type
		{ $$ := $1 }
	| E_TUPLE Tuple_actual_parameters
		{ $$ := new_tuple_type (Void, $1, $2) }
	| E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_ATTACHED E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '!' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '?' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	;

Actual_parameters_opt: -- Empty
		-- { $$ := Void }
	| Actual_parameters
		{ $$ := $1 }
	;

Actual_parameters: '[' ']'
		-- Warning:
		{ $$ := ast_factory.new_actual_parameters ($1, $2, 0) }
	| Open_bracket Actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	;

Open_bracket: '['
		{
			add_symbol ($1)
			add_counter
		}
	;

Actual_parameter_list: Type ']'
		{
			if attached $1 as l_type then
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_type)
				end
			else
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value)
			end
		}
	| Type_no_identifier_comma Actual_parameter_list
		{
			$$ := $2
			add_to_actual_parameter_list ($1, $$)
		}
	| E_IDENTIFIER ',' Increment_counter Actual_parameter_list
		{
			$$ := $4
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, $1, Void), $2), $$)
		}
	| E_NONE ',' Increment_counter Actual_parameter_list
		{
			$$ := $4
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, $1, Void), $2), $$)
		}
	| E_TUPLE ',' Increment_counter Actual_parameter_list
		{
			$$ := $4
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_tuple_type (Void, $1, Void), $2), $$)
		}
	;

Type_no_identifier_comma: Type_no_identifier ','
		{
			$$ := ast_factory.new_actual_parameter_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Tuple_actual_parameters_opt: -- Empty
		-- { $$ := Void }
	| Tuple_actual_parameters
		{ $$ := $1 }
	;

Tuple_actual_parameters: '[' ']'
		-- Warning:
		{ $$ := ast_factory.new_actual_parameters ($1, $2, 0) }
	| Open_bracket Semicolon ']'
		-- Warning:
		{
			$$ := ast_factory.new_actual_parameters (last_symbol, $3, 0)
			if $$ /= Void and attached ast_factory.new_first_semicolon ($2) as l_semicolon then
				$$.set_first_symbol (l_semicolon)
			end
			remove_symbol
			remove_counter
		}
	| Open_bracket Actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	| Open_bracket Tuple_labeled_actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	| Open_bracket Semicolon Tuple_labeled_actual_parameter_list
		{
			$$ := $3
			if $$ /= Void and attached ast_factory.new_first_semicolon ($2) as l_semicolon then
				$$.set_first_symbol (l_semicolon)
			end
			remove_symbol
			remove_counter
		}
	;

Tuple_labeled_actual_parameter_list: Identifier ':' Type ']'
		{
			$$ := ast_factory.new_actual_parameters (last_symbol, $4, counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3), tokens.unknown_class), $$)
		}
	|  Identifier ':' Type Semicolon ']'
		{
			$$ := ast_factory.new_actual_parameters (last_symbol, $5, counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3), tokens.unknown_class), $4), $$)
		}
	| Tuple_labeled_actual_parameter_semicolon Tuple_labeled_actual_parameter_list
		{
			$$ := $2
			add_to_actual_parameter_list ($1, $2)
		}
	| Tuple_labeled_actual_parameter Tuple_labeled_actual_parameter_list
		{
			$$ := $2
			add_to_actual_parameter_list ($1, $2)
		}
	| E_IDENTIFIER ',' Increment_counter Tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type, tokens.unknown_class), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void, tokens.unknown_class), $$)
				end
			end
		}
	| E_NONE ',' Increment_counter Tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type, tokens.unknown_class), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void, tokens.unknown_class), $$)
				end
			end
		}
	| E_TUPLE ',' Increment_counter Tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type, tokens.unknown_class), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void, tokens.unknown_class), $$)
				end
			end
		}
	;

Tuple_labeled_actual_parameter: Identifier ':' Type
		{
			$$ := ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3), tokens.unknown_class)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Tuple_labeled_actual_parameter_semicolon: Identifier ':' Type Semicolon
		{
			$$ := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3), tokens.unknown_class), $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Anchored_type_with_no_type_mark: E_LIKE Identifier
		{ $$ := new_like_feature (Void, $1, $2) }
	| E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (tokens.implicit_attached_type_mark, $1, $2) }
	| Qualified_anchored_type_with_no_type_mark
		{ $$ := $1 }
	;
	
Anchored_type: E_LIKE Identifier
		{ $$ := new_like_feature (Void, $1, $2) }
	| E_SEPARATE E_LIKE Identifier
		{ $$ := new_like_feature ($1, $2, $3) }
	| E_ATTACHED E_LIKE Identifier
		{ $$ := new_like_feature ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_LIKE Identifier
		{ $$ := new_like_feature (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_LIKE Identifier
		{ $$ := new_like_feature ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_LIKE Identifier
		{ $$ := new_like_feature (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_LIKE Identifier
		{ $$ := new_like_feature ($1, $2, $3) }
	| '!' E_SEPARATE E_LIKE Identifier
		{ $$ := new_like_feature (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_LIKE Identifier
		{ $$ := new_like_feature ($1, $2, $3) }
	| '?' E_SEPARATE E_LIKE Identifier
		{ $$ := new_like_feature (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (tokens.implicit_attached_type_mark, $1, $2) }
	| E_SEPARATE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (tokens.implicit_attached_type_mark, $1), $2, $3) }
	| E_ATTACHED E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2, $3) }
	| '!' E_SEPARATE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2, $3) }
	| '?' E_SEPARATE E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| Qualified_anchored_type
		{ $$ := $1 }
	;

Qualified_anchored_type_with_no_type_mark: E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type (Void, $1, $2, $3, $4, new_dot_feature_name ($5, $6), tokens.unknown_class)}
	| Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (Void, $1, new_dot_feature_name ($2, $3), tokens.unknown_class)}
	;
	
Qualified_anchored_type: Qualified_anchored_type_with_no_type_mark
		{ $$ := $1 }
	| E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), tokens.unknown_class)}
	| E_ATTACHED E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), tokens.unknown_class)}
	| E_ATTACHED E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), tokens.unknown_class)}
	| E_DETACHABLE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), tokens.unknown_class)}
	| E_DETACHABLE E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), tokens.unknown_class)}
	| '!' E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), tokens.unknown_class)
			end
		}
	| '!' E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), tokens.unknown_class)
			end
		}
	| '?' E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), tokens.unknown_class)
			end
		}
	| '?' E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), tokens.unknown_class)
			end
		}
	| E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), tokens.unknown_class)}
	| E_ATTACHED Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), tokens.unknown_class)}
	| E_ATTACHED E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), tokens.unknown_class)}
	| E_DETACHABLE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), tokens.unknown_class)}
	| E_DETACHABLE E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), tokens.unknown_class)}
	| '!' Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), tokens.unknown_class)}
	| '!' E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), tokens.unknown_class)}
	| '?' Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), tokens.unknown_class)}
	| '?' E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), tokens.unknown_class)}
	;
	
------------------------------------------------------------------------------------

Class_name: E_IDENTIFIER
		{ $$ := $1 }
	| E_NONE
		{ $$ := $1 }
	;

Identifier: E_IDENTIFIER
		{ $$ := $1 }
	| E_NONE
		{ $$ := $1 }
	| E_TUPLE
		{ $$ := $1 }
	;

Semicolon: ';'
		{ $$ := $1 }
	| ';' Semicolon
		{
			if attached $1 as l_semicolon then
				if l_semicolon /= tokens.semicolon_symbol then
					l_semicolon.set_other ($2)
				end
				$$ := l_semicolon
			end
		}
	;

------------------------------------------------------------------------------------

Increment_counter: -- Empty
		{
			increment_counter
		}
	;

--------------------------------------------------------------------------------
%%

feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

end
