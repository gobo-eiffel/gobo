%{
indexing

	description:

		"Eiffel parsers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class EIFFEL_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

creation

	make, execute, benchmark

%}

%token E_CHARACTER E_INTEGER E_REAL E_IDENTIFIER E_STRING E_BIT E_BITTYPE
%token E_BANGBANG E_ARROW E_DOTDOT E_LARRAY E_RARRAY E_ASSIGN E_REVERSE
%token E_ALIAS E_ALL E_AS E_CHECK E_CLASS E_CREATION E_DEBUG E_DEFERRED
%token E_DO E_ELSE E_ELSEIF E_END E_ENSURE E_EXPANDED E_EXPORT
%token E_EXTERNAL E_FALSE E_FEATURE E_FROM E_FROZEN E_IF E_INDEXING
%token E_INFIX E_INHERIT E_INSPECT E_INVARIANT E_IS E_LIKE E_LOCAL
%token E_LOOP E_OBSOLETE E_ONCE E_PREFIX E_REDEFINE E_RENAME E_REQUIRE
%token E_RESCUE E_RETRY E_SELECT E_SEPARATE E_STRIP E_THEN E_TRUE
%token E_UNDEFINE E_UNIQUE E_UNTIL E_VARIANT E_WHEN E_CURRENT E_RESULT
%token E_PRECURSOR

%token E_CHARERR E_INTERR E_REALERR E_STRERR E_UNKNOWN E_NOMEMORY
%token E_STRPLUS E_STRMINUS E_STRSTAR E_STRSLASH E_STRDIV
%token E_STRMOD E_STRPOWER E_STRLT E_STRLE E_STRGT E_STRGE
%token E_STRAND E_STROR E_STRXOR E_STRANDTHEN E_STRORELSE
%token E_STRIMPLIES E_STRFREEOP E_STRNOT

%left E_IMPLIES
%left E_OR E_XOR
%left E_AND
%left '=' E_NE '<' '>' E_LE E_GE
%left '+' '-'
%left '*' '/' E_DIV E_MOD
%right '^'
%left E_FREEOP
%right E_NOT E_OLD

%expect 262
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
	| Index_list_with_no_terminator
	| Index_list_with_no_terminator S
	;

Index_list_with_no_terminator: Index_clause
	| Index_list_with_no_terminator Index_clause
	| Index_list_with_no_terminator ';' Index_clause
	| Index_list_with_no_terminator ';' S Index_clause
	;

Index_clause: Index_terms
	| Identifier ':' Index_terms
		-- Note: Eiffel says that the Index_terms list 
		-- should not be empty, but VE allows that!
	| Identifier ':'
	;

Index_terms: Index_value
	| Index_terms ',' Index_value
	;

Index_value: Identifier
	| Manifest_constant
	;

S: ';'
	| S ';'
	;

--------------------------------------------------------------------------------

Class_header: Header_mark_opt E_CLASS Identifier
	;

Header_mark_opt: -- Empty
	| E_DEFERRED
	| E_EXPANDED
	| E_SEPARATE
	;

--------------------------------------------------------------------------------

Formal_generics_opt: -- Empty
	| '[' Formal_generic_list ']'
	;

Formal_generic_list: -- Empty
	| Identifier Constraint_opt
	| Formal_generic_list ',' Identifier Constraint_opt
	;

Constraint_opt: -- Empty
	| E_ARROW Class_type
	;

--------------------------------------------------------------------------------

Obsolete_opt: -- Empty
	| E_OBSOLETE E_STRING
	;

--------------------------------------------------------------------------------

Inheritance_to_end: E_INHERIT Parent_list_to_end
	;
	
Parent_list_to_end: Creators_features_invariant_opt E_END
	| Parents Feature_adaptation_opt Creators_features_invariant_opt E_END
	| Parents E_END Creators_features_invariant_opt E_END
	| Parents E_END

	| Parents Feature_adaptation_opt ';' Creators_features_invariant_opt E_END
	| Parents E_END ';' Creators_features_invariant_opt E_END
	;

		-- Note: The two constructs above are a workaround to solve
		-- the following grammar ambiguity:
		--		class FOO inherit BAR end
		-- where, through shift/reduce conflicts, would habe
		-- been parsed with 'end' being recognized as the
		-- end of the feature adaptation of BAR instead of
		-- as the end of the class FOO.

