%{
indexing

	description:

		"Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner,
			make_with_factory as make_eiffel_scanner_with_factory
		undefine
			reset
		end

creation

	make, make_with_factory

%}

%token <ET_KEYWORD> E_AGENT E_ALIAS E_ALL E_AS E_CHECK
%token <ET_KEYWORD> E_CLASS E_CREATE E_CREATION E_DEBUG
%token <ET_KEYWORD> E_DO E_ELSE E_ELSEIF E_END E_ENSURE
%token <ET_KEYWORD> E_EXPORT E_EXTERNAL E_FEATURE E_FROM E_FROZEN
%token <ET_KEYWORD> E_IF E_INDEXING E_INFIX E_INHERIT E_INSPECT
%token <ET_KEYWORD> E_INVARIANT E_IS E_LIKE E_LOCAL E_LOOP E_OBSOLETE
%token <ET_KEYWORD> E_ONCE E_ONCE_STRING E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
%token <ET_KEYWORD> E_RESCUE E_SELECT E_STRIP
%token <ET_KEYWORD> E_THEN E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT
%token <ET_KEYWORD> E_WHEN E_PRECURSOR
%token <ET_KEYWORD> E_DEFERRED E_EXPANDED E_REFERENCE E_SEPARATE

%token <ET_SYMBOL> E_ARROW E_DOTDOT E_LARRAY E_RARRAY
%token <ET_SYMBOL> E_ASSIGN E_REVERSE
%token <ET_POSITION> E_UNKNOWN

%token <ET_BIT_CONSTANT> E_BIT
%token <ET_BOOLEAN_CONSTANT> E_FALSE E_TRUE
%token <ET_BREAK> E_BREAK
%token <ET_CHARACTER_CONSTANT> E_CHARACTER
%token <ET_CURRENT> E_CURRENT
%token <ET_FREE_OPERATOR> E_FREEOP
%token <ET_IDENTIFIER> E_IDENTIFIER E_BITTYPE
%token <ET_INTEGER_CONSTANT> E_INTEGER
%token <ET_KEYWORD_OPERATOR> E_AND E_OR E_XOR E_NOT E_IMPLIES
%token <ET_MANIFEST_STRING> E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV
%token <ET_MANIFEST_STRING> E_STRMOD E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE
%token <ET_MANIFEST_STRING> E_STRAND E_STROR E_STRXOR E_STRANDTHEN E_STRORELSE
%token <ET_MANIFEST_STRING> E_STRIMPLIES E_STRFREEOP E_STRNOT E_STRING
%token <ET_REAL_CONSTANT> E_REAL
%token <ET_RESULT> E_RESULT
%token <ET_RETRY_INSTRUCTION> E_RETRY
%token <ET_SYMBOL_OPERATOR> E_DIV '/' E_GE '>' E_LE '<' E_MOD '^' '*'

%token E_CHARERR E_STRERR E_INTERR

%token <ET_KEYWORD> E_OLD
%token <ET_SYMBOL> '{' '}'
%token <ET_SYMBOL> '(' ')' ':' ',' '[' ']' '$' '.' '!' '~'
%token <ET_SYMBOL_OPERATOR> '-'
%token <ET_SYMBOL_OPERATOR> '+'
%token <ET_SYMBOL> '='
%token <ET_SYMBOL> E_NE
%token <ET_SEMICOLON_SYMBOL> ';'
%token <ET_QUESTION_MARK_SYMBOL> '?'

%left E_IMPLIES
%left E_OR E_XOR
%left E_AND
%left '=' E_NE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP
%right E_NOT E_OLD

