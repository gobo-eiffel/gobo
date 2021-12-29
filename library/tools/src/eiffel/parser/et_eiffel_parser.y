%{
note

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		undefine
			read_token
		redefine
			system_processor
		end

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
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
%token <detachable ET_KEYWORD> E_INVARIANT E_IS E_LIKE E_LOCAL E_LOOP E_NOTE E_OBSOLETE
%token <detachable ET_KEYWORD> E_ONCE E_ONCE_STRING E_REDEFINE E_RENAME E_REQUIRE
%token <detachable ET_KEYWORD> E_RESCUE E_SELECT E_STRIP E_WHEN
%token <detachable ET_KEYWORD> E_THEN E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT
%token <detachable ET_KEYWORD> E_DEFERRED E_EXPANDED E_REFERENCE E_SEPARATE
%token <detachable ET_KEYWORD> E_ATTACHED E_DETACHABLE
%token <detachable ET_KEYWORD> E_ATTRIBUTE E_CONVERT E_ASSIGN
%token <detachable ET_KEYWORD> E_ACROSS E_SOME
%token <detachable ET_AGENT_KEYWORD> E_AGENT
%token <detachable ET_PRECURSOR_KEYWORD> E_PRECURSOR

%token <detachable ET_SYMBOL> E_ARROW E_DOTDOT E_LARRAY E_RARRAY
%token <detachable ET_SYMBOL> E_ASSIGN_SYMBOL E_REVERSE
%token <detachable ET_POSITION> E_UNKNOWN

%token <detachable ET_BOOLEAN_CONSTANT> E_FALSE E_TRUE
%token <detachable ET_BREAK> E_BREAK
%token <detachable ET_CHARACTER_CONSTANT> E_CHARACTER
%token <detachable ET_CURRENT> E_CURRENT
%token <detachable ET_FREE_OPERATOR> E_FREEOP
%token <detachable ET_IDENTIFIER> E_IDENTIFIER E_TUPLE E_NONE
%token <detachable ET_INTEGER_CONSTANT> E_INTEGER
%token <detachable ET_KEYWORD_OPERATOR> E_AND E_OR E_XOR E_NOT E_IMPLIES
%token <detachable ET_MANIFEST_STRING> E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV
%token <detachable ET_MANIFEST_STRING> E_STRMOD E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE
%token <detachable ET_MANIFEST_STRING> E_STRAND E_STROR E_STRXOR E_STRANDTHEN E_STRORELSE
%token <detachable ET_MANIFEST_STRING> E_STRDOTDOT E_STRBRACKET E_STRPARENTHESIS
%token <detachable ET_MANIFEST_STRING> E_STRIMPLIES E_STRFREEOP E_STRNOT E_STRING
%token <detachable ET_MANIFEST_STRING> E_STRANDSYMBOL E_STRORSYMBOL E_STRXORSYMBOL 
%token <detachable ET_MANIFEST_STRING> E_STRANDTHENSYMBOL E_STRORELSESYMBOL
%token <detachable ET_MANIFEST_STRING> E_STRIMPLIESSYMBOL E_STRNOTSYMBOL
%token <detachable ET_REAL_CONSTANT> E_REAL
%token <detachable ET_RESULT> E_RESULT
%token <detachable ET_RETRY_INSTRUCTION> E_RETRY
%token <detachable ET_SYMBOL_OPERATOR> E_DIV '/' E_GE '>' E_LE '<' E_MOD '^' '*'
%token <detachable ET_VOID> E_VOID

%token <detachable ET_POSITION> E_CHARERR E_STRERR

%token <detachable ET_KEYWORD> E_OLD
%token <detachable ET_SYMBOL> '{' '}'
%token <detachable ET_SYMBOL> '(' ')' ':' ',' ']' '$' '.' '!'
%token <detachable ET_SYMBOL> E_FOR_ALL E_THERE_EXISTS E_BAR E_OPEN_REPEAT E_CLOSE_REPEAT
%token <detachable ET_SYMBOL> '@'
%token <detachable ET_SYMBOL_OPERATOR> '-'
%token <detachable ET_SYMBOL_OPERATOR> '+'
%token <detachable ET_SYMBOL_OPERATOR> E_IMPLIES_SYMBOL E_OR_SYMBOL E_OR_ELSE_SYMBOL E_XOR_SYMBOL
%token <detachable ET_SYMBOL_OPERATOR> E_AND_SYMBOL E_AND_THEN_SYMBOL E_NOT_SYMBOL
%token <detachable ET_SYMBOL> '=' '~'
%token <detachable ET_SYMBOL> E_NE E_NOT_TILDE
%token <detachable ET_SEMICOLON_SYMBOL> ';'
%token <detachable ET_BRACKET_SYMBOL> '['
%token <detachable ET_QUESTION_MARK_SYMBOL> '?'

%left E_IMPLIES E_IMPLIES_SYMBOL
%left E_OR E_XOR E_OR_SYMBOL E_OR_ELSE_SYMBOL E_XOR_SYMBOL
%left E_AND E_AND_SYMBOL E_AND_THEN_SYMBOL 
%left '=' E_NE '~' E_NOT_TILDE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP '@'
%right E_NOT E_NOT_SYMBOL E_OLD
%right E_ITERATION_CURSOR_SYMBOL

%type <detachable ET_ACROSS_EXPRESSION> Across_all_expression Across_some_expression Across_expression_header
%type <detachable ET_ACROSS_INSTRUCTION> Across_instruction_header
%type <detachable ET_ACTUAL_ARGUMENT_LIST> Actuals_opt Actuals_expression_list Bracket_actual_list
%type <detachable ET_ACTUAL_PARAMETER_ITEM> Type_no_identifier_comma
%type <detachable ET_ACTUAL_PARAMETER_ITEM> Tuple_labeled_actual_parameter Tuple_labeled_actual_parameter_semicolon
%type <detachable ET_ACTUAL_PARAMETER_LIST> Actual_parameters_opt Actual_parameter_list Actual_parameters
%type <detachable ET_ACTUAL_PARAMETER_LIST> Tuple_actual_parameters_opt Tuple_actual_parameters
%type <detachable ET_ACTUAL_PARAMETER_LIST> Tuple_labeled_actual_parameter_list
%type <detachable ET_AGENT_ARGUMENT_OPERAND> Agent_actual
%type <detachable ET_AGENT_ARGUMENT_OPERAND_ITEM> Agent_actual_comma
%type <detachable ET_AGENT_ARGUMENT_OPERAND_LIST> Agent_actuals_opt Agent_actual_list
%type <detachable ET_AGENT_TARGET> Agent_target
%type <detachable ET_ALIAS_NAME> Alias_name
%type <detachable ET_ALIAS_NAME_LIST> Alias_name_list
%type <detachable ET_ASSIGNER> Assigner_opt
%type <detachable ET_BOOLEAN_CONSTANT> Boolean_constant
%type <detachable ET_BRACKET_EXPRESSION> Bracket_expression Typed_bracket_expression Untyped_bracket_expression
%type <detachable ET_CALL_AGENT> Call_agent
%type <detachable ET_QUALIFIED_CALL_EXPRESSION> Qualified_call_expression
%type <detachable ET_CHARACTER_CONSTANT> Character_constant Typed_character_constant Untyped_character_constant
%type <detachable ET_CHECK_INSTRUCTION> Check_instruction
%type <detachable ET_CHOICE> Choice
%type <detachable ET_CHOICE_CONSTANT> Choice_constant
%type <detachable ET_CHOICE_ITEM> Choice_comma
%type <detachable ET_CHOICE_LIST> Choices Choice_list
%type <detachable ET_CLASS> Class_header Class_to_end Class_declaration
%type <detachable ET_CLIENT_ITEM> Client Client_comma
%type <detachable ET_CLIENTS> Clients Client_list None_client None_client_opt
%type <detachable ET_COMPOUND> Compound Rescue_opt Do_compound
%type <detachable ET_COMPOUND> Then_compound Explicit_then_compound
%type <detachable ET_COMPOUND> Else_compound Explicit_else_compound Rescue_compound
%type <detachable ET_COMPOUND> From_compound From_compound_opt Loop_compound Attribute_compound
%type <detachable ET_COMPOUND> Instruction_list Compound_opt Explicit_compound_opt
%type <detachable ET_CONDITIONAL> Until_expression_opt
%type <detachable ET_CONSTANT> Manifest_constant
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM> Constraint_type_no_identifier_comma
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM> Constraint_tuple_labeled_actual_parameter
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM> Constraint_tuple_labeled_actual_parameter_semicolon
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST> Constraint_actual_parameters Constraint_actual_parameters_opt
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST> Constraint_actual_parameter_list
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST> Constraint_tuple_actual_parameters Constraint_tuple_actual_parameters_opt
%type <detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST> Constraint_tuple_labeled_actual_parameter_list
%type <detachable ET_CONSTRAINT_CREATOR> Constraint_creator Constraint_creator_opt Constraint_create_procedure_list
%type <detachable ET_CONSTRAINT_RENAME_LIST> Constraint_renames Constraint_rename_list
%type <detachable ET_CONSTRAINT_TYPE> Constraint_type Constraint_type_no_identifier
%type <detachable ET_CONVERT_FEATURE> Convert_feature
%type <detachable ET_CONVERT_FEATURE_ITEM> Convert_feature_comma
%type <detachable ET_CONVERT_FEATURE_LIST> Convert_clause_opt Convert_clause Convert_list
%type <detachable ET_CREATE_EXPRESSION> Create_expression
%type <detachable ET_CREATION_REGION> Creation_region
%type <detachable ET_CREATOR> Creation_clause Creation_procedure_list
%type <detachable ET_CREATOR_LIST> Creators_opt Creators_list
%type <detachable ET_DEBUG_INSTRUCTION> Debug_instruction
%type <detachable ET_ELSEIF_EXPRESSION> Elseif_expression
%type <detachable ET_ELSEIF_EXPRESSION_LIST> Elseif_expressions Elseif_expression_list
%type <detachable ET_ELSEIF_PART> Elseif_part
%type <detachable ET_ELSEIF_PART_LIST> Elseif_list Elseif_part_list
%type <detachable ET_EXPORT> New_export_item
%type <detachable ET_EXPORT_LIST> New_exports New_exports_opt New_export_list
%type <detachable ET_EXPRESSION> Expression Typed_call_chain Untyped_call_chain
%type <detachable ET_EXPRESSION> Precursor_expression Address_mark
%type <detachable ET_EXPRESSION> Typed_call_expression Untyped_call_expression
%type <detachable ET_EXPRESSION> Typed_bracket_target Untyped_bracket_target
%type <detachable ET_EXPRESSION> Binary_expression Non_binary_expression Non_binary_and_typed_expression
%type <detachable ET_EXPRESSION> Iteration_cursor
%type <detachable ET_EXPRESSION_ITEM> Expression_comma
%type <detachable ET_EXTENDED_FEATURE_NAME> Extended_feature_name
%type <detachable ET_EXTERNAL_ALIAS> External_name_opt
%type <detachable ET_FEATURE_CLAUSE> Feature_clause Feature_clause_header
%type <detachable ET_FEATURE_CLAUSE_LIST> Features Features_opt Feature_clause_list
%type <detachable ET_FEATURE_EXPORT> Export_feature_name_list
%type <detachable ET_FEATURE_NAME> Feature_name
%type <detachable ET_FEATURE_NAME_ITEM> Feature_name_comma Creation_procedure_comma
%type <detachable ET_FORMAL_ARGUMENT> Formal_argument_name Formal_argument_name_comma
%type <detachable ET_FORMAL_ARGUMENT_ITEM> Formal_argument Formal_argument_semicolon
%type <detachable ET_FORMAL_ARGUMENT_LIST> Formal_arguments Formal_argument_list Inline_agent_formal_arguments Feature_formal_arguments
%type <detachable ET_FORMAL_PARAMETER> Formal_parameter
%type <detachable ET_FORMAL_PARAMETER_ITEM> Formal_parameter_comma
%type <detachable ET_FORMAL_PARAMETER_LIST> Formal_parameters_opt Formal_parameter_list
%type <detachable ET_IDENTIFIER> Identifier Class_name
%type <detachable ET_IF_EXPRESSION> Conditional_expression
%type <detachable ET_IF_INSTRUCTION> Conditional_instruction
%type <detachable ET_INDEXING_LIST> Indexing_clause Indexing_clause_opt Index_list Note_list
%type <detachable ET_INDEXING_ITEM> Index_clause Index_clause_semicolon Index_clause_impl Note_item Note_item_semicolon Note_item_impl
%type <detachable ET_INDEXING_TERM> Index_value
%type <detachable ET_INDEXING_TERM_ITEM> Index_value_comma
%type <detachable ET_INDEXING_TERM_LIST> Index_terms
%type <detachable ET_INLINE_AGENT> Inline_agent Inline_agent_no_actual_arguments
%type <detachable ET_INSPECT_EXPRESSION> Multi_branch_expression
%type <detachable ET_INSPECT_INSTRUCTION> Multi_branch
%type <detachable ET_INSTRUCTION> Instruction Creation_instruction Call_instruction Create_instruction
%type <detachable ET_INTEGER_CONSTANT> Integer_constant Typed_integer_constant Untyped_integer_constant Signed_integer_constant
%type <detachable ET_INVARIANTS> Invariant_clause Invariant_clause_opt
%type <detachable ET_KEYWORD> Frozen_opt External_opt Is_opt Alias_convert_opt
%type <detachable ET_KEYWORD_FEATURE_NAME_LIST> Keyword_feature_name_list Select_clause Select_clause_opt
%type <detachable ET_KEYWORD_FEATURE_NAME_LIST> Undefine_clause Undefine_clause_opt Redefine_clause Redefine_clause_opt
%type <detachable ET_LIKE_TYPE> Anchored_type Anchored_type_with_no_type_mark
%type <detachable ET_LOCAL_VARIABLE> Local_name Local_name_comma
%type <detachable ET_LOCAL_VARIABLE_ITEM> Local_variable Local_variable_semicolon
%type <detachable ET_LOCAL_VARIABLE_LIST> Local_declarations_opt Local_variable_list
%type <detachable ET_LOOP_INVARIANTS> Loop_invariant_clause Loop_invariant_clause_opt
%type <detachable ET_MANIFEST_ARRAY> Typed_manifest_array Untyped_manifest_array Manifest_array_expression_list
%type <detachable ET_MANIFEST_STRING> Manifest_string Typed_manifest_string Untyped_manifest_string
%type <detachable ET_MANIFEST_STRING_ITEM> Untyped_manifest_string_comma
%type <detachable ET_MANIFEST_STRING_LIST> Untyped_manifest_string_list Parenthesized_untyped_manifest_string_list_opt
%type <detachable ET_MANIFEST_TUPLE> Manifest_tuple Manifest_tuple_expression_list
%type <detachable ET_OBSOLETE> Obsolete_opt
%type <detachable ET_PARENTHESIZED_EXPRESSION> Parenthesized_expression
%type <detachable ET_PARENT> Parent
%type <detachable ET_PARENT_CLAUSE_LIST> Inheritance_opt Inheritance_list
%type <detachable ET_PARENT_ITEM> Parent_semicolon
%type <detachable ET_PARENT_LIST> Inheritance_clause Parent_list
%type <detachable ET_POSTCONDITIONS> Postcondition_opt
%type <detachable ET_PRECONDITIONS> Precondition_opt
%type <detachable ET_PROCEDURE> Procedure_declaration Single_procedure_declaration
%type <detachable ET_QUALIFIED_LIKE_IDENTIFIER> Qualified_anchored_type Qualified_anchored_type_with_no_type_mark
%type <detachable ET_QUANTIFIER_EXPRESSION> Quantifier_expression_header Quantifier_expression
%type <detachable ET_QUERY> Query_declaration Single_query_declaration
%type <detachable ET_REAL_CONSTANT> Real_constant Typed_real_constant Untyped_real_constant Signed_real_constant
%type <detachable ET_RENAME_ITEM> Rename Rename_comma
%type <detachable ET_RENAME_LIST> Rename_clause Rename_list
%type <detachable ET_REPEAT_INSTRUCTION> Repeat_instruction_header
%type <detachable ET_SEMICOLON_SYMBOL> Semicolon_opt
%type <detachable ET_STATIC_CALL_EXPRESSION> Static_call_expression
%type <detachable ET_STRIP_EXPRESSION> Strip_expression Strip_feature_name_list
%type <detachable ET_SYMBOL> Left_parenthesis
%type <detachable ET_TYPE> Type Type_no_class_name Type_no_identifier Type_no_bang_identifier
%type <detachable ET_TYPE_CONSTRAINT> Type_rename_constraint
%type <detachable ET_TYPE_CONSTRAINT_ITEM> Type_rename_constraint_comma
%type <detachable ET_TYPE_CONSTRAINT_LIST> Type_rename_constraints Type_rename_constraint_list
%type <detachable ET_TYPE_ITEM> Type_comma
%type <detachable ET_TYPE_LIST> Convert_types Convert_type_list
%type <detachable ET_VARIANT> Variant_clause Variant_clause_opt
%type <detachable ET_WHEN_EXPRESSION> When_expression
%type <detachable ET_WHEN_EXPRESSION_LIST> When_expression_list When_expression_list_opt
%type <detachable ET_WHEN_PART> When_part
%type <detachable ET_WHEN_PART_LIST> When_list When_list_opt
%type <detachable ET_WRITABLE> Writable

%expect 124
%start Class_declarations

%%
------------------------------------------------------------------------------------

Class_declarations: Class_declaration
		{
			-- END
		}
	| E_BREAK Class_declaration
		{
			if attached $2 as l_class_declaration then
				l_class_declaration.set_leading_break ($1)
			end
		}
	;

Class_declaration: Indexing_clause_opt Class_to_end
		{
			$$ := $2
			if $$ /= Void then
				$$.set_first_indexing ($1)
			end
		}
	;

Class_declaration_opt: -- Empty
	|
		{
			if not system_processor.preparse_multiple_mode then
					-- Raise syntax error: it is not valid to have more
					-- than one class text in the same file.
				raise_error
			end
		}
	  Class_declaration
	;

Class_to_end: Class_header Formal_parameters_opt Obsolete_opt Inheritance_opt Creators_opt
	Convert_clause_opt Features_opt Invariant_clause_opt Indexing_clause_opt E_END Set_providers Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, $5, $6, $7, $8, $9, $10)
		}
	;

