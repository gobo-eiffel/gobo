indexing

	description:

		"Eiffel parser skeletons"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EIFFEL_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	ET_EIFFEL_SCANNER_SKELETON
		rename
			make as make_eiffel_scanner
		redefine
			reset
		end

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE; an_error_handler: like error_handler) is
			-- Create a new Eiffel parser.
		require
			a_universe_not_void: a_universe /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_universe, a_factory, an_error_handler)
		ensure
			universe_set: universe = a_universe
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_universe: ET_UNIVERSE; a_factory: like ast_factory;
		an_error_handler: like error_handler) is
			-- Create a new Eiffel parser.
		require
			a_universe_not_void: a_universe /= Void
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			universe := a_universe
			ast_factory := a_factory
			make_eiffel_scanner ("unknown file", an_error_handler)
			make_parser_skeleton
		ensure
			universe_set: universe = a_universe
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			precursor
			feature_list_count := 0
			rename_list_count := 0
			last_clients := Void
			cluster := Void
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Eiffel class universe

	cluster: ET_CLUSTER
			-- Cluster containing the class being parsed

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

	last_clients: ET_CLIENTS
			-- Last clients read

feature -- Parsing

	parse (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse Eiffel file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			reset
			filename := a_filename
			cluster := a_cluster
			input_buffer := Eiffel_buffer
			Eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			yyparse
		end

feature -- Basic operations

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		require
			a_feature_not_void: a_feature /= Void
			last_class_not_void: last_class /= Void
		do
			last_class.put_feature (a_feature)
		end

	register_frozen_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		require
			a_feature_not_void: a_feature /= Void
			last_class_not_void: last_class /= Void
		do
			a_feature.set_frozen
			last_class.put_feature (a_feature)
		ensure
			frozen_feature: a_feature.is_frozen
		end

	set_formal_generic_parameters (a_generics: ET_FORMAL_GENERIC_PARAMETERS) is
			-- Set formal generic parameters of `last_class'.
		require
			a_generics_not_void: a_generics /= Void
			last_class_not_void: last_class /= Void
		do
			last_class.set_generic_parameters (a_generics)
			a_generics.resolve_named_types (last_class, ast_factory)
		end

feature -- AST factory

	new_actual_arguments (an_expression: ET_EXPRESSION): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list
		require
			an_expression_not_void: an_expression /= Void
		do
			Result := ast_factory.new_actual_arguments (an_expression)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_generics (a_type: ET_TYPE): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list with initially
			-- one actual generic parameter `a_type'
		require
			a_type_not_void: a_type /= Void
		do
			Result := ast_factory.new_actual_generics (a_type)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_any_clients: ET_CLIENTS is
			-- Client list with only one client: ANY
		do
			Result := ast_factory.new_any_clients
			last_clients := Result
		ensure
			clients_not_void: Result /= Void
		end

	new_assertions (an_assertion: ET_ASSERTION): ET_ASSERTIONS is
			-- New assertion list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			Result := ast_factory.new_assertions (an_assertion)
		ensure
			assertions_not_void: Result /= Void
		end

	new_assignment (a_target: ET_WRITABLE; a_source: ET_EXPRESSION): ET_ASSIGNMENT is
			-- New assignment instruction
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			Result := ast_factory.new_assignment (a_target, a_source)
		ensure
			assignment_not_void: Result /= Void
		end

	new_assignment_attempt (a_target: ET_WRITABLE; a_source: ET_EXPRESSION): ET_ASSIGNMENT_ATTEMPT is
			-- New assignment-attempt instruction
		require
			a_target_not_void: a_target /= Void
			a_source_not_void: a_source /= Void
		do
			Result := ast_factory.new_assignment_attempt (a_target, a_source)
		ensure
			assignment_attempt_not_void: Result /= Void
		end

	new_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE): ET_ATTRIBUTE is
			-- New attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_attribute (a_name, a_type, last_clients, last_class, an_id)
		ensure
			attribute_not_void: Result /= Void
		end

	new_bit_identifier (an_id: ET_IDENTIFIER; p: ET_POSITION): ET_BIT_IDENTIFIER is
			-- New 'BIT Identifier' type
		require
			an_id_not_void: an_id /= Void
			p_not_void: p /= Void
		do
			Result := ast_factory.new_bit_identifier (an_id, p)
		ensure
			type_not_void: Result /= Void
		end

	new_bit_type (an_int: ET_INTEGER_CONSTANT; p: ET_POSITION): ET_BIT_TYPE is
			-- New 'BIT N' type
		require
			an_int_not_void: an_int /= Void
			p_not_void: p /= Void
		do
			Result := ast_factory.new_bit_type (an_int, p)
		ensure
			type_not_void: Result /= Void
		end

	new_call_expression (a_target: ET_EXPRESSION; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_EXPRESSION is
			-- New call expression
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_call_expression (a_target, a_name, args)
		ensure
			call_expression_not_void: Result /= Void
		end

	new_call_instruction (a_target: ET_EXPRESSION; a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_INSTRUCTION is
			-- New call instruction
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_call_instruction (a_target, a_name, args)
		ensure
			call_instruction_not_void: Result /= Void
		end

	new_check_instruction: ET_CHECK_INSTRUCTION is
			-- New check instruction
		do
			Result := ast_factory.new_check_instruction
		ensure
			check_instruction_not_void: Result /= Void
		end

	new_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		do
			Result := universe.eiffel_class (a_name)
			Result.set_filename (filename)
			Result.set_cluster (cluster)

			debug ("GELINT")
				std.error.put_string ("Parse class `")
				std.error.put_string (a_name.name)
				std.error.put_string ("'%N")
			end
		ensure
			class_not_void: Result /= Void
		end

	new_client (a_name: ET_IDENTIFIER): ET_CLIENT is
			-- New client
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_client (a_name)
		ensure
			client_not_void: Result /= Void
		end

	new_clients (a_client: ET_CLIENT): ET_CLIENTS is
			-- New client clause
		require
			a_client_not_void: a_client /= Void
		do
			Result := ast_factory.new_clients (a_client)
			last_clients := Result
		ensure
			clients_not_void: Result /= Void
		end

	new_comment_assertion (a_tag: ET_IDENTIFIER): ET_COMMENT_ASSERTION is
			-- New comment assertion
		do
			Result := ast_factory.new_comment_assertion (a_tag)
		ensure
			assertion_not_void: Result /= Void
		end

	new_compound (an_instruction: ET_INSTRUCTION): ET_COMPOUND is
			-- New instruction compound
		require
			an_instruction_not_void: an_instruction /= Void
		do
			Result := ast_factory.new_compound (an_instruction)
		ensure
			compound_not_void: Result /= Void
		end

	new_constant_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; a_constant: ANY): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_constant_attribute (a_name, a_type, a_constant, last_clients, last_class, an_id)
		ensure
			constant_attribute_not_void: Result /= Void
		end

	new_constraint_named_type (a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_NAMED_TYPE is
			-- New Eiffel class type or formal
			-- generic paramater appearing in a
			-- generic constraint
		require
			a_name_not_void: a_name /= Void
		do
			if a_generics /= Void then
				Result := ast_factory.new_generic_named_type (a_name, a_generics)
			else
				Result := ast_factory.new_named_type (a_name)
			end
		ensure
			named_type_not_void: Result /= Void
		end

	new_creation_instruction (a_type: ET_TYPE; a_target: ET_WRITABLE; a_call: ANY): ET_CREATION_INSTRUCTION is
			-- New creation instruction
		do
			Result := ast_factory.new_creation_instruction (a_type, a_target, a_call)
		ensure
			creation_instruction_not_void: Result /= Void
		end

	new_current (a_position: ET_POSITION): ET_CURRENT is
			-- New current entity
		require
			a_position_not_void: a_position /= Void
		do
			Result := ast_factory.new_current (a_position)
		ensure
			current_not_void: Result /= Void
		end

	new_current_address: ET_CURRENT_ADDRESS is
			-- New address of Current
		do
			Result := ast_factory.new_current_address
		ensure
			current_address_not_void: Result /= Void
		end

	new_debug_instruction: ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		do
			Result := ast_factory.new_debug_instruction
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_deferred_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New deferred class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		do
			Result := new_class (a_name)
			Result.set_deferred
		ensure
			class_not_void: Result /= Void
			is_deferred: Result.is_deferred
		end

	new_deferred_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS): ET_DEFERRED_FUNCTION is
			-- New deferred function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_deferred_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_postconditions,
				last_clients, last_class, an_id)
		ensure
			deferred_function_not_void: Result /= Void
		end

	new_deferred_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_deferred_procedure (a_name, args,
				an_obsolete, a_preconditions, a_postconditions,
				last_clients, last_class, an_id)
		ensure
			deferred_procedure_not_void: Result /= Void
		end

	new_do_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_DO_FUNCTION is
			-- New do function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_do_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_locals,
				a_compound, a_postconditions, a_rescue,
				last_clients, last_class, an_id)
		ensure
			do_function_not_void: Result /= Void
		end

	new_do_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_DO_PROCEDURE is
			-- New do procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_do_procedure (a_name, args,
				an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class, an_id)
		ensure
			do_procedure_not_void: Result /= Void
		end

	new_equal_expression (l, r: ET_EXPRESSION): ET_EQUAL_EXPRESSION is
			-- New equality expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_equal_expression (l, r)
		ensure
			equal_not_void: Result /= Void
		end

	new_expanded_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New expanded class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		do
			Result := new_class (a_name)
			Result.set_expanded
		ensure
			class_not_void: Result /= Void
			is_expanded: Result.is_expanded
		end

	new_export_list (nb: INTEGER): ARRAY [ET_EXPORT] is
			-- New export list
		require
			nb_positive: nb > 0
		do
			Result := ast_factory.new_export_list (nb)
		ensure
			export_list_not_void: Result /= Void
		end

	new_expression_address (e: ET_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		require
			e_not_void: e /= Void
		do
			Result := ast_factory.new_expression_address (e)
		ensure
			expression_address_not_void: Result /= Void
		end

	new_expression_assertion (a_tag: ET_IDENTIFIER; an_expression: ET_EXPRESSION): ET_EXPRESSION_ASSERTION is
			-- New expression assertion
		require
			an_expression_not_void: an_expression /= Void
		do
			Result := ast_factory.new_expression_assertion (a_tag, an_expression)
		ensure
			assertion_not_void: Result /= Void
		end

	new_external_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS): ET_EXTERNAL_FUNCTION is
			-- New external function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_external_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_language, an_alias,
				a_postconditions, last_clients, last_class, an_id)
		ensure
			external_function_not_void: Result /= Void
		end

	new_external_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_external_procedure (a_name, args,
				an_obsolete, a_preconditions, a_language, an_alias,
				a_postconditions, last_clients, last_class, an_id)
		ensure
			external_procedure_not_void: Result /= Void
		end

	new_feature_address: ET_FEATURE_ADDRESS is
			-- New feature address
		do
			Result := ast_factory.new_feature_address
		ensure
			feature_address_not_void: Result /= Void
		end

	new_feature_list (nb: INTEGER): ARRAY [ET_FEATURE_NAME] is
			-- New feature list
		require
			nb_positive: nb > 0
		do
			Result := ast_factory.new_feature_list (nb)
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
			Result := ast_factory.new_formal_arguments (a_name, a_type)
		ensure
			formal_arguments_not_void: Result /= Void
		end

	new_formal_generic (a_name: ET_IDENTIFIER; a_constraint: ET_TYPE): ET_FORMAL_GENERIC_PARAMETER is
			-- New formal generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_formal_generic (a_name, a_constraint)
		ensure
			formal_generic_not_void: Result /= Void
		end

	new_formal_generics (a_parameter: ET_FORMAL_GENERIC_PARAMETER): ET_FORMAL_GENERIC_PARAMETERS is
			-- New formal generic parameter list with initially
			-- one formal generic parameter `a_parameter'
		require
			a_parameter_not_void: a_parameter /= Void
		do
			Result := ast_factory.new_formal_generics (a_parameter)
		ensure
			formal_generics_not_void: Result /= Void
		end

	new_if_instruction (a_condition: ET_EXPRESSION; a_compound: ET_COMPOUND): ET_IF_INSTRUCTION is
			-- New if instruction
		require
			a_condition_not_void: a_condition /= Void
		do
			Result := ast_factory.new_if_instruction (a_condition, a_compound)
		ensure
			if_instruction_not_void: Result /= Void
		end

	new_infix_and (p: ET_POSITION): ET_INFIX_AND is
			-- New infix "and" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_and (p)
		ensure
			infix_and_not_void: Result /= Void
		end

	new_infix_and_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New and expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_AND
		do
			a_name := new_infix_and (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			and_expression_not_void: Result /= Void
		end

	new_infix_and_then (p: ET_POSITION): ET_INFIX_AND_THEN is
			-- New infix "and then" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_and_then (p)
		ensure
			infix_and_then_not_void: Result /= Void
		end

	new_infix_and_then_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New and-then expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_AND_THEN
		do
			a_name := new_infix_and_then (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			and_then_expression_not_void: Result /= Void
		end

	new_infix_div (p: ET_POSITION): ET_INFIX_DIV is
			-- New infix "//" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_div (p)
		ensure
			infix_div_not_void: Result /= Void
		end

	new_infix_div_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New integer-division expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_DIV
		do
			a_name := new_infix_div (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			div_expression_not_void: Result /= Void
		end

	new_infix_divide (p: ET_POSITION): ET_INFIX_DIVIDE is
			-- New infix "/" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_divide (p)
		ensure
			infix_division_not_void: Result /= Void
		end

	new_infix_divide_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New division expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_DIVIDE
		do
			a_name := new_infix_divide (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			division_expression_not_void: Result /= Void
		end

	new_infix_freeop (a_string: ET_MANIFEST_STRING; p: ET_POSITION): ET_INFIX_FREEOP is
			-- New infix free-operator feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
			a_string.compute (error_handler)
			Result := ast_factory.new_infix_freeop (a_string.value, p)
		ensure
			infix_freeop_not_void: Result /= Void
		end

	new_infix_freeop_expression (l, r: ET_EXPRESSION; a_token: ET_TOKEN): ET_INFIX_EXPRESSION is
			-- New binary free-operator expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			a_token_not_void: a_token /= Void
		local
			a_name: ET_INFIX_FREEOP
		do
			a_name := ast_factory.new_infix_freeop (a_token.text, a_token.position)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			freeop_expression_not_void: Result /= Void
		end

	new_infix_ge (p: ET_POSITION): ET_INFIX_GE is
			-- New infix ">=" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_ge (p)
		ensure
			infix_ge_not_void: Result /= Void
		end

	new_infix_ge_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New greater-than-or-equal expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_GE
		do
			a_name := new_infix_ge (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			ge_expression_not_void: Result /= Void
		end

	new_infix_gt (p: ET_POSITION): ET_INFIX_GT is
			-- New infix ">" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_gt (p)
		ensure
			infix_gt_not_void: Result /= Void
		end

	new_infix_gt_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New greater-than expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_GT
		do
			a_name := new_infix_gt (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			gt_expression_not_void: Result /= Void
		end

	new_infix_implies (p: ET_POSITION): ET_INFIX_IMPLIES is
			-- New infix "implies" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_implies (p)
		ensure
			infix_implies_not_void: Result /= Void
		end

	new_infix_implies_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New implies expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_IMPLIES
		do
			a_name := new_infix_implies (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			implies_expression_not_void: Result /= Void
		end

	new_infix_le (p: ET_POSITION): ET_INFIX_LE is
			-- New infix "<=" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_le (p)
		ensure
			infix_le_not_void: Result /= Void
		end

	new_infix_le_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New less-than-or-equal expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_LE
		do
			a_name := new_infix_le (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			le_expression_not_void: Result /= Void
		end

	new_infix_lt (p: ET_POSITION): ET_INFIX_LT is
			-- New infix "<" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_lt (p)
		ensure
			infix_lt_not_void: Result /= Void
		end

	new_infix_lt_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New less-than expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_LT
		do
			a_name := new_infix_lt (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			lt_expression_not_void: Result /= Void
		end

	new_infix_minus (p: ET_POSITION): ET_INFIX_MINUS is
			-- New infix "-" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_minus (p)
		ensure
			infix_minus_not_void: Result /= Void
		end

	new_infix_minus_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New binary minus expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_MINUS
		do
			a_name := new_infix_minus (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			minus_expression_not_void: Result /= Void
		end

	new_infix_mod (p: ET_POSITION): ET_INFIX_MOD is
			-- New infix "\\" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_mod (p)
		ensure
			infix_mod_not_void: Result /= Void
		end

	new_infix_mod_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New modulus expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_MOD
		do
			a_name := new_infix_mod (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			mod_expression_not_void: Result /= Void
		end

	new_infix_or (p: ET_POSITION): ET_INFIX_OR is
			-- New infix "or" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_or (p)
		ensure
			infix_or_not_void: Result /= Void
		end

	new_infix_or_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New or expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_OR
		do
			a_name := new_infix_or (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			or_expression_not_void: Result /= Void
		end

	new_infix_or_else (p: ET_POSITION): ET_INFIX_OR_ELSE is
			-- New infix "or else" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_or_else (p)
		ensure
			infix_or_else_not_void: Result /= Void
		end

	new_infix_or_else_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New or-else expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_OR_ELSE
		do
			a_name := new_infix_or_else (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			or_else_expression_not_void: Result /= Void
		end

	new_infix_plus (p: ET_POSITION): ET_INFIX_PLUS is
			-- New infix "+" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_plus (p)
		ensure
			infix_plus_not_void: Result /= Void
		end

	new_infix_plus_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New binary plus expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_PLUS
		do
			a_name := new_infix_plus (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			plus_expression_not_void: Result /= Void
		end

	new_infix_power (p: ET_POSITION): ET_INFIX_POWER is
			-- New infix "^" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_power (p)
		ensure
			infix_power_not_void: Result /= Void
		end

	new_infix_power_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New power expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_POWER
		do
			a_name := new_infix_power (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			power_expression_not_void: Result /= Void
		end

	new_infix_times (p: ET_POSITION): ET_INFIX_TIMES is
			-- New infix "*" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_times (p)
		ensure
			infix_times_not_void: Result /= Void
		end

	new_infix_times_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New multiplication expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_TIMES
		do
			a_name := new_infix_times (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			times_expression_not_void: Result /= Void
		end

	new_infix_xor (p: ET_POSITION): ET_INFIX_XOR is
			-- New infix "xor" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_infix_xor (p)
		ensure
			infix_xor_not_void: Result /= Void
		end

	new_infix_xor_expression (l, r: ET_EXPRESSION; p: ET_POSITION): ET_INFIX_EXPRESSION is
			-- New xor expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			p_not_void: p /= Void
		local
			a_name: ET_INFIX_XOR
		do
			a_name := new_infix_xor (p)
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			xor_expression_not_void: Result /= Void
		end

	new_inspect_instruction: ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		do
			Result := ast_factory.new_inspect_instruction
		ensure
			inspect_instruction_not_void: Result /= Void
		end

	new_invalid_infix (a_string: ET_MANIFEST_STRING; p: ET_POSITION): ET_INFIX_FREEOP is
			-- New invalid infix feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
-- ERROR
			Result := new_infix_freeop (a_string, p)
		ensure
			invalid_infix_not_void: Result /= Void
		end

	new_invalid_prefix (a_string: ET_MANIFEST_STRING; p: ET_POSITION): ET_PREFIX_FREEOP is
			-- New invalid prefix feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
-- ERROR
			Result := new_prefix_freeop (a_string, p)
		ensure
			invalid_prefix_not_void: Result /= Void
		end

	new_like_current (p: ET_POSITION): ET_LIKE_CURRENT is
			-- New 'like Current' type
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_like_current (p)
		ensure
			type_not_void: Result /= Void
		end

	new_like_identifier (an_id: ET_IDENTIFIER; p: ET_POSITION): ET_LIKE_IDENTIFIER is
			-- New 'like Identifier' type
		require
			an_id_not_void: an_id /= Void
			p_not_void: p /= Void
		do
			Result := ast_factory.new_like_identifier (an_id, p)
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
			Result := ast_factory.new_local_variables (a_name, a_type)
		ensure
			local_variables_not_void: Result /= Void
		end

	new_loop_instruction: ET_LOOP_INSTRUCTION is
			-- New loop instruction
		do
			Result := ast_factory.new_loop_instruction
		ensure
			loop_instruction_not_void: Result /= Void
		end

	new_manifest_array: ET_MANIFEST_ARRAY is
			-- New manifest array
		do
			Result := ast_factory.new_manifest_array
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_named_type (a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_NAMED_TYPE is
			-- New Eiffel class type or formal
			-- generic paramater
		require
			a_name_not_void: a_name /= Void
			last_class_not_void: last_class /= Void
		local
			a_parameter: ET_FORMAL_GENERIC_PARAMETER
			a_class: ET_CLASS
		do
			a_parameter := last_class.generic_parameter (a_name)
			if a_parameter /= Void then
				if a_generics /= Void then
					-- Error
				end
				Result := ast_factory.new_formal_generic_type (a_name, a_parameter.index)
			else
				a_class := universe.eiffel_class (a_name)
				if a_generics /= Void then
					Result := ast_factory.new_generic_class_type (a_name, a_generics, a_class)
				else
					Result := ast_factory.new_class_type (a_name, a_class)
				end
			end
		ensure
			named_type_not_void: Result /= Void
		end

	new_none_clients: ET_CLIENTS is
			-- New client list with only one client: NONE
		do
			Result := ast_factory.new_none_clients
			last_clients := Result
		ensure
			clients_not_void: Result /= Void
		end

	new_not_equal_expression (l, r: ET_EXPRESSION): ET_NOT_EQUAL_EXPRESSION is
			-- New non-equality expression
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_not_equal_expression (l, r)
		ensure
			not_equal_not_void: Result /= Void
		end

	new_old_expression (e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		require
			e_not_void: e /= Void
		do
			Result := ast_factory.new_old_expression (e)
		ensure
			old_expression_not_void: Result /= Void
		end

	new_once_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_ONCE_FUNCTION is
			-- New once function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_once_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class, an_id)
		ensure
			once_function_not_void: Result /= Void
		end

	new_once_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_MANIFEST_STRING; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_ONCE_PROCEDURE is
			-- New once procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_once_procedure (a_name, args,
				an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class, an_id)
		ensure
			once_procedure_not_void: Result /= Void
		end

	new_parent (a_name: ET_IDENTIFIER; a_generic_parameters: like new_actual_generics;
		a_renames: like new_rename_list; an_exports: like new_export_list;
		an_undefines: like new_feature_list; a_redefines: like new_feature_list;
		a_selects: like new_feature_list): ET_PARENT is
			-- New parent
		require
			a_name_not_void: a_name /= Void
		local
			a_type: ET_CLASS_TYPE
			a_class: ET_CLASS
		do
			if last_class.has_generic_parameter (a_name) then
				-- Error
			end
			a_class := universe.eiffel_class (a_name)
			if a_generic_parameters /= Void then
				!ET_GENERIC_CLASS_TYPE! a_type.make (a_name, a_generic_parameters, a_class)
			else
				!! a_type.make (a_name, a_class)
			end
			Result := ast_factory.new_parent (a_type, a_renames,
				an_exports, an_undefines, a_redefines, a_selects)
		ensure
			parent_not_void: Result /= Void
		end

	new_parents (a_parent: ET_PARENT): ET_PARENTS is
			-- New parent list with one parent `a_parent'
		require
			a_parent_not_void: a_parent /= Void
		do
			Result := ast_factory.new_parents (a_parent)
		ensure
			parents_not_void: Result /= Void
		end

	new_postconditions (an_assertion: ET_ASSERTION): ET_POSTCONDITIONS is
			-- New postcondition list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			Result := ast_factory.new_postconditions (an_assertion)
		ensure
			postconditions_not_void: Result /= Void
		end

	new_preconditions (an_assertion: ET_ASSERTION): ET_PRECONDITIONS is
			-- New precondition list with initially
			-- one assertion `an_assertion'
		require
			an_assertion_not_void: an_assertion /= Void
		do
			Result := ast_factory.new_preconditions (an_assertion)
		ensure
			preconditions_not_void: Result /= Void
		end

	new_precursor_expression (a_parent: ANY; args: ANY): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		do
			Result := ast_factory.new_precursor_expression (a_parent, args)
		ensure
			precursor_expression_not_void: Result /= Void
		end

	new_precursor_instruction (a_parent: ANY; args: ANY): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		do
			Result := ast_factory.new_precursor_instruction (a_parent, args)
		ensure
			precursor_instruction_not_void: Result /= Void
		end

	new_prefix_freeop (a_string: ET_MANIFEST_STRING; p: ET_POSITION): ET_PREFIX_FREEOP is
			-- New prefix free-operator feature name
		require
			a_string_not_void: a_string /= Void
			p_not_void: p /= Void
		do
			a_string.compute (error_handler)
			Result := ast_factory.new_prefix_freeop (a_string.value, p)
		ensure
			prefix_freeop_not_void: Result /= Void
		end

	new_prefix_freeop_expression (a_token: ET_TOKEN; e: ET_EXPRESSION): ET_PREFIX_EXPRESSION is
			-- New unary free-operator expression
		require
			a_token_not_void: a_token /= Void
			e_not_void: e /= Void
		local
			a_name: ET_PREFIX_FREEOP
		do
			a_name := ast_factory.new_prefix_freeop (a_token.text, a_token.position)
			Result := ast_factory.new_prefix_expression (a_name, e)
		ensure
			freeop_expression_not_void: Result /= Void
		end

	new_prefix_minus (p: ET_POSITION): ET_PREFIX_MINUS is
			-- New prefix "-" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_prefix_minus (p)
		ensure
			prefix_minus_not_void: Result /= Void
		end

	new_prefix_minus_expression (e: ET_EXPRESSION; p: ET_POSITION): ET_PREFIX_EXPRESSION is
			-- New unary minus expression
		require
			e_not_void: e /= Void
			p_not_void: p /= Void
		local
			a_name: ET_PREFIX_MINUS
		do
			a_name := new_prefix_minus (p)
			Result := ast_factory.new_prefix_expression (a_name, e)
		ensure
			minus_expression_not_void: Result /= Void
		end

	new_prefix_not (p: ET_POSITION): ET_PREFIX_NOT is
			-- New prefix "not" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_prefix_not (p)
		ensure
			prefix_not_not_void: Result /= Void
		end

	new_prefix_not_expression (e: ET_EXPRESSION; p: ET_POSITION): ET_PREFIX_EXPRESSION is
			-- New not expression
		require
			e_not_void: e /= Void
			p_not_void: p /= Void
		local
			a_name: ET_PREFIX_NOT
		do
			a_name := new_prefix_not (p)
			Result := ast_factory.new_prefix_expression (a_name, e)
		ensure
			not_expression_not_void: Result /= Void
		end

	new_prefix_plus (p: ET_POSITION): ET_PREFIX_PLUS is
			-- New prefix "+" feature name
		require
			p_not_void: p /= Void
		do
			Result := ast_factory.new_prefix_plus (p)
		ensure
			prefix_plus_not_void: Result /= Void
		end

	new_prefix_plus_expression (e: ET_EXPRESSION; p: ET_POSITION): ET_PREFIX_EXPRESSION is
			-- New unary plus expression
		require
			e_not_void: e /= Void
			p_not_void: p /= Void
		local
			a_name: ET_PREFIX_PLUS
		do
			a_name := new_prefix_plus (p)
			Result := ast_factory.new_prefix_expression (a_name, e)
		ensure
			plus_expression_not_void: Result /= Void
		end

	new_rename_list (nb: INTEGER): ARRAY [ET_RENAME] is
			-- New rename list
		require
			nb_positive: nb > 0
		do
			Result := ast_factory.new_rename_list (nb)
		ensure
			rename_list_not_void: Result /= Void
		end

	new_rename (old_name, new_name: ET_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		require
			old_name_not_void: old_name /= Void
			new_name_not_void: new_name /= Void
		do
			Result := ast_factory.new_rename (old_name, new_name)
		ensure
			renames_not_void: Result /= Void
		end

	new_result (a_position: ET_POSITION): ET_RESULT is
			-- New result entity
		require
			a_position_not_void: a_position /= Void
		do
			Result := ast_factory.new_result (a_position)
		ensure
			result_not_void: Result /= Void
		end

	new_result_address: ET_RESULT_ADDRESS is
			-- New address of Result
		do
			Result := ast_factory.new_result_address
		ensure
			result_address_not_void: Result /= Void
		end

	new_retry_instruction: ET_RETRY_INSTRUCTION is
			-- New retry instruction
		do
			Result := ast_factory.new_retry_instruction
		ensure
			retry_instruction_not_void: Result /= Void
		end

	new_separate_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New separate class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		do
			Result := new_class (a_name)
			Result.set_separate
		ensure
			class_not_void: Result /= Void
			is_separate: Result.is_separate
		end

	new_strip_expression: ET_STRIP_EXPRESSION is
			-- New strip expression
		do
			Result := ast_factory.new_strip_expression
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_synonym_feature (a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE): ET_FEATURE is
			-- New synomym for feature `a_feature'
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_synonym_feature (a_name, a_feature, an_id)
		ensure
			synonym_not_void: Result /= Void
		end

	new_unique_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			last_class_not_void: last_class /= Void
		local
			an_id: INTEGER
		do
			an_id := universe.next_feature_id
			Result := ast_factory.new_unique_attribute (a_name, a_type, last_clients, last_class, an_id)
		ensure
			unique_attribute_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_handler.report_syntax_error (current_position)
			if last_class /= Void then
				last_class.set_syntax_error (True)
			end
		end

feature {NONE} -- Implementation

	feature_list_count: INTEGER
	rename_list_count: INTEGER

feature {NONE} -- Constants

	Eiffel_buffer: YY_FILE_BUFFER is
			-- Eiffel file input buffer
		once
			!! Result.make (std.input)
		ensure
			eiffel_buffer_not_void: Result /= Void
		end

invariant

	universe_not_void: universe /= Void
	ast_factory_not_void: ast_factory /= Void

end -- class ET_EIFFEL_PARSER_SKELETON
