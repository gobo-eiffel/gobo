%{
indexing

	description:

		"Eiffel parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		end

creation

	make, make_with_factory

%}

%token <ET_POSITION>           E_BANGBANG E_ARROW E_DOTDOT E_LARRAY E_RARRAY
%token <ET_POSITION>           E_ASSIGN E_REVERSE E_ALIAS E_ALL E_AS E_CHECK
%token <ET_POSITION>           E_CLASS E_CREATE E_CREATION E_DEBUG E_DEFERRED
%token <ET_POSITION>           E_DO E_ELSE E_ELSEIF E_END E_ENSURE E_EXPANDED
%token <ET_POSITION>           E_EXPORT E_EXTERNAL E_FEATURE E_FROM E_FROZEN
%token <ET_POSITION>           E_IF E_INDEXING E_INFIX E_INHERIT E_INSPECT
%token <ET_POSITION>           E_INVARIANT E_IS E_LIKE E_LOCAL E_LOOP E_OBSOLETE
%token <ET_POSITION>           E_ONCE E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
%token <ET_POSITION>           E_RESCUE E_RETRY E_SELECT E_SEPARATE E_STRIP
%token <ET_POSITION>           E_THEN E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT
%token <ET_POSITION>           E_WHEN E_CURRENT E_RESULT E_PRECURSOR
%token <ET_POSITION>           E_UNKNOWN

%token <ET_BIT_CONSTANT>       E_BIT
%token <ET_BOOLEAN_CONSTANT>   E_FALSE E_TRUE
%token <ET_CHARACTER_CONSTANT> E_CHARACTER
%token <ET_IDENTIFIER>         E_IDENTIFIER E_BITTYPE
%token <ET_INTEGER_CONSTANT>   E_INTEGER
%token <ET_MANIFEST_STRING>    E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV
%token <ET_MANIFEST_STRING>    E_STRMOD E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE
%token <ET_MANIFEST_STRING>    E_STRAND E_STROR E_STRXOR E_STRANDTHEN E_STRORELSE
%token <ET_MANIFEST_STRING>    E_STRIMPLIES E_STRFREEOP E_STRNOT E_STRING
%token <ET_REAL_CONSTANT>      E_REAL
%token <ET_TOKEN>              E_FREEOP

%token E_CHARERR E_STRERR

%token <ET_POSITION>           E_IMPLIES E_OR E_XOR E_AND '=' E_NE '<' '>'
%token <ET_POSITION>           E_LE E_GE '+' '-' '*' '/' E_DIV E_MOD
%token <ET_POSITION>           '^' E_NOT E_OLD

%left E_IMPLIES
%left E_OR E_XOR
%left E_AND
%left '=' E_NE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP
%right E_NOT E_OLD

%type <ET_ACTUAL_ARGUMENTS>    Actuals_opt Actual_list
%type <ET_ACTUAL_GENERIC_PARAMETERS>  Actual_generics_opt Type_list
                               Constraint_actual_generics_opt Constraint_type_list
%type <ET_ASSERTION>           Assertion_clause
%type <ET_ASSERTIONS>          Assertion_list Invariant_opt
%type <ET_BOOLEAN_CONSTANT>    Boolean_constant
%type <ET_CHARACTER_CONSTANT>  Character_constant
%type <ET_CLIENTS>             Clients Clients_opt Client_list
%type <ET_COMPOUND>            Compound Non_empty_compound Else_part Rescue_opt
%type <ET_EXPRESSION>          Expression Call_expression Qualified_call_chain
                               Address_mark Create_expression
%type <ET_FEATURE>             Feature_declaration Single_feature_declaration
                               Attribute_declaration Constant_declaration Unique_declaration
                               Do_procedure_declaration Once_procedure_declaration
                               Deferred_procedure_declaration External_procedure_declaration
                               Do_function_declaration Once_function_declaration
                               Deferred_function_declaration External_function_declaration
%type <ET_FEATURE_NAME>        Feature_name Feature_list_item
%type <ET_FORMAL_ARGUMENTS>    Formal_arguments_opt Formal_argument_list
%type <ET_FORMAL_GENERIC_PARAMETER>  Formal_generic
%type <ET_FORMAL_GENERIC_PARAMETERS> Formal_generics_opt Formal_generic_list
%type <ET_IDENTIFIER>          Identifier Class_name
%type <ET_IF_INSTRUCTION>      Conditional If_elseif_list
%type <ET_INSTRUCTION>         Instruction Creation_instruction Assignment
                               Assignment_attempt Call_instruction Multi_branch
                               Loop Debug Check Create_instruction