Parents: Class_type
	| Parents Feature_adaptation_opt Class_type
	| Parents Feature_adaptation_opt ';' Class_type
	| Parents E_END Class_type
	| Parents E_END ';' Class_type
	;

Feature_adaptation_opt: -- Empty
	| Feature_adaptation
	;

Feature_adaptation:
	 Feature_adaptation1
	| Feature_adaptation2
	| Feature_adaptation3
	| Feature_adaptation4
	| Feature_adaptation5
	;

		-- Note: This is not standard Eiffel but it has
		-- the advantage of making the grammar LR (1).

Feature_adaptation1: Rename New_exports_opt Undefine_opt Redefine_opt
		Select_opt E_END
	;

Feature_adaptation2: New_exports Undefine_opt Redefine_opt
		Select_opt E_END
	;

Feature_adaptation3: Undefine Redefine_opt Select_opt E_END
	;

Feature_adaptation4: Redefine Select_opt E_END
	;

Feature_adaptation5: Select E_END
	;

--------------------------------------------------------------------------------

Rename: E_RENAME Rename_list
	;

Rename_list: -- Empty
	| Feature_name E_AS Feature_name
	| Rename_list ',' Feature_name E_AS Feature_name
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

Feature_set: Feature_list
	| E_ALL
	;

Feature_list: -- Empty
	| Feature_name
	| Feature_list ',' Feature_name
	;

--------------------------------------------------------------------------------

Clients: '{' Class_list '}'
	;

Clients_opt: -- Empty
	| Clients
	;

Class_list: -- Empty
	| Identifier
	| Class_list ',' Identifier
	;

--------------------------------------------------------------------------------

Redefine: E_REDEFINE Feature_list
	;

Redefine_opt: -- Empty
	| Redefine
	;

Undefine: E_UNDEFINE Feature_list
	;

Undefine_opt: -- Empty
	| Undefine
	;

Select: E_SELECT Feature_list
	;

Select_opt: -- Empty
	| Select
	;

--------------------------------------------------------------------------------

Creators_opt: -- Empty
	| Creation_clause
	| Creators_opt Creation_clause
	;

Creation_clause: E_CREATION Clients_opt Procedure_list
	;

		-- Note: Does not support 'Header_comment'.

Procedure_list: -- Empty
	| Identifier
	| Procedure_list ',' Identifier
	;

--------------------------------------------------------------------------------

Features_opt: -- Empty
	| Feature_clause
	| Features_opt Feature_clause
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

Feature_declaration: New_feature_list Declaration_body
	;

Declaration_body: Formal_arguments_opt Type_mark_opt Constant_or_routine_opt
	;

Constant_or_routine_opt: -- Empty
	| E_IS Feature_value
	;

Feature_value: Manifest_constant
	| E_UNIQUE
	| Routine
	;

--------------------------------------------------------------------------------

New_feature_list: New_feature
	| New_feature_list ',' New_feature
	;

New_feature: Feature_name
	| E_FROZEN Feature_name
	;

--------------------------------------------------------------------------------

Feature_name: Identifier
	| E_PREFIX Prefix_operator
	| E_INFIX Infix_operator
	;

Prefix_operator: E_STRNOT
	| E_STRPLUS
	| E_STRMINUS
	| E_STRFREEOP
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

--------------------------------------------------------------------------------

Formal_arguments_opt: -- Empty
	| '(' Entity_declaration_list ')'
	;

Entity_declaration_list: -- Empty
	| Entity_declaration_list_with_no_terminator
	| Entity_declaration_list_with_no_terminator ';'
	;

Entity_declaration_list_with_no_terminator: Entity_declaration_group
	| Entity_declaration_list_with_no_terminator Entity_declaration_group
	| Entity_declaration_list_with_no_terminator ';' Entity_declaration_group
	;

Entity_declaration_group: Identifier_list ':' Type
	;

Identifier_list: Identifier
	| Identifier_list ',' Identifier
	;

Type_mark_opt: -- Empty
	| ':' Type
	;

--------------------------------------------------------------------------------

Routine: Obsolete_opt Precondition_opt Local_declarations_opt
		Routine_body Postcondition_opt Rescue_opt E_END
	;

		-- Note: Does not support 'Header_comment'.

