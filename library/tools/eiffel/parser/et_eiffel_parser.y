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

%token <ET_TOKEN>              E_AGENT E_ALIAS E_ALL E_AS E_CHECK
%token <ET_TOKEN>              E_CLASS E_CREATE E_CREATION E_DEBUG E_DEFERRED
%token <ET_TOKEN>              E_DO E_ELSE E_ELSEIF E_END E_ENSURE
%token <ET_TOKEN>              E_EXPORT E_EXTERNAL E_FEATURE E_FROM E_FROZEN
%token <ET_TOKEN>              E_IF E_INDEXING E_INFIX E_INHERIT E_INSPECT
%token <ET_TOKEN>              E_INVARIANT E_IS E_LIKE E_LOCAL E_LOOP E_OBSOLETE
%token <ET_TOKEN>              E_ONCE E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
%token <ET_TOKEN>              E_RESCUE E_SELECT E_STRIP
%token <ET_TOKEN>              E_THEN E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT
%token <ET_TOKEN>              E_WHEN E_PRECURSOR

%token <ET_SYMBOL>             E_BANGBANG E_ARROW E_DOTDOT E_LARRAY E_RARRAY
%token <ET_SYMBOL>             E_ASSIGN E_REVERSE
%token <ET_POSITION>           E_UNKNOWN

%token <ET_BIT_CONSTANT>       E_BIT
%token <ET_BOOLEAN_CONSTANT>   E_FALSE E_TRUE
%token <ET_BREAK>              E_BREAK
%token <ET_CHARACTER_CONSTANT> E_CHARACTER
%token <ET_CURRENT>            E_CURRENT
%token <ET_EXPANDED_MARK>      E_EXPANDED
%token <ET_FREE_OPERATOR>      E_FREEOP
%token <ET_IDENTIFIER>         E_IDENTIFIER E_BITTYPE
%token <ET_INFIX_AND_OPERATOR> E_AND
%token <ET_INFIX_DIV_OPERATOR> E_DIV
%token <ET_INFIX_DIVIDE_OPERATOR> '/'
%token <ET_INFIX_GE_OPERATOR>  E_GE
%token <ET_INFIX_GT_OPERATOR>  '>'
%token <ET_INFIX_IMPLIES_OPERATOR>  E_IMPLIES
%token <ET_INFIX_LE_OPERATOR>  E_LE
%token <ET_INFIX_LT_OPERATOR>  '<'
%token <ET_INFIX_MOD_OPERATOR> E_MOD
%token <ET_INFIX_OR_OPERATOR>  E_OR
%token <ET_INFIX_POWER_OPERATOR> '^'
%token <ET_INFIX_TIMES_OPERATOR> '*'
%token <ET_INFIX_XOR_OPERATOR> E_XOR
%token <ET_INTEGER_CONSTANT>   E_INTEGER
%token <ET_MANIFEST_STRING>    E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV
%token <ET_MANIFEST_STRING>    E_STRMOD E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE
%token <ET_MANIFEST_STRING>    E_STRAND E_STROR E_STRXOR E_STRANDTHEN E_STRORELSE
%token <ET_MANIFEST_STRING>    E_STRIMPLIES E_STRFREEOP E_STRNOT E_STRING
%token <ET_PREFIX_NOT_OPERATOR> E_NOT
%token <ET_REAL_CONSTANT>      E_REAL
%token <ET_REFERENCE_MARK>     E_REFERENCE
%token <ET_RESULT>             E_RESULT
%token <ET_RETRY_INSTRUCTION>  E_RETRY
%token <ET_SEPARATE_MARK>      E_SEPARATE

%token E_CHARERR E_STRERR E_INTERR

%token <ET_TOKEN>              E_OLD
%token <ET_SYMBOL>             '{' '}'
%token <ET_SYMBOL>             '(' ')' ':' ',' '[' ']' '$' '.' '!' '?'
%token <ET_MINUS_SYMBOL>       '-'
%token <ET_PLUS_SYMBOL>        '+'
%token <ET_EQUAL_SYMBOL>       '='
%token <ET_NOT_EQUAL_SYMBOL>   E_NE
%token <ET_SEMICOLON_SYMBOL>   ';'

%left E_IMPLIES
%left E_OR E_XOR
%left E_AND
%left '=' E_NE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP
%right E_NOT E_OLD

%type <ET_ACTUAL_ARGUMENTS>    Actuals_opt Actuals_expression_list
%type <ET_ACTUAL_GENERIC_PARAMETERS>  Actual_generics_opt Type_list Actual_generics
                               Constraint_actual_generics_opt Constraint_type_list
%type <ET_BIT_CONSTANT>        Bit_constant
%type <ET_BOOLEAN_CONSTANT>    Boolean_constant
%type <ET_BREAK>               Break_opt
%type <ET_CALL_AGENT>          Call_agent
%type <ET_CALL_EXPRESSION>     Call_expression
%type <ET_CHARACTER_CONSTANT>  Character_constant
%type <ET_CHOICE>              Choice
%type <ET_CHOICE_CONSTANT>     Choice_constant
%type <ET_CHOICE_LIST>         Choices Choices_opt
%type <ET_CLASS>               Class_header Class_to_end
%type <ET_CLIENTS>             Clients Clients_opt Client_list
%type <ET_COMPOUND>            Compound Rescue_opt Do_compound Once_compound Then_compound
                               Else_compound Rescue_compound From_compound Loop_compound
%type <ET_CONSTANT>            Manifest_constant
%type <ET_CONSTRAINT_CREATOR>  Constraint_create Constraint_create_procedure_list
%type <ET_CREATOR>             Creation_clause Creation_procedure_list
%type <ET_CREATORS>            Creators Creators_opt
%type <ET_CURRENT>             Current
%type <ET_DEBUG_INSTRUCTION>   Debug_instruction Debug_compound
%type <ET_DEBUG_KEYS>          Debug_keys Debug_key_list
%type <ET_ELSEIF_PART_LIST>    Elseif_list Elseif_part_list
%type <ET_EXPANDED_MARK>       Expanded
%type <ET_EXPORT>              New_export_item
%type <ET_EXPORTS>             New_exports New_exports_opt New_export_list
%type <ET_EXPRESSION>          Expression Call_chain Precursor_expression
                               Address_mark Create_expression
%type <ET_FEATURE>             Feature_declaration Single_feature_declaration
                               Attribute_declaration Constant_declaration Unique_declaration
                               Do_procedure_declaration Once_procedure_declaration
                               Deferred_procedure_declaration External_procedure_declaration
                               Do_function_declaration Once_function_declaration
                               Deferred_function_declaration External_function_declaration
%type <ET_FEATURE_EXPORT>      New_feature_export Export_feature_name_list
%type <ET_FEATURE_NAME>        Feature_name
%type <ET_FORMAL_ARGUMENTS>    Formal_arguments_opt Formal_argument_list
%type <ET_FORMAL_GENERIC_PARAMETER>  Formal_generic
%type <ET_FORMAL_GENERIC_PARAMETERS> Formal_generics_opt Formal_generic_list
%type <ET_IDENTIFIER>          Identifier Class_name
%type <ET_IF_INSTRUCTION>      Conditional
%type <ET_INSPECT_INSTRUCTION> Multi_branch
%type <ET_INSTRUCTION>         Instruction Creation_instruction Call_instruction
                               Create_instruction
%type <ET_INTEGER_CONSTANT>    Integer_constant
%type <ET_INVARIANTS>          Invariant_clause_opt
%type <ET_KEYWORD_FEATURE_NAME_LIST> Keyword_feature_name_list Select_clause Select_clause_opt
                               Undefine_clause Undefine_clause_opt Redefine_clause
                               Redefine_clause_opt
