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
%token <ET_TOKEN>              E_CLASS E_CREATE E_CREATION E_DEBUG
%token <ET_TOKEN>              E_DO E_ELSE E_ELSEIF E_END E_ENSURE
%token <ET_TOKEN>              E_EXPORT E_EXTERNAL E_FEATURE E_FROM E_FROZEN
%token <ET_TOKEN>              E_IF E_INDEXING E_INFIX E_INHERIT E_INSPECT
%token <ET_TOKEN>              E_INVARIANT E_IS E_LIKE E_LOCAL E_LOOP E_OBSOLETE
%token <ET_TOKEN>              E_ONCE E_ONCE_STRING E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
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
%token <ET_DEFERRED_KEYWORD>   E_DEFERRED
%token <ET_EXPANDED_KEYWORD>   E_EXPANDED
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
%token <ET_REFERENCE_KEYWORD>  E_REFERENCE
%token <ET_RESULT>             E_RESULT
%token <ET_RETRY_INSTRUCTION>  E_RETRY
%token <ET_SEPARATE_KEYWORD>   E_SEPARATE

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
%type <ET_BOOLEAN_CONSTANT>    Boolean_constant
%type <ET_BREAK>               Break_opt
%type <ET_CALL_AGENT>          Call_agent
%type <ET_CALL_EXPRESSION>     Call_expression
%type <ET_CHARACTER_CONSTANT>  Character_constant
%type <ET_CHOICE>              Choice
%type <ET_CHOICE_CONSTANT>     Choice_constant
%type <ET_CHOICE_LIST>         Choices Choices_opt
%type <ET_CLASS>               Class_header Class_to_end Class_declaration
%type <ET_CLIENTS>             Clients Clients_opt Client_list
%type <ET_COMPOUND>            Compound Rescue_opt Do_compound Once_compound Then_compound
                               Else_compound Rescue_compound From_compound Loop_compound
%type <ET_CONSTANT>            Manifest_constant
%type <ET_CONSTRAINT_CREATOR>  Constraint_create Constraint_create_procedure_list
%type <ET_CREATOR>             Creation_clause Creation_procedure_list
%type <ET_CREATORS>            Creators Creators_opt
%type <ET_DEBUG_INSTRUCTION>   Debug_instruction Debug_compound
%type <ET_DEBUG_KEYS>          Debug_keys Debug_key_list
%type <ET_ELSEIF_PART_LIST>    Elseif_list Elseif_part_list
%type <ET_EXPORT>              New_export_item
%type <ET_EXPORTS>             New_exports New_exports_opt New_export_list
%type <ET_EXPRESSION>          Expression Call_chain Precursor_expression
                               Address_mark Create_expression
%type <ET_EXTERNAL_ALIAS>      External_name_opt
%type <ET_FEATURE>             Feature_declaration Single_feature_declaration
                               Attribute_declaration Constant_declaration Unique_declaration
                               Do_procedure_declaration Once_procedure_declaration
                               Deferred_procedure_declaration External_procedure_declaration
                               Do_function_declaration Once_function_declaration
                               Deferred_function_declaration External_function_declaration
%type <ET_FEATURE_CLAUSE>      Feature_clause Feature_declaration_list
%type <ET_FEATURE_CLAUSES>     Features Features_opt
%type <ET_FEATURE_EXPORT>      New_feature_export Export_feature_name_list
%type <ET_FEATURE_NAME>        Feature_name
%type <ET_FORMAL_ARGUMENTS>    Formal_arguments_opt Formal_argument_list
%type <ET_FORMAL_GENERIC_PARAMETER>  Formal_generic
%type <ET_FORMAL_GENERIC_PARAMETERS> Formal_generics_opt Formal_generic_list
%type <ET_IDENTIFIER>          Identifier Class_name
%type <ET_IF_INSTRUCTION>      Conditional
%type <ET_INDEXINGS>           Indexing_clause Indexing_clause_opt Index_list
%type <ET_INDEXING_ITEM>       Index_clause Index_clause_semicolon Index_clause_impl
%type <ET_INDEXING_TERMS>      Index_terms
%type <ET_INDEXING_TERM>       Index_value
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
%type <ET_MANIFEST_STRING>     Manifest_string
%type <ET_MANIFEST_TUPLE>      Manifest_tuple Manifest_tuple_expression_list
%type <ET_OBSOLETE>            Obsolete_opt
%type <ET_PARENTHESIZED_EXPRESSION>  Parenthesized_expression
%type <ET_PARENTS>             Parent_list_to_end
%type <ET_POSTCONDITIONS>      Postcondition_opt
%type <ET_QUALIFIED_PRECURSOR_EXPRESSION>  Qualified_precursor_expression
%type <ET_QUALIFIED_PRECURSOR_INSTRUCTION> Qualified_precursor_instruction
%type <ET_PRECONDITIONS>       Precondition_opt
%type <ET_REAL_CONSTANT>       Real_constant
%type <ET_RENAMES>             Rename_clause Rename_list
%type <ET_STRIP_EXPRESSION>    Strip_expression Strip_feature_name_list
%type <ET_TYPE>                Type Constraint_type
%type <ET_VARIANT>             Variant_clause_opt
%type <ET_WHEN_PART_LIST>      When_list When_list_opt
%type <ET_WRITABLE>            Writable

%expect 41
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
			remove_last_class
		}
	;

Class_declaration_opt: -- Empty
	| Class_declaration
	;

