%{
indexing

	description:

		"Eiffel parsers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class EIFFEL_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		end

creation

	make, execute, benchmark

%}

%token E_CHARACTER E_INTEGER E_REAL E_IDENTIFIER E_STRING E_BIT E_BITTYPE
%token E_CHARERR E_INTERR E_REALERR E_STRERR E_UNKNOWN E_NOMEMORY
%token E_BANGBANG E_ARROW E_DOTDOT E_LARRAY E_RARRAY E_ASSIGN E_REVERSE
%token E_ALIAS E_ALL E_AS E_CHECK E_CLASS E_CREATION E_DEBUG E_DEFERRED
%token E_DO E_ELSE E_ELSEIF E_END E_ENSURE E_EXPANDED E_EXPORT
%token E_EXTERNAL E_FALSE E_FEATURE E_FROM E_FROZEN E_IF E_INDEXING
%token E_INFIX E_INHERIT E_INSPECT E_INVARIANT E_IS E_LIKE E_LOCAL
%token E_LOOP E_OBSOLETE E_ONCE E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
%token E_RESCUE E_RETRY E_SELECT E_SEPARATE E_STRIP E_THEN E_TRUE
%token E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT E_WHEN E_CURRENT E_RESULT
%token E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV E_STRMOD
%token E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE E_STRAND E_STROR
%token E_STRXOR E_STRANDTHEN E_STRORELSE E_STRIMPLIES E_STRFREEOP
%token E_STRNOT

%left E_IMPLIES
%left E_OR E_XOR
%left E_AND
%left '=' E_NE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP
%right E_NOT E_OLD

%start Class_declaration

%%

Class_declaration: Indexing Class_header Formal_generics Obsolete
			Inheritance Creators Features Invariant E_END
		;

Class_header: E_CLASS E_IDENTIFIER
		| E_DEFERRED E_CLASS E_IDENTIFIER
		| E_EXPANDED E_CLASS E_IDENTIFIER
		;

Indexing: -- /* empty */
		| E_INDEXING Index_list
		;

Index_list: -- /* empty */
		| Index_clause
		| Index_list Index_clause
		;

Index_clause: Index_terms
		| E_IDENTIFIER ':' Index_terms
		| ';'
		;

Index_terms: Index_value
		| Index_terms ',' Index_value
		;

Index_value: E_IDENTIFIER
		| Manifest_constant
		;

Formal_generics: -- /* empty */
		| '[' ']'
		| '[' Formal_generic_list ']'
		;

Formal_generic_list: E_IDENTIFIER Constraint
		| Formal_generic_list ',' E_IDENTIFIER Constraint
		;

Constraint: -- /* empty */
		| E_ARROW Class_type
		;

Obsolete: -- /* empty */
		| E_OBSOLETE Manifest_string
		;

Inheritance: -- /* empty */
		| E_INHERIT Parent_list
		;

Parent_list: -- /* empty */
		| Parent
		| Parent_list Parent
		;

Parent: Class_type Feature_adaptation
		| ';'
		;

Feature_adaptation: -- /* empty */
		| Feature_adaptation1
		| Feature_adaptation2
		| Feature_adaptation3
		| Feature_adaptation4
		| Feature_adaptation5
		;

Feature_adaptation1: Rename New_export_opt Undefine_opt Redefine_opt
			Select_opt E_END
		;

Feature_adaptation2: New_export Undefine_opt Redefine_opt
			Select_opt E_END
		;

Feature_adaptation3: Undefine Redefine_opt Select_opt E_END
		;

Feature_adaptation4: Redefine Select_opt E_END
		;

Feature_adaptation5: Select E_END
		;

Rename: E_RENAME
		| E_RENAME Rename_list
		;

Rename_list: Feature_name E_AS Feature_name
		| Rename_list ',' Feature_name E_AS Feature_name
		;

New_export: E_EXPORT New_export_list
		;

New_export_opt: -- /* empty */
		| New_export
		;

New_export_list: -- /* empty */
		| New_export_item
		| New_export_list New_export_item
		;

New_export_item: Clients Feature_set
		| ';'
		;

Feature_set: -- /* empty */
		| Feature_list
		| E_ALL
		;

Feature_list: Feature_name
		| Feature_list ',' Feature_name
		;

Clients: '{' '}'
		| '{' Class_list '}'
		;

Class_list: E_IDENTIFIER
		| Class_list ',' E_IDENTIFIER
		;

Redefine: E_REDEFINE
		| E_REDEFINE Feature_list
		;

Redefine_opt: -- /* empty */
		| Redefine
		;

Undefine: E_UNDEFINE
		| E_UNDEFINE Feature_list
		;

Undefine_opt: -- /* empty */
		| Undefine
		;

Select: E_SELECT
		| E_SELECT Feature_list
		;

Select_opt: -- /* empty */
		| Select
		;

Creators: -- /* empty */
		| Creation_clause
		| Creators Creation_clause
		;

Creation_clause: E_CREATION Clients_opt Feature_list_opt
		;