%type <ET_LOCAL_VARIABLES>     Local_declarations_opt Local_variable_list
%type <ET_MANIFEST_ARRAY>      Manifest_array Manifest_array_expression_list
%type <ET_MANIFEST_STRING>     Manifest_string External_name_opt
%type <ET_MANIFEST_TUPLE>      Manifest_tuple Manifest_tuple_expression_list
%type <ET_OBSOLETE>            Obsolete_opt
%type <ET_PARENTHESIZED_EXPRESSION>  Parenthesized_expression
%type <ET_PARENTS>             Parent_list_to_end
%type <ET_POSTCONDITIONS>      Postcondition_opt
%type <ET_QUALIFIED_PRECURSOR_EXPRESSION>  Qualified_precursor_expression
%type <ET_QUALIFIED_PRECURSOR_INSTRUCTION> Qualified_precursor_instruction
%type <ET_PRECONDITIONS>       Precondition_opt
%type <ET_REAL_CONSTANT>       Real_constant
%type <ET_REFERENCE_MARK>      Reference
%type <ET_RENAMES>             Rename_clause Rename_list
%type <ET_RESULT>              Result
%type <ET_RETRY_INSTRUCTION>   Retry
%type <ET_SEMICOLON_SYMBOL>    Semicolon
%type <ET_SEPARATE_MARK>       Separate
%type <ET_SIGN_SYMBOL>         Plus_sign Minus_sign
%type <ET_STRIP_EXPRESSION>    Strip_expression Strip_feature_name_list
%type <ET_SYMBOL>              Assign Bang Bangbang Colon Comma Dollar Dot Left_array Right_array
                               Left_brace Right_brace Left_bracket Right_bracket Left_parenthesis
                               Right_parenthesis Reverse Dotdot Arrow Question_mark
%type <ET_TOKEN>               Check Create Debug Else Elseif End Ensure From If Invariant
                               Loop Precursor Require Then Until Variant When Inspect Select
                               Rename Redefine Export Undefine All Creation As Do Once
                               Rescue Like Bit Local Obsolete Inherit Class Agent
%type <ET_TYPE>                Type Constraint_type
%type <ET_VARIANT>             Variant_clause_opt
%type <ET_WHEN_PART_LIST>      When_list When_list_opt
%type <ET_WRITABLE>            Writable

%expect 43
%start Class_declarations

%%
--DONE------------------------------------------------------------------------------

Class_declarations: Class_declaration
	;

Class_declaration: Indexing_opt Class_to_end
		{
			$2.set_first_indexing ($1)
			remove_last_class
		}
	;

Class_declaration_opt: -- Empty
	| Class_declaration
	;

Class_to_end: Class_header Formal_generics_opt Obsolete_opt
	   Creators_opt Features_opt Invariant_clause_opt Indexing_opt End Class_declaration_opt
		{
			$$ := $1
			$$.set_obsolete_message ($3)
			$$.set_creators ($4)
			$$.set_invariants ($6)
			$$.set_second_indexing ($7)
			$$.set_end_keyword ($8)
		}
	| Class_header Formal_generics_opt Obsolete_opt Inheritance_to_end
		{
			$$ := $1
			$$.set_obsolete_message ($3)
		}
	;

Creators_to_end: Creators_opt Features_opt Invariant_clause_opt Indexing_opt End Class_declaration_opt
		{
			last_class.set_creators ($1)
			last_class.set_invariants ($3)
			last_class.set_second_indexing ($4)
			last_class.set_end_keyword ($5)
		}
	;

--------------------------------------------------------------------------------

Indexing: E_INDEXING Index_list
	;

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
	| Bit_constant
		{ $$ := $1 }
	;

SS: -- Empty
	| SS Semicolon
	;

--------------------------------------------------------------------------------

Class_header: Class Identifier
		{
			$$ := new_class ($2)
			$$.set_class_keyword ($1)
			add_last_class ($$)
		}
	| E_DEFERRED Class Identifier
		{
			$$ := new_deferred_class ($3)
			$$.set_class_keyword ($2)
			add_last_class ($$)
		}
	| Expanded Class Identifier
		{
			$$ := new_expanded_class ($3)
			$$.set_class_keyword ($2)
			add_last_class ($$)
		}
	| Separate Class Identifier
		{
			$$ := new_separate_class ($3)
			$$.set_class_keyword ($2)
			add_last_class ($$)
		}
	;

--DONE------------------------------------------------------------------------------

Formal_generics_opt: -- Empty
		-- { $$ := Void }
	| Left_bracket Right_bracket
		-- Warning!
		{
			 $$ := new_formal_generics ($1, $2)
			set_formal_generic_parameters ($$)
		}
	| Left_bracket
		{ add_counter }
	  Formal_generic_list Right_bracket
		{
			$$ := $3
			$$.set_left_bracket ($1)
			$$.set_right_bracket ($4)
			remove_counter
			set_formal_generic_parameters ($$)
		}
	;

Formal_generic_list: Formal_generic
		{
			$$ := new_formal_generics_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Formal_generic Comma
		{ increment_counter }
	  Formal_generic_list
		{
			$$ := $4
			$$.put_first (new_formal_generic_comma ($1, $2))
		}
	;

Formal_generic: Identifier
		{ $$ := new_formal_generic ($1) }
	| Identifier Arrow Constraint_type
		{ $$ := new_constrained_formal_generic ($1, $2, $3, Void) }
	| Identifier Arrow Constraint_type Constraint_create
		{ $$ := new_constrained_formal_generic ($1, $2, $3, $4) }
	;

Constraint_create: Create End
		{ $$ := new_constraint_creator ($1, $2) }
	| Create
		{ add_counter }
	  Constraint_create_procedure_list End
		{
			$$ := $3
			$$.set_create_keyword ($1)
			$$.set_end_keyword ($4)
			remove_counter
		}
	;

Constraint_create_procedure_list: Identifier
		{
			$$ := new_constraint_creator_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Identifier Comma
		-- TODO: syntax error.
		{
			$$ := new_constraint_creator_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Identifier Comma 
		{ increment_counter }
	  Constraint_create_procedure_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

Constraint_type: Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| Expanded Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| Separate Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| Reference Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| Like Current
		{ $$ := new_like_current ($1, $2) }
	| Like Identifier
		{ $$ := new_like_identifier ($1, $2) }
	| Bit Integer_constant
		{ $$ := new_bit_type ($1, $2) }
	| Bit Identifier
		{ $$ := new_bit_identifier ($1, $2)  }
	;

Constraint_actual_generics_opt: -- Empty
		-- { $$ := Void }
	| Left_bracket Right_bracket
		-- Warning:
		{ $$ := new_actual_generics ($1, $2) }
	| Left_bracket
		{ add_counter }
	  Constraint_type_list Right_bracket
		{
			$$ := $3
			$$.set_left_bracket ($1)
			$$.set_right_bracket ($4)
			remove_counter
		}
	;

Constraint_type_list: Constraint_type
		{
			$$ := new_actual_generics_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Constraint_type Comma
		{ increment_counter }
	  Constraint_type_list
		{
			$$ := $4
			$$.put_first (new_type_comma ($1, $2))
		}
	;

--DONE------------------------------------------------------------------------------

Obsolete_opt: -- Empty
		-- { $$ := Void }
	| Obsolete Manifest_string
		{ $$ := new_obsolete ($1, $2) }
	;

--DONE------------------------------------------------------------------------------

Inheritance_to_end: Inherit Creators_to_end
		{
			last_class.set_parents (new_parents ($1))
		}
	| Inherit
		{ add_counter }
	  Parent_list_to_end
		{
			last_class.set_parents ($3)
			last_class.parents.set_inherit_keyword ($1)
			remove_counter
		}
	;

Parent_list_to_end: Class_name Actual_generics_opt Rename_clause New_exports_opt
	  Undefine_clause_opt Redefine_clause_opt Select_clause_opt End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, $3, $4, $5, $6, $7, $8))
		}
	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, $3, $4, $5, $6, $7, $8), $9))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, $3, $4, $5, $6, $7))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, $3, $4, $5, $6, $7), $8))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt
	  Select_clause_opt End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, $3, $4, $5, $6))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt
	  Select_clause_opt End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, $3, $4, $5, $6), $7))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, $3, $4, $5))
		}
	| Class_name Actual_generics_opt Redefine_clause
	  Select_clause_opt End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, $3, $4, $5), $6))
		}
	| Class_name Actual_generics_opt Select_clause End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, $3, $4))
		}
	| Class_name Actual_generics_opt Select_clause End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, $3, $4), $5))
		}
	| Class_name Actual_generics_opt End Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
		}
	| Class_name Actual_generics_opt End Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, $3), $4))
		}
	| Class_name Actual_generics_opt Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, Void))
		}
	| Class_name Actual_generics_opt Semicolon Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, Void), $3))
		}
	| Class_name Actual_generics_opt End Indexing End Class_declaration_opt
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
			last_class.set_second_indexing ($4)
			last_class.set_end_keyword ($5)
		}
	| Class_name Actual_generics_opt End Class_declaration_opt
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, Void))
			last_class.set_end_keyword ($3)
		}

	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $10
			$$.put_first (new_parent ($1, $2, $3, $4, $5, $6, $7, $8))
		}
	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $11
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, $3, $4, $5, $6, $7, $8), $9))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $9
			$$.put_first (new_parent ($1, $2, Void, $3, $4, $5, $6, $7))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $10
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, $3, $4, $5, $6, $7), $8))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt Select_clause_opt End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $8
			$$.put_first (new_parent ($1, $2, Void, Void, $3, $4, $5, $6))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt Select_clause_opt End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $9
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, $3, $4, $5, $6), $7))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $7
			$$.put_first (new_parent ($1, $2, Void, Void, Void, $3, $4, $5))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $8
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, $3, $4, $5), $6))
		}
	| Class_name Actual_generics_opt Select_clause End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $6
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, $3, $4))
		}
	| Class_name Actual_generics_opt Select_clause End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $7
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, $3, $4), $5))
		}
	| Class_name Actual_generics_opt End
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $5
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
		}
	| Class_name Actual_generics_opt End Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $6
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, $3), $4))
		}
	| Class_name Actual_generics_opt
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $4
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, Void))
		}
	| Class_name Actual_generics_opt Semicolon
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $5
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, Void), $3))
		}
	;

		-- Note: The two constructs above are a workaround to solve
		-- the following grammar ambiguity:
		--		class FOO inherit BAR end
		-- where, through shift/reduce conflicts, would have
		-- been parsed with 'end' being recognized as the
		-- end of the feature adaptation of BAR instead of
		-- as the end of the class FOO.