Set_providers: { set_class_providers }
	;

--------------------------------------------------------------------------------

Indexing_clause: E_INDEXING
		{ $$ := ast_factory.new_indexings ($1, 0) }
	| E_INDEXING
		{
			add_keyword ($1)
			add_counter
		}
	Index_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	| E_NOTE
		{ $$ := ast_factory.new_indexings ($1, 0) }
	| E_NOTE
		{
			add_keyword ($1)
			add_counter
		}
	Note_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Indexing_clause_opt: -- Empty
		-- { $$ := Void }
	| Indexing_clause
		{ $$ := $1 }
	;

Note_list: Note_item
		{
			if attached $1 as l_note then
				$$ := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_note)
				end
			else
				$$ := ast_factory.new_indexings (last_keyword, counter_value)
			end
		}
	| Note_item
		{ increment_counter }
	  Note_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_note then
				$$.put_first (l_note)
			end
		}
	| Note_item_semicolon
		{ increment_counter }
	  Note_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_note then
				$$.put_first (l_note)
			end
		}
	;

Note_item: Add_counter Note_item_impl
		{
			$$ := $2
			remove_counter
		}
	;

Note_item_impl: Identifier ':' Index_terms
		{
			$$ := ast_factory.new_tagged_indexing (ast_factory.new_tag ($1, $2), $3)
		}
	;

Note_item_semicolon: Note_item ';'
		{ $$ := ast_factory.new_indexing_semicolon ($1, $2) }
	;

Index_list: Index_clause
		{
			if attached $1 as l_indexing_clause then
				$$ := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_indexing_clause)
				end
			else
				$$ := ast_factory.new_indexings (last_keyword, counter_value)
			end
		}
	| Index_clause_semicolon
		-- TODO: Syntax error
		{
			if attached $1 as l_indexing_clause then
				$$ := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_indexing_clause)
				end
			else
				$$ := ast_factory.new_indexings (last_keyword, counter_value)
			end
		}
	| Index_clause
		{ increment_counter }
	  Index_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_indexing_clause then
				$$.put_first (l_indexing_clause)
			end
		}
	| Index_clause_semicolon
		{ increment_counter }
	  Index_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_indexing_clause then
				$$.put_first (l_indexing_clause)
			end
		}
	;

Index_clause: Add_counter Index_clause_impl
		{
			$$ := $2
			remove_counter
		}
	;

Index_clause_impl: Index_terms
		{
			$$ := ast_factory.new_indexing ($1)
		}
	| Identifier ':' Index_terms
		{
			$$ := ast_factory.new_tagged_indexing (ast_factory.new_tag ($1, $2), $3)
		}
	;

Index_clause_semicolon: Index_clause ';'
		{ $$ := ast_factory.new_indexing_semicolon ($1, $2) }
	| Index_clause_semicolon ';'
		-- TODO: Syntax error
		{ $$ := ast_factory.new_indexing_semicolon ($1, $2) }
	;

Index_terms: Index_value
		{
			if attached $1 as l_index_value then
				$$ := ast_factory.new_indexing_terms (counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_index_value)
				end
			else
				$$ := ast_factory.new_indexing_terms (counter_value)
			end
		}
	| Index_value_comma Index_terms
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_index_value then
				$$.put_first (l_index_value)
			end
		}
	;

Index_value: Identifier
		{ $$ := $1 }
	| Boolean_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
	| Integer_constant
		{ $$ := $1 }
	| Real_constant
		{ $$ := $1 }
	| Manifest_string
		{ $$ := $1 }
	| Create_expression E_END
		{ $$ := ast_factory.new_custom_attribute ($1, Void, $2) }
	| Create_expression Manifest_tuple E_END
		{ $$ := ast_factory.new_custom_attribute ($1, $2, $3) }
	;

Index_value_comma: Index_value ','
		{
			$$ := ast_factory.new_indexing_term_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

--------------------------------------------------------------------------------

Class_header: Frozen_opt External_opt E_CLASS Identifier
		{
			$$ := new_class ($4)
			if $$ /= Void then
				if attached $3 as l_class_keyword then
					$$.set_class_keyword (l_class_keyword)
				end
				$$.set_frozen_keyword ($1)
				$$.set_external_keyword ($2)
			end
			last_class := $$
		}
	| Frozen_opt E_DEFERRED External_opt E_CLASS Identifier
		{
			$$ := new_class ($5)
			if $$ /= Void then
				if attached $4 as l_class_keyword then
					$$.set_class_keyword (l_class_keyword)
				end
				$$.set_class_mark ($2)
				$$.set_frozen_keyword ($1)
				$$.set_external_keyword ($3)
			end
			last_class := $$
		}
	| Frozen_opt E_EXPANDED External_opt E_CLASS Identifier
		{
			$$ := new_class ($5)
			if $$ /= Void then
				if attached $4 as l_class_keyword then
					$$.set_class_keyword (l_class_keyword)
				end
				$$.set_class_mark ($2)
				$$.set_frozen_keyword ($1)
				$$.set_external_keyword ($3)
			end
			last_class := $$
		}
	| Frozen_opt E_SEPARATE External_opt E_CLASS Identifier
		{
			$$ := new_class ($5)
			if $$ /= Void then
				if attached $4 as l_class_keyword then
					$$.set_class_keyword (l_class_keyword)
				end
				$$.set_class_mark ($2)
				$$.set_frozen_keyword ($1)
				$$.set_external_keyword ($3)
			end
			last_class := $$
		}
	;

Frozen_opt: -- Empty
		-- { $$ := Void }
	| E_FROZEN
		{ $$ := $1 }
	;

External_opt: -- Empty
		-- { $$ := Void }
	| E_EXTERNAL
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Formal_parameters_opt: -- Empty
		{
			set_formal_parameters (Void)
		}
	| '[' ']'
		-- Warning!
		{
			$$ := ast_factory.new_formal_parameters ($1, $2, 0)
			set_formal_parameters ($$)
		}
	| '['
		{
			add_symbol ($1)
			add_counter
		}
	  Formal_parameter_list
		{
			$$ := $3
			set_formal_parameters ($$)
			remove_symbol
			remove_counter
		}
	;

Formal_parameter_list: Formal_parameter ']'
		{
			if attached $1 as l_formal_parameter then
				$$ := ast_factory.new_formal_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_formal_parameter)
				end
			else
				$$ := ast_factory.new_formal_parameters (last_symbol, $2, counter_value)
			end
		}
	| Formal_parameter_comma Formal_parameter_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_formal_parameter then
				$$.put_first (l_formal_parameter)
			end
		}
	;

Formal_parameter_comma: Formal_parameter ','
		{
			$$ := ast_factory.new_formal_parameter_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Formal_parameter: Identifier
		{ $$ := ast_factory.new_formal_parameter (Void, $1, last_class) }
	| E_EXPANDED Identifier
		{ $$ := ast_factory.new_formal_parameter ($1, $2, last_class) }
	| E_REFERENCE Identifier
		{ $$ := ast_factory.new_formal_parameter ($1, $2, last_class) }
	| Identifier E_ARROW Type_rename_constraint Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter (Void, $1, $2, $3, $4, last_class) }
	| E_EXPANDED Identifier E_ARROW Type_rename_constraint Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, $4, $5, last_class) }
	| E_REFERENCE Identifier E_ARROW Type_rename_constraint Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, $4, $5, last_class) }
	| Identifier E_ARROW Type_rename_constraints Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter (Void, $1, $2, $3, $4, last_class) }
	| E_EXPANDED Identifier E_ARROW Type_rename_constraints Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, $4, $5, last_class) }
	| E_REFERENCE Identifier E_ARROW Type_rename_constraints Constraint_creator_opt
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, $4, $5, last_class) }
	;

Type_rename_constraint: Constraint_type
		{
			$$ := dummy_constraint ($1)
			if $$ /= Void then
				register_constraint ($1)
			end
		}
	| Constraint_type Constraint_renames
		{
			$$ := ast_factory.new_type_rename_constraint (dummy_constraint ($1), $2)
			if $$ /= Void then
				register_constraint ($1)
			end
		}
	;

Type_rename_constraints: '{'
		{
			add_symbol ($1)
			add_counter
		}
	  Type_rename_constraint_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Type_rename_constraint_list: Type_rename_constraint '}'
		{
			if attached $1 as l_type_constraint then
				$$ := ast_factory.new_type_constraint_list (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_type_constraint)
				end
			else
				$$ := ast_factory.new_type_constraint_list (last_symbol, $2, counter_value)
			end
		}
	| Type_rename_constraint_comma Type_rename_constraint_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_type_constraint then
				$$.put_first (l_type_constraint)
			end
		}
	;

