indexing

	description:

		"Eiffel parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			make as make_eiffel_scanner,
			make_with_factory as make_eiffel_scanner_with_factory
		redefine
			reset
		end

	ET_SHARED_EIFFEL_BUFFER
		export {NONE} all end

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
			!! counters.make (Initial_counters_capacity)
			!! class_stack.make (Initial_class_stack_capacity)
			!! assertions.make (Initial_assertions_capacity)
			make_eiffel_scanner_with_factory ("unknown file", a_factory, an_error_handler)
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
			counters.wipe_out
			class_stack.wipe_out
			assertions.wipe_out
			last_clients := Void
			cluster := Void
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Eiffel class universe

	cluster: ET_CLUSTER
			-- Cluster containing the class being parsed

feature -- Parsing

	parse (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse Eiffel file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			filename := a_filename
			cluster := a_cluster
			input_buffer := Eiffel_buffer
			Eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			yyparse
			reset
		rescue
			reset
		end

feature {NONE} -- Basic operations

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		require
			a_feature_not_void: a_feature /= Void
			has_last_class: has_last_class
		do
			last_class.put_feature (a_feature)
		end

	register_frozen_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		require
			a_feature_not_void: a_feature /= Void
			has_last_class: has_last_class
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
			has_last_class: has_last_class
		local
			a_class: like last_class
		do
			a_class := last_class
			a_class.set_generic_parameters (a_generics)
			a_generics.resolve_named_types (a_class, ast_factory)
		end

	add_expression_assertion (an_expression: ET_EXPRESSION; a_semicolon: ET_SYMBOL) is
			-- Add `an_expression' assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		require
			an_expression_not_void: an_expression /= Void
		local
			an_assertion: ET_ASSERTION_ITEM
			a_tagged: ET_TAGGED_ASSERTION
			done: BOOLEAN
		do
			if not assertions.is_empty then
				a_tagged ?= assertions.last
				if a_tagged /= Void and then a_tagged.expression = Void then
					a_tagged.set_expression (an_expression)
					if a_semicolon /= Void then
						an_assertion := new_assertion_semicolon (a_tagged, a_semicolon)
						assertions.replace (an_assertion, assertions.count)
					end
					done := True
				end
			end
			if not done then
				if a_semicolon /= Void then
					an_assertion := new_assertion_semicolon (an_expression, a_semicolon)
				else
					an_assertion := an_expression
				end
				assertions.force_last (an_assertion)
			end
		end

	add_tagged_assertion (a_tag: ET_IDENTIFIER; a_colon: ET_SYMBOL; a_semicolon: ET_SYMBOL) is
			-- Add tagged assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		require
			a_tag_not_void: a_tag /= Void
			a_colon_not_void: a_colon /= Void
		local
			an_assertion: ET_TAGGED_ASSERTION
			an_assertion_item: ET_ASSERTION_ITEM
		do
			an_assertion := new_tagged_assertion (new_tag (a_tag, a_colon))
			if a_semicolon /= Void then
				an_assertion_item := new_assertion_semicolon (an_assertion, a_semicolon)
			else
				an_assertion_item := an_assertion
			end
			assertions.force_last (an_assertion_item)
		end

feature {NONE} -- AST factory

	new_actual_arguments (l: ET_SYMBOL; r: ET_SYMBOL): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_actual_arguments (l, r)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_arguments_with_capacity (nb: INTEGER): ET_ACTUAL_ARGUMENTS is
			-- New actual argument list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_actual_arguments_with_capacity (a_left, a_right, nb)
		ensure
			actual_arguments_not_void: Result /= Void
		end

	new_actual_generics (a_left, a_right: ET_SYMBOL): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := ast_factory.new_actual_generics (a_left, a_right)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_actual_generics_with_capacity (nb: INTEGER): ET_ACTUAL_GENERIC_PARAMETERS is
			-- New actual generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left, a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_actual_generics_with_capacity (a_left, a_right, nb)
		ensure
			actual_generics_not_void: Result /= Void
		end

	new_all_export (a_clients: ET_CLIENTS; an_all: ET_TOKEN): ET_ALL_EXPORT is
			-- New 'all' export clause
		require
			a_clients_not_void: a_clients /= Void
			an_all_not_void: an_all /= Void
		do
			Result := ast_factory.new_all_export (a_clients, an_all)
		ensure
			all_export_not_void: Result /= Void
		end

	new_any_clients (a_position: ET_POSITION): ET_CLASS_NAME_LIST is
			-- Implicit client list with only one client: ANY
		require
			a_position_not_void: a_position /= Void
		local
			a_name: ET_IDENTIFIER
		do
			Result := ast_factory.new_class_name_list_with_capacity (1)
			!! a_name.make_with_position (universe.any_class.name.name, a_position.line, a_position.column)
			Result.put_first (a_name)
			last_clients := Result
		ensure
			any_clients_not_void: Result /= Void
		end

	new_assertion_semicolon (an_assertion: ET_ASSERTION; a_semicolon: ET_SYMBOL): ET_ASSERTION_ITEM is
			-- New assertion followed by a semicolon
		require
			an_assertion_not_void: an_assertion /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_assertion_semicolon (an_assertion, a_semicolon)
			elseif keep_header_comments and a_semicolon.has_comment then
				Result := ast_factory.new_assertion_semicolon (an_assertion, a_semicolon)
			else
				Result := an_assertion
			end
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
			Result := ast_factory.new_assignment (a_target, an_assign, a_source)
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
			Result := ast_factory.new_assignment_attempt (a_target, a_reverse, a_source)
		ensure
			assignment_attempt_not_void: Result /= Void
		end

	new_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE): ET_ATTRIBUTE is
			-- New attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_attribute (a_name, a_type, last_clients, last_class)
		ensure
			attribute_not_void: Result /= Void
		end

	new_bang_instruction (a_bangbang: ET_SYMBOL; a_target: ET_WRITABLE): ET_BANG_INSTRUCTION is
			-- New bang creation instruction
		require
			a_bangbang_not_void: a_bangbang /= Void
			a_target_not_void: a_target /= Void
		do
			Result := ast_factory.new_bang_instruction (a_bangbang, a_target)
		ensure
			bang_instruction_not_void: Result /= Void
		end

	new_bit_identifier (a_bit: ET_TOKEN; an_id: ET_IDENTIFIER): ET_BIT_IDENTIFIER is
			-- New 'BIT Identifier' type
		require
			a_bit_not_void: a_bit /= Void
			an_id_not_void: an_id /= Void
		do
			Result := ast_factory.new_bit_identifier (a_bit, an_id)
		ensure
			type_not_void: Result /= Void
		end

	new_bit_type (a_bit: ET_TOKEN; an_int: ET_INTEGER_CONSTANT): ET_BIT_TYPE is
			-- New 'BIT N' type
		require
			a_bit_not_void: a_bit /= Void
			an_int_not_void: an_int /= Void
		do
			Result := ast_factory.new_bit_type (a_bit, an_int)
		ensure
			type_not_void: Result /= Void
		end

	new_call_expression (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_EXPRESSION is
			-- New call expression
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_call_expression (a_name, args)
		ensure
			call_expression_not_void: Result /= Void
		end

	new_call_instruction (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENTS): ET_CALL_INSTRUCTION is
			-- New call instruction
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_call_instruction (a_name, args)
		ensure
			call_instruction_not_void: Result /= Void
		end

	new_check_instruction (a_check: ET_TOKEN; an_end: ET_TOKEN): ET_CHECK_INSTRUCTION is
			-- New check instruction
		require
			a_check_not_void: a_check /= Void
			an_end_not_void: an_end /= Void
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_check_instruction (a_check, an_end)
			else
				Result := ast_factory.new_check_instruction_with_capacity (a_check, an_end, i)
				from until i < 1 loop
					Result.put_first (assertions.item (i))
					i := i - 1
				end
				assertions.wipe_out
			end
		ensure
			check_instruction_not_void: Result /= Void
		end

	new_choice_comma (a_choice: ET_CHOICE; a_comma: ET_SYMBOL): ET_CHOICE_ITEM is
			-- New choice-comma
		require
			a_choice_not_void: a_choice /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_choice_comma (a_choice, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_choice_comma (a_choice, a_comma)
			else
				Result := a_choice
			end
		ensure
			choice_comma_not_void: Result /= Void
		end

	new_choice_list (a_choice: ET_CHOICE_ITEM): ET_CHOICE_LIST is
			-- New choice list
		require
			a_choice_not_void: a_choice /= Void
		do
			Result := ast_factory.new_choice_list (a_choice)
		ensure
			choice_list_not_void: Result /= Void
		end

	new_choice_list_with_capacity (a_choice: ET_CHOICE_ITEM; nb: INTEGER): ET_CHOICE_LIST is
			-- New choice list with given capacity
		require
			a_choice_not_void: a_choice /= Void
			nb_positive: nb >= 1
		do
			Result := ast_factory.new_choice_list_with_capacity (a_choice, nb)
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
			Result := ast_factory.new_choice_range (a_lower, a_dotdot, an_upper)
		ensure
			choice_range_not_void: Result /= Void
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
			Result.set_name (a_name)
			Result.set_parsed

			debug ("GELINT")
				std.error.put_string ("Parse class `")
				std.error.put_string (a_name.name)
				std.error.put_string ("'%N")
			end
		ensure
			class_not_void: Result /= Void
		end

	new_class_name_comma (a_name: ET_CLASS_NAME; a_comma: ET_SYMBOL): ET_CLASS_NAME_ITEM is
			-- New class_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_class_name_comma (a_name, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_class_name_comma (a_name, a_comma)
			else
				Result := a_name
			end
		ensure
			class_name_comma_not_void: Result /= Void
		end

	new_clients (a_left, a_right: ET_SYMBOL): ET_CLIENTS is
			-- New client clause
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := ast_factory.new_clients (a_left, a_right)
			last_clients := Result
		ensure
			clients_not_void: Result /= Void
		end

	new_clients_with_capacity (nb: INTEGER): ET_CLIENTS is
			-- New client clause with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_clients_with_capacity (a_left, a_right, nb)
			last_clients := Result
		ensure
			clients_not_void: Result /= Void
		end

	new_colon_formal_argument (a_name: ET_ARGUMENT_NAME; a_type: ET_TYPE): ET_COLON_FORMAL_ARGUMENT is
			-- New formal argument whose name is followed by a colon
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			Result := ast_factory.new_colon_formal_argument (a_name, a_type)
		ensure
			colon_formal_argument_not_void: Result /= Void
		end

	new_colon_local_variable (a_name: ET_LOCAL_NAME; a_type: ET_TYPE): ET_COLON_LOCAL_VARIABLE is
			-- New local variable whose name is followed by a colon
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			Result := ast_factory.new_colon_local_variable (a_name, a_type)
		ensure
			colon_local_variable_not_void: Result /= Void
		end

	new_comma_formal_argument (a_name: ET_ARGUMENT_NAME; a_type: ET_TYPE): ET_COMMA_FORMAL_ARGUMENT is
			-- New formal agument whose name is followed by a comma
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			Result := ast_factory.new_comma_formal_argument (a_name, a_type)
		ensure
			comma_formal_argument_not_void: Result /= Void
		end

	new_comma_local_variable (a_name: ET_LOCAL_NAME; a_type: ET_TYPE): ET_COMMA_LOCAL_VARIABLE is
			-- New local variable whose name is followed by a comma
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
		do
			Result := ast_factory.new_comma_local_variable (a_name, a_type)
		ensure
			comma_local_variable_not_void: Result /= Void
		end

	new_compound (a_keyword: ET_TOKEN): ET_COMPOUND is
			-- New instruction compound
		require
			a_keyword_not_void: a_keyword /= Void
		do
			Result := ast_factory.new_compound (a_keyword)
		ensure
			compound_not_void: Result /= Void
		end

	new_compound_with_capacity (nb: INTEGER): ET_COMPOUND is
			-- New instruction compound with given capacity
		require
			nb_positive: nb >= 0
		local
			a_keyword: ET_TOKEN
		do
			a_keyword := tokens.keyword
			Result := ast_factory.new_compound_with_capacity (a_keyword, nb)
		ensure
			compound_not_void: Result /= Void
		end

	new_constant_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; a_constant: ET_CONSTANT): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_constant_not_void: a_constant /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_constant_attribute (a_name, a_type, a_constant, last_clients, last_class)
		ensure
			constant_attribute_not_void: Result /= Void
		end

	new_constrained_formal_generic (a_name: ET_IDENTIFIER; an_arrow: ET_SYMBOL; a_constraint: ET_TYPE;
		a_creation: ET_CONSTRAINT_CREATOR): ET_CONSTRAINED_FORMAL_GENERIC_PARAMETER is
			-- New constrained formal generic parameter
		require
			a_name_not_void: a_name /= Void
			an_arrow_not_void: an_arrow /= Void
			a_constraint_not_void: a_constraint /= Void
		do
			Result := ast_factory.new_constrained_formal_generic (a_name, an_arrow, a_constraint, a_creation)
		ensure
			constrained_formal_generic_not_void: Result /= Void
		end

	new_constraint_creator (a_create: ET_TOKEN; an_end: ET_TOKEN): ET_CONSTRAINT_CREATOR is
			-- New constraint creation clause
		require
			a_create_not_void: a_create /= Void
			an_end_not_void: an_end /= Void
		do
			Result := ast_factory.new_constraint_creator (a_create, an_end)
		ensure
			constraint_creator_not_void: Result /= Void
		end

	new_constraint_creator_with_capacity (nb: INTEGER): ET_CONSTRAINT_CREATOR is
			-- New constraint creation clause with given capacity
		require
			nb_positive: nb >= 0
		local
			a_create: ET_TOKEN
			an_end: ET_TOKEN
		do
			a_create := tokens.create_keyword
			an_end := tokens.end_keyword
			Result := ast_factory.new_constraint_creator_with_capacity (a_create, an_end, nb)
		ensure
			constraint_creator_not_void: Result /= Void
		end

	new_constraint_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_NAMED_TYPE is
			-- New Eiffel class type or formal generic paramater
			-- appearing in a generic constraint
		require
			a_name_not_void: a_name /= Void
		do
			if a_generics /= Void then
				Result := ast_factory.new_generic_named_type (a_type_mark, a_name, a_generics)
			else
				Result := ast_factory.new_named_type (a_type_mark, a_name)
			end
		ensure
			constraint_named_type_not_void: Result /= Void
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
			Result := ast_factory.new_create_expression (a_create, l, a_type, r)
		ensure
			create_expression_not_void: Result /= Void
		end

	new_create_instruction (a_create: ET_TOKEN; a_target: ET_WRITABLE): ET_CREATE_INSTRUCTION is
			-- New create instruction
		require
			a_create_not_void: a_create /= Void
			a_target_not_void: a_target /= Void
		do
			Result := ast_factory.new_create_instruction (a_create, a_target)
		ensure
			create_instruction_not_void: Result /= Void
		end

	new_creator (a_creation: ET_TOKEN; a_clients: ET_CLASS_NAME_LIST): ET_CREATOR is
			-- New creation clause
		require
			a_creation_not_void: a_creation /= Void
			a_clients_not_void: a_clients /= Void
		do
			Result := ast_factory.new_creator (a_creation, a_clients)
		ensure
			creator_not_void: Result /= Void
		end

	new_creator_with_capacity (nb: INTEGER): ET_CREATOR is
			-- New creation clause with given capacity
		require
			nb_positive: nb >= 0
		local
			a_creation: ET_TOKEN
		do
			a_creation := tokens.creation_keyword
			Result := ast_factory.new_creator_with_capacity (a_creation, dummy_clients, nb)
		ensure
			creator_not_void: Result /= Void
		end

	new_creators (a_creator: ET_CREATOR): ET_CREATORS is
			-- New creation clauses
		require
			a_creator_not_void: a_creator /= Void
		do
			Result := ast_factory.new_creators (a_creator)
		ensure
			creators_not_void: Result /= Void
		end

	new_creators_with_capacity (a_creator: ET_CREATOR; nb: INTEGER): ET_CREATORS is
			-- New creation clauses with given capacity
		require
			a_creator_not_void: a_creator /= Void
			nb_positive: nb >= 1
		do
			Result := ast_factory.new_creators_with_capacity (a_creator, nb)
		ensure
			creators_not_void: Result /= Void
		end

	new_current_address (d: ET_SYMBOL; c: ET_CURRENT): ET_CURRENT_ADDRESS is
			-- New address of Current
		require
			d_not_void: d /= Void
			c_not_void: c /= Void
		do
			Result := ast_factory.new_current_address (d, c)
		ensure
			current_address_not_void: Result /= Void
		end

	new_debug_instruction (a_debug: ET_TOKEN; a_keys: ET_DEBUG_KEYS; an_end: ET_TOKEN): ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		require
			a_debug_not_void: a_debug /= Void
			an_end_not_void: an_end /= Void
		do
			Result := ast_factory.new_debug_instruction (a_debug, a_keys, an_end)
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_debug_instruction_with_capacity (nb: INTEGER): ET_DEBUG_INSTRUCTION is
			-- New debug instruction with given capacity
		require
			nb_positive: nb >= 0
		local
			a_debug: ET_TOKEN
			an_end: ET_TOKEN
		do
			a_debug := tokens.debug_keyword
			an_end := tokens.end_keyword
			Result := ast_factory.new_debug_instruction_with_capacity (a_debug, Void, an_end, nb)
		ensure
			debug_instruction_not_void: Result /= Void
		end

	new_debug_keys (l: ET_SYMBOL; r: ET_SYMBOL): ET_DEBUG_KEYS is
			-- New debug keys
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_debug_keys (l, r)
		ensure
			debug_keys_not_void: Result /= Void
		end

	new_debug_keys_with_capacity (nb: INTEGER): ET_DEBUG_KEYS is
			-- New debug keys with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_debug_keys_with_capacity (a_left, a_right, nb)
		ensure
			debug_keys_not_void: Result /= Void
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
		a_type: ET_TYPE; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS): ET_DEFERRED_FUNCTION is
			-- New deferred function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_deferred_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_postconditions,
				last_clients, last_class)
		ensure
			deferred_function_not_void: Result /= Void
		end

	new_deferred_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_postconditions: ET_POSTCONDITIONS): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_deferred_procedure (a_name, args,
				an_obsolete, a_preconditions, a_postconditions,
				last_clients, last_class)
		ensure
			deferred_procedure_not_void: Result /= Void
		end

	new_do_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_DO_FUNCTION is
			-- New do function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_do_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_locals,
				a_compound, a_postconditions, a_rescue,
				last_clients, last_class)
		ensure
			do_function_not_void: Result /= Void
		end

	new_do_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_DO_PROCEDURE is
			-- New do procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_do_procedure (a_name, args,
				an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class)
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
			Result := ast_factory.new_elseif_part (an_elseif, an_expression, a_then_compound)
		ensure
			elseif_part_not_void: Result /= Void
		end

	new_elseif_part_list (an_elseif_part: ET_ELSEIF_PART): ET_ELSEIF_PART_LIST is
			-- New elseif part list
		require
			an_elseif_part_not_void: an_elseif_part /= Void
		do
			Result := ast_factory.new_elseif_part_list (an_elseif_part)
		ensure
			elseif_part_list_not_void: Result /= Void
		end

	new_elseif_part_list_with_capacity (an_elseif_part: ET_ELSEIF_PART; nb: INTEGER): ET_ELSEIF_PART_LIST is
			-- New elseif part list with given capacity
		require
			an_elseif_part_not_void: an_elseif_part /= Void
			nb_positive: nb >= 1
		do
			Result := ast_factory.new_elseif_part_list_with_capacity (an_elseif_part, nb)
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
			Result := ast_factory.new_equality_expression (l, an_op, r)
		ensure
			equality_expression_not_void: Result /= Void
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

	new_exports (an_export: ET_TOKEN): ET_EXPORTS is
			-- New export clause
		require
			an_export_not_void: an_export /= Void
		do
			Result := ast_factory.new_exports (an_export)
		ensure
			exports_not_void: Result /= Void
		end

	new_exports_with_capacity (nb: INTEGER): ET_EXPORTS is
			-- New export clause with given capacity
		require
			nb_positive: nb >= 0
		local
			an_export: ET_TOKEN
		do
			an_export := tokens.export_keyword
			Result := ast_factory.new_exports_with_capacity (an_export, nb)
		ensure
			exports_not_void: Result /= Void
		end

	new_expression_address (d: ET_SYMBOL; e: ET_PARENTHESIZED_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		require
			d_not_void: d /= Void
			e_not_void: e /= Void
		do
			Result := ast_factory.new_expression_address (d, e)
		ensure
			expression_address_not_void: Result /= Void
		end

	new_expression_comma (an_expression: ET_EXPRESSION; a_comma: ET_SYMBOL): ET_EXPRESSION_ITEM is
			-- New expression-comma
		require
			an_expression_not_void: an_expression /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_expression_comma (an_expression, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_expression_comma (an_expression, a_comma)
			else
				Result := an_expression
			end
		ensure
			expression_comma_not_void: Result /= Void
		end

	new_expression_variant (a_variant: ET_TOKEN; an_expression: ET_EXPRESSION): ET_EXPRESSION_VARIANT is
			-- New loop expression variant
		require
			a_variant_not_void: a_variant /= Void
			an_expression_not_void: an_expression /= Void
		do
			Result := ast_factory.new_expression_variant (a_variant, an_expression)
		ensure
			expression_variant_not_void: Result /= Void
		end

	new_external_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS): ET_EXTERNAL_FUNCTION is
			-- New external function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_external_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_language, an_alias,
				a_postconditions, last_clients, last_class)
		ensure
			external_function_not_void: Result /= Void
		end

	new_external_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_language: ET_MANIFEST_STRING; an_alias: ET_MANIFEST_STRING;
		a_postconditions: ET_POSTCONDITIONS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		require
			a_name_not_void: a_name /= Void
			a_language_not_void: a_language /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_external_procedure (a_name, args,
				an_obsolete, a_preconditions, a_language, an_alias,
				a_postconditions, last_clients, last_class)
		ensure
			external_procedure_not_void: Result /= Void
		end

	new_feature_address (d: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_FEATURE_ADDRESS is
			-- New feature address
		require
			d_not_void: d /= Void
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_feature_address (d, a_name)
		ensure
			feature_address_not_void: Result /= Void
		end

	new_feature_export (a_clients: ET_CLIENTS): ET_FEATURE_EXPORT is
			-- New feature export clause
		require
			a_clients_not_void: a_clients /= Void
		do
			Result := ast_factory.new_feature_export (a_clients)
		ensure
			feature_export_not_void: Result /= Void
		end

	new_feature_export_with_capacity (nb: INTEGER): ET_FEATURE_EXPORT is
			-- New feature export clause with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_feature_export_with_capacity (dummy_clients, nb)
		ensure
			feature_export_not_void: Result /= Void
		end

	new_feature_name_comma (a_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_FEATURE_NAME_ITEM is
			-- New feature_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_feature_name_comma (a_name, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_feature_name_comma (a_name, a_comma)
			else
				Result := a_name
			end
		ensure
			feature_name_comma_not_void: Result /= Void
		end

	new_argument_name_colon (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_ARGUMENT_NAME is
			-- New argument_name-colon
		require
			a_name_not_void: a_name /= Void
			a_colon_not_void: a_colon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			elseif keep_all_comments and a_colon.has_comment then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			else
				Result := a_name
			end
		ensure
			argument_name_colon_not_void: Result /= Void
		end

	new_argument_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_ARGUMENT_NAME is
			-- New argument_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_identifier_comma (a_name, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_identifier_comma (a_name, a_comma)
			else
				Result := a_name
			end
		ensure
			argument_name_comma_not_void: Result /= Void
		end

	new_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT; a_semicolon: ET_SYMBOL): ET_FORMAL_ARGUMENT_SEMICOLON is
			-- New formal_argument-semicolon
		require
			an_argument_not_void: an_argument /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			Result := ast_factory.new_formal_argument_semicolon (an_argument, a_semicolon)
		ensure
			formal_argument_semicolon_not_void: Result /= Void
		end

	new_formal_arguments (a_left, a_right: ET_SYMBOL): ET_FORMAL_ARGUMENTS is
			-- New formal argument list
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := ast_factory.new_formal_arguments (a_left, a_right)
		ensure
			formal_arguments_not_void: Result /= Void
		end

	new_formal_arguments_with_capacity (nb: INTEGER): ET_FORMAL_ARGUMENTS is
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left, a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_formal_arguments_with_capacity (a_left, a_right, nb)
		ensure
			formal_arguments_not_void: Result /= Void
		end

	new_formal_generic (a_name: ET_IDENTIFIER): ET_FORMAL_GENERIC_PARAMETER is
			-- New formal generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_formal_generic (a_name)
		ensure
			formal_generic_not_void: Result /= Void
		end

	new_formal_generic_comma (a_formal: ET_FORMAL_GENERIC_PARAMETER; a_comma: ET_SYMBOL): ET_FORMAL_GENERIC_PARAMETER_ITEM is
			-- New formal_generic_parameter-comma
		require
			a_formal_not_void: a_formal /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_formal_generic_comma (a_formal, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_formal_generic_comma (a_formal, a_comma)
			else
				Result := a_formal
			end
		ensure
			formal_generic_parameter_comma_not_void: Result /= Void
		end

	new_formal_generics (a_left, a_right: ET_SYMBOL): ET_FORMAL_GENERIC_PARAMETERS is
			-- New formal generic parameter list
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := ast_factory.new_formal_generics (a_left, a_right)
		ensure
			formal_generics_not_void: Result /= Void
		end

	new_formal_generics_with_capacity (nb: INTEGER): ET_FORMAL_GENERIC_PARAMETERS is
			-- New formal generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left, a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_formal_generics_with_capacity (a_left, a_right, nb)
		ensure
			formal_generics_not_void: Result /= Void
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
			Result := ast_factory.new_if_instruction (an_if, an_expression, a_then_compound, an_end)
		ensure
			if_instruction_not_void: Result /= Void
		end

	new_infix_and_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_AND_NAME is
			-- New infix "and" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_and_name (an_infix, an_operator)
		ensure
			infix_and_name_not_void: Result /= Void
		end

	new_infix_and_then_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_AND_THEN_NAME is
			-- New infix "and then" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_and_then_name (an_infix, an_operator)
		ensure
			infix_and_then_name_not_void: Result /= Void
		end

	new_infix_and_then_operator (an_and: ET_TOKEN; a_then: ET_TOKEN): ET_INFIX_AND_THEN_OPERATOR is
			-- New binary "and then" operator
		require
			an_and_not_void: an_and /= Void
			a_then_not_void: a_then /= Void
		do
			Result := ast_factory.new_infix_and_then_operator (an_and, a_then)
		ensure
			infix_and_then_operator_not_void: Result /= Void
		end

	new_infix_div_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_DIV_NAME is
			-- New infix "//" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_div_name (an_infix, an_operator)
		ensure
			infix_div_name_not_void: Result /= Void
		end

	new_infix_divide_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_DIVIDE_NAME is
			-- New infix "//" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_divide_name (an_infix, an_operator)
		ensure
			infix_divide_name_not_void: Result /= Void
		end

	new_infix_expression (l: ET_EXPRESSION; a_name: ET_INFIX_OPERATOR; r: ET_EXPRESSION): ET_INFIX_EXPRESSION is
			-- New infix expression
		require
			l_not_void: l /= Void
			a_name_not_void: a_name /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_infix_expression (l, a_name, r)
		ensure
			infix_expression_not_void: Result /= Void
		end

	new_infix_free_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			an_operator.compute (error_handler)
			if an_operator.computed and then an_operator.value.count > 0 then
				Result := ast_factory.new_infix_free_name (an_infix, an_operator)
			else
				-- TODO
			end
		ensure
			infix_free_name_not_void: Result /= Void
		end

	new_infix_ge_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_GE_NAME is
			-- New infix ">=" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_ge_name (an_infix, an_operator)
		ensure
			infix_ge_name_not_void: Result /= Void
		end

	new_infix_gt_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_GT_NAME is
			-- New infix ">" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_gt_name (an_infix, an_operator)
		ensure
			infix_gt_name_not_void: Result /= Void
		end

	new_infix_implies_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_IMPLIES_NAME is
			-- New infix "implies" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_implies_name (an_infix, an_operator)
		ensure
			infix_implies_name_not_void: Result /= Void
		end

	new_infix_le_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_LE_NAME is
			-- New infix "<=" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_le_name (an_infix, an_operator)
		ensure
			infix_le_name_not_void: Result /= Void
		end

	new_infix_lt_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_LT_NAME is
			-- New infix "<" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_lt_name (an_infix, an_operator)
		ensure
			infix_lt_name_not_void: Result /= Void
		end

	new_infix_minus_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_MINUS_NAME is
			-- New infix "-" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_minus_name (an_infix, an_operator)
		ensure
			infix_minus_name_not_void: Result /= Void
		end

	new_infix_mod_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_MOD_NAME is
			-- New infix "\\" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_mod_name (an_infix, an_operator)
		ensure
			infix_mod_name_not_void: Result /= Void
		end

	new_infix_or_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_OR_NAME is
			-- New infix "or" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_or_name (an_infix, an_operator)
		ensure
			infix_or_name_not_void: Result /= Void
		end

	new_infix_or_else_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_OR_ELSE_NAME is
			-- New infix "or else" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_or_else_name (an_infix, an_operator)
		ensure
			infix_or_else_name_not_void: Result /= Void
		end

	new_infix_or_else_operator (an_or: ET_TOKEN; an_else: ET_TOKEN): ET_INFIX_OR_ELSE_OPERATOR is
			-- New binary "or else" operator
		require
			an_or_not_void: an_or /= Void
			an_else_not_void: an_else /= Void
		do
			Result := ast_factory.new_infix_or_else_operator (an_or, an_else)
		ensure
			infix_or_else_operator_not_void: Result /= Void
		end

	new_infix_plus_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_PLUS_NAME is
			-- New infix "+" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_plus_name (an_infix, an_operator)
		ensure
			infix_plus_name_not_void: Result /= Void
		end

	new_infix_power_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_POWER_NAME is
			-- New infix "^" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_power_name (an_infix, an_operator)
		ensure
			infix_power_name_not_void: Result /= Void
		end

	new_infix_times_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_TIMES_NAME is
			-- New infix "*" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_times_name (an_infix, an_operator)
		ensure
			infix_times_name_not_void: Result /= Void
		end

	new_infix_xor_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_XOR_NAME is
			-- New infix "xor" feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_infix_xor_name (an_infix, an_operator)
		ensure
			infix_xor_name_not_void: Result /= Void
		end

	new_inspect_instruction (an_inspect: ET_TOKEN; an_expression: ET_EXPRESSION;
		an_end: ET_TOKEN): ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		require
			an_inspect_not_void: an_inspect /= Void
			an_expression_not_void: an_expression /= Void
			an_end_not_void: an_end /= Void
		do
			Result := ast_factory.new_inspect_instruction (an_inspect, an_expression, an_end)
		ensure
			inspect_instruction_not_void: Result /= Void
		end

	new_invalid_infix_name (an_infix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New invalid infix feature name
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
-- ERROR
			Result := new_infix_free_name (an_infix, an_operator)
		ensure
			invalid_infix_name_not_void: Result /= Void
		end

	new_invalid_prefix_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New invalid prefix feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
-- ERROR
			Result := new_prefix_free_name (a_prefix, an_operator)
		ensure
			invalid_prefix_name_not_void: Result /= Void
		end

	new_invariants (an_invariant: ET_TOKEN): ET_INVARIANTS is
			-- New invariants
		require
			an_invariant_not_void: an_invariant /= Void
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_invariants (an_invariant)
			else
				Result := ast_factory.new_invariants_with_capacity (an_invariant, i)
				from until i < 1 loop
					Result.put_first (assertions.item (i))
					i := i - 1
				end
				assertions.wipe_out
			end
		ensure
			invariants_not_void: Result /= Void
		end

	new_keyword_feature_name_list (a_keyword: ET_TOKEN): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list preceded by a keyword
		require
			a_keyword_not_void: a_keyword /= Void
		do
			Result := ast_factory.new_keyword_feature_name_list (a_keyword)
		ensure
			keyword_feature_name_list_not_void: Result /= Void
		end

	new_keyword_feature_name_list_with_capacity (nb: INTEGER): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list, with a given capacity, preceded by a keyword
		require
			nb_positive: nb >= 0
		local
			a_keyword: ET_TOKEN
		do
			a_keyword := tokens.keyword
			Result := ast_factory.new_keyword_feature_name_list_with_capacity (a_keyword, nb)
		ensure
			keyword_feature_name_list_not_void: Result /= Void
		end

	new_like_current (a_like: ET_TOKEN; a_current: ET_TOKEN): ET_LIKE_CURRENT is
			-- New 'like Current' type
		require
			a_like_not_void: a_like /= Void
			a_current_not_void: a_current /= Void
		do
			Result := ast_factory.new_like_current (a_like, a_current)
		ensure
			type_not_void: Result /= Void
		end

	new_like_identifier (a_like: ET_TOKEN; a_name: ET_IDENTIFIER): ET_LIKE_IDENTIFIER is
			-- New 'like Identifier' type
		require
			a_like_not_void: a_like /= Void
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_like_identifier (a_like, a_name)
		ensure
			type_not_void: Result /= Void
		end

	new_local_name_colon (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_LOCAL_NAME is
			-- New local_name-colon
		require
			a_name_not_void: a_name /= Void
			a_colon_not_void: a_colon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			elseif keep_all_comments and a_colon.has_comment then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			else
				Result := a_name
			end
		ensure
			local_name_colon_not_void: Result /= Void
		end

	new_local_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_LOCAL_NAME is
			-- New local_name-comma
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_identifier_comma (a_name, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_identifier_comma (a_name, a_comma)
			else
				Result := a_name
			end
		ensure
			local_name_comma_not_void: Result /= Void
		end

	new_local_variable_semicolon (a_variable: ET_LOCAL_VARIABLE; a_semicolon: ET_SYMBOL): ET_LOCAL_VARIABLE_ITEM is
			-- New local_variable-semicolon
		require
			a_variable_not_void: a_variable /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_local_variable_semicolon (a_variable, a_semicolon)
			elseif keep_all_comments and a_semicolon.has_comment then
				Result := ast_factory.new_local_variable_semicolon (a_variable, a_semicolon)
			else
				Result := a_variable
			end
		ensure
			local_variable_semicolon_not_void: Result /= Void
		end

	new_local_variables (a_local: ET_TOKEN): ET_LOCAL_VARIABLES is
			-- New local variable list
		require
			a_local_not_void: a_local /= Void
		do
			Result := ast_factory.new_local_variables (a_local)
		ensure
			local_variables_not_void: Result /= Void
		end

	new_local_variables_with_capacity (nb: INTEGER): ET_LOCAL_VARIABLES is
			-- New local variable list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_local: ET_TOKEN
		do
			a_local := tokens.local_keyword
			Result := ast_factory.new_local_variables_with_capacity (a_local, nb)
		ensure
			local_variables_not_void: Result /= Void
		end

	new_loop_instruction (a_from_compound: ET_COMPOUND;
		an_invariant: ET_INVARIANTS; a_variant: ET_VARIANT;
		an_until: ET_TOKEN; an_until_expression: ET_EXPRESSION;
		a_loop_compound: ET_COMPOUND; an_end: ET_TOKEN): ET_LOOP_INSTRUCTION is
			-- New loop instruction
		require
			a_from_compound_not_void: a_from_compound /= Void
			an_until_not_void: an_until /= Void
			an_until_expression_not_void: an_until_expression /= Void
			a_loop_compound_not_void: a_loop_compound /= Void
			an_end_not_void: an_end /= Void
		do
			Result := ast_factory.new_loop_instruction (a_from_compound, an_invariant,
				a_variant, an_until, an_until_expression, a_loop_compound, an_end)
		ensure
			loop_instruction_not_void: Result /= Void
		end

	new_manifest_array (l: ET_SYMBOL; r: ET_SYMBOL): ET_MANIFEST_ARRAY is
			-- New manifest array
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_manifest_array (l, r)
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_manifest_array_with_capacity (nb: INTEGER): ET_MANIFEST_ARRAY is
			-- New manifest array with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_manifest_array_with_capacity (a_left, a_right, nb)
		ensure
			manifest_array_not_void: Result /= Void
		end

	new_manifest_string_comma (a_string: ET_MANIFEST_STRING; a_comma: ET_SYMBOL): ET_MANIFEST_STRING_ITEM is
			-- New manifest_string-comma
		require
			a_string_not_void: a_string /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_manifest_string_comma (a_string, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_manifest_string_comma (a_string, a_comma)
			else
				Result := a_string
			end
		ensure
			manifest_string_comma_not_void: Result /= Void
		end

	new_manifest_tuple (l: ET_SYMBOL; r: ET_SYMBOL): ET_MANIFEST_TUPLE is
			-- New manifest tuple
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_manifest_tuple (l, r)
		ensure
			manifest_tuple_not_void: Result /= Void
		end

	new_manifest_tuple_with_capacity (nb: INTEGER): ET_MANIFEST_TUPLE is
			-- New manifest tuple with given capacity
		require
			nb_positive: nb >= 0
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		do
			a_left := tokens.symbol
			a_right := tokens.symbol
			Result := ast_factory.new_manifest_tuple_with_capacity (a_left, a_right, nb)
		ensure
			manifest_tuple_not_void: Result /= Void
		end

	new_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER;
		a_generics: like new_actual_generics): ET_TYPE is
			-- New Eiffel class type or formal generic paramater
		require
			a_name_not_void: a_name /= Void
			has_last_class: has_last_class
		local
			a_parameter: ET_FORMAL_GENERIC_PARAMETER
			a_last_class: ET_CLASS
			a_class: ET_CLASS
		do
			a_last_class := last_class
			a_parameter := a_last_class.generic_parameter (a_name)
			if a_parameter /= Void then
				if a_generics /= Void then
					-- Error
				end
				if a_type_mark /= Void then
					-- ERROR
				end
				Result := ast_factory.new_formal_generic_type (a_name, a_parameter.index)
			else
				a_class := universe.eiffel_class (a_name)
				if a_last_class.in_system then
					a_class.add_to_system
				end
				if a_generics /= Void then
					Result := ast_factory.new_generic_class_type (a_type_mark, a_name, a_generics, a_class)
				else
					Result := ast_factory.new_class_type (a_type_mark, a_name, a_class)
				end
			end
		ensure
			named_type_not_void: Result /= Void
		end

	new_none_clients (a_left, a_right: ET_SYMBOL): ET_NONE_CLIENTS is
			-- Client list of the form {}
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		do
			Result := ast_factory.new_none_clients (a_left, a_right)
			last_clients := Result
		ensure
			none_clients_not_void: Result /= Void
		end

	new_obsolete (an_obsolete: ET_TOKEN; a_message: ET_MANIFEST_STRING): ET_OBSOLETE is
			-- New obsolete clause.
		require
			an_obsolete_not_void: an_obsolete /= Void
			a_message_not_void: a_message /= Void
		do
			Result := ast_factory.new_obsolete (an_obsolete, a_message)
		ensure
			obsolete_not_void: Result /= Void
		end

	new_old_expression (an_old: ET_TOKEN; e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		require
			an_old_not_void: an_old /= Void
			e_not_void: e /= Void
		do
			Result := ast_factory.new_old_expression (an_old, e)
		ensure
			old_expression_not_void: Result /= Void
		end

	new_once_function (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS; a_type: ET_TYPE;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_ONCE_FUNCTION is
			-- New once function
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_once_function (a_name, args,
				a_type, an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class)
		ensure
			once_function_not_void: Result /= Void
		end

	new_once_procedure (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLES; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND): ET_ONCE_PROCEDURE is
			-- New once procedure
		require
			a_name_not_void: a_name /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_once_procedure (a_name, args,
				an_obsolete, a_preconditions, a_locals, a_compound,
				a_postconditions, a_rescue, last_clients, last_class)
		ensure
			once_procedure_not_void: Result /= Void
		end

	new_parent (a_name: ET_IDENTIFIER; a_generic_parameters: like new_actual_generics;
		a_renames: ET_RENAMES; an_exports: ET_EXPORTS; an_undefines, a_redefines,
		a_selects: ET_KEYWORD_FEATURE_NAME_LIST; an_end: ET_TOKEN): ET_PARENT is
			-- New parent
		require
			a_name_not_void: a_name /= Void
			a_renames_constraint: a_renames /= Void implies an_end /= Void
			an_exports_constraint: an_exports /= Void implies an_end /= Void
			an_undefines_constraint: an_undefines /= Void implies an_end /= Void
			a_redefines_constraint: a_redefines /= Void implies an_end /= Void
			a_selects_constraint: a_selects /= Void implies an_end /= Void
			has_last_class: has_last_class
		local
			a_type: ET_CLASS_TYPE
			a_last_class: like last_class
			a_class: ET_CLASS
		do
			a_last_class := last_class
			if a_last_class.has_generic_parameter (a_name) then
				-- Error
			end
			a_class := universe.eiffel_class (a_name)
			if a_last_class.in_system then
				a_class.add_to_system
			end
			if a_generic_parameters /= Void then
				!ET_GENERIC_CLASS_TYPE! a_type.make (Void, a_name, a_generic_parameters, a_class)
			else
				!! a_type.make (Void, a_name, a_class)
			end
			Result := ast_factory.new_parent (a_type, a_renames, an_exports,
				an_undefines, a_redefines, a_selects, an_end)
		ensure
			parent_not_void: Result /= Void
		end

	new_parent_semicolon (a_parent: ET_PARENT; a_semicolon: ET_SYMBOL): ET_PARENT_ITEM is
			-- New parent-semicolon
		require
			a_parent_not_void: a_parent /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_parent_semicolon (a_parent, a_semicolon)
			elseif keep_all_comments and a_semicolon.has_comment then
				Result := ast_factory.new_parent_semicolon (a_parent, a_semicolon)
			else
				Result := a_parent
			end
		ensure
			parent_semicolon_not_void: Result /= Void
		end

	new_parenthesized_expression (l: ET_SYMBOL; e: ET_EXPRESSION; r: ET_SYMBOL): ET_PARENTHESIZED_EXPRESSION is
			-- New parenthesized expression
		require
			l_not_void: l /= Void
			e_not_void: e /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_parenthesized_expression (l, e, r)
		ensure
			parenthesized_expression_not_void: Result /= Void
		end

	new_parents (an_inherit: ET_TOKEN): ET_PARENTS is
			-- New class parent list
		require
			an_inherit_not_void: an_inherit /= Void
		do
			Result := ast_factory.new_parents (an_inherit)
		ensure
			parents_not_void: Result /= Void
		end

	new_parents_with_capacity (nb: INTEGER): ET_PARENTS is
			-- New class parent list with given capacity
		require
			nb_positive: nb >= 0
		local
			an_inherit: ET_TOKEN
		do
			an_inherit := tokens.inherit_keyword
			Result := ast_factory.new_parents_with_capacity (an_inherit, nb)
		ensure
			parents_not_void: Result /= Void
		end

	new_postconditions (an_ensure: ET_TOKEN; a_then: ET_TOKEN): ET_POSTCONDITIONS is
			-- New postconditions
		require
			an_ensure_not_void: an_ensure /= Void
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_postconditions (an_ensure)
			else
				Result := ast_factory.new_postconditions_with_capacity (an_ensure, i)
				from until i < 1 loop
					Result.put_first (assertions.item (i))
					i := i - 1
				end
				assertions.wipe_out
			end
			if a_then /= Void then
				Result.set_then_keyword (a_then)
			end
		ensure
			postconditions_not_void: Result /= Void
		end

	new_preconditions (a_require: ET_TOKEN; an_else: ET_TOKEN): ET_PRECONDITIONS is
			-- New preconditions
		require
			a_require_not_void: a_require /= Void
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_preconditions (a_require)
			else
				Result := ast_factory.new_preconditions_with_capacity (a_require, i)
				from until i < 1 loop
					Result.put_first (assertions.item (i))
					i := i - 1
				end
				assertions.wipe_out
			end
			if an_else /= Void then
				Result.set_else_keyword (an_else)
			end
		ensure
			preconditions_not_void: Result /= Void
		end

	new_precursor_expression (a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		require
			a_keyword_not_void: a_keyword /= Void
		do
			Result := ast_factory.new_precursor_expression (a_keyword, args)
		ensure
			precursor_expression_not_void: Result /= Void
		end

	new_precursor_instruction (a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		require
			a_keyword_not_void: a_keyword /= Void
		do
			Result := ast_factory.new_precursor_instruction (a_keyword, args)
		ensure
			precursor_instruction_not_void: Result /= Void
		end

	new_prefix_expression (a_name: ET_PREFIX_OPERATOR; e: ET_EXPRESSION): ET_PREFIX_EXPRESSION is
			-- New prefix expression
		require
			a_name_not_void: a_name /= Void
			e_not_void: e /= Void
		do
			Result := ast_factory.new_prefix_expression (a_name, e)
		ensure
			prefix_expression_not_void: Result /= Void
		end

	new_prefix_free_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New prefix free feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			an_operator.compute (error_handler)
			if an_operator.computed and then an_operator.value.count > 0 then
				Result := ast_factory.new_prefix_free_name (a_prefix, an_operator)
			else
				-- TODO
			end
		ensure
			prefix_free_name_not_void: Result /= Void
		end

	new_prefix_minus_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_MINUS_NAME is
			-- New prefix "-" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_prefix_minus_name (a_prefix, an_operator)
		ensure
			prefix_minus_name_not_void: Result /= Void
		end

	new_prefix_not_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NOT_NAME is
			-- New prefix "not" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_prefix_not_name (a_prefix, an_operator)
		ensure
			prefix_not_name_not_void: Result /= Void
		end

	new_prefix_plus_name (a_prefix: ET_TOKEN; an_operator: ET_MANIFEST_STRING): ET_PREFIX_PLUS_NAME is
			-- New prefix "+" feature name
		require
			a_prefix_not_void: a_prefix /= Void
			an_operator_not_void: an_operator /= Void
		do
			Result := ast_factory.new_prefix_plus_name (a_prefix, an_operator)
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
			Result := ast_factory.new_qualified_bang_instruction (a_bangbang, a_target, a_dot, a_name, args)
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
			Result := ast_factory.new_qualified_call_expression (a_target, a_dot, a_name, args)
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
			Result := ast_factory.new_qualified_call_instruction (a_target, a_dot, a_name, args)
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
			Result := ast_factory.new_qualified_create_expression (a_create, l, a_type, r, a_dot, a_name, args)
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
			Result := ast_factory.new_qualified_create_instruction (a_create, a_target, a_dot, a_name, args)
		ensure
			qualified_create_instruction_not_void: Result /= Void
		end

	new_qualified_precursor_expression (l: ET_SYMBOL; a_parent: ET_IDENTIFIER;
		r: ET_SYMBOL; a_keyword: ET_TOKEN; args: ET_ACTUAL_ARGUMENTS): ET_QUALIFIED_PRECURSOR_EXPRESSION is
			-- New qualified precursor expression
		require
			l_not_void: l /= Void
			a_parent_not_void: a_parent /= Void
			r_not_void: r /= Void
			a_keyword_not_void: a_keyword /= Void
		do
			Result := ast_factory.new_qualified_precursor_expression (l, a_parent, r, a_keyword, args)
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
			Result := ast_factory.new_qualified_precursor_instruction (l, a_parent, r, a_keyword, args)
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
			Result := ast_factory.new_qualified_typed_bang_instruction (l, a_type, r, a_target, a_dot, a_name, args)
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
			Result := ast_factory.new_qualified_typed_create_instruction (a_create, l, a_type, r, a_target, a_dot, a_name, args)
		ensure
			qualified_typed_create_instruction_not_void: Result /= Void
		end

	new_rename (old_name: ET_FEATURE_NAME; an_as: ET_TOKEN; new_name: ET_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		require
			old_name_not_void: old_name /= Void
			an_as_not_void: an_as /= Void
			new_name_not_void: new_name /= Void
		do
			Result := ast_factory.new_rename (old_name, an_as, new_name)
		ensure
			rename_not_void: Result /= Void
		end

	new_rename_comma (old_name: ET_FEATURE_NAME; an_as: ET_TOKEN;
		new_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_RENAME is
			-- New rename pair followed by a comma
		require
			old_name_not_void: old_name /= Void
			an_as_not_void: an_as /= Void
			new_name_not_void: new_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_rename_comma (old_name, an_as, new_name, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_rename_comma (old_name, an_as, new_name, a_comma)
			else
				Result := ast_factory.new_rename (old_name, an_as, new_name)
			end
		ensure
			rename_comma_not_void: Result /= Void
		end

	new_renames (a_rename: ET_TOKEN): ET_RENAMES is
			-- New rename clause
		require
			a_rename_not_void: a_rename /= Void
		do
			Result := ast_factory.new_renames (a_rename)
		ensure
			renames_not_void: Result /= Void
		end

	new_renames_with_capacity (nb: INTEGER): ET_RENAMES is
			-- New rename clause with given capacity
		require
			nb_positive: nb >= 0
		local
			a_rename: ET_TOKEN
		do
			a_rename := tokens.rename_keyword
			Result := ast_factory.new_renames_with_capacity (a_rename, nb)
		ensure
			renames_not_void: Result /= Void
		end

	new_result_address (d: ET_SYMBOL; r: ET_RESULT): ET_RESULT_ADDRESS is
			-- New address of Result
		require
			d_not_void: d /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_result_address (d, r)
		ensure
			result_address_not_void: Result /= Void
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

	new_strip_expression (a_strip: ET_TOKEN; l: ET_SYMBOL; r: ET_SYMBOL): ET_STRIP_EXPRESSION is
			-- New strip expression
		require
			a_strip_not_void: a_strip /= Void
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			Result := ast_factory.new_strip_expression (a_strip, l, r)
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_strip_expression_with_capacity (nb: INTEGER): ET_STRIP_EXPRESSION is
			-- New strip expression with given capacity
		require
			nb_positive: nb >= 0
		local
			a_strip: ET_TOKEN
			l, r: ET_SYMBOL
		do
			a_strip := tokens.strip_keyword
			l := tokens.symbol
			r := tokens.symbol
			Result := ast_factory.new_strip_expression_with_capacity (a_strip, l, r, nb)
		ensure
			strip_expression_not_void: Result /= Void
		end

	new_synonym_feature (a_name: ET_FEATURE_NAME; a_feature: ET_FEATURE): ET_FEATURE is
			-- New synomym for feature `a_feature'
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			Result := a_feature.synonym (a_name)
		ensure
			synonym_not_void: Result /= Void
		end

	new_tag (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_TAG is
			-- New tag
		require
			a_name_not_void: a_name /= Void
			a_colon_not_void: a_colon /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			elseif keep_all_comments and a_colon.has_comment then
				Result := ast_factory.new_identifier_colon (a_name, a_colon)
			else
				Result := a_name
			end
		ensure
			tag_not_void: Result /= Void
		end

	new_tagged_assertion (a_tag: ET_TAG): ET_TAGGED_ASSERTION is
			-- New tagged assertion
		require
			a_tag_not_void: a_tag /= Void
		do
			Result := ast_factory.new_tagged_assertion (a_tag)
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
			Result := ast_factory.new_tagged_expression_variant (a_variant, a_tag, a_colon, an_expression)
		ensure
			tagged_expression_variant_not_void: Result /= Void
		end

	new_type_comma (a_type: ET_TYPE; a_comma: ET_SYMBOL): ET_TYPE_ITEM is
			-- New type-comma
		require
			a_type_not_void: a_type /= Void
			a_comma_not_void: a_comma /= Void
		do
			if keep_all_breaks then
				Result := ast_factory.new_type_comma (a_type, a_comma)
			elseif keep_all_comments and a_comma.has_comment then
				Result := ast_factory.new_type_comma (a_type, a_comma)
			else
				Result := a_type
			end
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
			Result := ast_factory.new_typed_bang_instruction (l, a_type, r, a_target)
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
			Result := ast_factory.new_typed_create_instruction (a_create, l, a_type, r, a_target)
		ensure
			typed_create_instruction_not_void: Result /= Void
		end

	new_unique_attribute (a_name: ET_FEATURE_NAME; args: ET_FORMAL_ARGUMENTS;
		a_type: ET_TYPE): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration
		require
			a_name_not_void: a_name /= Void
			a_type_not_void: a_type /= Void
			last_clients_not_void: last_clients /= Void
			has_last_class: has_last_class
		do
			Result := universe.new_unique_attribute (a_name, a_type, last_clients, last_class)
		ensure
			unique_attribute_not_void: Result /= Void
		end

	new_variant (a_variant: ET_TOKEN): ET_VARIANT is
			-- New empty loop variant
		require
			a_variant_not_void: a_variant /= Void
		do
			Result := ast_factory.new_variant (a_variant)
		ensure
			variant_not_void: Result /= Void
		end

	new_when_part (a_when: ET_TOKEN; a_choices: ET_CHOICE_LIST;
		a_then_compound: ET_COMPOUND): ET_WHEN_PART is
			-- New when part
		require
			a_when_not_void: a_when /= Void
			a_then_compound_not_void: a_then_compound /= Void
		do
			Result := ast_factory.new_when_part (a_when, a_choices, a_then_compound)
		ensure
			when_part_not_void: Result /= Void
		end

	new_when_part_list (a_when_part: ET_WHEN_PART): ET_WHEN_PART_LIST is
			-- New when part list
		require
			a_when_part_not_void: a_when_part /= Void
		do
			Result := ast_factory.new_when_part_list (a_when_part)
		ensure
			when_part_list_not_void: Result /= Void
		end

	new_when_part_list_with_capacity (a_when_part: ET_WHEN_PART; nb: INTEGER): ET_WHEN_PART_LIST is
			-- New when part list with given capacity
		require
			a_when_part_not_void: a_when_part /= Void
			nb_positive: nb >= 1
		do
			Result := ast_factory.new_when_part_list_with_capacity (a_when_part, nb)
		ensure
			when_part_list_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_handler.report_syntax_error (current_position)
			if has_last_class then
				last_class.set_syntax_error (True)
			end
		end

feature {NONE} -- Access

	last_clients: ET_CLASS_NAME_LIST
			-- Last clients read

	last_class: ET_CLASS is
			-- Class being parsed
		require
			has_last_class: has_last_class
		do
			Result := class_stack.item
		ensure
			last_class_not_void: Result /= Void
		end

	has_last_class: BOOLEAN is
			-- Is there a `last_class' available?
		do
			Result := not class_stack.is_empty
		ensure
			definition: Result = not class_stack.is_empty
		end

	add_last_class (a_class: ET_CLASS) is
			-- Add `a_class' to `class_stack'.
		require
			a_class_not_void: a_class /= Void
		do
			class_stack.force (a_class)
		ensure
			one_more: class_stack.count = old class_stack.count + 1
			has_last_class: has_last_class
			added: last_class = a_class
		end

	remove_last_class is
			-- Remove `last_class' from `class_stack'.
		require
			has_last_class: has_last_class
		do
			class_stack.remove
		ensure
			one_less: class_stack.count = old class_stack.count - 1
		end

	class_stack: DS_ARRAYED_STACK [ET_CLASS]
			-- Stack of classes being parsed

feature {NONE} -- Counters

	counters: DS_ARRAYED_STACK [INTEGER]
			-- Counters currently in use by the parser
			-- to build lists of AST nodes

	counter_value: INTEGER is
			-- Value of the last counter registered
		require
			counters_not_empty: not counters.is_empty
		do
			Result := counters.item
		ensure
			value_positive: Result >= 0
		end

	add_counter is
			-- Register a new counter.
		do
			counters.force (0)
		ensure
			one_more: counters.count = old counters.count + 1
			value_zero: counter_value = 0
		end

	remove_counter is
			-- Unregister last registered counter.
		require
			counters_not_empty: not counters.is_empty
		do
			counters.remove
		ensure
			one_less: counters.count = old counters.count - 1
		end

	increment_counter is
			-- Increment `counter_value'.
		require
			counters_not_empty: not counters.is_empty
		local
			a_value: INTEGER
		do
			a_value := counters.item
			counters.replace (a_value + 1)
		ensure
			same_counters_count: counters.count = old counters.count
			one_more: counter_value = old counter_value + 1
		end

feature {NONE} -- Constants

	Initial_counters_capacity: INTEGER is 10
			-- Initial capacity for `counters'

	Initial_class_stack_capacity: INTEGER is 1
			-- Initial capacity for `class_stack'

	assertions: DS_ARRAYED_LIST [ET_ASSERTION_ITEM]
			-- List of assertions currently being parsed

	Initial_assertions_capacity: INTEGER is 20
			-- Initial capacity for `assertions'

	dummy_clients: ET_CLIENTS is
			-- Dummy client clause
		local
			a_left: ET_SYMBOL
			a_right: ET_SYMBOL
		once
			a_left := tokens.symbol
			a_right := tokens.symbol
			!ET_NONE_CLIENTS! Result.make (a_left, a_right)
		ensure
			dummy_clients_not_void: Result /= Void
		end

invariant

	universe_not_void: universe /= Void
	counters_not_void: counters /= Void
	class_stack_not_void: class_stack /= Void
	no_void_class: not class_stack.has (Void)
	assertions_not_void: assertions /= Void
	no_void_assertions: not assertions.has (Void)

end