--------------------------------------------------------------------------------

Routine_body: E_DEFERRED
	| E_DO Compound
	| E_ONCE Compound
	| E_EXTERNAL E_STRING External_name_opt
	;

External_name_opt: -- Empty
	| E_ALIAS E_STRING
	;

--------------------------------------------------------------------------------

Local_declarations_opt: -- Empty
	| E_LOCAL Entity_declaration_list
	;

--------------------------------------------------------------------------------

Precondition_opt: -- Empty
	| E_REQUIRE Assertion
	| E_REQUIRE E_ELSE Assertion
	;

Postcondition_opt: -- Empty
	| E_ENSURE Assertion
	| E_ENSURE E_THEN Assertion
	;

Invariant_opt: -- Empty
	| E_INVARIANT Assertion
	;

Assertion: -- Empty
	| Assertion_with_no_terminator
	| Assertion_with_no_terminator ';'
	;

Assertion_with_no_terminator: Assertion_clause
	| Assertion_with_no_terminator Assertion_clause
	| Assertion_with_no_terminator ';' Assertion_clause
	;

Assertion_clause: Expression
		-- Note: Does not support 'Comment' as assertion.
		-- However, this is simulated by the following
		-- production:
	| Identifier ':'
	-- | Identifier ':' Expression
	;

--------------------------------------------------------------------------------

Rescue_opt: -- Empty
	| E_RESCUE Compound
	;

--------------------------------------------------------------------------------

Type: Class_type
	| E_EXPANDED Class_type
	| E_SEPARATE Class_type
	| E_LIKE E_CURRENT
	| E_LIKE Identifier
	| E_BITTYPE Integer_constant
	| E_BITTYPE Identifier
	;

Class_type: Class_name Actual_generics_opt
	;

Class_name: E_IDENTIFIER
	;

Actual_generics_opt: -- Empty
	| '[' Type_list ']'
	;

Type_list: -- Empty
	| Type
	| Type_list ',' Type
	;

--------------------------------------------------------------------------------

Compound: -- Empty
	| Instruction
	| Compound Instruction
	;

Instruction: Creation
	| Call
	| Assignment
	| Conditional
	| Multi_branch
	| Loop
	| Debug
	| Check
	| E_RETRY
	| ';'
	;

--------------------------------------------------------------------------------

Creation: '!' Type '!' Writable Creation_call_opt
	| E_BANGBANG Writable Creation_call_opt
	;

Creation_call_opt: -- Empty
	| '.' Identifier Actuals_opt
	;

--------------------------------------------------------------------------------

Assignment: Writable Assign_op Expression
	;

Assign_op: E_ASSIGN
	| E_REVERSE
	;

--------------------------------------------------------------------------------

Conditional: E_IF Expression E_THEN Compound Elseif_list Else_part E_END
	;

Else_part: -- Empty
	| E_ELSE Compound
	;

Elseif_list: -- Empty
	| E_ELSEIF Expression E_THEN Compound
	| Elseif_list E_ELSEIF Expression E_THEN Compound
	;

--------------------------------------------------------------------------------

Multi_branch: E_INSPECT Expression When_list Else_part E_END
	;

When_list: -- Empty
	| E_WHEN Choices E_THEN Compound
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
	| E_CHARACTER
		-- For Visual Eiffel and TowerEiffel
		-- (not standard Eiffel!):
	| Call
	-- | Identifier
	;

--------------------------------------------------------------------------------

Loop: E_FROM Compound Invariant_opt Variant_opt E_UNTIL Expression
		E_LOOP Compound E_END
	;

Variant_opt: -- Empty
	| E_VARIANT			-- Not standard.
	| E_VARIANT Expression
	| E_VARIANT Identifier ':' Expression
	;

--------------------------------------------------------------------------------

Debug: E_DEBUG Debug_keys_opt Compound E_END
	;

Debug_keys_opt: -- Empty
	| '(' Debug_key_list ')'
	;

Debug_key_list: -- Empty
	| E_STRING
	| Debug_key_list ',' E_STRING
	;

--------------------------------------------------------------------------------

Check: E_CHECK Assertion E_END
	;

--------------------------------------------------------------------------------