%type <ET_ACTUAL_ARGUMENT_LIST> Actuals_opt Actuals_expression_list
%type <ET_ACTUAL_PARAMETER_LIST> Actual_parameters_opt Type_list Actual_parameters
%type <ET_ACTUAL_PARAMETER_LIST> Constraint_actual_parameters_opt Constraint_type_list
%type <ET_AGENT_ACTUAL_ARGUMENT> Agent_actual
%type <ET_AGENT_ACTUAL_ARGUMENT_ITEM> Agent_actual_comma
%type <ET_AGENT_ACTUAL_ARGUMENT_LIST> Agent_actuals_opt Agent_actual_list
%type <ET_AGENT_TARGET> Agent_target
%type <ET_AST_LEAF> Agent_keyword
%type <ET_BOOLEAN_CONSTANT> Boolean_constant
%type <ET_BREAK> Break_opt
%type <ET_CALL_AGENT> Call_agent
%type <ET_CALL_EXPRESSION> Call_expression
%type <ET_CHARACTER_CONSTANT> Character_constant
%type <ET_CHOICE> Choice
%type <ET_CHOICE_CONSTANT> Choice_constant
%type <ET_CHOICE_ITEM> Choice_comma
%type <ET_CHOICE_LIST> Choices Choice_list
%type <ET_CLASS> Class_header Class_to_end Class_declaration
%type <ET_CLASS_NAME_ITEM> Client Client_comma
%type <ET_CLIENTS> Clients Client_list
%type <ET_COMPOUND> Compound Rescue_opt Do_compound Once_compound Then_compound
%type <ET_COMPOUND> Else_compound Rescue_compound From_compound Loop_compound
%type <ET_CONSTANT> Manifest_constant
%type <ET_CONSTRAINT_CREATOR> Constraint_create Constraint_create_procedure_list
%type <ET_CREATOR> Creation_clause Creation_procedure_list
%type <ET_CREATOR_LIST> Creators Creators_opt
%type <ET_DEBUG_INSTRUCTION> Debug_instruction
%type <ET_ELSEIF_PART> Elseif_part
%type <ET_ELSEIF_PART_LIST> Elseif_list Elseif_part_list
%type <ET_EXPORT> New_export_item
%type <ET_EXPORT_LIST> New_exports New_exports_opt New_export_list
%type <ET_EXPRESSION> Expression Call_chain Precursor_expression
%type <ET_EXPRESSION> Address_mark Create_expression
%type <ET_EXPRESSION_ITEM> Expression_comma
%type <ET_EXTERNAL_ALIAS> External_name_opt
%type <ET_FEATURE> Feature_declaration Single_feature_declaration
%type <ET_FEATURE_CLAUSE> Feature_clause Feature_clause_header
%type <ET_FEATURE_CLAUSE_LIST> Features Features_opt Feature_clause_list
%type <ET_FEATURE_EXPORT> Export_feature_name_list
%type <ET_FEATURE_NAME> Feature_name
%type <ET_FEATURE_NAME_ITEM> Feature_name_comma Creation_procedure_comma
%type <ET_FORMAL_ARGUMENT> Formal_argument_name Formal_argument_name_comma
%type <ET_FORMAL_ARGUMENT_ITEM> Formal_argument Formal_argument_semicolon
%type <ET_FORMAL_ARGUMENT_LIST> Formal_arguments Formal_argument_list
%type <ET_FORMAL_PARAMETER> Formal_parameter
%type <ET_FORMAL_PARAMETER_ITEM> Formal_parameter_comma
%type <ET_FORMAL_PARAMETER_LIST> Formal_parameters_opt Formal_parameter_list
%type <ET_IDENTIFIER> Identifier Class_name
%type <ET_IF_INSTRUCTION> Conditional
%type <ET_INDEXING_LIST> Indexing_clause Indexing_clause_opt Index_list
%type <ET_INDEXING_ITEM> Index_clause Index_clause_semicolon Index_clause_impl
%type <ET_INDEXING_TERM> Index_value
%type <ET_INDEXING_TERM_ITEM> Index_value_comma
%type <ET_INDEXING_TERM_LIST> Index_terms
%type <ET_INSPECT_INSTRUCTION> Multi_branch
%type <ET_INSTRUCTION> Instruction Creation_instruction Call_instruction Create_instruction
%type <ET_INTEGER_CONSTANT> Integer_constant
%type <ET_INVARIANTS> Invariant_clause Invariant_clause_opt
%type <ET_KEYWORD_FEATURE_NAME_LIST> Keyword_feature_name_list Select_clause Select_clause_opt
%type <ET_KEYWORD_FEATURE_NAME_LIST> Undefine_clause Undefine_clause_opt Redefine_clause Redefine_clause_opt
%type <ET_LOCAL_VARIABLE> Local_name Local_name_comma
%type <ET_LOCAL_VARIABLE_ITEM> Local_variable Local_variable_semicolon
%type <ET_LOCAL_VARIABLE_LIST> Local_declarations_opt Local_variable_list
%type <ET_MANIFEST_ARRAY> Manifest_array Manifest_array_expression_list
%type <ET_MANIFEST_STRING> Manifest_string
%type <ET_MANIFEST_STRING_ITEM> Manifest_string_comma
%type <ET_MANIFEST_STRING_LIST> Manifest_string_list Parenthesized_manifest_string_list
%type <ET_MANIFEST_TUPLE> Manifest_tuple Manifest_tuple_expression_list
%type <ET_OBSOLETE> Obsolete_opt
%type <ET_PARENTHESIZED_EXPRESSION> Parenthesized_expression
%type <ET_PARENT> Parent Parent_end
%type <ET_PARENT_ITEM> Parent_semicolon
%type <ET_PARENT_LIST> Inheritance_opt Inheritance_end Parent_list Parent_list_end
%type <ET_POSTCONDITIONS> Postcondition_opt
%type <ET_PRECURSOR_EXPRESSION> Qualified_precursor_expression
%type <ET_PRECURSOR_INSTRUCTION> Qualified_precursor_instruction
%type <ET_PRECONDITIONS> Precondition_opt
%type <ET_REAL_CONSTANT> Real_constant
%type <ET_RENAME_ITEM> Rename Rename_comma
%type <ET_RENAME_LIST> Rename_clause Rename_list
%type <ET_SEMICOLON_SYMBOL> Semicolon_opt
%type <ET_STATIC_CALL_EXPRESSION> Static_call_expression
%type <ET_STRIP_EXPRESSION> Strip_expression Strip_feature_name_list
%type <ET_TYPE> Type Constraint_type
%type <ET_TYPE_ITEM> Type_comma Constraint_type_comma
%type <ET_VARIANT> Variant_clause_opt
%type <ET_WHEN_PART> When_part
%type <ET_WHEN_PART_LIST> When_list When_list_opt
%type <ET_WRITABLE> Writable

%expect 38
%start Class_declarations

%%
------------------------------------------------------------------------------------

Class_declarations: Break_opt Class_declaration
		{ $2.set_leading_break ($1) }
	;

Class_declaration: Indexing_clause_opt Class_to_end
		{
			$$ := $2
			$$.set_first_indexing ($1)
		}
	;

Class_declaration_opt: -- Empty
	| Class_declaration
	;

Class_to_end: Class_header Formal_parameters_opt Obsolete_opt Inheritance_opt Creators_opt
	Features_opt Invariant_clause_opt Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, $5, $6, $7, $8, $9)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end Creators
	Features_opt Invariant_clause_opt Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, $5, $6, $7, $8, $9)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end
	Features Invariant_clause_opt Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, Void, $5, $6, $7, $8)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end
	Invariant_clause Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, Void, Void, $5, $6, $7)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end Indexing_clause_opt Class_to_end
		{
			$$ := $1
			set_class_to_inheritance_end ($$, $3, $4)
			$6.set_first_indexing ($5)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			set_class_to_end ($$, $3, $4, Void, Void, Void, $5, $6)
		}
	| Class_header Formal_parameters_opt Obsolete_opt Inheritance_end
		{
			$$ := $1
			set_class_to_inheritance_end ($$, $3, $4)
		}
	;

		-- Note: The constructs above are a workaround to solve
		-- the following grammar ambiguity:
		--		class FOO inherit BAR end
		-- where, through shift/reduce conflicts, has
		-- been parsed with 'end' being recognized as the
		-- end of the feature adaptation of BAR instead of
		-- as the end of the class FOO.

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
	;

Indexing_clause_opt: -- Empty
		-- { $$ := Void }
	| Indexing_clause
		{ $$ := $1 }
	;