%type <ET_INTEGER_CONSTANT>    Integer_constant
%type <ET_LOCAL_VARIABLES>     Local_declarations_opt Local_variable_list
%type <ET_MANIFEST_STRING>     Obsolete_opt Manifest_string External_name_opt
%type <ET_NAMED_TYPE>          Named_type Constraint_named_type
%type <ET_PARENTS>             Parent_list_to_end
%type <ET_POSTCONDITIONS>      Postcondition_list Postcondition_opt
%type <ET_PRECONDITIONS>       Precondition_list Precondition_opt
%type <ET_REAL_CONSTANT>       Real_constant
%type <ET_RENAME>              Rename_pair
%type <ET_TYPE>                Type Constraint_type
%type <ET_WRITABLE>            Writable

%type <like new_export_list>     New_exports New_exports_opt New_export_list
%type <like new_feature_list>    Feature_list Select Select_opt Undefine Undefine_opt
                                 Redefine Redefine_opt
%type <like new_rename_list>     Rename Rename_list

%expect 15
%start Class_declarations

%%
--------------------------------------------------------------------------------

Class_declarations: Class_declaration
	| Class_declarations Class_declaration
	;

Class_declaration: Indexing_opt Class_header Formal_generics_opt Obsolete_opt
		Creators_opt Features_opt Invariant_opt E_END
	| Indexing_opt Class_header Formal_generics_opt Obsolete_opt Inheritance_to_end
	;

Creators_features_invariant_opt: Creators_opt Features_opt Invariant_opt
	;

--------------------------------------------------------------------------------

Indexing_opt: -- Empty
	| E_INDEXING Index_list
	;

Index_list: -- Empty
--	| Index_list_with_no_terminator
--	| Index_list_with_no_terminator S
	| Index_list_with_no_terminator SS
	;

Index_list_with_no_terminator: Index_clause
--	| Index_list_with_no_terminator Index_clause
--	| Index_list_with_no_terminator ';' Index_clause
--	| Index_list_with_no_terminator ';' S Index_clause
	| Index_list_with_no_terminator SS Index_clause
	;

Index_clause: Index_terms
	| Identifier ':' Index_terms
		-- Note: Eiffel says that the Index_terms list 
		-- should not be empty, but VE allows that!
--	| Identifier ':'
	;

Index_terms: Index_value
	| Index_terms ',' Index_value
	;

Index_value: Identifier
	| Boolean_constant
	| Character_constant
	| Integer_constant
	| Real_constant
	| Manifest_string
	| E_BIT
	;

--S: ';'
--	| S ';'
--	;

--------------------------------------------------------------------------------

Class_header: E_CLASS Identifier
		{ last_class := new_class ($2) }
	| E_DEFERRED E_CLASS Identifier
		{ last_class := new_deferred_class ($3) }
	| E_EXPANDED E_CLASS Identifier
		{ last_class := new_expanded_class ($3) }
	| E_SEPARATE E_CLASS Identifier
		{ last_class := new_separate_class ($3) }
	;

--------------------------------------------------------------------------------

Formal_generics_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning!
		-- { $$ := Void }
	| '[' Formal_generic_list ']'
		{ set_formal_generic_parameters ($2) }
	;

Formal_generic_list: Formal_generic
		{
			$$ := new_formal_generics ($1)
		}
	| Formal_generic_list ',' Formal_generic
		{
			$$ := $1
			$$.put ($3)
		}
	;

Formal_generic: Identifier
		{ $$ := new_formal_generic ($1, Void) }
	| Identifier E_ARROW Constraint_named_type
		{ $$ := new_formal_generic ($1, $3) }
	;

Constraint_type: Constraint_named_type
		{ $$ := $1 }
	| E_EXPANDED Constraint_named_type
	-- TODO:
		{ $$ := $2 }
	| E_SEPARATE Constraint_named_type
		-- TODO
		{ $$ := $2 }
	| E_LIKE E_CURRENT
		{ $$ := new_like_current ($1) }
	| E_LIKE Identifier
		{ $$ := new_like_identifier ($2, $1) }
	| E_BITTYPE Integer_constant
		{ $$ := new_bit_type ($2, $1.position) }
	| E_BITTYPE Identifier
		{ $$ := new_bit_identifier ($2, $1.position)  }
	;

Constraint_named_type: Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2) }
	;

Constraint_actual_generics_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning:
		-- { $$ := Void }
	| '[' Constraint_type_list ']'
		{ $$ := $2 }
	;

Constraint_type_list: Constraint_type
		{ $$ := new_actual_generics ($1) }
	| Constraint_type_list ',' Constraint_type
		{
			$$ := $1
			$$.put ($3)
		}
	;

--------------------------------------------------------------------------------

Obsolete_opt: -- Empty
		-- { $$ := Void }
	| E_OBSOLETE Manifest_string
		{ $$ := $2 }
	;

--------------------------------------------------------------------------------

Inheritance_to_end: E_INHERIT Creators_features_invariant_opt E_END
	| E_INHERIT Parent_list_to_end
		{ last_class.set_parents ($2) }
	;