Class_to_end: Class_header Formal_generics_opt Obsolete_opt
	   Creators_opt Features_opt Invariant_clause_opt Indexing_clause_opt E_END Class_declaration_opt
		{
			$$ := $1
			$$.set_obsolete_message ($3)
			$$.set_creators ($4)
			$$.set_feature_clauses ($5)
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

Creators_to_end: Creators_opt Features_opt Invariant_clause_opt Indexing_clause_opt E_END Class_declaration_opt
		{
			last_class.set_creators ($1)
			last_class.set_feature_clauses ($2)
			last_class.set_invariants ($3)
			last_class.set_second_indexing ($4)
			last_class.set_end_keyword ($5)
		}
	;

--------------------------------------------------------------------------------

Indexing_clause: E_INDEXING
		{ $$ := new_indexings ($1) }
	| E_INDEXING
		{ add_counter }
	  Index_list
		{
			$$ := $3
			$$.set_indexing_keyword ($1)
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
			$$ := new_indexings_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Index_clause_semicolon
		-- TODO: Syntax error
		{
			$$ := new_indexings_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Index_clause
		{ increment_counter }
	  Index_list
		{
			$$ := $3
			$$.put_first ($1)
		}
	| Index_clause_semicolon
		{ increment_counter }
	  Index_list
		{
			$$ := $3
			$$.put_first ($1)
		}
	;

Index_clause: { add_counter } Index_clause_impl
		{
			$$ := $2
			remove_counter
		}
	;

Index_clause_impl: Index_terms
		{
			$$ := new_indexing ($1)
		}
	| Identifier ':' Index_terms
		{
			$$ := new_tagged_indexing (new_tag ($1, $2), $3)
		}

		-- Note: Eiffel says that the Index_terms list 
		-- should not be empty, but VE allows that!
--	| Identifier ':'
	;

Index_clause_semicolon: Index_clause ';'
		{ $$ := new_indexing_semicolon ($1, $2) }
	| Index_clause_semicolon ';'
		-- TODO: Syntax error
		{ $$ := new_indexing_semicolon ($1, $2) }
	;

Index_terms: Index_value
		{ $$ := new_indexing_terms_with_capacity ($1, counter_value + 1) }
	| Index_value ','
		{ increment_counter}
	  Index_terms
		{
			$$ := $4
			$$.put_first (new_indexing_term_comma ($1, $2))
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

--------------------------------------------------------------------------------

Class_header: E_CLASS Identifier
		{
			$$ := new_class ($2)
			$$.set_class_keyword ($1)
			add_last_class ($$)
		}
	| E_DEFERRED E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			add_last_class ($$)
		}
	| E_EXPANDED E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			add_last_class ($$)
		}
	| E_SEPARATE E_CLASS Identifier
		{
			$$ := new_class ($3)
			$$.set_class_keyword ($2)
			$$.set_class_mark ($1)
			add_last_class ($$)
		}
	;

------------------------------------------------------------------------------------

Formal_generics_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning!
		{
			 $$ := new_formal_generics ($1, $2)
			set_formal_generic_parameters ($$)
		}
	| '['
		{ add_counter }
	  Formal_generic_list ']'
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
	| Formal_generic ','
		{ increment_counter }
	  Formal_generic_list
		{
			$$ := $4
			$$.put_first (new_formal_generic_comma ($1, $2))
		}
	;

Formal_generic: Identifier
		{ $$ := new_formal_generic ($1) }
	| Identifier E_ARROW Constraint_type
		{ $$ := new_constrained_formal_generic ($1, $2, $3, Void) }
	| Identifier E_ARROW Constraint_type Constraint_create
		{ $$ := new_constrained_formal_generic ($1, $2, $3, $4) }
	;

Constraint_create: E_CREATE E_END
		{ $$ := new_constraint_creator ($1, $2) }
	| E_CREATE
		{ add_counter }
	  Constraint_create_procedure_list E_END
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
	| Identifier ','
		-- TODO: syntax error.
		{
			$$ := new_constraint_creator_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Identifier ',' 
		{ increment_counter }
	  Constraint_create_procedure_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

Constraint_type: Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_REFERENCE Class_name Constraint_actual_generics_opt
		{ $$ := new_constraint_named_type ($1, $2, $3) }
	| E_LIKE E_CURRENT
		{ $$ := new_like_current ($1, $2) }
	| E_LIKE Identifier
		{ $$ := new_like_identifier ($1, $2) }
	| E_BITTYPE Integer_constant
		{ $$ := new_bit_type ($1, $2) }
	| E_BITTYPE Identifier
		{ $$ := new_bit_identifier ($1, $2)  }
	;

Constraint_actual_generics_opt: -- Empty
		-- { $$ := Void }
	| '[' ']'
		-- Warning:
		{ $$ := new_actual_generics ($1, $2) }
	| '['
		{ add_counter }
	  Constraint_type_list ']'
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
	| Constraint_type ','
		{ increment_counter }
	  Constraint_type_list
		{
			$$ := $4
			$$.put_first (new_type_comma ($1, $2))
		}
	;

------------------------------------------------------------------------------------

Obsolete_opt: -- Empty
		-- { $$ := Void }
	| E_OBSOLETE Manifest_string
		{ $$ := new_obsolete ($1, $2) }
	;

------------------------------------------------------------------------------------

Inheritance_to_end: E_INHERIT Creators_to_end
		{
			last_class.set_parents (new_parents ($1))
		}
	| E_INHERIT
		{ add_counter }
	  Parent_list_to_end
		{
			last_class.set_parents ($3)
			last_class.parents.set_inherit_keyword ($1)
			remove_counter
		}
	;

Parent_list_to_end: Class_name Actual_generics_opt Rename_clause New_exports_opt
	  Undefine_clause_opt Redefine_clause_opt Select_clause_opt E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, $3, $4, $5, $6, $7, $8))
		}
	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, $3, $4, $5, $6, $7, $8), $9))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, $3, $4, $5, $6, $7))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, $3, $4, $5, $6, $7), $8))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt
	  Select_clause_opt E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, $3, $4, $5, $6))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt
	  Select_clause_opt E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, $3, $4, $5, $6), $7))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, $3, $4, $5))
		}
	| Class_name Actual_generics_opt Redefine_clause
	  Select_clause_opt E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, $3, $4, $5), $6))
		}
	| Class_name Actual_generics_opt Select_clause E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, $3, $4))
		}
	| Class_name Actual_generics_opt Select_clause E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, $3, $4), $5))
		}
	| Class_name Actual_generics_opt E_END Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
		}
	| Class_name Actual_generics_opt E_END ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, $3), $4))
		}
	| Class_name Actual_generics_opt Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, Void))
		}
	| Class_name Actual_generics_opt ';' Creators_to_end
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, Void, Void), $3))
		}
	| Class_name Actual_generics_opt E_END Indexing_clause E_END Class_declaration_opt
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
			last_class.set_second_indexing ($4)
			last_class.set_end_keyword ($5)
		}
	| Class_name Actual_generics_opt E_END Class_declaration_opt
		{
			$$ := new_parents_with_capacity (counter_value + 1)
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, Void))
			last_class.set_end_keyword ($3)
		}

	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $10
			$$.put_first (new_parent ($1, $2, $3, $4, $5, $6, $7, $8))
		}
	| Class_name Actual_generics_opt Rename_clause New_exports_opt Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END ';'
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $11
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, $3, $4, $5, $6, $7, $8), $9))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $9
			$$.put_first (new_parent ($1, $2, Void, $3, $4, $5, $6, $7))
		}
	| Class_name Actual_generics_opt New_exports Undefine_clause_opt
	  Redefine_clause_opt Select_clause_opt E_END ';'
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $10
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, $3, $4, $5, $6, $7), $8))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt Select_clause_opt E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $8
			$$.put_first (new_parent ($1, $2, Void, Void, $3, $4, $5, $6))
		}
	| Class_name Actual_generics_opt Undefine_clause Redefine_clause_opt Select_clause_opt E_END ';'
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $9
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, $3, $4, $5, $6), $7))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $7
			$$.put_first (new_parent ($1, $2, Void, Void, Void, $3, $4, $5))
		}
	| Class_name Actual_generics_opt Redefine_clause Select_clause_opt E_END ';'
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $8
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, $3, $4, $5), $6))
		}
	| Class_name Actual_generics_opt Select_clause E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $6
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, $3, $4))
		}
	| Class_name Actual_generics_opt Select_clause E_END ';'
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $7
			$$.put_first (new_parent_semicolon (new_parent ($1, $2, Void, Void, Void, Void, $3, $4), $5))
		}
	| Class_name Actual_generics_opt E_END
		{ increment_counter }
	  Parent_list_to_end
		{
			$$ := $5
			$$.put_first (new_parent ($1, $2, Void, Void, Void, Void, Void, $3))
		}
	| Class_name Actual_generics_opt E_END ';'
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
	| Class_name Actual_generics_opt ';'
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