--DONE------------------------------------------------------------------------------

Rename_clause: Rename
		{ $$ := new_renames ($1) }
	| Rename
		{ add_counter}
	  Rename_list
		{
			$$ := $3
			$$.set_rename_keyword ($1)
			remove_counter
		}
	;

Rename_list: Feature_name As Feature_name
		{
			$$ := new_renames_with_capacity (counter_value + 1)
			$$.put_first (new_rename ($1, $2, $3))
		}
	| Feature_name As Feature_name Comma
		-- TODO: syntax error
		{
			$$ := new_renames_with_capacity (counter_value + 1)
			$$.put_first (new_rename_comma ($1, $2, $3, $4))
		}
	| Feature_name As Feature_name Comma 
		{ increment_counter }
	  Rename_list
		{
			$$ := $6
			$$.put_first (new_rename_comma ($1, $2, $3, $4))
		}
	;

--DONE------------------------------------------------------------------------------

New_exports: Export
		{ $$ := new_exports ($1) }
	| Export
		{ add_counter }
	  New_export_list
		{
			$$ := $3
			$$.set_export_keyword ($1)
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
			$$ := new_exports_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Semicolon
		-- TODO: syntax error
		{
			if keep_all_breaks then
				$$ := new_exports_with_capacity (counter_value + 1)
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
				$$ := new_exports_with_capacity (counter_value + 1)
				$$.put_first ($1)
			else
				$$ := new_exports_with_capacity (counter_value)
			end
		}
	| New_export_item
		{ increment_counter }
	  New_export_list
		{
			$$ := $3
			$$.put_first ($1)
		}
	| Semicolon
		{
			if keep_all_breaks then
				increment_counter
			elseif keep_all_comments and $1.has_comment then
				increment_counter
			end
		}
	  New_export_list
		{
			$$ := $3
			if keep_all_breaks then
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
				$$.put_first ($1)
			end
		}
	;

New_export_item: Clients All
		{
			$$ := new_all_export ($1, $2)
		}
	| New_feature_export
		{
			$$ := $1
		}
	;
	
New_feature_export: Clients 
		{ add_counter }
	  Export_feature_name_list
		{
			$$ := $3
			$$.set_clients_clause ($1)
			remove_counter
		}
	;

Export_feature_name_list: Feature_name
		{
			$$ := new_feature_export_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Feature_name Comma
		-- TODO: syntax error.
		{
			$$ := new_feature_export_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name Comma 
		{ increment_counter }
	  Export_feature_name_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

--DONE------------------------------------------------------------------------------

Clients: Left_brace
		{ add_counter }
	  Client_list Right_brace
		{
			$$ := $3
			$$.set_left_brace ($1)
			$$.set_right_brace ($4)
			remove_counter
		}
	| Left_brace Right_brace
		{ $$ := new_none_clients ($1, $2) }
	;

Clients_opt: -- Empty
		-- { $$ := Void }
	| Clients
		{ $$ := $1 }
	;

Client_list: Identifier
		{
			$$ := new_clients_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Identifier Comma
		-- Syntax error
		{
			$$ := new_clients_with_capacity (counter_value + 1)
			$$.put_first (new_class_name_comma ($1, $2) )
		}
	| Identifier Comma
		{ increment_counter }
	  Client_list
		{
			$$ := $4
			$$.put_first (new_class_name_comma ($1, $2))
		}
	| Identifier
		{ increment_counter }
	  Client_list
		-- Syntax error
		{
			$$ := $3
			$$.put_first ($1)
		}
	;

--DONE------------------------------------------------------------------------------

Redefine_clause: Redefine
		{ $$ := new_keyword_feature_name_list ($1) }
	| Redefine
		{ add_counter }
	  Keyword_feature_name_list
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Redefine_clause_opt: -- Empty
		-- { $$ := Void }
	| Redefine_clause
		{ $$ := $1 }
	;

Undefine_clause: Undefine
		{ $$ := new_keyword_feature_name_list ($1) }
	| Undefine
		{ add_counter }
	  Keyword_feature_name_list
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Undefine_clause_opt: -- Empty
		-- { $$ := Void }
	| Undefine_clause
		{ $$ := $1 }
	;

Select_clause: Select
		{ $$ := new_keyword_feature_name_list ($1) }
	| Select
		{ add_counter }
	  Keyword_feature_name_list
		{
			$$ := $3
			$$.set_keyword ($1)
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
			$$ := new_keyword_feature_name_list_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Feature_name Comma
		-- TODO: syntax error.
		{
			$$ := new_keyword_feature_name_list_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name Comma 
		{ increment_counter }
	  Keyword_feature_name_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

--DONE------------------------------------------------------------------------------

Creators_opt: -- Empty
		-- { $$ := Void }
	| { add_counter } Creators
		{
			$$ := $2
			remove_counter
		}
	;

Creators: Creation_clause
		{ $$ := new_creators_with_capacity ($1, counter_value + 1) }
	| Creation_clause
		{ increment_counter}
	  Creators
		{
			$$ := $3
			$$.put_first ($1)
		}
	;

Creation_clause: Creation Clients_opt
		{
			if $2 = Void then
				$$ := new_creator ($1, new_any_clients ($1.position))
			else
				$$ := new_creator ($1, $2)
			end
		}
	| Creation Clients_opt
		{ add_counter }
	  Creation_procedure_list
		{
			$$ := $4
			if $2 = Void then
				$$.set_clients (new_any_clients ($1.position))
			else
				$$.set_clients ($2)
			end
			$$.set_creation_keyword ($1)
			remove_counter
		}
	| Create Clients_opt
		{
			if $2 = Void then
				$$ := new_creator ($1, new_any_clients ($1.position))
			else
				$$ := new_creator ($1, $2)
			end
		}
	| Create Clients_opt
		{ add_counter }
	  Creation_procedure_list
		{
			$$ := $4
			if $2 = Void then
				$$.set_clients (new_any_clients ($1.position))
			else
				$$.set_clients ($2)
			end
			$$.set_creation_keyword ($1)
			remove_counter
		}
	;

		-- Note: Does not support 'Header_comment'.

Creation_procedure_list: Identifier
		{
			$$ := new_creator_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Identifier Comma
		-- TODO: syntax error.
		{
			$$ := new_creator_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Identifier Comma 
		{ increment_counter }
	  Creation_procedure_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
	| Features
	;
	
Features: Feature_clause
	| Features Feature_clause
	;

Feature_clause: E_FEATURE Clients_opt
			{
				if $2 = Void then
					if new_any_clients ($1.position) = Void then end
				end
			}
		Feature_declaration_list
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
		{ $$ := new_constant_attribute ($1, $2, $4, $6) }
	;

Unique_declaration: Feature_name Formal_arguments_opt ':' Type E_IS E_UNIQUE
		{ $$ := new_unique_attribute ($1, $2, $4) }
	;

Do_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt End
		{ $$ := new_do_procedure ($1, $2, $4, $5, $6, $7, $8, $9) }
	;

Once_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt End
		{ $$ := new_once_procedure ($1, $2, $4, $5, $6, $7, $8, $9) }
	;

Deferred_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt End
		{ $$ := new_deferred_procedure ($1, $2, $4, $5, $7) }
	;

External_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt End
		{ $$ := new_external_procedure ($1, $2, $4, $5, $7, $8, $9) }
	;

Do_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt End
		{ $$ := new_do_function ($1, $2, $4, $6, $7, $8, $9, $10, $11) }
	;

Once_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt End
		{ $$ := new_once_function ($1, $2, $4, $6, $7, $8, $9, $10, $11) }
	;

Deferred_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt End
		{ $$ := new_deferred_function ($1, $2, $4, $6, $7, $9) }
	;

External_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt End
		{ $$ := new_external_function ($1, $2, $4, $6, $7, $9, $10, $11) }
	;

External_name_opt: -- Empty
		-- { $$ := Void }
	| E_ALIAS Manifest_string
		{ $$ := $2 }
	;

--DONE------------------------------------------------------------------------------

Feature_name: Identifier
		{ $$ := $1 }
	| E_PREFIX Break_opt E_STRNOT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_prefix_not_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRPLUS Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_prefix_plus_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRMINUS Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_prefix_minus_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRFREEOP Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_prefix_free_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRPLUS Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_plus_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRMINUS Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_minus_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRSTAR Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_times_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRSLASH Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_divide_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRDIV Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_div_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRMOD Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_mod_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRPOWER Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_power_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRLT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_lt_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRLE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_le_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRGT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_gt_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRGE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_ge_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRAND Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_and_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRANDTHEN Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_and_then_name ($1, $3)
		}
	| E_INFIX Break_opt E_STROR Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_or_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRORELSE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_or_else_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRIMPLIES Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_implies_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRXOR Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_xor_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRFREEOP Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_infix_free_name ($1, $3)
		}

	| E_PREFIX Break_opt E_STRING Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRSTAR Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRSLASH Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRDIV Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRMOD Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRPOWER Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRLT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRLE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRGT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRGE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRAND Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STROR Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRXOR Break_opt
		{
			$1.set_break ($2)
			$3.set_break ($4)
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRANDTHEN Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRORELSE Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_PREFIX Break_opt E_STRIMPLIES Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_prefix_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRING Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_infix_name ($1, $3)
		}
	| E_INFIX Break_opt E_STRNOT Break_opt
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
				$3.set_break ($4)
			end
			$$ := new_invalid_infix_name ($1, $3)
		}
	;

--DONE------------------------------------------------------------------------------

Formal_arguments_opt: -- Empty
		-- { $$ := Void }
	| Left_parenthesis Right_parenthesis
		{ $$ := new_formal_arguments ($1, $2) }
	| Left_parenthesis
		{ add_counter }
	  Formal_argument_list Right_parenthesis
		{
			$$ := $3
			$$.set_left_parenthesis ($1)
			$$.set_right_parenthesis ($4)
			remove_counter
		}
	;

Formal_argument_list: Identifier Colon Type
		{
			$$ := new_formal_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_colon_formal_argument (new_argument_name_colon ($1, $2), $3))
		}
	| Identifier Colon Type Semicolon
		{
			$$ := new_formal_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_formal_argument_semicolon (new_colon_formal_argument (new_argument_name_colon ($1, $2), $3), $4))
		}
	| Identifier Comma
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $4
			$$.put_first (new_comma_formal_argument (new_argument_name_comma ($1, $2), $$.item (1).type))
		}
	| Identifier
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $3
			$$.put_first (new_comma_formal_argument ($1, $$.item (1).type))
		}
	| Identifier Colon Type Semicolon
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $6
			$$.put_first (new_formal_argument_semicolon (new_colon_formal_argument (new_argument_name_colon ($1, $2), $3), $4))
		}
	| Identifier Colon Type
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $5
			$$.put_first (new_colon_formal_argument (new_argument_name_colon ($1, $2), $3))
		}
	;