Parent_list_to_end: E_IDENTIFIER Actual_generics_opt
	  Rename New_exports_opt Undefine_opt Redefine_opt Select_opt E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, $3, $4, $5, $6, $7)) }
	| E_IDENTIFIER Actual_generics_opt
	  New_exports Undefine_opt Redefine_opt Select_opt E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, $3, $4, $5, $6)) }
	| E_IDENTIFIER Actual_generics_opt Undefine Redefine_opt Select_opt E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, $3, $4, $5)) }
	| E_IDENTIFIER Actual_generics_opt Redefine Select_opt E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, Void, $3, $4)) }
	| E_IDENTIFIER Actual_generics_opt Select E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, Void, Void, $3)) }
	| E_IDENTIFIER Actual_generics_opt E_END
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, Void, Void, Void)) }
	| E_IDENTIFIER Actual_generics_opt
	  Parent_terminator Creators_features_invariant_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, Void, Void, Void)) }
	| E_IDENTIFIER Actual_generics_opt E_END
		{ $$ := new_parents (new_parent ($1, $2, Void, Void, Void, Void, Void)) }

	| E_IDENTIFIER Actual_generics_opt
	  Rename New_exports_opt Undefine_opt Redefine_opt Select_opt E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $10; $$.put_first (new_parent ($1, $2, $3, $4, $5, $6, $7)) }
	| E_IDENTIFIER Actual_generics_opt
	  New_exports Undefine_opt Redefine_opt Select_opt E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $9; $$.put_first (new_parent ($1, $2, Void, $3, $4, $5, $6)) }
	| E_IDENTIFIER Actual_generics_opt Undefine Redefine_opt Select_opt E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $8; $$.put_first (new_parent ($1, $2, Void, Void, $3, $4, $5)) }
	| E_IDENTIFIER Actual_generics_opt Redefine Select_opt E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $7; $$.put_first (new_parent ($1, $2, Void, Void, Void, $3, $4)) }
	| E_IDENTIFIER Actual_generics_opt Select E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $6; $$.put_first (new_parent ($1, $2, Void, Void, Void, Void, $3)) }
	| E_IDENTIFIER Actual_generics_opt E_END
	  Parent_separator Parent_list_to_end
		{ $$ := $5; $$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void)) }
	| E_IDENTIFIER Actual_generics_opt
	  Parent_separator Parent_list_to_end
		{ $$ := $4; $$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void)) }
	;

		-- Note: The two constructs above are a workaround to solve
		-- the following grammar ambiguity:
		--		class FOO inherit BAR end
		-- where, through shift/reduce conflicts, would have
		-- been parsed with 'end' being recognized as the
		-- end of the feature adaptation of BAR instead of
		-- as the end of the class FOO.

Parent_terminator: -- Empty
	| ';'
	;

Parent_separator: -- Empty
	| ';'
	;

--------------------------------------------------------------------------------

Rename: E_RENAME
		-- { $$ := Void }
	| E_RENAME Rename_list
		{ $$ := $2 }
	;

Rename_list: Rename_pair
		{
			$$ := new_rename_list (rename_list_count)
			rename_list_count := rename_list_count - 1
			$$.put ($1, rename_list_count)
		}
	| Rename_pair ',' Rename_list
		{
			$$ := $3
			rename_list_count := rename_list_count - 1
			$$.put ($1, rename_list_count)
		}
	;

Rename_pair: Feature_name E_AS Feature_name
		{
			$$ := new_rename ($1, $3)
			rename_list_count := rename_list_count + 1
		}
	;

--------------------------------------------------------------------------------

New_exports: E_EXPORT New_export_list
	;

New_exports_opt: -- Empty
	| New_exports
	;

New_export_list: -- Empty
	| New_export_list_with_no_terminator
	| New_export_list_with_no_terminator ';'
	;

New_export_list_with_no_terminator: New_export_item
	| New_export_list_with_no_terminator New_export_item
	| New_export_list_with_no_terminator ';' New_export_item
	;

New_export_item: Clients Feature_set
	;

Feature_set: -- Empty
	| Feature_list
	| E_ALL
	;

Feature_list: Feature_list_item
		{
			$$ := new_feature_list (feature_list_count)
			feature_list_count := feature_list_count - 1
			$$.put ($1, feature_list_count)
		}
	| Feature_list_item ',' Feature_list
		{
			$$ := $3
			feature_list_count := feature_list_count - 1
			$$.put ($1, feature_list_count)
		}
	;

Feature_list_item: Feature_name
		{
			$$ := $1
			feature_list_count := feature_list_count + 1
		}
	;

--------------------------------------------------------------------------------

Clients: '{' Client_list '}'
		{ $$ := $2 }
	| '{' '}'
		{ $$ := new_none_clients }
	;

Clients_opt: -- Empty
		{ $$ := new_any_clients }
	| Clients
		{ $$ := $1 }
	;