------------------------------------------------------------------------------------

Rename_clause: E_RENAME
		{ $$ := new_renames ($1) }
	| E_RENAME
		{ add_counter}
	  Rename_list
		{
			$$ := $3
			$$.set_rename_keyword ($1)
			remove_counter
		}
	;

Rename_list: Feature_name E_AS Feature_name
		{
			$$ := new_renames_with_capacity (counter_value + 1)
			$$.put_first (new_rename ($1, $2, $3))
		}
	| Feature_name E_AS Feature_name ','
		-- TODO: syntax error
		{
			$$ := new_renames_with_capacity (counter_value + 1)
			$$.put_first (new_rename_comma ($1, $2, $3, $4))
		}
	| Feature_name E_AS Feature_name ',' 
		{ increment_counter }
	  Rename_list
		{
			$$ := $6
			$$.put_first (new_rename_comma ($1, $2, $3, $4))
		}
	;

------------------------------------------------------------------------------------

New_exports: E_EXPORT
		{ $$ := new_exports ($1) }
	| E_EXPORT
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
	| ';'
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
	| ';'
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

New_export_item: Clients E_ALL
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
	| Feature_name ','
		-- TODO: syntax error.
		{
			$$ := new_feature_export_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name ',' 
		{ increment_counter }
	  Export_feature_name_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

------------------------------------------------------------------------------------

Clients: '{'
		{ add_counter }
	  Client_list '}'
		{
			$$ := $3
			$$.set_left_brace ($1)
			$$.set_right_brace ($4)
			remove_counter
		}
	| '{' '}'
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
	| Identifier ','
		-- Syntax error
		{
			$$ := new_clients_with_capacity (counter_value + 1)
			$$.put_first (new_class_name_comma ($1, $2) )
		}
	| Identifier ','
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

------------------------------------------------------------------------------------

Redefine_clause: E_REDEFINE
		{ $$ := new_keyword_feature_name_list ($1) }
	| E_REDEFINE
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

Undefine_clause: E_UNDEFINE
		{ $$ := new_keyword_feature_name_list ($1) }
	| E_UNDEFINE
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

Select_clause: E_SELECT
		{ $$ := new_keyword_feature_name_list ($1) }
	| E_SELECT
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
	| Feature_name ','
		-- TODO: syntax error.
		{
			$$ := new_keyword_feature_name_list_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name ',' 
		{ increment_counter }
	  Keyword_feature_name_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

------------------------------------------------------------------------------------

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

Creation_clause: E_CREATION Clients_opt
		{
			if $2 = Void then
				$$ := new_creator ($1, new_any_clients ($1.position))
			else
				$$ := new_creator ($1, $2)
			end
		}
	| E_CREATION Clients_opt
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
	| E_CREATE Clients_opt
		{
			if $2 = Void then
				$$ := new_creator ($1, new_any_clients ($1.position))
			else
				$$ := new_creator ($1, $2)
			end
		}
	| E_CREATE Clients_opt
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
	| Identifier ','
		-- TODO: syntax error.
		{
			$$ := new_creator_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Identifier ',' 
		{ increment_counter }
	  Creation_procedure_list
		{
			$$ := $4
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
		-- { $$ := Void }
	| { add_counter } Features
		{
			$$ := $2
			remove_counter
		}
	;

Features: Feature_clause
		{ $$ := new_feature_clauses_with_capacity ($1, counter_value + 1) }
	| Feature_clause
		{ increment_counter}
	  Features
		{
			$$ := $3
			$$.put_first ($1)
		}
	;

Feature_clause: E_FEATURE Clients_opt
		{
			if $2 = Void then
				last_clients := new_any_clients ($1.position)
				$$ := new_feature_clause ($1, last_clients)
			else
				last_clients := $2
				$$ := new_feature_clause ($1, last_clients)
			end
		}
	| E_FEATURE Clients_opt
		{
			if $2 = Void then
				last_clients := new_any_clients ($1.position)
			else
				last_clients := $2
			end
			add_counter
		}
	  Feature_declaration_list
		{
			$$ := $4
			$$.set_clients (last_clients)
			$$.set_feature_keyword ($1)
			remove_counter
		}
	;

		-- Note: Does not support 'Header_comment'.

Feature_declaration_list: Feature_declaration
		{
			$$ := new_feature_clause_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Feature_declaration ';'
		-- TODO: Syntax error
		{
			$$ := new_feature_clause_with_capacity (counter_value + 1)
			$$.put_first (new_feature_semicolon ($1, $2))
		}
	| Feature_declaration
		{ increment_counter }
	  Feature_declaration_list
		{
			$$ := $3
			$$.put_first ($1)
		}
	| Feature_declaration ';'
		{ increment_counter }
	  Feature_declaration_list
		{
			$$ := $4
			$$.put_first (new_feature_semicolon ($1, $2))
		}
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
			$$ := new_synonym_feature (new_feature_name_comma ($1, $2), $3)
			register_feature ($$)
		}
	| Feature_name Feature_declaration
		{
			$$ := new_synonym_feature ($1, $2)
			register_feature ($$)
		}
	| E_FROZEN Feature_name ',' Feature_declaration
		{
			$$ := new_synonym_feature (new_feature_name_comma ($2, $3), $4)
			$$.set_frozen_keyword ($1)
			register_feature ($$)
		}
	| E_FROZEN Feature_name Feature_declaration
		{
			$$ := new_synonym_feature ($2, $3)
			$$.set_frozen_keyword ($1)
			register_feature ($$)
		}
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
		{ $$ := new_attribute ($1, $2, new_colon_type ($3, $4)) }
	;

Constant_declaration: Feature_name Formal_arguments_opt ':' Type E_IS Manifest_constant
		{
			$$ := new_constant_attribute ($1, $2, new_colon_type ($3, $4), $5, $6)
		}
	;

Unique_declaration: Feature_name Formal_arguments_opt ':' Type E_IS E_UNIQUE
		{ $$ := new_unique_attribute ($1, $2, new_colon_type ($3, $4), $5, $6) }
	;

Do_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_do_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) }
	;

Once_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_once_procedure ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) }
	;