Type_rename_constraint_comma: Type_rename_constraint ','
		{
			$$ := ast_factory.new_type_constraint_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;
	
Constraint_renames: E_RENAME E_END
		{ $$ := ast_factory.new_constraint_renames ($1, $2, 0) }
	| E_RENAME
		{
			add_keyword ($1)
			add_counter
		}
	  Constraint_rename_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Constraint_rename_list: Rename E_END
		{
			if attached $1 as l_rename then
				$$ := ast_factory.new_constraint_renames (last_keyword, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_rename)
				end
			else
				$$ := ast_factory.new_constraint_renames (last_keyword, $2, counter_value)
			end
		}
	| Rename_comma E_END
		{
			$$ := ast_factory.new_constraint_renames (last_keyword, $2, counter_value)
			if $$ /= Void and attached $1 as l_rename then
				$$.put_first (l_rename)
			end
				-- TODO: syntax error.
			raise_error
		}
	| Rename_comma Constraint_rename_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_rename then
				$$.put_first (l_rename)
			end
		}
	;

Constraint_creator_opt:  -- Empty
		-- { $$ := Void }
	| Constraint_creator
		{ $$ := $1 }
	;
	
Constraint_creator: E_CREATE E_END
		{ $$ := ast_factory.new_constraint_creator ($1, $2, 0) }
	| E_CREATE
		{
			add_keyword ($1)
			add_counter
		}
	  Constraint_create_procedure_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Constraint_create_procedure_list: Identifier E_END
		{
			if attached $1 as l_identifier then
				l_identifier.set_feature_name (True)
				$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_identifier)
				end
			else
				$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value)
			end
		}
	| Creation_procedure_comma E_END
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value)
			if $$ /= Void and attached $1 as l_creation_procedure then
				$$.put_first (l_creation_procedure)
			end
		}
	| Creation_procedure_comma Constraint_create_procedure_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_creation_procedure then
				$$.put_first (l_creation_procedure)
			end
		}
	;

Constraint_type: Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '!' E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '?' E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| Anchored_type
		{ $$ := $1 }
	| E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '!' E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '?' E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	;

Constraint_type_no_identifier: Class_name Constraint_actual_parameters
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '!' E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '?' E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| Anchored_type
		{ $$ := $1 }
	| E_TUPLE Constraint_tuple_actual_parameters
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_ATTACHED E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| E_DETACHABLE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_DETACHABLE E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '!' E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '!' E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| '?' E_SEPARATE E_TUPLE Constraint_tuple_actual_parameters_opt
		{ $$ := new_constraint_named_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	;

Constraint_actual_parameters_opt: -- Empty
		-- { $$ := Void }
	| Constraint_actual_parameters
		{ $$ := $1 }
	;

Constraint_actual_parameters: '[' ']'
		-- Warning:
		{ $$ := ast_factory.new_constraint_actual_parameters ($1, $2, 0) }
	| Open_bracket Constraint_actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	;

Constraint_actual_parameter_list: Constraint_type ']'
		{
			if attached $1 as l_constraint_type then
				$$ := ast_factory.new_constraint_actual_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_constraint_type)
				end
			else
				$$ := ast_factory.new_constraint_actual_parameters (last_symbol, $2, counter_value)
			end
		}
	| Constraint_type_no_identifier_comma Constraint_actual_parameter_list
		{
			$$ := $2
			add_to_constraint_actual_parameter_list ($1, $$)
		}
	| Identifier ',' Increment_counter Constraint_actual_parameter_list
		{
			$$ := $4
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_actual_parameter_comma (new_constraint_named_type (Void, $1, Void), $2), $$)
		}
	;

Constraint_type_no_identifier_comma: Constraint_type_no_identifier ','
		{
			$$ := ast_factory.new_constraint_actual_parameter_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Constraint_tuple_actual_parameters_opt: -- Empty
		-- { $$ := Void }
	| Constraint_tuple_actual_parameters
		{ $$ := $1 }
	;

Constraint_tuple_actual_parameters: '[' ']'
		-- Warning:
		{ $$ := ast_factory.new_constraint_actual_parameters ($1, $2, 0) }
	| Open_bracket Constraint_actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	| Open_bracket Constraint_tuple_labeled_actual_parameter_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	;

Constraint_tuple_labeled_actual_parameter_list: Identifier ':' Constraint_type ']'
		{
			$$ := ast_factory.new_constraint_actual_parameters (last_symbol, $4, counter_value + 1)
			add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_actual_parameter ($1, $2, $3), $$)
		}
	| Constraint_tuple_labeled_actual_parameter_semicolon Constraint_tuple_labeled_actual_parameter_list
		{
			$$ := $2
			add_to_constraint_actual_parameter_list ($1, $2)
		}
	| Constraint_tuple_labeled_actual_parameter Constraint_tuple_labeled_actual_parameter_list
		{
			$$ := $2
			add_to_constraint_actual_parameter_list ($1, $2)
		}
	| Identifier ',' Increment_counter Constraint_tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter ($1, $2, $$.first.type), $$)
				else
					add_to_constraint_actual_parameter_list (ast_factory.new_constraint_labeled_comma_actual_parameter ($1, $2, Void), $$)
				end
			end
		}
	;