Client_list: Identifier
		{ $$ := new_clients (new_client ($1)) }
	| Identifier ','
		{ $$ := new_clients (new_client ($1)) }
	| Identifier ',' Client_list
		{ $$ := $3; $$.put_first (new_client ($1)) }
	| Identifier     Client_list
		{ $$ := $2; $$.put_first (new_client ($1)) }
	;

--------------------------------------------------------------------------------

Redefine: E_REDEFINE
		-- { $$ := Void }
	| E_REDEFINE Feature_list
		{ $$ := $2 }
	;

Redefine_opt: -- Empty
		-- { $$ := Void }
	| Redefine
		{ $$ := $1 }
	;

Undefine: E_UNDEFINE
		-- { $$ := Void }
	| E_UNDEFINE Feature_list
		{ $$ := $2 }
	;

Undefine_opt: -- Empty
		-- { $$ := Void }
	| Undefine
		{ $$ := $1 }
	;

Select: E_SELECT
		-- { $$ := Void }
	| E_SELECT Feature_list
		{ $$ := $2 }
	;

Select_opt: -- Empty
		-- { $$ := Void }
	| Select
		{ $$ := $1 }
	;

--------------------------------------------------------------------------------

Creators_opt: -- Empty
	| Creators
	;

Creators: Creation_clause
	| Creators Creation_clause
	;

Creation_clause: E_CREATION Clients_opt Procedure_list
	| E_CREATE Clients_opt Procedure_list
	;

		-- Note: Does not support 'Header_comment'.

Procedure_list: -- Empty
	| Identifier
	| Procedure_list ',' Identifier
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
	| Features
	;
	
Features: Feature_clause
	| Features Feature_clause
	;

Feature_clause: E_FEATURE Clients_opt Feature_declaration_list
	;

		-- Note: Does not support 'Header_comment'.

Feature_declaration_list: -- Empty
	| Feature_declaration_list_with_no_terminator
	| Feature_declaration_list_with_no_terminator ';'
	;

Feature_declaration_list_with_no_terminator: Feature_declaration
	| Feature_declaration_list_with_no_terminator Feature_declaration
	| Feature_declaration_list_with_no_terminator ';' Feature_declaration
	;

--------------------------------------------------------------------------------

Feature_declaration: Single_feature_declaration
		{ $$ := $1; register_feature ($$) }
	| E_FROZEN Single_feature_declaration
		{ $$ := $2; register_frozen_feature ($$) }
	| Feature_name Feature_synonym_separator Feature_declaration
		{ $$ := new_synonym_feature ($1, $3); register_feature ($$) }
	| E_FROZEN Feature_name Feature_synonym_separator Feature_declaration
		{ $$ := new_synonym_feature ($2, $4); register_frozen_feature ($$) }
	;

Feature_synonym_separator: -- Empty
	| ','
	;

Single_feature_declaration: Attribute_declaration
		{ $$ := $1 }
	| Constant_declaration
		{ $$ := $1 }
	| Unique_declaration
		{ $$ := $1 }
	| Do_procedure_declaration
		{ $$ := $1 }
	| Once_procedure_declaration
		{ $$ := $1 }
	| Deferred_procedure_declaration
		{ $$ := $1 }
	| External_procedure_declaration
		{ $$ := $1 }
	| Do_function_declaration
		{ $$ := $1 }
	| Once_function_declaration
		{ $$ := $1 }
	| Deferred_function_declaration
		{ $$ := $1 }
	| External_function_declaration
		{ $$ := $1 }
	;

Attribute_declaration: Feature_name Formal_arguments_opt ':' Type
		{ $$ := new_attribute ($1, $2, $4) }
	;

Constant_declaration: Feature_name Formal_arguments_opt ':' Type E_IS Manifest_constant
		{ $$ := new_constant_attribute ($1, $2, $4, $5) }
	;

Unique_declaration: Feature_name Formal_arguments_opt ':' Type E_IS E_UNIQUE
		{ $$ := new_unique_attribute ($1, $2, $4) }
	;

Do_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_DO Compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_do_procedure ($1, $2, $4, $5, $6, $8, $9, $10) }
	;

Once_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_once_procedure ($1, $2, $4, $5, $6, $8, $9, $10) }
	;

Deferred_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END
		{ $$ := new_deferred_procedure ($1, $2, $4, $5, $7) }
	;

External_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END
		{ $$ := new_external_procedure ($1, $2, $4, $5, $7, $8, $9) }
	;

Do_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_DO Compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_do_function ($1, $2, $4, $6, $7, $8, $10, $11, $12) }
	;

Once_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	E_ONCE Compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_once_function ($1, $2, $4, $6, $7, $8, $10, $11, $12) }
	;

Deferred_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END
		{ $$ := new_deferred_function ($1, $2, $4, $6, $7, $9) }
	;

External_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END
		{ $$ := new_external_function ($1, $2, $4, $6, $7, $9, $10, $11) }
	;