Deferred_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END
		{ $$ := new_deferred_procedure ($1, $2, $3, $4, $5, $6, $7, $8) }
	;

External_procedure_declaration: Feature_name Formal_arguments_opt E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END
		{ $$ := new_external_procedure ($1, $2, $3, $4, $5, new_external_language ($6, $7), $8, $9, $10) }
	;

Do_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Do_compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_do_function ($1, $2, new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12) }
	;

Once_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt Local_declarations_opt
	Once_compound Postcondition_opt Rescue_opt E_END
		{ $$ := new_once_function ($1, $2, new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10, $11, $12) }
	;

Deferred_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_DEFERRED Postcondition_opt E_END
		{ $$ := new_deferred_function ($1, $2, new_colon_type ($3, $4), $5, $6, $7, $8, $9, $10) }
	;

External_function_declaration: Feature_name Formal_arguments_opt ':' Type E_IS
	Obsolete_opt Precondition_opt E_EXTERNAL Manifest_string
	External_name_opt Postcondition_opt E_END
		{ $$ := new_external_function ($1, $2, new_colon_type ($3, $4), $5, $6, $7, new_external_language ($8, $9), $10, $11, $12) }
	;

External_name_opt: -- Empty
		-- { $$ := Void }
	| E_ALIAS Manifest_string
		{ $$ := new_external_alias ($1, $2) }
	;