Constraint_tuple_labeled_actual_parameter: Identifier ':' Constraint_type
		{
			$$ := ast_factory.new_constraint_labeled_actual_parameter ($1, $2, $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Constraint_tuple_labeled_actual_parameter_semicolon: Identifier ':' Constraint_type ';'
		{
			$$ := ast_factory.new_constraint_labeled_actual_parameter_semicolon (ast_factory.new_constraint_labeled_actual_parameter ($1, $2, $3), $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Obsolete_opt: -- Empty
		-- { $$ := Void }
	| E_OBSOLETE Untyped_manifest_string
		{ $$ := ast_factory.new_obsolete_message ($1, $2) }
	;

------------------------------------------------------------------------------------

Inheritance_opt: -- Empty
		-- { $$ := Void }
	| Add_counter Inheritance_list
		{
			$$ := $2
			remove_counter
		}
	;

Inheritance_list: Inheritance_clause
		{
			if attached $1 as l_inheritance_clause then
				$$ := ast_factory.new_parent_clauses (counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_inheritance_clause)
				end
			else
				$$ := ast_factory.new_parent_clauses (counter_value)
			end
		}
	| Inheritance_clause
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Inheritance_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_inheritance_clause then
				$$.put_first (l_inheritance_clause)
			end
		}
	;
	
Inheritance_clause: E_INHERIT None_client_opt
		{
			$$ := ast_factory.new_parents ($1, 0)
			if $$ /= Void then
				$$.set_clients_clause ($2)
			end
		}
	| E_INHERIT None_client_opt
		{
			add_keyword ($1)
			add_counter
		} 
	 Parent_list
		{
			$$ := $4
			if $$ /= Void then
				$$.set_clients_clause ($2)
			end
			remove_keyword
			remove_counter
		}
	;

Parent: Class_name Actual_parameters_opt
		{
			$$ := new_parent ($1, $2, Void, Void, Void, Void, Void, Void)
			if $$ /= Void then
				increment_counter
			end
		}
	| Class_name Actual_parameters_opt Rename_clause New_exports_opt
	Undefine_clause_opt Redefine_clause_opt Select_clause_opt E_END
		{
			$$ := new_parent ($1, $2, $3, $4, $5, $6, $7, $8)
			if $$ /= Void then
				increment_counter
			end
		}
	| Class_name Actual_parameters_opt New_exports Undefine_clause_opt Redefine_clause_opt Select_clause_opt E_END
		{
			$$ := new_parent ($1, $2, Void, $3, $4, $5, $6, $7)
			if $$ /= Void then
				increment_counter
			end
		}
	| Class_name Actual_parameters_opt Undefine_clause Redefine_clause_opt Select_clause_opt E_END
		{
			$$ := new_parent ($1, $2, Void, Void, $3, $4, $5, $6)
			if $$ /= Void then
				increment_counter
			end
		}
	| Class_name Actual_parameters_opt Redefine_clause Select_clause_opt E_END
		{
			$$ := new_parent ($1, $2, Void, Void, Void, $3, $4, $5)
			if $$ /= Void then
				increment_counter
			end
		}
	| Class_name Actual_parameters_opt Select_clause E_END
		{
			$$ := new_parent ($1, $2, Void, Void, Void, Void, $3, $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Parent_list: Parent
		{
			$$ := ast_factory.new_parents (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_parent then
				$$.put_first (l_parent)
			end
		}
	| Parent_semicolon
		{
			$$ := ast_factory.new_parents (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_parent then
				$$.put_first (l_parent)
			end
		}
	| Parent Parent_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_parent then
				$$.put_first (l_parent)
			end
		}
	| Parent_semicolon Parent_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_parent then
				$$.put_first (l_parent)
			end
		}
	;

Parent_semicolon: Parent ';'
		{
			$$ := ast_factory.new_parent_semicolon ($1, $2)
			if $$ /= Void and $1 = Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Rename_clause: E_RENAME
		{ $$ := ast_factory.new_renames ($1, 0) }
	| E_RENAME
		{
			add_keyword ($1)
			add_counter
		}
	  Rename_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Rename_list: Rename
		{
			$$ := ast_factory.new_renames (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_rename then
				$$.put_first (l_rename)
			end
		}
	| Rename_comma
		{
			$$ := ast_factory.new_renames (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_rename then
				$$.put_first (l_rename)
			end
				-- TODO: syntax error.
			raise_error
		}
	| Rename_comma Rename_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_rename then
				$$.put_first (l_rename)
			end
		}
	;

Rename: Feature_name E_AS Extended_feature_name
		{
			$$ := ast_factory.new_rename ($1, $2, $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Rename_comma: Feature_name E_AS Extended_feature_name ','
		{
			$$ := ast_factory.new_rename_comma ($1, $2, $3, $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

New_exports: E_EXPORT
		{ $$ := ast_factory.new_exports ($1, 0) }
	| E_EXPORT
		{
			add_keyword ($1)
			add_counter
		}
	  New_export_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

New_exports_opt: -- Empty
		-- { $$ := Void }
	| New_exports
		{ $$ := $1 }
	;

New_export_list: New_export_item
		{
			if attached $1 as l_new_export then
				$$ := ast_factory.new_exports (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_new_export)
				end
			else
				$$ := ast_factory.new_exports (last_keyword, counter_value)
			end
		}
	| New_export_item
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  New_export_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_new_export then
				$$.put_first (l_new_export)
			end
		}
	;

New_export_item: Clients E_ALL
		{
			$$ := ast_factory.new_all_export ($1, $2)
		}
	| Clients -- Empty feature list allowed in ETL2 page 101 and in ISE 5.6.
		{
			last_export_clients := $1
			$$ := ast_factory.new_feature_export (last_export_clients, 0)
		}
	| Clients
		{
			last_export_clients := $1
			add_counter
		}
	  Export_feature_name_list
		{
			$$ := $3
			remove_counter
		}
	| ';'
		{ $$ := ast_factory.new_null_export ($1) }
	;

Export_feature_name_list: Feature_name
		{
			if attached $1 as l_feature_name then
				$$ := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_feature_name)
				end
			else
				$$ := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		}
	| Feature_name_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_feature_export (last_export_clients, counter_value)
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	| Feature_name_comma Export_feature_name_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	;

------------------------------------------------------------------------------------

Clients: '{'
		{
			add_symbol ($1)
			add_counter
		}
	  Client_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	| '{' '}'
		{ $$ := ast_factory.new_none_clients ($1, $2) }
	;

Client_list: Client '}'
		{
			$$ := ast_factory.new_clients (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_client then
				$$.put_first (l_client)
			end
		}
	| Client_comma '}'
		-- Syntax error
		{
			$$ := ast_factory.new_clients (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_client then
				$$.put_first (l_client)
			end
		}
	| Client_comma Client_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_client then
				$$.put_first (l_client)
			end
		}
	| Client Client_list
		-- Syntax error
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_client then
				$$.put_first (l_client)
			end
		}
	;

Client: Identifier
		{
			$$ := new_client ($1)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Client_comma: Identifier ','
		{
			$$ := new_client_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;


None_client_opt: -- Empty
		-- { $$ := Void }
	| None_client
		{ $$ := $1 }
	;
	
None_client: '{' E_NONE '}'
		{
			$$ := ast_factory.new_clients ($1, $3, 1)
			if $$ /= Void and attached new_client ($2) as l_client then
				$$.put_first (l_client)
			end
		}
	;

------------------------------------------------------------------------------------

Redefine_clause: E_REDEFINE
		{ $$ := ast_factory.new_keyword_feature_name_list ($1, 0) }
	| E_REDEFINE
		{
			add_keyword ($1)
			add_counter
		}
	  Keyword_feature_name_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Redefine_clause_opt: -- Empty
		-- { $$ := Void }
	| Redefine_clause
		{ $$ := $1 }
	;

Undefine_clause: E_UNDEFINE
		{ $$ := ast_factory.new_keyword_feature_name_list ($1, 0) }
	| E_UNDEFINE
		{
			add_keyword ($1)
			add_counter
		}
	  Keyword_feature_name_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Undefine_clause_opt: -- Empty
		-- { $$ := Void }
	| Undefine_clause
		{ $$ := $1 }
	;

Select_clause: E_SELECT
		{ $$ := ast_factory.new_keyword_feature_name_list ($1, 0) }
	| E_SELECT
		{
			add_keyword ($1)
			add_counter
		}
	  Keyword_feature_name_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Select_clause_opt: -- Empty
		-- { $$ := Void }
	| Select_clause
		{ $$ := $1 }
	;

Keyword_feature_name_list: Feature_name
		{
			if attached $1 as l_feature_name then
				$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_feature_name)
				end
			else
				$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		}
	| Feature_name_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	| Feature_name_comma Keyword_feature_name_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	;

Feature_name_comma: Feature_name ','
		{
			$$ := ast_factory.new_feature_name_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Creators_opt: -- Empty
		-- { $$ := Void }
	| Add_counter Creators_list
		{
			$$ := $2
			remove_counter
		}
	;

Creators_list: Creation_clause
		{
			if attached $1 as l_creation_clause then
				$$ := ast_factory.new_creators (counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_creation_clause)
				end
			else
				$$ := ast_factory.new_creators (counter_value)
			end
		}
	| Creation_clause
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Creators_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_creation_clause then
				$$.put_first (l_creation_clause)
			end
		}
	;

Creation_clause: E_CREATION Clients
		{ $$ := ast_factory.new_creator ($1, $2, 0) }
	| E_CREATION
		{ $$ := ast_factory.new_creator ($1, new_any_clients ($1), 0) }
	| E_CREATION Clients
		{
			add_keyword ($1)
			last_clients := $2
			add_counter
		}
	  Creation_procedure_list
		{
			$$ := $4
			remove_keyword
			remove_counter
		}
	| E_CREATION
		{
			add_keyword ($1)
			last_clients := new_any_clients (last_keyword)
			add_counter
		}
	  Creation_procedure_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	| E_CREATE Clients
		{ $$ := ast_factory.new_creator ($1, $2, 0) }
	| E_CREATE
		{ $$ := ast_factory.new_creator ($1, new_any_clients ($1), 0) }
	| E_CREATE Clients
		{
			add_keyword ($1)
			last_clients := $2
			add_counter
		}
	  Creation_procedure_list
		{
			$$ := $4
			remove_keyword
			remove_counter
		}
	| E_CREATE
		{
			add_keyword ($1)
			last_clients := new_any_clients (last_keyword)
			add_counter
		}
	  Creation_procedure_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Creation_procedure_list: Identifier
		{
			if attached $1 as l_identifier then
				l_identifier.set_feature_name (True)
				$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_identifier)
				end
			else
				$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		}
	| Creation_procedure_comma
		-- TODO: syntax error.
		{
			if system_processor.is_ise then
				raise_error
			else
				$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value)
				if $$ /= Void and attached $1 as l_creation_procedure then
					$$.put_first (l_creation_procedure)
				end
			end
		}
	| Creation_procedure_comma Creation_procedure_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_creation_procedure then
				$$.put_first (l_creation_procedure)
			end
		}
	;

Creation_procedure_comma: Identifier ','
		{
			if attached $1 as l_identifier then
				l_identifier.set_feature_name (True)
				$$ := ast_factory.new_feature_name_comma (l_identifier, $2)
			else
				$$ := ast_factory.new_feature_name_comma (Void, $2)
			end
			if $$ /= Void then
				increment_counter
			end
		}
	;

--------------------------------------------------------------------------------

Convert_clause_opt: -- Empty
		-- { $$ := Void }
	| Convert_clause
		{ $$ := $1 }
	;

Convert_clause: E_CONVERT
		{
			add_keyword ($1)
			add_counter
		}
	  Convert_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Convert_list: Convert_feature
		{
			$$ := ast_factory.new_convert_features (last_keyword, counter_value + 1)
			if $$ /= Void and attached $1 as l_convert_feature then
				$$.put_first (l_convert_feature)
			end
		}
	| Convert_feature_comma
		{
			$$ := ast_factory.new_convert_features (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_convert_feature then
				$$.put_first (l_convert_feature)
			end
		}
	| Convert_feature_comma Convert_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_convert_feature then
				$$.put_first (l_convert_feature)
			end
		}
	;

Convert_feature_comma: Convert_feature ','
		{
			$$ := ast_factory.new_convert_feature_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Convert_feature: Feature_name ':' Convert_types
		{
			$$ := ast_factory.new_convert_function ($1, $2, $3)
		}
	| Feature_name '(' Convert_types ')'
		{
			$$ := ast_factory.new_convert_procedure ($1, $2, $3, $4)
		}
	;

Convert_types: '{' '}'
		-- Warning:
	| '{'
		{
			add_symbol ($1)
			add_counter
		}
	  Convert_type_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Convert_type_list: Type '}'
		{
			if attached $1 as l_convert_type then
				$$ := ast_factory.new_convert_types (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_convert_type)
				end
			else
				$$ := ast_factory.new_convert_types (last_symbol, $2, counter_value)
			end
		}
	| Type_comma Convert_type_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_convert_type then
				$$.put_first (l_convert_type)
			end
		}
	;

Type_comma: Type ','
		{
			$$ := ast_factory.new_type_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
		{
			-- $$ := Void
			set_class_features
		}
	| Features
		{ $$ := $1 }
	;

Features: Add_counter Feature_clause_list
		{
			$$ := $2
			set_class_features
			remove_counter
		}
	;

Feature_clause_list: Feature_clause
		{
			$$ := ast_factory.new_feature_clauses (counter_value)
			if $$ /= Void and attached $1 as l_feature_clause then
				$$.put_first (l_feature_clause)
			end
		}
	| Feature_clause Feature_clause_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_feature_clause then
				$$.put_first (l_feature_clause)
			end
		}
	;

Feature_clause: Feature_clause_header
		{
			$$ := last_feature_clause
			if $$ /= Void then
				increment_counter
			end
		}
	| Feature_clause_header Feature_declaration_list
		{
			$$ := last_feature_clause
			if $$ /= Void then
				increment_counter
			end
		}
	;

Feature_clause_header: E_FEATURE Clients
		{
			last_clients := $2
			last_feature_clause := ast_factory.new_feature_clause ($1, last_clients)
		}
	| E_FEATURE
		{
			last_clients := new_any_clients ($1)
			last_feature_clause := ast_factory.new_feature_clause ($1, last_clients)
		}
	;

Feature_declaration_list: Query_declaration
	| Procedure_declaration
	| Feature_declaration_list Query_declaration
	| Feature_declaration_list Procedure_declaration
	;

--------------------------------------------------------------------------------

Query_declaration: Single_query_declaration
		{
			$$ := $1
			register_query ($$)
		}
	| E_FROZEN Single_query_declaration
		{
			$$ := $2
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_query ($$)
			end
		}
	| Extended_feature_name ',' Query_declaration
		{
			$$ := new_query_synonym (ast_factory.new_extended_feature_name_comma ($1, $2), $3)
			register_query_synonym ($$)
		}
	| Extended_feature_name Query_declaration
			-- TODO: Syntax error
		{
			$$ := new_query_synonym ($1, $2)
			register_query_synonym ($$)
		}
	| E_FROZEN Extended_feature_name ',' Query_declaration
		{
			$$ := new_query_synonym (ast_factory.new_extended_feature_name_comma ($2, $3), $4)
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_query_synonym ($$)
			end
		}
	| E_FROZEN Extended_feature_name Query_declaration
			-- TODO: Syntax error
		{
			$$ := new_query_synonym ($2, $3)
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_query_synonym ($$)
			end
		}
	;

Procedure_declaration: Single_procedure_declaration
		{
			$$ := $1
			register_procedure ($$)
		}
	| E_FROZEN Single_procedure_declaration
		{
			$$ := $2
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_procedure ($$)
			end
		}
	| Extended_feature_name ',' Procedure_declaration
		{
			$$ := new_procedure_synonym (ast_factory.new_extended_feature_name_comma ($1, $2), $3)
			register_procedure_synonym ($$)
		}
	| Extended_feature_name Procedure_declaration
			-- TODO: Syntax error
		{
			$$ := new_procedure_synonym ($1, $2)
			register_procedure_synonym ($$)
		}
	| E_FROZEN Extended_feature_name ',' Procedure_declaration
		{
			$$ := new_procedure_synonym (ast_factory.new_extended_feature_name_comma ($2, $3), $4)
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_procedure_synonym ($$)
			end
		}
	| E_FROZEN Extended_feature_name Procedure_declaration
			-- TODO: Syntax error
		{
			$$ := new_procedure_synonym ($2, $3)
			if $$ /= Void then
				$$.set_frozen_keyword ($1)
				register_procedure_synonym ($$)
			end
		}
	;

Single_query_declaration: Extended_feature_name ':' Type Assigner_opt
		{ $$ := ast_factory.new_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, Void, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt ';'
		{ $$ := ast_factory.new_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt Attribute_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{
			$$ := ast_factory.new_extended_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, last_clients, last_feature_clause, last_class)
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS Manifest_constant Semicolon_opt
		{ $$ := ast_factory.new_constant_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt '=' Manifest_constant Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_constant_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS E_UNIQUE Semicolon_opt
		{ $$ := ast_factory.new_unique_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt '=' E_UNIQUE Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_unique_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_do_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, Void, $5, $6, $7, $8, $9, $10, $11, $12, $13, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt E_IS Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_do_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, Void, $6, $7, $8, $9, $10, $11, $12, $13, $14, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $11, ast_factory.new_once_compound ($10, $12), $13, $14, $15, $16, last_clients, last_feature_clause, last_class) }	
	| Extended_feature_name ':' Type Assigner_opt Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_once_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, Void, $5, $6, $7, $8, $10, ast_factory.new_once_compound ($9, $11), $12, $13, $14, $15, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt E_IS Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $12, ast_factory.new_once_compound ($11, $13), $14, $15, $16, $17, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_once_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, Void, $6, $7, $8, $9, $11, ast_factory.new_once_compound ($10, $12), $13, $14, $15, $16, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS Indexing_clause_opt Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt Indexing_clause_opt Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_deferred_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, Void, $5, $6, $7, $8, $9, $10, $11, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt E_IS Indexing_clause_opt
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12, $13, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := ast_factory.new_deferred_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, Void, $6, $7, $8, $9, $10, $11, $12, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name ':' Type Assigner_opt E_IS Indexing_clause_opt Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := new_external_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, ast_factory.new_external_language ($9, $10), $11, $12, $13, $14, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name ':' Type Assigner_opt Indexing_clause_opt Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := new_external_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, Void, $5, $6, $7, ast_factory.new_external_language ($8, $9), $10, $11, $12, $13, last_clients, last_feature_clause, last_class)
			end
		}
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt E_IS Indexing_clause_opt
	Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := new_external_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, ast_factory.new_external_language ($10, $11), $12, $13, $14, $15, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments ':' Type Assigner_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := new_external_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, Void, $6, $7, $8, ast_factory.new_external_language ($9, $10), $11, $12, $13, $14, last_clients, last_feature_clause, last_class)
			end
		}
	;

Single_procedure_declaration: Extended_feature_name Is_opt Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_procedure ($1, Void, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments Is_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Is_opt Indexing_clause_opt Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_procedure ($1, Void, $2, $3, $4, $5, $6, $8, ast_factory.new_once_compound ($7, $9), $10, $11, $12, $13, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments Is_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_procedure ($1, $2, $3, $4, $5, $6, $7, $9, ast_factory.new_once_compound ($8, $10), $11, $12, $13, $14, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Is_opt Indexing_clause_opt Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_procedure ($1, Void, $2, $3, $4, $5, $6, $7, $8, $9, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments Is_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Is_opt Indexing_clause_opt Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := new_external_procedure ($1, Void, $2, $3, $4, $5, ast_factory.new_external_language ($6, $7), $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Extended_feature_name Feature_formal_arguments Is_opt Indexing_clause_opt
	Obsolete_opt Precondition_opt E_EXTERNAL Untyped_manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := new_external_procedure ($1, $2, $3, $4, $5, $6, ast_factory.new_external_language ($7, $8), $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	;

Is_opt: -- Empty
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := Void
			end
		}
	| E_IS
		{ $$ := $1 }
	;

Semicolon_opt: -- Empty
		-- { $$ := Void }
	| ';'
		{ $$ := $1 }
	;

External_name_opt: -- Empty
		-- { $$ := Void }
	| E_ALIAS Untyped_manifest_string
		{ $$ := ast_factory.new_external_alias ($1, $2) }
	;

Assigner_opt: -- Empty
		-- { $$ := Void }
	| E_ASSIGN Feature_name
		{ $$ := ast_factory.new_assigner ($1, $2) }
	;

------------------------------------------------------------------------------------

Feature_name: Identifier
		{
			if attached $1 as l_identifier then
				l_identifier.set_feature_name (True)
				$$ := l_identifier 
			end
		}
	;

Extended_feature_name: Feature_name
		{ $$ := $1 }
	| Identifier Add_counter Alias_name_list
		{
			if attached $1 as l_identifier then
				l_identifier.set_feature_name (True)
				$$ := ast_factory.new_aliased_feature_name (l_identifier, $3)
			else
				$$ := ast_factory.new_aliased_feature_name (Void, $3)
			end
			remove_counter
		}
	;

Alias_name_list: Alias_name
		{
			if attached $1 as l_alias_name then
				$$ := ast_factory.new_alias_name_list (counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_alias_name)
				end
			else
				$$ := ast_factory.new_alias_name_list (counter_value)
			end
		}
	| Alias_name
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Alias_name_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_alias_name then
				$$.put_first (l_alias_name)
			end
		}
	;
	
Alias_name: E_ALIAS E_STRNOT Alias_convert_opt
		{ $$ := ast_factory.new_alias_not_name ($1, $2, $3) }
	| E_ALIAS E_STRNOTSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_not_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRPLUS Alias_convert_opt
		{ $$ := ast_factory.new_alias_plus_name ($1, $2, $3) }
	| E_ALIAS E_STRMINUS Alias_convert_opt
		{ $$ := ast_factory.new_alias_minus_name ($1, $2, $3) }
	| E_ALIAS E_STRSTAR Alias_convert_opt
		{ $$ := ast_factory.new_alias_times_name ($1, $2, $3) }
	| E_ALIAS E_STRSLASH Alias_convert_opt
		{ $$ := ast_factory.new_alias_divide_name ($1, $2, $3) }
	| E_ALIAS E_STRDIV Alias_convert_opt
		{ $$ := ast_factory.new_alias_div_name ($1, $2, $3) }
	| E_ALIAS E_STRMOD Alias_convert_opt
		{ $$ := ast_factory.new_alias_mod_name ($1, $2, $3) }
	| E_ALIAS E_STRPOWER Alias_convert_opt
		{ $$ := ast_factory.new_alias_power_name ($1, $2, $3) }
	| E_ALIAS E_STRLT Alias_convert_opt
		{ $$ := ast_factory.new_alias_lt_name ($1, $2, $3) }
	| E_ALIAS E_STRLE Alias_convert_opt
		{ $$ := ast_factory.new_alias_le_name ($1, $2, $3) }
	| E_ALIAS E_STRGT Alias_convert_opt
		{ $$ := ast_factory.new_alias_gt_name ($1, $2, $3) }
	| E_ALIAS E_STRGE Alias_convert_opt
		{ $$ := ast_factory.new_alias_ge_name ($1, $2, $3) }
	| E_ALIAS E_STRAND Alias_convert_opt
		{ $$ := ast_factory.new_alias_and_name ($1, $2, $3) }
	| E_ALIAS E_STRANDSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_and_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRANDTHEN Alias_convert_opt
		{ $$ := ast_factory.new_alias_and_then_name ($1, $2, $3) }
	| E_ALIAS E_STRANDTHENSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_and_then_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STROR Alias_convert_opt
		{ $$ := ast_factory.new_alias_or_name ($1, $2, $3) }
	| E_ALIAS E_STRORSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_or_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRORELSE Alias_convert_opt
		{ $$ := ast_factory.new_alias_or_else_name ($1, $2, $3) }
	| E_ALIAS E_STRORELSESYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_or_else_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRIMPLIES Alias_convert_opt
		{ $$ := ast_factory.new_alias_implies_name ($1, $2, $3) }
	| E_ALIAS E_STRIMPLIESSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_implies_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRXOR Alias_convert_opt
		{ $$ := ast_factory.new_alias_xor_name ($1, $2, $3) }
	| E_ALIAS E_STRXORSYMBOL Alias_convert_opt
		{ $$ := ast_factory.new_alias_xor_symbol_name ($1, $2, $3) }
	| E_ALIAS E_STRDOTDOT Alias_convert_opt
		{ $$ := ast_factory.new_alias_dotdot_name ($1, $2, $3) }
	| E_ALIAS E_STRFREEOP Alias_convert_opt
		{ $$ := ast_factory.new_alias_free_name ($1, $2, $3) }
	| E_ALIAS E_STRBRACKET Alias_convert_opt
		{ $$ := ast_factory.new_alias_bracket_name ($1, $2, $3) }
	| E_ALIAS E_STRPARENTHESIS Alias_convert_opt
		{ $$ := ast_factory.new_alias_parenthesis_name ($1, $2, $3) }
	| E_ALIAS E_STRING Alias_convert_opt
		{ $$ := new_invalid_alias_name ($1, $2, $3) }
	;

Alias_convert_opt: -- Empty
		{ $$ := Void }
	| E_CONVERT
		{ $$ := $1 }
	;
	
------------------------------------------------------------------------------------

Feature_formal_arguments: Formal_arguments
		{
			$$ := $1
			set_start_closure ($$)
		}
	;

Formal_arguments: '(' ')'
		{ $$ := new_formal_arguments ($1, $2, 0) }
	| Left_parenthesis Formal_argument_list
		{
			$$ := $2
			remove_symbol
			remove_counter
		}
	;

Left_parenthesis: '('
		{
			-- Needed to solve ambiguity when parsing:
			--   agent (a).f
			--   agent (a: A) do ... end
			$$ := $1
			add_symbol ($$)
			add_counter
		}
	;

Formal_argument_list: Formal_argument ')'
		{
			$$ := new_formal_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_formal_argument then
				$$.put_first (l_formal_argument)
			end
		}
	| Formal_argument_semicolon ')'
		{
			$$ := new_formal_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_formal_argument then
				$$.put_first (l_formal_argument)
			end
		}
	| Formal_argument_name_comma Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_formal_argument then
				if not $$.is_empty then
					l_formal_argument.set_declared_type ($$.first.type)
					$$.put_first (l_formal_argument)
				end
			end
		}
	| Formal_argument_name Formal_argument_list
		{
			-- TODO: Syntax error
			$$ := $2
			if $$ /= Void and attached $1 as l_formal_argument then
				if not $$.is_empty then
					l_formal_argument.set_declared_type ($$.first.type)
					$$.put_first (l_formal_argument)
				end
			end
		}
	| Formal_argument_semicolon Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_formal_argument then
				$$.put_first (l_formal_argument)
			end
		}
	| Formal_argument Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_formal_argument then
				$$.put_first (l_formal_argument)
			end
		}
	;

Formal_argument_name_comma: Identifier ','
		{
			$$ := ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma ($1, $2), dummy_type)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Formal_argument_name: Identifier
		{
			$$ := ast_factory.new_formal_comma_argument ($1, dummy_type)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Formal_argument: Identifier ':' Type
		{
			$$ := ast_factory.new_formal_argument ($1, ast_factory.new_colon_type ($2, $3))
			if $$ /= Void then
				increment_counter
			end
		}
	;

Formal_argument_semicolon: Identifier ':' Type  ';'
		{
			$$ := ast_factory.new_formal_argument_semicolon (ast_factory.new_formal_argument ($1, ast_factory.new_colon_type ($2, $3)), $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Local_declarations_opt: -- Empty
		{ $$ := Void }
	| E_LOCAL
		{ $$ := new_local_variables ($1, 0) }
	| E_LOCAL
		{
			add_keyword ($1)
			add_counter
		}
	  Local_variable_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Local_variable_list: Local_variable
		{
			$$ := new_local_variables (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_local_variable then
				$$.put_first (l_local_variable)
			end
		}
	| Local_variable_semicolon
		{
			$$ := new_local_variables (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_local_variable then
				$$.put_first (l_local_variable)
			end
		}
	| Local_name_comma Local_variable_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_local_variable then
				if not $$.is_empty then
					l_local_variable.set_declared_type ($$.first.type)
					$$.put_first (l_local_variable)
				end
			end
		}
	| Local_name Local_variable_list
		{
			-- TODO: Syntax error
			$$ := $2
			if $$ /= Void and attached $1 as l_local_variable then
				if not $$.is_empty then
					l_local_variable.set_declared_type ($$.first.type)
					$$.put_first (l_local_variable)
				end
			end
		}
	| Local_variable_semicolon Local_variable_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_local_variable then
				$$.put_first (l_local_variable)
			end
		}
	| Local_variable Local_variable_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_local_variable then
				$$.put_first (l_local_variable)
			end
		}
	;

Local_name_comma: Identifier ','
		{
			$$ := ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma ($1, $2), dummy_type)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Local_name: Identifier
		{
			$$ := ast_factory.new_local_comma_variable ($1, dummy_type)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Local_variable: Identifier ':' Type
		{
			$$ := ast_factory.new_local_variable ($1, ast_factory.new_colon_type ($2, $3))
			if $$ /= Void then
				increment_counter
			end
		}
	;

Local_variable_semicolon: Identifier ':' Type  ';'
		{
			$$ := ast_factory.new_local_variable_semicolon (ast_factory.new_local_variable ($1, ast_factory.new_colon_type ($2, $3)), $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Assertions: Expression
		{ add_expression_assertion ($1, Void) }
	| Expression ';'
		{ add_expression_assertion ($1, $2) }
	| Identifier ':'
		{ add_tagged_assertion ($1, $2, Void) }
	| Identifier ':' ';'
		{ add_tagged_assertion ($1, $2, $3) }
	| E_CLASS
		{
			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion ($1), Void)
			else
				raise_error
			end
		}
	| E_CLASS ';'
		{
			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion ($1), $2)
			else
				raise_error
			end
		}
	| Assertions Expression
		{ add_expression_assertion ($2, Void) }
	| Assertions Expression ';'
		{ add_expression_assertion ($2, $3) }
	| Assertions Identifier ':'
		{ add_tagged_assertion ($2, $3, Void) }
	| Assertions Identifier ':' ';'
		{ add_tagged_assertion ($2, $3, $4) }
	| Assertions E_CLASS
		{
			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion ($2), Void)
			else
				raise_error
			end
		}
	| Assertions E_CLASS ';'
		{
			if assertion_kind = assertion_kind_postcondition then
					-- 'class' assertions only allowed in postconditions.
				add_class_assertion (ast_factory.new_class_assertion ($2), $3)
			else
				raise_error
			end
		}
	;

Start_precondition:
		{ start_precondition }
	;
	
Precondition_opt: -- Empty
		-- { $$ := Void }
	| E_REQUIRE Start_precondition
		{ $$ := new_preconditions ($1, Void) }
	| E_REQUIRE E_ELSE Start_precondition
		{ $$ := new_preconditions ($1, $2) }
	| E_REQUIRE Start_precondition Assertions
		{ $$ := new_preconditions ($1, Void) }
	| E_REQUIRE E_ELSE Start_precondition Assertions
		{ $$ := new_preconditions ($1, $2) }
	;

Start_postcondition:
		{ start_postcondition }
	;
	
Postcondition_opt: -- Empty
		-- { $$ := Void }
	| E_ENSURE Start_postcondition
		{ $$ := new_postconditions ($1, Void) }
	| E_ENSURE E_THEN Start_postcondition
		{ $$ := new_postconditions ($1, $2) }
	| E_ENSURE Start_postcondition Assertions
		{ $$ := new_postconditions ($1, Void) }
	| E_ENSURE E_THEN Start_postcondition Assertions
		{ $$ := new_postconditions ($1, $2) }
	;

Start_invariant:
		{ start_invariant }
	;

Invariant_clause_opt: -- Empty
		-- { $$ := Void }
	| Invariant_clause
		{ $$ := $1 }
	;

Invariant_clause: E_INVARIANT Start_invariant Invariant_start_closure
		{ $$ := new_invariants ($1) }
	| E_INVARIANT Start_invariant Invariant_start_closure Assertions
		{ $$ := new_invariants ($1) }
	;

Invariant_start_closure: -- Empty
		{ set_start_closure (Void) }
	;

Start_loop_invariant:
		{ start_loop_invariant }
	;
	
Loop_invariant_clause_opt: -- Empty
		-- { $$ := Void }
	| Loop_invariant_clause
		{ $$ := $1 }
	;

Loop_invariant_clause: E_INVARIANT start_loop_invariant
		{ $$ := new_loop_invariants ($1) }
	| E_INVARIANT start_loop_invariant Assertions
		{ $$ := new_loop_invariants ($1) }
	;

Variant_clause: E_VARIANT Expression
		{ $$ := ast_factory.new_variant ($1, Void, $2) }
	| E_VARIANT Identifier ':' Expression
		{ $$ := ast_factory.new_variant ($1, ast_factory.new_tag ($2, $3), $4) }
	;

Variant_clause_opt: -- Empty
		-- { $$ := Void }
	| Variant_clause
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Rescue_opt: -- Empty
		-- { $$ := Void }
	| Rescue_compound
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

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

Type_no_bang_identifier: Class_name
		{ $$ := new_named_type (Void, $1, Void) }
	| Class_name Actual_parameters
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
	| '!' Class_name Actual_parameters
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
	| '!' E_TUPLE Tuple_actual_parameters
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '!' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	| '?' E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type ($1, $2, $3) }
	| '?' E_SEPARATE E_TUPLE Tuple_actual_parameters_opt
		{ $$ := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4) }
	;

Class_name: E_IDENTIFIER
		{ $$ := $1 }
	| E_NONE
		{ $$ := $1 }
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

Increment_counter: -- Empty
		{
			increment_counter
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
	;

Tuple_labeled_actual_parameter_list: Identifier ':' Type ']'
		{
			$$ := ast_factory.new_actual_parameters (last_symbol, $4, counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3)), $$)
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
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void), $$)
				end
			end
		}
	| E_NONE ',' Increment_counter Tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void), $$)
				end
			end
		}
	| E_TUPLE ',' Increment_counter Tuple_labeled_actual_parameter_list
		{
			$$ := $4
			if $$ /= Void then
				if not $$.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), $$.first.type), $$)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma ($1, $2), Void), $$)
				end
			end
		}
	;