External_name_opt: -- Empty
		-- { $$ := Void }
	| E_ALIAS Manifest_string
		{ $$ := $2 }
	;

--------------------------------------------------------------------------------

Feature_name: Identifier
		{ $$ := $1 }
	| E_PREFIX E_STRNOT
		{ $$ := new_prefix_not ($1) }
	| E_PREFIX E_STRPLUS
		{ $$ := new_prefix_plus ($1) }
	| E_PREFIX E_STRMINUS
		{ $$ := new_prefix_minus ($1) }
	| E_PREFIX E_STRFREEOP
		{ $$ := new_prefix_freeop ($2, $1) }
	| E_INFIX E_STRPLUS
		{ $$ := new_infix_plus ($1) }
	| E_INFIX E_STRMINUS
		{ $$ := new_infix_minus ($1) }
	| E_INFIX E_STRSTAR
		{ $$ := new_infix_times ($1) }
	| E_INFIX E_STRSLASH
		{ $$ := new_infix_divide ($1) }
	| E_INFIX E_STRDIV
		{ $$ := new_infix_div ($1) }
	| E_INFIX E_STRMOD
		{ $$ := new_infix_mod ($1) }
	| E_INFIX E_STRPOWER
		{ $$ := new_infix_power ($1) }
	| E_INFIX E_STRLT
		{ $$ := new_infix_lt ($1) }
	| E_INFIX E_STRLE
		{ $$ := new_infix_le ($1) }
	| E_INFIX E_STRGT
		{ $$ := new_infix_gt ($1) }
	| E_INFIX E_STRGE
		{ $$ := new_infix_ge ($1) }
	| E_INFIX E_STRAND
		{ $$ := new_infix_and ($1) }
	| E_INFIX E_STRANDTHEN
		{ $$ := new_infix_and_then ($1) }
	| E_INFIX E_STROR
		{ $$ := new_infix_or ($1) }
	| E_INFIX E_STRORELSE
		{ $$ := new_infix_or_else ($1) }
	| E_INFIX E_STRIMPLIES
		{ $$ := new_infix_implies ($1) }
	| E_INFIX E_STRXOR
		{ $$ := new_infix_xor ($1) }
	| E_INFIX E_STRFREEOP
		{ $$ := new_infix_freeop ($2, $1) }

	| E_PREFIX E_STRING
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRSTAR
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRSLASH
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRDIV
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRMOD
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRPOWER
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRLT
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRLE
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRGT
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRGE
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRAND
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STROR
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRXOR
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRANDTHEN
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRORELSE
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_PREFIX E_STRIMPLIES
		{ $$ := new_invalid_prefix ($2, $1) }
	| E_INFIX E_STRING
		{ $$ := new_invalid_infix ($2, $1) }
	| E_INFIX E_STRNOT
		{ $$ := new_invalid_infix ($2, $1) }
	;

--------------------------------------------------------------------------------

Formal_arguments_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		-- { $$ := Void }
	| '(' Formal_argument_list ')'
		{ $$ := $2 }
	;

Formal_argument_list: Identifier ':' Type
		{ $$ := new_formal_arguments ($1, $3) }
	| Identifier ':' Type ';'
		{ $$ := new_formal_arguments ($1, $3) }
	| Identifier ',' Formal_argument_list
		{ $$ := $3; $$.put_name_first ($1) }
	| Identifier     Formal_argument_list
		{ $$ := $2; $$.put_name_first ($1) }
	| Identifier ':' Type ';' Formal_argument_list
		{ $$ := $5; $$.put_first ($1, $3) }
	| Identifier ':' Type     Formal_argument_list
		{ $$ := $4; $$.put_first ($1, $3) }
	;

--------------------------------------------------------------------------------

Local_declarations_opt: -- Empty
		-- { $$ := Void }
	| E_LOCAL
		-- { $$ := Void }
	| E_LOCAL Local_variable_list
		{ $$ := $2 }
	;

Local_variable_list: Identifier ':' Type
		{ $$ := new_local_variables ($1, $3) }
	| Identifier ':' Type ';'
		{ $$ := new_local_variables ($1, $3) }
	| Identifier ',' Local_variable_list
		{ $$ := $3; $$.put_name_first ($1) }
	| Identifier     Local_variable_list
		{ $$ := $2; $$.put_name_first ($1) }
	| Identifier ':' Type ';' Local_variable_list
		{ $$ := $5; $$.put_first ($1, $3) }
	| Identifier ':' Type     Local_variable_list
		{ $$ := $4; $$.put_first ($1, $3) }
	;

--------------------------------------------------------------------------------

Precondition_opt: -- Empty
		-- { $$ := Void }
	| E_REQUIRE
		{ $$ := new_preconditions (new_comment_assertion (Void)) }
	| E_REQUIRE Precondition_list
		{ $$ := $2 }
	| E_REQUIRE E_ELSE
		{ $$ := new_preconditions (new_comment_assertion (Void)); $$.set_require_else }
	| E_REQUIRE E_ELSE Precondition_list
		{ $$ := $3; $$.set_require_else }
	;