------------------------------------------------------------------------------------

Feature_name: Identifier
		{ $$ := $1 }
	| E_PREFIX E_STRNOT
		{ $$ := new_prefix_not_name ($1, $2) }
	| E_PREFIX E_STRPLUS
		{ $$ := new_prefix_plus_name ($1, $2) }
	| E_PREFIX E_STRMINUS
		{ $$ := new_prefix_minus_name ($1, $2) }
	| E_PREFIX E_STRFREEOP
		{ $$ := new_prefix_free_name ($1, $2) }
	| E_INFIX E_STRPLUS
		{ $$ := new_infix_plus_name ($1, $2) }
	| E_INFIX E_STRMINUS
		{ $$ := new_infix_minus_name ($1, $2) }
	| E_INFIX E_STRSTAR
		{ $$ := new_infix_times_name ($1, $2) }
	| E_INFIX E_STRSLASH
		{ $$ := new_infix_divide_name ($1, $2) }
	| E_INFIX E_STRDIV
		{ $$ := new_infix_div_name ($1, $2) }
	| E_INFIX E_STRMOD
		{ $$ := new_infix_mod_name ($1, $2) }
	| E_INFIX E_STRPOWER
		{ $$ := new_infix_power_name ($1, $2) }
	| E_INFIX E_STRLT
		{ $$ := new_infix_lt_name ($1, $2) }
	| E_INFIX E_STRLE
		{ $$ := new_infix_le_name ($1, $2) }
	| E_INFIX E_STRGT
		{ $$ := new_infix_gt_name ($1, $2) }
	| E_INFIX E_STRGE
		{ $$ := new_infix_ge_name ($1, $2) }
	| E_INFIX E_STRAND
		{ $$ := new_infix_and_name ($1, $2) }
	| E_INFIX E_STRANDTHEN
		{ $$ := new_infix_and_then_name ($1, $2) }
	| E_INFIX E_STROR
		{ $$ := new_infix_or_name ($1, $2) }
	| E_INFIX E_STRORELSE
		{ $$ := new_infix_or_else_name ($1, $2) }
	| E_INFIX E_STRIMPLIES
		{ $$ := new_infix_implies_name ($1, $2) }
	| E_INFIX E_STRXOR
		{ $$ := new_infix_xor_name ($1, $2) }
	| E_INFIX E_STRFREEOP
		{ $$ := new_infix_free_name ($1, $2) }

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

Formal_arguments_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := new_formal_arguments ($1, $2) }
	| '('
		{ add_counter }
	  Formal_argument_list ')'
		{
			$$ := $3
			$$.set_left_parenthesis ($1)
			$$.set_right_parenthesis ($4)
			remove_counter
		}
	;

Formal_argument_list: Identifier ':' Type
		{
			$$ := new_formal_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_colon_formal_argument ($1, new_colon_type ($2, $3)))
		}
	| Identifier ':' Type ';'
		{
			$$ := new_formal_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_formal_argument_semicolon (new_colon_formal_argument ($1, new_colon_type ($2, $3)), $4))
		}
	| Identifier ','
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
	| Identifier ':' Type ';'
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $6
			$$.put_first (new_formal_argument_semicolon (new_colon_formal_argument ($1, new_colon_type ($2, $3)), $4))
		}
	| Identifier ':' Type
		{ increment_counter }
	  Formal_argument_list
		{
			$$ := $5
			$$.put_first (new_colon_formal_argument ($1, new_colon_type ($2, $3)))
		}
	;

------------------------------------------------------------------------------------

Local_declarations_opt: -- Empty
		-- { $$ := Void }
	| E_LOCAL
		{ $$ := new_local_variables ($1) }
	| E_LOCAL
		{ add_counter}
	  Local_variable_list
		{
			$$ := $3
			$$.set_local_keyword ($1)
			remove_counter
		}
	;