--DONE------------------------------------------------------------------------------

Local_declarations_opt: -- Empty
		-- { $$ := Void }
	| Local
		{ $$ := new_local_variables ($1) }
	| Local
		{ add_counter}
	  Local_variable_list
		{
			$$ := $3
			$$.set_local_keyword ($1)
			remove_counter
		}
	;

Local_variable_list: Identifier Colon Type
		{
			$$ := new_local_variables_with_capacity (counter_value + 1)
			$$.put_first (new_colon_local_variable (new_local_name_colon ($1, $2), $3))
		}
	| Identifier Colon Type Semicolon
		{
			$$ := new_local_variables_with_capacity (counter_value + 1)
			$$.put_first (new_local_variable_semicolon (new_colon_local_variable (new_local_name_colon ($1, $2), $3), $4))
		}
	| Identifier Comma
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $4
			$$.put_first (new_comma_local_variable (new_local_name_comma ($1, $2), $$.item (1).type))
		}
	| Identifier
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $3
			$$.put_first (new_comma_local_variable ($1, $$.item (1).type))
		}
	| Identifier Colon Type Semicolon
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $6
			$$.put_first (new_local_variable_semicolon (new_colon_local_variable (new_local_name_colon ($1, $2), $3), $4))
		}
	| Identifier Colon Type
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $5
			$$.put_first (new_colon_local_variable (new_local_name_colon ($1, $2), $3))
		}
	;

--DONE------------------------------------------------------------------------------

Assertions: Expression
		{ add_expression_assertion ($1, Void) }
	| Expression Semicolon
		{ add_expression_assertion ($1, $2) }
	| Identifier Colon
		{ add_tagged_assertion ($1, $2, Void) }
	| Identifier Colon Semicolon
		{ add_tagged_assertion ($1, $2, $3) }
	| Assertions Expression
		{ add_expression_assertion ($2, Void) }
	| Assertions Expression Semicolon
		{ add_expression_assertion ($2, $3) }
	| Assertions Identifier Colon
		{ add_tagged_assertion ($2, $3, Void) }
	| Assertions Identifier Colon Semicolon
		{ add_tagged_assertion ($2, $3, $4) }
	;