Postcondition_opt: -- Empty
		-- { $$ := Void }
	| E_ENSURE
		{ $$ := new_postconditions (new_comment_assertion (Void)) }
	| E_ENSURE Postcondition_list
		{ $$ := $2 }
	| E_ENSURE E_THEN
		{ $$ := new_postconditions (new_comment_assertion (Void)); $$.set_ensure_then }
	| E_ENSURE E_THEN Postcondition_list
		{ $$ := $3; $$.set_ensure_then }
	;

Invariant_opt: -- Empty
		-- { $$ := Void }
	| E_INVARIANT
		-- { $$ := Void }
	| E_INVARIANT Assertion_list
		{ $$ := $2 }
	;

Assertion_list: Assertion_clause
		{ $$ := new_assertions ($1) }
	| Assertion_clause ';'
		{ $$ := new_assertions ($1) }
	| Assertion_clause     Assertion_list
		{ $$ := $2; $$.put_first ($1) }
	| Assertion_clause ';' Assertion_list
		{ $$ := $3; $$.put_first ($1) }
	;

Precondition_list: Assertion_clause
		{ $$ := new_preconditions ($1) }
	| Assertion_clause ';'
		{ $$ := new_preconditions ($1) }
	| Assertion_clause     Precondition_list
		{ $$ := $2; $$.put_first ($1) }
	| Assertion_clause ';' Precondition_list
		{ $$ := $3; $$.put_first ($1) }
	;

Postcondition_list: Assertion_clause
		{ $$ := new_postconditions ($1) }
	| Assertion_clause ';'
		{ $$ := new_postconditions ($1) }
	| Assertion_clause     Postcondition_list
		{ $$ := $2; $$.put_first ($1) }
	| Assertion_clause ';' Postcondition_list
		{ $$ := $3; $$.put_first ($1) }
	;

Assertion_clause: Expression
		{ $$ := new_expression_assertion (Void, $1) }
		-- Note: Does not support 'Comment' as assertion.
		-- However, this is simulated by the following
		-- production:
	| Identifier ':'
		{ $$ := new_comment_assertion ($1) }
	--| Identifier ':' Expression
	;

--------------------------------------------------------------------------------

Rescue_opt: -- Empty
		-- { $$ := Void }
	| E_RESCUE Compound
		{ $$ := $2 }
	;

--------------------------------------------------------------------------------

Type: Named_type
		{ $$ := $1 }
	| E_EXPANDED Named_type
	-- TODO:
		{ $$ := $2 }
	| E_SEPARATE Named_type
		-- TODO
		{ $$ := $2 }
	| E_LIKE E_CURRENT
		{ $$ := new_like_current ($1) }
	| E_LIKE Identifier
		{ $$ := new_like_identifier ($2, $1) }
	| E_BITTYPE Integer_constant
		{ $$ := new_bit_type ($2, $1.position) }
	| E_BITTYPE Identifier
		{ $$ := new_bit_identifier ($2, $1.position)  }
	;

Named_type: Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2) }
	;

Class_name: E_IDENTIFIER
		{ $$ := $1 }
	;

Actual_generics_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning:
		-- { $$ := Void }
	| '[' Type_list ']'
		{ $$ := $2 }
	;

Type_list: Type
		{ $$ := new_actual_generics ($1) }
	| Type_list ',' Type
		{
			$$ := $1
			$$.put ($3)
		}
	;

--------------------------------------------------------------------------------

Compound: Empty_instruction
		-- { $$ := Void }
	| Non_empty_compound
		{ $$ := $1 }
	;
	
Non_empty_compound: Empty_instruction Instruction Empty_instruction
		{ $$ := new_compound ($2) }
	| Empty_instruction Instruction Non_empty_compound
		{ $$ := $3; $$.add_instruction ($2) }
	;

Instruction: Creation_instruction
		{ $$ := $1 }
	| Create_instruction
		{ $$ := $1 }
	| Call_instruction
		{ $$ := $1 }
	| Assignment
		{ $$ := $1 }
	| Assignment_attempt
		{ $$ := $1 }
	| Conditional
		{ $$ := $1 }
	| Multi_branch
		{ $$ := $1 }
	| Loop
		{ $$ := $1 }
	| Debug
		{ $$ := $1 }
	| Check
		{ $$ := $1 }
	| E_RETRY
		{ $$ := new_retry_instruction }
	;

Empty_instruction: -- Empty
	| Empty_instruction ';'
	;

SS: -- Empty
	| SS ';'
	;

--------------------------------------------------------------------------------

Creation_instruction: '!' Type '!' Writable Creation_call_opt
		{ $$ := new_creation_instruction ($2, $4, $5) }
	| E_BANGBANG Writable Creation_call_opt
		{ $$ := new_creation_instruction (Void, $2, $3) }
	;