Clients_opt: -- /* empty */
		| Clients
		;

Feature_list_opt: -- /* empty */
		| Feature_list
		;

Features: -- /* empty */
		| Feature_clause
		| Features Feature_clause
		;

Feature_clause: E_FEATURE Clients_opt Feature_declaration_list
		;

Feature_declaration_list: -- /* empty */
		| Feature_declaration
		| Feature_declaration_list Feature_declaration
		;

Feature_declaration: New_feature_list Declaration_body
		| ';'
		;

New_feature_list: New_feature
		| New_feature_list ',' New_feature
		;

New_feature: Feature_name
		| E_FROZEN Feature_name
		;

Declaration_body: Formal_arguments Type_mark Constant_or_routine
		;

Constant_or_routine: -- /* empty */
		| E_IS Feature_value
		;

Feature_value: Manifest_constant
		| E_UNIQUE
		| Routine
		;

Type_mark: -- /* empty */
		| ':' Type
		;

Formal_arguments: -- /* empty */
		| '(' Entity_declaration_list ')'
		;

Entity_declaration_list: -- /* empty */
		| Entity_declaration_group
		| Entity_declaration_list Entity_declaration_group
		;

Entity_declaration_group: Identifier_list ':' Type
		| ';'
		;

Feature_name: E_IDENTIFIER
		| Prefix_keyword Prefix_operator
		| Infix_keyword Infix_operator
		;

Prefix_keyword: E_PREFIX
		;

Prefix_operator: E_STRNOT
		| E_STRPLUS
		| E_STRMINUS
		| E_STRFREEOP
		;

Infix_keyword: E_INFIX
		;

Infix_operator: E_STRPLUS
		| E_STRMINUS
		| E_STRSTAR
		| E_STRSLASH
		| E_STRDIV
		| E_STRMOD
		| E_STRPOWER
		| E_STRLT
		| E_STRLE
		| E_STRGT
		| E_STRGE
		| E_STRAND
		| E_STRANDTHEN
		| E_STROR
		| E_STRORELSE
		| E_STRIMPLIES
		| E_STRXOR
		| E_STRFREEOP
		;

Routine: Obsolete Precondition Local_declarations
			Routine_body Postcondition Rescue E_END
		;

Local_declarations: -- /* empty */
		| E_LOCAL Entity_declaration_list
		;

Routine_body: E_DEFERRED
		| E_DO Compound
		| E_ONCE Compound
		| E_EXTERNAL Manifest_string External_name
		;

External_name: -- /* empty */
		| E_ALIAS Manifest_string
		;

Type: Class_type
		| E_EXPANDED Class_type
		| E_LIKE E_CURRENT
		| E_LIKE E_IDENTIFIER
		| E_BITTYPE
		;

Class_type: E_IDENTIFIER Actual_generics
		;

Actual_generics: -- /* empty */
		| '[' ']'
		| '[' Type_list ']'
		;

Type_list: Type
		| Type_list ',' Type
		;

Instruction: Creation
		| Call_instruction
		| Assignment
		| Conditional
		| Multi_branch
		| Loop
		| Debug
		| Check
		| E_RETRY
		| ';'
		;

Compound: -- /* empty */
		| Instruction
		| Compound Instruction
		;

Creation: '!' Type '!' Writable Creation_call
		| E_BANGBANG Writable Creation_call
		;

Creation_call: -- /* empty */
		| '.' E_IDENTIFIER Actuals
		;

Call_instruction: E_IDENTIFIER Actuals
		| Call_expression '.' E_IDENTIFIER Actuals
		| '(' Expression ')' '.' E_IDENTIFIER Actuals
		;

Actuals: -- /* empty */
		| '(' ')'
		| '(' Actual_list ')'
		;

Actual_list: Actual
		| Actual_list ',' Actual
		;

Actual:	Expression
		| '$' Feature_name
		| '$' E_CURRENT
		| '$' E_RESULT
		;

Assignment: Writable Assign_op Expression
		;

Assign_op: E_ASSIGN
		| E_REVERSE
		;

Writable: E_IDENTIFIER
		| E_RESULT
		;

Conditional: E_IF Expression E_THEN Compound Elseif_list Else_part E_END
		;

Else_part: -- /* empty */
		| E_ELSE Compound
		;

Elseif_list: -- /* empty */
		| E_ELSEIF Expression E_THEN Compound
		| Elseif_list E_ELSEIF Expression E_THEN Compound
		;

Multi_branch: E_INSPECT Expression When_list Else_part E_END
		;

When_list: E_WHEN Choices E_THEN Compound
		| When_list E_WHEN Choices E_THEN Compound
		;

Choices: -- /* empty */
		| Choice_list
		;

Choice_list: Choice
		| Choice_list ',' Choice
		;

