indexing

	description:

		"Eiffel Abstract Syntax Tree factories"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_AST_FACTORY

inherit

	KL_IMPORTED_ARRAY_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_actual_arguments (an_expression: ET_EXPRESSION): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list
		require
			an_expression_not_void: an_expression /= Void
		do
			!! Result.make (an_expression)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_generics (a_type: ET_TYPE): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list with initially
			-- one actual generic parameter `a_type'
		require
			a_type_not_void: a_type /= Void
		do
			!! Result.make (a_type)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_all_export (a_clients: ET_CLIENTS): ET_ALL_EXPORT is
			-- New 'all' export clause
		require
			a_clients_not_void: a_clients /= Void
		do
			!! Result.make (a_clients)
		ensure
			all_export_not_void: Result /= Void
		end

	new_any_clients (a_position: ET_POSITION; a_universe: ET_UNIVERSE): ET_CLIENTS is
			-- Client list with only one client: ANY
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		do
			!! Result.make_any (a_position, a_universe)
		ensure
			clients_not_void: Result /= Void
		end

	new_assertions (an_assertion: ET_ASSERTION): ET_ASSERTIONS is
			-- New assertion list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			!! Result.make (an_assertion)
		ensure
			assertions_not_void: Result /= Void
		end

	new_assignment (a_target: ET_WRITABLE; a_source: ET_EXPRESSION): ET_ASSIGNMENT is
			-- New assignment instruction
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			!! Result.make (a_target, a_source)
		ensure
			assignment_not_void: Result /= Void
		end

	new_assignment_attempt (a_target: ET_WRITABLE; a_source: ET_EXPRESSION): ET_ASSIGNMENT_ATTEMPT is
			-- New assignment-attempt instruction
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			!! Result.make (a_target, a_source)
		ensure
			assignment_attempt_not_void: Result /= Void
		end

	new_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLIENTS; a_class: ET_CLASS;
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

	new_bit_identifier (an_id: ET_IDENTIFIER; p: ET_POSITION): ET_BIT_IDENTIFIER is
			-- New 'BIT Identifier' type
		require
			an_id_not_void: an_id /= Void
			p_not_void: p /= Void
		do
			!! Result.make (an_id, p)
		ensure
			type_not_void: Result /= Void
		end

	new_bit_type (an_int: ET_INTEGER_CONSTANT; p: ET_POSITION): ET_BIT_TYPE is
			-- New 'BIT N' type
		require
			an_int_not_void: an_int /= Void
			p_not_void: p /= Void
		do
			!! Result.make (an_int, p)
		ensure
			type_not_void: Result /= Void
		end

	new_call_expression (a_target: ET_EXPRESSION; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_EXPRESSION is
			-- New call expression
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_target, a_name, args)
		ensure
			call_expression_not_void: Result /= Void
		end

	new_call_instruction (a_target: ET_EXPRESSION; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_INSTRUCTION is
			-- New call instruction
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_target, a_name, args)
		ensure
			call_instruction_not_void: Result /= Void
		end

	new_check_instruction: ET_CHECK_INSTRUCTION is
			-- New check instruction
		do
			!! Result
		ensure
			check_instruction_not_void: Result /= Void
		end

	new_class (a_name: ET_IDENTIFIER; an_id: INTEGER;
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

	new_class_type (a_name: ET_IDENTIFIER;
		a_class: ET_CLASS): ET_CLASS_TYPE is
			-- New Eiffel class type
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			!! Result.make (a_name, a_class)
		ensure
			class_type_not_void: Result /= Void
		end

	new_client (a_name: ET_IDENTIFIER): ET_CLIENT is
			-- New client
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name)
		ensure
			client_not_void: Result /= Void
		end

	new_clients (a_client: ET_CLIENT): ET_CLIENTS is
			-- New client clause
		require
			a_client_not_void: a_client /= Void
		do
			!! Result.make (a_client)
		ensure
			clients_not_void: Result /= Void
		end

	new_comment_assertion (a_tag: ET_IDENTIFIER): ET_COMMENT_ASSERTION is
			-- New comment assertion
		do
			!! Result.make (a_tag)
		ensure
			assertion_not_void: Result /= Void
		end

	new_compound (an_instruction: ET_INSTRUCTION): ET_COMPOUND is
			-- New instruction compound
		require
			an_instruction_not_void: an_instruction /= Void
		do
			!! Result.make (an_instruction)
		ensure
			compound_not_void: Result /= Void
		end

	new_constant_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_constant: ANY; a_clients: ET_CLIENTS; a_class: ET_CLASS;
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

	new_creation_instruction (a_type: ET_TYPE; a_target: ET_WRITABLE; a_call: ANY): ET_CREATION_INSTRUCTION is
			-- New creation instruction
		do
			!! Result
		ensure
			creation_instruction_not_void: Result /= Void
		end

	new_creator (a_clients: ET_CLIENTS; a_procedure_list: ARRAY [ET_FEATURE_NAME]): ET_CREATOR is
			-- New creation clause
		require
			a_clients_not_void: a_clients /= Void
			no_void_procedure: a_procedure_list /= Void implies not ANY_ARRAY_.has (a_procedure_list, Void)
		do
			!! Result.make (a_clients, a_procedure_list)
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

	new_current (a_position: ET_POSITION): ET_CURRENT is
			-- New current entity
		require
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_position)
		ensure
			current_not_void: Result /= Void
		end

	new_current_address: ET_CURRENT_ADDRESS is
			-- New address of Current
		do
			!! Result
		ensure
			current_address_not_void: Result /= Void
		end

	new_debug_instruction: ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		do
			!! Result
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_deferred_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
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
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
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
		a_clients: ET_CLIENTS; a_class: ET_CLASS; an_id: INTEGER): ET_DO_FUNCTION is
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
		a_clients: ET_CLIENTS; a_class: ET_CLASS; an_id: INTEGER): ET_DO_PROCEDURE is
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

	new_equal_expression (l, r: ET_EXPRESSION): ET_EQUAL_EXPRESSION is
			-- New equality expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			equal_not_void: Result /= Void
		end

	new_export_list (nb: INTEGER): ARRAY [ET_EXPORT] is
			-- New export list
		require
			nb_positive: nb > 0
		do
			!! Result.make (0, nb - 1)
		ensure
			export_list_not_void: Result /= Void
		end

	new_expression_address (e: ET_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		require
			e_not_void: e /= Void
		do
			!! Result.make (e)
		ensure
			expression_address_not_void: Result /= Void
		end

	new_expression_assertion (a_tag: ET_IDENTIFIER; an_expression: ET_EXPRESSION): ET_EXPRESSION_ASSERTION is
			-- New expression assertion
		require
			an_expression_not_void: an_expression /= Void
		do
			!! Result.make (a_tag, an_expression)
		ensure
			assertion_not_void: Result /= Void
		end

	new_external_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
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
		a_postconditions: ET_POSTCONDITIONS; a_clients: ET_CLIENTS;
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

	new_feature_address: ET_FEATURE_ADDRESS is
			-- New feature address
		do
			!! Result
		ensure
			feature_address_not_void: Result /= Void
		end

	new_feature_export (a_clients: ET_CLIENTS; a_feature_set: ARRAY [ET_FEATURE_NAME]): ET_FEATURE_EXPORT is
			-- New feature export clause
		require
			a_clients_not_void: a_clients /= Void
			a_feature_set_not_void: a_feature_set /= Void
			no_void_feature: not ANY_ARRAY_.has (a_feature_set, Void)
		do
			!! Result.make (a_clients, a_feature_set)
		ensure
			feature_export_not_void: Result /= Void
		end

	new_feature_list (nb: INTEGER): ARRAY [ET_FEATURE_NAME] is
			-- New feature list
		require
			nb_positive: nb > 0
		do
			!! Result.make (0, nb - 1)
		ensure
			feature_list_not_void: Result /= Void
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

	new_generic_class_type (a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics;
		a_class: ET_CLASS): ET_GENERIC_CLASS_TYPE is
			-- New Eiffel generic class type
		require
			a_name_not_void: a_name /= Void
			a_generics_not_void: a_generics /= Void
			a_class_not_void: a_class /= Void
		do
			!! Result.make (a_name, a_generics, a_class)
		ensure
			class_type_not_void: Result /= Void
		end

	new_generic_named_type (a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_GENERIC_NAMED_TYPE is
			-- New Eiffel generic named type
		require
			a_name_not_void: a_name /= Void
			a_generics_not_void: a_generics /= Void
		do
			!! Result.make (a_name, a_generics)
		ensure
			named_type_not_void: Result /= Void
		end

	new_if_instruction (a_condition: ET_EXPRESSION; a_compound: ET_COMPOUND): ET_IF_INSTRUCTION is
			-- New if instruction
		require
			a_condition_not_void: a_condition /= Void
		do
			!! Result.make (a_condition, a_compound)
		ensure
			if_instruction_not_void: Result /= Void
		end

	new_infix_and (p: ET_POSITION): ET_INFIX_AND is
			-- New infix "and" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_and_not_void: Result /= Void
		end

	new_infix_and_then (p: ET_POSITION): ET_INFIX_AND_THEN is
			-- New infix "and then" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_and_then_not_void: Result /= Void
		end

	new_infix_div (p: ET_POSITION): ET_INFIX_DIV is
			-- New infix "//" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_div_not_void: Result /= Void
		end

	new_infix_divide (p: ET_POSITION): ET_INFIX_DIVIDE is
			-- New infix "/" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_division_not_void: Result /= Void
		end

	new_infix_expression (l: ET_EXPRESSION; a_name: ET_INFIX_NAME;
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

	new_infix_freeop (a_string: STRING; p: ET_POSITION): ET_INFIX_FREEOP is
			-- New infix free-operator feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
			!! Result.make (a_string, p)
		ensure
			infix_freeop_not_void: Result /= Void
		end

	new_infix_ge (p: ET_POSITION): ET_INFIX_GE is
			-- New infix ">=" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_ge_not_void: Result /= Void
		end

	new_infix_gt (p: ET_POSITION): ET_INFIX_GT is
			-- New infix ">" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_gt_not_void: Result /= Void
		end

	new_infix_implies (p: ET_POSITION): ET_INFIX_IMPLIES is
			-- New infix "implies" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_implies_not_void: Result /= Void
		end

	new_infix_le (p: ET_POSITION): ET_INFIX_LE is
			-- New infix "<=" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_le_not_void: Result /= Void
		end

	new_infix_lt (p: ET_POSITION): ET_INFIX_LT is
			-- New infix "<" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_lt_not_void: Result /= Void
		end

	new_infix_minus (p: ET_POSITION): ET_INFIX_MINUS is
			-- New infix "-" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_minus_not_void: Result /= Void
		end

	new_infix_mod (p: ET_POSITION): ET_INFIX_MOD is
			-- New infix "\\" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_mod_not_void: Result /= Void
		end

	new_infix_or (p: ET_POSITION): ET_INFIX_OR is
			-- New infix "or" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_or_not_void: Result /= Void
		end

	new_infix_or_else (p: ET_POSITION): ET_INFIX_OR_ELSE is
			-- New infix "or else" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_or_else_not_void: Result /= Void
		end

	new_infix_plus (p: ET_POSITION): ET_INFIX_PLUS is
			-- New infix "+" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_plus_not_void: Result /= Void
		end

	new_infix_power (p: ET_POSITION): ET_INFIX_POWER is
			-- New infix "^" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_power_not_void: Result /= Void
		end

	new_infix_times (p: ET_POSITION): ET_INFIX_TIMES is
			-- New infix "*" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_times_not_void: Result /= Void
		end

	new_infix_xor (p: ET_POSITION): ET_INFIX_XOR is
			-- New infix "xor" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			infix_xor_not_void: Result /= Void
		end

	new_inspect_instruction: ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		do
			!! Result
		ensure
			inspect_instruction_not_void: Result /= Void
		end

	new_like_current (p: ET_POSITION): ET_LIKE_CURRENT is
			-- New 'like Current' type
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			type_not_void: Result /= Void
		end

	new_like_identifier (an_id: ET_IDENTIFIER; p: ET_POSITION): ET_LIKE_IDENTIFIER is
			-- New 'like Identifier' type
		require
			an_id_not_void: an_id /= Void
			p_not_void: p /= Void
		do
			!! Result.make (an_id, p)
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

	new_loop_instruction: ET_LOOP_INSTRUCTION is
			-- New loop instruction
		do
			!! Result
		ensure
			loop_instruction_not_void: Result /= Void
		end

	new_manifest_array: ET_MANIFEST_ARRAY is
			-- New manifest array
		do
			!! Result
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_named_type (a_name: ET_IDENTIFIER): ET_NAMED_TYPE is
			-- New Eiffel named type
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name)
		ensure
			named_type_not_void: Result /= Void
		end

	new_none_clients (a_position: ET_POSITION; a_universe: ET_UNIVERSE): ET_CLIENTS is
			-- Client list with only one client: NONE
		require
			a_position_not_void: a_position /= Void
			a_universe_not_void: a_universe /= Void
		do
			!! Result.make_none (a_position, a_universe)
		ensure
			clients_not_void: Result /= Void
		end


	new_not_equal_expression (l, r: ET_EXPRESSION): ET_NOT_EQUAL_EXPRESSION is
			-- New non-equality expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			!! Result.make (l, r)
		ensure
			not_equal_not_void: Result /= Void
		end

	new_old_expression (e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		require
			e_not_void: e /= Void
		do
			!! Result.make (e)
		ensure
			old_expression_not_void: Result /= Void
		end

	new_once_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND;
		a_clients: ET_CLIENTS; a_class: ET_CLASS; an_id: INTEGER): ET_ONCE_FUNCTION is
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
		a_clients: ET_CLIENTS; a_class: ET_CLASS; an_id: INTEGER): ET_ONCE_PROCEDURE is
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

	new_parent (a_type: ET_CLASS_TYPE; a_renames: like new_rename_list;
		an_exports: like new_export_list; an_undefines: like new_feature_list;
		a_redefines: like new_feature_list; a_selects: like new_feature_list): ET_PARENT is
			-- New parent
		do
			!! Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
		ensure
			parent_not_void: Result /= Void
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

	new_postconditions (an_assertion: ET_ASSERTION): ET_POSTCONDITIONS is
			-- New postcondition list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			!! Result.make (an_assertion)
		ensure
			postconditions_not_void: Result /= Void
		end

	new_preconditions (an_assertion: ET_ASSERTION): ET_PRECONDITIONS is
			-- New precondition list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			!! Result.make (an_assertion)
		ensure
			preconditions_not_void: Result /= Void
		end

	new_precursor_expression (a_parent: ANY; args: ANY): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		do
			!! Result
		ensure
			precursor_expression_not_void: Result /= Void
		end

	new_precursor_instruction (a_parent: ANY; args: ANY): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		do
			!! Result
		ensure
			precursor_instruction_not_void: Result /= Void
		end

	new_prefix_expression (a_name: ET_PREFIX_NAME; e: ET_EXPRESSION): ET_PREFIX_EXPRESSION is
			-- New prefix expression
		require
			a_name_not_void: a_name /= Void
			e_not_void: e /= Void
		do
			!! Result.make (a_name, e)
		ensure
			prefix_expression_not_void: Result /= Void
		end

	new_prefix_freeop (a_string: STRING; p: ET_POSITION): ET_PREFIX_FREEOP is
			-- New prefix free-operator feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
			!! Result.make (a_string, p)
		ensure
			prefix_freeop_not_void: Result /= Void
		end

	new_prefix_minus (p: ET_POSITION): ET_PREFIX_MINUS is
			-- New prefix "-" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			prefix_minus_not_void: Result /= Void
		end

	new_prefix_not (p: ET_POSITION): ET_PREFIX_NOT is
			-- New prefix "not" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			prefix_not_not_void: Result /= Void
		end

	new_prefix_plus (p: ET_POSITION): ET_PREFIX_PLUS is
			-- New prefix "+" feature name
		require
			p_not_void: p /= Void
		do
			!! Result.make (p)
		ensure
			prefix_plus_not_void: Result /= Void
		end

	new_rename_list (nb: INTEGER): ARRAY [ET_RENAME] is
			-- New rename list
		require
			nb_positive: nb > 0
		do
			!! Result.make (0, nb - 1)
		ensure
			rename_list_not_void: Result /= Void
		end

	new_rename (old_name, new_name: ET_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		require
			old_name_not_void: old_name /= Void
			new_name_not_void: new_name /= Void
		do
			!! Result.make (old_name, new_name)
		ensure
			renames_not_void: Result /= Void
		end

	new_result (a_position: ET_POSITION): ET_RESULT is
			-- New result entity
		require
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_position)
		ensure
			result_not_void: Result /= Void
		end

	new_result_address: ET_RESULT_ADDRESS is
			-- New address of Result
		do
			!! Result
		ensure
			result_address_not_void: Result /= Void
		end

	new_retry_instruction: ET_RETRY_INSTRUCTION is
			-- New retry instruction
		do
			!! Result
		ensure
			retry_instruction_not_void: Result /= Void
		end

	new_strip_expression: ET_STRIP_EXPRESSION is
			-- New strip expression
		do
			!! Result
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_unique_attribute (a_name: ET_FEATURE_NAME; a_type: ET_TYPE;
		a_clients: ET_CLIENTS; a_class: ET_CLASS; an_id: INTEGER): ET_UNIQUE_ATTRIBUTE is
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

end -- class ET_AST_FACTORY