Creation_call_opt: -- Empty
	| '.' Identifier Actuals_opt
	;

Create_instruction: E_CREATE '{' Type '}' Writable Creation_call_opt
		{ $$ := new_creation_instruction ($3, $5, $6) }
	| E_CREATE Writable Creation_call_opt
		{ $$ := new_creation_instruction (Void, $2, $3) }
	;

Create_expression: E_CREATE '{' Type '}' Creation_call_opt
	;

--------------------------------------------------------------------------------

Assignment: Writable E_ASSIGN Expression
		{ $$ := new_assignment ($1, $3) }
	;

Assignment_attempt: Writable E_REVERSE Expression
		{ $$ := new_assignment_attempt ($1, $3) }
	;

--------------------------------------------------------------------------------

Conditional: If_elseif_list E_END
		{ $$ := $1 }
	| If_elseif_list Else_part E_END
		{ $$ := $1; $$.set_else_part ($2) }
	;

Else_part: E_ELSE Compound
		{ $$ := $2 }
	;

If_elseif_list: E_IF Expression E_THEN Compound
		{ $$ := new_if_instruction ($2, $4) }
	| If_elseif_list E_ELSEIF Expression E_THEN Compound
		{ $$ := $1; $$.add_conditional ($3, $5) }
	;

--------------------------------------------------------------------------------

Multi_branch: E_INSPECT Expression When_list_opt Else_part E_END
		{ $$ := new_inspect_instruction }
	| E_INSPECT Expression When_list_opt E_END
		{ $$ := new_inspect_instruction }
	;

When_list_opt: -- Empty
	| When_list
	;

When_list: E_WHEN Choices E_THEN Compound
	| When_list E_WHEN Choices E_THEN Compound
	;

Choices: -- Empty
	| Choice
	| Choices ',' Choice
	;

Choice: Choice_constant
	| Choice_constant E_DOTDOT Choice_constant
	;

Choice_constant: Integer_constant
	| Character_constant
		-- For Visual Eiffel and TowerEiffel
		-- (not standard Eiffel!):
	| Call_expression
	-- | Identifier
	;

--------------------------------------------------------------------------------

Loop: E_FROM Compound Invariant_opt Variant_opt
	E_UNTIL Expression E_LOOP Compound E_END
		{ $$ := new_loop_instruction }
	;

Variant_opt: -- Empty
	| E_VARIANT			-- Not standard.
	| E_VARIANT Expression
	| E_VARIANT Identifier ':' Expression
	;

--------------------------------------------------------------------------------

Debug: E_DEBUG Debug_keys_opt Compound E_END
		{ $$ := new_debug_instruction }
	;

Debug_keys_opt: -- Empty
	| '(' Debug_key_list ')'
	;

Debug_key_list: -- Empty
	| Manifest_string
	| Debug_key_list ',' Manifest_string
	;

--------------------------------------------------------------------------------

Check: E_CHECK Assertion_list E_END
		{ $$ := new_check_instruction }
	| E_CHECK E_END
		{ $$ := new_check_instruction }
	;

--------------------------------------------------------------------------------

Call_instruction: Identifier Actuals_opt
		{ $$ := new_call_instruction (Void, $1, $2) }
	| Qualified_call_chain Identifier Actuals_opt
		{ $$ := new_call_instruction ($1, $2, $3) }
	| E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_instruction (Void, $2) }
	| '{' Identifier '}' E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_instruction ($2, $5) }
	;

Call_expression: Identifier Actuals_opt
		{ $$ := new_call_expression (Void, $1, $2) }
	| Qualified_call_chain Identifier Actuals_opt
		{ $$ := new_call_expression ($1, $2, $3) }
	| E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_expression (Void, $2) }
	| '{' Identifier '}' E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_expression ($2, $5) }
	;

Qualified_call_chain: Identifier Actuals_opt '.'
		{ $$ := new_call_expression (Void, $1, $2) }
	| E_RESULT '.'
		{ $$ := new_result ($1) }
	| E_CURRENT '.'
		{ $$ := new_current ($1) }
	| '(' Expression ')' '.'
		{ $$ := $2 }
	| E_PRECURSOR Actuals_opt '.'
		{ $$ := new_precursor_expression (Void, $2) }
	| '{' Identifier '}' E_PRECURSOR Actuals_opt '.'
		{ $$ := new_precursor_expression ($2, $5) }
	| Qualified_call_chain Identifier Actuals_opt '.'
		{ $$ := new_call_expression ($1, $2, $3) }
	;

--------------------------------------------------------------------------------

Actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		-- { $$ := Void }
	| '(' Actual_list ')'
		{ $$ := $2 }
	;

Actual_list: Expression
		{ $$ := new_actual_arguments ($1) }
	| Expression ',' Actual_list
		{ $$ := $3; $$.add_argument ($1) }
	;