Index_list: Index_clause
		{
			if $1 /= Void then
				$$ := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_indexings (last_keyword, counter_value)
			end
		}
	| Index_clause_semicolon
		-- TODO: Syntax error
		{
			if $1 /= Void then
				$$ := ast_factory.new_indexings (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Index_clause_semicolon
		{ increment_counter }
	  Index_list
		{
			$$ := $3
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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

		-- Note: Eiffel says that the Index_terms list 
		-- should not be empty, but VE allows that!
--	| Identifier ':'
	;

Index_clause_semicolon: Index_clause ';'
		{ $$ := ast_factory.new_indexing_semicolon ($1, $2) }
	| Index_clause_semicolon ';'
		-- TODO: Syntax error
		{ $$ := ast_factory.new_indexing_semicolon ($1, $2) }
	;

Index_terms: Index_value
		{
			if $1 /= Void then
				$$ := ast_factory.new_indexing_terms (counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_indexing_terms (counter_value)
			end
		}
	| Index_value_comma Index_terms
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| E_BIT
		{ $$ := $1 }
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

Class_header: E_CLASS Identifier
		{
			$$ := new_class ($2)
			$$.set_class_keyword ($1)
			last_class := $$
		}
	| E_DEFERRED E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			last_class := $$
		}
	| E_EXPANDED E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			last_class := $$
		}
	| E_SEPARATE E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			last_class := $$
		}
	;

------------------------------------------------------------------------------------

Formal_parameters_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning!
		{
			$$ := ast_factory.new_formal_parameters ($1, $2, 0)
			set_formal_generic_parameters ($$)
		}
	| '['
		{
			add_symbol ($1)
			add_counter
		}
	  Formal_parameter_list
		{
			$$ := $3
			set_formal_generic_parameters ($$)
			remove_symbol
			remove_counter
		}
	;

Formal_parameter_list: Formal_parameter ']'
		{
			if $1 /= Void then
				$$ := ast_factory.new_formal_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_formal_parameters (last_symbol, $2, counter_value)
			end
		}
	| Formal_parameter_comma Formal_parameter_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
		{ $$ := ast_factory.new_formal_parameter ($1) }
	| Identifier E_ARROW Constraint_type
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, Void) }
	| Identifier E_ARROW Constraint_type Constraint_create
		{ $$ := ast_factory.new_constrained_formal_parameter ($1, $2, $3, $4) }
	;

Constraint_create: E_CREATE E_END
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
			if $1 /= Void then
				$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value)
			end
		}
	| Creation_procedure_comma E_END
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_constraint_creator (last_keyword, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Creation_procedure_comma Constraint_create_procedure_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Constraint_type: Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_REFERENCE Class_name Constraint_actual_parameters_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2) }
	| E_LIKE Identifier
		{ $$ := ast_factory.new_like_identifier ($1, $2) }
	| E_BITTYPE Integer_constant
		{ $$ := ast_factory.new_bit_type ($1, $2) }
	| E_BITTYPE Identifier
		{ $$ := ast_factory.new_bit_identifier ($1, $2)  }
	;