Precondition_opt: -- Empty
		-- { $$ := Void }
	| Require
		{ $$ := new_preconditions ($1, Void) }
	| Require Else
		{ $$ := new_preconditions ($1, $2) }
	| Require Assertions
		{ $$ := new_preconditions ($1, Void) }
	| Require Else Assertions
		{ $$ := new_preconditions ($1, $2) }
	;

Postcondition_opt: -- Empty
		-- { $$ := Void }
	| Ensure
		{ $$ := new_postconditions ($1, Void) }
	| Ensure Then
		{ $$ := new_postconditions ($1, $2) }
	| Ensure Assertions
		{ $$ := new_postconditions ($1, Void) }
	| Ensure Then Assertions
		{ $$ := new_postconditions ($1, $2) }
	;

Invariant_clause_opt: -- Empty
		-- { $$ := Void }
	| Invariant
		{ $$ := new_invariants ($1) }
	| Invariant Assertions
		{ $$ := new_invariants ($1) }
	;

Variant_clause_opt: -- Empty
		-- { $$ := Void }
	| Variant -- Not standard.
		{ $$ := new_variant ($1) }
	| Variant Expression
		{ $$ := new_expression_variant ($1, $2) }
	| Variant Identifier Colon Expression
		{ $$ := new_tagged_expression_variant ($1, $2, $3, $4) }
	;

--DONE------------------------------------------------------------------------------

Rescue_opt: -- Empty
		-- { $$ := Void }
	| Rescue_compound
		{ $$ := $1 }
	;

--DONE------------------------------------------------------------------------------

Type: Class_name Actual_generics_opt
		{ $$ := new_named_type (Void, $1, $2) }
	| Expanded Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| Separate Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| Reference Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| Like Current
		{ $$ := new_like_current ($1, $2) }
	| Like Identifier
		{ $$ := new_like_identifier ($1, $2) }
	| Bit Integer_constant
		{ $$ := new_bit_type ($1, $2) }
	| Bit Identifier
		{ $$ := new_bit_identifier ($1, $2)  }
	;

Class_name: E_IDENTIFIER
		{ $$ := $1 }
	| E_IDENTIFIER E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Actual_generics_opt: -- Empty
		-- { $$ := Void }
	| Actual_generics
		{ $$ := $1 }
	;

Actual_generics: Left_bracket Right_bracket
		-- Warning:
		{ $$ := new_actual_generics ($1, $2) }
	| Left_bracket
		{ add_counter }
	  Type_list Right_bracket
		{
			$$ := $3
			$$.set_left_bracket ($1)
			$$.set_right_bracket ($4)
			remove_counter
		}
	;