Address_mark: '$' Feature_name
		{ $$ := new_feature_address }
	| '$' E_CURRENT
		{ $$ := new_current_address }
	| '$' E_RESULT
		{ $$ := new_result_address }
		-- Note: The following construct is an
		-- extension of the Eiffel syntax provided
		-- in ISE Eiffel 4 compiler.
	| '$' '(' Expression ')'
		{ $$ := new_expression_address ($3) }
	;

Writable: Identifier
		{ $$ := $1 }
	| E_RESULT
		{ $$ := new_result ($1) }
	;

--------------------------------------------------------------------------------

Expression: Call_expression
		{ $$ := $1 }
	| Create_expression
		{ $$ := $1 }
	| E_RESULT
		{ $$ := new_result ($1) }
	| E_CURRENT
		{ $$ := new_current ($1) }
	| '(' Expression ')'
		{ $$ := $2 }
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
	| E_BIT
		{ $$ := $1 }
	| E_LARRAY Expression_list E_RARRAY
		{ $$ := new_manifest_array }
	| '+' Expression %prec E_NOT
		{ $$ := new_prefix_plus_expression ($2, $1) }
	| '-' Expression %prec E_NOT
		{ $$ := new_prefix_minus_expression ($2, $1) }
	| E_NOT Expression
		{ $$ := new_prefix_not_expression ($2, $1) }
	| E_FREEOP Expression %prec E_NOT
		{ $$ := new_prefix_freeop_expression ($1, $2) }
	| Expression E_FREEOP Expression
		{ $$ := new_infix_freeop_expression ($1, $3, $2) }
	| Expression '+' Expression
		{ $$ := new_infix_plus_expression ($1, $3, $2) }
	| Expression '-' Expression
		{ $$ := new_infix_minus_expression ($1, $3, $2) }
	| Expression '*' Expression
		{ $$ := new_infix_times_expression ($1, $3, $2) }
	| Expression '/' Expression
		{ $$ := new_infix_divide_expression ($1, $3, $2) }
	| Expression '^' Expression
		{ $$ := new_infix_power_expression ($1, $3, $2) }
	| Expression E_DIV Expression
		{ $$ := new_infix_div_expression ($1, $3, $2) }
	| Expression E_MOD Expression
		{ $$ := new_infix_mod_expression ($1, $3, $2) }
	| Expression '=' Expression
		{ $$ := new_equal_expression ($1, $3) }
	| Expression E_NE Expression
		{ $$ := new_not_equal_expression ($1, $3) }
	| Expression '<' Expression
		{ $$ := new_infix_lt_expression ($1, $3, $2) }
	| Expression '>' Expression
		{ $$ := new_infix_gt_expression ($1, $3, $2) }
	| Expression E_LE Expression
		{ $$ := new_infix_le_expression ($1, $3, $2) }
	| Expression E_GE Expression
		{ $$ := new_infix_ge_expression ($1, $3, $2) }
	| Expression E_AND Expression
		{ $$ := new_infix_and_expression ($1, $3, $2) }
	| Expression E_OR Expression
		{ $$ := new_infix_or_expression ($1, $3, $2) }
	| Expression E_XOR Expression
		{ $$ := new_infix_xor_expression ($1, $3, $2) }
	| Expression E_AND E_THEN Expression %prec E_AND
		{ $$ := new_infix_and_then_expression ($1, $4, $2) }
	| Expression E_OR E_ELSE Expression %prec E_OR
		{ $$ := new_infix_or_else_expression ($1, $4, $2) }
	| Expression E_IMPLIES Expression
		{ $$ := new_infix_implies_expression ($1, $3, $2) }
	| E_OLD Expression
		{ $$ := new_old_expression ($2) }
	| E_STRIP '(' Attribute_list ')'
		{ $$ := new_strip_expression }
	| Address_mark
		{ $$ := $1 }
	;

Attribute_list: -- Empty
	| Identifier
	| Attribute_list ',' Identifier
	;

Expression_list: -- Empty
	| Expression
	| Expression_list ',' Expression
	;

Manifest_constant: Boolean_constant
	| Character_constant
	| Integer_constant
	| Real_constant
	| Manifest_string
	| E_BIT
	;

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
		{ $$ := $2; $$.set_negative }
	| '+' E_INTEGER
		{ $$ := $2 }
	;

Real_constant: E_REAL
		{ $$ := $1 }
	| '-' E_REAL
		{ $$ := $2; $$.set_negative }
	| '+' E_REAL
		{ $$ := $2 }
	;

Identifier: E_IDENTIFIER
		{ $$ := $1 }
	| E_BITTYPE
		{
				-- TO DO: reserved word `BIT'
			$$ := $1
		}
	;

--------------------------------------------------------------------------------
%%

end -- class ET_EIFFEL_PARSER