Tuple_labeled_actual_parameter: Identifier ':' Type
		{
			$$ := ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3))
			if $$ /= Void then
				increment_counter
			end
		}
	;

Tuple_labeled_actual_parameter_semicolon: Identifier ':' Type ';'
		{
			$$ := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter ($1, ast_factory.new_colon_type ($2, $3)), $4)
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
		{$$ := ast_factory.new_qualified_like_braced_type (Void, $1, $2, $3, $4, new_dot_feature_name ($5, $6), last_class)}
	| Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (Void, $1, new_dot_feature_name ($2, $3), last_class)}
	;
	
Qualified_anchored_type: Qualified_anchored_type_with_no_type_mark
		{ $$ := $1 }
	| E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), last_class)}
	| E_ATTACHED E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), last_class)}
	| E_ATTACHED E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), last_class)}
	| E_DETACHABLE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), last_class)}
	| E_DETACHABLE E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), last_class)}
	| '!' E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), last_class)
			end
		}
	| '!' E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), last_class)
			end
		}
	| '?' E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type ($1, $2, $3, $4, $5, new_dot_feature_name ($6, $7), last_class)
			end
		}
	| '?' E_SEPARATE E_LIKE '{' Type '}' '.' Identifier
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, $4, $5, $6, new_dot_feature_name ($7, $8), last_class)
			end
		}
	| E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), last_class)}
	| E_ATTACHED Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), last_class)}
	| E_ATTACHED E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), last_class)}
	| E_DETACHABLE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), last_class)}
	| E_DETACHABLE E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), last_class)}
	| '!' Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), last_class)}
	| '!' E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), last_class)}
	| '?' Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type ($1, $2, new_dot_feature_name ($3, $4), last_class)}
	| '?' E_SEPARATE Anchored_type_with_no_type_mark '.' Identifier
		{$$ := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword ($1, $2), $3, new_dot_feature_name ($4, $5), last_class)}
	;
	