Type_list: Type
		{
			$$ := new_actual_generics_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Type Comma
		{ increment_counter }
	  Type_list
		{
			$$ := $4
			$$.put_first (new_type_comma ($1, $2))
		}
	;

--DONE------------------------------------------------------------------------------

Do_compound: Do
		{ $$ := new_compound ($1) }
	| Do
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Once_compound: Once
		{ $$ := new_compound ($1) }
	| Once
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Then_compound: Then
		{ $$ := new_compound ($1) }
	| Then
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Else_compound: Else
		{ $$ := new_compound ($1) }
	| Else
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Rescue_compound: Rescue
		{ $$ := new_compound ($1) }
	| Rescue
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

From_compound: From
		{ $$ := new_compound ($1) }
	| From
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Loop_compound: Loop
		{ $$ := new_compound ($1) }
	| Loop
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Compound: Instruction
		{
			$$ := new_compound_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Semicolon
		{
			if keep_all_breaks then
				$$ := new_compound_with_capacity (counter_value + 1)
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
				$$ := new_compound_with_capacity (counter_value + 1)
				$$.put_first ($1)
			else
				$$ := new_compound_with_capacity (counter_value)
			end
		}
	| Instruction
		{ increment_counter }
	  Compound
		{
			$$ := $3
			$$.put_first ($1)
		}
	| Semicolon
		{
			if keep_all_breaks then
				increment_counter
			elseif keep_all_comments and $1.has_comment then
				increment_counter
			end
		}
	  Compound
		{
			$$ := $3
			if keep_all_breaks then
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
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
	| Writable Assign Expression
		{ $$ := new_assignment ($1, $2, $3) }
 	| Writable Reverse Expression
		{ $$ := new_assignment_attempt ($1, $2, $3) }
	| Conditional
		{ $$ := $1 }
	| Multi_branch
		{ $$ := $1 }
	| From_compound Invariant_clause_opt Variant_clause_opt
	  Until Expression Loop_compound End
		{ $$ := new_loop_instruction ($1, $2, $3, $4, $5, $6, $7) }
	| Debug_instruction
		{ $$ := $1 }
	| Check End
		{ $$ := new_check_instruction ($1, $2) }
	| Check Assertions End
		{ $$ := new_check_instruction ($1, $3) }
	| Retry
		{ $$ := $1 }
	;

--DONE------------------------------------------------------------------------------

Creation_instruction: Bang Type Bang Writable
		{ $$ := new_typed_bang_instruction ($1, $2, $3, $4) }
	| Bang Type Bang Writable Dot Identifier Actuals_opt
		{ $$ := new_qualified_typed_bang_instruction ($1, $2, $3, $4, $5, $6, $7) }
	| Bangbang Writable
		{ $$ := new_bang_instruction ($1, $2) }
	| Bangbang Writable Dot Identifier Actuals_opt
		{ $$ := new_qualified_bang_instruction ($1, $2, $3, $4, $5) }
	;

Create_instruction: Create Left_brace Type Right_brace Writable
		{ $$ := new_typed_create_instruction ($1, $2, $3, $4, $5) }
	| Create Left_brace Type Right_brace Writable Dot Identifier Actuals_opt
		{ $$ := new_qualified_typed_create_instruction ($1, $2, $3, $4, $5, $6, $7, $8) }
	| Create Writable
		{ $$ := new_create_instruction ($1, $2) }
	| Create Writable Dot Identifier Actuals_opt
		{ $$ := new_qualified_create_instruction ($1, $2, $3, $4, $5) }
	;

Create_expression: Create Left_brace Type Right_brace 
		{ $$ := new_create_expression ($1, $2, $3, $4) }
	| Create Left_brace Type Right_brace Dot Identifier Actuals_opt
		{ $$ := new_qualified_create_expression ($1, $2, $3, $4, $5, $6, $7) }
	;

--DONE------------------------------------------------------------------------------

Conditional: If Expression Then_compound End
		{ $$ := new_if_instruction ($1, $2, $3, $4) }
	| If Expression Then_compound Else_compound End
		{
			$$ := new_if_instruction ($1, $2, $3, $5)
			$$.set_else_compound ($4)
		}
	| If Expression Then_compound Elseif_list End
		{
			$$ := new_if_instruction ($1, $2, $3, $5)
			$$.set_elseif_parts ($4)
		}
	| If Expression Then_compound Elseif_list Else_compound End
		{
			$$ := new_if_instruction ($1, $2, $3, $6)
			$$.set_elseif_parts ($4)
			$$.set_else_compound ($5)
		}
	;

Elseif_list: {add_counter} Elseif_part_list
		{
			$$ := $2
			remove_counter
		}
	;

Elseif_part_list: Elseif Expression Then_compound
		{
			$$ := new_elseif_part_list_with_capacity (new_elseif_part ($1, $2, $3), counter_value + 1)
		}
	| Elseif Expression Then_compound
		{ increment_counter }
	  Elseif_part_list
		{
			$$ := $5
			$$.put_first (new_elseif_part ($1, $2, $3))
		}
	;

--DONE------------------------------------------------------------------------------

Multi_branch: Inspect Expression When_list_opt Else_compound End
		{
			$$ := new_inspect_instruction ($1, $2, $5)
			$$.set_when_parts ($3)
			$$.set_else_compound ($4)
		}
	| Inspect Expression When_list_opt End
		{
			$$ := new_inspect_instruction ($1, $2, $4)
			$$.set_when_parts ($3)
		}
	;

When_list_opt: -- Empty
		-- { $$ := Void }
	|
		{ add_counter }
	  When_list
		{
			$$ := $2
			remove_counter
		}
	;

When_list: When Choices_opt Then_compound
		{
			$$ := new_when_part_list_with_capacity (new_when_part ($1, $2, $3), counter_value + 1)
		}
	| When Choices_opt Then_compound
		{ increment_counter }
	  When_list
		{
			$$ := $5
			$$.put_first (new_when_part ($1, $2, $3))
		}
	;

Choices_opt: -- Empty
		-- { $$ := Void }
	|
		{ add_counter }
	  Choices
		{
			$$ := $2
			remove_counter
		}
	;

Choices: Choice
		{
			$$ := new_choice_list_with_capacity ($1, counter_value + 1)
		}
	| Choice Comma
		-- TODO: syntax error.
		{
			$$ := new_choice_list_with_capacity (new_choice_comma ($1, $2), counter_value + 1)
		}
	| Choice Comma 
		{ increment_counter }
	  Choices
		{
			$$ := $4
			$$.put_first (new_choice_comma ($1, $2))
		}
	;

Choice: Choice_constant
		{ $$ := $1 }
	| Choice_constant Dotdot Choice_constant
		{ $$ := new_choice_range ($1, $2, $3) }
	;

Choice_constant: Integer_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
		-- For Visual Eiffel and TowerEiffel (not standard Eiffel,
		-- should be 'Identifier' instead of 'Call_expression'):
	| Call_expression
		{ $$ := $1 }
	;

--DONE------------------------------------------------------------------------------

Debug_instruction: Debug Debug_keys End
		{ $$ := new_debug_instruction ($1, $2, $3) }
	|  Debug Debug_keys
		{ add_counter }
	  Debug_compound End
		{
			$$ := $4
			$$.set_keys ($2)
			$$.set_debug_keyword ($1)
			$$.set_end_keyword ($5)
			remove_counter
		}
	;

Debug_compound: Instruction
		{
			$$ := new_debug_instruction_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Semicolon
		{
			if keep_all_breaks then
				$$ := new_debug_instruction_with_capacity (counter_value + 1)
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
				$$ := new_debug_instruction_with_capacity (counter_value + 1)
				$$.put_first ($1)
			else
				$$ := new_debug_instruction_with_capacity (counter_value)
			end
		}
	| Instruction
		{ increment_counter }
	  Debug_compound
		{
			$$ := $3
			$$.put_first ($1)
		}
	| Semicolon
		{
			if keep_all_breaks then
				increment_counter
			elseif keep_all_comments and $1.has_comment then
				increment_counter
			end
		}
	  Debug_compound
		{
			$$ := $3
			if keep_all_breaks then
				$$.put_first ($1)
			elseif keep_all_comments and $1.has_comment then
				$$.put_first ($1)
			end
		}
	;

Debug_keys: -- Empty
		-- { $$ := Void }
	| Left_parenthesis Right_parenthesis
		{ $$ := new_debug_keys ($1, $2) }
	| Left_parenthesis
		{ add_counter }
	  Debug_key_list Right_parenthesis
		{
			$$ := $3
			$$.set_left_parenthesis ($1)
			$$.set_right_parenthesis ($4)
			remove_counter
		}
	;

Debug_key_list: Manifest_string
		{
			$$ := new_debug_keys_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Manifest_string Comma
		{ increment_counter }
	  Debug_key_list
		{
			$$ := $4
			$$.put_first (new_manifest_string_comma ($1, $2))
		}
	;

--DONE------------------------------------------------------------------------------

Call_instruction: Identifier Actuals_opt
		{ $$ := new_call_instruction ($1, $2) }
	| Call_chain Dot Identifier Actuals_opt
		{ $$ := new_qualified_call_instruction ($1, $2, $3, $4) }
	| Precursor Actuals_opt
		{ $$ := new_precursor_instruction ($1, $2) }
	| Qualified_precursor_instruction
		{ $$ := $1 }
	;

Qualified_precursor_instruction: Precursor Left_brace Class_name Right_brace Actuals_opt
		{
			$$ := new_qualified_precursor_instruction ($2, $3, $4, $1, $5)
			$$.set_parent_prefixed (False)
		}
	| Left_brace Class_name Right_brace Precursor Actuals_opt
		{
			$$ := new_qualified_precursor_instruction ($1, $2, $3, $4, $5)
			$$.set_parent_prefixed (True)
		}
	;

Call_expression: Identifier Actuals_opt
		{ $$ := new_call_expression ($1, $2) }
	| Call_chain Dot Identifier Actuals_opt
		{ $$ := new_qualified_call_expression ($1, $2, $3, $4) }
	;

Precursor_expression: Precursor Actuals_opt
		{ $$ := new_precursor_expression ($1, $2) }
	| Qualified_precursor_expression
		{ $$ := $1 }
	;

Qualified_precursor_expression: Precursor Left_brace Class_name Right_brace Actuals_opt
		{
			$$ := new_qualified_precursor_expression ($2, $3, $4, $1, $5)
			$$.set_parent_prefixed (False)
		}
	| Left_brace Class_name Right_brace Precursor Actuals_opt
		{
			$$ := new_qualified_precursor_expression ($1, $2, $3, $4, $5)
			$$.set_parent_prefixed (True)
		}
	;

Call_chain: Identifier Actuals_opt
		{ $$ := new_call_expression ($1, $2) }
	| Result
		{ $$ := $1 }
	| Current
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Call_chain Dot Identifier Actuals_opt
		{ $$ := new_qualified_call_expression ($1, $2, $3, $4) }
	;

--DONE------------------------------------------------------------------------------

Actuals_opt: -- Empty
		-- { $$ := Void }
	| Left_parenthesis Right_parenthesis
		{ $$ := new_actual_arguments ($1, $2) }
	| Left_parenthesis
		{ add_counter }
	  Actuals_expression_list Right_parenthesis
		{
			$$ := $3
			$$.set_left_symbol ($1)
			$$.set_right_symbol ($4)
			remove_counter
		}
	;

Actuals_expression_list: Expression
		{
			$$ := new_actual_arguments_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Expression Comma
		-- TODO: syntax error.
		{
			$$ := new_actual_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression Comma 
		{ increment_counter }
	  Actuals_expression_list
		{
			$$ := $4
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression
		{ increment_counter }
	  Actuals_expression_list
		-- TODO: syntax error.
		{
			$$ := $3
			$$.put_first ($1)
		}
	;

Address_mark: Dollar Feature_name
		{ $$ := new_feature_address ($1, $2) }
	| Dollar Current
		{ $$ := new_current_address ($1, $2) }
	| Dollar Result
		{ $$ := new_result_address ($1, $2) }
		-- Note: The following construct is an
		-- extension of the Eiffel syntax provided
		-- in ISE Eiffel and Halstenbach compilers.
	| Dollar Parenthesized_expression
		{ $$ := new_expression_address ($1, $2) }
	;

Writable: Identifier
		{ $$ := $1 }
	| Result
		{ $$ := $1 }
	;

--DONE------------------------------------------------------------------------------

Expression: Call_expression
		{ $$ := $1 }
	| Call_agent
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Create_expression
		{ $$ := $1 }
	| Result
		{ $$ := $1 }
	| Current
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Boolean_constant
		{ $$ := $1 }
	| Character_constant
		{ $$ := $1 }
	| E_INTEGER
		{ $$ := $1 }
	| E_INTEGER E_BREAK
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := $1
		}
	| E_REAL
		{ $$ := $1 }
	| E_REAL E_BREAK
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := $1
		}
	| Manifest_string
		{ $$ := $1 }
	| Once Manifest_string
		{
				-- TODO:
			$$ := $2
		}
	| Bit_constant
		{ $$ := $1 }
	| Manifest_array
		{ $$ := $1 }
	| Manifest_tuple
		{ $$ := $1 }
	| '+' Break_opt Expression %prec E_NOT
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_prefix_expression ($1, $3)
		}
	| '-' Break_opt Expression %prec E_NOT
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_prefix_expression ($1, $3)
		}
	| E_NOT Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_prefix_expression ($1, $3)
		}
	| E_FREEOP Break_opt Expression %prec E_NOT
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_prefix_expression ($1, $3) }
	| Expression E_FREEOP Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '+' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '-' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '*' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '/' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '^' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_DIV Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_MOD Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '=' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_equality_expression ($1, $2, $4)
		}
	| Expression E_NE Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_equality_expression ($1, $2, $4)
		}
	| Expression '<' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression '>' Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_LE Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_GE Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_AND Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_OR Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_XOR Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| Expression E_AND Break_opt E_THEN Break_opt Expression %prec E_AND
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
				$4.set_break ($5)
			end
			$$ := new_infix_expression ($1, new_infix_and_then_operator ($2, $4), $6)
		}
	| Expression E_OR Break_opt E_ELSE Break_opt Expression %prec E_OR
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
				$4.set_break ($5)
			end
			$$ := new_infix_expression ($1, new_infix_or_else_operator ($2, $4), $6)
		}
	| Expression E_IMPLIES Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$2.set_break ($3)
			end
			$$ := new_infix_expression ($1, $2, $4)
		}
	| E_OLD Break_opt Expression
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_old_expression ($1, $3)
		}
	| Strip_expression
		{ $$ := $1 }
	| Address_mark
		{ $$ := $1 }
	;