Choice: E_IDENTIFIER
		| Integer_constant
		| Integer_constant E_DOTDOT Integer_constant
		| Integer_constant E_DOTDOT E_IDENTIFIER
		| E_IDENTIFIER E_DOTDOT Integer_constant
		| Character_constant
		| Character_constant E_DOTDOT Character_constant
		| Character_constant E_DOTDOT E_IDENTIFIER
		| E_IDENTIFIER E_DOTDOT Character_constant
		| E_IDENTIFIER E_DOTDOT E_IDENTIFIER
		;

Loop: E_FROM Compound Invariant Variant E_UNTIL Expression
			E_LOOP Compound E_END
		;

Variant: -- /* empty */
		| E_VARIANT
		| E_VARIANT Expression
		| E_VARIANT E_IDENTIFIER ':' Expression
		;

Debug: E_DEBUG Debug_keys Compound E_END
		;

Debug_keys: -- /* empty */
		| '(' ')'
		| '(' Debug_key_list ')'
		;

Debug_key_list: Manifest_string
		| Debug_key_list ',' Manifest_string
		;

Rescue: -- /* empty */
		| E_RESCUE Compound
		;

Check: E_CHECK Assertion E_END
		;

Precondition: -- /* empty */
		| E_REQUIRE Assertion
		| E_REQUIRE E_ELSE Assertion
		;

Postcondition: -- /* empty */
		| E_ENSURE Assertion
		| E_ENSURE E_THEN Assertion
		;

Invariant: -- /* empty */
		| E_INVARIANT Assertion
		;

Assertion: -- /* empty */
		| Assertion_clause
		| Assertion Assertion_clause
		;

Assertion_clause: Expression
		| E_IDENTIFIER ':' Expression
		| ';'
		;

Expression: Call_expression
		| '(' Expression ')'
		| Boolean_constant
		| Character_constant
		| Number
		| Manifest_string
		| Bit_constant
		| E_LARRAY Expression_list E_RARRAY
		| E_LARRAY E_RARRAY
		| '+' Expression %prec E_NOT
		| '-' Expression %prec E_NOT
		| E_NOT Expression
		| E_FREEOP Expression %prec E_NOT
		| E_OLD Expression
		| Expression Binary_op Expression
		| E_STRIP '(' Identifier_list ')'
		| E_STRIP '(' ')'
		;

Identifier_list: E_IDENTIFIER
		| Identifier_list ',' E_IDENTIFIER
		;

Expression_list: Expression
		| Expression_list ',' Expression
		;

Call_expression: E_IDENTIFIER Actuals
		| E_RESULT
		| E_CURRENT
		| Call_expression '.' E_IDENTIFIER Actuals
		| '(' Expression ')' '.' E_IDENTIFIER Actuals
		;

Binary_op: E_FREEOP
		| '+'
		| '-'
		| '*'
		| '/'
		| '^'
		| E_DIV
		| E_MOD
		| '='
		| E_NE
		| '<'
		| '>'
		| E_LE
		| E_GE
		| E_AND
		| E_OR
		| E_XOR
		| E_AND E_THEN
		| E_OR E_ELSE
		| E_IMPLIES
		;

Manifest_constant:	Boolean_constant
		| Character_constant
		| Integer_constant
		| Real_constant
		| Manifest_string
		| Bit_constant
		;

Boolean_constant: E_TRUE
		| E_FALSE
		;

Character_constant: E_CHARACTER
		| E_CHARERR
		;

Manifest_string: E_STRING
		| E_STRERR
		;

Bit_constant: E_BIT
		;

Integer_constant: E_INTEGER
		| '-' Negative E_INTEGER
		| '+' E_INTEGER
		| E_INTERR
		;

Real_constant: E_REAL
		| '-' Negative E_REAL
		| '+' E_REAL
		| E_REALERR
		;

Negative: -- /* empty */
		;

Number: E_INTEGER
		| E_INTERR
		| E_REAL
		| E_REALERR
		;

%%

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute is
			-- Parse Eiffel files `arguments (1..argument_count)'.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
		do
			make
			n := argument_count
			if n = 0 then
				std.error.put_string ("usage: eiffel_parser filename ...%N")
				exceptions_.die (1)
			else
				from j := 1 until j > n loop
					a_filename := argument (j)
					a_file := input_stream_.make_file_open_read (a_filename)
					if input_stream_.is_open_read (a_file) then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						input_stream_.close (a_file)
					else
						std.error.put_string ("eiffel_parser: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
					end
					j := j + 1
				end
			end
		end

	benchmark is
			-- Parse Eiffel file `argument (2)' `argument (1)' times.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
		do
			make
			if
				argument_count < 2 or else
				not string_.is_integer (argument (1))
			then
				std.error.put_string ("usage: eiffel_parser nb filename%N")
				exceptions_.die (1)
			else
				n := argument (1).to_integer
				a_filename := argument (2)
				from j := 1 until j > n loop
					a_file := input_stream_.make_file_open_read (a_filename)
					if input_stream_.is_open_read (a_file) then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						input_stream_.close (a_file)
					else
						std.error.put_string ("eiffel_parser: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
						exceptions_.die (1)
					end
					j := j + 1
				end
			end
		end

end -- class EIFFEL_PARSER