------------------------------------------------------------------------------------

Do_compound: E_DO Compound_opt
		{ $$ := ast_factory.new_do_compound ($1, $2) }
	;

Attribute_compound: E_ATTRIBUTE Compound_opt
		{ $$ := ast_factory.new_attribute_compound ($1, $2) }
	;
	
Then_compound: E_THEN Compound_opt
		{ $$ := ast_factory.new_then_compound ($1, $2) }
	;

Explicit_then_compound: E_THEN Explicit_compound_opt
		{ $$ := ast_factory.new_then_compound ($1, $2) }
	;

Else_compound: E_ELSE Compound_opt
		{ $$ := ast_factory.new_else_compound ($1, $2) }
	;

Explicit_else_compound: E_ELSE Explicit_compound_opt
		{ $$ := ast_factory.new_else_compound ($1, $2) }
	;
	
Rescue_compound: E_RESCUE Compound_opt
		{ $$ := ast_factory.new_rescue_compound ($1, $2) }
	;

From_compound: E_FROM Compound_opt
		{ $$ := ast_factory.new_from_compound ($1, $2) }
	;

From_compound_opt: -- Empty
		-- { $ := Void }
	| From_compound
		{ $$ := $1 }
	;
	
Loop_compound: E_LOOP Compound_opt
		{ $$ := ast_factory.new_loop_compound ($1, $2) }
	;

Compound: Add_counter Instruction_list
		{
			$$ := $2
			remove_counter
		}
	;

Compound_opt: -- Empty
		{ $$ := ast_factory.new_empty_compound }
	| Compound
		{ $$ := $1 }
	;

Explicit_compound_opt: -- Empty
		{ $$ := ast_factory.new_compound (0) }
	| Compound
		{ $$ := $1 }
	;
		
Instruction_list: Instruction
		{
			if attached $1 as l_instruction then
				$$ := ast_factory.new_compound (counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_instruction)
				end
			else
				$$ := ast_factory.new_compound (counter_value)
			end
		}
	| Instruction
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Instruction_list
		{
			$$ := $3
			if $$ /= Void and attached $1 as l_instruction then
				$$.put_first (l_instruction)
			end
		}
-- TODO: generate nice syntax error messages.
--		%error (3)
--			{
--				print ("Instruction expected%N")
--				report_error ("")
--			}
	;

Instruction: Creation_instruction
		{ $$ := $1 }
	| Create_instruction
		{ $$ := $1 }
	| Call_instruction
		{ $$ := $1 }
	| Qualified_call_expression E_ASSIGN_SYMBOL Expression
		{ $$ := ast_factory.new_assigner_instruction ($1, $2, $3) }
	| Bracket_expression E_ASSIGN_SYMBOL Expression
		{ $$ := ast_factory.new_assigner_instruction ($1, $2, $3) }
	| Writable E_ASSIGN_SYMBOL Expression
		{ $$ := ast_factory.new_assignment ($1, $2, $3) }
	| Writable E_REVERSE Expression
		{ $$ := ast_factory.new_assignment_attempt ($1, $2, $3) }
	| Conditional_instruction
		{ $$ := $1 }
	| Multi_branch
		{ $$ := $1 }
	| From_compound Loop_invariant_clause_opt Variant_clause E_UNTIL Expression Loop_compound E_END
		{ $$ := ast_factory.new_loop_instruction_old_syntax ($1, $2, $3, ast_factory.new_conditional ($4, $5), $6, $7) }
	| From_compound Loop_invariant_clause_opt E_UNTIL Expression Loop_compound E_END
		{
			if system_processor.older_ise_version (ise_6_3_7_4554) then
				$$ := ast_factory.new_loop_instruction_old_syntax ($1, $2, Void, ast_factory.new_conditional ($3, $4), $5, $6)
			else
				$$ := ast_factory.new_loop_instruction ($1, $2, ast_factory.new_conditional ($3, $4), $5, Void, $6)
			end
		}
	| From_compound Loop_invariant_clause_opt E_UNTIL Expression Loop_compound Variant_clause E_END
		{
			if system_processor.older_ise_version (ise_6_3_7_4554) then
				raise_error
			else
				$$ := ast_factory.new_loop_instruction ($1, $2, ast_factory.new_conditional ($3, $4), $5, $6, $7)
			end
		}
-- TODO: generate nice syntax error messages.
--		%error(7)
--			{
--				print ("End expected")
--			}
	| Across_instruction_header From_compound_opt Loop_invariant_clause_opt Until_expression_opt Loop_compound Variant_clause_opt E_END
		{ $$ := new_across_instruction ($1, $2, $3, $4, $5, $6, $7) }
	| Repeat_instruction_header Compound_opt E_CLOSE_REPEAT
		{ $$ := new_repeat_instruction ($1, $2, $3) }
	| Debug_instruction
		{ $$ := $1 }
	| Check_instruction
		{ $$ := $1 }
	| E_RETRY
		{ $$ := $1 }
	| ';'
		{ $$ := ast_factory.new_null_instruction ($1) }
	;
	
------------------------------------------------------------------------------------

Start_check_instruction:
		{ start_check_instruction }
	;
	
Check_instruction: E_CHECK Start_check_instruction E_END
		{ $$ := new_check_instruction ($1, Void, $3) }
	| E_CHECK Start_check_instruction Assertions E_END
		{ $$ := new_check_instruction ($1, Void, $4) }
	| E_CHECK Start_check_instruction Explicit_then_compound E_END
		{ $$ := new_check_instruction ($1, $3, $4) }
	| E_CHECK Start_check_instruction Assertions Explicit_then_compound E_END
		{ $$ := new_check_instruction ($1, $4, $5) }
	;
	
------------------------------------------------------------------------------------

Creation_instruction: '!' Type_no_bang_identifier '!' Writable
		{ $$ := ast_factory.new_bang_instruction ($1, $2, $3, $4, Void) }
	| '!' Type_no_bang_identifier '!' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_bang_instruction ($1, $2, $3, $4, ast_factory.new_qualified_call (new_dot_feature_name ($5, $6), $7)) }
	| '!' '!' Writable
		{ $$ := ast_factory.new_bang_instruction ($1, Void, $2, $3, Void) }
	| '!' '!' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_bang_instruction ($1, Void, $2, $3, ast_factory.new_qualified_call (new_dot_feature_name ($4, $5), $6)) }
	;

Create_instruction: E_CREATE Creation_region '{' Type '}' Writable
		{ $$ := ast_factory.new_create_instruction ($1, $2, ast_factory.new_target_type ($3, $4, $5), $6, Void) }
	| E_CREATE Creation_region '{' Type '}' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_instruction ($1, $2, ast_factory.new_target_type ($3, $4, $5), $6, ast_factory.new_qualified_call (new_dot_feature_name ($7, $8), $9)) }
	| E_CREATE Creation_region Writable
		{ $$ := ast_factory.new_create_instruction ($1, $2, Void, $3, Void) }
	| E_CREATE Creation_region Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_instruction ($1, $2, Void, $3, ast_factory.new_qualified_call (new_dot_feature_name ($4, $5), $6)) }
	;

Create_expression: E_CREATE Creation_region '{' Type '}' 
		{ $$ := ast_factory.new_create_expression ($1, $2, ast_factory.new_target_type ($3, $4, $5), Void) }
	| E_CREATE Creation_region '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_expression ($1, $2, ast_factory.new_target_type ($3, $4, $5), ast_factory.new_qualified_call (new_dot_feature_name ($6, $7), $8)) }
	;

Creation_region: -- Empty
	| '<' Class_name '>'
		{ $$ := ast_factory.new_creation_region ($1, $2, $3) }
	;

------------------------------------------------------------------------------------

Conditional_instruction: E_IF Expression Then_compound E_END
		{ $$ := ast_factory.new_if_instruction (ast_factory.new_conditional ($1, $2), $3, Void, Void, $4) }
	| E_IF Expression Then_compound Else_compound E_END
		{ $$ := ast_factory.new_if_instruction (ast_factory.new_conditional ($1, $2), $3, Void, $4, $5) }
	| E_IF Expression Then_compound Elseif_list E_END
		{ $$ := ast_factory.new_if_instruction (ast_factory.new_conditional ($1, $2), $3, $4, Void, $5) }
	| E_IF Expression Then_compound Elseif_list Else_compound E_END
		{ $$ := ast_factory.new_if_instruction (ast_factory.new_conditional ($1, $2), $3, $4, $5, $6) }
	;

Elseif_list: Add_counter Elseif_part_list
		{
			$$ := $2
			remove_counter
		}
	;

Elseif_part_list: Elseif_part
		{
			$$ := ast_factory.new_elseif_part_list (counter_value)
			if $$ /= Void and attached $1 as l_elseif_part then
				$$.put_first (l_elseif_part)
			end
		}
	| Elseif_part Elseif_part_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_elseif_part then
				$$.put_first (l_elseif_part)
			end
		}
	;

Elseif_part: E_ELSEIF Expression Then_compound
		{
			$$ := ast_factory.new_elseif_part (ast_factory.new_conditional ($1, $2), $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Conditional_expression: E_IF Expression E_THEN Expression E_ELSE Expression E_END
		{ $$ := ast_factory.new_if_expression (ast_factory.new_conditional ($1, $2), $3, $4, Void, $5, $6, $7) }
	| E_IF Expression E_THEN Expression Elseif_expressions E_ELSE Expression E_END
		{ $$ := ast_factory.new_if_expression (ast_factory.new_conditional ($1, $2), $3, $4, $5, $6, $7, $8) }
	;

Elseif_expressions: Add_counter Elseif_expression_list
		{
			$$ := $2
			remove_counter
		}
	;

Elseif_expression_list: Elseif_expression
		{
			$$ := ast_factory.new_elseif_expression_list (counter_value)
			if $$ /= Void and attached $1 as l_elseif_part then
				$$.put_first (l_elseif_part)
			end
		}
	| Elseif_expression Elseif_expression_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_elseif_part then
				$$.put_first (l_elseif_part)
			end
		}
	;

Elseif_expression: E_ELSEIF Expression E_THEN Expression
		{
			$$ := ast_factory.new_elseif_expression (ast_factory.new_conditional ($1, $2), $3, $4)
			if $$ /= Void then
				increment_counter
			end
		}
	;
	
------------------------------------------------------------------------------------

Multi_branch: E_INSPECT Expression When_list_opt Explicit_else_compound E_END
		{ $$ := ast_factory.new_inspect_instruction (ast_factory.new_conditional ($1, $2), $3, $4, $5) }
	| E_INSPECT Expression When_list_opt E_END
		{ $$ := ast_factory.new_inspect_instruction (ast_factory.new_conditional ($1, $2), $3, Void, $4) }
	;

When_list_opt: -- Empty
		-- { $$ := Void }
	| Add_counter When_list
		{
			$$ := $2
			remove_counter
		}
	;

When_list: When_part
		{
			$$ := ast_factory.new_when_part_list (counter_value)
			if $$ /= Void and attached $1 as l_when_part then
				$$.put_first (l_when_part)
			end
		}
	| When_part When_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_when_part then
				$$.put_first (l_when_part)
			end
		}
	;

When_part: Choices Then_compound
		{
			$$ := ast_factory.new_when_part ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Choices: E_WHEN
		{ $$ := ast_factory.new_choice_list ($1, 0) }
	| E_WHEN
		{
			add_keyword ($1)
			add_counter
		}
	  Choice_list
		{
			$$ := $3
			remove_keyword
			remove_counter
		}
	;

Choice_list: Choice
		{
			if attached $1 as l_choice then
				$$ := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_choice)
				end
			else
				$$ := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		}
	| Choice_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_choice_list (last_keyword, counter_value)
			if $$ /= Void and attached $1 as l_choice then
				$$.put_first (l_choice)
			end
		}
	| Choice_comma Choice_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_choice then
				$$.put_first (l_choice)
			end
		}
	;

Choice_comma: Choice ','
		{
			$$ := ast_factory.new_choice_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Choice: Choice_constant
		{ $$ := $1 }
	| Choice_constant E_DOTDOT Choice_constant
		{ $$ := ast_factory.new_choice_range ($1, $2, $3) }
	;

Choice_constant: Integer_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
	| Identifier
		{ $$ := new_choice_attribute_constant ($1) }
	| Static_call_expression
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Multi_branch_expression: E_INSPECT Expression When_expression_list_opt E_ELSE Expression E_END
		{ $$ := ast_factory.new_inspect_expression (ast_factory.new_conditional ($1, $2), $3, ast_factory.new_conditional ($4, $5), $6) }
	| E_INSPECT Expression When_expression_list_opt E_END
		{ $$ := ast_factory.new_inspect_expression (ast_factory.new_conditional ($1, $2), $3, Void, $4) }
	;

When_expression_list_opt: -- Empty
		-- { $$ := Void }
	| Add_counter When_expression_list
		{
			$$ := $2
			remove_counter
		}
	;

When_expression_list: When_expression
		{
			$$ := ast_factory.new_when_expression_list (counter_value)
			if $$ /= Void and attached $1 as l_when_part then
				$$.put_first (l_when_part)
			end
		}
	| When_expression When_expression_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_when_part then
				$$.put_first (l_when_part)
			end
		}
	;