Parenthesized_expression: Left_parenthesis Expression Right_parenthesis
		{ $$ := new_parenthesized_expression ($1, $2, $3) }
	;

Manifest_array: Left_array Right_array
		{ $$ := new_manifest_array ($1, $2) }
	| Left_array
		{ add_counter }
	  Manifest_array_expression_list Right_array
		{
			$$ := $3
			$$.set_left_symbol ($1)
			$$.set_right_symbol ($4)
			remove_counter
		}
	;

Manifest_array_expression_list: Expression
		{
			$$ := new_manifest_array_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Expression Comma
		-- TODO: syntax error.
		{
			$$ := new_manifest_array_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression Comma 
		{ increment_counter }
	  Manifest_array_expression_list
		{
			$$ := $4
			$$.put_first (new_expression_comma ($1, $2))
		}
	;

Manifest_tuple: Left_bracket Right_bracket
		{ $$ := new_manifest_tuple ($1, $2) }
	| Left_bracket
		{ add_counter }
	  Manifest_tuple_expression_list Right_bracket
		{
			$$ := $3
			$$.set_left_symbol ($1)
			$$.set_right_symbol ($4)
			remove_counter
		}
	;

Manifest_tuple_expression_list: Expression
		{
			$$ := new_manifest_tuple_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Expression Comma
		-- TODO: syntax error.
		{
			$$ := new_manifest_tuple_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression Comma 
		{ increment_counter }
	  Manifest_tuple_expression_list
		{
			$$ := $4
			$$.put_first (new_expression_comma ($1, $2))
		}
	;

Strip_expression: E_STRIP Break_opt Left_parenthesis Right_parenthesis
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := new_strip_expression ($1, $3, $4)
		}
	| E_STRIP Break_opt Left_parenthesis
		{ add_counter }
	  Strip_feature_name_list Right_parenthesis
		{
			if keep_all_breaks or keep_all_comments then
				$1.set_break ($2)
			end
			$$ := $5
			$$.set_strip_keyword ($1)
			$$.set_left_parenthesis ($3)
			$$.set_right_parenthesis ($6)
			remove_counter
		}
	;

Strip_feature_name_list: Feature_name
		{
			$$ := new_strip_expression_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Feature_name Comma
		-- TODO: syntax error.
		{
			$$ := new_strip_expression_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name Comma 
		{ increment_counter }
	  Strip_feature_name_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
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
	| Bit_constant
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Call_agent: Agent Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| Agent Identifier Dot Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| Agent Parenthesized_expression Dot Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| Agent Left_brace Type Right_brace Dot Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	;

Agent_actuals_opt: -- Empty
		-- { $$ := Void }
	| Left_parenthesis Right_parenthesis
		-- { $$ := new_actual_arguments ($1, $2) }
	| Left_parenthesis
		-- { add_counter }
	  Agent_actual_list Right_parenthesis
		-- {
			-- $$ := $3
			-- $$.set_left_symbol ($1)
			-- $$.set_right_symbol ($4)
			-- remove_counter
		-- }
	;

Agent_actual_list: Agent_actual
		--{
			--$$ := new_actual_arguments_with_capacity (counter_value + 1)
			--$$.put_first ($1)
		--}
	| Agent_actual Comma
		-- TODO: syntax error.
		--{
			--$$ := new_actual_arguments_with_capacity (counter_value + 1)
			--$$.put_first (new_expression_comma ($1, $2))
		--}
	| Agent_actual Comma 
		--{ increment_counter }
	  Agent_actual_list
		--{
			--$$ := $4
			--$$.put_first (new_expression_comma ($1, $2))
		--}
	| Agent_actual
		--{ increment_counter }
	  Agent_actual_list
		-- TODO: syntax error.
		--{
			--$$ := $3
			--$$.put_first ($1)
		--}
	;

Agent_actual: Expression
	| Question_mark
	| Left_brace Class_name Right_brace
		-- TODO:
		--{ $$ := new_named_type (Void, $1, $2) }
	| Left_brace Class_name Actual_generics Right_brace
		-- TODO:
		--{ $$ := new_named_type (Void, $1, $2) }
	| Left_brace Expanded Class_name Actual_generics_opt Right_brace
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| Left_brace Separate Class_name Actual_generics_opt Right_brace
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| Left_brace Reference Class_name Actual_generics_opt Right_brace
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| Left_brace Like Current Right_brace
		-- TODO:
		--{ $$ := new_like_current ($1, $2) }
	| Left_brace Like Identifier Right_brace
		-- TODO:
		--{ $$ := new_like_identifier ($1, $2) }
	| Left_brace Bit Integer_constant Right_brace
		-- TODO:
		--{ $$ := new_bit_type ($1, $2) }
	| Left_brace Bit Identifier Right_brace
		-- TODO:
		--{ $$ := new_bit_identifier ($1, $2)  }
	;

--DONE------------------------------------------------------------------------------

Manifest_string: E_STRING
		{ $$ := $1 }
	| E_STRING E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRPLUS
		{ $$ := $1 }
	| E_STRPLUS E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRMINUS
		{ $$ := $1 }
	| E_STRMINUS E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRSTAR
		{ $$ := $1 }
	| E_STRSTAR E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRSLASH
		{ $$ := $1 }
	| E_STRSLASH E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRDIV
		{ $$ := $1 }
	| E_STRDIV E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRMOD
		{ $$ := $1 }
	| E_STRMOD E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRPOWER
		{ $$ := $1 }
	| E_STRPOWER E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRLT
		{ $$ := $1 }
	| E_STRLT E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRLE
		{ $$ := $1 }
	| E_STRLE E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRGT
		{ $$ := $1 }
	| E_STRGT E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRGE
		{ $$ := $1 }
	| E_STRGE E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRAND
		{ $$ := $1 }
	| E_STRAND E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STROR
		{ $$ := $1 }
	| E_STROR E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRXOR
		{ $$ := $1 }
	| E_STRXOR E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRANDTHEN
		{ $$ := $1 }
	| E_STRANDTHEN E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRORELSE
		{ $$ := $1 }
	| E_STRORELSE E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRIMPLIES
		{ $$ := $1 }
	| E_STRIMPLIES E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRFREEOP
		{ $$ := $1 }
	| E_STRFREEOP E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRNOT
		{ $$ := $1 }
	| E_STRNOT E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_STRERR
		{ abort }
	;

Bit_constant: E_BIT
		{ $$ := $1 }
	| E_BIT E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Character_constant: E_CHARACTER
		{ $$ := $1 }
	| E_CHARACTER E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_CHARERR
		{ abort }
	;

Boolean_constant: E_TRUE
		{ $$ := $1 }
	| E_TRUE E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_FALSE
		{ $$ := $1 }
	| E_FALSE E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Integer_constant: E_INTEGER
		{ $$ := $1 }
	| E_INTEGER E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| Minus_sign E_INTEGER
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| Minus_sign E_INTEGER E_BREAK
		{
			$$ := $2
			$$.set_sign ($1)
			$$.set_break ($3)
		}
	| Plus_sign E_INTEGER
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| Plus_sign E_INTEGER E_BREAK
		{
			$$ := $2
			$$.set_sign ($1)
			$$.set_break ($3)
		}
	;

Real_constant: E_REAL
		{ $$ := $1 }
	| E_REAL E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| Minus_sign E_REAL
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| Minus_sign E_REAL E_BREAK
		{
			$$ := $2
			$$.set_sign ($1)
			$$.set_break ($3)
		}
	| Plus_sign E_REAL
		{
			$$ := $2
			$$.set_sign ($1)
		}
	| Plus_sign E_REAL E_BREAK
		{
			$$ := $2
			$$.set_sign ($1)
			$$.set_break ($3)
		}
	;

Identifier: E_IDENTIFIER
		{ $$ := $1 }
	| E_IDENTIFIER E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	| E_BITTYPE
		{
				-- TO DO: reserved word `BIT'
			$$ := $1
		}
	| E_BITTYPE E_BREAK
		{
				-- TO DO: reserved word `BIT'
			$$ := $1
			$$.set_break ($2)
		}
	;

Break_opt: -- Empty
		-- { $$ := Void }
	| E_BREAK
		{ $$ := $1 }
	;

--DONE------------------------------------------------------------------------------

Agent: E_AGENT
		{ $$ := $1 }
	| E_AGENT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

All: E_ALL
		{ $$ := $1 }
	| E_ALL E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

As: E_AS
		{ $$ := $1 }
	| E_AS E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Bit: E_BITTYPE
		{ $$ := $1 }
	| E_BITTYPE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Check: E_CHECK
		{ $$ := $1 }
	| E_CHECK E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Class: E_CLASS
		{ $$ := $1 }
	| E_CLASS E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Create: E_CREATE
		{ $$ := $1 }
	| E_CREATE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Creation: E_CREATION
		{ $$ := $1 }
	| E_CREATION E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Current: E_CURRENT
		{ $$ := $1 }
	| E_CURRENT E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Debug: E_DEBUG
		{ $$ := $1 }
	| E_DEBUG E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Do: E_DO
		{ $$ := $1 }
	| E_DO E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Else: E_ELSE
		{ $$ := $1 }
	| E_ELSE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Elseif: E_ELSEIF
		{ $$ := $1 }
	| E_ELSEIF E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

End: E_END
		{ $$ := $1 }
	| E_END E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Ensure: E_ENSURE
		{ $$ := $1 }
	| E_ENSURE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Expanded: E_EXPANDED
		{ $$ := $1 }
	| E_EXPANDED E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Export: E_EXPORT
		{ $$ := $1 }
	| E_EXPORT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

From: E_FROM
		{ $$ := $1 }
	| E_FROM E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

If: E_IF
		{ $$ := $1 }
	| E_IF E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Inherit: E_INHERIT
		{ $$ := $1 }
	| E_INHERIT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Inspect: E_INSPECT
		{ $$ := $1 }
	| E_INSPECT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Invariant: E_INVARIANT
		{ $$ := $1 }
	| E_INVARIANT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Like: E_LIKE
		{ $$ := $1 }
	| E_LIKE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Local: E_LOCAL
		{ $$ := $1 }
	| E_LOCAL E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Loop: E_LOOP
		{ $$ := $1 }
	| E_LOOP E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Obsolete: E_OBSOLETE
		{ $$ := $1 }
	| E_OBSOLETE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Once: E_ONCE
		{ $$ := $1 }
	| E_ONCE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Precursor: E_PRECURSOR
		{ $$ := $1 }
	| E_PRECURSOR E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Redefine: E_REDEFINE
		{ $$ := $1 }
	| E_REDEFINE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Reference: E_REFERENCE
		{ $$ := $1 }
	| E_REFERENCE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Rename: E_RENAME
		{ $$ := $1 }
	| E_RENAME E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Require: E_REQUIRE
		{ $$ := $1 }
	| E_REQUIRE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Rescue: E_RESCUE
		{ $$ := $1 }
	| E_RESCUE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Result: E_RESULT
		{ $$ := $1 }
	| E_RESULT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Retry: E_RETRY
		{ $$ := $1 }
	| E_RETRY E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Select: E_SELECT
		{ $$ := $1 }
	| E_SELECT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Separate: E_SEPARATE
		{ $$ := $1 }
	| E_SEPARATE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Then: E_THEN
		{ $$ := $1 }
	| E_THEN E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Undefine: E_UNDEFINE
		{ $$ := $1 }
	| E_UNDEFINE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Until: E_UNTIL
		{ $$ := $1 }
	| E_UNTIL E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Variant: E_VARIANT
		{ $$ := $1 }
	| E_VARIANT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

When: E_WHEN
		{ $$ := $1 }
	| E_WHEN E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

--DONE------------------------------------------------------------------------------

Minus_sign: '-'
		{ $$ := $1 }
	| '-' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Plus_sign: '+'
		{ $$ := $1 }
	| '+' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Left_parenthesis: '('
		{ $$ := $1 }
	| '(' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Right_parenthesis: ')'
		{ $$ := $1 }
	| ')' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Comma: ','
		{ $$ := $1 }
	| ',' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Colon: ':'
		{ $$ := $1 }
	| ':' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Semicolon: ';'
		{ $$ := $1 }
	| ';' E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Dot: '.'
		{ $$ := $1 }
	| '.' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Dollar: '$'
		{ $$ := $1 }
	| '$' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Left_brace: '{'
		{ $$ := $1 }
	| '{' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Right_brace: '}'
		{ $$ := $1 }
	| '}' E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Left_bracket: '['
		{ $$ := $1 }
	| '[' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Right_bracket: ']'
		{ $$ := $1 }
	| ']' E_BREAK
		{
			$$ := $1
			$$.set_break ($2)
		}
	;

Left_array: E_LARRAY 
		{ $$ := $1 }
	| E_LARRAY E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Right_array: E_RARRAY 
		{ $$ := $1 }
	|  E_RARRAY E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Assign: E_ASSIGN 
		{ $$ := $1 }
	|  E_ASSIGN E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Reverse: E_REVERSE 
		{ $$ := $1 }
	|  E_REVERSE E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Bang: '!' 
		{ $$ := $1 }
	|  '!' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Bangbang: E_BANGBANG 
		{ $$ := $1 }
	|  E_BANGBANG E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Question_mark: '?' 
		{ $$ := $1 }
	|  '?' E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Dotdot: E_DOTDOT 
		{ $$ := $1 }
	|  E_DOTDOT E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

Arrow: E_ARROW 
		{ $$ := $1 }
	|  E_ARROW E_BREAK
		{
			$$ := $1
			if keep_all_breaks or keep_all_comments then
				$$.set_break ($2)
			end
		}
	;

--------------------------------------------------------------------------------
%%

end