Local_variable_list: Identifier ':' Type
		{
			$$ := new_local_variables_with_capacity (counter_value + 1)
			$$.put_first (new_colon_local_variable ($1, new_colon_type ($2, $3)))
		}
	| Identifier ':' Type ';'
		{
			$$ := new_local_variables_with_capacity (counter_value + 1)
			$$.put_first (new_local_variable_semicolon (new_colon_local_variable ($1, new_colon_type ($2, $3)), $4))
		}
	| Identifier ','
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
	| Identifier ':' Type ';'
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $6
			$$.put_first (new_local_variable_semicolon (new_colon_local_variable ($1, new_colon_type ($2, $3)), $4))
		}
	| Identifier ':' Type
		{ increment_counter }
	  Local_variable_list
		{
			$$ := $5
			$$.put_first (new_colon_local_variable ($1, new_colon_type ($2, $3)))
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
	| E_INVARIANT
		{ $$ := new_invariants ($1) }
	| E_INVARIANT Assertions
		{ $$ := new_invariants ($1) }
	;

Variant_clause_opt: -- Empty
		-- { $$ := Void }
	| E_VARIANT -- Not standard.
		{ $$ := new_variant ($1) }
	| E_VARIANT Expression
		{ $$ := new_expression_variant ($1, $2) }
	| E_VARIANT Identifier ':' Expression
		{ $$ := new_tagged_expression_variant ($1, new_tag ($2, $3), $4) }
	;

------------------------------------------------------------------------------------

Rescue_opt: -- Empty
		-- { $$ := Void }
	| Rescue_compound
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Type: Class_name Actual_generics_opt
		{ $$ := new_named_type (Void, $1, $2) }
	| E_EXPANDED Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_SEPARATE Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_REFERENCE Class_name Actual_generics_opt
		{ $$ := new_named_type ($1, $2, $3) }
	| E_LIKE E_CURRENT
		{ $$ := new_like_current ($1, $2) }
	| E_LIKE Identifier
		{ $$ := new_like_identifier ($1, $2) }
	| E_BITTYPE Integer_constant
		{ $$ := new_bit_type ($1, $2) }
	| E_BITTYPE Identifier
		{ $$ := new_bit_identifier ($1, $2)  }
	;

Class_name: E_IDENTIFIER
		{ $$ := $1 }
	;

Actual_generics_opt: -- Empty
		-- { $$ := Void }
	| Actual_generics
		{ $$ := $1 }
	;

Actual_generics: '[' ']'
		-- Warning:
		{ $$ := new_actual_generics ($1, $2) }
	| '['
		{ add_counter }
	  Type_list ']'
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
	| Type ','
		{ increment_counter }
	  Type_list
		{
			$$ := $4
			$$.put_first (new_type_comma ($1, $2))
		}
	;

------------------------------------------------------------------------------------

Do_compound: E_DO
		{ $$ := new_compound ($1) }
	| E_DO
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Once_compound: E_ONCE
		{ $$ := new_compound ($1) }
	| E_ONCE
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Then_compound: E_THEN
		{ $$ := new_compound ($1) }
	| E_THEN
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Else_compound: E_ELSE
		{ $$ := new_compound ($1) }
	| E_ELSE
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Rescue_compound: E_RESCUE
		{ $$ := new_compound ($1) }
	| E_RESCUE
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

From_compound: E_FROM
		{ $$ := new_compound ($1) }
	| E_FROM
		{ add_counter }
	  Compound
		{
			$$ := $3
			$$.set_keyword ($1)
			remove_counter
		}
	;

Loop_compound: E_LOOP
		{ $$ := new_compound ($1) }
	| E_LOOP
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
	| ';'
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
	| ';'
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
	| Writable E_ASSIGN Expression
		{ $$ := new_assignment ($1, $2, $3) }
 	| Writable E_REVERSE Expression
		{ $$ := new_assignment_attempt ($1, $2, $3) }
	| Conditional
		{ $$ := $1 }
	| Multi_branch
		{ $$ := $1 }
	| From_compound Invariant_clause_opt Variant_clause_opt
	  E_UNTIL Expression Loop_compound E_END
		{ $$ := new_loop_instruction ($1, $2, $3, $4, $5, $6, $7) }
	| Debug_instruction
		{ $$ := $1 }
	| E_CHECK E_END
		{ $$ := new_check_instruction ($1, $2) }
	| E_CHECK Assertions E_END
		{ $$ := new_check_instruction ($1, $3) }
	| E_RETRY
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Creation_instruction: '!' Type '!' Writable
		{ $$ := new_typed_bang_instruction ($1, $2, $3, $4) }
	| '!' Type '!' Writable '.' Identifier Actuals_opt
		{ $$ := new_qualified_typed_bang_instruction ($1, $2, $3, $4, $5, $6, $7) }
	| E_BANGBANG Writable
		{ $$ := new_bang_instruction ($1, $2) }
	| E_BANGBANG Writable '.' Identifier Actuals_opt
		{ $$ := new_qualified_bang_instruction ($1, $2, $3, $4, $5) }
	;

Create_instruction: E_CREATE '{' Type '}' Writable
		{ $$ := new_typed_create_instruction ($1, $2, $3, $4, $5) }
	| E_CREATE '{' Type '}' Writable '.' Identifier Actuals_opt
		{ $$ := new_qualified_typed_create_instruction ($1, $2, $3, $4, $5, $6, $7, $8) }
	| E_CREATE Writable
		{ $$ := new_create_instruction ($1, $2) }
	| E_CREATE Writable '.' Identifier Actuals_opt
		{ $$ := new_qualified_create_instruction ($1, $2, $3, $4, $5) }
	;

Create_expression: E_CREATE '{' Type '}' 
		{ $$ := new_create_expression ($1, $2, $3, $4) }
	| E_CREATE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := new_qualified_create_expression ($1, $2, $3, $4, $5, $6, $7) }
	;

------------------------------------------------------------------------------------

Conditional: E_IF Expression Then_compound E_END
		{ $$ := new_if_instruction ($1, $2, $3, $4) }
	| E_IF Expression Then_compound Else_compound E_END
		{
			$$ := new_if_instruction ($1, $2, $3, $5)
			$$.set_else_compound ($4)
		}
	| E_IF Expression Then_compound Elseif_list E_END
		{
			$$ := new_if_instruction ($1, $2, $3, $5)
			$$.set_elseif_parts ($4)
		}
	| E_IF Expression Then_compound Elseif_list Else_compound E_END
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

Elseif_part_list: E_ELSEIF Expression Then_compound
		{
			$$ := new_elseif_part_list_with_capacity (new_elseif_part ($1, $2, $3), counter_value + 1)
		}
	| E_ELSEIF Expression Then_compound
		{ increment_counter }
	  Elseif_part_list
		{
			$$ := $5
			$$.put_first (new_elseif_part ($1, $2, $3))
		}
	;