When_expression: Choices E_THEN Expression
		{
			$$ := ast_factory.new_when_expression ($1, $2, $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;
	
------------------------------------------------------------------------------------

Across_instruction_header: E_ACROSS Expression E_AS Identifier
		{ $$ := new_across_instruction_header ($1, $2, $3, $4) }
	| E_ACROSS Expression E_IS Identifier
		{ $$ := new_across_instruction_header ($1, $2, $3, $4) }
	;

Repeat_instruction_header: E_OPEN_REPEAT Identifier ':' Expression E_BAR
		{ $$ := new_repeat_instruction_header ($1, $2, $3, $4, $5) }
	;
	
Until_expression_opt: -- Empty
		-- { $$ := Void }
	| E_UNTIL Expression
		{ $$ := ast_factory.new_conditional ($1, $2) }
	;
	
------------------------------------------------------------------------------------

Debug_instruction: E_DEBUG Parenthesized_untyped_manifest_string_list_opt Compound_opt E_END
		{ $$ := ast_factory.new_debug_instruction ($2, ast_factory.new_debug_compound ($1, $3), $4) }
	;

Parenthesized_untyped_manifest_string_list_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := ast_factory.new_manifest_string_list ($1, $2, 0) }
	| '('
		{
			add_symbol ($1)
			add_counter
		}
	  Untyped_manifest_string_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Untyped_manifest_string_list: Untyped_manifest_string ')'
		{
			if attached $1 as l_manifest_string then
				$$ := ast_factory.new_manifest_string_list (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_manifest_string)
				end
			else
				$$ := ast_factory.new_manifest_string_list (last_symbol, $2, counter_value)
			end
		}
	| Untyped_manifest_string_comma Untyped_manifest_string_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_manifest_string then
				$$.put_first (l_manifest_string)
			end
		}
	;

Untyped_manifest_string_comma: Untyped_manifest_string ','
		{
			$$ := ast_factory.new_manifest_string_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Call_instruction: Identifier Actuals_opt
		{ $$ := new_unqualified_call_instruction ($1, $2) }
	| Typed_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_instruction ($1, new_dot_feature_name ($2, $3), $4) }
	| Untyped_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_instruction ($1, new_dot_feature_name ($2, $3), $4) }
	| E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_instruction (False, $1, Void, $2) }
	| E_PRECURSOR '{' Class_name '}' Actuals_opt
		{ $$ := ast_factory.new_precursor_instruction (False, $1, ast_factory.new_precursor_class_name ($2, $3, $4), $5) }
	| E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_instruction ($1, ast_factory.new_target_type ($2, $3, $4), new_dot_feature_name ($5, $6), $7) }
	| '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_instruction (Void, ast_factory.new_target_type ($1, $2, $3), new_dot_feature_name ($4, $5), $6) }
	;

Untyped_call_expression: Identifier Actuals_opt
		{ $$ := new_unqualified_call_expression ($1, $2) }
	| Untyped_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	;
	
Typed_call_expression: Typed_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	;
	
Qualified_call_expression: Typed_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	| Untyped_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	;

Static_call_expression: E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_expression ($1, ast_factory.new_target_type ($2, $3, $4), new_dot_feature_name ($5, $6), $7) }
	| '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_expression (Void, ast_factory.new_target_type ($1, $2, $3), new_dot_feature_name ($4, $5), $6) }
	;

Precursor_expression: E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_expression (False, $1, Void, $2) }
	| E_PRECURSOR '{' Class_name '}' Actuals_opt
		{ $$ := ast_factory.new_precursor_expression (False, $1, ast_factory.new_precursor_class_name ($2, $3, $4), $5) }
	;
	
Untyped_call_chain: Identifier Actuals_opt
		{ $$ := new_unqualified_call_expression ($1, $2) }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Iteration_cursor
		{ $$ := $1 }
	| Untyped_bracket_expression
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := $1
			end
		}
	| Static_call_expression
		{ $$ := $1 }
	| Untyped_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	;

Typed_call_chain: Typed_bracket_expression
		{
			if system_processor.older_ise_version (ise_5_7_59914) then
				raise_error
			else
				$$ := $1
			end
		}
	| Typed_call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_qualified_call_expression ($1, new_dot_feature_name ($2, $3), $4) }
	;
	
------------------------------------------------------------------------------------

Actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := ast_factory.new_actual_arguments ($1, $2, 0) }
	| '('
		{
			add_symbol ($1)
			add_counter
		}
	  Actuals_expression_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Actuals_expression_list: Expression ')'
		{
			if attached $1 as l_expression then
				$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_expression)
				end
			else
				$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	| Expression_comma Actuals_expression_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	;

Expression_comma: Expression ','
		{
			$$ := ast_factory.new_expression_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Address_mark: '$' Feature_name
		{ $$ := new_feature_address ($1, $2) }
	| '$' E_CURRENT
		{ $$ := ast_factory.new_current_address ($1, $2) }
	| '$' E_RESULT
		{ $$ := ast_factory.new_result_address ($1, $2) }
	| '$' Parenthesized_expression
		-- Note: The following construct is an
		-- extension of the Eiffel syntax provided
		-- in ISE Eiffel and Halstenbach compilers.
		{ $$ := ast_factory.new_expression_address ($1, $2) }
	;

Writable: Identifier
		{ $$ := new_writable ($1) }
	| E_RESULT
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Expression: Binary_expression
		{ $$ := $1 }
	| Non_binary_expression
		{ $$ := $1 }
	;

Binary_expression: Expression E_FREEOP Expression
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_free_operator ($2), $3) }
	| Expression '@' Expression
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_free_operator_from_symbol ($2), $3) }
	| Expression '+' Expression
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_plus_operator ($2), $3) }
	| Expression '-' Expression
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_minus_operator ($2), $3) }
	| Expression '*' Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression '/' Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression '^' Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_DIV Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_MOD Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression '<' Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression '>' Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_LE Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_GE Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_AND Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_AND_SYMBOL Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_OR Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_OR_SYMBOL Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_XOR Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_XOR_SYMBOL Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_AND E_THEN Expression %prec E_AND
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_and_then_operator ($2, $3), $4) }
	| Expression E_AND_THEN_SYMBOL Expression %prec E_AND
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_OR E_ELSE Expression %prec E_OR
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_or_else_operator ($2, $3), $4) }
	| Expression E_OR_ELSE_SYMBOL Expression %prec E_OR
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_IMPLIES Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_IMPLIES_SYMBOL Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression '=' Expression
		{ $$ := ast_factory.new_equality_expression ($1, $2, $3) }
	| Expression E_NE Expression
		{ $$ := ast_factory.new_equality_expression ($1, $2, $3) }
	| Expression '~' Expression
		{ $$ := ast_factory.new_object_equality_expression ($1, $2, $3) }
	| Expression E_NOT_TILDE Expression
		{ $$ := ast_factory.new_object_equality_expression ($1, $2, $3) }
	;

Non_binary_expression: Non_binary_and_typed_expression
		{ $$ := $1 }
	| Typed_integer_constant
		{ $$ := $1 }
	| Typed_real_constant
		{ $$ := $1 }
	| Typed_bracket_target
		{ $$ := $1 }
	| Typed_bracket_expression
		{ $$ := $1 }
	| '{' Type '}'
		{ $$ := ast_factory.new_manifest_type ($1, $2, $3) }
	;

Non_binary_and_typed_expression: Untyped_bracket_target
		{ $$ := $1 }
	| Untyped_bracket_expression
		{ $$ := $1 }
	| Create_expression
		{ $$ := $1 }
	| Across_some_expression
		{ $$ := $1 }
	| Across_all_expression
		{ $$ := $1 }
	| Quantifier_expression
		{ $$ := $1 }
	| Conditional_expression
		{ $$ := $1 }
	| Multi_branch_expression
		{ $$ := $1 }
	| Manifest_tuple
		{ $$ := $1 }
	| E_INTEGER
	 	{ $$ := $1 }
	| E_REAL
		{ $$ := $1 }
	| '+' Non_binary_expression %prec E_NOT
		{ $$ := new_prefix_plus_expression ($1, $2) }
	| '-' Non_binary_expression %prec E_NOT
		{ $$ := new_prefix_minus_expression ($1, $2) }
	| E_NOT Non_binary_expression
		{ $$ := ast_factory.new_prefix_expression ($1, $2) }
	| E_NOT_SYMBOL Non_binary_expression
		{ $$ := ast_factory.new_prefix_expression ($1, $2) }
	| E_FREEOP Non_binary_expression %prec E_NOT
		{ $$ := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator ($1), $2) }
	| E_OLD Non_binary_expression
		{ $$ := ast_factory.new_old_expression ($1, $2) }
	| '{' Identifier ':' Type '}' Non_binary_expression %prec E_NOT
		{
			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				$$ := new_old_object_test ($1, $2, $3, $4, $5, $6)
			end
		}
	| E_ATTACHED Non_binary_and_typed_expression %prec E_NOT
		{ $$ := ast_factory.new_object_test ($1, Void, $2) }
	| E_ATTACHED '{' Type '}' Non_binary_and_typed_expression %prec E_NOT
		{ $$ := ast_factory.new_object_test ($1, ast_factory.new_target_type ($2, $3, $4), $5) }
	| E_ATTACHED Non_binary_and_typed_expression E_AS Identifier
		{ $$ := new_named_object_test ($1, Void, $2, $3, $4) }
	| E_ATTACHED '{' Type '}' Non_binary_and_typed_expression E_AS Identifier
		{ $$ := new_named_object_test ($1, ast_factory.new_target_type ($2, $3, $4), $5, $6, $7) }
	;

Untyped_bracket_target: Untyped_call_expression
		{ $$ := $1 }
	| Static_call_expression
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Boolean_constant
		{ $$ := $1 }
	| Call_agent
		{ $$ := $1 }
	| Inline_agent
		{ $$ := $1 }
	| E_VOID
		{ $$ := $1 }
	| Iteration_cursor
		{ $$ := $1 }
	| Untyped_character_constant
		{ $$ := $1 }
	| Untyped_manifest_string
		{ $$ := $1 }
	| E_ONCE_STRING Manifest_string
--
-- We need to make the distinction between once keywords followed
-- by a manifest string and once keywords introducing a once-routine
-- because otherwise we would need to have two look-ahead tokens
-- to figure out that the first once keyword in the following example
-- in part of a once manifest string expression and the second is
-- part of the compound of the once routine:
--   f is
--      require
--         once "foo" /= Void
--      once
--         do_nothing
--      end
-- Hence the use of 'E_ONCE_STRING' instead of 'E_ONCE'.
--
-- Also covers the case of typed manifest string:
--
--   f
--      require
--         once {STRING_8} "foo" /= Void
--      once
--         do_nothing
--      end
--
-- although this will produce a syntax error when writing:
--
--   f
--      once
--         {CHARACTER_8}.Max_value.do_nothing
--      end
--
		{ $$ := new_once_manifest_string ($1, $2) }
	| Untyped_manifest_array
		{ $$ := $1 }
	| Strip_expression
		{ $$ := $1 }
	| Address_mark
		{ $$ := $1 }
	;

Typed_bracket_target: Typed_call_expression
		{ $$ := $1 }
	| Typed_manifest_string
		{ $$ := $1 }
	| Typed_manifest_array
		{
			if system_processor.older_ise_version (ise_17_11_0) then
				raise_error
			else
				$$ := $1
			end
		}
	| Typed_character_constant
		{ $$ := $1 }
	;
	
Bracket_expression: Typed_bracket_expression
		{ $$ := $1 }
	| Untyped_bracket_expression
		{ $$ := $1 }
	;

Typed_bracket_expression: Typed_bracket_target '['
		{
			add_symbol ($2)
			add_counter
		}
	  Bracket_actual_list
		{
			$$ := ast_factory.new_bracket_expression ($1, $2, $4)
			remove_symbol
			remove_counter
		}
	| Typed_bracket_expression '['
		{
			add_symbol ($2)
			add_counter
		}
	  Bracket_actual_list
		{
			$$ := ast_factory.new_bracket_expression ($1, $2, $4)
			remove_symbol
			remove_counter
		}
	;
	
Untyped_bracket_expression: Untyped_bracket_target '['
		{
			add_symbol ($2)
			add_counter
		}
	  Bracket_actual_list
		{
			$$ := ast_factory.new_bracket_expression ($1, $2, $4)
			remove_symbol
			remove_counter
		}
	| Untyped_bracket_expression '['
		{
			add_symbol ($2)
			add_counter
		}
	  Bracket_actual_list
		{
			$$ := ast_factory.new_bracket_expression ($1, $2, $4)
			remove_symbol
			remove_counter
		}
	;