Call: Call_chain
	| E_RESULT '.' Call_chain
	| E_CURRENT '.' Call_chain
	| '(' Expression ')' '.' Call_chain
	| E_PRECURSOR Actuals_opt
	| E_PRECURSOR Actuals_opt '.' Call_chain
	| '{' Identifier '}' E_PRECURSOR Actuals_opt
	| '{' Identifier '}' E_PRECURSOR Actuals_opt '.' Call_chain
	;

Call_chain: Identifier Actuals_opt
	| Call_chain '.' Identifier Actuals_opt
	;

--------------------------------------------------------------------------------

Actuals_opt: -- Empty
	| '(' Actual_list ')'
	;

Actual_list: -- Empty
	| Actual
	| Actual_list ',' Actual
	;

Actual:	Expression
	| '$' Address_mark
	;

Address_mark: Feature_name
	| E_CURRENT
	| E_RESULT
		-- Note: The following construct is an
		-- extension of the Eiffel syntax provided
		-- in ISE Eiffel 4 compiler.
	| '(' Expression ')'
	;

Writable: Identifier
	| E_RESULT
	;

--------------------------------------------------------------------------------

Expression: Call
	| E_RESULT
	| E_CURRENT
	| '(' Expression ')'
	| Boolean_constant
	| E_CHARACTER
	| E_INTEGER
	| E_REAL
	| E_STRING
	| E_BIT
	| E_LARRAY Expression_list E_RARRAY
	| '+' Expression %prec E_NOT
	| '-' Expression %prec E_NOT
	| E_NOT Expression
	| E_FREEOP Expression %prec E_NOT
	| Expression E_FREEOP Expression
	| Expression '+' Expression
	| Expression '-' Expression
	| Expression '*' Expression
	| Expression '/' Expression
	| Expression '^' Expression
	| Expression E_DIV Expression
	| Expression E_MOD Expression
	| Expression '=' Expression
	| Expression E_NE Expression
	| Expression '<' Expression
	| Expression '>' Expression
	| Expression E_LE Expression
	| Expression E_GE Expression
	| Expression E_AND Expression
	| Expression E_OR Expression
	| Expression E_XOR Expression
	| Expression E_AND E_THEN Expression
	| Expression E_OR E_ELSE Expression
	| Expression E_IMPLIES Expression
	| E_OLD Expression
	| E_STRIP '(' Attribute_list ')'
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
	| E_CHARACTER
	| Integer_constant
	| Real_constant
	| E_STRING
	| E_BIT
	;

Boolean_constant: E_TRUE
	| E_FALSE
	;

Integer_constant: E_INTEGER
	| '-' E_INTEGER
	| '+' E_INTEGER
	;

Real_constant: E_REAL
	| '-' E_REAL
	| '+' E_REAL
	;

Identifier: E_IDENTIFIER
	| E_BITTYPE
	;

--------------------------------------------------------------------------------
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
			n := Arguments.argument_count
			if n = 0 then
				std.error.put_string ("usage: eiffel_parser filename ...%N")
				Exceptions.die (1)
			else
				from j := 1 until j > n loop
					a_filename := Arguments.argument (j)
					a_file := INPUT_STREAM_.make_file_open_read (a_filename)
					if INPUT_STREAM_.is_open_read (a_file) then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						INPUT_STREAM_.close (a_file)
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
				Arguments.argument_count < 2 or else
				not STRING_.is_integer (Arguments.argument (1))
			then
				std.error.put_string ("usage: eiffel_parser nb filename%N")
				Exceptions.die (1)
			else
				n := Arguments.argument (1).to_integer
				a_filename := Arguments.argument (2)
				from j := 1 until j > n loop
					a_file := INPUT_STREAM_.make_file_open_read (a_filename)
					if INPUT_STREAM_.is_open_read (a_file) then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						INPUT_STREAM_.close (a_file)
					else
						std.error.put_string ("eiffel_parser: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
						Exceptions.die (1)
					end
					j := j + 1
				end
			end
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				std.error.put_string (INPUT_STREAM_.name (f_buffer.file))
				std.error.put_string (", line ")
			else
				std.error.put_string ("line ")
			end
			std.error.put_integer (eif_lineno)
			std.error.put_string (": ")
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

end -- class EIFFEL_PARSER