------------------------------------------------------------------------------------

Multi_branch: E_INSPECT Expression When_list_opt Else_compound E_END
		{
			$$ := new_inspect_instruction ($1, $2, $5)
			$$.set_when_parts ($3)
			$$.set_else_compound ($4)
		}
	| E_INSPECT Expression When_list_opt E_END
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

When_list: E_WHEN Choices_opt Then_compound
		{
			$$ := new_when_part_list_with_capacity (new_when_part ($1, $2, $3), counter_value + 1)
		}
	| E_WHEN Choices_opt Then_compound
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
	| Choice ','
		-- TODO: syntax error.
		{
			$$ := new_choice_list_with_capacity (new_choice_comma ($1, $2), counter_value + 1)
		}
	| Choice ',' 
		{ increment_counter }
	  Choices
		{
			$$ := $4
			$$.put_first (new_choice_comma ($1, $2))
		}
	;

Choice: Choice_constant
		{ $$ := $1 }
	| Choice_constant E_DOTDOT Choice_constant
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

------------------------------------------------------------------------------------

Debug_instruction: E_DEBUG Debug_keys E_END
		{ $$ := new_debug_instruction ($1, $2, $3) }
	|  E_DEBUG Debug_keys
		{ add_counter }
	  Debug_compound E_END
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
	| ';'
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
	| ';'
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
	| '(' ')'
		{ $$ := new_debug_keys ($1, $2) }
	| '('
		{ add_counter }
	  Debug_key_list ')'
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
	| Manifest_string ','
		{ increment_counter }
	  Debug_key_list
		{
			$$ := $4
			$$.put_first (new_manifest_string_comma ($1, $2))
		}
	;

------------------------------------------------------------------------------------

Call_instruction: Identifier Actuals_opt
		{ $$ := new_call_instruction ($1, $2) }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := new_qualified_call_instruction ($1, $2, $3, $4) }
	| E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_instruction ($1, $2) }
	| Qualified_precursor_instruction
		{ $$ := $1 }
	| E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := new_static_call_instruction ($1, $2, $3, $4, $5, $6, $7) }
	;

Qualified_precursor_instruction: E_PRECURSOR '{' Class_name '}' Actuals_opt
		{
			$$ := new_qualified_precursor_instruction ($2, $3, $4, $1, $5)
			$$.set_parent_prefixed (False)
		}
	| '{' Class_name '}' E_PRECURSOR Actuals_opt
		{
			$$ := new_qualified_precursor_instruction ($1, $2, $3, $4, $5)
			$$.set_parent_prefixed (True)
		}
	;

Call_expression: Identifier Actuals_opt
		{ $$ := new_call_expression ($1, $2) }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := new_qualified_call_expression ($1, $2, $3, $4) }
	| E_FEATURE '{' Type '}' '.' Identifier Actuals_opt
		{ $$ := new_static_call_expression ($1, $2, $3, $4, $5, $6, $7) }
	;

Precursor_expression: E_PRECURSOR Actuals_opt
		{ $$ := new_precursor_expression ($1, $2) }
	| Qualified_precursor_expression
		{ $$ := $1 }
	;

Qualified_precursor_expression: E_PRECURSOR '{' Class_name '}' Actuals_opt
		{
			$$ := new_qualified_precursor_expression ($2, $3, $4, $1, $5)
			$$.set_parent_prefixed (False)
		}
	| '{' Class_name '}' E_PRECURSOR Actuals_opt
		{
			$$ := new_qualified_precursor_expression ($1, $2, $3, $4, $5)
			$$.set_parent_prefixed (True)
		}
	;

Call_chain: Identifier Actuals_opt
		{ $$ := new_call_expression ($1, $2) }
	| E_RESULT
		{ $$ := $1 }
	| E_CURRENT
		{ $$ := $1 }
	| Parenthesized_expression
		{ $$ := $1 }
	| Precursor_expression
		{ $$ := $1 }
	| Call_chain '.' Identifier Actuals_opt
		{ $$ := new_qualified_call_expression ($1, $2, $3, $4) }
	;

------------------------------------------------------------------------------------

Actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		{ $$ := new_actual_arguments ($1, $2) }
	| '('
		{ add_counter }
	  Actuals_expression_list ')'
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
	| Expression ','
		-- TODO: syntax error.
		{
			$$ := new_actual_arguments_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression ',' 
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

Address_mark: '$' Feature_name
		{ $$ := new_feature_address ($1, $2) }
	| '$' E_CURRENT
		{ $$ := new_current_address ($1, $2) }
	| '$' E_RESULT
		{ $$ := new_result_address ($1, $2) }
		-- Note: The following construct is an
		-- extension of the Eiffel syntax provided
		-- in ISE Eiffel and Halstenbach compilers.
	| '$' Parenthesized_expression
		{ $$ := new_expression_address ($1, $2) }
	;

Writable: Identifier
		{ $$ := $1 }
	| E_RESULT
		{ $$ := $1 }
	;

------------------------------------------------------------------------------------

Expression: Call_expression
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
		{ $$ := new_once_manifest_string ($1, $2) }
	| E_BIT
		{ $$ := $1 }
	| Manifest_array
		{ $$ := $1 }
	| Manifest_tuple
		{ $$ := $1 }
	| '+' Expression %prec E_NOT
		{ $$ := new_prefix_expression ($1, $2) }
	| '-' Expression %prec E_NOT
		{ $$ := new_prefix_expression ($1, $2) }
	| E_NOT Expression
		{ $$ := new_prefix_expression ($1, $2) }
	| E_FREEOP Expression %prec E_NOT
		{ $$ := new_prefix_expression ($1, $2) }
	| Expression E_FREEOP Expression
		{
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $3)
		}
	| Expression '+' Expression
		{
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $3)
		}
	| Expression '-' Expression
		{
			$2.set_infix
			$$ := new_infix_expression ($1, $2, $3)
		}
	| Expression '*' Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression '/' Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression '^' Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_DIV Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_MOD Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression '=' Expression
		{ $$ := new_equality_expression ($1, $2, $3) }
	| Expression E_NE Expression
		{ $$ := new_equality_expression ($1, $2, $3) }
	| Expression '<' Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression '>' Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_LE Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_GE Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_AND Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_OR Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_XOR Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| Expression E_AND E_THEN Expression %prec E_AND
		{ $$ := new_infix_expression ($1, new_infix_and_then_operator ($2, $3), $4) }
	| Expression E_OR E_ELSE Expression %prec E_OR
		{ $$ := new_infix_expression ($1, new_infix_or_else_operator ($2, $3), $4) }
	| Expression E_IMPLIES Expression
		{ $$ := new_infix_expression ($1, $2, $3) }
	| E_OLD Expression
		{ $$ := new_old_expression ($1, $2) }
	| Strip_expression
		{ $$ := $1 }
	| Address_mark
		{ $$ := $1 }
	;

Parenthesized_expression: '(' Expression ')'
		{ $$ := new_parenthesized_expression ($1, $2, $3) }
	;

Manifest_array: E_LARRAY E_RARRAY
		{ $$ := new_manifest_array ($1, $2) }
	| E_LARRAY
		{ add_counter }
	  Manifest_array_expression_list E_RARRAY
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
	| Expression ','
		-- TODO: syntax error.
		{
			$$ := new_manifest_array_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression ',' 
		{ increment_counter }
	  Manifest_array_expression_list
		{
			$$ := $4
			$$.put_first (new_expression_comma ($1, $2))
		}
	;

Manifest_tuple: '[' ']'
		{ $$ := new_manifest_tuple ($1, $2) }
	| '['
		{ add_counter }
	  Manifest_tuple_expression_list ']'
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
	| Expression ','
		-- TODO: syntax error.
		{
			$$ := new_manifest_tuple_with_capacity (counter_value + 1)
			$$.put_first (new_expression_comma ($1, $2))
		}
	| Expression ',' 
		{ increment_counter }
	  Manifest_tuple_expression_list
		{
			$$ := $4
			$$.put_first (new_expression_comma ($1, $2))
		}
	;

Strip_expression: E_STRIP '(' ')'
		{ $$ := new_strip_expression ($1, $2, $3) }
	| E_STRIP '('
		{ add_counter }
	  Strip_feature_name_list ')'
		{
			$$ := $4
			$$.set_strip_keyword ($1)
			$$.set_left_parenthesis ($2)
			$$.set_right_parenthesis ($5)
			remove_counter
		}
	;

Strip_feature_name_list: Feature_name
		{
			$$ := new_strip_expression_with_capacity (counter_value + 1)
			$$.put_first ($1)
		}
	| Feature_name ','
		-- TODO: syntax error.
		{
			$$ := new_strip_expression_with_capacity (counter_value + 1)
			$$.put_first (new_feature_name_comma ($1, $2))
		}
	| Feature_name ',' 
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
	| E_BIT
		{ $$ := $1 }
	;

--NOTDONE---------------------------------------------------------------------------

Call_agent: E_AGENT Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| E_AGENT Identifier '.' Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| E_AGENT Parenthesized_expression '.' Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	| E_AGENT '{' Type '}' '.' Feature_name Agent_actuals_opt
		{ $$ := new_call_agent ($1) }
	;

Agent_actuals_opt: -- Empty
		-- { $$ := Void }
	| '(' ')'
		-- { $$ := new_actual_arguments ($1, $2) }
	| '('
		-- { add_counter }
	  Agent_actual_list ')'
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
	| Agent_actual ','
		-- TODO: syntax error.
		--{
			--$$ := new_actual_arguments_with_capacity (counter_value + 1)
			--$$.put_first (new_expression_comma ($1, $2))
		--}
	| Agent_actual ',' 
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
	| '?'
	| '{' Class_name '}'
		-- TODO:
		--{ $$ := new_named_type (Void, $1, $2) }
	| '{' Class_name Actual_generics '}'
		-- TODO:
		--{ $$ := new_named_type (Void, $1, $2) }
	| '{' E_EXPANDED Class_name Actual_generics_opt '}'
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| '{' E_SEPARATE Class_name Actual_generics_opt '}'
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| '{' E_REFERENCE Class_name Actual_generics_opt '}'
		-- TODO:
		--{ $$ := new_named_type ($1, $2, $3) }
	| '{' E_LIKE E_CURRENT '}'
		-- TODO:
		--{ $$ := new_like_current ($1, $2) }
	| '{' E_LIKE Identifier '}'
		-- TODO:
		--{ $$ := new_like_identifier ($1, $2) }
	| '{' E_BITTYPE Integer_constant '}'
		-- TODO:
		--{ $$ := new_bit_type ($1, $2) }
	| '{' E_BITTYPE Identifier '}'
		-- TODO:
		--{ $$ := new_bit_identifier ($1, $2)  }
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

--------------------------------------------------------------------------------
%%

end