Bracket_actual_list: Expression ']'
		{
			if attached $1 as l_expression then
				$$ := ast_factory.new_bracket_arguments (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_expression)
				end
			else
				$$ := ast_factory.new_bracket_arguments (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma ']'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_bracket_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	| Expression_comma Bracket_actual_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	;

Parenthesized_expression: Left_parenthesis Expression ')'
		{
			remove_symbol
			remove_counter
		 	$$ := ast_factory.new_parenthesized_expression ($1, $2, $3)
		 }
	;

Untyped_manifest_array: E_LARRAY E_RARRAY
		{ $$ := ast_factory.new_manifest_array ($1, $2, 0) }
	| E_LARRAY
		{
			add_symbol ($1)
			add_counter
		}
	  Manifest_array_expression_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Typed_manifest_array: '{' Type '}' Untyped_manifest_array
		{
			$$ := $4
			if $$ /= Void then
				$$.set_cast_type (ast_factory.new_target_type ($1, $2, $3))
			end
		}
	;
	
Manifest_array_expression_list: Expression E_RARRAY
		{
			if attached $1 as l_expression then
				$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_expression)
				end
			else
				$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma E_RARRAY
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	| Expression_comma Manifest_array_expression_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	;

Manifest_tuple: '[' ']'
		{ $$ := ast_factory.new_manifest_tuple ($1, $2, 0) }
	| '['
		{
			add_symbol ($1)
			add_counter
		}
	  Manifest_tuple_expression_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Manifest_tuple_expression_list: Expression ']'
		{
			if attached $1 as l_expression then
				$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_expression)
				end
			else
				$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma ']'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	| Expression_comma Manifest_tuple_expression_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_expression then
				$$.put_first (l_expression)
			end
		}
	;

Strip_expression: E_STRIP '(' ')'
		{ $$ := ast_factory.new_strip_expression ($1, $2, $3, 0) }
	| E_STRIP '('
		{
			add_keyword ($1)
			add_symbol ($2)
			add_counter
		}
	  Strip_feature_name_list
		{
			$$ := $4
			remove_keyword
			remove_symbol
			remove_counter
		}
	;

Strip_feature_name_list: Feature_name ')'
		{
			if attached $1 as l_feature_name then
				$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_feature_name)
				end
			else
				$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value)
			end
		}
	| Feature_name_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	| Feature_name_comma Strip_feature_name_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_feature_name then
				$$.put_first (l_feature_name)
			end
		}
	;

Manifest_constant: Boolean_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
	| Integer_constant
		{ $$ := $1 }
	| Real_constant
		{ $$ := $1 }
	| Manifest_string
		{ $$ := $1 }
	;

Across_some_expression: Across_expression_header Loop_invariant_clause_opt Until_expression_opt E_SOME Expression Variant_clause_opt E_END
		{ $$ := new_across_some_expression ($1, $2, $3, ast_factory.new_conditional ($4, $5), $6, $7) }
	;

Across_all_expression: Across_expression_header Loop_invariant_clause_opt Until_expression_opt E_ALL Expression Variant_clause_opt E_END
		{ $$ := new_across_all_expression ($1, $2, $3, ast_factory.new_conditional ($4, $5), $6, $7) }
	;

Across_expression_header: E_ACROSS Expression E_AS Identifier
		{ $$ := new_across_expression_header ($1, $2, $3, $4) }
	| E_ACROSS Expression E_IS Identifier
		{ $$ := new_across_expression_header ($1, $2, $3, $4) }
	;

Quantifier_expression: Quantifier_expression_header Expression
		{ $$ := new_quantifier_expression ($1, $2) }
	;
	
Quantifier_expression_header: E_FOR_ALL Identifier ':' Expression E_BAR
		{ $$ := new_for_all_quantifier_expression_header ($1, $2, $3, $4, $5) }
	| E_THERE_EXISTS Identifier ':' Expression E_BAR
		{ $$ := new_there_exists_quantifier_expression_header ($1, $2, $3, $4, $5) }
	;

Iteration_cursor: '@' Identifier %prec E_ITERATION_CURSOR_SYMBOL
		{
			if current_universe.use_obsolete_syntax_mode then
				$$ := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator_from_symbol ($1), $2)
			else
				$$ := new_iteration_cursor ($1, $2)
			end
		}
	;

------------------------------------------------------------------------------------

Call_agent: E_AGENT Feature_name Agent_actuals_opt
		{ $$ := ast_factory.new_call_agent ($1, Void, $2, $3) }
	| E_AGENT Agent_target '.' Feature_name Agent_actuals_opt
		{ $$ := ast_factory.new_call_agent ($1, $2, ast_factory.new_dot_feature_name ($3, $4), $5) }
	;

Inline_agent: Inline_agent_no_actual_arguments Agent_actuals_opt
		{
			set_inline_agent_actual_arguments ($1, $2)
			$$ := $1
		}
	;

Inline_agent_no_actual_arguments:
-- There is a syntactical ambiguity with attribute inline agents.
--	E_AGENT ':' Type Agent_actuals_opt
--		{ $$ := ast_factory.new_attribute_inline_agent ($1, ast_factory.new_colon_type ($2, $3), $4) }
	E_AGENT No_inline_agent_formal_arguments ':' Type
	Precondition_opt Local_declarations_opt Do_compound Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_do_function_inline_agent ($1, Void, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments ':' Type
	Precondition_opt Local_declarations_opt Do_compound Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_do_function_inline_agent ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, Void)
			register_inline_agent ($$)
		}
	| E_AGENT No_inline_agent_formal_arguments ':' Type
	Precondition_opt Local_declarations_opt E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_once_function_inline_agent ($1, Void, ast_factory.new_colon_type ($3, $4), $5, $6, $8, ast_factory.new_once_compound ($7, $9), $10, $11, $12, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments ':' Type
	Precondition_opt Local_declarations_opt E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_once_function_inline_agent ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $8, ast_factory.new_once_compound ($7, $9), $10, $11, $12, Void)
			register_inline_agent ($$)
		}
	| E_AGENT No_inline_agent_formal_arguments ':' Type
	Precondition_opt E_EXTERNAL Untyped_manifest_string External_name_opt Postcondition_opt E_END
		{
			$$ := ast_factory.new_external_function_inline_agent ($1, Void, ast_factory.new_colon_type ($3, $4), $5, ast_factory.new_external_language ($6, $7), $8, $9, $10, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments ':' Type
	Precondition_opt E_EXTERNAL Untyped_manifest_string External_name_opt Postcondition_opt E_END
		{
			$$ := ast_factory.new_external_function_inline_agent ($1, $2, ast_factory.new_colon_type ($3, $4), $5, ast_factory.new_external_language ($6, $7), $8, $9, $10, Void)
			register_inline_agent ($$)
		}
	| E_AGENT No_inline_agent_formal_arguments
	Precondition_opt Local_declarations_opt Do_compound Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_do_procedure_inline_agent ($1, Void, $3, $4, $5, $6, $7, $8, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments
	Precondition_opt Local_declarations_opt Do_compound Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_do_procedure_inline_agent ($1, $2, $3, $4, $5, $6, $7, $8, Void)
			register_inline_agent ($$)
		}
	| E_AGENT No_inline_agent_formal_arguments
	Precondition_opt Local_declarations_opt E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_once_procedure_inline_agent ($1, Void, $3, $4, $6, ast_factory.new_once_compound ($5, $7), $8, $9, $10, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments
	Precondition_opt Local_declarations_opt E_ONCE Parenthesized_untyped_manifest_string_list_opt Compound_opt Postcondition_opt Rescue_opt E_END
		{
			$$ := ast_factory.new_once_procedure_inline_agent ($1, $2, $3, $4, $6, ast_factory.new_once_compound ($5, $7), $8, $9, $10, Void)
		}
	| E_AGENT No_inline_agent_formal_arguments
	Precondition_opt E_EXTERNAL Untyped_manifest_string External_name_opt Postcondition_opt E_END
		{
			$$ := ast_factory.new_external_procedure_inline_agent ($1, Void, $3, ast_factory.new_external_language ($4, $5), $6, $7, $8, Void)
			register_inline_agent ($$)
		}
	| E_AGENT Inline_agent_formal_arguments
	Precondition_opt E_EXTERNAL Untyped_manifest_string External_name_opt Postcondition_opt E_END
		{
			$$ := ast_factory.new_external_procedure_inline_agent ($1, $2, $3, ast_factory.new_external_language ($4, $5), $6, $7, $8, Void)
			register_inline_agent ($$)
		}
	;

Inline_agent_formal_arguments: Formal_arguments
		{
			$$ := $1
			set_start_closure ($$)
		}
	;

No_inline_agent_formal_arguments: -- Empty
		{ set_start_closure (Void) }
	;

Agent_target: Identifier
		{ $$ := new_agent_identifier_target ($1) }
	| Parenthesized_expression
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| '{' Type '}'
		{ $$ := ast_factory.new_agent_open_target ($1, $2, $3) }
	;

Agent_actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := ast_factory.new_agent_argument_operands ($1, $2, 0) }
	| '('
		{
			add_symbol ($1)
			add_counter
		}
	  Agent_actual_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Agent_actual_list: Agent_actual ')'
		{
			if attached $1 as l_agent_actual then
				$$ := ast_factory.new_agent_argument_operands (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first (l_agent_actual)
				end
			else
				$$ := ast_factory.new_agent_argument_operands (last_symbol, $2, counter_value)
			end
		}
	| Agent_actual_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_agent_argument_operands (last_symbol, $2, counter_value)
			if $$ /= Void and attached $1 as l_agent_actual then
				$$.put_first (l_agent_actual)
			end
		}
	| Agent_actual_comma Agent_actual_list
		{
			$$ := $2
			if $$ /= Void and attached $1 as l_agent_actual then
				$$.put_first (l_agent_actual)
			end
		}
	;

Agent_actual_comma: Agent_actual ','
		{
			$$ := ast_factory.new_agent_argument_operand_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Agent_actual: Expression
		{ $$ := $1 }
	| '?'
		{ $$ := $1 }
	| '{' Type '}' '?'
		{ $$ := ast_factory.new_agent_typed_open_argument ($1, $2, $3, $4) }
	;

------------------------------------------------------------------------------------
	
Manifest_string: Untyped_manifest_string
		{ $$ := $1 }
	| Typed_manifest_string
		{ $$ := $1 }
	;
	
Untyped_manifest_string: E_STRING
		{ $$ := $1 }
	| E_STRPLUS
		{ $$ := $1 }
	| E_STRMINUS
		{ $$ := $1 }
	| E_STRSTAR
		{ $$ := $1 }
	| E_STRSLASH
		{ $$ := $1 }
	| E_STRDIV
		{ $$ := $1 }
	| E_STRMOD
		{ $$ := $1 }
	| E_STRPOWER
		{ $$ := $1 }
	| E_STRLT
		{ $$ := $1 }
	| E_STRLE
		{ $$ := $1 }
	| E_STRGT
		{ $$ := $1 }
	| E_STRGE
		{ $$ := $1 }
	| E_STRAND
		{ $$ := $1 }
	| E_STRANDSYMBOL
		{ $$ := $1 }
	| E_STROR
		{ $$ := $1 }
	| E_STRORSYMBOL
		{ $$ := $1 }
	| E_STRXOR
		{ $$ := $1 }
	| E_STRXORSYMBOL
		{ $$ := $1 }
	| E_STRANDTHEN
		{ $$ := $1 }
	| E_STRANDTHENSYMBOL
		{ $$ := $1 }
	| E_STRORELSE
		{ $$ := $1 }
	| E_STRORELSESYMBOL
		{ $$ := $1 }
	| E_STRIMPLIES
		{ $$ := $1 }
	| E_STRIMPLIESSYMBOL
		{ $$ := $1 }
	| E_STRFREEOP
		{ $$ := $1 }
	| E_STRNOT
		{ $$ := $1 }
	| E_STRNOTSYMBOL
		{ $$ := $1 }
	| E_STRDOTDOT
		{ $$ := $1 }
	| E_STRBRACKET
		{ $$ := $1 }
	| E_STRPARENTHESIS
		{ $$ := $1 }
	| E_STRERR
		{ abort }
	;

Typed_manifest_string: '{' Type '}' Untyped_manifest_string
		{
			$$ := $4
			if $$ /= Void then
				$$.set_cast_type (ast_factory.new_target_type ($1, $2, $3))
			end
		}
	;

Character_constant: Untyped_character_constant
		{ $$ := $1 }
	| Typed_character_constant
		{ $$ := $1 }
	;

Untyped_character_constant: E_CHARACTER
		{ $$ := $1 }
	| E_CHARERR
		{ abort }
	;

Typed_character_constant: '{' Type '}' Untyped_character_constant
		{
			$$ := $4
			if $$ /= Void then
				$$.set_cast_type (ast_factory.new_target_type ($1, $2, $3))
			end
		}
	;
	
Boolean_constant: E_TRUE
		{ $$ := $1 }
	| E_FALSE
		{ $$ := $1 }
	;

Integer_constant: Untyped_integer_constant
		{ $$ := $1 }
	| Typed_integer_constant
		{ $$ := $1 }
	;

Untyped_integer_constant: E_INTEGER
		{ $$ := $1 }
	| Signed_integer_constant
		{ $$ := $1 }
	;

Signed_integer_constant: '-' E_INTEGER
		{
			$$ := $2
			if $$ /= Void then
				$$.set_sign ($1)
			end
		}
	| '+' E_INTEGER
		{
			$$ := $2
			if $$ /= Void then
				$$.set_sign ($1)
			end
		}
	;

Typed_integer_constant: '{' Type '}' Untyped_integer_constant
		{
			$$ := $4
			if $$ /= Void then
				$$.set_cast_type (ast_factory.new_target_type ($1, $2, $3))
			end
		}
	;

Real_constant: Untyped_real_constant
		{ $$ := $1 }
	| Typed_real_constant
		{ $$ := $1 }
	;

Untyped_real_constant: E_REAL
		{ $$ := $1 }
	| Signed_real_constant
		{ $$ := $1 }
	;

Signed_real_constant: '-' E_REAL
		{
			$$ := $2
			if $$ /= Void then
				$$.set_sign ($1)
			end
		}
	| '+' E_REAL
		{
			$$ := $2
			if $$ /= Void then
				$$.set_sign ($1)
			end
		}
	;

Typed_real_constant: '{' Type '}' Untyped_real_constant
		{
			$$ := $4
			if $$ /= Void then
				$$.set_cast_type (ast_factory.new_target_type ($1, $2, $3))
			end
		}
	;

Identifier: E_IDENTIFIER
		{ $$ := $1 }
	| E_NONE
		{ $$ := $1 }
	| E_TUPLE
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Add_counter: { add_counter }
	;
	
--------------------------------------------------------------------------------
%%

feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

end