Constraint_actual_parameters_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning:
		{ $$ := ast_factory.new_actual_parameters ($1, $2, 0) }
	| '['
		{
			add_symbol ($1)
			add_counter
		}
	  Constraint_type_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Constraint_type_list: Constraint_type ']'
		{
			if $1 /= Void then
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value)
			end
		}
	| Constraint_type_comma Constraint_type_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Constraint_type_comma: Constraint_type ','
		{
			$$ := ast_factory.new_type_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Obsolete_opt: -- Empty
		-- { $$ := Void }
	| E_OBSOLETE Manifest_string
		{ $$ := ast_factory.new_obsolete_message ($1, $2) }
	;

------------------------------------------------------------------------------------

Inheritance_opt: -- Empty
		-- { $$ := Void }
	| E_INHERIT
		{ $$ := ast_factory.new_parents ($1, 0) }
	| Inherit Parent_list
		{
			$$ := $2
			remove_counter
		}
	;

Inheritance_end: Inherit Parent_list_end
		{
			$$ := $2
			remove_keyword
			remove_counter
		}
	;

Inherit: E_INHERIT
		{
			add_keyword ($1)
			add_counter
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

Parent_end:  Class_name Actual_parameters_opt E_END
		{
			$$ := new_parent ($1, $2, Void, Void, Void, Void, Void, $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Parent_list: Parent
		{
			$$ := ast_factory.new_parents (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent_semicolon
		{
			$$ := ast_factory.new_parents (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent Parent_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent_end Parent_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent_semicolon Parent_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Parent_list_end: Parent_end
		{
			$$ := ast_factory.new_parents (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent Parent_list_end
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent_end Parent_list_end
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Parent_semicolon Parent_list_end
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| Parent_end ';'
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Rename_comma
		-- TODO: syntax error
		{
			$$ := ast_factory.new_renames (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Rename_comma Rename_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Rename: Feature_name E_AS Feature_name
		{
			$$ := ast_factory.new_rename ($1, $2, $3)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Rename_comma: Feature_name E_AS Feature_name ','
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
			if $1 /= Void then
				$$ := ast_factory.new_exports (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

New_export_item: Clients E_ALL
		{
			$$ := ast_factory.new_all_export ($1, $2)
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
			if $1 /= Void then
				$$ := ast_factory.new_feature_export (last_export_clients, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_feature_export (last_export_clients, counter_value)
			end
		}
	| Feature_name_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_feature_export (last_export_clients, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Feature_name_comma Export_feature_name_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Client_comma '}'
		-- Syntax error
		{
			$$ := ast_factory.new_clients (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Client_comma Client_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Client Client_list
		-- Syntax error
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Client: Identifier
		{
			$$ := $1
			if $$ /= Void then
				increment_counter
			end
		}
	;

Client_comma: Identifier ','
		{
			$$ := ast_factory.new_class_name_comma ($1, $2)
			if $$ /= Void then
				increment_counter
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
			if $1 /= Void then
				$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			end
		}
	| Feature_name_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_keyword_feature_name_list (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Feature_name_comma Keyword_feature_name_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| Add_counter Creators
		{
			$$ := $2
			remove_counter
		}
	;

Creators: Creation_clause
		{
			if $1 /= Void then
				$$ := ast_factory.new_creators (counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
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
	  Creators
		{
			$$ := $3
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Creation_clause: E_CREATION Clients
		{ $$ := ast_factory.new_creator ($1, $2, 0) }
	| E_CREATION
		{ $$ := ast_factory.new_creator ($1, ast_factory.new_any_clients ($1), 0) }
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
			last_clients := ast_factory.new_any_clients (last_keyword)
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
		{ $$ := ast_factory.new_creator ($1, ast_factory.new_any_clients ($1), 0) }
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
			last_clients := ast_factory.new_any_clients (last_keyword)
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
			if $1 /= Void then
				$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			end
		}
	| Creation_procedure_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_creator (last_keyword, last_clients, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Creation_procedure_comma Creation_procedure_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Creation_procedure_comma: Identifier ','
		{
			$$ := ast_factory.new_feature_name_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
		{
			-- $$ := Void
			set_named_features
		}
	| Features
		{ $$ := $1 }
	;

Features: Add_counter Feature_clause_list
		{
			$$ := $2
			set_named_features
			remove_counter
		}
	;

Feature_clause_list: Feature_clause
		{
			$$ := ast_factory.new_feature_clauses (counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Feature_clause Feature_clause_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
			last_clients := ast_factory.new_any_clients ($1)
			last_feature_clause := ast_factory.new_feature_clause ($1, last_clients)
		}
	;

Feature_declaration_list: Feature_declaration
	| Feature_declaration_list Feature_declaration
	;

--------------------------------------------------------------------------------

Feature_declaration: Single_feature_declaration
		{
			$$ := $1
			register_feature ($$)
		}
	| E_FROZEN Single_feature_declaration
		{
			$$ := $2
			$$.set_frozen_keyword ($1)
			register_feature ($$)
		}
	| Feature_name ',' Feature_declaration
		{
			$$ := new_synonym_feature (ast_factory.new_feature_name_comma ($1, $2), $3)
			register_synonym ($$)
		}
	| Feature_name Feature_declaration
			-- TODO: Syntax error
		{
			$$ := new_synonym_feature ($1, $2)
			register_synonym ($$)
		}
	| E_FROZEN Feature_name ',' Feature_declaration
		{
			$$ := new_synonym_feature (ast_factory.new_feature_name_comma ($2, $3), $4)
			$$.set_frozen_keyword ($1)
			register_synonym ($$)
		}
	| E_FROZEN Feature_name Feature_declaration
			-- TODO: Syntax error
		{
			$$ := new_synonym_feature ($2, $3)
			$$.set_frozen_keyword ($1)
			register_synonym ($$)
		}
	;

Single_feature_declaration: Feature_name ':' Type Semicolon_opt
		{ $$ := ast_factory.new_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS Manifest_constant Semicolon_opt
		{ $$ := ast_factory.new_constant_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS E_UNIQUE Semicolon_opt
		{ $$ := ast_factory.new_unique_attribute ($1, ast_factory.new_colon_type ($2, $3), $4, $5, $6, last_clients, last_feature_clause, last_class) }
	| Feature_name E_IS Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_procedure ($1, Void, $2, $3, $4, $5, $6, $7, $8, $9, $10, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Feature_name E_IS Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_procedure ($1, Void, $2, $3, $4, $5, $6, $7, $8, $9, $10, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Feature_name E_IS Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_procedure ($1, Void, $2, $3, $4, $5, $6, $7, $8, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, last_clients, last_feature_clause, last_class) }
	| Feature_name E_IS Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_external_procedure ($1, Void, $2, $3, $4, ast_factory.new_external_language ($5, $6), $7, $8, $9, $10, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_external_procedure ($1, $2, $3, $4, $5, ast_factory.new_external_language ($6, $7), $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_do_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12, $13, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_once_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12, $13, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, $7, $8, $9, $10, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments ':' Type E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_deferred_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, last_clients, last_feature_clause, last_class) }
	| Feature_name ':' Type E_IS Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_external_function ($1, Void, ast_factory.new_colon_type ($2, $3), $4, $5, $6, ast_factory.new_external_language ($7, $8), $9, $10, $11, $12, last_clients, last_feature_clause, last_class) }
	| Feature_name Formal_arguments ':' Type E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END Semicolon_opt
		{ $$ := ast_factory.new_external_function ($1, $2, ast_factory.new_colon_type ($3, $4), $5, $6, $7, ast_factory.new_external_language ($8, $9), $10, $11, $12, $13, last_clients, last_feature_clause, last_class) }
	;

Semicolon_opt: -- Empty
		-- { $$ := Void }
	| ';'
		{ $$ := $1 }
	;

External_name_opt: -- Empty
		-- { $$ := Void }
	| E_ALIAS Manifest_string
		{ $$ := ast_factory.new_external_alias ($1, $2) }
	;

------------------------------------------------------------------------------------

Feature_name: Identifier
		{ $$ := $1 }
	| E_PREFIX E_STRNOT
		{ $$ := ast_factory.new_prefix_not_name ($1, $2) }
	| E_PREFIX E_STRPLUS
		{ $$ := ast_factory.new_prefix_plus_name ($1, $2) }
	| E_PREFIX E_STRMINUS
		{ $$ := ast_factory.new_prefix_minus_name ($1, $2) }
	| E_PREFIX E_STRFREEOP
		{ $$ := ast_factory.new_prefix_free_name ($1, $2) }
	| E_INFIX E_STRPLUS
		{ $$ := ast_factory.new_infix_plus_name ($1, $2) }
	| E_INFIX E_STRMINUS
		{ $$ := ast_factory.new_infix_minus_name ($1, $2) }
	| E_INFIX E_STRSTAR
		{ $$ := ast_factory.new_infix_times_name ($1, $2) }
	| E_INFIX E_STRSLASH
		{ $$ := ast_factory.new_infix_divide_name ($1, $2) }
	| E_INFIX E_STRDIV
		{ $$ := ast_factory.new_infix_div_name ($1, $2) }
	| E_INFIX E_STRMOD
		{ $$ := ast_factory.new_infix_mod_name ($1, $2) }
	| E_INFIX E_STRPOWER
		{ $$ := ast_factory.new_infix_power_name ($1, $2) }
	| E_INFIX E_STRLT
		{ $$ := ast_factory.new_infix_lt_name ($1, $2) }
	| E_INFIX E_STRLE
		{ $$ := ast_factory.new_infix_le_name ($1, $2) }
	| E_INFIX E_STRGT
		{ $$ := ast_factory.new_infix_gt_name ($1, $2) }
	| E_INFIX E_STRGE
		{ $$ := ast_factory.new_infix_ge_name ($1, $2) }
	| E_INFIX E_STRAND
		{ $$ := ast_factory.new_infix_and_name ($1, $2) }
	| E_INFIX E_STRANDTHEN
		{ $$ := ast_factory.new_infix_and_then_name ($1, $2) }
	| E_INFIX E_STROR
		{ $$ := ast_factory.new_infix_or_name ($1, $2) }
	| E_INFIX E_STRORELSE
		{ $$ := ast_factory.new_infix_or_else_name ($1, $2) }
	| E_INFIX E_STRIMPLIES
		{ $$ := ast_factory.new_infix_implies_name ($1, $2) }
	| E_INFIX E_STRXOR
		{ $$ := ast_factory.new_infix_xor_name ($1, $2) }
	| E_INFIX E_STRFREEOP
		{ $$ := ast_factory.new_infix_free_name ($1, $2) }

	| E_PREFIX E_STRING
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRSTAR
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRSLASH
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRDIV
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRMOD
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRPOWER
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRLT
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRLE
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRGT
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRGE
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRAND
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STROR
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRXOR
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRANDTHEN
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRORELSE
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_PREFIX E_STRIMPLIES
		{ $$ := new_invalid_prefix_name ($1, $2) }
	| E_INFIX E_STRING
		{ $$ := new_invalid_infix_name ($1, $2) }
	| E_INFIX E_STRNOT
		{ $$ := new_invalid_infix_name ($1, $2) }
	;

------------------------------------------------------------------------------------

Formal_arguments: '(' ')'
		{ $$ := ast_factory.new_formal_arguments ($1, $2, 0) }
	| '('
		{
			add_symbol ($1)
			add_counter
		}
	  Formal_argument_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Formal_argument_list: Formal_argument ')'
		{
			$$ := ast_factory.new_formal_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Formal_argument_semicolon ')'
		{
			$$ := ast_factory.new_formal_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Formal_argument_name_comma Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				if not $$.is_empty then
					$1.set_declared_type ($$.first.type)
					$$.put_first ($1)
				end
			end
		}
	| Formal_argument_name Formal_argument_list
		{
			-- TODO: Syntax error
			$$ := $2
			if $$ /= Void and $1 /= Void then
				if not $$.is_empty then
					$1.set_declared_type ($$.first.type)
					$$.put_first ($1)
				end
			end
		}
	| Formal_argument_semicolon Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Formal_argument Formal_argument_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
		-- { $$ := Void }
	| E_LOCAL
		{ $$ := ast_factory.new_local_variables ($1, 0) }
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
			$$ := ast_factory.new_local_variables (last_keyword, counter_value)
			if $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Local_variable_semicolon
		{
			$$ := ast_factory.new_local_variables (last_keyword, counter_value)
			if $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Local_name_comma Local_variable_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				if not $$.is_empty then
					$1.set_declared_type ($$.first.type)
					$$.put_first ($1)
				end
			end
		}
	| Local_name Local_variable_list
		{
			-- TODO: Syntax error
			$$ := $2
			if $$ /= Void and $1 /= Void then
				if not $$.is_empty then
					$1.set_declared_type ($$.first.type)
					$$.put_first ($1)
				end
			end
		}
	| Local_variable_semicolon Local_variable_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Local_variable Local_variable_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| Assertions Expression
		{ add_expression_assertion ($2, Void) }
	| Assertions Expression ';'
		{ add_expression_assertion ($2, $3) }
	| Assertions Identifier ':'
		{ add_tagged_assertion ($2, $3, Void) }
	| Assertions Identifier ':' ';'
		{ add_tagged_assertion ($2, $3, $4) }
	;

Precondition_opt: -- Empty
		-- { $$ := Void }
	| E_REQUIRE
		{ $$ := new_preconditions ($1, Void) }
	| E_REQUIRE E_ELSE
		{ $$ := new_preconditions ($1, $2) }
	| E_REQUIRE Assertions
		{ $$ := new_preconditions ($1, Void) }
	| E_REQUIRE E_ELSE Assertions
		{ $$ := new_preconditions ($1, $2) }
	;

Postcondition_opt: -- Empty
		-- { $$ := Void }
	| E_ENSURE
		{ $$ := new_postconditions ($1, Void) }
	| E_ENSURE E_THEN
		{ $$ := new_postconditions ($1, $2) }
	| E_ENSURE Assertions
		{ $$ := new_postconditions ($1, Void) }
	| E_ENSURE E_THEN Assertions
		{ $$ := new_postconditions ($1, $2) }
	;

Invariant_clause_opt: -- Empty
		-- { $$ := Void }
	| Invariant_clause
		{ $$ := $1 }
	;

Invariant_clause: E_INVARIANT
		{ $$ := new_invariants ($1) }
	| E_INVARIANT Assertions
		{ $$ := new_invariants ($1) }
	;

Variant_clause_opt: -- Empty
		-- { $$ := Void }
	| E_VARIANT -- Not standard.
		{ $$ := ast_factory.new_variant ($1, Void, Void) }
	| E_VARIANT Expression
		{ $$ := ast_factory.new_variant ($1, Void, $2) }
	| E_VARIANT Identifier ':' Expression
		{ $$ := ast_factory.new_variant ($1, ast_factory.new_tag ($2, $3), $4) }
	;

------------------------------------------------------------------------------------

Rescue_opt: -- Empty
		-- { $$ := Void }
	| Rescue_compound
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Type: Class_name Actual_parameters_opt
		{ $$ := new_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_REFERENCE Class_name Actual_parameters_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_LIKE E_CURRENT
		{ $$ := ast_factory.new_like_current ($1, $2) }
	| E_LIKE Identifier
		{ $$ := ast_factory.new_like_identifier ($1, $2) }
	| E_BITTYPE Integer_constant
		{ $$ := ast_factory.new_bit_type ($1, $2) }
	| E_BITTYPE Identifier
		{ $$ := ast_factory.new_bit_identifier ($1, $2)  }
	;

Class_name: E_IDENTIFIER
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
	| '['
		{
			add_symbol ($1)
			add_counter
		}
	  Type_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Type_list: Type ']'
		{
			if $1 /= Void then
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_actual_parameters (last_symbol, $2, counter_value)
			end
		}
	| Type_comma Type_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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

------------------------------------------------------------------------------------

Do_compound: E_DO
		{ $$ := ast_factory.new_do_compound ($1, ast_factory.new_compound (0)) }
	| E_DO Add_counter Compound
		{
			$$ := ast_factory.new_do_compound ($1, $3)
			remove_counter
		}
	;

Once_compound: E_ONCE
		{ $$ := ast_factory.new_once_compound ($1, ast_factory.new_compound (0)) }
	| E_ONCE Add_counter Compound
		{
			$$ := ast_factory.new_once_compound ($1, $3)
			remove_counter
		}
	;

Then_compound: E_THEN
		{ $$ := ast_factory.new_then_compound ($1, ast_factory.new_compound (0)) }
	| E_THEN Add_counter Compound
		{
			$$ := ast_factory.new_then_compound ($1, $3)
			remove_counter
		}
	;

Else_compound: E_ELSE
		{ $$ := ast_factory.new_else_compound ($1, ast_factory.new_compound (0)) }
	| E_ELSE Add_counter Compound
		{
			$$ := ast_factory.new_else_compound ($1, $3)
			remove_counter
		}
	;

Rescue_compound: E_RESCUE
		{ $$ := ast_factory.new_rescue_compound ($1, ast_factory.new_compound (0)) }
	| E_RESCUE Add_counter Compound
		{
			$$ := ast_factory.new_rescue_compound ($1, $3)
			remove_counter
		}
	;

From_compound: E_FROM
		{ $$ := ast_factory.new_from_compound ($1, ast_factory.new_compound (0)) }
	| E_FROM Add_counter Compound
		{
			$$ := ast_factory.new_from_compound ($1, $3)
			remove_counter
		}
	;

Loop_compound: E_LOOP
		{ $$ := ast_factory.new_loop_compound ($1, ast_factory.new_compound (0)) }
	| E_LOOP Add_counter Compound
		{
			$$ := ast_factory.new_loop_compound ($1, $3)
			remove_counter
		}
	;

Compound: Instruction
		{
			if $1 /= Void then
				$$ := ast_factory.new_compound (counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
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
	  Compound
		{
			$$ := $3
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Instruction: Creation_instruction
		{ $$ := $1 }
	| Create_instruction
		{ $$ := $1 }
	| Call_instruction
		{ $$ := $1 }
	| Writable E_ASSIGN Expression
		{ $$ := ast_factory.new_assignment ($1, $2, $3) }
 	| Writable E_REVERSE Expression
		{ $$ := ast_factory.new_assignment_attempt ($1, $2, $3) }
	| Conditional
		{ $$ := $1 }
	| Multi_branch
		{ $$ := $1 }
	| From_compound Invariant_clause_opt Variant_clause_opt E_UNTIL Expression Loop_compound E_END
		{ $$ := ast_factory.new_loop_instruction ($1, $2, $3, ast_factory.new_conditional ($4, $5), $6, $7) }
	| Debug_instruction
		{ $$ := $1 }
	| E_CHECK E_END
		{ $$ := new_check_instruction ($1, $2) }
	| E_CHECK Assertions E_END
		{ $$ := new_check_instruction ($1, $3) }
	| E_RETRY
		{ $$ := $1 }
	| ';'
		{ $$ := ast_factory.new_null_instruction ($1) }
	;

------------------------------------------------------------------------------------

Creation_instruction: '!' Type '!' Writable
		{ $$ := ast_factory.new_bang_instruction ($1, $2, $3, $4, Void) }
	| '!' Type '!' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_bang_instruction ($1, $2, $3, $4, ast_factory.new_qualified_call (ast_factory.new_dot_feature_name ($5, $6), $7)) }
	| '!' '!' Writable
		{ $$ := ast_factory.new_bang_instruction ($1, Void, $2, $3, Void) }
	| '!' '!' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_bang_instruction ($1, Void, $2, $3, ast_factory.new_qualified_call (ast_factory.new_dot_feature_name ($4, $5), $6)) }
	;

Create_instruction: E_CREATE '{' Type '}' Writable
		{ $$ := ast_factory.new_create_instruction ($1, ast_factory.new_creation_type ($2, $3, $4), $5, Void) }
	| E_CREATE '{' Type '}' Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_instruction ($1, ast_factory.new_creation_type ($2, $3, $4), $5, ast_factory.new_qualified_call (ast_factory.new_dot_feature_name ($6, $7), $8)) }
	| E_CREATE Writable
		{ $$ := ast_factory.new_create_instruction ($1, Void, $2, Void) }
	| E_CREATE Writable '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_instruction ($1, Void, $2, ast_factory.new_qualified_call (ast_factory.new_dot_feature_name ($3, $4), $5)) }
	;

Create_expression: E_CREATE '{' Type '}' 
		{ $$ := ast_factory.new_create_expression ($1, ast_factory.new_creation_type ($2, $3, $4), Void) }
	| E_CREATE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_create_expression ($1, ast_factory.new_creation_type ($2, $3, $4), ast_factory.new_qualified_call (ast_factory.new_dot_feature_name ($5, $6), $7)) }
	;

------------------------------------------------------------------------------------

Conditional: E_IF Expression Then_compound E_END
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Elseif_part Elseif_part_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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

Multi_branch: E_INSPECT Expression When_list_opt Else_compound E_END
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
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| When_part When_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
			if $1 /= Void then
				$$ := ast_factory.new_choice_list (last_keyword, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_choice_list (last_keyword, counter_value)
			end
		}
	| Choice_comma
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_choice_list (last_keyword, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Choice_comma Choice_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| Call_expression
		-- For Visual Eiffel and TowerEiffel (not standard Eiffel,
		-- should be 'Identifier' instead of 'Call_expression'):
		{ $$ := $1 }
	| Static_call_expression
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Debug_instruction: E_DEBUG Parenthesized_manifest_string_list E_END
		{ $$ := ast_factory.new_debug_instruction ($2, ast_factory.new_debug_compound ($1, ast_factory.new_compound (0)), $3) }
	| E_DEBUG Parenthesized_manifest_string_list Add_counter Compound E_END
		{
			$$ := ast_factory.new_debug_instruction ($2, ast_factory.new_debug_compound ($1, $4), $5)
			remove_counter
		}
	;

Parenthesized_manifest_string_list: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := ast_factory.new_manifest_string_list ($1, $2, 0) }
	| '('
		{
			add_symbol ($1)
			add_counter
		}
	  Manifest_string_list
		{
			$$ := $3
			remove_symbol
			remove_counter
		}
	;

Manifest_string_list: Manifest_string ')'
		{
			if $1 /= Void then
				$$ := ast_factory.new_manifest_string_list (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_manifest_string_list (last_symbol, $2, counter_value)
			end
		}
	| Manifest_string_comma Manifest_string_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Manifest_string_comma: Manifest_string ','
		{
			$$ := ast_factory.new_manifest_string_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

------------------------------------------------------------------------------------

Call_instruction: Identifier Actuals_opt
		{ $$ := ast_factory.new_call_instruction (Void, $1, $2) }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_call_instruction ($1, ast_factory.new_dot_feature_name ($2, $3), $4) }
	| E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_instruction (False, $1, Void, $2) }
	| Qualified_precursor_instruction
		{ $$ := $1 }
	| E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_instruction ($1, ast_factory.new_static_type ($2, $3, $4), ast_factory.new_dot_feature_name ($5, $6), $7) }
	;

Qualified_precursor_instruction: E_PRECURSOR '{' Class_name '}' Actuals_opt
		{ $$ := ast_factory.new_precursor_instruction (False, $1, ast_factory.new_precursor_class_name ($2, $3, $4), $5) }
	| '{' Class_name '}' E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_instruction (True, $4, ast_factory.new_precursor_class_name ($1, $2, $3), $5) }
	;

Call_expression: Identifier Actuals_opt
		{ $$ := ast_factory.new_call_expression (Void, $1, $2) }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_call_expression ($1, ast_factory.new_dot_feature_name ($2, $3), $4) }
	;

Static_call_expression: E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_static_call_expression ($1, ast_factory.new_static_type ($2, $3, $4), ast_factory.new_dot_feature_name ($5, $6), $7) }
	;

Precursor_expression: E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_expression (False, $1, Void, $2) }
	| Qualified_precursor_expression
		{ $$ := $1 }
	;

Qualified_precursor_expression: E_PRECURSOR '{' Class_name '}' Actuals_opt
		{ $$ := ast_factory.new_precursor_expression (False, $1, ast_factory.new_precursor_class_name ($2, $3, $4), $5) }
	| '{' Class_name '}' E_PRECURSOR Actuals_opt
		{ $$ := ast_factory.new_precursor_expression (True, $4, ast_factory.new_precursor_class_name ($1, $2, $3), $5) }
	;

Call_chain: Identifier Actuals_opt
		{ $$ := ast_factory.new_call_expression (Void, $1, $2) }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := ast_factory.new_call_expression ($1, ast_factory.new_dot_feature_name ($2, $3), $4) }
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
			if $1 /= Void then
				$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_actual_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Expression_comma Actuals_expression_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Expression
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Actuals_expression_list
		-- TODO: syntax error.
		{
			$$ := $3
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
		{ $$ := ast_factory.new_feature_address ($1, $2) }
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
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Expression: Call_expression
		{ $$ := $1 }
	| Static_call_expression
		{ $$ := $1 }
	| Call_agent
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Create_expression
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Boolean_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
	| E_INTEGER
		{ $$ := $1 }
	| E_REAL
		{ $$ := $1 }
	| Manifest_string
		{ $$ := $1 }
	| E_ONCE_STRING Manifest_string
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
		{ $$ := ast_factory.new_once_manifest_string ($1, $2) }
	| E_BIT
		{ $$ := $1 }
	| Manifest_array
		{ $$ := $1 }
	| Manifest_tuple
		{ $$ := $1 }
	| '+' Expression %prec E_NOT
		{ $$ := ast_factory.new_prefix_expression (ast_factory.new_prefix_plus_operator ($1), $2) }
	| '-' Expression %prec E_NOT
		{ $$ := ast_factory.new_prefix_expression (ast_factory.new_prefix_minus_operator ($1), $2) }
	| E_NOT Expression
		{ $$ := ast_factory.new_prefix_expression ($1, $2) }
	| E_FREEOP Expression %prec E_NOT
		{ $$ := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator ($1), $2) }
	| Expression E_FREEOP Expression
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_free_operator ($2), $3) }
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
	| Expression '=' Expression
		{ $$ := ast_factory.new_equality_expression ($1, $2, $3) }
	| Expression E_NE Expression
		{ $$ := ast_factory.new_equality_expression ($1, $2, $3) }
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
	| Expression E_OR Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_XOR Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| Expression E_AND E_THEN Expression %prec E_AND
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_and_then_operator ($2, $3), $4) }
	| Expression E_OR E_ELSE Expression %prec E_OR
		{ $$ := ast_factory.new_infix_expression ($1, ast_factory.new_infix_or_else_operator ($2, $3), $4) }
	| Expression E_IMPLIES Expression
		{ $$ := ast_factory.new_infix_expression ($1, $2, $3) }
	| E_OLD Expression
		{ $$ := ast_factory.new_old_expression ($1, $2) }
	| Strip_expression
		{ $$ := $1 }
	| Address_mark
		{ $$ := $1 }
	;

Parenthesized_expression: '(' Expression ')'
		{ $$ := ast_factory.new_parenthesized_expression ($1, $2, $3) }
	;

Manifest_array: E_LARRAY E_RARRAY
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

Manifest_array_expression_list: Expression E_RARRAY
		{
			if $1 /= Void then
				$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma E_RARRAY
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_manifest_array (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Expression_comma Manifest_array_expression_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
			if $1 /= Void then
				$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value)
			end
		}
	| Expression_comma ']'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_manifest_tuple (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Expression_comma Manifest_tuple_expression_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
			if $1 /= Void then
				$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value)
			end
		}
	| Feature_name_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_strip_expression (last_keyword, last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Feature_name_comma Strip_feature_name_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
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
	| E_BIT
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Call_agent: Agent_keyword Feature_name Agent_actuals_opt
		{ $$ := ast_factory.new_call_agent ($1, Void, $2, $3) }
	| Agent_keyword Agent_target '.' Feature_name Agent_actuals_opt
		{ $$ := ast_factory.new_call_agent ($1, $2, ast_factory.new_dot_feature_name ($3, $4), $5) }
	;

Agent_keyword: E_AGENT
		{ $$ := $1 }
	| '~'
		{ $$ := $1 }
	;

Agent_target: Identifier
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| '{' Type '}'
		{ $$ := ast_factory.new_agent_type ($1, $2, $3) }
	;

Agent_actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := ast_factory.new_agent_actual_arguments ($1, $2, 0) }
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
			if $1 /= Void then
				$$ := ast_factory.new_agent_actual_arguments (last_symbol, $2, counter_value + 1)
				if $$ /= Void then
					$$.put_first ($1)
				end
			else
				$$ := ast_factory.new_agent_actual_arguments (last_symbol, $2, counter_value)
			end
		}
	| Agent_actual_comma ')'
		-- TODO: syntax error.
		{
			$$ := ast_factory.new_agent_actual_arguments (last_symbol, $2, counter_value)
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Agent_actual_comma Agent_actual_list
		{
			$$ := $2
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	| Agent_actual
		{
			if $1 /= Void then
				increment_counter
			end
		}
	  Agent_actual_list
		-- TODO: syntax error.
		{
			$$ := $3
			if $$ /= Void and $1 /= Void then
				$$.put_first ($1)
			end
		}
	;

Agent_actual_comma: Agent_actual ','
		{
			$$ := ast_factory.new_agent_actual_argument_comma ($1, $2)
			if $$ /= Void then
				increment_counter
			end
		}
	;

Agent_actual: Expression
		{ $$ := $1 }
	| '?'
		{ $$ := $1 }
	| '{' Class_name '}'
		{ $$ := ast_factory.new_agent_type ($1, new_named_type (Void, $2, Void), $3) }
	| '{' Class_name Actual_parameters '}'
		{ $$ := ast_factory.new_agent_type ($1, new_named_type (Void, $2, $3), $4) }
	| '{' E_EXPANDED Class_name Actual_parameters_opt '}'
		{ $$ := ast_factory.new_agent_type ($1, new_named_type ($2, $3, $4), $5) }
	| '{' E_SEPARATE Class_name Actual_parameters_opt '}'
		{ $$ := ast_factory.new_agent_type ($1, new_named_type ($2, $3, $4), $5) }
	| '{' E_REFERENCE Class_name Actual_parameters_opt '}'
		{ $$ := ast_factory.new_agent_type ($1, new_named_type ($2, $3, $4), $5) }
	| '{' E_LIKE E_CURRENT '}'
		{ $$ := ast_factory.new_agent_type ($1, ast_factory.new_like_current ($2, $3), $4) }
	| '{' E_LIKE Identifier '}'
		{ $$ := ast_factory.new_agent_type ($1, ast_factory.new_like_identifier ($2, $3), $4) }
	| '{' E_BITTYPE Integer_constant '}'
		{ $$ := ast_factory.new_agent_type ($1, ast_factory.new_bit_type ($2, $3), $4) }
	| '{' E_BITTYPE Identifier '}'
		{ $$ := ast_factory.new_agent_type ($1, ast_factory.new_bit_identifier ($2, $3), $4)  }
	;

------------------------------------------------------------------------------------

Manifest_string: E_STRING
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
	| E_STROR
		{ $$ := $1 }
	| E_STRXOR
		{ $$ := $1 }
	| E_STRANDTHEN
		{ $$ := $1 }
	| E_STRORELSE
		{ $$ := $1 }
	| E_STRIMPLIES
		{ $$ := $1 }
	| E_STRFREEOP
		{ $$ := $1 }
	| E_STRNOT
		{ $$ := $1 }
	| E_STRERR
		{ abort }
	;

Character_constant: E_CHARACTER
		{ $$ := $1 }
	| E_CHARERR
		{ abort }
	;

Boolean_constant: E_TRUE
		{ $$ := $1 }
	| E_FALSE
		{ $$ := $1 }
	;

Integer_constant: E_INTEGER
		{ $$ := $1 }
	| '-' E_INTEGER
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| '+' E_INTEGER
		{
			$$ := $2
			$$.set_sign ($1)
		}
	;

Real_constant: E_REAL
		{ $$ := $1 }
	| '-' E_REAL
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| '+' E_REAL
		{
			$$ := $2
			$$.set_sign ($1)
		}
	;

Identifier: E_IDENTIFIER
		{ $$ := $1 }
	| E_BITTYPE
		{
				-- TO DO: reserved word `BIT'
			$$ := $1
		}
	;

Break_opt: -- Empty
		-- { $$ := Void }
	| E_BREAK
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Add_counter: { add_counter }
	;

--------------------------------------------------------------------------------
%%

end
