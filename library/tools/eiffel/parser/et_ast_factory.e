indexing

	description:

		"Eiffel Abstract Syntax Tree factories"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_AST_FACTORY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_actual_arguments (l: ET_SYMBOL; r: ET_SYMBOL): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_arguments_with_capacity (l: ET_SYMBOL; r: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list with given capacity
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (l, r, nb)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_generics (a_left, a_right: ET_SYMBOL): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			!! Result.make (a_left, a_right)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_actual_generics_with_capacity (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list with given capacity
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_left, a_right, nb)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_all_export (a_clients: ET_CLIENTS; an_all: ET_TOKEN): ET_ALL_EXPORT is
			-- New 'all' export clause
		require
			a_clients_not_void: a_clients /= Void
			an_all_not_void: an_all /= Void
		do
			!! Result.make (a_clients, an_all)
		ensure
			all_export_not_void: Result /= Void
		end

	new_assertion_semicolon (an_assertion: ET_ASSERTION; a_semicolon: ET_SYMBOL): ET_ASSERTION_SEMICOLON is
			-- New assertion followed by a semicolon
		require
			an_assertion_not_void: an_assertion /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			!! Result.make (an_assertion, a_semicolon)
		ensure
			assertion_semicolon_not_void: Result /= Void
		end

	new_assignment (a_target: ET_WRITABLE; an_assign: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT is
			-- New assignment instruction
		require
			a_target_not_void: a_target /= Void
			an_assign_not_void: an_assign /= Void
			a_source_not_void: a_source /= Void
		do
			!! Result.make (a_target, an_assign, a_source)
		ensure
			assignment_not_void: Result /= Void
		end

	new_assignment_attempt (a_target: ET_WRITABLE; a_reverse: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT_ATTEMPT is
			-- New assignment-attempt instruction
		require
			a_target_not_void: a_target /= Void
			a_reverse_not_void: a_reverse /= Void
			a_source_not_void: a_source /= Void
		do
			!! Result.make (a_target, a_reverse, a_source)
		ensure
			assignment_attempt_not_void: Result /= Void
		end

	new_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS;
		an_id: INTEGER): ET_ATTRIBUTE is
			-- New attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, a_type, a_clients, a_class, an_id)
		ensure
			attribute_not_void: Result /= Void
		end

	new_bang_instruction (a_bangbang: ET_SYMBOL; a_target: ET_WRITABLE): ET_BANG_INSTRUCTION is
			-- New bang creation instruction
		require
			a_bangbang_not_void: a_bangbang /= Void
			a_target_not_void: a_target /= Void
		do
			!! Result.make (a_bangbang, a_target)
		ensure
			bang_instruction_not_void: Result /= Void
		end

	new_bit_constant (a_literal: STRING; a_line, a_column: INTEGER): ET_BIT_CONSTANT is
			-- New bit constant
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-1]+[bB]
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_literal, a_line, a_column)
		ensure
			bit_constant_not_void: Result /= Void
		end

	new_bit_identifier (a_bit: ET_TOKEN; an_id: ET_IDENTIFIER): ET_BIT_IDENTIFIER is
			-- New 'BIT Identifier' type
		require
			a_bit_not_void: a_bit /= Void
			an_id_not_void: an_id /= Void
		do
			!! Result.make (a_bit, an_id)
		ensure
			type_not_void: Result /= Void
		end

	new_bit_type (a_bit: ET_TOKEN; an_int: ET_INTEGER_CONSTANT): ET_BIT_TYPE is
			-- New 'BIT N' type
		require
			a_bit_not_void: a_bit /= Void
			an_int_not_void: an_int /= Void
		do
			!! Result.make (a_bit, an_int)
		ensure
			type_not_void: Result /= Void
		end

	new_c1_character_constant (a_value: CHARACTER; a_line, a_column: INTEGER): ET_C1_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		require
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_value, a_line, a_column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_c2_character_constant (a_value: CHARACTER; a_line, a_column: INTEGER): ET_C2_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		require
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_value, a_line, a_column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_c3_character_constant (a_literal: STRING; a_line, a_column: INTEGER): ET_C3_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/`'
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_literal, a_line, a_column)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_call_expression (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_EXPRESSION is
			-- New call expression
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name, args)
		ensure
			call_expression_not_void: Result /= Void
		end

	new_call_instruction (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_INSTRUCTION is
			-- New call instruction
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name, args)
		ensure
			call_instruction_not_void: Result /= Void
		end

	new_check_instruction (a_check: ET_TOKEN; an_end: ET_TOKEN): ET_CHECK_INSTRUCTION is
			-- New check instruction
		require
			a_check_not_void: a_check /= Void
			an_end_not_void: an_end /= Void
		do
			!! Result.make (a_check, an_end)
		ensure
			check_instruction_not_void: Result /= Void
		end

	new_check_instruction_with_capacity (a_check: ET_TOKEN; an_end: ET_TOKEN; nb: INTEGER): ET_CHECK_INSTRUCTION is
			-- New check instruction with given capacity
		require
			a_check_not_void: a_check /= Void
			an_end_not_void: an_end /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_check, an_end, nb)
		ensure
			check_instruction_not_void: Result /= Void
		end

	new_choice_comma (a_choice: ET_CHOICE; a_comma: ET_SYMBOL): ET_CHOICE_COMMA is
			-- New choice-comma
		require
			a_choice_not_void: a_choice /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_choice, a_comma)
		ensure
			choice_comma_not_void: Result /= Void
		end

	new_choice_list (a_choice: ET_CHOICE_ITEM): ET_CHOICE_LIST is
			-- New choice list
		require
			a_choice_not_void: a_choice /= Void
		do
			!! Result.make (a_choice)
		ensure
			choice_list_not_void: Result /= Void
		end

	new_choice_list_with_capacity (a_choice: ET_CHOICE_ITEM; nb: INTEGER): ET_CHOICE_LIST is
			-- New choice list with given capacity
		require
			a_choice_not_void: a_choice /= Void
			nb_positive: nb >= 1
		do
			!! Result.make_with_capacity (a_choice, nb)
		ensure
			choice_list_not_void: Result /= Void
		end

	new_choice_range (a_lower: ET_CHOICE_CONSTANT; a_dotdot: ET_SYMBOL;
		an_upper: ET_CHOICE_CONSTANT): ET_CHOICE_RANGE is
			-- New choice range
		require
			a_lower_not_void: a_lower /= Void
			a_dotdot_not_void: a_dotdot /= Void
			an_upper_not_void: an_upper /= Void
		do
			!! Result.make (a_lower, a_dotdot, an_upper)
		ensure
			choice_range_not_void: Result /= Void
		end

	new_class (a_name: ET_CLASS_NAME; an_id: INTEGER;
		a_universe: ET_UNIVERSE): ET_CLASS is
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, an_id, a_universe)
		ensure
			class_not_void: Result /= Void
		end

	new_class_name_comma (a_name: ET_CLASS_NAME; a_comma: ET_SYMBOL): ET_CLASS_NAME_COMMA is
			-- New class_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_name, a_comma)
		ensure
			class_name_comma_not_void: Result /= Void
		end

	new_class_name_list: ET_CLASS_NAME_LIST is
			-- New empty class name list
		do
			!! Result.make
		ensure
			class_name_list_not_void: Result /= Void
		end

	new_class_name_list_with_capacity (nb: INTEGER): ET_CLASS_NAME_LIST is
			-- New empty class name list with a given capacity
		require
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (nb)
		ensure
			class_name_list_not_void: Result /= Void
		end

	new_class_type (a_type_mark: ET_TYPE_MARK; a_name: ET_CLASS_NAME;
		a_class: ET_CLASS): ET_CLASS_TYPE is
			-- New Eiffel class type
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			!! Result.make (a_type_mark, a_name, a_class)
		ensure
			class_type_not_void: Result /= Void
		end

	new_clients (a_left, a_right: ET_SYMBOL): ET_CLIENTS is
			-- New client clause
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			!! Result.make (a_left, a_right)
		ensure
			clients_not_void: Result /= Void
		end

	new_clients_with_capacity (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_CLIENTS is
			-- New client clause with given capacity
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_left, a_right, nb)
		ensure
			clients_not_void: Result /= Void
		end

	new_compound (a_keyword: ET_TOKEN): ET_COMPOUND is
			-- New instruction compound
		require
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (a_keyword)
		ensure
			compound_not_void: Result /= Void
		end

	new_compound_with_capacity (a_keyword: ET_TOKEN; nb: INTEGER): ET_COMPOUND is
			-- New instruction compound with given capacity
		require
			a_keyword_not_void: a_keyword /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_keyword, nb)
		ensure
			compound_not_void: Result /= Void
		end

	new_constant_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_constant: ET_CONSTANT; a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS;
		an_id: INTEGER): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, a_type, a_constant, a_clients, a_class, an_id)
		ensure
			constant_attribute_not_void: Result /= Void
		end

	new_create_expression (a_create: ET_TOKEN; l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL): ET_CREATE_EXPRESSION is
			-- New create expression
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
		do
			!! Result.make (a_create, l, a_type, r)
		ensure
			create_expression_not_void: Result /= Void
		end

	new_create_instruction (a_create: ET_TOKEN; a_target: ET_WRITABLE): ET_CREATE_INSTRUCTION is
			-- New create instruction
		require
			a_create_not_void: a_create /= Void
			a_target_not_void: a_target /= Void
		do
			!! Result.make (a_create, a_target)
		ensure
			create_instruction_not_void: Result /= Void
		end

	new_creator (a_creation: ET_TOKEN; a_clients: ET_CLASS_NAME_LIST): ET_CREATOR is
			-- New creation clause
		require
			a_creation_not_void: a_creation /= Void
			a_clients_not_void: a_clients /= Void
		do
			!! Result.make (a_creation, a_clients)
		ensure
			creator_not_void: Result /= Void
		end

	new_creator_with_capacity (a_creation: ET_TOKEN; a_clients: ET_CLASS_NAME_LIST; nb: INTEGER): ET_CREATOR is
			-- New creation clause with given capacity
		require
			a_creation_not_void: a_creation /= Void
			a_clients_not_void: a_clients /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_creation, a_clients, nb)
		ensure
			creator_not_void: Result /= Void
		end

	new_creators (a_creator: ET_CREATOR): ET_CREATORS is
			-- New creation clauses
		require
			a_creator_not_void: a_creator /= Void
		do
			!! Result.make (a_creator)
		ensure
			creators_not_void: Result /= Void
		end

	new_creators_with_capacity (a_creator: ET_CREATOR; nb: INTEGER): ET_CREATORS is
			-- New creation clauses with given capacity
		require
			a_creator_not_void: a_creator /= Void
			nb_positive: nb >= 1
		do
			!! Result.make_with_capacity (a_creator, nb)
		ensure
			creators_not_void: Result /= Void
		end

	new_current (a_text: STRING; a_line, a_column: INTEGER): ET_CURRENT is
			-- New current entity
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			current_not_void: Result /= Void
		end

	new_current_address (d: ET_SYMBOL; c: ET_CURRENT): ET_CURRENT_ADDRESS is
			-- New address of Current
		require
			d_not_void: d /= Void
			c_not_void: c /= Void
		do
			!! Result.make (d, c)
		ensure
			current_address_not_void: Result /= Void
		end

	new_debug_instruction (a_debug: ET_TOKEN; a_keys: ET_DEBUG_KEYS; an_end: ET_TOKEN): ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		require
			a_debug_not_void: a_debug /= Void
			an_end_not_void: an_end /= Void
		do
			!! Result.make (a_debug, a_keys, an_end)
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_debug_instruction_with_capacity (a_debug: ET_TOKEN; a_keys: ET_DEBUG_KEYS;
		an_end: ET_TOKEN; nb: INTEGER): ET_DEBUG_INSTRUCTION is
			-- New debug instruction with given capacity
		require
			a_debug_not_void: a_debug /= Void
			an_end_not_void: an_end /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_debug, a_keys, an_end, nb)
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_debug_keys (l: ET_SYMBOL; r: ET_SYMBOL): ET_DEBUG_KEYS is
			-- New debug keys
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			debug_keys_not_void: Result /= Void
		end

	new_debug_keys_with_capacity (l: ET_SYMBOL; r: ET_SYMBOL; nb: INTEGER): ET_DEBUG_KEYS is
			-- New debug keys with given capacity
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (l, r, nb)
		ensure
			debug_keys_not_void: Result /= Void
		end

	new_deferred_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLASS_NAME_LIST;
		a_class: ET_CLASS; an_id: INTEGER): ET_DEFERRED_FUNCTION is
			-- New deferred function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, a_type, an_obsolete,
				a_preconditions, a_postconditions, a_clients, a_class, an_id)
		ensure
			deferred_function_not_void: Result /= Void
		end

	new_deferred_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLASS_NAME_LIST;
		a_class: ET_CLASS; an_id: INTEGER): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, an_obsolete, a_preconditions,
				a_postconditions, a_clients, a_class, an_id)
		ensure
			deferred_procedure_not_void: Result /= Void
		end

	new_do_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS; an_id: INTEGER): ET_DO_FUNCTION is
			-- New do function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, a_type, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
		ensure
			do_function_not_void: Result /= Void
		end

	new_do_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS; an_id: INTEGER): ET_DO_PROCEDURE is
			-- New do procedure
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
		ensure
			do_procedure_not_void: Result /= Void
		end

	new_elseif_part (an_elseif: ET_TOKEN; an_expression: ET_EXPRESSION;
		a_then_compound: ET_COMPOUND): ET_ELSEIF_PART is
			-- New elseif part
		require
			an_elseif_not_void: an_elseif /= Void
			an_expression_not_void: an_expression /= Void
			a_then_compound_not_void: a_then_compound /= Void
		do
			!! Result.make (an_elseif, an_expression, a_then_compound)
		ensure
			elseif_part_not_void: Result /= Void
		end

	new_elseif_part_list (an_elseif_part: ET_ELSEIF_PART): ET_ELSEIF_PART_LIST is
			-- New elseif part list
		require
			an_elseif_part_not_void: an_elseif_part /= Void
		do
			!! Result.make (an_elseif_part)
		ensure
			elseif_part_list_not_void: Result /= Void
		end

	new_elseif_part_list_with_capacity (an_elseif_part: ET_ELSEIF_PART; nb: INTEGER): ET_ELSEIF_PART_LIST is
			-- New elseif part list with given capacity
		require
			an_elseif_part_not_void: an_elseif_part /= Void
			nb_positive: nb >= 1
		do
			!! Result.make_with_capacity (an_elseif_part, nb)
		ensure
			elseif_part_list_not_void: Result /= Void
		end

	new_equality_expression (l: ET_EXPRESSION; an_op: ET_EQUALITY_SYMBOL; r: ET_EXPRESSION): ET_EQUALITY_EXPRESSION is
			-- New equality expression
		require
			l_not_void: l /= Void
			an_op_not_void: an_op /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, an_op, r)
		ensure
			equality_expression_not_void: Result /= Void
		end

	new_equal_symbol (a_line, a_column: INTEGER): ET_EQUAL_SYMBOL is
			-- New '=' symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			equal_symbol_not_void: Result /= Void
		end

	new_expanded_mark (a_text: STRING; a_line, a_column: INTEGER): ET_EXPANDED_MARK is
			-- New 'expanded' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			expanded_mark_not_void: Result /= Void
		end

	new_exports (an_export: ET_TOKEN): ET_EXPORTS is
			-- New export clause
		require
			an_export_not_void: an_export /= Void
		do
			!! Result.make (an_export)
		ensure
			exports_not_void: Result /= Void
		end

	new_exports_with_capacity (an_export: ET_TOKEN; nb: INTEGER): ET_EXPORTS is
			-- New export clause with given capacity
		require
			an_export_not_void: an_export /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (an_export, nb)
		ensure
			exports_not_void: Result /= Void
		end

	new_expression_address (d: ET_SYMBOL; e: ET_PARENTHESIZED_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		require
			d_not_void: d /= Void
			e_not_void: e /= Void
		do
			!! Result.make (d, e)
		ensure
			expression_address_not_void: Result /= Void
		end

	new_expression_comma (an_expression: ET_EXPRESSION; a_comma: ET_SYMBOL): ET_EXPRESSION_COMMA is
			-- New expression-comma
		require
			an_expression_not_void: an_expression /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (an_expression, a_comma)
		ensure
			expression_comma_not_void: Result /= Void
		end

	new_expression_variant (a_variant: ET_TOKEN; an_expression: ET_EXPRESSION): ET_EXPRESSION_VARIANT is
			-- New loop expression variant
		require
			a_variant_not_void: a_variant /= Void
			an_expression_not_void: an_expression /= Void
		do
			!! Result.make (a_variant, an_expression)
		ensure
			expression_variant_not_void: Result /= Void
		end

	new_external_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLASS_NAME_LIST;
		a_class: ET_CLASS; an_id: INTEGER): ET_EXTERNAL_FUNCTION is
			-- New external function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, a_type, an_obsolete,
				a_preconditions, a_language, an_alias, a_postconditions,
				a_clients, a_class, an_id)
		ensure
			external_function_not_void: Result /= Void
		end

	new_external_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLASS_NAME_LIST;
		a_class: ET_CLASS; an_id: INTEGER): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, an_obsolete, a_preconditions,
				a_language, an_alias, a_postconditions, a_clients,
				a_class, an_id)
		ensure
			external_procedure_not_void: Result /= Void
		end

	new_false_constant (a_text: STRING; a_line, a_column: INTEGER): ET_FALSE_CONSTANT is
			-- New False constant
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			false_constant_not_void: Result /= Void
		end

	new_feature_address (d: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_FEATURE_ADDRESS is
			-- New feature address
		require
			d_not_void: d /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (d, a_name)
		ensure
			feature_address_not_void: Result /= Void
		end

	new_feature_export (a_clients: ET_CLIENTS): ET_FEATURE_EXPORT is
			-- New feature export clause
		require
			a_clients_not_void: a_clients /= Void
		do
			!! Result.make (a_clients)
		ensure
			feature_export_not_void: Result /= Void
		end

	new_feature_export_with_capacity (a_clients: ET_CLIENTS; nb: INTEGER): ET_FEATURE_EXPORT is
			-- New feature export clause with given capacity
		require
			a_clients_not_void: a_clients /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_clients, nb)
		ensure
			feature_export_not_void: Result /= Void
		end

	new_feature_name_comma (a_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_FEATURE_NAME_COMMA is
			-- New feature_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_name, a_comma)
		ensure
			feature_name_comma_not_void: Result /= Void
		end

	new_formal_arguments (a_name: ET_IDENTIFIER; a_type: ET_TYPE): ET_FORMAL_ARGUMENTS is
			-- New formal argument list with initially
			-- one argument `a_name' of type `a_type'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			!! Result.make (a_name, a_type)
		ensure
			formal_arguments_not_void: Result /= Void
		end

	new_formal_generic (a_name: ET_IDENTIFIER; a_constraint: ET_TYPE): ET_FORMAL_GENERIC_PARAMETER is
			-- New formal generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name, a_constraint)
		ensure
			formal_generic_not_void: Result /= Void
		end

	new_formal_generic_type (a_name: ET_IDENTIFIER; an_index: INTEGER): ET_FORMAL_GENERIC_TYPE is
			-- New formal generic parameter type
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name, an_index)
		ensure
			formal_generic_type_not_void: Result /= Void
		end

	new_formal_generics (a_parameter: ET_FORMAL_GENERIC_PARAMETER): ET_FORMAL_GENERIC_PARAMETERS is
			-- New formal generic parameter list with initially
			-- one formal generic parameter `a_parameter'
		require
			a_parameter_not_void: a_parameter /= Void
		do
			!! Result.make (a_parameter)
		ensure
			formal_generics_not_void: Result /= Void
		end

	new_free_operator (a_string: STRING; a_line, a_column: INTEGER): ET_FREE_OPERATOR is
			-- New free operator
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_string, a_line, a_column)
		ensure
			free_operator_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_generic_class_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics; a_class: ET_CLASS): ET_GENERIC_CLASS_TYPE is
			-- New Eiffel generic class type
		require
			a_name_not_void: a_name /= Void
			a_generics_not_void: a_generics /= Void
			a_class_not_void: a_class /= Void
		do
			!! Result.make (a_type_mark, a_name, a_generics, a_class)
		ensure
			class_type_not_void: Result /= Void
		end

	new_generic_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_GENERIC_NAMED_TYPE is
			-- New Eiffel generic named type
		require
			a_name_not_void: a_name /= Void
			a_generics_not_void: a_generics /= Void
		do
			!! Result.make (a_type_mark, a_name, a_generics)
		ensure
			generic_named_type_not_void: Result /= Void
		end

	new_identifier (a_text: STRING; a_line, a_column: INTEGER): ET_IDENTIFIER is
			-- New identifier
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			identifier_not_void: Result /= Void
		end

	new_identifier_colon (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_IDENTIFIER_COLON is
			-- New identifier-colon
		require
			a_name_not_void: a_name /= Void
			a_colon_not_void: a_colon /= Void
		do
			!! Result.make (a_name, a_colon)
		ensure
			identifier_colon_not_void: Result /= Void
		end

	new_identifier_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_IDENTIFIER_COMMA is
			-- New identifier-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_name, a_comma)
		ensure
			identifier_comma_not_void: Result /= Void
		end

	new_if_instruction (an_if: ET_TOKEN; an_expression: ET_EXPRESSION;
		a_then_compound: ET_COMPOUND; an_end: ET_TOKEN): ET_IF_INSTRUCTION is
			-- New if instruction
		require
			an_if_not_void: an_if /= Void
			an_expression_not_void: an_expression /= Void
			a_then_compound_not_void: a_then_compound /= Void
			an_end_not_void: an_end /= Void
		do
			!! Result.make (an_if, an_expression, a_then_compound, an_end)
		ensure
			if_instruction_not_void: Result /= Void
		end

	new_infix_and_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_AND_NAME is
			-- New infix "and" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_and_name_not_void: Result /= Void
		end

	new_infix_and_operator (a_text: STRING; a_line, a_column: INTEGER): ET_INFIX_AND_OPERATOR is
			-- New binary "and" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			infix_and_operator_not_void: Result /= Void
		end

	new_infix_and_then_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_AND_THEN_NAME is
			-- New infix "and then" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_and_then_name_not_void: Result /= Void
		end

	new_infix_and_then_operator (an_and: ET_TOKEN; a_then: ET_TOKEN): ET_INFIX_AND_THEN_OPERATOR is
			-- New binary "and then" operator
		require
			an_and_not_void: an_and /= Void
			a_then_not_void: a_then /= Void
		do
			!! Result.make (an_and, a_then)
		ensure
			infix_and_then_operator_not_void: Result /= Void
		end

	new_infix_div_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_DIV_NAME is
			-- New infix "//" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_div_name_not_void: Result /= Void
		end

	new_infix_div_operator (a_line, a_column: INTEGER): ET_INFIX_DIV_OPERATOR is
			-- New binary "//" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_div_operator_not_void: Result /= Void
		end

	new_infix_divide_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_DIVIDE_NAME is
			-- New infix "//" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_divide_name_not_void: Result /= Void
		end

	new_infix_divide_operator (a_line, a_column: INTEGER): ET_INFIX_DIVIDE_OPERATOR is
			-- New binary "//" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_divide_operator_not_void: Result /= Void
		end

	new_infix_expression (l: ET_EXPRESSION; a_name: ET_INFIX_OPERATOR;
		r: ET_EXPRESSION): ET_INFIX_EXPRESSION is
			-- New infix expression
		require
			l_not_void: l /= Void
			a_name_not_void: a_name /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, a_name, r)
		ensure
			infix_expression_not_void: Result /= Void
		end

	new_infix_free_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
			an_operator_computed: an_operator.computed
			an_operator_not_empty: an_operator.value.count > 0
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_free_name_not_void: Result /= Void
		end

	new_infix_ge_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_GE_NAME is
			-- New infix ">=" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_ge_name_not_void: Result /= Void
		end

	new_infix_ge_operator (a_line, a_column: INTEGER): ET_INFIX_GE_OPERATOR is
			-- New binary ">=" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_ge_operator_not_void: Result /= Void
		end

	new_infix_gt_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_GT_NAME is
			-- New infix ">" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_gt_name_not_void: Result /= Void
		end

	new_infix_gt_operator (a_line, a_column: INTEGER): ET_INFIX_GT_OPERATOR is
			-- New binary ">" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_gt_operator_not_void: Result /= Void
		end

	new_infix_implies_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_IMPLIES_NAME is
			-- New infix "implies" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_implies_name_not_void: Result /= Void
		end

	new_infix_implies_operator (a_text: STRING; a_line, a_column: INTEGER): ET_INFIX_IMPLIES_OPERATOR is
			-- New binary "implies" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			infix_implies_operator_not_void: Result /= Void
		end

	new_infix_le_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_LE_NAME is
			-- New infix "<=" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_le_name_not_void: Result /= Void
		end

	new_infix_le_operator (a_line, a_column: INTEGER): ET_INFIX_LE_OPERATOR is
			-- New binary "<=" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_le_operator_not_void: Result /= Void
		end

	new_infix_lt_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_LT_NAME is
			-- New infix "<" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_lt_name_not_void: Result /= Void
		end

	new_infix_lt_operator (a_line, a_column: INTEGER): ET_INFIX_LT_OPERATOR is
			-- New binary "<" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_lt_operator_not_void: Result /= Void
		end

	new_infix_minus_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_MINUS_NAME is
			-- New infix "-" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_minus_name_not_void: Result /= Void
		end

	new_infix_mod_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_MOD_NAME is
			-- New infix "\\" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_mod_name_not_void: Result /= Void
		end

	new_infix_mod_operator (a_line, a_column: INTEGER): ET_INFIX_MOD_OPERATOR is
			-- New binary "\\" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_mod_operator_not_void: Result /= Void
		end

	new_infix_or_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_OR_NAME is
			-- New infix "or" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_or_name_not_void: Result /= Void
		end

	new_infix_or_operator (a_text: STRING; a_line, a_column: INTEGER): ET_INFIX_OR_OPERATOR is
			-- New binary "or" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			infix_or_operator_not_void: Result /= Void
		end

	new_infix_or_else_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_OR_ELSE_NAME is
			-- New infix "or else" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_or_else_name_not_void: Result /= Void
		end

	new_infix_or_else_operator (an_or: ET_TOKEN; an_else: ET_TOKEN): ET_INFIX_OR_ELSE_OPERATOR is
			-- New binary "or else" operator
		require
			an_or_not_void: an_or /= Void
			an_else_not_void: an_else /= Void
		do
			!! Result.make (an_or, an_else)
		ensure
			infix_or_else_operator_not_void: Result /= Void
		end

	new_infix_plus_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_PLUS_NAME is
			-- New infix "+" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_plus_name_not_void: Result /= Void
		end

	new_infix_power_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_POWER_NAME is
			-- New infix "^" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_power_name_not_void: Result /= Void
		end

	new_infix_power_operator (a_line, a_column: INTEGER): ET_INFIX_POWER_OPERATOR is
			-- New binary "^" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_power_operator_not_void: Result /= Void
		end

	new_infix_times_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_TIMES_NAME is
			-- New infix "*" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_times_name_not_void: Result /= Void
		end

	new_infix_times_operator (a_line, a_column: INTEGER): ET_INFIX_TIMES_OPERATOR is
			-- New binary "*" operator
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			infix_times_operator_not_void: Result /= Void
		end

	new_infix_xor_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_XOR_NAME is
			-- New infix "xor" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (an_infix, an_operator)
		ensure
			infix_xor_name_not_void: Result /= Void
		end

	new_infix_xor_operator (a_text: STRING; a_line, a_column: INTEGER): ET_INFIX_XOR_OPERATOR is
			-- New binary "xor" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			infix_xor_operator_not_void: Result /= Void
		end

	new_inspect_instruction (an_inspect: ET_TOKEN; an_expression: ET_EXPRESSION;
		an_end: ET_TOKEN): ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		require
			an_inspect_not_void: an_inspect /= Void
			an_expression_not_void: an_expression /= Void
			an_end_not_void: an_end /= Void
		do
			!! Result.make (an_inspect, an_expression, an_end)
		ensure
			inspect_instruction_not_void: Result /= Void
		end

	new_invariants (an_invariant: ET_TOKEN): ET_INVARIANTS is
			-- New invariants
		require
			an_invariant_not_void: an_invariant /= Void
		do
			!! Result.make (an_invariant)
		ensure
			invariants_not_void: Result /= Void
		end

	new_invariants_with_capacity (an_invariant: ET_TOKEN; nb: INTEGER): ET_INVARIANTS is
			-- New invariants with given capacity
		require
			an_invariant_not_void: an_invariant /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (an_invariant, nb)
		ensure
			invariants_not_void: Result /= Void
		end

	new_keyword_feature_name_list (a_keyword: ET_TOKEN): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list preceded by a keyword
		require
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (a_keyword)
		ensure
			keyword_feature_name_list_not_void: Result /= Void
		end

	new_keyword_feature_name_list_with_capacity (a_keyword: ET_TOKEN; nb: INTEGER): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list, with a given capacity, preceded by a keyword
		require
			a_keyword_not_void: a_keyword /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_keyword, nb)
		ensure
			keyword_feature_name_list_not_void: Result /= Void
		end

	new_like_current (a_like: ET_TOKEN; a_current: ET_TOKEN): ET_LIKE_CURRENT is
			-- New 'like Current' type
		require
			a_like_not_void: a_like /= Void
			a_current_not_void: a_current /= Void
		do
			!! Result.make (a_like, a_current)
		ensure
			type_not_void: Result /= Void
		end

	new_like_identifier (a_like: ET_TOKEN; a_name: ET_IDENTIFIER): ET_LIKE_IDENTIFIER is
			-- New 'like Identifier' type
		require
			a_like_not_void: a_like /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_like, a_name)
		ensure
			type_not_void: Result /= Void
		end

	new_local_variables (a_name: ET_IDENTIFIER; a_type: ET_TYPE): ET_LOCAL_VARIABLES is
			-- New local variable list with initially
			-- one variable `a_name' of type `a_type'
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			!! Result.make (a_name, a_type)
		ensure
			local_variables_not_void: Result /= Void
		end

	new_loop_instruction (a_from_compound: ET_COMPOUND;
		an_invariant: ET_INVARIANTS; a_variant: ET_VARIANT;
		an_until: ET_TOKEN; an_until_expression: ET_EXPRESSION;
		a_loop_compound: ET_COMPOUND;
		an_end: ET_TOKEN): ET_LOOP_INSTRUCTION is
			-- New loop instruction
		require
			a_from_compound_not_void: a_from_compound /= Void
			an_until_not_void: an_until /= Void
			an_until_expression_not_void: an_until_expression /= Void
			a_loop_compound_not_void: a_loop_compound /= Void
			an_end_not_void: an_end /= Void
		do
			!! Result.make (a_from_compound, an_invariant, a_variant,
				an_until, an_until_expression, a_loop_compound, an_end)
		ensure
			loop_instruction_not_void: Result /= Void
		end

	new_manifest_array (l: ET_SYMBOL; r: ET_SYMBOL): ET_MANIFEST_ARRAY is
			-- New manifest array
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_manifest_array_with_capacity (l: ET_SYMBOL; r: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_ARRAY is
			-- New manifest array with given capacity
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (l, r, nb)
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_manifest_string_comma (a_string: ET_MANIFEST_STRING; a_comma: ET_SYMBOL): ET_MANIFEST_STRING_COMMA is
			-- New manifest_string-comma
		require
			a_string_not_void: a_string /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_string, a_comma)
		ensure
			manifest_string_comma_not_void: Result /= Void
		end

	new_manifest_tuple (l: ET_SYMBOL; r: ET_SYMBOL): ET_MANIFEST_TUPLE is
			-- New manifest tuple
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			manifest_tuple_not_void: Result /= Void
		end

	new_manifest_tuple_with_capacity (l: ET_SYMBOL; r: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_TUPLE is
			-- New manifest tuple with given capacity
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (l, r, nb)
		ensure
			manifest_tuple_not_void: Result /= Void
		end

	new_minus_symbol (a_line, a_column: INTEGER): ET_MINUS_SYMBOL is
			-- New '-' symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			minus_symbol_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER): ET_NAMED_TYPE is
			-- New Eiffel named type
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_type_mark, a_name)
		ensure
			named_type_not_void: Result /= Void
		end

	new_none_clients (a_left, a_right: ET_SYMBOL): ET_NONE_CLIENTS is
			-- Client list of the form {}
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			!! Result.make (a_left, a_right)
		ensure
			none_clients_not_void: Result /= Void
		end

	new_not_equal_symbol (a_line, a_column: INTEGER): ET_NOT_EQUAL_SYMBOL is
			-- New '/=' symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			not_equal_symbol_not_void: Result /= Void
		end

	new_old_expression (an_old: ET_TOKEN; e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		require
			an_old_not_void: an_old /= Void
			e_not_void: e /= Void
		do
			!! Result.make (an_old, e)
		ensure
			old_expression_not_void: Result /= Void
		end

	new_once_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS; an_id: INTEGER): ET_ONCE_FUNCTION is
			-- New once function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, a_type, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
		ensure
			once_function_not_void: Result /= Void
		end

	new_once_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS; an_id: INTEGER): ET_ONCE_PROCEDURE is
			-- New once procedure
		require
			a_name_not_void: a_name /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, args, an_obsolete, a_preconditions,
				a_locals, a_compound, a_postconditions, a_rescue, a_clients, a_class, an_id)
		ensure
			once_procedure_not_void: Result /= Void
		end

	new_parent (a_type: ET_CLASS_TYPE; a_renames: ET_RENAMES; an_exports: ET_EXPORTS;
		an_undefines, a_redefines, a_selects: ET_KEYWORD_FEATURE_NAME_LIST): ET_PARENT is
			-- New parent
		do
			!! Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
		ensure
			parent_not_void: Result /= Void
		end

	new_parenthesized_expression (l: ET_SYMBOL; e: ET_EXPRESSION; r: ET_SYMBOL): ET_PARENTHESIZED_EXPRESSION is
			-- New parenthesized expression
		require
			l_not_void: l /= Void
			e_not_void: e /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, e, r)
		ensure
			parenthesized_expression_not_void: Result /= Void
		end

	new_parents (a_parent: ET_PARENT): ET_PARENTS is
			-- New parent list with one parent `a_parent'
		require
			a_parent_not_void: a_parent /= Void
		do
			!! Result.make (a_parent)
		ensure
			parents_not_void: Result /= Void
		end

	new_plus_symbol (a_line, a_column: INTEGER): ET_PLUS_SYMBOL is
			-- New '+' symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			plus_symbol_not_void: Result /= Void
			is_prefix: Result.is_prefix
		end

	new_postconditions (an_ensure: ET_TOKEN): ET_POSTCONDITIONS is
			-- New postconditions
		require
			an_ensure_not_void: an_ensure /= Void
		do
			!! Result.make (an_ensure)
		ensure
			postconditions_not_void: Result /= Void
		end

	new_postconditions_with_capacity (an_ensure: ET_TOKEN; nb: INTEGER): ET_POSTCONDITIONS is
			-- New postconditions with given capacity
		require
			an_ensure_not_void: an_ensure /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (an_ensure, nb)
		ensure
			postconditions_not_void: Result /= Void
		end

	new_preconditions (a_require: ET_TOKEN): ET_PRECONDITIONS is
			-- New preconditions
		require
			a_require_not_void: a_require /= Void
		do
			!! Result.make (a_require)
		ensure
			preconditions_not_void: Result /= Void
		end

	new_preconditions_with_capacity (a_require: ET_TOKEN; nb: INTEGER): ET_PRECONDITIONS is
			-- New preconditions with given capacity
		require
			a_require_not_void: a_require /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_require, nb)
		ensure
			preconditions_not_void: Result /= Void
		end

	new_precursor_expression (a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		require
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (a_keyword, args)
		ensure
			precursor_expression_not_void: Result /= Void
		end

	new_precursor_instruction (a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		require
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (a_keyword, args)
		ensure
			precursor_instruction_not_void: Result /= Void
		end

	new_prefix_expression (a_name: ET_PREFIX_OPERATOR; e: ET_EXPRESSION): ET_PREFIX_EXPRESSION is
			-- New prefix expression
		require
			a_name_not_void: a_name /= Void
			e_not_void: e /= Void
		do
			!! Result.make (a_name, e)
		ensure
			prefix_expression_not_void: Result /= Void
		end

	new_prefix_free_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New prefix free feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
			an_operator_computed: an_operator.computed
			an_operator_not_empty: an_operator.value.count > 0
		do
			!! Result.make (a_prefix, an_operator)
		ensure
			prefix_free_name_not_void: Result /= Void
		end

	new_prefix_minus_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_MINUS_NAME is
			-- New prefix "-" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (a_prefix, an_operator)
		ensure
			prefix_minus_name_not_void: Result /= Void
		end

	new_prefix_not_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NOT_NAME is
			-- New prefix "not" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (a_prefix, an_operator)
		ensure
			prefix_not_name_not_void: Result /= Void
		end

	new_prefix_not_operator (a_text: STRING; a_line, a_column: INTEGER): ET_PREFIX_NOT_OPERATOR is
			-- New unary "not" operator
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			prefix_not_operator_not_void: Result /= Void
		end

	new_prefix_plus_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_PLUS_NAME is
			-- New prefix "+" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			!! Result.make (a_prefix, an_operator)
		ensure
			prefix_plus_name_not_void: Result /= Void
		end

	new_qualified_bang_instruction (a_bangbang: ET_SYMBOL; a_target: ET_WRITABLE; a_dot: ET_SYMBOL;
		a_name: ET_FEATURE_NAME; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_BANG_INSTRUCTION is
			-- New qualified bang creation instruction
		require
			a_bangbang_not_void: a_bangbang /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_bangbang, a_target, a_dot, a_name, args)
		ensure
			qualified_bang_instruction_not_void: Result /= Void
		end

	new_qualified_call_expression (a_target: ET_EXPRESSION; a_dot: ET_SYMBOL; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_CALL_EXPRESSION is
			-- New qualified call expression
		require
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_target, a_dot, a_name, args)
		ensure
			qualified_call_expression_not_void: Result /= Void
		end

	new_qualified_call_instruction (a_target: ET_EXPRESSION; a_dot: ET_SYMBOL; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_CALL_INSTRUCTION is
			-- New qualified call instruction
		require
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_target, a_dot, a_name, args)
		ensure
			qualified_call_instruction_not_void: Result /= Void
		end

	new_qualified_create_expression (a_create: ET_TOKEN; l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL; a_dot: ET_SYMBOL; a_name: ET_FEATURE_NAME;
		args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_CREATE_EXPRESSION is
			-- New qualified create expression
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_create, l, a_type, r, a_dot, a_name, args)
		ensure
			qualified_create_expression_not_void: Result /= Void
		end

	new_qualified_create_instruction (a_create: ET_TOKEN; a_target: ET_WRITABLE; a_dot: ET_SYMBOL;
		a_name: ET_FEATURE_NAME; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_CREATE_INSTRUCTION is
			-- New qualified create instruction
		require
			a_create_not_void: a_create /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_create, a_target, a_dot, a_name, args)
		ensure
			qualified_create_instruction_not_void: Result /= Void
		end

	new_qualified_precursor_expression (l: ET_SYMBOL; a_parent: ET_IDENTIFIER; r: ET_SYMBOL;
		a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_PRECURSOR_EXPRESSION is
			-- New qualified precursor expression
		require
			l_not_void: l /= Void
			a_parent_not_void: a_parent /= Void
			r_not_void: r /= Void
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (l, a_parent, r, a_keyword, args)
		ensure
			qualified_precursor_expression_not_void: Result /= Void
		end

	new_qualified_precursor_instruction (l: ET_SYMBOL; a_parent: ET_IDENTIFIER; r: ET_SYMBOL;
		a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_PRECURSOR_INSTRUCTION is
			-- New qualified precursor instruction
		require
			l_not_void: l /= Void
			a_parent_not_void: a_parent /= Void
			r_not_void: r /= Void
			a_keyword_not_void: a_keyword /= Void
		do
			!! Result.make (l, a_parent, r, a_keyword, args)
		ensure
			qualified_precursor_instruction_not_void: Result /= Void
		end

	new_qualified_typed_bang_instruction (l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL; a_target: ET_WRITABLE; a_dot: ET_SYMBOL; a_name: ET_FEATURE_NAME;
		args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_TYPED_BANG_INSTRUCTION is
			-- New qualified typed bang creation instruction
		require
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (l, a_type, r, a_target, a_dot, a_name, args)
		ensure
			qualified_typed_bang_instruction_not_void: Result /= Void
		end

	new_qualified_typed_create_instruction (a_create: ET_TOKEN; l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL; a_target: ET_WRITABLE; a_dot: ET_SYMBOL; a_name: ET_FEATURE_NAME;
		args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_TYPED_CREATE_INSTRUCTION is
			-- New qualified typed create instruction
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
			a_dot_not_void: a_dot /= Void
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_create, l, a_type, r, a_target, a_dot, a_name, args)
		ensure
			qualified_typed_create_instruction_not_void: Result /= Void
		end

	new_reference_mark (a_text: STRING; a_line, a_column: INTEGER): ET_REFERENCE_MARK is
			-- New 'reference' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			reference_mark_not_void: Result /= Void
		end

	new_regular_integer_constant (a_literal: STRING; a_position: ET_POSITION): ET_REGULAR_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_literal, a_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_regular_manifest_string (a_literal: STRING; a_line, a_column: INTEGER): ET_REGULAR_MANIFEST_STRING is
			-- New manifest string with no special character
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"[^"%\n]*\"
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_literal, a_line, a_column)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_regular_real_constant (a_literal: STRING; a_position: ET_POSITION): ET_REGULAR_REAL_CONSTANT is
			-- New real constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_literal, a_position)
		ensure
			real_constant_not_void: Result /= Void
		end

	new_rename (old_name: ET_FEATURE_NAME; an_as: ET_TOKEN; new_name: ET_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		require
			old_name_not_void: old_name /= Void
			an_as_not_void: an_as /= Void
			new_name_not_void: new_name /= Void
		do
			!! Result.make (old_name, an_as, new_name)
		ensure
			rename_not_void: Result /= Void
		end

	new_rename_comma (old_name: ET_FEATURE_NAME; an_as: ET_TOKEN;
		new_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_RENAME_COMMA is
			-- New rename pair followed by a comma
		require
			old_name_not_void: old_name /= Void
			an_as_not_void: an_as /= Void
			new_name_not_void: new_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (old_name, an_as, new_name, a_comma)
		ensure
			rename_comma_not_void: Result /= Void
		end

	new_renames (a_rename: ET_TOKEN): ET_RENAMES is
			-- New rename clause
		require
			a_rename_not_void: a_rename /= Void
		do
			!! Result.make (a_rename)
		ensure
			renames_not_void: Result /= Void
		end

	new_renames_with_capacity (a_rename: ET_TOKEN; nb: INTEGER): ET_RENAMES is
			-- New rename clause with given capacity
		require
			a_rename_not_void: a_rename /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_rename, nb)
		ensure
			renames_not_void: Result /= Void
		end

	new_result (a_text: STRING; a_line, a_column: INTEGER): ET_RESULT is
			-- New result entity
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			result_not_void: Result /= Void
		end

	new_result_address (d: ET_SYMBOL; r: ET_RESULT): ET_RESULT_ADDRESS is
			-- New address of Result
		require
			d_not_void: d /= Void
			r_not_void: r /= Void
		do
			!! Result.make (d, r)
		ensure
			result_address_not_void: Result /= Void
		end

	new_retry_instruction (a_text: STRING; a_line, a_column: INTEGER): ET_RETRY_INSTRUCTION is
			-- New retry instruction
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			retry_instruction_not_void: Result /= Void
		end

	new_semicolon_symbol (a_line, a_column: INTEGER): ET_SEMICOLON_SYMBOL is
			-- New ';' symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			semicolon_symbol_not_void: Result /= Void
		end

	new_separate_mark (a_text: STRING; a_line, a_column: INTEGER): ET_SEPARATE_MARK is
			-- New 'separate' keyword
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			separate_mark_not_void: Result /= Void
		end

	new_special_manifest_string (a_literal: STRING; a_line, a_column: INTEGER): ET_SPECIAL_MANIFEST_STRING is
			-- New manifest string with special characters
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*\"
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_literal, a_line, a_column)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_strip_expression (a_strip: ET_TOKEN; l: ET_SYMBOL; r: ET_SYMBOL): ET_STRIP_EXPRESSION is
			-- New strip expression
		require
			a_strip_not_void: a_strip /= Void
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (a_strip, l, r)
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_strip_expression_with_capacity (a_strip: ET_TOKEN; l: ET_SYMBOL;
		r: ET_SYMBOL; nb: INTEGER): ET_STRIP_EXPRESSION is
			-- New strip expression with given capacity
		require
			a_strip_not_void: a_strip /= Void
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			!! Result.make_with_capacity (a_strip, l, r, nb)
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_symbol (a_line, a_column: INTEGER): ET_SYMBOL is
			-- New lexical symbol
		require
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_line, a_column)
		ensure
			symbol_not_void: Result /= Void
		end

	new_tagged_assertion (a_tag: ET_TAG): ET_TAGGED_ASSERTION is
			-- New tagged assertion
		require
			a_tag_not_void: a_tag /= Void
		do
			!! Result.make (a_tag)
		ensure
			tagged_assertion_not_void: Result /= Void
		end

	new_tagged_expression_variant (a_variant: ET_TOKEN; a_tag: ET_IDENTIFIER;
		a_colon: ET_SYMBOL; an_expression: ET_EXPRESSION): ET_TAGGED_EXPRESSION_VARIANT is
			-- New loop tagged expression variant
		require
			a_variant_not_void: a_variant /= Void
			a_tag_not_void: a_tag /= Void
			a_colon_not_void: a_colon /= Void
			an_expression_not_void: an_expression /= Void
		do
			!! Result.make (a_variant, a_tag, a_colon, an_expression)
		ensure
			tagged_expression_variant_not_void: Result /= Void
		end

	new_token (a_text: STRING; a_line, a_column: INTEGER): ET_TOKEN is
			-- New token
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			token_not_void: Result /= Void
		end

	new_true_constant (a_text: STRING; a_line, a_column: INTEGER): ET_TRUE_CONSTANT is
			-- New True constant
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
			a_line_positive: a_line >= 0
			a_column_positive: a_column >= 0
		do
			!! Result.make_with_position (a_text, a_line, a_column)
		ensure
			true_constant_not_void: Result /= Void
		end

	new_type_comma (a_type: ET_TYPE; a_comma: ET_SYMBOL): ET_TYPE_COMMA is
			-- New type-comma
		require
			a_type_not_void: a_type /= Void
			a_comma_not_void: a_comma /= Void
		do
			!! Result.make (a_type, a_comma)
		ensure
			type_comma_not_void: Result /= Void
		end

	new_typed_bang_instruction (l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL; a_target: ET_WRITABLE): ET_TYPED_BANG_INSTRUCTION is
			-- New typed bang creation instruction
		require
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
		do
			!! Result.make (l, a_type, r, a_target)
		ensure
			typed_bang_instruction_not_void: Result /= Void
		end

	new_typed_create_instruction (a_create: ET_TOKEN; l: ET_SYMBOL; a_type: ET_TYPE;
		r: ET_SYMBOL; a_target: ET_WRITABLE): ET_TYPED_CREATE_INSTRUCTION is
			-- New typed create instruction
		require
			a_create_not_void: a_create /= Void
			l_not_void: l /= Void
			a_type_not_void: a_type /= Void
			r_not_void: r /= Void
			a_target_not_void: a_target /= Void
		do
			!! Result.make (a_create, l, a_type, r, a_target)
		ensure
			typed_create_instruction_not_void: Result /= Void
		end

	new_underscored_integer_constant (a_literal: STRING; a_position: ET_POSITION): ET_UNDERSCORED_INTEGER_CONSTANT is
			-- New integer constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: (_*[0-9]+_*)+
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_literal, a_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_underscored_real_constant (a_literal: STRING; a_position: ET_POSITION): ET_UNDERSCORED_REAL_CONSTANT is
			-- New real constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_literal, a_position)
		ensure
			real_constant_not_void: Result /= Void
		end

	new_unique_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLASS_NAME_LIST; a_class: ET_CLASS; an_id: INTEGER): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_clients_not_void: a_clients /= Void
			a_class_not_void: a_class /= Void
			an_id_positive: an_id > 0
		do
			!! Result.make (a_name, a_type, a_clients, a_class, an_id)
		ensure
			unique_attribute_not_void: Result /= Void
		end

	new_variant (a_variant: ET_TOKEN): ET_VARIANT is
			-- New empty loop variant
		require
			a_variant_not_void: a_variant /= Void
		do
			!! Result.make (a_variant)
		ensure
			variant_not_void: Result /= Void
		end

	new_verbatim_string (a_literal, a_marker, an_open, a_close: STRING;
		a_line, a_column: INTEGER): ET_VERBATIM_STRING is
			-- New verbatim string
		require
			a_literal_not_void: a_literal /= Void
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
			a_line_not_void: a_line /= Void
			a_column_not_void: a_column /= Void
		do
			!! Result.make_with_position (a_literal, a_marker, an_open, a_close, a_line, a_column)
		ensure
			verbatim_string_not_void: Result /= Void
		end

	new_when_part (a_when: ET_TOKEN; a_choices: ET_CHOICE_LIST;
		a_then_compound: ET_COMPOUND): ET_WHEN_PART is
			-- New when part
		require
			a_when_not_void: a_when /= Void
			a_then_compound_not_void: a_then_compound /= Void
		do
			!! Result.make (a_when, a_choices, a_then_compound)
		ensure
			when_part_not_void: Result /= Void
		end

	new_when_part_list (a_when_part: ET_WHEN_PART): ET_WHEN_PART_LIST is
			-- New when part list
		require
			a_when_part_not_void: a_when_part /= Void
		do
			!! Result.make (a_when_part)
		ensure
			when_part_list_not_void: Result /= Void
		end

	new_when_part_list_with_capacity (a_when_part: ET_WHEN_PART; nb: INTEGER): ET_WHEN_PART_LIST is
			-- New when part list with given capacity
		require
			a_when_part_not_void: a_when_part /= Void
			nb_positive: nb >= 1
		do
			!! Result.make_with_capacity (a_when_part, nb)
		ensure
			when_part_list_not_void: Result /= Void
		end

end -- class ET_AST_FACTORY
