indexing

	description:

		"C code generators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_C_GENERATOR

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_processor
		redefine
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bit_constant,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_constant_attribute,
			process_convert_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_current,
			process_current_address,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_equality_expression,
			process_expression_address,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_instruction,
			process_loop_instruction,
			process_manifest_array,
			process_manifest_tuple,
			process_manifest_type,
			process_old_expression,
			process_once_function,
			process_once_function_inline_agent,
			process_once_manifest_string,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesized_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_result,
			process_result_address,
			process_retry_instruction,
			process_semicolon_symbol,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_true_constant,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_verbatim_string,
			process_void
		end

	ET_TOKEN_CODES
		export {NONE} all end

	UT_SHARED_TEMPLATE_EXPANDER
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UT_IMPORTED_FORMATTERS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system: like current_system) is
			-- Create a new C code generator.
		local
			l_buffer: STRING
		do
			make_processor (a_system.universe)
			short_names := True
			split_mode := True
			split_threshold := default_split_threshold
			system_name := "unknown"
			create type_checker.make (universe)
			current_system := a_system
			current_file := null_output_stream
			header_file := null_output_stream
			current_type := a_system.none_type
			current_feature := dummy_feature
			create internal_dynamic_type_sets.make_with_capacity (1000)
			current_dynamic_type_sets := internal_dynamic_type_sets
			create l_buffer.make (1024)
			create current_function_header_buffer.make (l_buffer)
			create l_buffer.make (100000)
			create current_function_body_buffer.make (l_buffer)
			create temp_variables.make (40)
			create used_temp_variables.make (40)
			create free_temp_variables.make (40)
			create frozen_temp_variables.make (40)
			create conforming_types.make_with_capacity (100)
			create conforming_type_set.make (current_system.none_type)
			create non_conforming_types.make_with_capacity (100)
			create operand_stack.make (5000)
			create call_operands.make (5000)
			create attachment_dynamic_type_ids.make (100)
			create target_dynamic_type_ids.make (100)
			create target_dynamic_types.make_map (100)
			create standalone_type_sets.make_with_capacity (50)
			create deep_twin_types.make (100)
			create deep_equal_types.make (100)
			create deep_feature_target_type_sets.make_map (100)
			create current_agents.make (20)
			create agent_open_operands.make (20)
			create agent_closed_operands.make (20)
			agent_target := tokens.current_keyword
			create agent_arguments.make_with_capacity (100)
			create agent_instruction.make (Void, current_feature.static_feature.name, Void)
			create agent_expression.make (Void, current_feature.static_feature.name, Void)
			create wrapper_expression.make (Void, current_feature.static_feature.name, Void)
			create agent_tuple_item_expressions.make (20)
			create agent_manifest_tuple.make_with_capacity (20)
			create formal_arguments.make (20)
			create manifest_array_types.make (100)
			create manifest_tuple_types.make (100)
			create once_features.make (10000)
			create constant_features.make_map (10000)
			create inline_constants.make (10000)
			create dynamic_type_id_set_names.make_map (10000)
			dynamic_type_id_set_names.set_key_equality_tester (string_equality_tester)
			create called_features.make (1000)
			create included_header_filenames.make (100)
			included_header_filenames.set_equality_tester (string_equality_tester)
			create included_runtime_header_files.make (100)
			included_runtime_header_files.set_key_equality_tester (string_equality_tester)
			create included_runtime_c_files.make (100)
			included_runtime_c_files.set_equality_tester (string_equality_tester)
			create c_filenames.make_map (100)
			c_filenames.set_key_equality_tester (string_equality_tester)
			make_external_regexps
		end

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	short_names: BOOLEAN
			-- Should short names be generated for type and feature names?

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when generating `current_system'?

feature -- Measurement

	never_void_target_count: INTEGER
			-- Number of calls whose target is guaranteed to be non-Void at compilation time

	can_be_void_target_count: INTEGER
			-- Number of calls for which it was not possible to guarantee at compilation
			-- time whether its target would never be Void

feature -- Compilation options

	console_application_mode: BOOLEAN is
			-- Should the generated application be a console application
			-- (or a Windows GUI application)?
		do
			Result := universe.console_application_mode
		end

	finalize_mode: BOOLEAN
			-- Compilation with optimizations turned on?

	split_mode: BOOLEAN
			-- Should generated C code be split over several C files
			-- instead of being held in a single possibly large C file?
			-- When in split mode, the next C construct will be generated
			-- in a new C file if the current C file is already larger
			-- than `split_threshold' bytes.

	split_threshold: INTEGER
			-- When in split mode, the next C construct will be generated
			-- in a new C file if the current C file is already larger
			-- than `split_threshold' bytes.

	trace_mode: BOOLEAN is
			-- Should the generated application be compiled with trace turned on?
		do
			Result := universe.trace_mode
		end

	use_boehm_gc: BOOLEAN
			-- Should the application be compiled with the Boehm GC?

feature -- Compilation options setting

	set_finalize_mode (b: BOOLEAN) is
			-- Set `finalize_mode' to `b'.
		do
			finalize_mode := b
		ensure
			finalize_mode_set: finalize_mode = b
		end

	set_split_mode (b: BOOLEAN) is
			-- Set `split_mode' to `b'.
		do
			split_mode := b
		ensure
			split_mode_set: split_mode = b
		end

	set_split_threshold (v: INTEGER) is
			-- Set `split_threshold' to `v'.
		require
			v_positive: v > 0
		do
			split_threshold := v
		ensure
			split_threshold_set: split_threshold = v
		end

	set_use_boehm_gc (b: BOOLEAN) is
			-- Set `use_boehm_gc' to `b'.
		do
			use_boehm_gc := b
		ensure
			use_boehm_gc_set: use_boehm_gc = b
		end

feature -- Generation

	generate (a_system_name: STRING) is
			-- Generate C code and C compilation script file for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_system_name_not_void: a_system_name /= Void
		do
			has_fatal_error := False
			generate_c_code (a_system_name)
			generate_compilation_script (a_system_name)
			c_filenames.wipe_out
		end

feature {NONE} -- Compilation script generation

	generate_compilation_script (a_system_name: STRING) is
			-- Generate C compilation script file for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_system_name_not_void: a_system_name /= Void
		local
			l_c_config: DS_HASH_TABLE [STRING, STRING]
			l_obj_filenames: STRING
			l_variables: DS_HASH_TABLE [STRING, STRING]
			l_file: KL_TEXT_OUTPUT_FILE
			l_command: KL_SHELL_COMMAND
			l_command_name: STRING
			l_cc_template: STRING
			l_link_template: STRING
			l_filename: STRING
			l_script_filename: STRING
			l_base_name: STRING
			i, nb: INTEGER
			l_obj: STRING
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_replacement: STRING
			l_external_include_pathnames: DS_ARRAYED_LIST [STRING]
			l_external_library_pathnames: DS_ARRAYED_LIST [STRING]
			l_external_object_pathnames: DS_ARRAYED_LIST [STRING]
			l_includes: STRING
			l_libs: STRING
			l_pathname: STRING
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			l_base_name := a_system_name
			l_c_config := c_config
			l_variables := l_c_config.twin
			create l_regexp.make
			l_regexp.compile ("\$\(([^)]+)\)")
			create l_includes.make (256)
			l_external_include_pathnames := universe.external_include_pathnames
			nb := l_external_include_pathnames.count
			from i := 1 until i > nb loop
				l_pathname := l_external_include_pathnames.item (i)
				l_regexp.match (l_pathname)
				l_replacement := STRING_.new_empty_string (l_pathname, 6)
				l_replacement.append_string ("${\1\}")
				l_pathname := Execution_environment.interpreted_string (l_regexp.replace_all (l_replacement))
				if i /= 1 then
					l_includes.append_character (' ')
				end
				l_includes.append_string ("-I")
				l_includes.append_string (l_pathname)
				i := i + 1
			end
			l_variables.force (l_includes, "includes")
			create l_libs.make (256)
			l_external_library_pathnames := universe.external_library_pathnames
			nb := l_external_library_pathnames.count
			from i := 1 until i > nb loop
				l_pathname := l_external_library_pathnames.item (i)
				l_regexp.match (l_pathname)
				l_replacement := STRING_.new_empty_string (l_pathname, 6)
				l_replacement.append_string ("${\1\}")
				l_pathname := Execution_environment.interpreted_string (l_regexp.replace_all (l_replacement))
				if i /= 1 then
					l_libs.append_character (' ')
				end
				l_libs.append_string (l_pathname)
				i := i + 1
			end
			l_variables.force (l_libs, "libs")
			l_variables.force (l_base_name + l_c_config.item ("exe"), "exe")
			create l_obj_filenames.make (100)
			l_obj := l_c_config.item ("obj")
			l_cursor := c_filenames.new_cursor
			from l_cursor.start until l_cursor.after loop
				if not l_cursor.is_first then
					l_obj_filenames.append_character (' ')
				end
				l_filename := l_cursor.key
				l_obj_filenames.append_string (l_filename)
				l_obj_filenames.append_string (l_obj)
				l_cursor.forth
			end
			l_external_object_pathnames := universe.external_object_pathnames
			nb := l_external_object_pathnames.count
			from i := 1 until i > nb loop
				l_pathname := l_external_object_pathnames.item (i)
				l_regexp.match (l_pathname)
				l_replacement := STRING_.new_empty_string (l_pathname, 6)
				l_replacement.append_string ("${\1\}")
				l_pathname := Execution_environment.interpreted_string (l_regexp.replace_all (l_replacement))
				l_obj_filenames.append_character (' ')
				l_obj_filenames.append_string (l_pathname)
				i := i + 1
			end
			l_variables.force (l_obj_filenames, "objs")
			if operating_system.is_windows then
				l_script_filename := l_base_name + bat_file_extension
			else
				l_script_filename := l_base_name + sh_file_extension
			end
			create l_file.make (l_script_filename)
			l_file.open_write
			if l_file.is_open_write then
				if operating_system.is_windows then
					l_file.put_line ("@echo off")
				else
					l_file.put_line ("#!/bin/sh")
				end
					-- Compile files in reverse order so that it looks like
					-- a countdown since the filenames are numbered.
				l_cc_template := l_c_config.item ("cc")
				from l_cursor.finish until l_cursor.before loop
					l_filename := l_cursor.key + l_cursor.item
					l_variables.force (l_filename, "c")
					l_command_name := template_expander.expand_from_values (l_cc_template, l_variables)
					l_file.put_line (l_command_name)
					l_cursor.back
				end
				l_link_template := l_c_config.item ("link")
				l_command_name := template_expander.expand_from_values (l_link_template, l_variables)
				l_file.put_line (l_command_name)
				l_file.close
				if not operating_system.is_windows then
					create l_command.make ("chmod a+x " + l_script_filename)
					l_command.execute
				end
			else
				set_fatal_error
				report_cannot_write_error (l_script_filename)
			end
		end

	c_config: DS_HASH_TABLE [STRING, STRING] is
			-- C compiler configuration
		local
			l_name: STRING
			l_filename: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_default: BOOLEAN
			l_c_config_parser: UT_CONFIG_PARSER
			l_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			l_name := Execution_environment.variable_value ("GOBO_CC")
			if l_name = Void then
				l_filename := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "config", "c", "default.cfg">>)
				l_filename := Execution_environment.interpreted_string (l_filename)
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					l_file.read_line
					if not l_file.end_of_file then
						l_name := STRING_.cloned_string (l_file.last_string)
						STRING_.left_adjust (l_name)
						STRING_.right_adjust (l_name)
					end
					l_file.close
				end
			end
			if l_name = Void then
				l_default := True
				if operating_system.is_windows then
					l_name := "msc"
				else
					l_name := "gcc"
				end
			end
			create Result.make_map (10)
			Result.set_key_equality_tester (string_equality_tester)
				-- Put some platform-dependent default values.
			if operating_system.is_windows then
				Result.put ("cl -nologo $cflags $includes -c $c", "cc")
				Result.put ("link -nologo $lflags -subsystem:console -out:$exe $objs $libs", "link")
				Result.put (".obj", "obj")
				Result.put (".exe", "exe")
				Result.put ("", "cflags")
				Result.put ("", "lflags")
			else
				Result.put ("gcc $cflags $includes -c $c", "cc")
				Result.put ("gcc $lflags -o $exe $objs $libs", "link")
				Result.put (".o", "obj")
				Result.put ("", "exe")
				Result.put ("", "cflags")
				Result.put ("", "lflags")
			end
			l_filename := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "config", "c", l_name>>)
			l_filename := Execution_environment.interpreted_string (l_filename)
			if not file_system.has_extension (l_filename, cfg_file_extension) then
				l_filename := l_filename + cfg_file_extension
			end
			create l_file.make (l_filename)
			l_file.open_read
			if l_file.is_open_read then
				create l_c_config_parser.make (error_handler)
				if not finalize_mode then
					l_c_config_parser.define_value ("True", "EIF_WORKBENCH")
				end
				if use_boehm_gc then
					l_c_config_parser.define_value ("True", "EIF_BOEHM_GC")
				end
				if console_application_mode then
					l_c_config_parser.define_value ("True", "EIF_CONSOLE")
				end
				l_c_config_parser.parse_file (l_file)
				l_file.close
				if l_c_config_parser.has_error then
					set_fatal_error
				else
					l_cursor := l_c_config_parser.config_values.new_cursor
					from l_cursor.start until l_cursor.after loop
						Result.force (l_cursor.item, l_cursor.key)
						l_cursor.forth
					end
				end
			elseif not l_default then
				set_fatal_error
				report_cannot_read_error (l_filename)
			end
		ensure
			c_config_not_void: Result /= Void
			no_void_variables: not Result.has_item (Void)
			cc_defined: Result.has ("cc")
			link_defined: Result.has ("link")
			exe_defined: Result.has ("exe")
			obj_defined: Result.has ("obj")
		end

feature {NONE} -- C code Generation

	generate_c_code (a_system_name: STRING) is
			-- Generate C code for `current_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_system_name_not_void: a_system_name /= Void
		local
			old_system_name: STRING
			old_file: KI_TEXT_OUTPUT_STREAM
			old_header_file: KI_TEXT_OUTPUT_STREAM
			l_header_filename: STRING
			l_header_file: KL_TEXT_OUTPUT_FILE
			l_root_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			old_system_name := system_name
			system_name := a_system_name
			l_header_filename := a_system_name + h_file_extension
			create l_header_file.make (l_header_filename)
			l_header_file.open_write
			if not l_header_file.is_open_write then
				set_fatal_error
				report_cannot_write_error (l_header_filename)
			else
				open_c_file
				open_cpp_file
				old_header_file := header_file
				header_file := l_header_file
				current_file := current_function_body_buffer
				generate_ids
				if trace_mode then
					header_file.put_string (c_define)
					header_file.put_character (' ')
					header_file.put_line (c_eif_trace)
					header_file.put_new_line
				end
				if use_boehm_gc then
					header_file.put_string (c_define)
					header_file.put_character (' ')
					header_file.put_line (c_eif_boehm_gc)
					header_file.put_new_line
				end
				include_runtime_header_file ("ge_eiffel.h", True, header_file)
				header_file.put_new_line
				include_runtime_header_file ("ge_arguments.h", True, header_file)
				header_file.put_new_line
				include_runtime_header_file ("ge_exception.h", True, header_file)
				header_file.put_new_line
				include_runtime_header_file ("ge_console.h", True, header_file)
				header_file.put_new_line
				include_runtime_header_file ("ge_main.h", True, header_file)
				header_file.put_new_line
				include_runtime_header_file ("ge_gc.h", True, header_file)
				header_file.put_new_line
				print_start_extern_c (header_file)
				print_types (header_file)
				flush_to_c_file
				header_file.put_new_line
				print_default_declarations
				current_file.put_new_line
				flush_to_c_file
				header_file.put_new_line
				print_manifest_string_function
				current_file.put_new_line
				flush_to_c_file
					-- Print polymorphic call functions.
				print_polymorphic_query_call_functions
				print_polymorphic_procedure_call_functions
					-- Print Eiffel feature functions.
				l_root_procedure := current_system.root_creation_procedure
				if l_root_procedure /= Void then
					l_root_procedure.set_generated (True)
					called_features.force_last (l_root_procedure)
					from until called_features.is_empty loop
						l_dynamic_feature := called_features.last
						called_features.remove_last
						print_feature (l_dynamic_feature)
					end
				end
					-- Print polymorphic call to Tuple label functions.
				print_polymorphic_tuple_label_call_functions
					-- Print features which build manifest arrays.
				from manifest_array_types.start until manifest_array_types.after loop
					print_manifest_array_function (manifest_array_types.item_for_iteration)
					current_file.put_new_line
					flush_to_c_file
					manifest_array_types.forth
				end
				manifest_array_types.wipe_out
					-- Print features which build manifest tuples.
				from manifest_tuple_types.start until manifest_tuple_types.after loop
					print_manifest_tuple_function (manifest_tuple_types.item_for_iteration)
					current_file.put_new_line
					flush_to_c_file
					manifest_tuple_types.forth
				end
				manifest_tuple_types.wipe_out
					-- Print all functions necessary to implement 'deep_twin'.
				print_deep_twin_functions
					-- Print constants declarations.
				print_constants_declaration
				current_file.put_new_line
				flush_to_c_file
				print_const_init_function
				current_file.put_new_line
				flush_to_c_file
					-- Print 'GE_dts' dynamic type id set constants.
				print_dynamic_type_id_set_constants
				flush_to_c_file
					-- Print 'GE_types' array.
				print_types_array
				current_file.put_new_line
				flush_to_c_file
					-- Print 'main' function.
				print_main_function
				current_file.put_new_line
				flush_to_c_file
				print_end_extern_c (header_file)
				header_file.put_new_line
					-- Include runtime C files.
				from included_runtime_c_files.start until included_runtime_c_files.after loop
					print_end_extern_c (current_file)
					include_runtime_c_file (included_runtime_c_files.item_for_iteration, current_file)
					print_start_extern_c (current_file)
					flush_to_c_file
					included_runtime_c_files.forth
				end
					-- Include runtime header files.
				header_file.put_new_line
				from included_runtime_header_files.start until included_runtime_header_files.after loop
					if not included_runtime_header_files.item_for_iteration then
						include_runtime_c_file (included_runtime_header_files.key_for_iteration, header_file)
					end
					included_runtime_header_files.forth
				end
					-- Include header files.
				from included_header_filenames.start until included_header_filenames.after loop
					header_file.put_string (c_include)
					header_file.put_character (' ')
					header_file.put_string (included_header_filenames.item_for_iteration)
					header_file.put_new_line
					included_header_filenames.forth
				end
				included_header_filenames.wipe_out
				included_runtime_header_files.wipe_out
				included_runtime_c_files.wipe_out
				once_features.wipe_out
				constant_features.wipe_out
				inline_constants.wipe_out
				dynamic_type_id_set_names.wipe_out
				l_header_file.close
				close_c_file
				close_cpp_file
				header_file := old_header_file
				current_file := old_file
				current_type := current_system.none_type
				current_feature := dummy_feature
				current_dynamic_type_sets := internal_dynamic_type_sets
			end
			system_name := old_system_name
		end

	generate_ids is
			-- Generate types and feature ids.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			l_precursor: ET_DYNAMIC_PRECURSOR
			j, nb2: INTEGER
			k, nb3: INTEGER
			l_count: INTEGER
			l_id: INTEGER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				l_count := l_count + 1
				l_type.set_id (l_count)
				if l_type.is_alive or l_type.has_static then
						-- Process dynamic queries.
					l_features := l_type.queries
					nb2 := l_features.count
					from j := 1 until j > nb2 loop
						l_feature := l_features.item (j)
						l_feature.set_id (j)
						l_precursor := l_feature.first_precursor
						if l_precursor /= Void then
							l_precursor.set_id (1)
							l_other_precursors := l_feature.other_precursors
							if l_other_precursors /= Void then
								nb3 := l_other_precursors.count
								from k := 2 until k > nb3 loop
									l_other_precursors.item (k).set_id (k)
									k := k + 1
								end
							end
						end
						j := j + 1
					end
						-- Process dynamic procedures.
					l_id := nb2 + 1
					l_features := l_type.procedures
					nb2 := l_features.count
					from j := 1 until j > nb2 loop
						l_feature := l_features.item (j)
						l_feature.set_id (l_id)
						l_precursor := l_feature.first_precursor
						if l_precursor /= Void then
							l_precursor.set_id (1)
							l_other_precursors := l_feature.other_precursors
							if l_other_precursors /= Void then
								nb3 := l_other_precursors.count
								from k := 2 until k > nb3 loop
									l_other_precursors.item (k).set_id (k)
									k := k + 1
								end
							end
						end
						l_id := l_id + 1
						j := j + 1
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Feature generation

	print_features (a_type: ET_DYNAMIC_TYPE) is
			-- Print features of `a_type' to `current_file' and its signature to `header_file'.
		require
			a_type_not_void: a_type /= Void
		local
			old_type: ET_DYNAMIC_TYPE
			l_features: ET_DYNAMIC_FEATURE_LIST
			i, nb: INTEGER
		do
			old_type := current_type
			current_type := a_type
			l_features := a_type.queries
			nb := l_features.count
			from i := 1 until i > nb loop
				print_feature (l_features.item (i))
				i := i + 1
			end
			l_features := a_type.procedures
			nb := l_features.count
			from i := 1 until i > nb loop
				print_feature (l_features.item (i))
				i := i + 1
			end
			current_type := old_type
		end

	print_feature (a_feature: ET_DYNAMIC_FEATURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
			-- Also print the precursors used in its body (calls to 'precursor').
		require
			a_feature_not_void: a_feature /= Void
		local
			old_type: ET_DYNAMIC_TYPE
			old_feature: ET_DYNAMIC_FEATURE
			old_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i: INTEGER
		do
			if not a_feature.is_semistrict (current_system) then
				old_type := current_type
				current_type := a_feature.target_type
				old_feature := current_feature
				current_feature := a_feature
				old_dynamic_type_sets := current_dynamic_type_sets
				current_dynamic_type_sets := current_feature.dynamic_type_sets
				a_feature.static_feature.process (Current)
					-- Print declaration of agents used in `a_feature'.
					-- Note that we compute `current_agents.count' at each iteration
					-- because inline agents may contain other inline agents
					-- which will be added to `agents' on the fly.
				from i := 1 until i > current_agents.count loop
					print_agent_declaration (i, current_agents.item (i))
					i := i + 1
				end
				current_agents.wipe_out
				current_dynamic_type_sets := old_dynamic_type_sets
				current_feature := old_feature
				current_type := old_type
			end
		end

	print_constants_declaration is
			-- Print declarations of constant attributes
			-- to `header_file' and `current_file'.
		local
			l_feature: ET_FEATURE
			l_type: ET_TYPE
			l_context: ET_TYPE_CONTEXT
			l_result_type: ET_DYNAMIC_TYPE
			l_constant: ET_INLINE_CONSTANT
		do
			from constant_features.start until constant_features.after loop
				l_feature := constant_features.key_for_iteration
				if not once_features.has (l_feature) then
					l_type := l_feature.type
					if l_type = Void then
							-- Internal feature: a constant attribute has a type.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- The deanchored form of the type of the constant feature
							-- should not contain any formal generic parameter (in fact
							-- it should be one of BOOLEAN, CHARACTER possibly sized,
							-- INTEGER possibly sized, NATURAL possible sized, REAL possibly
							-- sized, STRING possibly sized, or 'TYPE [X]' where X is a
							-- stand-alone type), therefore it is OK to use the class where
							-- this feature has been written as context.
						l_context := l_feature.implementation_class
						l_result_type := current_system.dynamic_type (l_type, l_context)
						header_file.put_string (c_extern)
						header_file.put_character (' ')
						print_type_declaration (l_result_type, header_file)
						print_type_declaration (l_result_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						print_once_value_name (l_feature, header_file)
						print_once_value_name (l_feature, current_file)
						header_file.put_character (';')
						current_file.put_character (';')
						header_file.put_new_line
						current_file.put_new_line
					end
				end
				constant_features.forth
			end
			from inline_constants.start until inline_constants.after loop
				l_constant := inline_constants.item_for_iteration
				header_file.put_string (c_extern)
				header_file.put_character (' ')
					-- Here we assume that all inline constants are
					-- in fact once manifest strings of type "STRING".
					-- This would need to be changed when introducing
					-- other kinds of inline constants with different types.
				print_type_declaration (current_system.string_type, header_file)
				print_type_declaration (current_system.string_type, current_file)
				header_file.put_character (' ')
				current_file.put_character (' ')
				print_inline_constant_name (l_constant, header_file)
				print_inline_constant_name (l_constant, current_file)
				header_file.put_character (';')
				current_file.put_character (';')
				header_file.put_new_line
				current_file.put_new_line
				inline_constants.forth
			end
		end

	print_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- Internal error: deferred features cannot be executed at run-time.
			set_fatal_error
			error_handler.report_giaaa_error
		end

	print_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- Internal error: deferred features cannot be executed at run-time.
			set_fatal_error
			error_handler.report_giaaa_error
		end

	print_do_function (a_feature: ET_DO_FUNCTION) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_function (a_feature)
		end

	print_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_procedure (a_feature)
		end

	print_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_external_routine (a_feature, False, False)
				end
				if current_feature.is_static then
					print_external_routine (a_feature, True, False)
				end
			end
		end

	print_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_external_routine (a_feature, False, False)
				end
				if current_feature.is_creation then
					print_external_routine (a_feature, False, True)
				end
				if current_feature.is_static then
					print_external_routine (a_feature, True, False)
				end
			end
		end

	print_external_routine (a_feature: ET_EXTERNAL_ROUTINE; a_static: BOOLEAN; a_creation: BOOLEAN) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			is_static: a_static implies current_feature.is_static
			is_creation: a_creation implies current_feature.is_creation
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type: ET_DYNAMIC_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: ET_IDENTIFIER
			i, nb_args: INTEGER
			l_language: ET_EXTERNAL_LANGUAGE
			l_language_value: ET_MANIFEST_STRING
			l_language_string: STRING
			l_signature_arguments: STRING
			l_signature_result: STRING
			l_comma: BOOLEAN
			l_alias: ET_EXTERNAL_ALIAS
			l_alias_value: ET_MANIFEST_STRING
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_struct_field_name: STRING
			l_struct_field_type: STRING
			l_struct_type: STRING
			old_file: KI_TEXT_OUTPUT_STREAM
			l_is_inline: BOOLEAN
			l_is_cpp: BOOLEAN
			l_cpp_class_type: STRING
			l_dll_file: STRING
		do
			old_file := current_file
			current_file := current_function_header_buffer
				-- Print signature to `header_file' and `current_file'.
			print_feature_name_comment (a_feature, current_type, header_file)
			print_feature_name_comment (a_feature, current_type, current_file)
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set /= Void then
				l_result_type := l_result_type_set.static_type
				print_type_declaration (l_result_type, header_file)
				print_type_declaration (l_result_type, current_file)
			elseif a_creation then
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
			else
				header_file.put_string (c_void)
				current_file.put_string (c_void)
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb_args := l_arguments.count
			end
			if a_static then
				print_static_routine_name (current_feature, current_type, header_file)
				print_static_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				if nb_args = 0 then
					header_file.put_string (c_void)
					current_file.put_string (c_void)
				end
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type, header_file)
				print_creation_procedure_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				if nb_args = 0 then
					header_file.put_string (c_void)
					current_file.put_string (c_void)
				end
			else
				print_routine_name (current_feature, current_type, header_file)
				print_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
				if current_type.is_expanded then
					header_file.put_character ('*')
					current_file.put_character ('*')
				end
				header_file.put_character (' ')
				current_file.put_character (' ')
				print_current_name (header_file)
				print_current_name (current_file)
				l_comma := True
			end
			if nb_args > 0 then
				from i := 1 until i > nb_args loop
					if l_comma then
						header_file.put_character (',')
						current_file.put_character (',')
						header_file.put_character (' ')
						current_file.put_character (' ')
					else
						l_comma := True
					end
					l_argument_type_set := current_feature.argument_type_set (i)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the formal
							-- arguments should have been computed at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_argument_type := l_argument_type_set.static_type
						print_type_declaration (l_argument_type, header_file)
						print_type_declaration (l_argument_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						l_name := l_arguments.formal_argument (i).name
						print_argument_name (l_name, header_file)
						print_argument_name (l_name, current_file)
						i := i + 1
					end
				end
			end
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
				-- Determine the kind of external.
			l_language := a_feature.language
			l_language_value := l_language.manifest_string
			l_language_string := l_language_value.value
			if external_c_inline_regexp.recognizes (l_language_string) then
				l_is_inline := True
			elseif external_cpp_inline_regexp.recognizes (l_language_string) then
				l_is_inline := True
				l_is_cpp := True
			end
			if not l_is_inline and l_result_type /= Void then
				print_indentation
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_entity_value (l_result_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
			print_feature_trace_message_call (True)
			if l_result_type_set /= Void and then l_result_type_set.is_empty then
-- TODO: build full dynamic type sets, recursively.
				print_feature_info_message_call ("Dynamic type set not built for external feature ")
					-- Put the body of the feature in a block so that there
					-- is no C compilation error if some variables are
					-- declared after this instruction above.
				print_indentation
				current_file.put_character ('{')
				current_file.put_new_line
			end
			if a_creation then
				print_malloc_current (a_feature)
			end
			if l_is_inline then
				if l_is_cpp then
						-- Regexp: C++ [blocking] inline [use {<include> "," ...}+]
						-- \3: include files
					if external_cpp_inline_regexp.match_count > 3 and then external_cpp_inline_regexp.captured_substring_count (3) > 0 then
						print_external_c_includes (external_cpp_inline_regexp.captured_substring (3))
					end
					print_external_c_inline_body (a_feature)
				else
						-- Regexp: C [blocking] inline [use {<include> "," ...}+]
						-- \3: include files
					if external_c_inline_regexp.match_count > 3 and then external_c_inline_regexp.captured_substring_count (3) > 0 then
						print_external_c_includes (external_c_inline_regexp.captured_substring (3))
					end
					print_external_c_inline_body (a_feature)
				end
			elseif a_feature.is_builtin then
				print_external_builtin_body (a_feature)
			elseif external_c_regexp.recognizes (l_language_string) then
					-- Regexp: C [blocking] [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
					-- \5: has signature arguments
					-- \6: signature arguments
					-- \11: signature result
					-- \18: include files
				if external_c_regexp.match_count > 18 and then external_c_regexp.captured_substring_count (18) > 0 then
					print_external_c_includes (external_c_regexp.captured_substring (18))
				end
				if external_c_regexp.match_count > 5 and then external_c_regexp.captured_substring_count (5) > 0 then
					l_signature_arguments := external_c_regexp.captured_substring (6)
				end
				if external_c_regexp.match_count > 11 and then external_c_regexp.captured_substring_count (11) > 0 then
					l_signature_result := external_c_regexp.captured_substring (11)
				end
				print_external_c_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_signature_arguments, l_signature_result, a_feature.alias_clause, False)
			elseif external_c_macro_regexp.recognizes (l_language_string) then
					-- Regexp: C [blocking] macro [signature ["(" {<type> "," ...}* ")"] [":" <type>]] use {<include> "," ...}+
					-- \4: has signature arguments
					-- \5: signature arguments
					-- \10: signature result
					-- \17: include files
				print_external_c_includes (external_c_macro_regexp.captured_substring (17))
				if external_c_macro_regexp.match_count > 4 and then external_c_macro_regexp.captured_substring_count (4) > 0 then
					l_signature_arguments := external_c_macro_regexp.captured_substring (5)
				end
				if external_c_macro_regexp.match_count > 10 and then external_c_macro_regexp.captured_substring_count (10) > 0 then
					l_signature_result := external_c_macro_regexp.captured_substring (10)
				end
				print_external_c_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_signature_arguments, l_signature_result, a_feature.alias_clause, True)
			elseif external_c_struct_regexp.recognizes (l_language_string) then
					-- Regexp: C struct <struct-type> (access|get) <field-name> [type <field-type>] use {<include> "," ...}+
					-- \1: struct type
					-- \6: field name
					-- \9: field type
					-- \16: include files
				print_external_c_includes (external_c_struct_regexp.captured_substring (16))
				l_struct_type := external_c_struct_regexp.captured_substring (1)
				l_struct_field_name := external_c_struct_regexp.captured_substring (6)
				if external_c_struct_regexp.match_count > 9 and then external_c_struct_regexp.captured_substring_count (9) > 0 then
					l_struct_field_type := external_c_struct_regexp.captured_substring (9)
				end
				print_external_c_struct_body (l_arguments, l_result_type_set, l_struct_type, l_struct_field_name, l_struct_field_type)
			elseif old_external_c_regexp.recognizes (l_language_string) then
					-- Regexp: C ["(" {<type> "," ...}* ")" [":" <type>]] ["|" {<include> "," ...}+]
					-- \1: has signature
					-- \2: signature arguments
					-- \4: signature result
					-- \6: include files
				if old_external_c_regexp.match_count > 6 and then old_external_c_regexp.captured_substring_count (6) > 0 then
					print_external_c_includes (old_external_c_regexp.captured_substring (6))
				end
				if old_external_c_regexp.match_count > 1 and then old_external_c_regexp.captured_substring_count (1) > 0 then
					l_signature_arguments := old_external_c_regexp.captured_substring (2)
					if old_external_c_regexp.match_count > 4 and then old_external_c_regexp.captured_substring_count (4) > 0 then
						l_signature_result := old_external_c_regexp.captured_substring (4)
					end
				end
				print_external_c_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_signature_arguments, l_signature_result, a_feature.alias_clause, False)
			elseif old_external_c_macro_regexp.recognizes (l_language_string) then
					-- Regexp: C "[" macro <include> "]" ["(" {<type> "," ...}* ")"] [":" <type>]
					-- \1: include file
					-- \2: has signature arguments
					-- \3: signature arguments
					-- \5: signature result
				print_external_c_includes (old_external_c_macro_regexp.captured_substring (1))
				if old_external_c_macro_regexp.match_count > 2 and then old_external_c_macro_regexp.captured_substring_count (2) > 0 then
					l_signature_arguments := old_external_c_macro_regexp.captured_substring (3)
					if old_external_c_macro_regexp.match_count > 5 and then old_external_c_macro_regexp.captured_substring_count (5) > 0 then
						l_signature_result := old_external_c_macro_regexp.captured_substring (5)
					end
				end
				print_external_c_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_signature_arguments, l_signature_result, a_feature.alias_clause, True)
			elseif old_external_c_struct_regexp.recognizes (l_language_string) then
					-- Regexp: C "[" struct <include> "]" "(" {<type> "," ...}+ ")" [":" <type>]
					-- \1: include file
					-- \2: signature arguments
					-- \4: signature result
				print_external_c_includes (old_external_c_struct_regexp.captured_substring (1))
				l_signature_arguments := old_external_c_struct_regexp.captured_substring (2)
				if old_external_c_struct_regexp.match_count > 4 and then old_external_c_struct_regexp.captured_substring_count (4) > 0 then
					l_signature_result := old_external_c_struct_regexp.captured_substring (4)
				end
				l_alias := a_feature.alias_clause
				if l_alias /= Void then
					l_alias_value := l_alias.manifest_string
					l_struct_field_name := l_alias_value.value
				else
					l_struct_field_name := a_feature.implementation_feature.lower_name
				end
				create l_splitter.make_with_separators (",")
				l_list := l_splitter.split (l_signature_arguments)
				inspect l_list.count
				when 1 then
					l_struct_type := l_list.item (1)
					l_struct_field_type := l_signature_result
					print_external_c_struct_body (l_arguments, l_result_type_set, l_struct_type, l_struct_field_name, l_struct_field_type)
				when 2 then
					l_struct_type := l_list.item (1)
					l_struct_field_type := l_list.item (2)
					print_external_c_struct_body (l_arguments, l_result_type_set, l_struct_type, l_struct_field_name, l_struct_field_type)
				else
-- TODO: syntax error
				end
			elseif external_cpp_regexp.recognizes (l_language_string) then
					-- Regexp: C [blocking] <class_type> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
					-- \2: class type
					-- \5: has signature arguments
					-- \6: signature arguments
					-- \11: signature result
					-- \18: include files
				l_is_cpp := True
				if external_cpp_regexp.match_count > 18 and then external_cpp_regexp.captured_substring_count (18) > 0 then
					print_external_c_includes (external_cpp_regexp.captured_substring (18))
				end
				l_cpp_class_type := external_cpp_regexp.captured_substring (2)
				if external_cpp_regexp.match_count > 5 and then external_cpp_regexp.captured_substring_count (5) > 0 then
					l_signature_arguments := external_cpp_regexp.captured_substring (6)
				end
				if external_cpp_regexp.match_count > 11 and then external_cpp_regexp.captured_substring_count (11) > 0 then
					l_signature_result := external_cpp_regexp.captured_substring (11)
				end
				print_external_cpp_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_cpp_class_type, l_signature_arguments, l_signature_result, a_feature.alias_clause)
			elseif external_dllwin_regexp.recognizes (l_language_string) then
					-- Regexp: [blocking] dllwin <dll_file> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
					-- \2: dll file
					-- \5: has signature arguments
					-- \6: signature arguments
					-- \11: signature result
					-- \18: include files
				if external_dllwin_regexp.match_count > 18 and then external_dllwin_regexp.captured_substring_count (18) > 0 then
					print_external_c_includes (external_dllwin_regexp.captured_substring (18))
				end
				l_dll_file := external_dllwin_regexp.captured_substring (2)
				if external_dllwin_regexp.match_count > 5 and then external_dllwin_regexp.captured_substring_count (5) > 0 then
					l_signature_arguments := external_dllwin_regexp.captured_substring (6)
				end
				if external_dllwin_regexp.match_count > 11 and then external_dllwin_regexp.captured_substring_count (11) > 0 then
					l_signature_result := external_dllwin_regexp.captured_substring (11)
				end
				print_external_dllwin_body (a_feature.implementation_feature.name, l_arguments, l_result_type_set, l_dll_file, l_signature_arguments, l_signature_result, a_feature.alias_clause)
			else
print ("**** language not recognized: " + l_language_string + "%N")
			end
			if not l_is_inline and l_result_type /= Void then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			elseif a_creation then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			if l_result_type_set /= Void and then l_result_type_set.is_empty then
-- TODO: build full dynamic type sets, recursively.
					-- Close the block containing the body of the feature.
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
			print_feature_trace_message_call (False)
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			if l_is_cpp then
				flush_to_cpp_file
			else
				flush_to_c_file
			end
			reset_temp_variables
		end

	print_external_builtin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
		do
			if a_feature.is_function then
				print_external_builtin_function_body (a_feature)
			else
				print_external_builtin_procedure_body (a_feature)
			end
		end

	print_external_builtin_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				print_external_builtin_any_function_body (a_feature)
			when builtin_arguments_class then
				print_external_builtin_arguments_function_body (a_feature)
			when builtin_boolean_class then
				print_external_builtin_boolean_function_body (a_feature)
			when builtin_function_class then
				print_external_builtin_function_function_body (a_feature)
			when builtin_identified_class then
				print_external_builtin_identified_function_body (a_feature)
			when builtin_platform_class then
				print_external_builtin_platform_function_body (a_feature)
			when builtin_pointer_class then
				print_external_builtin_pointer_function_body (a_feature)
			when builtin_character_8_class then
				print_external_builtin_sized_character_function_body (a_feature, current_system.character_8_type)
			when builtin_character_32_class then
				print_external_builtin_sized_character_function_body (a_feature, current_system.character_32_type)
			when builtin_integer_8_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.integer_8_type)
			when builtin_integer_16_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.integer_16_type)
			when builtin_integer_32_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.integer_32_type)
			when builtin_integer_64_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.integer_64_type)
			when builtin_natural_8_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.natural_8_type)
			when builtin_natural_16_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.natural_16_type)
			when builtin_natural_32_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.natural_32_type)
			when builtin_natural_64_class then
				print_external_builtin_sized_integer_function_body (a_feature, current_system.natural_64_type)
			when builtin_real_32_class then
				print_external_builtin_sized_real_function_body (a_feature, current_system.real_32_type)
			when builtin_real_64_class then
				print_external_builtin_sized_real_function_body (a_feature, current_system.real_64_type)
			when builtin_special_class then
				print_external_builtin_special_function_body (a_feature)
			when builtin_tuple_class then
				print_external_builtin_tuple_function_body (a_feature)
			when builtin_type_class then
				print_external_builtin_type_function_body (a_feature)
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_any_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "ANY".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_conforms_to then
				print_builtin_any_conforms_to_body (a_feature)
			when builtin_any_deep_twin then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_any_deep_twin_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_any_generating_type then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_any_generating_type_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_any_generating_type2 then
				print_builtin_any_generating_type2_body (a_feature)
			when builtin_any_generator then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_any_generator_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_any_is_deep_equal then
				print_builtin_any_is_deep_equal_body (a_feature)
			when builtin_any_same_type then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_any_same_type_call (current_feature, current_type, False)
				print_semicolon_newline
			when builtin_any_standard_is_equal then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_any_standard_is_equal_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_any_standard_twin then
				print_builtin_any_standard_twin_body (a_feature)
				call_operands.wipe_out
			when builtin_any_tagged_out then
				print_builtin_any_tagged_out_body (a_feature)
			when builtin_any_twin then
				print_builtin_any_twin_body (a_feature)
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_arguments_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "ARGUMENTS".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_arguments: (a_feature.builtin_code // builtin_capacity) = builtin_arguments_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_arguments_argument then
				print_builtin_arguments_argument_body (a_feature)
			when builtin_arguments_argument_count then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_arguments_argument_count_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_boolean_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "BOOLEAN" and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_and then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_boolean_and_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_boolean_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_boolean_item_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_boolean_not then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_boolean_not_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_boolean_or then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_boolean_or_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_boolean_xor then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_boolean_xor_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_function_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "FUNCTION".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_function: (a_feature.builtin_code // builtin_capacity) = builtin_function_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_function_item then
				fill_call_formal_arguments (a_feature)
				print_indentation
				print_builtin_function_item_call (current_feature, current_type, False)
				current_file.put_new_line
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_identified_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "IDENTIFIED" and relates classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_id_object then
				fill_call_formal_arguments (a_feature)
				print_indentation
				print_builtin_identified_eif_id_object_call (current_feature, current_type, False)
				current_file.put_new_line
				call_operands.wipe_out
			when builtin_identified_eif_object_id then
				fill_call_formal_arguments (a_feature)
				print_indentation
				print_builtin_identified_eif_object_id_call (current_feature, current_type, False)
				current_file.put_new_line
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_platform_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "PLATFORM".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_platform: (a_feature.builtin_code // builtin_capacity) = builtin_platform_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_platform_boolean_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_boolean_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_character_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_character_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_integer_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_integer_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_is_dotnet then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_is_dotnet_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_is_thread_capable then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_is_thread_capable_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_is_unix then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_is_unix_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_is_vms then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_is_vms_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_is_windows then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_is_windows_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_pointer_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_pointer_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_real_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_real_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_platform_wide_character_bytes then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_platform_wide_character_bytes_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_pointer_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "POINTER" and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_hash_code then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_pointer_hash_code_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_pointer_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_pointer_item_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_pointer_out then
				print_builtin_pointer_out_body (a_feature)
			when builtin_pointer_plus then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_pointer_plus_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_pointer_to_integer_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_pointer_to_integer_32_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_character_function_body (a_feature: ET_EXTERNAL_ROUTINE; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in sized character type `a_character_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			a_character_type_not_void: a_character_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_code then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_character_code_call (current_feature, current_type, False, a_character_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_character_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_character_item_call (current_feature, current_type, False, a_character_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_character_natural_32_code then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_character_natural_32_code_call (current_feature, current_type, False, a_character_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_character_to_character_8 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_character_to_character_8_call (current_feature, current_type, False, a_character_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_character_to_character_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_character_to_character_32_call (current_feature, current_type, False, a_character_type)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_integer_function_body (a_feature: ET_EXTERNAL_ROUTINE; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in sized integer type `an_integer_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			an_integer_type_not_void: an_integer_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_as_integer_8 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_integer_8_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_integer_16 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_integer_16_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_integer_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_integer_32_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_integer_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_integer_64_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_natural_8 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_natural_8_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_natural_16 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_natural_16_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_natural_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_natural_32_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_as_natural_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_as_natural_64_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_and then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_and_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_not then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_not_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_or then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_or_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_shift_left then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_shift_left_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_shift_right then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_shift_right_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_bit_xor then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_bit_xor_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_div then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_div_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_divide then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_divide_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_identity then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_identity_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_item_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_lt then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_lt_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_minus then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_minus_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_mod then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_mod_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_opposite then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_opposite_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_plus then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_plus_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_power then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_power_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_times then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_times_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_character_8 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_character_8_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_character_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_character_32_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_double then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_double_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_real then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_real_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_real_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_real_32_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_integer_to_real_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_integer_to_real_64_call (current_feature, current_type, False, an_integer_type)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_real_function_body (a_feature: ET_EXTERNAL_ROUTINE; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in sized real type `a_real_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			a_real_type_not_void: a_real_type /= Void
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_ceiling_real_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_ceiling_real_32_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_ceiling_real_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_ceiling_real_64_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_divide then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_divide_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_floor_real_32 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_floor_real_32_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_floor_real_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_floor_real_64_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_identity then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_identity_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_item_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_lt then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_lt_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_minus then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_minus_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_opposite then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_opposite_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_out then
				print_builtin_sized_real_out_body (a_feature, a_real_type)
			when builtin_real_plus then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_plus_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_power then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_power_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_times then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_times_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_to_double then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_to_double_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_truncated_to_integer then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_truncated_to_integer_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_truncated_to_integer_64 then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_truncated_to_integer_64_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_real_truncated_to_real then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_sized_real_truncated_to_real_call (current_feature, current_type, False, a_real_type)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_special_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "SPECIAL".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_aliased_resized_area then
				print_builtin_special_aliased_resized_area_body (a_feature)
			when builtin_special_count then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_special_count_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_special_element_size then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_special_element_size_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_special_item then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_special_item_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_tuple_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "TUPLE".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_tuple: (a_feature.builtin_code // builtin_capacity) = builtin_tuple_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_tuple_boolean_item then
				print_builtin_tuple_boolean_item_body (a_feature)
			when builtin_tuple_character_8_item then
				print_builtin_tuple_character_8_item_body (a_feature)
			when builtin_tuple_character_32_item then
				print_builtin_tuple_character_32_item_body (a_feature)
			when builtin_tuple_count then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_tuple_count_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_tuple_integer_8_item then
				print_builtin_tuple_integer_8_item_body (a_feature)
			when builtin_tuple_integer_16_item then
				print_builtin_tuple_integer_16_item_body (a_feature)
			when builtin_tuple_integer_32_item then
				print_builtin_tuple_integer_32_item_body (a_feature)
			when builtin_tuple_integer_64_item then
				print_builtin_tuple_integer_64_item_body (a_feature)
			when builtin_tuple_item_code then
				print_builtin_tuple_item_code_body (a_feature)
			when builtin_tuple_natural_8_item then
				print_builtin_tuple_natural_8_item_body (a_feature)
			when builtin_tuple_natural_16_item then
				print_builtin_tuple_natural_16_item_body (a_feature)
			when builtin_tuple_natural_32_item then
				print_builtin_tuple_natural_32_item_body (a_feature)
			when builtin_tuple_natural_64_item then
				print_builtin_tuple_natural_64_item_body (a_feature)
			when builtin_tuple_object_comparison then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_tuple_object_comparison_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_tuple_pointer_item then
				print_builtin_tuple_pointer_item_body (a_feature)
			when builtin_tuple_real_32_item then
				print_builtin_tuple_real_32_item_body (a_feature)
			when builtin_tuple_real_64_item then
				print_builtin_tuple_real_64_item_body (a_feature)
			when builtin_tuple_reference_item then
				print_builtin_tuple_reference_item_body (a_feature)
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_type_function_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in function introduced in class "TYPE".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_function: a_feature.is_function
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_type: (a_feature.builtin_code // builtin_capacity) = builtin_type_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_type_generating_type then
				print_builtin_type_generating_type_body (a_feature)
			when builtin_type_name then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_type_name_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			when builtin_type_type_id then
				fill_call_formal_arguments (a_feature)
				print_indentation_assign_to_result
				print_builtin_type_type_id_call (current_feature, current_type, False)
				print_semicolon_newline
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				print_external_builtin_any_procedure_body (a_feature)
			when builtin_boolean_class then
				print_external_builtin_boolean_procedure_body (a_feature)
			when builtin_identified_class then
				print_external_builtin_identified_procedure_body (a_feature)
			when builtin_pointer_class then
				print_external_builtin_pointer_procedure_body (a_feature)
			when builtin_procedure_class then
				print_external_builtin_procedure_procedure_body (a_feature)
			when builtin_character_8_class then
				print_external_builtin_sized_character_procedure_body (a_feature, current_system.character_8_type)
			when builtin_character_32_class then
				print_external_builtin_sized_character_procedure_body (a_feature, current_system.character_32_type)
			when builtin_integer_8_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.integer_8_type)
			when builtin_integer_16_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.integer_16_type)
			when builtin_integer_32_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.integer_32_type)
			when builtin_integer_64_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.integer_64_type)
			when builtin_natural_8_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.natural_8_type)
			when builtin_natural_16_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.natural_16_type)
			when builtin_natural_32_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.natural_32_type)
			when builtin_natural_64_class then
				print_external_builtin_sized_integer_procedure_body (a_feature, current_system.natural_64_type)
			when builtin_real_32_class then
				print_external_builtin_sized_real_procedure_body (a_feature, current_system.real_32_type)
			when builtin_real_64_class then
				print_external_builtin_sized_real_procedure_body (a_feature, current_system.real_64_type)
			when builtin_special_class then
				print_external_builtin_special_procedure_body (a_feature)
			when builtin_tuple_class then
				print_external_builtin_tuple_procedure_body (a_feature)
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_any_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "ANY".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_copy then
				fill_call_formal_arguments (a_feature)
				print_builtin_any_copy_call (current_feature, current_type, False)
				call_operands.wipe_out
			when builtin_any_standard_copy then
				fill_call_formal_arguments (a_feature)
				print_builtin_any_standard_copy_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_boolean_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "BOOLEAN" and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_set_item then
				fill_call_formal_arguments (a_feature)
				print_builtin_boolean_set_item_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_identified_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "IDENTIFIED" and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_object_id_free then
				fill_call_formal_arguments (a_feature)
				print_builtin_identified_eif_object_id_free_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_pointer_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "POINTER" and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_set_item then
				fill_call_formal_arguments (a_feature)
				print_builtin_pointer_set_item_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_procedure_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "PROCEDURE".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_procedure: (a_feature.builtin_code // builtin_capacity) = builtin_procedure_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_procedure_call then
				fill_call_formal_arguments (a_feature)
				print_builtin_procedure_call_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_character_procedure_body (a_feature: ET_EXTERNAL_ROUTINE; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized character type `a_character_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			a_character_type_not_void: a_character_type /= Void
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_set_item then
				fill_call_formal_arguments (a_feature)
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_character_set_item_call (current_feature, current_type, False, a_character_type, l_builtin_class)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_integer_procedure_body (a_feature: ET_EXTERNAL_ROUTINE; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized integer type `an_integer_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			an_integer_type_not_void: an_integer_type /= Void
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_set_item then
				fill_call_formal_arguments (a_feature)
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_integer_set_item_call (current_feature, current_type, False, an_integer_type, l_builtin_class)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_sized_real_procedure_body (a_feature: ET_EXTERNAL_ROUTINE; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in sized real type `a_real_type' and related classes.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			valid_feature: current_feature.static_feature = a_feature
			a_real_type_not_void: a_real_type /= Void
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_set_item then
				fill_call_formal_arguments (a_feature)
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_real_set_item_call (current_feature, current_type, False, a_real_type, l_builtin_class)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_special_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "SPECIAL".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_make then
				-- Do nothing: already done in `print_malloc_current'.
			when builtin_special_put then
				fill_call_formal_arguments (a_feature)
				print_builtin_special_put_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_builtin_tuple_procedure_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of built-in feature `a_feature'.
			-- `a_feature' is a built-in procedure introduced in class "TUPLE".
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_procedure: a_feature.is_procedure
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_tuple: (a_feature.builtin_code // builtin_capacity) = builtin_tuple_class
			valid_feature: current_feature.static_feature = a_feature
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_tuple_put_boolean then
				print_builtin_tuple_put_boolean_body (a_feature)
			when builtin_tuple_put_character_8 then
				print_builtin_tuple_put_character_8_body (a_feature)
			when builtin_tuple_put_character_32 then
				print_builtin_tuple_put_character_32_body (a_feature)
			when builtin_tuple_put_integer_8 then
				print_builtin_tuple_put_integer_8_body (a_feature)
			when builtin_tuple_put_integer_16 then
				print_builtin_tuple_put_integer_16_body (a_feature)
			when builtin_tuple_put_integer_32 then
				print_builtin_tuple_put_integer_32_body (a_feature)
			when builtin_tuple_put_integer_64 then
				print_builtin_tuple_put_integer_64_body (a_feature)
			when builtin_tuple_put_natural_8 then
				print_builtin_tuple_put_natural_8_body (a_feature)
			when builtin_tuple_put_natural_16 then
				print_builtin_tuple_put_natural_16_body (a_feature)
			when builtin_tuple_put_natural_32 then
				print_builtin_tuple_put_natural_32_body (a_feature)
			when builtin_tuple_put_natural_64 then
				print_builtin_tuple_put_natural_64_body (a_feature)
			when builtin_tuple_put_pointer then
				print_builtin_tuple_put_pointer_body (a_feature)
			when builtin_tuple_put_real_32 then
				print_builtin_tuple_put_real_32_body (a_feature)
			when builtin_tuple_put_real_64 then
				print_builtin_tuple_put_real_64_body (a_feature)
			when builtin_tuple_put_reference then
				print_builtin_tuple_put_reference_body (a_feature)
			when builtin_tuple_set_object_comparison then
				fill_call_formal_arguments (a_feature)
				print_builtin_tuple_set_object_comparison_call (current_feature, current_type, False)
				call_operands.wipe_out
			else
					-- Internal error: unknown built-in feature.
					-- This error should already have been reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	print_external_c_body (a_feature_name: ET_FEATURE_NAME;
		a_arguments: ET_FORMAL_ARGUMENT_LIST; a_result_type_set: ET_DYNAMIC_TYPE_SET;
		a_signature_arguments, a_signature_result: STRING;
		a_alias: ET_EXTERNAL_ALIAS; is_macro: BOOLEAN) is
			-- Print body of external C function to `current_file'.
			-- If `a_feature_name' is Void then the name of the C function will be found in the alias.
			-- `a_signature_arguments' and `a_signature_result', if not Void,
			-- are the signature types declared in the Language part.
			-- `a_result_type_set' is not Void if the external feature is a query.
		require
			name_not_void: a_feature_name /= Void or else a_alias /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_boolean_result: BOOLEAN
			l_alias_value: ET_MANIFEST_STRING
			i, nb_args: INTEGER
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_name: ET_IDENTIFIER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_actual_parameter: ET_DYNAMIC_TYPE
		do
			print_indentation
			if a_result_type_set /= Void then
				l_result_type := a_result_type_set.static_type
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (')')
				if l_result_type = current_system.boolean_type then
						-- Convert C boolean value to Eiffel boolean value.
					l_boolean_result := True
					current_file.put_string (c_eif_test)
					current_file.put_character ('(')
				end
				if a_signature_result /= Void then
					current_file.put_character ('(')
					current_file.put_string (a_signature_result)
					current_file.put_character (')')
				end
			end
			if a_alias /= Void then
				l_alias_value := a_alias.manifest_string
				current_file.put_string (l_alias_value.value)
			else
				current_file.put_string (a_feature_name.lower_name)
			end
			if a_arguments /= Void and then not a_arguments.is_empty then
				nb_args := a_arguments.count
				current_file.put_character ('(')
				if a_signature_arguments /= Void then
					create l_splitter.make_with_separators (",")
					l_list := l_splitter.split (a_signature_arguments)
					if l_list.count /= nb_args then
-- TODO: error
					end
					l_cursor := l_list.new_cursor
					l_cursor.start
					from i := 1 until i > nb_args loop
						if i /= 1 then
							current_file.put_character (',')
						end
						if not l_cursor.after then
							current_file.put_character ('(')
							current_file.put_string (l_cursor.item)
							current_file.put_character (')')
							l_cursor.forth
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := current_feature.argument_type_set (i)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal
								-- arguments should have been computed at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				else
					from i := 1 until i > nb_args loop
						if i /= 1 then
							current_file.put_character (',')
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := current_feature.argument_type_set (i)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal arguments
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type = current_system.pointer_type then
								-- When compiling with C++, MSVC++ does not want to convert
								-- 'void*' to non-'void*' implicitly.
							current_file.put_string ("(char*)")
							print_argument_name (l_name, current_file)
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				end
				current_file.put_character (')')
			elseif not is_macro then
				current_file.put_character ('(')
				current_file.put_character (')')
			end
			if l_boolean_result then
				current_file.put_character (')')
			end
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_external_c_struct_body (a_arguments: ET_FORMAL_ARGUMENT_LIST; a_result_type_set: ET_DYNAMIC_TYPE_SET;
		a_struct_type, a_field_name, a_field_type: STRING) is
			-- Print body of external C struct to `current_file'.
			-- `a_result_type_set' is not Void if the external feature is a query.
		require
			a_struct_type_not_void: a_struct_type /= Void
			a_field_name_not_void: a_field_name /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_field_name: STRING
			l_name: ET_IDENTIFIER
			nb_args: INTEGER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_actual_parameter: ET_DYNAMIC_TYPE
		do
			if a_result_type_set /= Void then
				l_result_type := a_result_type_set.static_type
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_type_cast (l_result_type, current_file)
				if l_result_type = current_system.boolean_type then
						-- Convert C boolean value to Eiffel boolean value.
					current_file.put_string (c_eif_test)
				end
				current_file.put_character ('(')
			end
			l_field_name := a_field_name
			if not l_field_name.is_empty then
				inspect l_field_name.item (1)
				when '@' then
					l_field_name := STRING_.cloned_string (l_field_name)
					l_field_name.remove_head (1)
				when '&' then
					l_field_name := STRING_.cloned_string (l_field_name)
					l_field_name.remove_head (1)
					current_file.put_character ('&')
				else
				end
			end
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (a_struct_type)
			current_file.put_character ('*')
			current_file.put_character (')')
			if a_arguments /= Void then
				nb_args := a_arguments.count
				if nb_args >= 1 then
					l_name := a_arguments.formal_argument (1).name
					l_argument_type_set := dynamic_type_set (l_name)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the formal
							-- arguments should have been computed at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
							-- The argument is declared of type 'TYPED_POINTER [XX]'.
							-- In that case we use the corresponding pointer (i.e.
							-- the first attribute of the object).
						l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
						if l_actual_parameters = Void or else l_actual_parameters.is_empty then
								-- Internal error: TYPED_POINTER [XX] has one generic parameter.
								-- This should have been checked already.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
							current_file.put_character ('(')
							print_type_declaration (l_actual_parameter, current_file)
							if l_actual_parameter.is_expanded then
								current_file.put_character ('*')
							end
							current_file.put_character (')')
							current_file.put_character ('(')
							print_argument_name (l_name, current_file)
							current_file.put_character ('.')
							current_file.put_character ('a')
							current_file.put_character ('1')
							current_file.put_character (')')
						end
					else
						print_argument_name (l_name, current_file)
					end
				end
			else
-- TODO: error
			end
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_string (l_field_name)
			current_file.put_character (')')
			if l_result_type = Void then
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if a_field_type /= Void then
					current_file.put_character ('(')
					current_file.put_string (a_field_type)
					current_file.put_character (')')
				end
				if nb_args >= 2 then
					l_name := a_arguments.formal_argument (2).name
					l_argument_type_set := dynamic_type_set (l_name)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the formal
							-- arguments should have been computed at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
							-- The argument is declared of type 'TYPED_POINTER [XX]'.
							-- In that case we use the corresponding pointer (i.e.
							-- the first attribute of the object).
						l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
						if l_actual_parameters = Void or else l_actual_parameters.is_empty then
								-- Internal error: TYPED_POINTER [XX] has one generic parameter.
								-- This should have been checked already.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
							current_file.put_character ('(')
							print_type_declaration (l_actual_parameter, current_file)
							if l_actual_parameter.is_expanded then
								current_file.put_character ('*')
							end
							current_file.put_character (')')
							current_file.put_character ('(')
							print_argument_name (l_name, current_file)
							current_file.put_character ('.')
							current_file.put_character ('a')
							current_file.put_character ('1')
							current_file.put_character (')')
						end
					else
						print_argument_name (l_name, current_file)
					end
				else
-- TODO: error
				end
			end
			if l_result_type /= Void then
				current_file.put_character (')')
			end
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_external_c_inline_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of external "C inline" `a_feature' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_alias: ET_EXTERNAL_ALIAS
			l_alias_value: ET_MANIFEST_STRING
			l_c_code: STRING
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument_name: ET_IDENTIFIER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_actual_parameter: ET_DYNAMIC_TYPE
			l_name: STRING
			i, j, nb: INTEGER
			i2, nb2: INTEGER
			i3, nb3: INTEGER
			l_max: INTEGER
			l_max_index: INTEGER
			l_semicolon_needed: BOOLEAN
			c, c3: CHARACTER
		do
			l_alias := a_feature.alias_clause
			if l_alias /= Void then
				l_alias_value := l_alias.manifest_string
				l_c_code := l_alias_value.value
				if a_feature.is_procedure then
						-- Check if it looks like legacy code: a C statement
						-- with no terminating semicolon.
					from
						i := l_c_code.count
					until
						i < 1
					loop
						inspect l_c_code.item (i)
						when ' ', '%N', '%R', '%T' then
							i := i - 1
						when ';' then
								-- This is a terminating semicolon.
							i := 0
						else
								-- There is no terminating semicolon.
							l_semicolon_needed := True
							i := 0
						end
					end
				elseif not l_c_code.has_substring (c_return) then
						-- This looks like legacy code.
						-- With ECMA we need to write the 'return' keyword in the alias clause.
					current_file.put_string (c_return)
					current_file.put_character (' ')
					l_semicolon_needed := True
				end
				l_formal_arguments := a_feature.arguments
				if l_formal_arguments /= Void then
					nb := l_c_code.count
					from i := 1 until i > nb loop
						c := l_c_code.item (i)
						if c = '$' then
							i := i + 1
							if i <= nb then
								c := l_c_code.item (i)
								inspect c
								when '$' then
									current_file.put_character ('$')
									i := i + 1
								when 'a'..'z', 'A'..'Z' then
									l_max := 0
									l_max_index := 0
									nb2 := l_formal_arguments.count
									from i2 := 1 until i2 > nb2 loop
										l_name := l_formal_arguments.formal_argument (i2).name.name
										nb3 := l_name.count
										if nb3 > l_max then
											from
												i3 := 1
												j := i
											until
												j > nb or
												i3 > nb3
											loop
												c := l_c_code.item (j)
												c3 := l_name.item (i3)
												if CHARACTER_.as_lower (c3) = CHARACTER_.as_lower (c) then
													i3 := i3 + 1
													j := j + 1
												else
													j := nb + 1
												end
											end
											if i3 > nb3 then
												l_max_index := i2
												l_max := nb3
											end
										end
										i2 := i2 + 1
									end
									if l_max_index /= 0 then
										l_argument_name := l_formal_arguments.formal_argument (l_max_index).name
										l_argument_type_set := current_feature.argument_type_set (l_max_index)
										if l_argument_type_set = Void then
												-- Internal error: the dynamic type set of the formal
												-- arguments should have been computed at this stage.
											set_fatal_error
											error_handler.report_giaaa_error
										elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
												-- The argument is declared of type 'TYPED_POINTER [XX]'.
												-- In that case we use the corresponding pointer (i.e.
												-- the first attribute of the object).
											l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
											if l_actual_parameters = Void or else l_actual_parameters.is_empty then
													-- Internal error: TYPED_POINTER [XX] has one generic parameter.
													-- This should have been checked already.
												set_fatal_error
												error_handler.report_giaaa_error
											else
												l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
												current_file.put_character ('(')
												print_type_declaration (l_actual_parameter, current_file)
												if l_actual_parameter.is_expanded then
													current_file.put_character ('*')
												end
												current_file.put_character (')')
												current_file.put_character ('(')
												print_argument_name (l_argument_name, current_file)
												current_file.put_character ('.')
												current_file.put_character ('a')
												current_file.put_character ('1')
												current_file.put_character (')')
											end
										else
											print_argument_name (l_argument_name, current_file)
										end
										i := i + l_max
									else
										current_file.put_character ('$')
										current_file.put_character (l_c_code.item (i))
										i := i + 1
									end
								else
									current_file.put_character ('$')
									current_file.put_character (c)
									i := i + 1
								end
							else
								current_file.put_character ('$')
							end
						else
							current_file.put_character (c)
							i := i + 1
						end
					end
				else
					current_file.put_string (l_c_code)
				end
				if l_semicolon_needed then
					current_file.put_character (';')
				end
				current_file.put_new_line
			end
		end

	print_external_c_includes (a_include_filenames: STRING) is
			-- Print C includes declarations to `header_file'.
			-- `a_incluse_filenames' are the filenames (with the
			-- < > or " " characters included) separated by
			-- commas.
		require
			a_include_filenames_not_void: a_include_filenames /= Void
		local
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_include_filename: STRING
		do
			create l_splitter.make_with_separators (",")
			l_list := l_splitter.split (a_include_filenames)
			l_cursor := l_list.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_include_filename := l_cursor.item
				STRING_.left_adjust (l_include_filename)
				STRING_.right_adjust (l_include_filename)
				include_header_filename (l_include_filename, header_file)
				l_cursor.forth
			end
		end

	print_external_cpp_body (a_feature_name: ET_FEATURE_NAME;
		a_arguments: ET_FORMAL_ARGUMENT_LIST; a_result_type_set: ET_DYNAMIC_TYPE_SET;
		a_cpp_class_type, a_signature_arguments, a_signature_result: STRING; a_alias: ET_EXTERNAL_ALIAS) is
			-- Print body of external C++ function to `current_file'.
			-- If `a_feature_name' is Void then the name of the C++ function will be found in the alias.
			-- `a_cpp_class_type' is the name of the C++ class type.
			-- `a_signature_arguments' and `a_signature_result', if not Void,
			-- are the signature types declared in the Language part.
			-- `a_result_type_set' is not Void if the external feature is a query.
		require
			name_not_void: a_feature_name /= Void or else a_alias /= Void
			a_cpp_class_type_not_void: a_cpp_class_type /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_boolean_result: BOOLEAN
			l_alias_value: ET_MANIFEST_STRING
			i, nb_args: INTEGER
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_name: ET_IDENTIFIER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_actual_parameter: ET_DYNAMIC_TYPE
		do
			print_indentation
			if a_result_type_set /= Void then
				l_result_type := a_result_type_set.static_type
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (')')
				if l_result_type = current_system.boolean_type then
						-- Convert C boolean value to Eiffel boolean value.
					l_boolean_result := True
					current_file.put_string (c_eif_test)
					current_file.put_character ('(')
				end
				if a_signature_result /= Void then
					current_file.put_character ('(')
					current_file.put_string (a_signature_result)
					current_file.put_character (')')
				end
			end
			if a_arguments = Void or else a_arguments.is_empty then
-- TODO: error
			else
				nb_args := a_arguments.count
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (a_cpp_class_type)
				current_file.put_character ('*')
				current_file.put_character (')')
				l_name := a_arguments.formal_argument (1).name
				l_argument_type_set := dynamic_type_set (l_name)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the formal
						-- arguments should have been computed at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
						-- The argument is declared of type 'TYPED_POINTER [XX]'.
						-- In that case we use the corresponding pointer (i.e.
						-- the first attribute of the object).
					l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
					if l_actual_parameters = Void or else l_actual_parameters.is_empty then
							-- Internal error: TYPED_POINTER [XX] has one generic parameter.
							-- This should have been checked already.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
						current_file.put_character ('(')
						print_type_declaration (l_actual_parameter, current_file)
						if l_actual_parameter.is_expanded then
							current_file.put_character ('*')
						end
						current_file.put_character (')')
						current_file.put_character ('(')
						print_argument_name (l_name, current_file)
						current_file.put_character ('.')
						current_file.put_character ('a')
						current_file.put_character ('1')
						current_file.put_character (')')
					end
				else
					print_argument_name (l_name, current_file)
				end
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				if a_alias /= Void then
					l_alias_value := a_alias.manifest_string
					current_file.put_string (l_alias_value.value)
				else
					current_file.put_string (a_feature_name.lower_name)
				end
				current_file.put_character ('(')
				if a_signature_arguments /= Void then
					create l_splitter.make_with_separators (",")
					l_list := l_splitter.split (a_signature_arguments)
					if l_list.count /= nb_args - 1 then
-- TODO: error
					end
					l_cursor := l_list.new_cursor
					l_cursor.start
					from i := 2 until i > nb_args loop
						if i /= 2 then
							current_file.put_character (',')
						end
						if not l_cursor.after then
							current_file.put_character ('(')
							current_file.put_string (l_cursor.item)
							current_file.put_character (')')
							l_cursor.forth
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := dynamic_type_set (l_name)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal
								-- arguments should have been computed at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				else
					from i := 2 until i > nb_args loop
						if i /= 2 then
							current_file.put_character (',')
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := dynamic_type_set (l_name)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal arguments
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type = current_system.pointer_type then
								-- When compiling with C++, MSVC++ does not want to convert
								-- 'void*' to non-'void*' implicitly.
							current_file.put_string ("(char*)")
							print_argument_name (l_name, current_file)
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				end
				current_file.put_character (')')
			end
			if l_boolean_result then
				current_file.put_character (')')
			end
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_external_dllwin_body (a_feature_name: ET_FEATURE_NAME;
		a_arguments: ET_FORMAL_ARGUMENT_LIST; a_result_type_set: ET_DYNAMIC_TYPE_SET;
		a_dll_file: STRING; a_signature_arguments, a_signature_result: STRING;
		a_alias: ET_EXTERNAL_ALIAS) is
			-- Print body of external dllwin function to `current_file'.
			-- If `a_feature_name' is Void then the name of the C function in the DLL will be found in the alias.
			-- `a_dll_file' is the name of the DLL file.
			-- `a_signature_arguments' and `a_signature_result', if not Void,
			-- are the signature types declared in the Language part.
			-- `a_result_type_set' is not Void if the external feature is a query.
		require
			name_not_void: a_feature_name /= Void or else a_alias /= Void
			a_dll_file_not_void: a_dll_file /= Void
		local
			l_result_type: ET_DYNAMIC_TYPE
			l_boolean_result: BOOLEAN
			l_alias_value: ET_MANIFEST_STRING
			i, nb_args: INTEGER
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_name: ET_IDENTIFIER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_actual_parameter: ET_DYNAMIC_TYPE
			l_function_name: STRING
		do
			include_runtime_header_file ("ge_exception.h", False, header_file)
			include_runtime_header_file ("ge_dll.h", False, header_file)
			print_indentation
			current_file.put_line ("static char done = 0;")
			print_indentation
			current_file.put_line ("static EIF_POINTER fp = NULL;")
			print_indentation
			current_file.put_line ("if (!done) {")
			indent
			print_indentation
			current_file.put_line ("HMODULE a_result;")
			print_indentation
			current_file.put_string ("a_result = GE_load_dll(")
			if a_dll_file.is_empty or else a_dll_file.item (1) /= '%"' then
				current_file.put_character ('%"')
				current_file.put_string (a_dll_file)
				current_file.put_character ('%"')
			else
				current_file.put_string (a_dll_file)
			end
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
			print_indentation
			current_file.put_line ("if (a_result == NULL) {")
			indent
			indent
			print_indentation
			current_file.put_string ("/* Cannot load library ")
			current_file.put_string (a_dll_file)
			current_file.put_line (" */")
			dedent
			print_indentation
			current_file.put_line ("GE_raise(24);")
			dedent
			print_indentation
			current_file.put_character ('}')
			current_file.put_new_line
			print_indentation
			current_file.put_string ("fp = (EIF_POINTER)GetProcAddress(a_result,%"")
			if a_alias /= Void then
				l_alias_value := a_alias.manifest_string
				l_function_name := l_alias_value.value
			else
				l_function_name := a_feature_name.lower_name
			end
			current_file.put_string (l_function_name)
			current_file.put_line ("%");")
			print_indentation
			current_file.put_line ("if (fp == NULL) {")
			indent
			indent
			print_indentation
			current_file.put_string ("/* Cannot find entry point of ")
			current_file.put_string (l_function_name)
			current_file.put_line (" */")
			dedent
			print_indentation
			current_file.put_line ("GE_raise(24);")
			dedent
			print_indentation
			current_file.put_character ('}')
			current_file.put_new_line
			print_indentation
			current_file.put_line ("done = (char) 1;")
			dedent
			print_indentation
			current_file.put_character ('}')
			current_file.put_new_line
			print_indentation
			if a_result_type_set /= Void then
				l_result_type := a_result_type_set.static_type
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (')')
				if l_result_type = current_system.boolean_type then
						-- Convert C boolean value to Eiffel boolean value.
					l_boolean_result := True
					current_file.put_string (c_eif_test)
					current_file.put_character ('(')
				end
				if a_signature_result /= Void then
					current_file.put_character ('(')
					current_file.put_string (a_signature_result)
					current_file.put_character (')')
				end
			end
			current_file.put_character ('(')
			current_file.put_character ('(')
			if l_result_type /= Void then
				if a_signature_result /= Void then
					current_file.put_string (a_signature_result)
				else
					print_type_declaration (l_result_type, current_file)
				end
			else
				current_file.put_string (c_void)
			end
			current_file.put_string (" (__stdcall *) ")
			current_file.put_character ('(')
			if a_arguments /= Void and then not a_arguments.is_empty then
				nb_args := a_arguments.count
				if a_signature_arguments /= Void then
					current_file.put_string (a_signature_arguments)
				else
					from i := 1 until i > nb_args loop
						if i /= 1 then
							current_file.put_character (',')
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := current_feature.argument_type_set (i)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal arguments
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type = current_system.pointer_type then
								-- When compiling with C++, MSVC++ does not want to convert
								-- 'void*' to non-'void*' implicitly.
							current_file.put_string ("char*")
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
							end
						else
							print_type_declaration (l_argument_type_set.static_type, current_file)
						end
						i := i + 1
					end
				end
			end
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string ("fp")
			current_file.put_character (')')
			if nb_args > 0 then
				current_file.put_character ('(')
				if a_signature_arguments /= Void then
					create l_splitter.make_with_separators (",")
					l_list := l_splitter.split (a_signature_arguments)
					if l_list.count /= nb_args then
-- TODO: error
					end
					l_cursor := l_list.new_cursor
					l_cursor.start
					from i := 1 until i > nb_args loop
						if i /= 1 then
							current_file.put_character (',')
						end
						if not l_cursor.after then
							current_file.put_character ('(')
							current_file.put_string (l_cursor.item)
							current_file.put_character (')')
							l_cursor.forth
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := current_feature.argument_type_set (i)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal
								-- arguments should have been computed at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				else
					from i := 1 until i > nb_args loop
						if i /= 1 then
							current_file.put_character (',')
						end
						l_name := a_arguments.formal_argument (i).name
						l_argument_type_set := current_feature.argument_type_set (i)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the formal arguments
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_argument_type_set.static_type = current_system.pointer_type then
								-- When compiling with C++, MSVC++ does not want to convert
								-- 'void*' to non-'void*' implicitly.
							current_file.put_string ("(char*)")
							print_argument_name (l_name, current_file)
						elseif l_argument_type_set.static_type.base_class = universe.typed_pointer_class then
								-- The argument is declared of type 'TYPED_POINTER [XX]'.
								-- In that case we use the corresponding pointer (i.e.
								-- the first attribute of the object).
							l_actual_parameters := l_argument_type_set.static_type.base_type.actual_parameters
							if l_actual_parameters = Void or else l_actual_parameters.is_empty then
									-- Internal error: TYPED_POINTER [XX] has one generic parameter.
									-- This should have been checked already.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_actual_parameter := current_system.dynamic_type (l_actual_parameters.type (1), universe.any_type)
								current_file.put_character ('(')
								print_type_declaration (l_actual_parameter, current_file)
								if l_actual_parameter.is_expanded then
									current_file.put_character ('*')
								end
								current_file.put_character (')')
								current_file.put_character ('(')
								print_argument_name (l_name, current_file)
								current_file.put_character ('.')
								current_file.put_character ('a')
								current_file.put_character ('1')
								current_file.put_character (')')
							end
						else
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				end
				current_file.put_character (')')
			else
				current_file.put_character ('(')
				current_file.put_character (')')
			end
			if l_boolean_result then
				current_file.put_character (')')
			end
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_internal_function (a_feature: ET_INTERNAL_FUNCTION) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_internal_routine (a_feature, False, False)
				end
				if current_feature.is_static then
					print_internal_routine (a_feature, True, False)
				end
			end
		end

	print_internal_procedure (a_feature: ET_INTERNAL_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_internal_routine (a_feature, False, False)
				end
				if current_feature.is_creation then
					print_internal_routine (a_feature, False, True)
				end
				if current_feature.is_static then
					print_internal_routine (a_feature, True, False)
				end
			end
		end

	print_internal_routine (a_feature: ET_INTERNAL_ROUTINE; a_static: BOOLEAN; a_creation: BOOLEAN) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			is_static: a_static implies current_feature.is_static
			is_creation: a_creation implies current_feature.is_creation
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type: ET_DYNAMIC_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local_type_set: ET_DYNAMIC_TYPE_SET
			l_local_type: ET_DYNAMIC_TYPE
			l_once_feature: ET_FEATURE
			i, nb, nb_args: INTEGER
			l_compound: ET_COMPOUND
			l_rescue: ET_COMPOUND
			l_comma: BOOLEAN
			old_file: KI_TEXT_OUTPUT_STREAM
			l_name: ET_IDENTIFIER
		do
			old_file := current_file
			current_file := current_function_header_buffer
			print_feature_name_comment (a_feature, current_type, header_file)
			print_feature_name_comment (a_feature, current_type, current_file)
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set /= Void then
				l_result_type := l_result_type_set.static_type
			end
			if a_feature.is_once then
					-- This is a once-feature. Print the boolean status variable
					-- for this once, and its computed value variable for queries,
					-- to `header_file' and `current_file' if not already done.
				l_once_feature := a_feature.implementation_feature
				if not once_features.has (l_once_feature) then
					once_features.force_last (l_once_feature)
					header_file.put_string (c_extern)
					header_file.put_character (' ')
					header_file.put_string (c_unsigned)
					current_file.put_string (c_unsigned)
					header_file.put_character (' ')
					current_file.put_character (' ')
					header_file.put_string (c_char)
					current_file.put_string (c_char)
					header_file.put_character (' ')
					current_file.put_character (' ')
					print_once_status_name (l_once_feature, header_file)
					print_once_status_name (l_once_feature, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('%'')
					current_file.put_character ('\')
					current_file.put_character ('0')
					current_file.put_character ('%'')
					header_file.put_character (';')
					current_file.put_character (';')
					header_file.put_new_line
					current_file.put_new_line
					if l_result_type /= Void then
						header_file.put_string (c_extern)
						header_file.put_character (' ')
						print_type_declaration (l_result_type, header_file)
						print_type_declaration (l_result_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						print_once_value_name (l_once_feature, header_file)
						print_once_value_name (l_once_feature, current_file)
						header_file.put_character (';')
						current_file.put_character (';')
						header_file.put_new_line
						current_file.put_new_line
					end
				end
			end
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			if l_result_type /= Void then
				print_type_declaration (l_result_type, header_file)
				print_type_declaration (l_result_type, current_file)
			elseif a_creation then
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
			else
				header_file.put_string (c_void)
				current_file.put_string (c_void)
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb_args := l_arguments.count
			end
			if a_static then
				print_static_routine_name (current_feature, current_type, header_file)
				print_static_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				if nb_args = 0 then
					header_file.put_string (c_void)
					current_file.put_string (c_void)
				end
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type, header_file)
				print_creation_procedure_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				if nb_args = 0 then
					header_file.put_string (c_void)
					current_file.put_string (c_void)
				end
			else
				print_routine_name (current_feature, current_type, header_file)
				print_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
				if current_type.is_expanded then
					header_file.put_character ('*')
					current_file.put_character ('*')
				end
				header_file.put_character (' ')
				current_file.put_character (' ')
				print_current_name (header_file)
				print_current_name (current_file)
				l_comma := True
			end
			if nb_args > 0 then
				from i := 1 until i > nb_args loop
					if l_comma then
						header_file.put_character (',')
						current_file.put_character (',')
						header_file.put_character (' ')
						current_file.put_character (' ')
					else
						l_comma := True
					end
					l_argument_type_set := current_feature.argument_type_set (i)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the formal
							-- arguments should have been computed at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_argument_type := l_argument_type_set.static_type
						print_type_declaration (l_argument_type, header_file)
						print_type_declaration (l_argument_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						l_name := l_arguments.formal_argument (i).name
						print_argument_name (l_name, header_file)
						print_argument_name (l_name, current_file)
						i := i + 1
					end
				end
			end
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			if l_result_type /= Void then
				print_indentation
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_entity_value (l_result_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					l_name := l_locals.local_variable (i).name
					l_local_type_set := dynamic_type_set (l_name)
					if l_local_type_set = Void then
							-- Internal error: the dynamic type of local variable
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_local_type := l_local_type_set.static_type
						print_indentation
						print_type_declaration (l_local_type, current_file)
						current_file.put_character (' ')
						print_local_name (l_name, current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_default_entity_value (l_local_type, current_file)
						current_file.put_character (';')
						current_file.put_new_line
					end
					i := i + 1
				end
			end
			l_rescue := a_feature.rescue_clause
			if l_rescue /= Void then
				print_indentation
				current_file.put_string (c_struct)
				current_file.put_character (' ')
				current_file.put_string (c_ge_rescue)
				current_file.put_character (' ')
				current_file.put_character ('r')
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
			print_feature_trace_message_call (True)
			if a_creation then
				print_malloc_current (a_feature)
			end
			if l_once_feature /= Void then
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_once_status_name (l_once_feature, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				current_file.put_string (c_return)
				if l_result_type_set /= Void then
					current_file.put_character (' ')
					print_once_value_name (l_once_feature, current_file)
				end
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_once_status_name (l_once_feature, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('%'')
				current_file.put_character ('\')
				current_file.put_character ('1')
				current_file.put_character ('%'')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
			if l_rescue /= Void then
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_string (c_ge_setjmp)
				current_file.put_character ('(')
				current_file.put_character ('r')
				current_file.put_character ('.')
				current_file.put_character ('j')
				current_file.put_character ('b')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('!')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_compound (l_rescue)
				print_indentation
				current_file.put_string (c_ge_raise)
				current_file.put_character ('(')
				current_file.put_character ('8')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_string (c_ge_retry)
				current_file.put_character (':')
				current_file.put_new_line
				print_indentation
				current_file.put_string ("r.previous = GE_rescue;")
				current_file.put_new_line
				print_indentation
				current_file.put_string ("GE_rescue = &r;")
				current_file.put_new_line
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				print_compound (l_compound)
			end
			if l_rescue /= Void then
				print_indentation
				current_file.put_string ("GE_rescue = r.previous;")
				current_file.put_new_line
			end
			if l_result_type /= Void then
				if l_once_feature /= Void then
					print_indentation
					print_once_value_name (l_once_feature, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (';')
					current_file.put_new_line
				end
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			elseif a_creation then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				if current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			print_feature_trace_message_call (False)
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			flush_to_c_file
			reset_temp_variables
		end

	print_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_function (a_feature)
		end

	print_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_procedure (a_feature)
		end

	print_attribute (a_feature: ET_ATTRIBUTE) is
			-- Print function wrapper for `a_feature' to `current_file'
			-- and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_attribute_wrapper (a_feature, False)
			end
		end

	print_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Print function wrapper for `a_feature' to `current_file'
			-- and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_attribute_wrapper (a_feature, False)
				end
				if current_feature.is_static then
					print_attribute_wrapper (a_feature, True)
				end
			end
		end

	print_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Print function wrapper for `a_feature' to `current_file'
			-- and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
					-- Internal error: inconsistent `current_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_feature.is_regular then
					print_attribute_wrapper (a_feature, False)
				end
				if current_feature.is_static then
					print_attribute_wrapper (a_feature, True)
				end
			end
		end

	print_attribute_wrapper (a_feature: ET_QUERY; a_static: BOOLEAN) is
			-- Print function wrapper for `a_feature' to `current_file'
			-- and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
			no_arguments: a_feature.arguments = Void
			valid_feature: current_feature.static_feature = a_feature
			is_static: a_static implies current_feature.is_static
		local
			old_file: KI_TEXT_OUTPUT_STREAM
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_name: ET_FEATURE_NAME
			old_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_result: ET_RESULT
		do
			old_file := current_file
			current_file := current_function_header_buffer
				-- Print signature to `header_file' and `current_file'.
			print_feature_name_comment (a_feature, current_type, header_file)
			print_feature_name_comment (a_feature, current_type, current_file)
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set = Void then
					-- Internal error: a query has a result type set.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_result_type := l_result_type_set.static_type
				print_type_declaration (l_result_type, header_file)
				print_type_declaration (l_result_type, current_file)
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			if a_static then
				print_static_routine_name (current_feature, current_type, header_file)
				print_static_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				header_file.put_string (c_void)
				current_file.put_string (c_void)
			else
				print_routine_name (current_feature, current_type, header_file)
				print_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
				if current_type.is_expanded then
					header_file.put_character ('*')
					current_file.put_character ('*')
				end
				header_file.put_character (' ')
				current_file.put_character (' ')
				print_current_name (header_file)
				print_current_name (current_file)
			end
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			if l_result_type /= Void then
				print_indentation
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_entity_value (l_result_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
				-- Prepare dynamic type sets of wrapper feature.
			old_dynamic_type_sets := current_dynamic_type_sets
			internal_dynamic_type_sets.put_last (l_result_type_set)
			current_dynamic_type_sets := internal_dynamic_type_sets
				-- Prepare call expression to attribute feature.
			l_name := a_feature.name
			l_name.set_seed (a_feature.first_seed)
			wrapper_expression.set_target (Void)
			wrapper_expression.set_name (l_name)
			wrapper_expression.set_arguments (Void)
			wrapper_expression.set_index (1)
				-- Print assignment of call expression to result entity.
			l_result := tokens.result_keyword
			assignment_target := l_result
			print_operand (wrapper_expression)
			assignment_target := Void
			fill_call_operands (1)
			if call_operands.first /= l_result then
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_expression (call_operands.first)
				current_file.put_character (';')
				current_file.put_new_line
			end
				-- Clean up.
			call_operands.wipe_out
			current_dynamic_type_sets := old_dynamic_type_sets
			internal_dynamic_type_sets.wipe_out
				-- Return attribute value.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			flush_to_c_file
			reset_temp_variables
		end

	wrapper_expression: ET_CALL_EXPRESSION
			-- Wrapper expression

feature {NONE} -- Instruction generation

	print_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_call: ET_FEATURE_CALL_EXPRESSION
			l_tuple_expression: ET_EXPRESSION
			l_tuple_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_source: ET_EXPRESSION
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_seed: INTEGER
		do
			l_call := an_instruction.call
			if l_call.name.is_tuple_label then
				l_tuple_expression := l_call.target
				l_tuple_type_set := dynamic_type_set (l_tuple_expression)
				if l_tuple_type_set = Void then
						-- Internal error: the dynamic type set of `l_tuple_expression'
						-- should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_type ?= l_tuple_type_set.static_type
					if l_tuple_type = Void then
							-- Internal error: the type of `l_tuple_expression' should be
							-- a Tuple type.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_item_type_sets := l_tuple_type.item_type_sets
						l_seed := l_call.name.seed
						if l_seed < 1 or l_seed > l_item_type_sets.count then
								-- Internal error: invalid Tuple label.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_target_type_set := l_item_type_sets.item (l_seed)
							l_source := an_instruction.source
							l_source_type_set := dynamic_type_set (l_source)
							if l_source_type_set = Void then
									-- Internal error: the dynamic type set of the source
									-- should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								print_operand (l_tuple_expression)
								print_operand (l_source)
									-- When printing the access to the Tuple item (the left-hand side of
									-- the assignment), it is likely that `call_operands' will be used and
									-- then wiped out (see `print_qualified_call_expression' which will be
									-- called indirectly from `print_attribute_tuple_item_access').
									-- Therefore, keep track of the source operand and put `call_operands'
									-- in a clean state beforehand to avoid any problem.
								fill_call_operands (1)
								l_source := call_operands.first
								call_operands.wipe_out
									-- Process the tuple expression operand.
								fill_call_operands (1)
								print_indentation
								print_attribute_tuple_item_access (l_seed, call_operands.first, l_tuple_type, True)
								call_operands.wipe_out
								current_file.put_character (' ')
								current_file.put_character ('=')
								current_file.put_character (' ')
								current_file.put_character ('(')
									-- Process the saved copy of source operand now.
								print_attachment_expression (l_source, l_source_type_set, l_target_type_set.static_type)
								current_file.put_character (')')
								current_file.put_character (';')
								current_file.put_new_line
								call_operands.wipe_out
							end
						end
					end
				end
			else
				print_qualified_call_instruction (an_instruction)
			end
		end

	print_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_source: ET_EXPRESSION
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_target: ET_WRITABLE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type: ET_DYNAMIC_TYPE
		do
			l_source := an_instruction.source
			l_source_type_set := dynamic_type_set (l_source)
			l_target := an_instruction.target
			l_target_type_set := dynamic_type_set (l_target)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type set of the source
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the
					-- target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_source_type := l_source_type_set.static_type
				l_target_type := l_target_type_set.static_type
				assignment_target := Void
				if l_target_type.is_expanded then
					if l_source_type.is_expanded then
-- TODO: check to see if `l_source_type' has a non-standard 'copy' feature.
						assignment_target := l_target
					end
				else
					if not l_source_type_set.has_expanded then
						assignment_target := l_target
					end
				end
				print_operand (l_source)
				assignment_target := Void
				fill_call_operands (1)
				if call_operands.first /= l_target then
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_attachment_expression (call_operands.first, l_source_type_set, l_target_type)
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
			end
		end

	print_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_source: ET_EXPRESSION
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_target: ET_WRITABLE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type: ET_DYNAMIC_TYPE
			l_conforming_types: ET_DYNAMIC_TYPE_LIST
			l_non_conforming_types: ET_DYNAMIC_TYPE_LIST
		do
			l_source := an_instruction.source
			l_source_type_set := dynamic_type_set (l_source)
			l_target := an_instruction.target
			l_target_type_set := dynamic_type_set (l_target)
			if l_source_type_set = Void then
					-- Internal error: the dynamic type set of the source
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif  l_target_type_set = Void then
					-- Internal error: the dynamic type set of the
					-- target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_source_type_set.count
				l_conforming_types := conforming_types
				l_conforming_types.resize (nb)
				l_non_conforming_types := non_conforming_types
				l_non_conforming_types.resize (nb)
				l_target_type := l_target_type_set.static_type
				l_source_type := l_source_type_set.static_type
				from i := 1 until i > nb loop
					l_dynamic_type := l_source_type_set.dynamic_type (i)
					if l_dynamic_type.conforms_to_type (l_target_type, current_system) then
						l_conforming_types.put_last (l_dynamic_type)
					else
						l_non_conforming_types.put_last (l_dynamic_type)
					end
					i := i + 1
				end
				print_operand (l_source)
				fill_call_operands (1)
				if l_non_conforming_types.is_empty then
						-- Direct assignment.
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_attachment_expression (call_operands.first, l_source_type_set, l_target_type)
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_conforming_types.is_empty then
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_void)
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_non_conforming_types.count < l_conforming_types.count then
					if not l_source_type.is_expanded then
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						current_file.put_character ('(')
						print_expression (call_operands.first)
						current_file.put_character (')')
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_string (c_eif_void)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_indentation
						print_writable (l_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_string (c_eif_void)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_character (' ')
						current_file.put_string (c_else)
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
					end
					check
							-- None of `l_non_conforming_types' and `l_conforming_types' are empty.
							-- Therefore the source is polymorphic. As a consequence if
							-- `l_source_type' is expanded then it should be generic
							-- (because non-generic expanded types cannot be polymorphic).
						generic_if_expanded: l_source_type.is_expanded implies l_source_type.is_generic
					end
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (call_operands.first, l_source_type, False)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_non_conforming_types.count
					from i := 1 until i > nb loop
						l_dynamic_type := l_non_conforming_types.dynamic_type (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						i := i + 1
					end
					indent
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_void)
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_string (c_default)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					conforming_type_set.reset_with_types (l_source_type, l_conforming_types)
					if l_source_type_set.is_never_void then
						conforming_type_set.set_never_void
					end
					print_attachment_expression (call_operands.first, conforming_type_set, l_target_type)
					conforming_type_set.reset_with_types (current_system.none_type, Void)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
					if not l_source_type.is_expanded then
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					end
				else
					if not l_source_type.is_expanded then
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						current_file.put_character ('(')
						print_expression (call_operands.first)
						current_file.put_character (')')
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_string (c_eif_void)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_indentation
						print_writable (l_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_string (c_eif_void)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_character (' ')
						current_file.put_string (c_else)
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
					end
					check
							-- None of `l_non_conforming_types' and `l_conforming_types' are empty.
							-- Therefore the source is polymorphic. As a consequence if
							-- `l_source_type' is expanded then it should be generic
							-- (because non-generic expanded types cannot be polymorphic).
						generic_if_expanded: l_source_type.is_expanded implies l_source_type.is_generic
					end
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (call_operands.first, l_target_type, False)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_conforming_types.count
					from i := 1 until i > nb loop
						l_dynamic_type := l_conforming_types.dynamic_type (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						i := i + 1
					end
					indent
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					conforming_type_set.reset_with_types (l_source_type, l_conforming_types)
					if l_source_type_set.is_never_void then
						conforming_type_set.set_never_void
					end
					print_attachment_expression (call_operands.first, conforming_type_set, l_target_type)
					conforming_type_set.reset_with_types (current_system.none_type, Void)
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_string (c_default)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_void)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
					if not l_source_type.is_expanded then
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					end
				end
				l_conforming_types.wipe_out
				l_non_conforming_types.wipe_out
				call_operands.wipe_out
			end
		end

	print_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			print_creation_instruction (an_instruction)
		end

	print_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			if an_instruction.is_qualified_call then
				print_qualified_call_instruction (an_instruction)
			else
				print_unqualified_call_instruction (an_instruction)
			end
		end

	print_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			-- Do nothing.
		end

	print_compound (a_compound: ET_COMPOUND) is
			-- Print `a_compound'.
		require
			a_compound_not_void: a_compound /= Void
		local
			i, nb: INTEGER
		do
			nb := a_compound.count
			from i := 1 until i > nb loop
				print_instruction (a_compound.item (i))
				i := i + 1
			end
		end

	print_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			print_creation_instruction (an_instruction)
		end

	print_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_target: ET_WRITABLE
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_call: ET_QUALIFIED_CALL
			l_seed: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			had_error: BOOLEAN
		do
				-- Look for the dynamic type of the creation type.
			l_target := an_instruction.target
			l_type := an_instruction.type
			if l_type /= Void then
				had_error := has_fatal_error
				l_resolved_type := resolved_formal_parameters (l_type)
				if not has_fatal_error then
					has_fatal_error := had_error
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
				end
			else
					-- Look for the dynamic type of the target.
				l_dynamic_type_set := dynamic_type_set (l_target)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type sets of the
						-- target should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_dynamic_type := l_dynamic_type_set.static_type
				end
			end
			if l_dynamic_type /= Void then
				l_call := an_instruction.creation_call
				if l_call /= Void then
					l_seed := l_call.name.seed
					l_actuals := l_call.arguments
				else
					l_seed := universe.default_create_seed
					l_actuals := Void
				end
				l_dynamic_procedure := l_dynamic_type.seeded_dynamic_procedure (l_seed, current_system)
				if l_dynamic_procedure = Void then
						-- Internal error: there should be a procedure with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if l_actuals /= Void then
						nb := l_actuals.count
						from i := 1 until i > nb loop
							print_operand (l_actuals.actual_argument (i))
							i := i + 1
						end
					end
					fill_call_operands (nb)
					print_indentation
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					if not l_dynamic_procedure.is_generated then
						l_dynamic_procedure.set_generated (True)
						called_features.force_last (l_dynamic_procedure)
					end
					print_creation_procedure_name (l_dynamic_procedure, l_dynamic_type, current_file)
					current_file.put_character ('(')
					from i := 1 until i > nb loop
						if i /= 1 then
							current_file.put_character (',')
							current_file.put_character (' ')
						end
						l_actual_type_set := dynamic_type_set (call_operands.item (i))
						l_formal_type_set := l_dynamic_procedure.argument_type_set (i)
						if l_actual_type_set = Void then
								-- Internal error: the dynamic type set of the actual
								-- arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_formal_type_set = Void then
								-- Internal error: the dynamic type set of the
								-- formal arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
						end
						i := i + 1
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					call_operands.wipe_out
				end
			end
		end

	print_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			-- Do nothing.
		end

	print_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_compound: ET_COMPOUND
			l_elseif_parts: ET_ELSEIF_PART_LIST
			l_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
		do
			print_operand (an_instruction.expression)
			fill_call_operands (1)
			print_indentation
			current_file.put_string (c_if)
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			call_operands.wipe_out
			current_file.put_character (')')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
			l_compound := an_instruction.then_compound
			if l_compound /= Void then
				indent
				print_compound (l_compound)
				dedent
			end
			print_indentation
			current_file.put_character ('}')
			l_elseif_parts := an_instruction.elseif_parts
			if l_elseif_parts /= Void then
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif := l_elseif_parts.item (i)
					current_file.put_character (' ')
					current_file.put_string (c_else)
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_operand (l_elseif.expression)
					fill_call_operands (1)
					print_indentation
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.first)
					call_operands.wipe_out
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					l_compound := l_elseif.then_compound
					if l_compound /= Void then
						indent
						print_compound (l_compound)
						dedent
					end
					print_indentation
					current_file.put_character ('}')
					i := i + 1
				end
			end
			l_compound := an_instruction.else_compound
			if l_compound /= Void then
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_compound (l_compound)
				dedent
				print_indentation
				current_file.put_character ('}')
			end
			from i := 1 until i > nb loop
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				i := i + 1
			end
			current_file.put_new_line
		end

	print_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_expression: ET_EXPRESSION
			l_when_parts: ET_WHEN_PART_LIST
			l_when_part: ET_WHEN_PART
			l_choices: ET_CHOICE_LIST
			l_choice: ET_CHOICE
			l_compound: ET_COMPOUND
			i, nb: INTEGER
			j, nb2: INTEGER
			l_has_case: BOOLEAN
			l_lower: ET_CHOICE_CONSTANT
			l_upper: ET_CHOICE_CONSTANT
			l_lower_integer: ET_INTEGER_CONSTANT
			l_upper_integer: ET_INTEGER_CONSTANT
			l_lower_character: ET_CHARACTER_CONSTANT
			l_upper_character: ET_CHARACTER_CONSTANT
			l_feature_name: ET_FEATURE_NAME
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			k, nb3: INTEGER
			l_value_type_set: ET_DYNAMIC_TYPE_SET
			l_value_type: ET_DYNAMIC_TYPE
		do
-- TODO.
			l_expression := an_instruction.conditional.expression
			l_value_type_set := dynamic_type_set (l_expression)
			if l_value_type_set = Void then
					-- Internal error.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_value_type := l_value_type_set.static_type
				print_operand (l_expression)
				fill_call_operands (1)
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				call_operands.wipe_out
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_when_parts := an_instruction.when_parts
				if l_when_parts /= Void then
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						l_when_part := l_when_parts.item (i)
						l_choices := l_when_part.choices
						nb2 := l_choices.count
						if nb2 = 0 then
							-- Do nothing.
						else
							l_has_case := False
							from j := 1 until j > nb2 loop
								l_choice := l_choices.choice (j)
								if l_choice.is_range then
-- TODO
									l_lower := l_choice.lower
									l_upper := l_choice.upper
									l_lower_integer ?= l_lower
									if l_lower_integer = Void then
										l_lower_character ?= l_lower
										if l_lower_character = Void then
											l_feature_name ?= l_lower
											if l_feature_name /= Void then
												l_constant_attribute ?= current_type.base_class.seeded_query (l_feature_name.seed)
												if l_constant_attribute /= Void then
													l_lower_integer ?= l_constant_attribute.constant
													l_lower_character ?= l_constant_attribute.constant
												end
											end
										end
									end
									l_upper_integer ?= l_upper
									if l_upper_integer = Void then
										l_upper_character ?= l_upper
										if l_upper_character = Void then
											l_feature_name ?= l_upper
											if l_feature_name /= Void then
												l_constant_attribute ?= current_type.base_class.seeded_query (l_feature_name.seed)
												if l_constant_attribute /= Void then
													l_upper_integer ?= l_constant_attribute.constant
													l_upper_character ?= l_constant_attribute.constant
												end
											end
										end
									end
									if l_lower_integer /= Void and l_upper_integer /= Void then
										from
											l_lower_integer.compute_value
											l_upper_integer.compute_value
											k := l_lower_integer.value
											nb3 := l_upper_integer.value
										until
											k > nb3
										loop
											l_has_case := True
											print_indentation
											current_file.put_string (c_case)
											current_file.put_character (' ')
											print_type_cast (l_value_type, current_file)
											current_file.put_integer (k)
											current_file.put_character (':')
											current_file.put_new_line
											k := k + 1
										end
									elseif l_lower_character /= Void and l_upper_character /= Void then
										from
											k := l_lower_character.value.code
											nb3 := l_upper_character.value.code
										until
											k > nb3
										loop
											l_has_case := True
											print_indentation
											current_file.put_string (c_case)
											current_file.put_character (' ')
											print_type_cast (l_value_type, current_file)
											print_escaped_character (INTEGER_.to_character (k))
											current_file.put_character (':')
											current_file.put_new_line
											k := k + 1
										end
									else
-- TODO
print ("ET_C_GENERATOR.print_inspect_instruction - range%N")
									end
								else
									l_has_case := True
									print_indentation
									current_file.put_string (c_case)
									current_file.put_character (' ')
									print_type_cast (l_value_type, current_file)
									print_expression (l_choice.lower)
									current_file.put_character (':')
									current_file.put_new_line
								end
								j := j + 1
							end
							if l_has_case then
								indent
								l_compound := l_when_part.then_compound
								if l_compound /= Void then
									print_compound (l_compound)
								end
								print_indentation
								current_file.put_string (c_break)
								current_file.put_character (';')
								current_file.put_new_line
								dedent
							end
						end
						i := i + 1
					end
				end
				print_indentation
				current_file.put_string (c_default)
				current_file.put_character (':')
				current_file.put_new_line
				l_compound := an_instruction.else_compound
				if l_compound /= Void then
					indent
					print_compound (l_compound)
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
				else
-- TODO: raise exception.
					indent
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_instruction (an_instruction: ET_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			an_instruction.process (Current)
		end

	print_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_compound: ET_COMPOUND
			l_expression: ET_EXPRESSION
		do
			l_compound := an_instruction.from_compound
			if l_compound /= Void then
				print_compound (l_compound)
			end
			l_expression := an_instruction.until_expression
			print_operand (l_expression)
			fill_call_operands (1)
			print_indentation
			current_file.put_string (c_while)
			current_file.put_character (' ')
			current_file.put_character ('(')
			current_file.put_character ('!')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			call_operands.wipe_out
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			l_compound := an_instruction.loop_compound
			if l_compound /= Void then
				print_compound (l_compound)
			end
			print_operand (l_expression)
			dedent
			fill_call_operands (1)
			call_operands.wipe_out
			print_indentation
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_procedure: ET_PROCEDURE
			l_parent_type, l_ancestor: ET_BASE_TYPE
			l_class: ET_CLASS
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_current_class: ET_CLASS
			l_class_impl: ET_CLASS
			l_dynamic_precursor: ET_DYNAMIC_PRECURSOR
			l_parent_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_comma: BOOLEAN
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			had_error: BOOLEAN
		do
			l_actuals := an_instruction.arguments
			if l_actuals /= Void then
				nb := l_actuals.count
				from i := 1 until i > nb loop
					print_operand (l_actuals.actual_argument (i))
					i := i + 1
				end
			end
			fill_call_operands (nb)
			l_parent_type := an_instruction.parent_type
			if l_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				had_error := has_fatal_error
				has_fatal_error := False
				if l_parent_type.is_generic then
					l_current_class := current_type.base_class
					l_class_impl := current_feature.static_feature.implementation_class
					if l_current_class /= l_class_impl then
							-- Resolve generic parameters in the context of `current_type'.
						if not l_current_class.ancestors_built or else l_current_class.has_ancestors_error then
								-- 'ancestor_builder' should already have been executed
								-- on `l_current_class' at this stage, and any error
								-- should already heve been reported.
							set_fatal_error
						else
							l_ancestor := l_current_class.ancestor (l_parent_type, universe)
							if l_ancestor = Void then
									-- Internal error: `l_parent_type' is an ancestor
									-- of `l_class_impl', and hence of `l_current_class'.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_parent_type := l_ancestor
							end
						end
					end
				end
				if not has_fatal_error then
					has_fatal_error := had_error
					l_precursor_keyword := an_instruction.precursor_keyword
					l_class := l_parent_type.direct_base_class (universe)
					l_procedure := l_class.seeded_procedure (l_precursor_keyword.seed)
					if l_procedure = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `l_class_impl'.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_parent_dynamic_type := current_system.dynamic_type (l_parent_type, current_type.base_type)
						l_dynamic_precursor := current_feature.dynamic_precursor (l_procedure, l_parent_dynamic_type, current_system)
						if not l_dynamic_precursor.is_generated then
							l_dynamic_precursor.set_generated (True)
							called_features.force_last (l_dynamic_precursor)
						end
						print_indentation
						if l_dynamic_precursor.is_static then
							print_static_routine_name (l_dynamic_precursor, current_type, current_file)
							current_file.put_character ('(')
						else
							print_routine_name (l_dynamic_precursor, current_type, current_file)
							current_file.put_character ('(')
							print_current_name (current_file)
							l_comma := True
						end
						from i := 1 until i > nb loop
							if l_comma then
								current_file.put_character (',')
								current_file.put_character (' ')
							else
								l_comma := True
							end
							l_actual_type_set := dynamic_type_set (call_operands.item (i))
							l_formal_type_set := l_dynamic_precursor.argument_type_set (i)
							if l_actual_type_set = Void then
									-- Internal error: the dynamic type set of the actual
									-- arguments should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							elseif l_formal_type_set = Void then
									-- Internal error: the dynamic type set of the
									-- formal arguments should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
							end
							i := i + 1
						end
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					end
				end
			end
			call_operands.wipe_out
		end

	print_qualified_call_instruction (a_call: ET_FEATURE_CALL_INSTRUCTION) is
			-- Print qualified call instruction.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
		local
			l_name: ET_CALL_NAME
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_manifest_tuple_operand: ET_MANIFEST_TUPLE
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_target_operand: ET_EXPRESSION
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_dynamic_type: ET_DYNAMIC_TYPE
			nb2: INTEGER
			l_switch: BOOLEAN
		do
			l_target := a_call.target
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_target_type_set := dynamic_type_set (l_target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target_static_type := l_target_type_set.static_type
				l_seed := l_name.seed
					-- Check whether this a call to ROUTINE.call with a manifest
					-- tuple as argument. We have a special treatment in that case
					-- to avoid having to create the manifest tuple when possible.
				if not a_call.is_tuple_label and then l_seed = universe.routine_call_seed then
					if l_actuals /= Void and then l_actuals.count = 1 then
						l_manifest_tuple ?= l_actuals.actual_argument (1)
						if l_manifest_tuple /= Void then
							print_target_operand (l_target, l_target_static_type)
							nb := l_manifest_tuple.count
							from i := 1 until i > nb loop
								print_operand (l_manifest_tuple.expression (i))
								i := i + 1
							end
							nb := nb + 1
							fill_call_operands (nb)
							l_manifest_tuple_operand := agent_manifest_tuple
							l_manifest_tuple_operand.resize (nb - 1)
							from i := nb until i < 2 loop
								l_manifest_tuple_operand.put_first (call_operands.item (i))
								i := i - 1
							end
							l_manifest_tuple_operand.set_index (l_manifest_tuple.index)
							mark_expressions_frozen (l_manifest_tuple_operand)
							l_target_operand := call_operands.first
							call_operands.wipe_out
							call_operands.put_last (l_target_operand)
							call_operands.put_last (l_manifest_tuple_operand)
							nb := 2
						end
					end
				end
				if l_manifest_tuple_operand = Void then
					print_target_operand (l_target, l_target_static_type)
					if l_actuals /= Void then
						nb := l_actuals.count
						from i := 1 until i > nb loop
							print_operand (l_actuals.actual_argument (i))
							i := i + 1
						end
					end
					nb := nb + 1
					fill_call_operands (nb)
				end
				nb2 := l_target_type_set.count
				if nb2 = 0 then
						-- Call on Void target.
					print_indentation
					current_file.put_character ('(')
					print_target_expression (call_operands.first, l_target_static_type, True)
					from i := 2 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						print_expression (call_operands.item (i))
						i := i + 1
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				elseif nb2 = 1 then
						-- Static binding.
					l_target_dynamic_type := l_target_type_set.dynamic_type (1)
					print_named_procedure_call (a_call.name, l_target_dynamic_type, True)
				else
						-- Dynamic binding.
					if nb2 > 2 then
						print_indentation
						print_call_name (a_call, current_feature, l_target_static_type, current_file)
						current_file.put_character ('(')
						print_target_expression (call_operands.first, l_target_static_type, True)
						if l_manifest_tuple_operand /= Void then
							nb := l_manifest_tuple_operand.count
							from i := 1 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (l_manifest_tuple_operand.expression (i))
								i := i + 1
							end
						else
							from i := 2 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (call_operands.item (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_switch then
						print_indentation
						current_file.put_string (c_switch)
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attribute_type_id_access (call_operands.first, l_target_static_type, True)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
							-- First type.
						l_target_dynamic_type := l_target_type_set.dynamic_type (1)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_target_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_named_procedure_call (a_call.name, l_target_dynamic_type, False)
						print_indentation
						current_file.put_string (c_break)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
							-- Second type.
						l_target_dynamic_type := l_target_type_set.dynamic_type (2)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_target_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_named_procedure_call (a_call.name, l_target_dynamic_type, False)
						print_indentation
						current_file.put_string (c_break)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					else
							-- First type.
						l_target_dynamic_type := l_target_type_set.dynamic_type (1)
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attribute_type_id_access (call_operands.first, l_target_static_type, True)
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_integer (l_target_dynamic_type.id)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_named_procedure_call (a_call.name, l_target_dynamic_type, False)
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_character (' ')
							-- Second type.
						l_target_dynamic_type := l_target_type_set.dynamic_type (2)
						current_file.put_string (c_else)
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_named_procedure_call (a_call.name, l_target_dynamic_type, False)
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					end
				end
				if l_manifest_tuple_operand /= Void then
					mark_expressions_unfrozen (l_manifest_tuple_operand)
					l_manifest_tuple_operand.wipe_out
				end
			end
			call_operands.wipe_out
		end

	print_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			print_indentation
			current_file.put_string (c_goto)
			current_file.put_character (' ')
			current_file.put_string (c_ge_retry)
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_target_type: ET_DYNAMIC_TYPE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_seed: INTEGER
			i, nb: INTEGER
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			had_error: BOOLEAN
		do
			l_type := an_instruction.type
			had_error := has_fatal_error
			l_resolved_type := resolved_formal_parameters (l_type)
			if not has_fatal_error then
				has_fatal_error := had_error
				l_actuals := an_instruction.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						print_operand (l_actuals.actual_argument (i))
						i := i + 1
					end
				end
				fill_call_operands (nb)
				l_target_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
				l_seed := an_instruction.name.seed
				l_dynamic_procedure := l_target_type.seeded_dynamic_procedure (l_seed, current_system)
				if l_dynamic_procedure = Void then
						-- Internal error: there should be a procedure with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if not l_dynamic_procedure.is_generated then
						l_dynamic_procedure.set_generated (True)
						called_features.force_last (l_dynamic_procedure)
					end
					print_indentation
					print_static_routine_name (l_dynamic_procedure, l_target_type, current_file)
					current_file.put_character ('(')
					from i := 1 until i > nb loop
						if i /= 1 then
							current_file.put_character (',')
							current_file.put_character (' ')
						end
						l_actual_type_set := dynamic_type_set (call_operands.item (i))
						l_formal_type_set := l_dynamic_procedure.argument_type_set (i)
						if l_actual_type_set = Void then
								-- Internal error: the dynamic type set of the actual
								-- arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_formal_type_set = Void then
								-- Internal error: the dynamic type sets of the
								-- formal arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
						end
						i := i + 1
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
			end
		end

	print_unqualified_call_instruction (a_call: ET_FEATURE_CALL_INSTRUCTION) is
			-- Print unqualified call instruction.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
		local
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_manifest_tuple_operand: ET_MANIFEST_TUPLE
			l_target_operand: ET_EXPRESSION
			l_seed: INTEGER
			i, nb: INTEGER
		do
			l_actuals := a_call.arguments
			l_seed := a_call.name.seed
				-- Check whether this a call to ROUTINE.call with a manifest
				-- tuple as argument. We have a special treatment in that case
				-- to avoid having to create the manifest tuple when possible.
			if l_seed = universe.routine_call_seed then
				if l_actuals /= Void and then l_actuals.count = 1 then
					l_manifest_tuple ?= l_actuals.actual_argument (1)
					if l_manifest_tuple /= Void then
						operand_stack.force (tokens.current_keyword)
						nb := l_manifest_tuple.count
						from i := 1 until i > nb loop
							print_operand (l_manifest_tuple.expression (i))
							i := i + 1
						end
						nb := nb + 1
						fill_call_operands (nb)
						l_manifest_tuple_operand := agent_manifest_tuple
						l_manifest_tuple_operand.resize (nb - 1)
						from i := nb until i < 2 loop
							l_manifest_tuple_operand.put_first (call_operands.item (i))
							i := i - 1
						end
						l_manifest_tuple_operand.set_index (l_manifest_tuple.index)
						mark_expressions_frozen (l_manifest_tuple_operand)
						l_target_operand := call_operands.first
						call_operands.wipe_out
						call_operands.put_last (l_target_operand)
						call_operands.put_last (l_manifest_tuple_operand)
						nb := 2
					end
				end
			end
			if l_manifest_tuple_operand = Void then
				operand_stack.force (tokens.current_keyword)
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						print_operand (l_actuals.actual_argument (i))
						i := i + 1
					end
				end
				nb := nb + 1
				fill_call_operands (nb)
			end
			print_named_procedure_call (a_call.name, current_type, False)
			call_operands.wipe_out
			if l_manifest_tuple_operand /= Void then
				mark_expressions_unfrozen (l_manifest_tuple_operand)
				l_manifest_tuple_operand.wipe_out
			end
		end

	print_unqualified_identifier_call_instruction (an_identifier: ET_IDENTIFIER) is
			-- Print unqualified identifier call instruction.
		require
			an_identifier_not_void: an_identifier /= Void
			instruction: an_identifier.is_instruction
		do
			call_operands.wipe_out
			call_operands.force_last (tokens.current_keyword)
			print_named_procedure_call (an_identifier, current_type, False)
			call_operands.wipe_out
		end

feature {NONE} -- Procedure call generation

	print_named_procedure_call (a_name: ET_CALL_NAME; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_name' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_name_not_void: a_name /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_seed: INTEGER
		do
			l_seed := a_name.seed
			l_dynamic_feature := a_target_type.seeded_dynamic_procedure (l_seed, current_system)
			if l_dynamic_feature = Void then
					-- Internal error: there should be a procedure with `l_seed'.
					-- It has been computed in ET_FEATURE_CHECKER.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_procedure_call (l_dynamic_feature, a_target_type, a_check_void_target)
			end
		end

	print_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_feature.is_builtin then
				print_builtin_procedure_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_non_inlined_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a non-inlined version of a call to procedure `a_feature' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			if not a_feature.is_generated then
				a_feature.set_generated (True)
				called_features.force_last (a_feature)
			end
			print_indentation
			print_routine_name (a_feature, a_target_type, current_file)
			current_file.put_character ('(')
			nb := call_operands.count
			print_target_expression (call_operands.first, a_target_type, a_check_void_target)
			from i := 2 until i > nb loop
				current_file.put_character (',')
				current_file.put_character (' ')
				l_actual_type_set := dynamic_type_set (call_operands.item (i))
				l_formal_type_set := a_feature.argument_type_set (i - 1)
				if l_actual_type_set = Void then
						-- Internal error: the dynamic type set of the actual
						-- arguments should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_formal_type_set = Void then
						-- Internal error: the dynamic type set of the
						-- formal arguments should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
				end
				i := i + 1
			end
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				print_builtin_any_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_class then
				print_builtin_boolean_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_character_8_class then
				print_builtin_sized_character_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.character_8_type)
			when builtin_character_32_class then
				print_builtin_sized_character_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.character_32_type)
			when builtin_identified_class then
				print_builtin_identified_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_integer_8_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.integer_8_type)
			when builtin_integer_16_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.integer_16_type)
			when builtin_integer_32_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.integer_32_type)
			when builtin_integer_64_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.integer_64_type)
			when builtin_natural_8_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.natural_8_type)
			when builtin_natural_16_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.natural_16_type)
			when builtin_natural_32_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.natural_32_type)
			when builtin_natural_64_class then
				print_builtin_sized_integer_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.natural_64_type)
			when builtin_pointer_class then
				print_builtin_pointer_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_procedure_class then
				print_builtin_procedure_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_real_32_class then
				print_builtin_sized_real_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.real_32_type)
			when builtin_real_64_class then
				print_builtin_sized_real_procedure_call (a_feature, a_target_type, a_check_void_target, current_system.real_64_type)
			when builtin_special_class then
				print_builtin_special_procedure_call (a_feature, a_target_type, a_check_void_target)
			when builtin_tuple_class then
				print_builtin_tuple_procedure_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_any_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "ANY".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_copy then
				print_builtin_any_copy_call (a_feature, a_target_type, a_check_void_target)
			when builtin_any_standard_copy then
				print_builtin_any_standard_copy_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_boolean_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "BOOLEAN" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_set_item then
				print_builtin_boolean_set_item_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_identified_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "IDENTIFIED" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_object_id_free then
				print_builtin_identified_eif_object_id_free_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_pointer_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "POINTER" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_set_item then
				print_builtin_pointer_set_item_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_procedure_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "PROCEDURE".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_procedure: (a_feature.builtin_code // builtin_capacity) = builtin_procedure_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_procedure_call then
				print_builtin_procedure_call_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_character_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized character type `a_character_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_set_item then
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_character_set_item_call (a_feature, a_target_type, a_check_void_target, a_character_type, l_builtin_class)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_integer_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized integer type `an_integer_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_set_item then
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_integer_set_item_call (a_feature, a_target_type, a_check_void_target, an_integer_type, l_builtin_class)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_real_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is

			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized real type `a_real_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_builtin_class: INTEGER
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_set_item then
				l_builtin_class := a_feature.builtin_code // builtin_capacity
				print_builtin_sized_real_set_item_call (a_feature, a_target_type, a_check_void_target, a_real_type, l_builtin_class)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_special_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "SPECIAL".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_put then
				print_builtin_special_put_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_tuple_procedure_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to procedure `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "TUPLE".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_tuple: (a_feature.builtin_code // builtin_capacity) = builtin_tuple_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_tuple_set_object_comparison then
				print_builtin_tuple_set_object_comparison_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_procedure_call (a_feature, a_target_type, a_check_void_target)
			end
		end

feature {NONE} -- Expression generation

	print_attachment_expression (an_expression: ET_EXPRESSION; a_source_type_set: ET_DYNAMIC_TYPE_SET; a_target_type: ET_DYNAMIC_TYPE) is
			-- Print `an_expression' of dynamic type set `a_source_type_set'
			-- when it is to be attached to an entity of type `a_target_type'.
			-- Make sure that the expression is boxed or unboxed when needed,
			-- and that it is copied or cloned when its type is expanded.
			-- Useful when printing the source of an assignment or actual
			-- arguments of a routine.
			--
			-- Note that the static type of the source does not necessarily
			-- conform to the target type. This can be the case for example
			-- with assignment attempts or because of covariance of arguments
			-- as in the example below:
			--
			--    c1: COMPARABLE
			--    c2: COMPARABLE
			--    ...
			--    c1 := 1
			--    c2 := 2
			--    c1 < c2
			--
			-- At run-time, INTEGER.infix "<" will be called. 'c2' is of static
			-- type COMPARABLE, which does not conform to the expected argument
			-- type INTEGER. But according to the dynamic type set mechanism there
			-- is no CAT-call in that case. So we will just need to unbox the
			-- integer 2 (which had been previously boxed in the assignment to
			-- 'c2') before passing it as argument of INTEGER.infix "<".
		require
			an_expression_not_void: an_expression /= Void
			a_source_type_set_not_void: a_source_type_set /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_source_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_non_conforming_types: DS_ARRAYED_LIST [INTEGER]
			l_has_non_conforming_types: BOOLEAN
			l_dts_ids: STRING
			l_dts_name: STRING
			i, nb: INTEGER
		do
			l_source_type := a_source_type_set.static_type
			if current_feature.is_tilde_feature (current_system) then
					-- No CAT-call in the feature that is supposed to simulate
					-- the forthcoming '~' operator introduced in ECMA Eiffel 367.
				l_has_non_conforming_types := False
			elseif not l_source_type.conforms_to_type (a_target_type, current_system) then
					-- Make sure that CAT-call errors will be reported at run-time.
				nb := a_source_type_set.count
				l_non_conforming_types := attachment_dynamic_type_ids
				if nb > l_non_conforming_types.capacity then
					l_non_conforming_types.resize (nb)
				end
				from i := 1 until i > nb loop
					l_dynamic_type := a_source_type_set.dynamic_type (i)
					if not l_dynamic_type.conforms_to_type (a_target_type, current_system) then
						l_non_conforming_types.put_last (l_dynamic_type.id)
					end
					i := i + 1
				end
				if not l_non_conforming_types.is_empty then
					l_has_non_conforming_types := True
					l_non_conforming_types.sort (dynamic_type_id_sorter)
					nb := l_non_conforming_types.count
					create l_dts_ids.make (5 * nb)
					from i := 1 until i > nb loop
						if i /= 1 then
							l_dts_ids.append_character (',')
						end
						l_dts_ids.append_string (l_non_conforming_types.item (i).out)
						i := i + 1
					end
					dynamic_type_id_set_names.search (l_dts_ids)
					if dynamic_type_id_set_names.found then
						l_dts_name := dynamic_type_id_set_names.found_item
					else
						l_dts_name := c_ge_dts + (dynamic_type_id_set_names.count + 1).out
						dynamic_type_id_set_names.force_last (l_dts_name, l_dts_ids)
					end
				end
				l_non_conforming_types.wipe_out
			end
			if a_target_type.is_expanded then
-- TODO: check whether 'copy' has been redefined in `l_source_type'.
				if l_source_type.is_expanded then
					if l_source_type.is_generic then
-- TODO: there might be some problems if the expanded types are generic with different actual parameters.
						if l_has_non_conforming_types then
							current_file.put_character ('*')
							current_file.put_character ('(')
							current_file.put_string (c_ge_catcall)
							current_file.put_character ('(')
								-- The object is already equipped with a type-id.
								-- Just pass its address to 'GE_catcall'.
							current_file.put_character ('&')
							current_file.put_character ('(')
						end
						print_expression (an_expression)
						if l_has_non_conforming_types then
							current_file.put_character (')')
							current_file.put_character (',')
							current_file.put_string (l_dts_name)
							current_file.put_character (',')
							current_file.put_integer (nb)
							current_file.put_character (')')
							current_file.put_character (')')
						end
					else
						if l_has_non_conforming_types then
							current_file.put_character ('(')
							print_boxed_type_cast (l_source_type, current_file)
							current_file.put_character ('(')
							current_file.put_string (c_ge_catcall)
							current_file.put_character ('(')
								-- We need to box the source object in order
								-- to pass it to 'GE_catcall'.
							print_boxed_expression (an_expression, l_source_type)
							current_file.put_character (',')
							current_file.put_string (l_dts_name)
							current_file.put_character (',')
							current_file.put_integer (nb)
							current_file.put_character (')')
							current_file.put_character (')')
							current_file.put_character (')')
							current_file.put_string (c_arrow)
							print_boxed_attribute_item_name (l_source_type, current_file)
						else
							print_expression (an_expression)
						end
					end
				else
					if a_target_type.is_generic then
-- TODO: there might be some problems if the expanded types are generic with different actual parameters.
						current_file.put_character ('*')
						current_file.put_character ('(')
						print_type_cast (a_target_type, current_file)
						current_file.put_character ('(')
						if l_has_non_conforming_types then
							current_file.put_string (c_ge_catcall)
							current_file.put_character ('(')
						end
						print_non_void_expression (an_expression, True)
						if l_has_non_conforming_types then
							current_file.put_character (',')
							current_file.put_string (l_dts_name)
							current_file.put_character (',')
							current_file.put_integer (nb)
							current_file.put_character (')')
						end
						current_file.put_character (')')
						current_file.put_character (')')
					else
							-- The source object has been boxed.
						if l_has_non_conforming_types then
							current_file.put_character ('(')
							print_boxed_type_cast (a_target_type, current_file)
							current_file.put_character ('(')
							current_file.put_string (c_ge_catcall)
							current_file.put_character ('(')
							print_non_void_expression (an_expression, True)
							current_file.put_character (',')
							current_file.put_string (l_dts_name)
							current_file.put_character (',')
							current_file.put_integer (nb)
							current_file.put_character (')')
							current_file.put_character (')')
							current_file.put_character (')')
							current_file.put_string (c_arrow)
							print_boxed_attribute_item_name (l_source_type, current_file)
						else
							print_boxed_attribute_item_access (an_expression, a_target_type, True)
						end
					end
				end
			else
				if l_has_non_conforming_types then
					current_file.put_string (c_ge_catcall)
					current_file.put_character ('(')
				end
				if l_source_type.is_expanded then
					if l_source_type.is_generic then
							-- The object is already equipped with a type-id.
-- TODO: we need to clone the source object.
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_expression (an_expression)
						current_file.put_character (')')
					else
							-- We need to box the source object.
						print_boxed_expression (an_expression, l_source_type)
					end
				else
					if a_source_type_set.has_expanded then
-- TODO: check to see whether some of the types in the source type set are expanded.
-- If so, 'twin' needs to be called on them.
						print_expression (an_expression)
					else
						print_expression (an_expression)
					end
				end
				if l_has_non_conforming_types then
					current_file.put_character (',')
					current_file.put_string (l_dts_name)
					current_file.put_character (',')
					current_file.put_integer (nb)
					current_file.put_character (')')
				end
			end
		end

	print_attribute_access (an_attribute: ET_DYNAMIC_FEATURE; a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to `an_attribute' applied to object `a_target' of type `a_target_type'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			an_attribute_not_void: an_attribute /= Void
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_name (an_attribute, a_target_type, current_file)
		end

	print_attribute_special_count_access (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to 'count' pseudo attribute of class SPECIAL applied to object `a_target' of type `a_target_type'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_special_count_name (a_target_type, current_file)
		end

	print_attribute_special_item_access (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to 'item' pseudo attribute of class SPECIAL applied to object `a_target' of type `a_target_type'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_special_item_name (a_target_type, current_file)
		end

	print_attribute_special_indexed_item_access (an_index: ET_EXPRESSION; a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' access to item at indexed `an_index'
			-- in the 'item' pseudo attribute of class SPECIAL applied to
			-- object `a_target' of type `a_target_type'. `an_index' must
			-- be declared of (i.e. its static type must be) one of the
			-- possibly sized integer types.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			an_index_not_void: an_index /= Void
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			print_attribute_special_item_access (a_target, a_target_type, a_check_void_target)
			current_file.put_character ('[')
			print_expression (an_index)
			current_file.put_character (']')
		end

	print_attribute_tuple_item_access (i: INTEGER; a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to `i'-th 'item' pseudo attribute of class TUPLE
			-- applied to Tuple object `a_target' of type `a_target_type'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_tuple_item_name (i, a_target_type, current_file)
		end

	print_attribute_type_id_access (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to 'type_id' pseudo attribute applied to object `a_target' of type `a_target_type'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (a_target_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_type_id_name (a_target_type, current_file)
		end

	print_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_bit_constant%N")
		end

	print_boxed_attribute_access (an_attribute: ET_DYNAMIC_FEATURE; a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to `an_attribute' applied to `a_target' of type the boxed version of `a_target_type'.
			-- The static type (i.e. declared type) of `a_target' is assumed to be of reference type.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			an_attribute_not_void: an_attribute /= Void
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if a_target_type.is_expanded and then not a_target_type.is_generic then
				current_file.put_character ('(')
				print_boxed_attribute_item_access (a_target, a_target_type, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_boxed_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_non_void_expression (a_target, a_check_void_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_name (an_attribute, a_target_type, current_file)
		end

	print_boxed_attribute_item_access (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to 'item' pseudo attribute applied to `a_target' of type the boxed version of `a_target_type'.
			-- The static type (i.e. declared type) of `a_target' is assumed to be of reference type.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_type_not_void: a_target_type /= Void
		do
			current_file.put_character ('(')
			print_boxed_type_cast (a_target_type, current_file)
			current_file.put_character ('(')
			print_non_void_expression (a_target, a_check_void_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			print_boxed_attribute_item_name (a_target_type, current_file)
		end

	print_boxed_attribute_type_id_access (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print access to 'type_id' pseudo attribute applied to `a_target' of type the boxed version of `a_target_type'.
			-- The static type (i.e. declared type) of `a_target' is assumed to be of reference type.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			current_file.put_character ('(')
			current_file.put_character ('(')
			print_boxed_type_declaration (a_target_type, current_file)
			current_file.put_character (')')
			current_file.put_character ('(')
			print_non_void_expression (a_target, a_check_void_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			print_attribute_type_id_name (a_target_type, current_file)
		end

	print_boxed_expression (an_expression: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print boxed version of `an_expression' of type `a_type'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_type_expanded: a_type.is_expanded
			a_type_not_generic: not a_type.is_generic
		do
			current_file.put_string (c_ge_boxed)
			current_file.put_integer (a_type.id)
			current_file.put_character ('(')
			print_expression (an_expression)
			current_file.put_character (')')
		end

	print_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_qualified_call_expression (an_expression)
		end

	print_character_constant (a_constant: ET_CHARACTER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			l_temp: ET_IDENTIFIER
		do
			if in_operand then
				if in_target then
					in_operand := False
					l_temp := new_temp_variable (current_system.character_type)
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_character_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				print_type_cast (current_system.character_type, current_file)
				current_file.put_character ('(')
				print_escaped_character (a_constant.value)
				current_file.put_character (')')
			end
		end

	print_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if an_expression.is_qualified_call then
				print_qualified_call_expression (an_expression)
			else
				print_unqualified_call_expression (an_expression)
			end
		end

	print_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_convert_feature: ET_CONVERT_FEATURE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			l_target_type: ET_DYNAMIC_TYPE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_seed: INTEGER
			l_convert_to_expression: ET_CONVERT_TO_EXPRESSION
		do
			l_convert_feature := an_expression.convert_feature
			l_target_type_set := dynamic_type_set (an_expression)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type set of expressions
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target_type := l_target_type_set.static_type
				if l_convert_feature.is_convert_from then
					l_seed := l_convert_feature.name.seed
					l_dynamic_procedure := l_target_type.seeded_dynamic_procedure (l_seed, current_system)
					if l_dynamic_procedure = Void then
							-- Internal error: there should be a procedure with `l_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER or else an
							-- error should have already been reported.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_creation_expression (an_expression, l_target_type, l_dynamic_procedure, an_expression.expression)
					end
				else
						-- This is a built-in conversion.
					l_source_type_set := dynamic_type_set (an_expression.expression)
					if l_source_type_set = Void then
							-- Internal error: the dynamic type set of expressions
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_source_type := l_source_type_set.static_type
						if l_source_type.conforms_to_type (l_target_type, current_system) then
-- TODO: built-in feature with formal generic parameter? Should not be needed with ECMA Eiffel.
							an_expression.expression.process (Current)
						else
							l_convert_feature := type_checker.convert_feature (l_source_type.base_type, l_target_type.base_type)
							if l_convert_feature = Void then
									-- Internal error: no convert feature found.
-- TODO: built-in feature with formal generic parameter? Should not be needed with ECMA Eiffel.
print ("ET_C_GENERATOR.print_convert_expression%N")
								an_expression.expression.process (Current)
							elseif l_convert_feature.is_convert_to then
-- TODO: can we avoid creating this intermediary 'convert_to_expression'?
								create l_convert_to_expression.make (an_expression.expression, l_convert_feature)
								l_convert_to_expression.set_index (an_expression.index)
								print_convert_to_expression (l_convert_to_expression)
							elseif l_convert_feature.is_convert_from then
								l_seed := l_convert_feature.name.seed
								l_dynamic_procedure := l_target_type.seeded_dynamic_procedure (l_seed, current_system)
								if l_dynamic_procedure = Void then
										-- Internal error: there should be a procedure with `l_seed'.
										-- It has been computed in ET_FEATURE_FLATTENER or else an
										-- error should have already been reported.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									print_creation_expression (an_expression, l_target_type, l_dynamic_procedure, an_expression.expression)
								end
							else
									-- Built-in convert feature.
print ("ET_C_GENERATOR.print_convert_expression%N")
-- TODO: built-in feature between basic types? Should not be needed with ECMA Eiffel.
								an_expression.expression.process (Current)
							end
						end
					end
				end
			end
		end

	print_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_qualified_call_expression (an_expression)
		end

	print_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_call: ET_QUALIFIED_CALL
			l_seed: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of the creation
					-- expression should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				l_call := an_expression.creation_call
				if l_call /= Void then
					l_seed := l_call.name.seed
					l_actuals := l_call.arguments
				else
					l_seed := universe.default_create_seed
					l_actuals := Void
				end
				l_dynamic_procedure := l_dynamic_type.seeded_dynamic_procedure (l_seed, current_system)
				if l_dynamic_procedure = Void then
						-- Internal error: there should be a procedure with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_creation_expression (an_expression, l_dynamic_type, l_dynamic_procedure, l_actuals)
				end
			end
		end

	print_creation_expression (an_expression: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE; a_procedure: ET_DYNAMIC_FEATURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print a creation expression.
			-- `an_expression' is the expression which triggers the creation.
			-- It might be a create-expression or a convert-expression.
			-- `a_type' is the type of object to be created, `a_procedure'
			-- is the creation procedure to be used and `an_actuals' are
			-- the arguments to be passed to `a_procedure'.
		require
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
			is_procedure: a_procedure.is_procedure
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_assignment_target: ET_WRITABLE
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			if an_actuals /= Void then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					print_operand (an_actuals.actual_argument (i))
					i := i + 1
				end
			end
			fill_call_operands (nb)
			if in_operand then
				if l_assignment_target /= Void then
					operand_stack.force (l_assignment_target)
					print_indentation
					print_writable (l_assignment_target)
				else
					l_temp := new_temp_variable (a_type)
						-- We will set the index of `l_temp' later because
						-- it could still be used in `call_operands'.
					l_temp_index := an_expression.index
					operand_stack.force (l_temp)
					print_indentation
					print_temp_name (l_temp, current_file)
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
			end
			if not a_procedure.is_generated then
				a_procedure.set_generated (True)
				called_features.force_last (a_procedure)
			end
			print_creation_procedure_name (a_procedure, a_type, current_file)
			current_file.put_character ('(')
			from i := 1 until i > nb loop
				if i /= 1 then
					current_file.put_character (',')
					current_file.put_character (' ')
				end
				l_actual_type_set := dynamic_type_set (call_operands.item (i))
				l_formal_type_set := a_procedure.argument_type_set (i)
				if l_actual_type_set = Void or l_formal_type_set = Void then
						-- Internal error: the dynamic type sets of the actual
						-- and formal arguments should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
				end
				i := i + 1
			end
			current_file.put_character (')')
			if in_operand then
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
			call_operands.wipe_out
			if l_temp_index /= 0 then
					-- We had to wait until this stage to set the index of `l_temp'
					-- because it could have still been used in `call_operands'.
				check l_temp_not_void: l_temp /= Void end
				l_temp.set_index (l_temp_index)
			end
		end

	print_current (an_expression: ET_CURRENT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if current_agent /= Void then
				agent_target.process (Current)
			elseif in_operand then
				operand_stack.force (an_expression)
			elseif in_target then
				if current_type.is_expanded then
					print_current_name (current_file)
				elseif call_target_type.is_expanded and not call_target_type.is_generic then
						-- We need to unbox the object and then pass its address.
					current_file.put_character ('&')
					current_file.put_character ('(')
					print_boxed_attribute_item_access (an_expression, call_target_type, False)
					current_file.put_character (')')
				else
					print_current_name (current_file)
				end
			elseif not current_type.is_expanded then
				print_current_name (current_file)
			else
				current_file.put_character ('*')
				print_current_name (current_file)
			end
		end

	print_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_temp: ET_IDENTIFIER
			l_pointer: BOOLEAN
		do
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				l_pointer := (l_dynamic_type = current_system.pointer_type)
				if not l_pointer then
						-- $Current is of type TYPED_POINTER.
					l_dynamic_type := l_dynamic_type_set.static_type
					l_temp := new_temp_variable (l_dynamic_type)
					l_temp.set_index (an_expression.index)
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_integer (l_dynamic_type.id)
					current_file.put_character (';')
					current_file.put_new_line
					l_queries := l_dynamic_type.queries
					if l_queries.is_empty then
							-- Internal error: TYPED_POINTER should have an attribute
							-- `pointer_item' at first position.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_indentation
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type, False)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
					end
				end
				if l_pointer and in_operand then
						-- $Current is of type POINTER.
					operand_stack.force (an_expression)
				else
					print_type_cast (current_system.pointer_type, current_file)
					current_file.put_character ('(')
					if current_type.is_expanded then
						current_file.put_character ('&')
						print_expression (an_expression.current_keyword)
					else
						l_special_type ?= current_type
						if l_special_type /= Void then
							print_attribute_special_item_access (an_expression.current_keyword, l_special_type, False)
						else
							print_expression (an_expression.current_keyword)
						end
					end
					current_file.put_character (')')
				end
				if not l_pointer then
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_left_type_set: ET_DYNAMIC_TYPE_SET
			l_right_type_set: ET_DYNAMIC_TYPE_SET
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_assignment_target: ET_WRITABLE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			print_operand (an_expression.left)
			print_operand (an_expression.right)
			fill_call_operands (2)
			if in_operand then
				if l_assignment_target /= Void then
					operand_stack.force (l_assignment_target)
					print_indentation
					print_writable (l_assignment_target)
				else
					l_temp := new_temp_variable (current_system.boolean_type)
						-- We will set the index of `l_temp' later because
						-- it could still be used in `call_operands'.
					l_temp_index := an_expression.index
					operand_stack.force (l_temp)
					print_indentation
					print_temp_name (l_temp, current_file)
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
			end
			l_left_type_set := dynamic_type_set (an_expression.left)
			l_right_type_set := dynamic_type_set (an_expression.right)
			if l_left_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression.left'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_right_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression.right'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_left_type_set.static_type.is_expanded /= l_right_type_set.static_type.is_expanded then
				if an_expression.operator.is_not_equal then
					current_file.put_string (c_eif_true)
				else
					current_file.put_string (c_eif_false)
				end
			else
-- TODO: if both types are expanded, check whether they are the same
-- when VWEQ will be removed.
				current_file.put_character ('(')
				print_expression (call_operands.item (1))
				current_file.put_character (')')
				if an_expression.operator.is_not_equal then
					current_file.put_character ('!')
				else
					current_file.put_character ('=')
				end
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
			end
			if in_operand then
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
			call_operands.wipe_out
			if l_temp_index /= 0 then
					-- We had to wait until this stage to set the index of `l_temp'
					-- because it could have still been used in `call_operands'.
				check l_temp_not_void: l_temp /= Void end
				l_temp.set_index (l_temp_index)
			end
		end

	print_expression (an_expression: ET_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			old_in_operand: BOOLEAN
			old_target_type: ET_DYNAMIC_TYPE
		do
			old_in_operand := in_operand
			old_target_type := call_target_type
			in_operand := False
			call_target_type := Void
			an_expression.process (Current)
			call_target_type := old_target_type
			in_operand := old_in_operand
		end

	print_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
-- TODO: TYPED_POINTER vs. POINTER.
				current_file.put_character ('0')
print ("ET_C_GENERATOR.print_expression_address%N")
			end
		end

	print_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			l_temp: ET_IDENTIFIER
		do
			if in_operand then
				if in_target then
					l_temp := new_temp_variable (current_system.boolean_type)
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_false)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
				else
					operand_stack.force (a_constant)
				end
			else
				current_file.put_string (c_eif_false)
			end
		end

	print_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_value_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_pointer: BOOLEAN
			l_name: ET_FEATURE_NAME
			l_name_expression: ET_EXPRESSION
			l_query: ET_DYNAMIC_FEATURE
			l_procedure: ET_DYNAMIC_FEATURE
		do
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				l_pointer := (l_dynamic_type = current_system.pointer_type)
				if not l_pointer then
						-- $feature_name is of type TYPED_POINTER.
					l_dynamic_type := l_dynamic_type_set.static_type
					l_temp := new_temp_variable (l_dynamic_type)
					l_temp.set_index (an_expression.index)
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_integer (l_dynamic_type.id)
					current_file.put_character (';')
					current_file.put_new_line
					l_queries := l_dynamic_type.queries
					if l_queries.is_empty then
							-- Internal error: TYPED_POINTER should have an attribute
							-- `pointer_item' at first position.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_indentation
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type, False)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
					end
				end
				if l_pointer and in_operand then
						-- $feature_name is of type POINTER.
					operand_stack.force (an_expression)
				else
					current_file.put_character ('(')
					l_name := an_expression.name
					if l_name.is_argument then
						l_name_expression := l_name.argument_name
						l_value_type_set := dynamic_type_set (l_name_expression)
						if l_value_type_set = Void then
								-- Internal error: it should have been checked elsewhere that
								-- the current feature is a function.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_value_type_set.is_expanded then
							print_type_cast (current_system.pointer_type, current_file)
							current_file.put_character ('&')
							print_expression (l_name_expression)
						else
							l_special_type := l_value_type_set.special_type
							if l_special_type /= Void then
								current_file.put_character ('(')
								print_expression (l_name_expression)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								current_file.put_character ('(')
								current_file.put_string (c_ge_types)
								current_file.put_character ('[')
								print_attribute_type_id_access (l_name_expression, l_value_type_set.static_type, False)
								current_file.put_character (']')
								current_file.put_character ('.')
								current_file.put_string (c_is_special)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								print_attribute_special_item_access (l_name_expression, l_special_type, False)
								current_file.put_character (':')
								print_type_cast (current_system.pointer_type, current_file)
								print_expression (l_name_expression)
								current_file.put_character (')')
								current_file.put_character (':')
								print_type_cast (current_system.pointer_type, current_file)
								current_file.put_character ('0')
								current_file.put_character (')')
							else
								print_type_cast (current_system.pointer_type, current_file)
								print_expression (l_name_expression)
							end
						end
					elseif l_name.is_local then
						l_name_expression := l_name.local_name
						l_value_type_set := dynamic_type_set (l_name_expression)
						if l_value_type_set = Void then
								-- Internal error: it should have been checked elsewhere that
								-- the current feature is a function.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_value_type_set.is_expanded then
							print_type_cast (current_system.pointer_type, current_file)
							current_file.put_character ('&')
							print_expression (l_name_expression)
						else
							l_special_type := l_value_type_set.special_type
							if l_special_type /= Void then
								current_file.put_character ('(')
								print_expression (l_name_expression)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								current_file.put_character ('(')
								current_file.put_string (c_ge_types)
								current_file.put_character ('[')
								print_attribute_type_id_access (l_name_expression, l_value_type_set.static_type, False)
								current_file.put_character (']')
								current_file.put_character ('.')
								current_file.put_string (c_is_special)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								print_attribute_special_item_access (l_name_expression, l_special_type, False)
								current_file.put_character (':')
								print_type_cast (current_system.pointer_type, current_file)
								print_expression (l_name_expression)
								current_file.put_character (')')
								current_file.put_character (':')
								print_type_cast (current_system.pointer_type, current_file)
								current_file.put_character ('0')
								current_file.put_character (')')
							else
								print_type_cast (current_system.pointer_type, current_file)
								print_expression (l_name_expression)
							end
						end
					else
						l_query := current_type.seeded_dynamic_query (l_name.seed, current_system)
						if l_query /= Void then
							if l_query.is_attribute (current_system) then
								l_value_type_set := l_query.result_type_set
								if l_value_type_set = Void then
										-- Internal error: we know that `l_query' is an attribute.
									set_fatal_error
									error_handler.report_giaaa_error
								elseif l_value_type_set.is_expanded then
									print_type_cast (current_system.pointer_type, current_file)
									current_file.put_character ('&')
									current_file.put_character ('(')
									print_attribute_access (l_query, tokens.current_keyword, current_type, False)
									current_file.put_character (')')
								else
									l_special_type := l_value_type_set.special_type
									if l_special_type /= Void then
										l_temp := new_temp_variable (l_value_type_set.static_type)
										current_file.put_character ('(')
										current_file.put_character ('(')
										print_temp_name (l_temp, current_file)
										current_file.put_character (' ')
										current_file.put_character ('=')
										current_file.put_character (' ')
										print_attribute_access (l_query, tokens.current_keyword, current_type, False)
										current_file.put_character (')')
										current_file.put_character ('?')
										print_type_cast (current_system.pointer_type, current_file)
										current_file.put_character ('(')
										current_file.put_string (c_ge_types)
										current_file.put_character ('[')
										print_attribute_type_id_access (l_temp, l_value_type_set.static_type, False)
										current_file.put_character (']')
										current_file.put_character ('.')
										current_file.put_string (c_is_special)
										current_file.put_character ('?')
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_special_item_access (l_temp, l_special_type, False)
										current_file.put_character (':')
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_access (l_query, tokens.current_keyword, current_type, False)
										current_file.put_character (')')
										current_file.put_character (':')
										print_type_cast (current_system.pointer_type, current_file)
										current_file.put_character ('0')
										current_file.put_character (')')
										mark_temp_variable_free (l_temp)
									else
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_access (l_query, tokens.current_keyword, current_type, False)
									end
								end
							else
								if not l_query.is_generated then
									l_query.set_generated (True)
									called_features.force_last (l_query)
								end
								print_type_cast (current_system.pointer_type, current_file)
								print_routine_name (l_query, current_type, current_file)
							end
						else
							l_procedure := current_type.seeded_dynamic_procedure (l_name.seed, current_system)
							if l_procedure /= Void then
								if not l_procedure.is_generated then
									l_procedure.set_generated (True)
									called_features.force_last (l_procedure)
								end
								print_type_cast (current_system.pointer_type, current_file)
								print_routine_name (l_procedure, current_type, current_file)
							else
									-- Internal error: It has been checked in ET_FEATURE_CHECKER that
									-- we should have either $argument, $local or $feature_name.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
					current_file.put_character (')')
				end
				if not l_pointer then
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_formal_argument (a_name: ET_IDENTIFIER) is
			-- Print formal argument `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_static_type: ET_DYNAMIC_TYPE
			l_seed: INTEGER
		do
			if current_agent /= Void then
				l_seed := a_name.seed
				if l_seed < 1 or l_seed > agent_arguments.count then
						-- Internal error: we know at this stage that the
						-- number of formal and actual aguments is the same.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					agent_arguments.actual_argument (l_seed).process (Current)
				end
			elseif in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_static_type := l_dynamic_type_set.static_type
						if l_static_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							print_argument_name (a_name, current_file)
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (a_name, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_argument_name (a_name, current_file)
						end
					end
				else
					print_argument_name (a_name, current_file)
				end
			end
		end

	print_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			l_literal: STRING
			l_temp: ET_IDENTIFIER
		do
			if in_operand then
				if in_target then
					in_operand := False
					l_literal := a_constant.literal
					inspect l_literal.count
					when 4 then
							-- 0[xX][a-fA-F0-9]{2}
						l_temp := new_temp_variable (current_system.integer_8_type)
					when 6 then
							-- 0[xX][a-fA-F0-9]{4}
						l_temp := new_temp_variable (current_system.integer_16_type)
					when 10 then
							-- 0[xX][a-fA-F0-9]{8}
						l_temp := new_temp_variable (current_system.integer_type)
					when 18 then
							-- 0[xX][a-fA-F0-9]{16}
						l_temp := new_temp_variable (current_system.integer_64_type)
					else
						l_temp := new_temp_variable (current_system.integer_type)
					end
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_hexadecimal_integer_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				l_literal := a_constant.literal
				inspect l_literal.count
				when 4 then
						-- 0[xX][a-fA-F0-9]{2}
					print_type_cast (current_system.integer_8_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_ge_int8)
				when 6 then
						-- 0[xX][a-fA-F0-9]{4}
					print_type_cast (current_system.integer_16_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_ge_int16)
				when 10 then
						-- 0[xX][a-fA-F0-9]{8}
					print_type_cast (current_system.integer_32_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_ge_int32)
				when 18 then
						-- 0[xX][a-fA-F0-9]{16}
					print_type_cast (current_system.integer_64_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_ge_int64)
				else
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_ge_int32)
				end
				current_file.put_character ('(')
				current_file.put_string (l_literal)
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.expression.process (Current)
		end

	print_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_qualified_call_expression (an_expression)
		end

	print_local_variable (a_name: ET_IDENTIFIER) is
			-- Print local variable `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_static_type: ET_DYNAMIC_TYPE
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- local variables should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_static_type := l_dynamic_type_set.static_type
						if l_static_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							print_local_name (a_name, current_file)
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (a_name, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_local_name (a_name, current_file)
						end
					end
				else
					print_local_name (a_name, current_file)
				end
			end
		end

	print_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			i, nb: INTEGER
			l_assignment_target: ET_WRITABLE
			l_int_promoted: BOOLEAN
			l_double_promoted: BOOLEAN
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_static_item_type: ET_DYNAMIC_TYPE
			l_dynamic_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item: ET_EXPRESSION
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				l_queries := l_dynamic_type.queries
				if l_queries.is_empty then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_area_type_set := l_queries.item (1).result_type_set
					if l_area_type_set = Void then
							-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_special_type ?= l_area_type_set.static_type
						if l_special_type = Void then
								-- Internal error: it has already been checked in ET_SYSTEM.compile_kernel
								-- that the attribute `area' is of SPECIAL type.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_static_item_type := l_special_type.item_type_set.static_type
						end
					end
				end
			end
			if l_static_item_type /= Void then
				nb := an_expression.count
				from i := 1 until i > nb loop
					print_operand (an_expression.expression (i))
					i := i + 1
				end
				fill_call_operands (nb)
				if
					l_static_item_type = current_system.boolean_type or
					l_static_item_type = current_system.character_8_type or
					l_static_item_type = current_system.integer_8_type or
					l_static_item_type = current_system.natural_8_type or
					l_static_item_type = current_system.integer_16_type or
					l_static_item_type = current_system.natural_16_type
				then
						-- ISO C 99 says that through "..." the types are promoted to
						-- 'int', and that promotion to 'int' leaves the type unchanged
						-- if all values cannot be represented with an 'int' or
						-- 'unsigned int'.
					l_int_promoted := True
				elseif
					l_static_item_type = current_system.real_type
				then
						-- ISO C 99 says that 'float' is promoted to 'double' when
						-- passed as argument of a function.
					l_double_promoted := True
				end
				manifest_array_types.force_last (l_dynamic_type)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_temp := new_temp_variable (l_dynamic_type)
							-- We will set the index of `l_temp' later because
							-- it could still be used in `call_operands'.
						l_temp_index := an_expression.index
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				current_file.put_string (c_ge_ma)
				current_file.put_integer (l_dynamic_type.id)
				current_file.put_character ('(')
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_integer (nb)
				from i := 1 until i > nb loop
					current_file.put_character (',')
						-- Print one item per line for better readability,
						-- avoidind too long lines for big arrays.
					current_file.put_new_line
					l_item := call_operands.item (i)
					l_dynamic_item_type_set := dynamic_type_set (l_item)
					if l_dynamic_item_type_set = Void then
							-- Internal error: the dynamic type set of each item
							-- should be known at this statge.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_int_promoted then
						current_file.put_character ('(')
						current_file.put_string (c_int)
						current_file.put_character (')')
						current_file.put_character ('(')
						print_attachment_expression (l_item, l_dynamic_item_type_set, l_static_item_type)
						current_file.put_character (')')
					elseif l_double_promoted then
						current_file.put_character ('(')
						current_file.put_string (c_double)
						current_file.put_character (')')
						current_file.put_character ('(')
						print_attachment_expression (l_item, l_dynamic_item_type_set, l_static_item_type)
						current_file.put_character (')')
					else
						print_attachment_expression (l_item, l_dynamic_item_type_set, l_static_item_type)
					end
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
				if l_temp_index /= 0 then
						-- We had to wait until this stage to set the index of `l_temp'
						-- because it could have still been used in `call_operands'.
					check l_temp_not_void: l_temp /= Void end
					l_temp.set_index (l_temp_index)
				end
			end
		end

	print_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			i, nb: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_assignment_target: ET_WRITABLE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item: ET_EXPRESSION
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_tuple_type ?= l_dynamic_type_set.static_type
				if l_tuple_type = Void then
						-- Internal error: the dynamic type of `an_expression'
						-- should be a Tuple_type.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
			if l_tuple_type /= Void then
				nb := an_expression.count
				manifest_tuple_types.force_last (l_tuple_type)
				if in_operand then
					from i := 1 until i > nb loop
						print_operand (an_expression.expression (i))
						i := i + 1
					end
					fill_call_operands (nb)
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_temp := new_temp_variable (l_tuple_type)
							-- We will set the index of `l_temp' later because
							-- it could still be used in `call_operands'.
						l_temp_index := an_expression.index
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				current_file.put_string (c_ge_mt)
				current_file.put_integer (l_tuple_type.id)
				current_file.put_character ('(')
				from i := 1 until i > nb loop
					if i /= 1 then
						current_file.put_character (',')
					end
					if in_operand then
						l_item := call_operands.item (i)
					else
						l_item := an_expression.expression (i)
					end
					l_item_type_set := dynamic_type_set (l_item)
					if l_item_type_set = Void then
							-- Internal error: the dynamic type set of each item
							-- should be known at this statge.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_attachment_expression (l_item, l_item_type_set, l_item_type_set.static_type)
					end
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
					call_operands.wipe_out
					if l_temp_index /= 0 then
							-- We had to wait until this stage to set the index of `l_temp'
							-- because it could have still been used in `call_operands'.
						check l_temp_not_void: l_temp /= Void end
						l_temp.set_index (l_temp_index)
					end
				end
			end
		end

	print_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_meta_type: ET_DYNAMIC_TYPE
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
				l_type := current_system.dynamic_type (an_expression.type, current_type.base_type)
				l_meta_type := l_type.meta_type
				if l_meta_type = Void then
						-- Internal error: the meta type of this type should have been
						-- computed. It is nothing else than the type of this manifest
						-- type expression.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					current_file.put_character ('(')
					current_file.put_character ('(')
					print_type_declaration (l_meta_type, current_file)
					current_file.put_character (')')
					current_file.put_character ('&')
					current_file.put_character ('(')
					current_file.put_string (c_ge_types)
					current_file.put_character ('[')
					current_file.put_integer (l_type.id)
					current_file.put_character (']')
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_non_void_expression (an_expression: ET_EXPRESSION; a_check_void: BOOLEAN) is
			-- Print `an_expression' which needs to be non-void.
			-- The static type (i.e. declared type) of `an_expression' is assumed to be of reference type.
			-- Useful for example when we want to get access to an attribute of this object.
			-- `a_check_void' means that we do need to check whether it is actually Void or not.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_do_check_void: BOOLEAN
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_check_void then
				l_dynamic_type_set := dynamic_type_set (an_expression)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type set of expressions
						-- should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_dynamic_type_set.is_empty or not l_dynamic_type_set.is_never_void then
					can_be_void_target_count := can_be_void_target_count + 1
					current_file.put_string (c_ge_void)
					current_file.put_character ('(')
					l_do_check_void := True
				else
					never_void_target_count := never_void_target_count + 1
				end
			end
			print_expression (an_expression)
			if l_do_check_void then
				current_file.put_character (')')
			end
		end

	print_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_old_expression%N")
			an_expression.expression.process (Current)
		end

	print_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
				inline_constants.force_last (an_expression)
				print_inline_constant_name (an_expression, current_file)
			end
		end

	print_operand (an_operand: ET_EXPRESSION) is
			-- Print `an_operand'.
		require
			an_operand_not_void: an_operand /= Void
		local
			old_in_operand: BOOLEAN
			old_target_type: ET_DYNAMIC_TYPE
		do
			old_in_operand := in_operand
			old_target_type := call_target_type
			in_operand := True
			call_target_type := Void
			an_operand.process (Current)
			call_target_type := old_target_type
			in_operand := old_in_operand
		end

	print_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.expression.process (Current)
		end

	print_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_query: ET_QUERY
			l_parent_type, l_ancestor: ET_BASE_TYPE
			l_class: ET_CLASS
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_current_class: ET_CLASS
			l_class_impl: ET_CLASS
			l_dynamic_precursor: ET_DYNAMIC_PRECURSOR
			l_parent_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_comma: BOOLEAN
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_assignment_target: ET_WRITABLE
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			had_error: BOOLEAN
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_actuals := an_expression.arguments
			if l_actuals /= Void then
				nb := l_actuals.count
				from i := 1 until i > nb loop
					print_operand (l_actuals.actual_argument (i))
					i := i + 1
				end
			end
			fill_call_operands (nb)
			l_parent_type := an_expression.parent_type
			if l_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				had_error := has_fatal_error
				has_fatal_error := False
				if l_parent_type.is_generic then
					l_current_class := current_type.base_class
					l_class_impl := current_feature.static_feature.implementation_class
					if l_current_class /= l_class_impl then
							-- Resolve generic parameters in the context of `current_type'.
						l_current_class.process (universe.ancestor_builder)
						if not l_current_class.ancestors_built or else l_current_class.has_ancestors_error then
								-- 'ancestor_builder' should already have been executed
								-- on `l_current_class' at this stage, and any error
								-- should already heve been reported.
							set_fatal_error
						else
							l_ancestor := l_current_class.ancestor (l_parent_type, universe)
							if l_ancestor = Void then
									-- Internal error: `l_parent_type' is an ancestor
									-- of `l_class_impl', and hence of `l_current_class'.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_parent_type := l_ancestor
							end
						end
					end
				end
				if not has_fatal_error then
					has_fatal_error := had_error
					l_precursor_keyword := an_expression.precursor_keyword
					l_class := l_parent_type.direct_base_class (universe)
					l_query := l_class.seeded_query (l_precursor_keyword.seed)
					if l_query = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `l_class_impl'.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						if in_operand then
							if l_assignment_target /= Void then
								operand_stack.force (l_assignment_target)
								print_indentation
								print_writable (l_assignment_target)
							else
								l_dynamic_type_set := dynamic_type_set (an_expression)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type set of `an_expression'
										-- should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_dynamic_type := l_dynamic_type_set.static_type
									l_temp := new_temp_variable (l_dynamic_type)
										-- We will set the index of `l_temp' later because
										-- it could still be used in `call_operands'.
									l_temp_index := an_expression.index
									operand_stack.force (l_temp)
									print_indentation
									print_temp_name (l_temp, current_file)
								end
							end
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('(')
						end
						l_parent_dynamic_type := current_system.dynamic_type (l_parent_type, current_type.base_type)
						l_dynamic_precursor := current_feature.dynamic_precursor (l_query, l_parent_dynamic_type, current_system)
						if not l_dynamic_precursor.is_generated then
							l_dynamic_precursor.set_generated (True)
							called_features.force_last (l_dynamic_precursor)
						end
						if l_dynamic_precursor.is_static then
							print_static_routine_name (l_dynamic_precursor, current_type, current_file)
							current_file.put_character ('(')
						else
							print_routine_name (l_dynamic_precursor, current_type, current_file)
							current_file.put_character ('(')
							print_current_name (current_file)
							l_comma := True
						end
						from i := 1 until i > nb loop
							if l_comma then
								current_file.put_character (',')
								current_file.put_character (' ')
							else
								l_comma := True
							end
							l_actual_type_set := dynamic_type_set (call_operands.item (i))
							l_formal_type_set := l_dynamic_precursor.argument_type_set (i)
							if l_actual_type_set = Void or l_formal_type_set = Void then
									-- Internal error: the dynamic type sets of the actual
									-- and formal arguments should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
							end
							i := i + 1
						end
						current_file.put_character (')')
						if in_operand then
							current_file.put_character (')')
							current_file.put_character (';')
							current_file.put_new_line
						end
					end
				end
			end
			call_operands.wipe_out
			if l_temp_index /= 0 then
					-- We had to wait until this stage to set the index of `l_temp'
					-- because it could have still been used in `call_operands'.
				check l_temp_not_void: l_temp /= Void end
				l_temp.set_index (l_temp_index)
			end
		end

	print_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_qualified_call_expression (an_expression)
		end

	print_qualified_call_expression (a_call: ET_FEATURE_CALL_EXPRESSION) is
			-- Print qualified call expression.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
		local
			l_name: ET_CALL_NAME
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_query: ET_QUERY
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_dynamic_type: ET_DYNAMIC_TYPE
			l_target_static_type: ET_DYNAMIC_TYPE
			nb2: INTEGER
			l_call_type_set: ET_DYNAMIC_TYPE_SET
			l_call_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_temp_target: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
			l_semistrict_target: ET_WRITABLE
			l_implies: BOOLEAN
			l_or: BOOLEAN
			l_printed: BOOLEAN
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_manifest_tuple_operand: ET_MANIFEST_TUPLE
			l_target_operand: ET_EXPRESSION
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_target := a_call.target
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_target_type_set := dynamic_type_set (l_target)
			l_call_type_set := dynamic_type_set (a_call)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_call_type_set = Void then
					-- Internal error: the dynamic type set of `a_call'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_call_type := l_call_type_set.static_type
				l_target_static_type := l_target_type_set.static_type
				if
					l_target_static_type = current_system.boolean_type and in_operand and then
					(l_name.is_infix_and_then or l_name.is_infix_or_else or l_name.is_infix_implies or
					l_name.is_infix_and or l_name.is_infix_or)
				then
					print_operand (l_target)
					fill_call_operands (1)
					if l_actuals = Void or else l_actuals.count /= 1 then
							-- Internal error: these semistrict operators
							-- have exactly one argument. This is guaranteed
							-- by the fact that they are infix features.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						l_or := l_name.is_infix_or_else or l_name.is_infix_or
						if l_or then
							current_file.put_character ('!')
							current_file.put_character ('(')
						end
						print_expression (call_operands.first)
						if l_or then
							current_file.put_character (')')
						end
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						if l_assignment_target /= Void then
							l_semistrict_target := l_assignment_target
							l_temp ?= l_assignment_target
							if l_temp /= Void and then not l_temp.is_temporary then
								l_temp := Void
							end
						else
							l_temp_target ?= call_operands.first
							if l_temp_target = Void or else not l_temp_target.is_temporary then
								l_temp_target := Void
								l_temp := new_temp_variable (l_target_static_type)
									-- We will set the index of `l_temp' later because
									-- it could still be used in `call_operands'.
								l_temp_index := call_operands.first.index
							else
								l_temp := l_temp_target
								mark_temp_variable_used (l_temp)
							end
							l_semistrict_target := l_temp
						end
						call_operands.wipe_out
						assignment_target := l_semistrict_target
						print_operand (l_actuals.actual_argument (1))
						assignment_target := Void
						fill_call_operands (1)
						if call_operands.first /= l_semistrict_target then
							print_indentation
							print_writable (l_semistrict_target)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_expression (call_operands.first)
							current_file.put_character (')')
							current_file.put_character (';')
							current_file.put_new_line
						elseif l_semistrict_target = l_temp then
							mark_temp_variable_used (l_temp)
						end
						dedent
						print_indentation
						current_file.put_character ('}')
						l_implies := l_name.is_infix_implies
						if not l_implies and l_semistrict_target = l_temp_target then
							current_file.put_new_line
						else
							current_file.put_character (' ')
							current_file.put_string (c_else)
							current_file.put_character (' ')
							current_file.put_character ('{')
							current_file.put_new_line
							indent
							print_indentation
							print_writable (l_semistrict_target)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							if l_or or l_implies then
								current_file.put_string (c_eif_true)
							else
								current_file.put_string (c_eif_false)
							end
							current_file.put_character (';')
							current_file.put_new_line
							dedent
							print_indentation
							current_file.put_character ('}')
							current_file.put_new_line
						end
						operand_stack.force (l_semistrict_target)
					end
				else
					l_seed := l_name.seed
						-- Check whether this a call to FUNCTION.item with a manifest
						-- tuple as argument. We have a special treatment in that case
						-- to avoid having to create the manifest tuple when possible.
					if not a_call.is_tuple_label and then l_seed = universe.function_item_seed then
						if l_actuals /= Void and then l_actuals.count = 1 then
							l_manifest_tuple ?= l_actuals.actual_argument (1)
							if l_manifest_tuple /= Void then
								print_target_operand (l_target, l_target_static_type)
								nb := l_manifest_tuple.count
								from i := 1 until i > nb loop
									print_operand (l_manifest_tuple.expression (i))
									i := i + 1
								end
								nb := nb + 1
								fill_call_operands (nb)
								l_manifest_tuple_operand := agent_manifest_tuple
								l_manifest_tuple_operand.resize (nb - 1)
								from i := nb until i < 2 loop
									l_manifest_tuple_operand.put_first (call_operands.item (i))
									i := i - 1
								end
								l_manifest_tuple_operand.set_index (l_manifest_tuple.index)
								mark_expressions_frozen (l_manifest_tuple_operand)
								l_target_operand := call_operands.first
								call_operands.wipe_out
								call_operands.put_last (l_target_operand)
								call_operands.put_last (l_manifest_tuple_operand)
								nb := 2
							end
						end
					end
					if l_manifest_tuple_operand = Void then
						print_target_operand (l_target, l_target_static_type)
						if l_actuals /= Void then
							nb := l_actuals.count
							from i := 1 until i > nb loop
								print_operand (l_actuals.actual_argument (i))
								i := i + 1
							end
						end
						nb := nb + 1
						fill_call_operands (nb)
					end
					if in_operand then
						if l_assignment_target /= Void then
							operand_stack.force (l_assignment_target)
							print_indentation
							print_writable (l_assignment_target)
						else
							l_temp := new_temp_variable (l_call_type)
								-- We will set the index of `l_temp' later because
								-- it could still be used in `call_operands'.
							l_temp_index := a_call.index
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
					end
					nb2 := l_target_type_set.count
					if nb2 = 0 then
							-- Call on Void target.
						current_file.put_character ('(')
						print_target_expression (call_operands.first, l_target_static_type, True)
						from i := 2 until i > nb loop
							current_file.put_character (',')
							current_file.put_character (' ')
							print_expression (call_operands.item (i))
							i := i + 1
						end
						current_file.put_character (',')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_type_declaration (l_call_type, current_file)
						current_file.put_character (')')
						print_default_entity_value (l_call_type, current_file)
						current_file.put_character (')')
					elseif nb2 = 1 then
							-- Static binding.
						l_target_dynamic_type := l_target_type_set.dynamic_type (1)
						print_adapted_named_query_call (l_name, l_target_dynamic_type, l_call_type, True)
					else
							-- Dynamic binding.
						if l_name.is_tuple_label then
-- TODO: fields in Tuples are not necessarily aligned, and some need (un)boxing,
-- for example:
--    t1: TUPLE [a: ANY; b: INTEGER]
--    t2: TUPLE [a: INTEGER_64; b: INTEGER]
--    t1 := t2
--    any := t1.a
--    int := t1.b
-- But when there are aligned with no (un)boxing, we should avoid having polymorphic call.s
						else
							l_query := l_target_static_type.base_class.seeded_query (l_seed)
							if l_query = Void then
									-- Internal error: there should be a query with `a_seed'.
									-- It has been computed in ET_FEATURE_CHECKER.
								set_fatal_error
								error_handler.report_giaaa_error
								l_printed := True
							else
								if l_query.is_constant_attribute then
									l_target_dynamic_type := l_target_type_set.dynamic_type (1)
									print_adapted_named_query_call (l_name, l_target_dynamic_type, l_call_type, True)
									l_printed := True
								elseif l_query.is_unique_attribute then
									l_target_dynamic_type := l_target_type_set.dynamic_type (1)
									print_adapted_named_query_call (l_name, l_target_dynamic_type, l_call_type, True)
									l_printed := True
								end
							end
						end
						if not l_printed then
							if nb2 = 2 then
									-- First type.
								l_target_dynamic_type := l_target_type_set.dynamic_type (1)
								current_file.put_character ('(')
								current_file.put_character ('(')
								print_attribute_type_id_access (call_operands.first, l_target_static_type, True)
								current_file.put_character ('=')
								current_file.put_character ('=')
								current_file.put_integer (l_target_dynamic_type.id)
								current_file.put_character (')')
								current_file.put_character ('?')
								print_adapted_named_query_call (l_name, l_target_dynamic_type, l_call_type, False)
								current_file.put_character (':')
									-- Second type.
								l_target_dynamic_type := l_target_type_set.dynamic_type (2)
								print_adapted_named_query_call (l_name, l_target_dynamic_type, l_call_type, False)
								current_file.put_character (')')
							else
								print_call_name (a_call, current_feature, l_target_static_type, current_file)
								current_file.put_character ('(')
								print_target_expression (call_operands.first, l_target_static_type, True)
								if l_manifest_tuple_operand /= Void then
									nb := l_manifest_tuple_operand.count
									from i := 1 until i > nb loop
										current_file.put_character (',')
										current_file.put_character (' ')
										print_expression (l_manifest_tuple_operand.expression (i))
										i := i + 1
									end
								else
									from i := 2 until i > nb loop
										current_file.put_character (',')
										current_file.put_character (' ')
										print_expression (call_operands.item (i))
										i := i + 1
									end
								end
								current_file.put_character (')')
							end
						end
					end
					if in_operand then
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					end
				end
			end
			call_operands.wipe_out
			if l_manifest_tuple_operand /= Void then
				mark_expressions_unfrozen (l_manifest_tuple_operand)
				l_manifest_tuple_operand.wipe_out
			end
			if l_temp_index /= 0 then
					-- We had to wait until this stage to set the index of `l_temp'
					-- because it could have still been used in `call_operands'.
				check l_temp_not_void: l_temp /= Void end
				l_temp.set_index (l_temp_index)
			end
		end

	print_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Check validity of `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			i, nb: INTEGER
			l_literal: STRING
			l_negative: BOOLEAN
			l_buffer: STRING
			l_temp: ET_IDENTIFIER
			l_type: ET_CLASS_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_any: ET_CLASS
		do
			l_any := universe.any_class
			if in_operand then
				if in_target then
					in_operand := False
					l_type := a_constant.type
					if l_type /= Void then
						l_temp := new_temp_variable (current_system.dynamic_type (l_type, l_any))
					else
						l_temp := new_temp_variable (current_system.integer_type)
					end
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_regular_integer_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				l_type := a_constant.type
				if l_type /= Void then
					l_dynamic_type := current_system.dynamic_type (l_type, l_any)
				else
					l_dynamic_type := current_system.integer_type
				end
				print_type_cast (l_dynamic_type, current_file)
				current_file.put_character ('(')
				if l_dynamic_type = current_system.integer_8_type then
					current_file.put_string (c_ge_int8)
				elseif l_dynamic_type = current_system.integer_16_type then
					current_file.put_string (c_ge_int16)
				elseif l_dynamic_type = current_system.integer_32_type then
					current_file.put_string (c_ge_int32)
				elseif l_dynamic_type = current_system.integer_64_type then
					current_file.put_string (c_ge_int64)
				elseif l_dynamic_type = current_system.natural_8_type then
					current_file.put_string (c_ge_nat8)
				elseif l_dynamic_type = current_system.natural_16_type then
					current_file.put_string (c_ge_nat16)
				elseif l_dynamic_type = current_system.natural_32_type then
					current_file.put_string (c_ge_nat32)
				elseif l_dynamic_type = current_system.natural_64_type then
					current_file.put_string (c_ge_nat64)
				elseif l_dynamic_type = current_system.natural_type then
					current_file.put_string (c_ge_nat32)
				else
					current_file.put_string (c_ge_int32)
				end
				current_file.put_character ('(')
				if a_constant.is_negative then
					current_file.put_character ('-')
					l_negative := True
				end
				l_literal := a_constant.literal
				nb := l_literal.count
					-- Remove leading zeros.
				from
					i := 1
				until
					i > nb or else l_literal.item (i) /= '0'
				loop
					i := i + 1
				end
				if i > nb then
					current_file.put_character ('0')
					current_file.put_character (')')
				else
					if l_negative and (nb - i + 1) >= 10 then
						create l_buffer.make (nb - i + 1)
						from until i > nb loop
							l_buffer.append_character (l_literal.item (i))
							i := i + 1
						end
						if l_buffer.is_equal ("2147483648") then
								-- INTEGER.Min_value.
							current_file.put_string ("2147483647)-1")
						elseif l_buffer.is_equal ("9223372036854775808") then
								-- INTEGER_64.Min_value.
							current_file.put_string ("9223372036854775807)-1")
						else
							current_file.put_string (l_buffer)
							current_file.put_character (')')
						end
					else
						from until i > nb loop
							current_file.put_character (l_literal.item (i))
							i := i + 1
						end
						current_file.put_character (')')
					end
				end
				current_file.put_character (')')
			end
		end

	print_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_string: STRING
		do
			if in_operand then
				operand_stack.force (a_string)
			else
				l_string := a_string.value
				current_file.put_string (c_ge_ms)
				current_file.put_character ('(')
				print_escaped_string (l_string)
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_integer (l_string.count)
				current_file.put_character (')')
			end
		end

	print_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			l_temp: ET_IDENTIFIER
			l_type: ET_CLASS_TYPE
			l_any: ET_CLASS
		do
			l_any := universe.any_class
			if in_operand then
				if in_target then
					in_operand := False
					l_type := a_constant.type
					if l_type /= Void then
						l_temp := new_temp_variable (current_system.dynamic_type (l_type, l_any))
					else
						l_temp := new_temp_variable (current_system.double_type)
					end
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_regular_real_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				l_type := a_constant.type
				if l_type /= Void then
					print_type_cast (current_system.dynamic_type (l_type, l_any), current_file)
				else
					print_type_cast (current_system.real_64_type, current_file)
				end
				current_file.put_character ('(')
				if a_constant.is_negative then
					current_file.put_character ('-')
				end
				current_file.put_string (a_constant.literal)
				current_file.put_character (')')
			end
		end

	print_result (an_expression: ET_RESULT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_static_type: ET_DYNAMIC_TYPE
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
				if in_target then
					l_dynamic_type_set := dynamic_type_set (an_expression)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- 'Result' should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_static_type := l_dynamic_type_set.static_type
						if l_static_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							print_result_name (current_file)
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (an_expression, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_result_name (current_file)
						end
					end
				else
					print_result_name (current_file)
				end
			end
		end

	print_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_pointer: BOOLEAN
		do
			l_dynamic_type_set := dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				l_pointer := (l_dynamic_type = current_system.pointer_type)
				if not l_pointer then
						-- $Result is of type TYPED_POINTER.
					l_dynamic_type := l_dynamic_type_set.static_type
					l_temp := new_temp_variable (l_dynamic_type)
					l_temp.set_index (an_expression.index)
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_integer (l_dynamic_type.id)
					current_file.put_character (';')
					current_file.put_new_line
					l_queries := l_dynamic_type.queries
					if l_queries.is_empty then
							-- Internal error: TYPED_POINTER should have an attribute
							-- `pointer_item' at first position.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_indentation
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type, False)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
					end
				end
				if l_pointer and in_operand then
						-- $Result is of type POINTER.
					operand_stack.force (an_expression)
				else
					current_file.put_character ('(')
					l_result_type_set := current_feature.result_type_set
					if l_result_type_set = Void then
							-- Internal error: it should have been checked elsewhere that
							-- the current feature is a function.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_result_type_set.is_expanded then
						print_type_cast (current_system.pointer_type, current_file)
						current_file.put_character ('&')
						print_result_name (current_file)
					else
						l_special_type := l_result_type_set.special_type
						if l_special_type /= Void then
							current_file.put_character ('(')
							print_result_name (current_file)
							current_file.put_character ('?')
							print_type_cast (current_system.pointer_type, current_file)
							current_file.put_character ('(')
							current_file.put_string (c_ge_types)
							current_file.put_character ('[')
							print_attribute_type_id_access (tokens.result_keyword, l_result_type_set.static_type, False)
							current_file.put_character (']')
							current_file.put_character ('.')
							current_file.put_string (c_is_special)
							current_file.put_character ('?')
							print_type_cast (current_system.pointer_type, current_file)
							print_attribute_special_item_access (an_expression.result_keyword, l_special_type, False)
							current_file.put_character (':')
							print_type_cast (current_system.pointer_type, current_file)
							print_result_name (current_file)
							current_file.put_character (')')
							current_file.put_character (':')
							print_type_cast (current_system.pointer_type, current_file)
							current_file.put_character ('0')
							current_file.put_character (')')
						else
							print_type_cast (current_system.pointer_type, current_file)
							print_result_name (current_file)
						end
					end
					current_file.put_character (')')
				end
				if not l_pointer then
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_string: STRING
		do
			if in_operand then
				operand_stack.force (a_string)
			else
				l_string := a_string.value
				current_file.put_string (c_ge_ms)
				current_file.put_character ('(')
				print_escaped_string (l_string)
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_integer (l_string.count)
				current_file.put_character (')')
			end
		end

	print_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_target_type: ET_DYNAMIC_TYPE
			l_query: ET_QUERY
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_seed: INTEGER
			i, nb: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_assignment_target: ET_WRITABLE
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
			had_error: BOOLEAN
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_type := an_expression.type
			had_error := has_fatal_error
			l_resolved_type := resolved_formal_parameters (l_type)
			if not has_fatal_error then
				has_fatal_error := had_error
				l_actuals := an_expression.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						print_operand (l_actuals.actual_argument (i))
						i := i + 1
					end
				end
				fill_call_operands (nb)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_dynamic_type_set := dynamic_type_set (an_expression)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of `an_expression'
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type := l_dynamic_type_set.static_type
							l_temp := new_temp_variable (l_dynamic_type)
								-- We will set the index of `l_temp' later because
								-- it could still be used in `call_operands'.
							l_temp_index := an_expression.index
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
				end
				l_target_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
				l_seed := an_expression.name.seed
				l_query := l_target_type.base_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: there should be a query with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_query.is_attribute then
						-- Internal error: no object available.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_query.is_constant_attribute then
-- TODO: make the difference between expanded and reference "constants".
					l_constant_attribute ?= l_query
					if l_constant_attribute = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_expression (l_constant_attribute.constant)
					end
				elseif l_query.is_unique_attribute then
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
						-- In the current implementation unique values is based on
						-- the id of the implementation feature (the feature in the
						-- class where this unique attribute has been written). For
						-- synonyms the fetaure id is in the reverse order, hence the
						-- arithmetic below.
					current_file.put_integer (universe.feature_count - l_query.implementation_feature.id + 1)
					current_file.put_character (')')
				else
					l_dynamic_feature := l_target_type.dynamic_query (l_query, current_system)
					if not l_dynamic_feature.is_generated then
						l_dynamic_feature.set_generated (True)
						called_features.force_last (l_dynamic_feature)
					end
					print_static_routine_name (l_dynamic_feature, l_target_type, current_file)
					current_file.put_character ('(')
					from i := 1 until i > nb loop
						if i /= 1 then
							current_file.put_character (',')
							current_file.put_character (' ')
						end
						l_actual_type_set := dynamic_type_set (call_operands.item (i))
						l_formal_type_set := l_dynamic_feature.argument_type_set (i)
						if l_actual_type_set = Void or l_formal_type_set = Void then
								-- Internal error: the dynamic type sets of the actual
								-- and formal arguments should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
						end
						i := i + 1
					end
					current_file.put_character (')')
				end
				if in_operand then
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
				if l_temp_index /= 0 then
						-- We had to wait until this stage to set the index of `l_temp'
						-- because it could have still been used in `call_operands'.
					check l_temp_not_void: l_temp /= Void end
					l_temp.set_index (l_temp_index)
				end
			end
		end

	print_target_expression (an_expression: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print `an_expression' when appearing as the target of a call.
			-- `a_target_type' is one of the possible dynamic types of `an_expression'.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
		require
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			old_in_operand: BOOLEAN
			old_target_type: ET_DYNAMIC_TYPE
			old_target_check_void: BOOLEAN
			l_do_check_void_target: BOOLEAN
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_check_void_target then
				l_dynamic_type_set := dynamic_type_set (an_expression)
				if l_dynamic_type_set = Void then
						-- Internal error: the dynamic type set of expressions
						-- should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_dynamic_type_set.is_empty or not l_dynamic_type_set.is_never_void then
					can_be_void_target_count := can_be_void_target_count + 1
					current_file.put_string (c_ge_void)
					current_file.put_character ('(')
					l_do_check_void_target := True
				else
					never_void_target_count := never_void_target_count + 1
				end
			end
			old_in_operand := in_operand
			old_target_type := call_target_type
			old_target_check_void := call_target_check_void
			in_operand := False
			call_target_type := a_target_type
			call_target_check_void := a_check_void_target
			an_expression.process (Current)
			call_target_type := old_target_type
			call_target_check_void := old_target_check_void
			in_operand := old_in_operand
			if l_do_check_void_target then
				current_file.put_character (')')
			end
		end

	print_target_operand (an_operand: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE) is
			-- Print `an_operand' when appearing as the target of a call.
			-- `a_target_type' is one of the possible dynamic types of `an_operand'.
		require
			an_operand_not_void: an_operand /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			old_in_operand: BOOLEAN
			old_target_type: ET_DYNAMIC_TYPE
		do
			old_in_operand := in_operand
			old_target_type := call_target_type
			in_operand := True
			call_target_type := a_target_type
			an_operand.process (Current)
			call_target_type := old_target_type
			in_operand := old_in_operand
		end

	print_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
-- TODO.
print ("ET_C_GENERATOR.print_strip_expression%N")
				current_file.put_string (c_eif_void)
			end
		end

	print_temporary_variable (a_name: ET_IDENTIFIER) is
			-- Print temporary variable `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_temporary: a_name.is_temporary
		local
			l_seed: INTEGER
			l_static_type: ET_DYNAMIC_TYPE
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_seed := a_name.seed
					l_static_type := used_temp_variables.item (l_seed)
					if l_static_type = Void then
						l_static_type := free_temp_variables.item (l_seed)
					end
					if l_static_type = Void then
							-- Internal error: the type set of temporary
							-- variables should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_static_type.is_expanded then
							-- Pass the address of the expanded object.
						current_file.put_character ('&')
						print_temp_name (a_name, current_file)
					elseif call_target_type.is_expanded and not call_target_type.is_generic then
							-- We need to unbox the object and then pass its address.
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_boxed_attribute_item_access (a_name, call_target_type, call_target_check_void)
						current_file.put_character (')')
					else
						print_temp_name (a_name, current_file)
					end
				else
					print_temp_name (a_name, current_file)
				end
			end
		end

	print_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			l_temp: ET_IDENTIFIER
		do
			if in_operand then
				if in_target then
					l_temp := new_temp_variable (current_system.boolean_type)
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_true)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
				else
					operand_stack.force (a_constant)
				end
			else
				current_file.put_string (c_eif_true)
			end
		end

	print_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			i, nb: INTEGER
			l_literal: STRING
			l_negative: BOOLEAN
			l_buffer: STRING
			l_temp: ET_IDENTIFIER
			l_type: ET_CLASS_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_any: ET_CLASS
		do
			l_any := universe.any_class
			if in_operand then
				if in_target then
					in_operand := False
					l_type := a_constant.type
					if l_type /= Void then
						l_temp := new_temp_variable (current_system.dynamic_type (l_type, l_any))
					else
						l_temp := new_temp_variable (current_system.integer_type)
					end
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_underscored_integer_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				l_type := a_constant.type
				if l_type /= Void then
					l_dynamic_type := current_system.dynamic_type (l_type, l_any)
				else
					l_dynamic_type := current_system.integer_type
				end
				print_type_cast (l_dynamic_type, current_file)
				current_file.put_character ('(')
				if l_dynamic_type = current_system.integer_8_type then
					current_file.put_string (c_ge_int8)
				elseif l_dynamic_type = current_system.integer_16_type then
					current_file.put_string (c_ge_int16)
				elseif l_dynamic_type = current_system.integer_32_type then
					current_file.put_string (c_ge_int32)
				elseif l_dynamic_type = current_system.integer_64_type then
					current_file.put_string (c_ge_int64)
				elseif l_dynamic_type = current_system.natural_8_type then
					current_file.put_string (c_ge_nat8)
				elseif l_dynamic_type = current_system.natural_16_type then
					current_file.put_string (c_ge_nat16)
				elseif l_dynamic_type = current_system.natural_32_type then
					current_file.put_string (c_ge_nat32)
				elseif l_dynamic_type = current_system.natural_64_type then
					current_file.put_string (c_ge_nat64)
				elseif l_dynamic_type = current_system.natural_type then
					current_file.put_string (c_ge_nat32)
				else
					current_file.put_string (c_ge_int32)
				end
				current_file.put_character ('(')
				if a_constant.is_negative then
					current_file.put_character ('-')
					l_negative := True
				end
				l_literal := a_constant.literal
				nb := l_literal.count
					-- Remove leading zeros.
				from
					i := 1
				until
					i > nb or else (l_literal.item (i) /= '0' and l_literal.item (i) /= '_')
				loop
					i := i + 1
				end
				if i > nb then
					current_file.put_character ('0')
					current_file.put_character (')')
				else
					if l_negative and (nb - i + 1) >= 10 then
						create l_buffer.make (nb - i + 1)
						from until i > nb loop
							if l_literal.item (i) /= '_' then
								l_buffer.append_character (l_literal.item (i))
							end
							i := i + 1
						end
						if l_buffer.is_equal ("2147483648") then
								-- INTEGER.Min_value.
							current_file.put_string ("2147483647)-1")
						elseif l_buffer.is_equal ("9223372036854775808") then
								-- INTEGER_64.Min_value.
							current_file.put_string ("9223372036854775807)-1")
						else
							current_file.put_string (l_buffer)
							current_file.put_character (')')
						end
					else
						from until i > nb loop
							if l_literal.item (i) /= '_' then
								current_file.put_character (l_literal.item (i))
							end
							i := i + 1
						end
						current_file.put_character (')')
					end
				end
				current_file.put_character (')')
			end
		end

	print_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			i, nb: INTEGER
			l_literal: STRING
			l_temp: ET_IDENTIFIER
			l_type: ET_CLASS_TYPE
			l_any: ET_CLASS
		do
			l_any := universe.any_class
			if in_operand then
				if in_target then
					in_operand := False
					l_type := a_constant.type
					if l_type /= Void then
						l_temp := new_temp_variable (current_system.dynamic_type (l_type, l_any))
					else
						l_temp := new_temp_variable (current_system.double_type)
					end
					print_indentation
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_underscored_real_constant (a_constant)
					current_file.put_character (';')
					current_file.put_new_line
					l_temp.set_index (a_constant.index)
					operand_stack.force (l_temp)
					in_operand := True
				else
					operand_stack.force (a_constant)
				end
			else
				l_type := a_constant.type
				if l_type /= Void then
					print_type_cast (current_system.dynamic_type (l_type, l_any), current_file)
				else
					print_type_cast (current_system.real_64_type, current_file)
				end
				current_file.put_character ('(')
				if a_constant.is_negative then
					current_file.put_character ('-')
				end
				l_literal := a_constant.literal
				nb := l_literal.count
				from i := 1 until i > nb loop
					if l_literal.item (i) /= '_' then
						current_file.put_character (l_literal.item (i))
					end
					i := i + 1
				end
				current_file.put_character (')')
			end
		end

	print_unqualified_call_expression (a_call: ET_FEATURE_CALL_EXPRESSION) is
			-- Print unqualified call expression.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
		local
			l_actuals: ET_ACTUAL_ARGUMENTS
			i, nb: INTEGER
			l_call_type_set: ET_DYNAMIC_TYPE_SET
			l_call_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			l_assignment_target: ET_WRITABLE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
			l_old_call_target: ET_EXPRESSION
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_manifest_tuple_operand: ET_MANIFEST_TUPLE
			l_target_operand: ET_EXPRESSION
			l_seed: INTEGER
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_call_type_set := dynamic_type_set (a_call)
			l_dynamic_feature := current_type.seeded_dynamic_query (a_call.name.seed, current_system)
			if l_call_type_set = Void then
					-- Internal error: the dynamic type set of `a_call'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_dynamic_feature = Void then
					-- Internal error: there should be a query for that seed.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_call_type := l_call_type_set.static_type
				if l_dynamic_feature.is_attribute (current_system) then
					if in_operand then
						operand_stack.force (a_call)
					elseif l_dynamic_feature.is_builtin then
							-- This is a built-in attribute (such as feature 'item' in 'INTEGER_REF').
							-- The call might be the operand (target or argument) of another call.
							-- Therefore we need to take some care when dealing with `call_operands'.
							-- We need to keek track of the operands of this possible other call
							-- while processing the current call to the built-in attribute, for
							-- which only the target ('Current') needs to be on `call_operands'.
						if call_operands.is_empty then
							call_operands.force_last (tokens.current_keyword)
						else
							l_old_call_target := call_operands.first
							call_operands.replace (tokens.current_keyword, 1)
						end
						if in_target and l_call_type.is_expanded then
								-- Pass the address of the built-in attribute expanded object.
							current_file.put_character ('&')
							current_file.put_character ('(')
								-- No need to call `print_adapted_query_call' here because an
								-- unqualified call is not polymorphic, and therefore the type
								-- of the query is exactly the type expected by the caller.
							print_query_call (l_dynamic_feature, current_type, False)
							current_file.put_character (')')
						else
								-- No need to call `print_adapted_query_call' here because an
								-- unqualified call is not polymorphic, and therefore the type
								-- of the query is exactly the type expected by the caller.
							print_query_call (l_dynamic_feature, current_type, False)
						end
						if l_old_call_target /= Void then
							call_operands.replace (l_old_call_target, 1)
							l_old_call_target := Void
						else
							call_operands.wipe_out
						end
					elseif in_target then
						if l_call_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
							current_file.put_character (')')
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (a_call, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
						end
					else
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
					end
				elseif l_dynamic_feature.is_constant_attribute then
					if in_operand then
						if in_target then
							if l_call_type.is_expanded then
								in_operand := False
								l_temp := new_temp_variable (l_call_type)
								print_indentation
								print_temp_name (l_temp, current_file)
								current_file.put_character (' ')
								current_file.put_character ('=')
								current_file.put_character (' ')
								print_unqualified_call_expression (a_call)
								current_file.put_character (';')
								current_file.put_new_line
								l_temp.set_index (a_call.index)
								operand_stack.force (l_temp)
								in_operand := True
							else
								operand_stack.force (a_call)
							end
						else
							operand_stack.force (a_call)
						end
					else
						l_constant_attribute ?= l_dynamic_feature.static_feature
						if l_constant_attribute /= Void then
							l_string_constant ?= l_constant_attribute.constant
							if l_string_constant /= Void then
								l_once_feature := l_constant_attribute.implementation_feature
								constant_features.force_last (l_string_constant, l_once_feature)
								print_once_value_name (l_once_feature, current_file)
							else
								print_expression (l_constant_attribute.constant)
							end
						end
					end
				else
					l_actuals := a_call.arguments
					l_seed := a_call.name.seed
						-- Check whether this a call to FUNCTION.item with a manifest
						-- tuple as argument. We have a special treatment in that case
						-- to avoid having to create the manifest tuple when possible.
					if l_seed = universe.function_item_seed then
						if l_actuals /= Void and then l_actuals.count = 1 then
							l_manifest_tuple ?= l_actuals.actual_argument (1)
							if l_manifest_tuple /= Void then
								operand_stack.force (tokens.current_keyword)
								nb := l_manifest_tuple.count
								from i := 1 until i > nb loop
									print_operand (l_manifest_tuple.expression (i))
									i := i + 1
								end
								nb := nb + 1
								fill_call_operands (nb)
								l_manifest_tuple_operand := agent_manifest_tuple
								l_manifest_tuple_operand.resize (nb - 1)
								from i := nb until i < 2 loop
									l_manifest_tuple_operand.put_first (call_operands.item (i))
									i := i - 1
								end
								l_manifest_tuple_operand.set_index (l_manifest_tuple.index)
								mark_expressions_frozen (l_manifest_tuple_operand)
								l_target_operand := call_operands.first
								call_operands.wipe_out
								call_operands.put_last (l_target_operand)
								call_operands.put_last (l_manifest_tuple_operand)
								nb := 2
							end
						end
					end
					if l_manifest_tuple_operand = Void then
						operand_stack.force (tokens.current_keyword)
						if l_actuals /= Void then
							nb := l_actuals.count
							from i := 1 until i > nb loop
								print_operand (l_actuals.actual_argument (i))
								i := i + 1
							end
						end
						nb := nb + 1
						fill_call_operands (nb)
					end
					if in_operand then
						if l_assignment_target /= Void then
							operand_stack.force (l_assignment_target)
							print_indentation
							print_writable (l_assignment_target)
						else
							l_temp := new_temp_variable (l_call_type)
								-- We will set the index of `l_temp' later because
								-- it could still be used in `call_operands'.
							l_temp_index := a_call.index
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
							-- No need to call `print_adapted_query_call' here because an
							-- unqualified call is not polymorphic, and therefore the type
							-- of the query is exactly the type expected by the caller.
						print_query_call (l_dynamic_feature, current_type, False)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
							-- No need to call `print_adapted_query_call' here because an
							-- unqualified call is not polymorphic, and therefore the type
							-- of the query is exactly the type expected by the caller.
						print_query_call (l_dynamic_feature, current_type, False)
					end
					call_operands.wipe_out
					if l_manifest_tuple_operand /= Void then
						mark_expressions_unfrozen (l_manifest_tuple_operand)
						l_manifest_tuple_operand.wipe_out
					end
					if l_temp_index /= 0 then
							-- We had to wait until this stage to set the index of `l_temp'
							-- because it could have still been used in `call_operands'.
						check l_temp_not_void: l_temp /= Void end
						l_temp.set_index (l_temp_index)
					end
				end
			end
		end

	print_unqualified_identifier_call_expression (an_identifier: ET_IDENTIFIER) is
			-- Print unqualified identifier call expression.
		require
			an_identifier_not_void: an_identifier /= Void
			expression: not an_identifier.is_instruction
			not_local: not an_identifier.is_local
			not_temporary: not an_identifier.is_temporary
			not_argument: not an_identifier.is_argument
		local
			l_call_type_set: ET_DYNAMIC_TYPE_SET
			l_call_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
			l_old_call_target: ET_EXPRESSION
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_call_type_set := dynamic_type_set (an_identifier)
			l_dynamic_feature := current_type.seeded_dynamic_query (an_identifier.seed, current_system)
			if l_call_type_set = Void then
					-- Internal error: the dynamic type set of `an_identifier'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_dynamic_feature = Void then
					-- Internal error: there should be a query for that seed.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_call_type := l_call_type_set.static_type
				if l_dynamic_feature.is_attribute (current_system) then
					if in_operand then
						operand_stack.force (an_identifier)
					elseif l_dynamic_feature.is_builtin then
							-- This is a built-in attribute (such as feature 'item' in 'INTEGER_REF').
							-- The call might be the operand (target or argument) of another call.
							-- Therefore we need to take some care when dealing with `call_operands'.
							-- We need to keek track of the operands of this possible other call
							-- while processing the current call to the built-in attribute, for
							-- which only the target ('Current') needs to be on `call_operands'.
						if call_operands.is_empty then
							call_operands.force_last (tokens.current_keyword)
						else
							l_old_call_target := call_operands.first
							call_operands.replace (tokens.current_keyword, 1)
						end
						if in_target and l_call_type.is_expanded then
								-- Pass the address of the built-in attribute expanded object.
							current_file.put_character ('&')
							current_file.put_character ('(')
								-- No need to call `print_adapted_query_call' here because an
								-- unqualified call is not polymorphic, and therefore the type
								-- of the query is exactly the type expected by the caller.
							print_query_call (l_dynamic_feature, current_type, False)
							current_file.put_character (')')
						else
								-- No need to call `print_adapted_query_call' here because an
								-- unqualified call is not polymorphic, and therefore the type
								-- of the query is exactly the type expected by the caller.
							print_query_call (l_dynamic_feature, current_type, False)
						end
						if l_old_call_target /= Void then
							call_operands.replace (l_old_call_target, 1)
							l_old_call_target := Void
						else
							call_operands.wipe_out
						end
					elseif in_target then
						if l_call_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
							current_file.put_character (')')
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (an_identifier, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
						end
					else
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type, False)
					end
				elseif l_dynamic_feature.is_constant_attribute then
					if in_operand then
						if in_target then
							if l_call_type.is_expanded then
								in_operand := False
								l_temp := new_temp_variable (l_call_type)
								print_indentation
								print_temp_name (l_temp, current_file)
								current_file.put_character (' ')
								current_file.put_character ('=')
								current_file.put_character (' ')
								print_unqualified_identifier_call_expression (an_identifier)
								current_file.put_character (';')
								current_file.put_new_line
								l_temp.set_index (an_identifier.index)
								operand_stack.force (l_temp)
								in_operand := True
							else
								operand_stack.force (an_identifier)
							end
						else
							operand_stack.force (an_identifier)
						end
					else
						l_constant_attribute ?= l_dynamic_feature.static_feature
						if l_constant_attribute /= Void then
							l_string_constant ?= l_constant_attribute.constant
							if l_string_constant /= Void then
								l_once_feature := l_constant_attribute.implementation_feature
								constant_features.force_last (l_string_constant, l_once_feature)
								print_once_value_name (l_once_feature, current_file)
							else
								print_expression (l_constant_attribute.constant)
							end
						end
					end
				else
					call_operands.wipe_out
					call_operands.force_last (tokens.current_keyword)
					if in_operand then
						if l_assignment_target /= Void then
							operand_stack.force (l_assignment_target)
							print_indentation
							print_writable (l_assignment_target)
						else
							l_temp := new_temp_variable (l_call_type)
							l_temp.set_index (an_identifier.index)
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
							-- No need to call `print_adapted_query_call' here because an
							-- unqualified call is not polymorphic, and therefore the type
							-- of the query is exactly the type expected by the caller.
						print_query_call (l_dynamic_feature, current_type, False)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
							-- No need to call `print_adapted_query_call' here because an
							-- unqualified call is not polymorphic, and therefore the type
							-- of the query is exactly the type expected by the caller.
						print_query_call (l_dynamic_feature, current_type, False)
					end
					call_operands.wipe_out
				end
			end
		end

	print_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_string: STRING
		do
			if in_operand then
				operand_stack.force (a_string)
			else
				l_string := a_string.value
				current_file.put_string (c_ge_ms)
				current_file.put_character ('(')
				print_escaped_string (l_string)
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_integer (l_string.count)
				current_file.put_character (')')
			end
		end

	print_void (an_expression: ET_VOID) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
				current_file.put_string (c_eif_void)
			end
		end

	print_writable (a_writable: ET_WRITABLE) is
			-- Print `a_writable'.
		require
			a_writable_not_void: a_writable /= Void
		local
			l_identifier: ET_IDENTIFIER
			l_query: ET_DYNAMIC_FEATURE
			l_seed: INTEGER
			old_in_operand: BOOLEAN
			old_target_type: ET_DYNAMIC_TYPE
		do
			old_in_operand := in_operand
			old_target_type := call_target_type
			in_operand := False
			call_target_type := Void
			l_identifier ?= a_writable
			if l_identifier /= Void then
				if l_identifier.is_argument then
					print_formal_argument (l_identifier)
				elseif l_identifier.is_temporary then
					print_temporary_variable (l_identifier)
				elseif l_identifier.is_local then
					print_local_variable (l_identifier)
				else
					l_seed := l_identifier.seed
					l_query := current_type.seeded_dynamic_query (l_seed, current_system)
					if l_query = Void then
							-- Internal error: there should be a query with `l_seed'.
							-- It has been computed in ET_FEATURE_CHECKER.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_attribute_access (l_query, tokens.current_keyword, current_type, False)
					end
				end
			else
				a_writable.process (Current)
			end
			call_target_type := old_target_type
			in_operand := old_in_operand
		end

feature {NONE} -- Query call generation

	print_adapted_named_query_call (a_name: ET_CALL_NAME; a_target_type, a_result_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_name' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- `a_result_type' is the static type of the result expected by the caller,
			-- used to adapt the result of the query if needed (see header comment of
			-- `print_adapted_expression' for details).
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_result_type_not_void: a_result_type /= Void
			a_name_not_void: a_name /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_seed: INTEGER
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_tuple_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_query_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_seed := a_name.seed
			if a_name.is_tuple_label then
				l_tuple_type ?= a_target_type
				if l_tuple_type = Void then
						-- Internal error: if `a_name' is a Tuple label then the
						-- target type should be a Tuple_type.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_item_type_sets := l_tuple_type.item_type_sets
					if l_seed < 1 or l_seed > l_tuple_item_type_sets.count then
							-- Internal error: invalid Tuple label.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_query_type_set := l_tuple_item_type_sets.item (l_seed)
						print_adapted_expression (agent print_attribute_tuple_item_access (l_seed, call_operands.first, a_target_type, a_check_void_target), l_query_type_set, a_result_type)
					end
				end
			else
				l_dynamic_feature := a_target_type.seeded_dynamic_query (l_seed, current_system)
				if l_dynamic_feature = Void then
						-- Internal error: there should be a query with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_adapted_query_call (l_dynamic_feature, a_target_type, a_result_type, a_check_void_target)
				end
			end
		end

	print_adapted_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type, a_result_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- `a_result_type' is the static type of the result expected by the caller,
			-- used to adapt the result of the query if needed (see header comment of
			-- `print_adapted_expression' for details).
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_target_type_not_void: a_target_type /= Void
			a_result_type_not_void: a_result_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_query_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_query_type_set := a_feature.result_type_set
			print_adapted_expression (agent print_query_call (a_feature, a_target_type, a_check_void_target), l_query_type_set, a_result_type)
		end

	print_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_static_query: ET_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
			l_unique_attribute: ET_UNIQUE_ATTRIBUTE
			l_attribute: ET_ATTRIBUTE
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_static_query := a_feature.static_feature
			l_constant_attribute ?= l_static_query
			if l_constant_attribute /= Void then
-- TODO: Need to check whether the target is Void or not, even though it does not matter here.
				l_string_constant ?= l_constant_attribute.constant
				if l_string_constant /= Void then
					l_once_feature := l_constant_attribute.implementation_feature
					constant_features.force_last (l_string_constant, l_once_feature)
					print_once_value_name (l_once_feature, current_file)
				else
					print_expression (l_constant_attribute.constant)
				end
			else
				l_unique_attribute ?= l_static_query
				if l_unique_attribute /= Void then
-- TODO: Need to check whether the target is Void or not, even though it does not matter here.
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
						-- In the current implementation unique values is based on
						-- the id of the implementation feature (the feature in the
						-- class where this unique attribute has been written). For
						-- synonyms the feature id is in the reverse order, hence the
						-- arithmetic below.
					current_file.put_integer (universe.feature_count - l_unique_attribute.implementation_feature.id + 1)
					current_file.put_character (')')
				else
					l_attribute ?= l_static_query
					if l_attribute /= Void then
						l_target := call_operands.first
						l_target_type_set := dynamic_type_set (l_target)
						if l_target_type_set = Void then
								-- Internal error: the dynamic type set of the target
								-- of the call should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_target_type_set.is_expanded then
							print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
						else
							print_boxed_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
						end
					elseif a_feature.is_builtin then
						print_builtin_query_call (a_feature, a_target_type, a_check_void_target)
					else
						print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
					end
				end
			end
		end

	print_non_inlined_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a non-inlined version of a call to query `a_feature' (static binding).
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			i, nb: INTEGER
			l_actual_type_set: ET_DYNAMIC_TYPE_SET
			l_formal_type_set: ET_DYNAMIC_TYPE_SET
		do
			if not a_feature.is_generated then
				a_feature.set_generated (True)
				called_features.force_last (a_feature)
			end
			print_routine_name (a_feature, a_target_type, current_file)
			current_file.put_character ('(')
			nb := call_operands.count
			print_target_expression (call_operands.first, a_target_type, a_check_void_target)
			from i := 2 until i > nb loop
				current_file.put_character (',')
				current_file.put_character (' ')
				l_actual_type_set := dynamic_type_set (call_operands.item (i))
				l_formal_type_set := a_feature.argument_type_set (i - 1)
				if l_actual_type_set = Void or l_formal_type_set = Void then
						-- Internal error: the dynamic type sets of the actual
						-- and formal arguments should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_attachment_expression (call_operands.item (i), l_actual_type_set, l_formal_type_set.static_type)
				end
				i := i + 1
			end
			current_file.put_character (')')
		end

	print_builtin_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_builtin_class: INTEGER
		do
			l_builtin_class := a_feature.builtin_code // builtin_capacity
			inspect l_builtin_class
			when builtin_any_class then
				print_builtin_any_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_arguments_class then
				print_builtin_arguments_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_class then
				print_builtin_boolean_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_character_8_class then
				print_builtin_sized_character_query_call (a_feature, a_target_type, a_check_void_target, current_system.character_8_type)
			when builtin_character_32_class then
				print_builtin_sized_character_query_call (a_feature, a_target_type, a_check_void_target, current_system.character_32_type)
			when builtin_function_class then
				print_builtin_function_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_identified_class then
				print_builtin_identified_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_integer_8_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.integer_8_type)
			when builtin_integer_16_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.integer_16_type)
			when builtin_integer_32_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.integer_32_type)
			when builtin_integer_64_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.integer_64_type)
			when builtin_natural_8_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.natural_8_type)
			when builtin_natural_16_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.natural_16_type)
			when builtin_natural_32_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.natural_32_type)
			when builtin_natural_64_class then
				print_builtin_sized_integer_query_call (a_feature, a_target_type, a_check_void_target, current_system.natural_64_type)
			when builtin_platform_class then
				print_builtin_platform_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_pointer_class then
				print_builtin_pointer_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_real_32_class then
				print_builtin_sized_real_query_call (a_feature, a_target_type, a_check_void_target, current_system.real_32_type)
			when builtin_real_64_class then
				print_builtin_sized_real_query_call (a_feature, a_target_type, a_check_void_target, current_system.real_64_type)
			when builtin_special_class then
				print_builtin_special_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_tuple_class then
				print_builtin_tuple_query_call (a_feature, a_target_type, a_check_void_target)
			when builtin_type_class then
				print_builtin_type_query_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_any_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "ANY".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_any: (a_feature.builtin_code // builtin_capacity) = builtin_any_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_any_deep_twin then
				print_builtin_any_deep_twin_call (a_feature, a_target_type, a_check_void_target)
			when builtin_any_generating_type then
				print_builtin_any_generating_type_call (a_feature, a_target_type, a_check_void_target)
			when builtin_any_generator then
				print_builtin_any_generator_call (a_feature, a_target_type, a_check_void_target)
			when builtin_any_same_type then
				print_builtin_any_same_type_call (a_feature, a_target_type, a_check_void_target)
			when builtin_any_standard_is_equal then
				print_builtin_any_standard_is_equal_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_arguments_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "ARGUMENTS".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_arguments: (a_feature.builtin_code // builtin_capacity) = builtin_arguments_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_arguments_argument_count then
				print_builtin_arguments_argument_count_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_boolean_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "BOOLEAN" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_boolean: (a_feature.builtin_code // builtin_capacity) = builtin_boolean_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_boolean_and then
				print_builtin_boolean_and_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_and_then then
				print_builtin_boolean_and_then_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_implies then
				print_builtin_boolean_implies_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_item then
				print_builtin_boolean_item_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_not then
				print_builtin_boolean_not_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_or then
				print_builtin_boolean_or_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_or_else then
				print_builtin_boolean_or_else_call (a_feature, a_target_type, a_check_void_target)
			when builtin_boolean_xor then
				print_builtin_boolean_xor_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_function_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "FUNCTION".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_function: (a_feature.builtin_code // builtin_capacity) = builtin_function_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_function_item then
				print_builtin_function_item_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_identified_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "IDENTIFIED" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_identified: (a_feature.builtin_code // builtin_capacity) = builtin_identified_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_identified_eif_id_object then
				print_builtin_identified_eif_id_object_call (a_feature, a_target_type, a_check_void_target)
			when builtin_identified_eif_object_id then
				print_builtin_identified_eif_object_id_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_platform_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "PLATFORM".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_platform: (a_feature.builtin_code // builtin_capacity) = builtin_platform_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_platform_boolean_bytes then
				print_builtin_platform_boolean_bytes_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_character_bytes then
				print_builtin_platform_character_bytes_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_integer_bytes then
				print_builtin_platform_integer_bytes_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_is_dotnet then
				print_builtin_platform_is_dotnet_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_is_thread_capable then
				print_builtin_platform_is_thread_capable_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_is_unix then
				print_builtin_platform_is_unix_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_is_vms then
				print_builtin_platform_is_vms_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_is_windows then
				print_builtin_platform_is_windows_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_pointer_bytes then
				print_builtin_platform_pointer_bytes_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_real_bytes then
				print_builtin_platform_real_bytes_call (a_feature, a_target_type, a_check_void_target)
			when builtin_platform_wide_character_bytes then
				print_builtin_platform_wide_character_bytes_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_pointer_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "POINTER" and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_pointer: (a_feature.builtin_code // builtin_capacity) = builtin_pointer_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_pointer_hash_code then
				print_builtin_pointer_hash_code_call (a_feature, a_target_type, a_check_void_target)
			when builtin_pointer_item then
				print_builtin_pointer_item_call (a_feature, a_target_type, a_check_void_target)
			when builtin_pointer_plus then
				print_builtin_pointer_plus_call (a_feature, a_target_type, a_check_void_target)
			when builtin_pointer_to_integer_32 then
				print_builtin_pointer_to_integer_32_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_character_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized character type `a_character_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_character_code then
				print_builtin_sized_character_code_call (a_feature, a_target_type, a_check_void_target, a_character_type)
			when builtin_character_item then
				print_builtin_sized_character_item_call (a_feature, a_target_type, a_check_void_target, a_character_type)
			when builtin_character_natural_32_code then
				print_builtin_sized_character_natural_32_code_call (a_feature, a_target_type, a_check_void_target, a_character_type)
			when builtin_character_to_character_8 then
				print_builtin_sized_character_to_character_8_call (a_feature, a_target_type, a_check_void_target, a_character_type)
			when builtin_character_to_character_32 then
				print_builtin_sized_character_to_character_32_call (a_feature, a_target_type, a_check_void_target, a_character_type)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_integer_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized integer type `an_integer_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_integer_as_integer_8 then
				print_builtin_sized_integer_as_integer_8_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_integer_16 then
				print_builtin_sized_integer_as_integer_16_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_integer_32 then
				print_builtin_sized_integer_as_integer_32_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_integer_64 then
				print_builtin_sized_integer_as_integer_64_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_natural_8 then
				print_builtin_sized_integer_as_natural_8_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_natural_16 then
				print_builtin_sized_integer_as_natural_16_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_natural_32 then
				print_builtin_sized_integer_as_natural_32_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_as_natural_64 then
				print_builtin_sized_integer_as_natural_64_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_and then
				print_builtin_sized_integer_bit_and_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_not then
				print_builtin_sized_integer_bit_not_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_or then
				print_builtin_sized_integer_bit_or_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_shift_left then
				print_builtin_sized_integer_bit_shift_left_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_shift_right then
				print_builtin_sized_integer_bit_shift_right_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_bit_xor then
				print_builtin_sized_integer_bit_xor_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_div then
				print_builtin_sized_integer_div_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_divide then
				print_builtin_sized_integer_divide_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_identity then
				print_builtin_sized_integer_identity_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_item then
				print_builtin_sized_integer_item_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_lt then
				print_builtin_sized_integer_lt_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_minus then
				print_builtin_sized_integer_minus_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_mod then
				print_builtin_sized_integer_mod_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_opposite then
				print_builtin_sized_integer_opposite_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_plus then
				print_builtin_sized_integer_plus_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_power then
				print_builtin_sized_integer_power_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_times then
				print_builtin_sized_integer_times_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_character_8 then
				print_builtin_sized_integer_to_character_8_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_character_32 then
				print_builtin_sized_integer_to_character_32_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_double then
				print_builtin_sized_integer_to_double_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_real then
				print_builtin_sized_integer_to_real_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_real_32 then
				print_builtin_sized_integer_to_real_32_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			when builtin_integer_to_real_64 then
				print_builtin_sized_integer_to_real_64_call (a_feature, a_target_type, a_check_void_target, an_integer_type)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_real_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in sized real type `a_real_type' and related classes.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_real_ceiling_real_32 then
				print_builtin_sized_real_ceiling_real_32_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_ceiling_real_64 then
				print_builtin_sized_real_ceiling_real_64_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_divide then
				print_builtin_sized_real_divide_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_floor_real_32 then
				print_builtin_sized_real_floor_real_32_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_floor_real_64 then
				print_builtin_sized_real_floor_real_64_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_identity then
				print_builtin_sized_real_identity_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_integer_item then
				print_builtin_sized_real_item_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_lt then
				print_builtin_sized_real_lt_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_minus then
				print_builtin_sized_real_minus_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_opposite then
				print_builtin_sized_real_opposite_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_plus then
				print_builtin_sized_real_plus_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_power then
				print_builtin_sized_real_power_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_times then
				print_builtin_sized_real_times_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_to_double then
				print_builtin_sized_real_to_double_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_truncated_to_integer then
				print_builtin_sized_real_truncated_to_integer_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_truncated_to_integer_64 then
				print_builtin_sized_real_truncated_to_integer_64_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			when builtin_real_truncated_to_real then
				print_builtin_sized_real_truncated_to_real_call (a_feature, a_target_type, a_check_void_target, a_real_type)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_special_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "SPECIAL".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_special: (a_feature.builtin_code // builtin_capacity) = builtin_special_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_special_count then
				print_builtin_special_count_call (a_feature, a_target_type, a_check_void_target)
			when builtin_special_element_size then
				print_builtin_special_element_size_call (a_feature, a_target_type, a_check_void_target)
			when builtin_special_item then
				print_builtin_special_item_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_tuple_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "TUPLE".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_tuple: (a_feature.builtin_code // builtin_capacity) = builtin_tuple_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_tuple_count then
				print_builtin_tuple_count_call (a_feature, a_target_type, a_check_void_target)
			when builtin_tuple_object_comparison then
				print_builtin_tuple_object_comparison_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_builtin_type_query_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call to query `a_feature' (static binding).
			-- `a_feature' is a built-in feature introduced in class "TYPE".
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
			-- Note that the result of the query is not adapted to match the kind
			-- of result type expected by the caller. It is recommended to use
			-- `print_adapted_query_call' whenever possible.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_query: a_feature.result_type_set /= Void
			a_feature_is_builtin: a_feature.is_builtin
			a_feature_is_builtin_type: (a_feature.builtin_code // builtin_capacity) = builtin_type_class
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			inspect a_feature.builtin_code \\ builtin_capacity
			when builtin_type_name then
				print_builtin_type_name_call (a_feature, a_target_type, a_check_void_target)
			when builtin_type_type_id then
				print_builtin_type_type_id_call (a_feature, a_target_type, a_check_void_target)
			else
				print_non_inlined_query_call (a_feature, a_target_type, a_check_void_target)
			end
		end

	print_adapted_expression (a_print_expression: PROCEDURE [ANY, TUPLE]; a_source_type_set: ET_DYNAMIC_TYPE_SET; a_target_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' an expression (using `a_print_expression') with
			-- dynamic type set `a_source_type_set' when the static type expected
			-- by the caller is `a_target_type'. This is useful for example when the
			-- expression is a call to a query and this call is one of the alternatives
			-- of a polymorphic call whose static type expected by the caller is
			-- `a_target_type'. In that case the result of the query needs to be
			-- adapted to match the kind of result type expected by the caller.
			-- For example, if we have:
			--
			--    l: LIST [ANY]
			--    li: LIST [INTEGER]
			--    ls: LIST [STRING]
			--    ...
			--    a: ANY
			--    if b then
			--       l := li
			--    else
			--       l := ls
			--    end
			--    a := l.item
			--
			-- depending on the value of 'b', the call to 'item' will yield an integer
			-- or a string. If it's an integer (this corresponds to the static type
			-- of `a_source_type_set'), then its value will need to be boxed because
			-- the signature of 'item' in 'LIST [ANY]' is of reference type (this
			-- corresponds to `a_target_type').
			--
			-- Note that contrary to `print_attachment_expression', the result of the
			-- query should not be copied or cloned. It will occur later on when the call
			-- is the source of an assignment or passed as actual argument (in the example
			-- above it will occur when the value of the call to 'l.item' is assigned
			-- to 'a'). And also, contrary to `print_attachment_expression', the
			-- static type of the result of the query is expected to conform to the
			-- type of the underlying call.
		require
			a_print_expression_not_void: a_print_expression /= Void
			a_source_type_set_not_void: a_source_type_set /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_source_type: ET_DYNAMIC_TYPE
		do
			l_source_type := a_source_type_set.static_type
			if a_target_type.is_expanded then
					-- Only expanded types conform to expanded types.
					-- So no unboxing is needed, and copy or clone will
					-- not be called at this stage.
				a_print_expression.call ([])
			else
				if l_source_type.is_expanded then
					if l_source_type.is_generic then
							-- Return the address of the object,
							-- it is already equipped with a type-id.
-- TODO: we should not return the address but freshly malloced object (but without calling 'copy')
						current_file.put_character ('&')
						current_file.put_character ('(')
						a_print_expression.call ([])
						current_file.put_character (')')
					else
							-- We need to box the object, but without triggering a call to
							-- 'copy' (it will be called during subsequent attachment).
-- TODO: 'geboxed' will trigger a call to 'copy'. We should avoid that.
						current_file.put_string (c_ge_boxed)
						current_file.put_integer (l_source_type.id)
						current_file.put_character ('(')
						a_print_expression.call ([])
						current_file.put_character (')')
					end
				else
						-- Even if the dynamic type set of the expression contains
						-- expanded types, there will be no copy or clone
						-- at this stage.
					a_print_expression.call ([])
				end
			end
		end

feature {NONE} -- Agent generation

	print_agent (an_agent: ET_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_temp: ET_IDENTIFIER
			l_temp_index: INTEGER
			i, nb: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_assignment_target: ET_WRITABLE
			l_agent_type: ET_DYNAMIC_TYPE
			l_closed_operand: ET_EXPRESSION
			l_arguments: ET_AGENT_ARGUMENT_OPERANDS
			nb_operands: INTEGER
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_dynamic_type_set := dynamic_type_set (an_agent)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_agent'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_agent_type := l_dynamic_type_set.static_type
				if not an_agent.is_qualified_call then
					print_operand (tokens.current_keyword)
					nb_operands := 1
				else
					l_closed_operand ?= an_agent.target
					if l_closed_operand /= Void then
						print_operand (l_closed_operand)
						nb_operands := 1
					end
				end
				l_arguments := an_agent.arguments
				if l_arguments /= Void then
					nb := l_arguments.count
					from i := 1 until i > nb loop
						l_closed_operand ?= l_arguments.actual_argument (i)
						if l_closed_operand /= Void then
							print_operand (l_closed_operand)
							nb_operands := nb_operands + 1
						end
						i := i + 1
					end
				end
				fill_call_operands (nb_operands)
				current_agents.force_last (an_agent)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_temp := new_temp_variable (l_agent_type)
							-- We will set the index of `l_temp' later because
							-- it could still be used in `call_operands'.
						l_temp_index := an_agent.index
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				print_agent_creation_name (current_agents.count, current_feature, current_type, current_file)
				current_file.put_character ('(')
				from i := 1 until i > nb_operands loop
					if i /= 1 then
						current_file.put_character (',')
					end
-- TODO: use print_attachment_expression
					print_expression (call_operands.item (i))
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
				if l_temp_index /= 0 then
						-- We had to wait until this stage to set the index of `l_temp'
						-- because it could have still been used in `call_operands'.
					check l_temp_not_void: l_temp /= Void end
					l_temp.set_index (l_temp_index)
				end
			end
		end

	print_call_agent (an_agent: ET_CALL_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_do_function_inline_agent (an_agent: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_do_procedure_inline_agent (an_agent: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_external_function_inline_agent (an_agent: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_external_procedure_inline_agent (an_agent: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_once_function_inline_agent (an_agent: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_once_procedure_inline_agent (an_agent: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Print `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_agent (an_agent)
		end

	print_agent_open_operand (a_name: ET_IDENTIFIER) is
			-- Print agent open operand `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_open_operand: a_name.is_agent_open_operand
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_static_type: ET_DYNAMIC_TYPE
			l_agent: ET_AGENT
		do
				-- Make sure that "Current" is interpreted in the context of
				-- `current_feature' and not in the context of `current_agent'.
				-- For that we temporarily set `current_agent' to Void.
				-- It's reset to its original value when existing this routine.
			l_agent := current_agent
			current_agent := Void
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_static_type := l_dynamic_type_set.static_type
						if l_static_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							print_agent_open_operand_name (a_name, current_file)
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (a_name, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_agent_open_operand_name (a_name, current_file)
						end
					end
				else
					print_agent_open_operand_name (a_name, current_file)
				end
			end
			current_agent := l_agent
		end

	print_agent_closed_operand (a_name: ET_IDENTIFIER) is
			-- Print agent closed operand `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_closed_operand: a_name.is_agent_closed_operand
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_static_type: ET_DYNAMIC_TYPE
			l_agent: ET_AGENT
		do
				-- Make sure that "Current" is interpreted in the context of
				-- `current_feature' and not in the context of `current_agent'.
				-- For that we temporarily set `current_agent' to Void.
				-- It's reset to its original value when existing this routine.
			l_agent := current_agent
			current_agent := Void
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_static_type := l_dynamic_type_set.static_type
						if l_static_type.is_expanded then
								-- Pass the address of the expanded object.
							current_file.put_character ('&')
							print_agent_closed_operand_access (a_name, tokens.current_keyword)
						elseif call_target_type.is_expanded and not call_target_type.is_generic then
								-- We need to unbox the object and then pass its address.
							current_file.put_character ('&')
							current_file.put_character ('(')
							print_boxed_attribute_item_access (a_name, call_target_type, call_target_check_void)
							current_file.put_character (')')
						else
							print_agent_closed_operand_access (a_name, tokens.current_keyword)
						end
					end
				else
					print_agent_closed_operand_access (a_name, tokens.current_keyword)
				end
			end
			current_agent := l_agent
		end

	print_agent_closed_operand_access (a_name: ET_IDENTIFIER; a_target: ET_EXPRESSION) is
			-- Print access to agent closed operand `a_name' applied to `a_target'.
		require
			a_name_not_void: a_name /= Void
			a_name_closed_operand: a_name.is_agent_closed_operand
			a_target_not_void: a_target /= Void
		do
			if short_names then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				print_agent_closed_operand_name (a_name, current_file)
			else
-- TODO: long names
				short_names := True
				print_agent_closed_operand_access (a_name, a_target)
				short_names := False
			end
		end

	print_agent_declaration (i: INTEGER; an_agent: ET_AGENT) is
			-- Print declaration of `i'-th agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_target_type: ET_DYNAMIC_TYPE
			l_open_operand: ET_IDENTIFIER
			l_closed_operand: ET_IDENTIFIER
			l_open_index: INTEGER
			l_closed_index: INTEGER
			nb_open_operands: INTEGER
			nb_closed_operands: INTEGER
			l_target: ET_AGENT_TARGET
			l_result: ET_RESULT
			l_arguments: ET_AGENT_ARGUMENT_OPERANDS
			l_argument: ET_AGENT_ARGUMENT_OPERAND
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			j, nb: INTEGER
			l_agent_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_result_type: ET_DYNAMIC_TYPE
			l_type: ET_DYNAMIC_TYPE
			old_file: KI_TEXT_OUTPUT_STREAM
		do
				--
				-- Determine agent type.
				--
			l_dynamic_type_set := dynamic_type_set (an_agent)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_agent'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_agent_type := l_dynamic_type_set.static_type
			end
				--
				-- Determine target type.
				--
			l_target := an_agent.target
			l_dynamic_type_set := dynamic_type_set (l_target)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `l_target'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target_type := l_dynamic_type_set.static_type
			end
			if l_agent_type = Void then
				-- Error already reported.
			elseif l_target_type = Void then
				-- Error already reported.
			else
					--
					-- Determine open and closed operands.
					--
				if l_target.is_open_operand then
					nb_open_operands := 1
					if agent_open_operands.count < nb_open_operands then
						create l_open_operand.make ("a" + nb_open_operands.out)
						l_open_operand.set_agent_open_operand (True)
						l_open_operand.set_seed (nb_open_operands)
						agent_open_operands.force_last (l_open_operand)
					else
						l_open_operand := agent_open_operands.item (nb_open_operands)
					end
					l_open_operand.set_index (l_target.index)
				else
					nb_closed_operands := 1
					if agent_closed_operands.count < nb_closed_operands then
						create l_closed_operand.make ("z" + nb_closed_operands.out)
						l_closed_operand.set_agent_closed_operand (True)
						l_closed_operand.set_seed (nb_closed_operands)
						agent_closed_operands.force_last (l_closed_operand)
					else
						l_closed_operand := agent_closed_operands.item (nb_closed_operands)
					end
					l_closed_operand.set_index (l_target.index)
				end
				l_arguments := an_agent.arguments
				if l_arguments /= Void then
					nb := l_arguments.count
					from j := 1 until j > nb loop
						l_argument := l_arguments.actual_argument (j)
						if l_argument.is_open_operand then
							nb_open_operands := nb_open_operands + 1
							if agent_open_operands.count < nb_open_operands then
								create l_open_operand.make ("a" + nb_open_operands.out)
								l_open_operand.set_agent_open_operand (True)
								l_open_operand.set_seed (nb_open_operands)
								agent_open_operands.force_last (l_open_operand)
							else
								l_open_operand := agent_open_operands.item (nb_open_operands)
							end
							l_open_operand.set_index (l_argument.index)
						else
							nb_closed_operands := nb_closed_operands + 1
							if agent_closed_operands.count < nb_closed_operands then
								create l_closed_operand.make ("z" + nb_closed_operands.out)
								l_closed_operand.set_agent_closed_operand (True)
								l_closed_operand.set_seed (nb_closed_operands)
								agent_closed_operands.force_last (l_closed_operand)
							else
								l_closed_operand := agent_closed_operands.item (nb_closed_operands)
							end
							l_closed_operand.set_index (l_argument.index)
						end
						j := j + 1
					end
				end
					--
					-- Print agent type to `header_file'.
					--
				header_file.put_character ('/')
				header_file.put_character ('*')
				header_file.put_character (' ')
				header_file.put_string ("Agent #")
				header_file.put_integer (i)
				header_file.put_string (" in feature ")
				header_file.put_string (current_type.base_type.unaliased_to_text)
				header_file.put_character ('.')
				header_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.lower_name, "*/", "star/"))
				header_file.put_character (' ')
				header_file.put_character ('*')
				header_file.put_character ('/')
				header_file.put_new_line
				header_file.put_string (c_typedef)
				header_file.put_character (' ')
				header_file.put_string (c_struct)
				header_file.put_character (' ')
				header_file.put_character ('{')
				header_file.put_new_line
					-- Type id.
				header_file.put_character ('%T')
				header_file.put_string (c_int)
				header_file.put_character (' ')
				print_attribute_type_id_name (l_agent_type, header_file)
				header_file.put_character (';')
				header_file.put_new_line
					-- Attributes.
				l_queries := l_agent_type.queries
				nb := l_agent_type.attribute_count
				from j := 1 until j > nb loop
					l_query := l_queries.item (j)
					header_file.put_character ('%T')
					print_type_declaration (l_query.result_type_set.static_type, header_file)
					header_file.put_character (' ')
					print_attribute_name (l_query, l_agent_type, header_file)
					header_file.put_character (';')
					header_file.put_character (' ')
					header_file.put_character ('/')
					header_file.put_character ('*')
					header_file.put_character (' ')
					header_file.put_string (l_query.static_feature.name.name)
					header_file.put_character (' ')
					header_file.put_character ('*')
					header_file.put_character ('/')
					header_file.put_new_line
					j := j + 1
				end
					-- Function pointer.
				header_file.put_character ('%T')
				l_result := an_agent.implicit_result
				if l_result = Void then
						-- Procedure.
					header_file.put_string (c_void)
				else
						-- Query or Tuple label.
					l_dynamic_type_set := dynamic_type_set (l_result)
					if l_dynamic_type_set = Void then
							-- Internal error: a query or Tuple label should have a result type.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_result_type := l_dynamic_type_set.static_type
						print_type_declaration (l_result_type, header_file)
					end
				end
				header_file.put_character (' ')
				header_file.put_character ('(')
				header_file.put_character ('*')
				header_file.put_character ('f')
				header_file.put_character (')')
				header_file.put_character ('(')
				print_type_declaration (l_agent_type, header_file)
				from j := 1 until j > nb_open_operands loop
					l_dynamic_type_set := dynamic_type_set (agent_open_operands.item (j))
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of the open operand
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_type := l_dynamic_type_set.static_type
						header_file.put_character (',')
						header_file.put_character (' ')
						print_type_declaration (l_type, header_file)
					end
					j := j + 1
				end
				header_file.put_character (')')
				header_file.put_character (';')
				header_file.put_new_line
					-- Closed operands.
				from j := 1 until j > nb_closed_operands loop
					l_closed_operand := agent_closed_operands.item (j)
					l_dynamic_type_set := dynamic_type_set (l_closed_operand)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of closed operands
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_type := l_dynamic_type_set.static_type
						header_file.put_character ('%T')
						print_type_declaration (l_type, header_file)
						header_file.put_character (' ')
						print_agent_closed_operand_name (l_closed_operand, header_file)
						header_file.put_character (';')
						header_file.put_character (' ')
						header_file.put_character ('/')
						header_file.put_character ('*')
						header_file.put_character (' ')
						header_file.put_string ("Closed operand #")
						header_file.put_integer (j)
						header_file.put_character (' ')
						header_file.put_character ('*')
						header_file.put_character ('/')
						header_file.put_new_line
					end
					j := j + 1
				end
				header_file.put_character ('}')
				header_file.put_character (' ')
				print_agent_type_name (i, current_feature, current_type, header_file)
				header_file.put_character (';')
				header_file.put_new_line
				header_file.put_new_line
					--
					-- Print function associated with the agent to `current_file'.
					--
				old_file := current_file
				current_file := current_function_header_buffer
				current_file.put_character ('/')
				current_file.put_character ('*')
				current_file.put_character (' ')
				current_file.put_string ("Function for agent #")
				current_file.put_integer (i)
				current_file.put_string (" in feature ")
				current_file.put_string (current_type.base_type.unaliased_to_text)
				current_file.put_character ('.')
				current_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.lower_name, "*/", "star/"))
				current_file.put_character (' ')
				current_file.put_character ('*')
				current_file.put_character ('/')
				current_file.put_new_line
				if l_result_type /= Void then
					print_type_declaration (l_result_type, current_file)
				else
					current_file.put_string (c_void)
				end
				current_file.put_character (' ')
				print_agent_function_name (i, current_feature, current_type, current_file)
				current_file.put_character ('(')
				print_type_declaration (l_agent_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_character ('0')
				from j := 1 until j > nb_open_operands loop
					l_open_operand := agent_open_operands.item (j)
					l_dynamic_type_set := dynamic_type_set (l_open_operand)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of the open operand
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_type := l_dynamic_type_set.static_type
						current_file.put_character (',')
						current_file.put_character (' ')
						print_type_declaration (l_type, current_file)
						current_file.put_character (' ')
						print_agent_open_operand_name (l_open_operand, current_file)
					end
					j := j + 1
				end
				current_file.put_character (')')
				current_file.put_new_line
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_agent_type_name (i, current_feature, current_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_agent_type_name (i, current_feature, current_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('a')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
					-- Make sure that `agent_target' is set correctly
					-- before calling `print_agent_body_declaration'.
				if l_target.is_open_operand then
					agent_target := agent_open_operands.item (1)
				else
					agent_target := agent_closed_operands.item (1)
				end
					-- Make sure that `agent_arguments' is set correctly
					-- before calling `print_agent_body_declaration'.
				agent_arguments.wipe_out
				if l_arguments /= Void then
					nb := l_arguments.count
					if agent_arguments.capacity < nb then
						agent_arguments.resize (nb)
					end
					l_open_index := nb_open_operands
					l_closed_index := nb_closed_operands
					from j := nb until j < 1 loop
						l_argument := l_arguments.actual_argument (j)
						if l_argument.is_open_operand then
							agent_arguments.put_first (agent_open_operands.item (l_open_index))
							l_open_index := l_open_index - 1
						else
							agent_arguments.put_first (agent_closed_operands.item (l_closed_index))
							l_closed_index := l_closed_index - 1
						end
						j := j - 1
					end
				end
				current_file := current_function_body_buffer
				print_agent_body_declaration (an_agent)
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
				current_file := old_file
					-- Do not flush code to C file here (no call to `flush_to_c_file')
					-- because we want the function associated with this agent and the
					-- creation of the agent (printed just below) to be in the same C file.
					-- Indeed, the associated function is not declared in the C header file,
					-- but it is used in the creation of the agent.
				reset_temp_variables
					--
					-- Print creation function of the agent.
					--
					-- Print signature to `header_file' and `current_file'.
				header_file.put_character ('/')
				header_file.put_character ('*')
				header_file.put_character (' ')
				header_file.put_string ("Creation of agent #")
				header_file.put_integer (i)
				header_file.put_string (" in feature ")
				header_file.put_string (current_type.base_type.unaliased_to_text)
				header_file.put_character ('.')
				header_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.lower_name, "*/", "star/"))
				header_file.put_character (' ')
				header_file.put_character ('*')
				header_file.put_character ('/')
				header_file.put_new_line
				current_file.put_character ('/')
				current_file.put_character ('*')
				current_file.put_character (' ')
				current_file.put_string ("Creation of agent #")
				current_file.put_integer (i)
				current_file.put_string (" in feature ")
				current_file.put_string (current_type.base_type.unaliased_to_text)
				current_file.put_character ('.')
				current_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.lower_name, "*/", "star/"))
				current_file.put_character (' ')
				current_file.put_character ('*')
				current_file.put_character ('/')
				current_file.put_new_line
				header_file.put_string (c_extern)
				header_file.put_character (' ')
				print_type_declaration (l_agent_type, header_file)
				print_type_declaration (l_agent_type, current_file)
				header_file.put_character (' ')
				current_file.put_character (' ')
				print_agent_creation_name (i, current_feature, current_type, header_file)
				print_agent_creation_name (i, current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				from j := 1 until j > nb_closed_operands loop
					if j /= 1 then
						header_file.put_character (',')
						header_file.put_character (' ')
						current_file.put_character (',')
						current_file.put_character (' ')
					end
					l_dynamic_type_set := dynamic_type_set (agent_closed_operands.item (j))
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of `l_argument'
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_type := l_dynamic_type_set.static_type
						print_type_declaration (l_type, header_file)
						print_type_declaration (l_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						header_file.put_character ('a')
						current_file.put_character ('a')
						header_file.put_integer (j)
						current_file.put_integer (j)
					end
					j := j + 1
				end
				header_file.put_character (')')
				current_file.put_character (')')
				header_file.put_character (';')
				header_file.put_new_line
				current_file.put_new_line
					-- Print body to `current_file'.
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_agent_type_name (i, current_feature, current_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Create agent object.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_agent_type_name (i, current_feature, current_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_agent_type_name (i, current_feature, current_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of agent.
				print_indentation
				print_attribute_type_id_access (tokens.result_keyword, l_agent_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_agent_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set function pointer.
				print_indentation
				print_result_name (current_file)
				current_file.put_string (c_arrow)
				current_file.put_character ('f')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_agent_function_name (i, current_feature, current_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set closed operands.
				from j := 1 until j > nb_closed_operands loop
					print_indentation
					print_agent_closed_operand_access (agent_closed_operands.item (j), tokens.result_keyword)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('a')
					current_file.put_integer (j)
					current_file.put_character (';')
					current_file.put_new_line
					j := j + 1
				end
					-- Return the agent object.
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_agent_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_result_name (current_file)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
				flush_to_c_file
			end
		end

	print_agent_body_declaration (an_agent: ET_AGENT) is
			-- Print body of declaration of agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			current_agent := an_agent
			an_agent.process (Current)
			current_agent := Void
		end

	print_call_agent_body_declaration (an_agent: ET_CALL_AGENT) is
			-- Print body of declaration of call agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_result: ET_RESULT
			l_arguments: ET_AGENT_ARGUMENT_OPERANDS
			l_name: ET_FEATURE_NAME
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			old_file: KI_TEXT_OUTPUT_STREAM
		do
			l_name := an_agent.name
			l_arguments := an_agent.arguments
			l_result := an_agent.implicit_result
			if l_result /= Void then
					-- Query or Tuple label.
				l_result_type_set := dynamic_type_set (l_result)
				if l_result_type_set = Void then
						-- Internal error: if the associated feature is a query,
						-- then the dynamic type set should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					old_file := current_file
					current_file := current_function_header_buffer
					l_result_type := l_result_type_set.static_type
					print_indentation
					print_type_declaration (l_result_type, current_file)
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_default_entity_value (l_result_type, current_file)
					current_file.put_character (';')
					current_file.put_new_line
					current_file := current_function_body_buffer
					agent_expression.set_target (agent_target)
					agent_expression.set_name (l_name)
					if l_arguments /= Void then
						agent_expression.set_arguments (agent_arguments)
					else
						agent_expression.set_arguments (Void)
					end
					agent_expression.set_index (l_result.index)
					assignment_target := l_result
					print_operand (agent_expression)
					assignment_target := Void
					fill_call_operands (1)
					if call_operands.first /= l_result then
						print_indentation
						print_result_name (current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_expression (call_operands.first)
						current_file.put_character (';')
						current_file.put_new_line
					end
					call_operands.wipe_out
					print_indentation
					current_file.put_string (c_return)
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (';')
					current_file.put_new_line
					current_file := old_file
				end
			else
					-- Procedure.
				old_file := current_file
				current_file := current_function_body_buffer
				agent_instruction.set_target (agent_target)
				agent_instruction.set_name (l_name)
				if l_arguments /= Void then
					agent_instruction.set_arguments (agent_arguments)
				else
					agent_instruction.set_arguments (Void)
				end
				print_qualified_call_instruction (agent_instruction)
				current_file := old_file
			end
		end

	print_do_function_inline_agent_body_declaration (an_agent: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_internal_routine_inline_agent_body_declaration (an_agent)
		end

	print_do_procedure_inline_agent_body_declaration (an_agent: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_internal_routine_inline_agent_body_declaration (an_agent)
		end

	print_external_function_inline_agent_body_declaration (an_agent: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
-- TODO
		end

	print_external_procedure_inline_agent_body_declaration (an_agent: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
-- TODO
		end

	print_once_function_inline_agent_body_declaration (an_agent: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_internal_routine_inline_agent_body_declaration (an_agent)
		end

	print_once_procedure_inline_agent_body_declaration (an_agent: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		do
			print_internal_routine_inline_agent_body_declaration (an_agent)
		end

	print_internal_routine_inline_agent_body_declaration (an_agent: ET_INTERNAL_ROUTINE_INLINE_AGENT) is
			-- Print body if declaration of inline agent `an_agent'.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_locals: ET_LOCAL_VARIABLE_LIST
			i, nb: INTEGER
			l_name: ET_IDENTIFIER
			l_local_type_set: ET_DYNAMIC_TYPE_SET
			l_local_type: ET_DYNAMIC_TYPE
			l_rescue: ET_COMPOUND
			l_compound: ET_COMPOUND
			l_result: ET_RESULT
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			old_file: KI_TEXT_OUTPUT_STREAM
		do
-- TODO: handle case of once-routines
			l_result := an_agent.implicit_result
			if l_result /= Void then
				l_result_type_set := dynamic_type_set (l_result)
				if l_result_type_set = Void then
						-- Internal error: if the associated feature is a query,
						-- then the dynamic type set should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_result_type := l_result_type_set.static_type
				end
			end
			old_file := current_file
			current_file := current_function_header_buffer
			if l_result_type /= Void then
				print_indentation
				print_type_declaration (l_result_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_entity_value (l_result_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			l_locals := an_agent.locals
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					l_name := l_locals.local_variable (i).name
					l_local_type_set := dynamic_type_set (l_name)
					if l_local_type_set = Void then
							-- Internal error: the dynamic type of local variable
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_local_type := l_local_type_set.static_type
						print_indentation
						print_type_declaration (l_local_type, current_file)
						current_file.put_character (' ')
						print_local_name (l_name, current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_default_entity_value (l_local_type, current_file)
						current_file.put_character (';')
						current_file.put_new_line
					end
					i := i + 1
				end
			end
			l_rescue := an_agent.rescue_clause
			if l_rescue /= Void then
				print_indentation
				current_file.put_string (c_struct)
				current_file.put_character (' ')
				current_file.put_string (c_ge_rescue)
				current_file.put_character (' ')
				current_file.put_character ('r')
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
			print_agent_trace_message_call (an_agent, True)
			if l_rescue /= Void then
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_string (c_ge_setjmp)
				current_file.put_character ('(')
				current_file.put_character ('r')
				current_file.put_character ('.')
				current_file.put_character ('j')
				current_file.put_character ('b')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('!')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_compound (l_rescue)
				print_indentation
				current_file.put_string (c_ge_raise)
				current_file.put_character ('(')
				current_file.put_character ('8')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_string (c_ge_retry)
				current_file.put_character (':')
				current_file.put_new_line
				print_indentation
				current_file.put_string ("r.previous = GE_rescue;")
				current_file.put_new_line
				print_indentation
				current_file.put_string ("GE_rescue = &r;")
				current_file.put_new_line
			end
			l_compound := an_agent.compound
			if l_compound /= Void then
				print_compound (l_compound)
			end
			if l_rescue /= Void then
				print_indentation
				current_file.put_string ("GE_rescue = r.previous;")
				current_file.put_new_line
			end
			if l_result_type /= Void then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			print_agent_trace_message_call (an_agent, False)
			current_file := old_file
		end

	agent_instruction: ET_CALL_INSTRUCTION
			-- Agent instruction

	agent_expression: ET_CALL_EXPRESSION
			-- Agent expression

	agent_target: ET_EXPRESSION
			-- Agent target

	agent_arguments: ET_ACTUAL_ARGUMENT_LIST
			-- Agent arguments

	agent_open_operands: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Agent open operands

	agent_closed_operands: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Agent closed operands

feature {NONE} -- Polymorphic call functions generation

	print_polymorphic_query_call_functions is
			-- Print polymorphic query call functions.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_first_call, l_last_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_call, l_previous_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_seed: INTEGER
			l_is_tuple_label: BOOLEAN
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_CALL_COMPONENT
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				from
					l_first_call := l_type.query_calls
				until
					l_first_call = Void
				loop
					l_target_type_set := l_first_call.target_type_set
					if l_target_type_set.count <= 2 then
							-- Polymorphic calls with one or two target dynamic types
							-- are handled differently.
							-- (See `print_qualified_call_expression'.)
						l_first_call := l_first_call.next
					elseif l_first_call.static_call.name.is_tuple_label then
							-- Polymorphic calls to Tuple labels are handled differently.
						l_first_call := l_first_call.next
					else
						l_static_call := l_first_call.static_call
						l_seed := l_static_call.name.seed
						l_is_tuple_label := l_static_call.name.is_tuple_label
						from
							l_last_call := l_first_call
							l_previous_call := l_first_call
							l_call := l_first_call.next
						until
							l_call = Void
						loop
							l_target_type_set := l_call.target_type_set
							if (l_call.static_call.name.seed = l_seed and l_call.static_call.name.is_tuple_label = l_is_tuple_label) and then l_target_type_set.count > 2 and then same_declared_signature (l_call, l_first_call) then
								if l_call /= l_last_call.next then
									l_previous_call.set_next (l_call.next)
									l_call.set_next (l_last_call.next)
									l_last_call.set_next (l_call)
									l_call := l_previous_call
								end
								l_last_call := l_last_call.next
							end
							l_previous_call := l_call
							l_call := l_call.next
						end
						print_polymorphic_call_function (l_first_call, l_last_call, l_type)
						l_first_call := l_last_call.next
					end
				end
				i := i + 1
			end
		end

	print_polymorphic_tuple_label_call_functions is
			-- Print polymorphic call to Tuple label functions.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_first_call, l_last_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_call, l_previous_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_CALL_COMPONENT
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_tuple_type ?= l_dynamic_types.item (i)
				if l_tuple_type /= Void then
					from
						l_first_call := l_tuple_type.query_calls
					until
						l_first_call = Void
					loop
						l_target_type_set := l_first_call.target_type_set
						if not l_first_call.static_call.name.is_tuple_label then
								-- Skip calls that are not to a Tuple label.
							l_first_call := l_first_call.next
						elseif l_target_type_set.count <= 2 then
								-- Polymorphic calls with one or two target dynamic types
								-- are handled differently.
								-- (See `print_qualified_call_expression'.)
							l_first_call := l_first_call.next
						else
							l_static_call := l_first_call.static_call
							l_seed := l_static_call.name.seed
							from
								l_last_call := l_first_call
								l_previous_call := l_first_call
								l_call := l_first_call.next
							until
								l_call = Void
							loop
								l_target_type_set := l_call.target_type_set
								if (l_call.static_call.name.seed = l_seed and l_call.static_call.name.is_tuple_label) and then l_target_type_set.count > 2 and then same_declared_signature (l_call, l_first_call) then
									if l_call /= l_last_call.next then
										l_previous_call.set_next (l_call.next)
										l_call.set_next (l_last_call.next)
										l_last_call.set_next (l_call)
										l_call := l_previous_call
									end
									l_last_call := l_last_call.next
								end
								l_previous_call := l_call
								l_call := l_call.next
							end
							print_polymorphic_call_function (l_first_call, l_last_call, l_tuple_type)
							l_first_call := l_last_call.next
						end
					end
				end
				i := i + 1
			end
		end

	print_polymorphic_procedure_call_functions is
			-- Print polymorphic procedure call functions.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_first_call, l_last_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_call, l_previous_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_static_call: ET_CALL_COMPONENT
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				from
					l_first_call := l_type.procedure_calls
				until
					l_first_call = Void
				loop
					l_target_type_set := l_first_call.target_type_set
					if l_target_type_set.count <= 2 then
							-- Polymorphic calls with one or two target dynamic types
							-- are handled differently.
							-- (See `print_qualified_call_instruction'.)
						l_first_call := l_first_call.next
					else
						l_static_call := l_first_call.static_call
						l_seed := l_static_call.name.seed
						from
							l_last_call := l_first_call
							l_previous_call := l_first_call
							l_call := l_first_call.next
						until
							l_call = Void
						loop
							l_target_type_set := l_call.target_type_set
							if l_call.static_call.name.seed = l_seed and then l_target_type_set.count > 2 and then same_declared_signature (l_call, l_first_call) then
								if l_call /= l_last_call.next then
									l_previous_call.set_next (l_call.next)
									l_call.set_next (l_last_call.next)
									l_last_call.set_next (l_call)
									l_call := l_previous_call
								end
								l_last_call := l_last_call.next
							end
							l_previous_call := l_call
							l_call := l_call.next
						end
						print_polymorphic_call_function (l_first_call, l_last_call, l_type)
						l_first_call := l_last_call.next
					end
				end
				i := i + 1
			end
		end

	print_polymorphic_call_function (a_first_call, a_last_call: ET_DYNAMIC_QUALIFIED_CALL; a_target_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' dynamic binding code for the calls between `a_first_call'
			-- and `a_last_call' whose target dynamic types are those stored in `a_target_dynamic_types'
			-- whose type-id is itself stored between indexes `l' and `u' in `a_target_dynamic_type_ids'.
			-- The generated code uses binary search to find out which feature to execute.
		require
			a_first_call_not_void: a_first_call /= Void
			a_last_call_not_void: a_last_call /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_static_call: ET_CALL_COMPONENT
			l_caller: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_actual_arguments: ET_ARGUMENT_OPERANDS
			l_formal_arguments_count: INTEGER
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type: ET_DYNAMIC_TYPE
			l_target_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]
			l_target_dynamic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_switch: BOOLEAN
			l_temp: ET_IDENTIFIER
			l_name: ET_IDENTIFIER
			l_call, l_last_call_next: ET_DYNAMIC_QUALIFIED_CALL
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type_sets: ET_DYNAMIC_STANDALONE_TYPE_SET_LIST
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_result_type: ET_DYNAMIC_TYPE
			l_index: INTEGER
			l_feature: ET_FEATURE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			old_feature: ET_DYNAMIC_FEATURE
			old_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_seed: INTEGER
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_manifest_tuple_operand: ET_MANIFEST_TUPLE
		do
			old_feature := current_feature
			current_feature := dummy_feature
			old_dynamic_type_sets := current_dynamic_type_sets
			l_argument_type_sets := standalone_type_sets
			current_dynamic_type_sets := l_argument_type_sets
			l_static_call := a_first_call.static_call
			l_caller := a_first_call.current_feature
			l_actual_arguments := l_static_call.arguments
			if l_static_call.name.is_tuple_label then
				call_operands.wipe_out
				call_operands.force_last (tokens.current_keyword)
				l_index := l_static_call.name.seed
				l_tuple_type ?= a_target_type
				if l_tuple_type = Void then
						-- Internal error: a Tuple label can only be applied to a tuple object.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif not l_tuple_type.item_type_sets.valid_index (l_index) then
						-- Internal error: invalid Tuple label.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_result_type := l_tuple_type.item_type_sets.item (l_index).static_type
				end
			else
				l_feature := a_first_call.static_feature
				if l_feature = Void then
					call_operands.wipe_out
					call_operands.force_last (tokens.current_keyword)
						-- Internal error: there should be a feature with that seed.
						-- It has been computed in ET_FEATURE_FLATTENER.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if l_feature.is_query then
						l_result_type := current_system.dynamic_type (l_feature.type, a_target_type.base_type)
					end
					l_formal_arguments := l_feature.arguments
					l_formal_arguments_count := l_feature.arguments_count
					fill_call_formal_arguments (l_feature)
						-- Check to see whether this is a call to ROUTINE.call or FUNCTION.item
						-- with a manifest tuple passed as argument. We have a special treatment
						-- in that case to avoid having to create the manifest tuple when possible.
					if l_formal_arguments_count = 1 then
						l_seed := l_static_call.name.seed
						if l_seed = universe.routine_call_seed or l_seed = universe.function_item_seed then
							if l_actual_arguments /= Void and then l_actual_arguments.count = 1 then
								l_manifest_tuple ?= l_actual_arguments.actual_argument (1)
								if l_manifest_tuple /= Void then
									nb := l_manifest_tuple.count
									l_manifest_tuple_operand := agent_manifest_tuple
									l_manifest_tuple_operand.resize (nb)
									from i := nb until i < 1 loop
										l_manifest_tuple_operand.put_first (formal_argument (i))
										i := i - 1
									end
									l_manifest_tuple_operand.set_index (nb + 1)
									call_operands.replace (l_manifest_tuple_operand, 2)
								end
							end
						end
					end
				end
			end
				-- Compute dynamic type sets.
			l_target_dynamic_type_ids := target_dynamic_type_ids
			l_target_dynamic_types := target_dynamic_types
			from
				l_call := a_first_call
				l_last_call_next := a_last_call.next
			until
				l_call = l_last_call_next
			loop
				l_target_type_set := l_call.target_type_set
				nb := l_target_type_set.count
				from i := 1 until i > nb loop
					l_dynamic_type := l_target_type_set.dynamic_type (i)
					if not l_target_dynamic_types.has (l_dynamic_type.id) then
						l_target_dynamic_type_ids.force_last (l_dynamic_type.id)
						l_target_dynamic_types.force_last (l_dynamic_type, l_dynamic_type.id)
					end
					i := i + 1
				end
				l_call := l_call.next
			end
			l_target_dynamic_type_ids.sort (dynamic_type_id_sorter)
				-- Print feature signature.
			print_call_name_comment (l_static_call, l_caller, a_target_type, header_file)
			print_call_name_comment (l_static_call, l_caller, a_target_type, current_file)
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			if l_result_type /= Void then
				print_type_declaration (l_result_type, header_file)
				print_type_declaration (l_result_type, current_file)
			else
				header_file.put_string (c_void)
				current_file.put_string (c_void)
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_call_name (l_static_call, l_caller, a_target_type, header_file)
			print_call_name (l_static_call, l_caller, a_target_type, current_file)
			header_file.put_character ('(')
			current_file.put_character ('(')
			print_type_declaration (a_target_type, header_file)
			print_type_declaration (a_target_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_current_name (header_file)
			print_current_name (current_file)
			if l_actual_arguments /= Void then
				nb := l_actual_arguments.count
				if nb /= l_formal_arguments_count then
						-- Internal error: we should have checked at this stage that
						-- the number of actual arguments should be the same as the
						-- number of formal arguments.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_manifest_tuple /= Void then
					nb := l_manifest_tuple.count
					from i := 1 until i > nb loop
						header_file.put_character (',')
						current_file.put_character (',')
						header_file.put_character (' ')
						current_file.put_character (' ')
						l_argument_type_set := l_caller.dynamic_type_set (l_manifest_tuple.expression (i))
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_argument_type := l_argument_type_set.static_type
							print_type_declaration (l_argument_type, header_file)
							print_type_declaration (l_argument_type, current_file)
							header_file.put_character (' ')
							current_file.put_character (' ')
							l_name := formal_argument (i)
							print_argument_name (l_name, header_file)
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				elseif nb > 0 then
					from i := 1 until i > nb loop
						header_file.put_character (',')
						current_file.put_character (',')
						header_file.put_character (' ')
						current_file.put_character (' ')
						l_argument_type_set := l_caller.dynamic_type_set (l_actual_arguments.actual_argument (i))
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_argument_type := l_argument_type_set.static_type
							print_type_declaration (l_argument_type, header_file)
							print_type_declaration (l_argument_type, current_file)
							header_file.put_character (' ')
							current_file.put_character (' ')
							l_name := l_formal_arguments.formal_argument (i).name
							print_argument_name (l_name, header_file)
							print_argument_name (l_name, current_file)
						end
						i := i + 1
					end
				end
			end
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print feature body.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			if l_switch then
					-- Use switch statement.
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_attribute_type_id_access (tokens.current_keyword, a_target_type, False)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				from l_target_dynamic_types.start until l_target_dynamic_types.after loop
					l_dynamic_type := l_target_dynamic_types.item_for_iteration
					print_indentation
					current_file.put_string (c_case)
					current_file.put_character (' ')
					current_file.put_integer (l_dynamic_type.id)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					if l_result_type /= Void then
						print_indentation
						current_file.put_string (c_return)
						current_file.put_character (' ')
						current_file.put_character ('(')
						set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
						print_adapted_named_query_call (l_static_call.name, l_dynamic_type, l_result_type, False)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
						print_named_procedure_call (l_static_call.name, l_dynamic_type, False)
					end
					dedent
					l_target_dynamic_types.forth
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_string (c_int)
				current_file.put_character (' ')
				l_temp := temp_variable
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_attribute_type_id_access (tokens.current_keyword, a_target_type, False)
				current_file.put_character (';')
				current_file.put_new_line
					-- Use binary search.
				print_binary_search_polymorphic_calls (a_first_call, a_last_call, l_result_type, 1, l_target_dynamic_type_ids.count, l_target_dynamic_type_ids, l_target_dynamic_types)
			end
			if l_result_type /= Void then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_default_entity_value (l_result_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			call_operands.wipe_out
			if l_manifest_tuple_operand /= Void then
				l_manifest_tuple_operand.wipe_out
			end
			flush_to_c_file
			l_target_dynamic_type_ids.wipe_out
			l_target_dynamic_types.wipe_out
			current_dynamic_type_sets := old_dynamic_type_sets
			current_feature := old_feature
		end

	print_binary_search_polymorphic_calls (a_first_call, a_last_call: ET_DYNAMIC_QUALIFIED_CALL; a_result_type: ET_DYNAMIC_TYPE; l, u: INTEGER; a_target_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]; a_target_dynamic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]) is
			-- Print to `current_file' dynamic binding code for the calls between `a_first_call'
			-- and `a_last_call' whose target dynamic types are those stored in `a_target_dynamic_types'
			-- whose type-id is itself stored between indexes `l' and `u' in `a_target_dynamic_type_ids'.
			-- The generated code uses binary search to find out which feature to execute.
		require
			a_first_call_not_void: a_first_call /= Void
			a_last_call_not_void: a_last_call /= Void
			a_target_dynamic_type_ids_not_void: a_target_dynamic_type_ids /= Void
			a_target_dynamic_types_not_void: a_target_dynamic_types /= Void
			no_void_target_dynamic_type: not a_target_dynamic_types.has_item (Void)
			consistent_count: a_target_dynamic_types.count = a_target_dynamic_type_ids.count
			l_large_enough: l >= 1
			l_small_enough: l <= u
			u_small_enough: u <= a_target_dynamic_type_ids.count
		local
			t: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_type_id: INTEGER
			l_temp: ET_IDENTIFIER
			l_static_call: ET_CALL_COMPONENT
			l_argument_type_sets: ET_DYNAMIC_STANDALONE_TYPE_SET_LIST
		do
			l_argument_type_sets := standalone_type_sets
			l_static_call := a_first_call.static_call
			l_temp := temp_variable
			if l = u then
				l_type_id := a_target_dynamic_type_ids.item (l)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_adapted_named_query_call (l_static_call.name, l_dynamic_type, a_result_type, False)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_named_procedure_call (l_static_call.name, l_dynamic_type, False)
				end
			elseif l + 1 = u then
				l_type_id := a_target_dynamic_type_ids.item (l)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_integer (l_type_id)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_adapted_named_query_call (l_static_call.name, l_dynamic_type, a_result_type, False)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_named_procedure_call (l_static_call.name, l_dynamic_type, False)
				end
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_type_id := a_target_dynamic_type_ids.item (u)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_adapted_named_query_call (l_static_call.name, l_dynamic_type, a_result_type, False)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					set_polymorphic_call_argument_type_sets (l_argument_type_sets, a_first_call, a_last_call, l_dynamic_type)
					print_named_procedure_call (l_static_call.name, l_dynamic_type, False)
				end
				current_file.put_character ('}')
				current_file.put_new_line
			else
				t := l + (u - l) // 2
				l_type_id := a_target_dynamic_type_ids.item (t)
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_integer (l_type_id)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_binary_search_polymorphic_calls (a_first_call, a_last_call, a_result_type, l, t, a_target_dynamic_type_ids, a_target_dynamic_types)
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_binary_search_polymorphic_calls (a_first_call, a_last_call, a_result_type, t + 1, u, a_target_dynamic_type_ids, a_target_dynamic_types)
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	same_declared_signature (a_call1, a_call2: ET_DYNAMIC_QUALIFIED_CALL): BOOLEAN is
			-- Do `a_call1' and `a_call2' have the same declared signature?
			-- Note1: Reference types are considered the same declared type.
			-- Note2: If the calls are idenfied to be to ROUTINE.call or FUNCTION.item
			-- and one of the calls has a manifest tuple as argument, then the other
			-- should also have a manifest tuple of the exact same type (note1 does not 
			-- apply for the types of the manifest tuples here).
		require
			a_call1_not_void: a_call1 /= Void
			a_call2_not_void: a_call2 /= Void
			same_target_type: a_call1.target_type_set.static_type = a_call2.target_type_set.static_type
			same_seed: a_call1.static_call.name.seed = a_call2.static_call.name.seed
			same_kind: a_call1.static_call.name.is_tuple_label = a_call2.static_call.name.is_tuple_label
		local
			l_args1, l_args2: ET_ARGUMENT_OPERANDS
			l_feature1, l_feature2: ET_DYNAMIC_FEATURE
			l_type_set1, l_type_set2: ET_DYNAMIC_TYPE_SET
			l_manifest_tuple1: ET_MANIFEST_TUPLE
			l_manifest_tuple2: ET_MANIFEST_TUPLE
			l_seed: INTEGER
			i, nb: INTEGER
		do
				-- The calls have the same seed with the same target type,
				-- so there result types if any are the same.
				-- Look at there actual argument types now.
			l_args1 := a_call1.static_call.arguments
			l_feature1 := a_call1.current_feature
			l_args2 := a_call2.static_call.arguments
			l_feature2 := a_call2.current_feature
			if l_args1 = Void then
				Result := (l_args2 = Void or else l_args2.is_empty)
			elseif l_args2 = Void then
				Result := l_args1.is_empty
			else
				nb := l_args1.count
				if l_args2.count = nb then
					Result := True
					from i := 1 until i > nb loop
						l_type_set1 := l_feature1.dynamic_type_set (l_args1.actual_argument (i))
						l_type_set2 := l_feature2.dynamic_type_set (l_args2.actual_argument (i))
						if l_type_set1 = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
							Result := False
							i := nb + 1 -- Jump out of the loop.
						elseif l_type_set2 = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
							Result := False
							i := nb + 1 -- Jump out of the loop.
						elseif nb = 1 then
							l_seed := a_call1.static_call.name.seed
							if not a_call1.static_call.name.is_tuple_label and then (l_seed = universe.routine_call_seed or l_seed = universe.function_item_seed) then
								l_manifest_tuple1 ?= l_args1.actual_argument (1)
								l_manifest_tuple2 ?= l_args2.actual_argument (1)
							end
							if l_manifest_tuple1 /= Void or l_manifest_tuple2 /= Void then
								if l_manifest_tuple1 = Void then
									Result := False
								elseif l_manifest_tuple2 = Void then
									Result := False
								else
									Result := (l_type_set1.static_type = l_type_set2.static_type)
								end
							else
						 		Result := same_declaration_types (l_type_set1.static_type, l_type_set2.static_type)
							end
							i := i + 1
						elseif same_declaration_types (l_type_set1.static_type, l_type_set2.static_type) then
							i := i + 1
						else
							Result := False
							i := nb + 1 -- Jump out of the loop.
						end
					end
				end
			end
		end

	set_polymorphic_call_argument_type_sets (an_argument_type_sets: ET_DYNAMIC_STANDALONE_TYPE_SET_LIST; a_first_call, a_last_call: ET_DYNAMIC_QUALIFIED_CALL; a_target_type: ET_DYNAMIC_TYPE) is
			-- Set `an_argument_type_sets' as the union of actual argument type
			-- sets for the calls between `a_first_call' and `a_last_call' with
			-- target type `a_target_type'.
		require
			an_argument_type_sets_not_void: an_argument_type_sets /= Void
			a_first_call_not_void: a_first_call /= Void
			a_last_call_not_void: a_last_call /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_actual_arguments: ET_ARGUMENT_OPERANDS
			i, nb, nb_args: INTEGER
			l_call: ET_DYNAMIC_QUALIFIED_CALL
			l_caller: ET_DYNAMIC_FEATURE
			l_is_first: BOOLEAN
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_standalone_type_set: ET_DYNAMIC_STANDALONE_TYPE_SET
			l_last_call_next: ET_DYNAMIC_QUALIFIED_CALL
			l_seed: INTEGER
			l_manifest_tuple: ET_MANIFEST_TUPLE
		do
			l_actual_arguments := a_first_call.static_call.arguments
			if l_actual_arguments /= Void and then l_actual_arguments.count > 0 then
				nb_args := l_actual_arguments.count
				nb := nb_args
				if nb_args = 1 then
					l_seed := a_first_call.static_call.name.seed
					if not a_first_call.static_call.name.is_tuple_label and then (l_seed = universe.routine_call_seed or l_seed = universe.function_item_seed) then
						l_manifest_tuple ?= l_actual_arguments.actual_argument (1)
						if l_manifest_tuple /= Void then
							nb := l_manifest_tuple.count + 1
						end
					end
				end
				if an_argument_type_sets.count < nb then
					an_argument_type_sets.resize (nb)
					from
						i := an_argument_type_sets.count + 1
					until
						i > nb
					loop
						create l_standalone_type_set.make (current_system.any_type)
						an_argument_type_sets.put_last (l_standalone_type_set)
						i := i + 1
					end
				end
				if l_manifest_tuple /= Void then
					nb := l_manifest_tuple.count
					l_argument_type_set := a_first_call.current_feature.dynamic_type_set (l_manifest_tuple)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the actual arguments
							-- of the call should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_standalone_type_set := an_argument_type_sets.item (nb + 1)
						l_standalone_type_set.reset (l_argument_type_set.static_type)
						l_standalone_type_set.put_type (l_argument_type_set.static_type)
						l_standalone_type_set.set_never_void
					end
				end
				from
					l_call := a_first_call
					l_is_first := True
					l_last_call_next := a_last_call.next
				until
					l_call = l_last_call_next
				loop
					if l_call.target_type_set.has_type (a_target_type) then
						l_caller := l_call.current_feature
						l_actual_arguments := l_call.static_call.arguments
						if l_actual_arguments = Void or else l_actual_arguments.count /= nb_args then
								-- Internal error: all calls should have the same signature.
								-- This is checked by the call to `same_declared_signature'.
							set_fatal_error
							error_handler.report_giaaa_error
							l_call := a_last_call
						elseif l_manifest_tuple /= Void then
							l_manifest_tuple ?= l_actual_arguments.actual_argument (1)
							if l_manifest_tuple = Void or else l_manifest_tuple.count /= (nb) then
									-- Internal error: all calls should have the same signature.
									-- This is checked by the call to `same_declared_signature'.
								set_fatal_error
								error_handler.report_giaaa_error
								l_call := a_last_call
							else
								from i := 1 until i > nb loop
									l_argument_type_set := l_caller.dynamic_type_set (l_manifest_tuple.expression (i))
									if l_argument_type_set = Void then
											-- Internal error: the dynamic type set of the actual arguments
											-- of the call should be known at this stage.
										set_fatal_error
										error_handler.report_giaaa_error
										i := nb + 1
										l_call := a_last_call
									else
										l_standalone_type_set := an_argument_type_sets.item (i)
										if l_is_first then
											l_standalone_type_set.reset (l_argument_type_set.static_type)
											l_standalone_type_set.set_never_void
										elseif l_argument_type_set.static_type.conforms_to_type (l_standalone_type_set.static_type, current_system) then
											-- Nothing to be done.
										elseif l_standalone_type_set.static_type.conforms_to_type (l_argument_type_set.static_type, current_system) then
											l_standalone_type_set.set_static_type (l_argument_type_set.static_type, current_system)
										else
											l_standalone_type_set.set_static_type (current_system.any_type, current_system)
										end
										l_standalone_type_set.put_types (l_argument_type_set)
										if not l_argument_type_set.is_never_void then
											l_standalone_type_set.propagate_can_be_void (l_argument_type_set)
										end
									end
									i := i + 1
								end
							end
						else
							from i := 1 until i > nb_args loop
								l_argument_type_set := l_caller.dynamic_type_set (l_actual_arguments.actual_argument (i))
								if l_argument_type_set = Void then
										-- Internal error: the dynamic type set of the actual arguments
										-- of the call should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
									i := nb_args + 1
									l_call := a_last_call
								else
									l_standalone_type_set := an_argument_type_sets.item (i)
									if l_is_first then
										l_standalone_type_set.reset (l_argument_type_set.static_type)
										l_standalone_type_set.set_never_void
									elseif l_argument_type_set.static_type.conforms_to_type (l_standalone_type_set.static_type, current_system) then
										-- Nothing to be done.
									elseif l_standalone_type_set.static_type.conforms_to_type (l_argument_type_set.static_type, current_system) then
										l_standalone_type_set.set_static_type (l_argument_type_set.static_type, current_system)
									else
										l_standalone_type_set.set_static_type (current_system.any_type, current_system)
									end
									if l_call.is_equal_in_tilde_feature (current_system) then
											-- This is a call to 'is_equal' in the feature that is supposed
											-- to simulate the forthcoming '~' operator introduced in
											-- ECMA Eiffel 367 (this feature is KL_ANY_ROUTINES.equal_objects).
											-- Therefore, we know that at run-time the type of the argument
											-- will be the same as the type of the target of 'is_equal' (there
											-- is a call to 'same_type' just before to ascertain that).
										l_standalone_type_set.put_type (a_target_type)
									else
										l_standalone_type_set.put_types (l_argument_type_set)
										if not l_argument_type_set.is_never_void then
											l_standalone_type_set.propagate_can_be_void (l_argument_type_set)
										end
									end
								end
								i := i + 1
							end
						end
						l_is_first := False
					end
					l_call := l_call.next
				end
			end
		end

feature {NONE} -- Deep features generation

	print_deep_twin_functions is
			-- Print all functions necessary to implement 'deep_twin'.
		do
			if not deep_twin_types.is_empty then
				include_runtime_header_file ("ge_deep.h", True, header_file)
					-- Be aware that `print_deep_twin_function' can added
					-- new types at the end of `deep_twin_types'.
				from deep_twin_types.start until deep_twin_types.after loop
					print_deep_twin_function (deep_twin_types.item_for_iteration)
					deep_twin_types.forth
				end
				from deep_feature_target_type_sets.start until deep_feature_target_type_sets.after loop
					print_deep_twin_polymorphic_call_function (deep_feature_target_type_sets.item_for_iteration)
					deep_feature_target_type_sets.forth
				end
				deep_twin_types.wipe_out
				deep_feature_target_type_sets.wipe_out
			end
		end

	print_deep_twin_function (a_type: ET_DYNAMIC_TYPE) is
			-- Print 'GE_deep_twin' function for type `a_type' to `current_file'
			-- and its signature to `header_file'.
		require
			a_type_not_void: a_type /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_has_nested_references: BOOLEAN
			i, nb: INTEGER
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_attribute: ET_DYNAMIC_FEATURE
			l_attribute_type_set: ET_DYNAMIC_TYPE_SET
			l_attribute_type: ET_DYNAMIC_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			old_type: ET_DYNAMIC_TYPE
			old_file: KI_TEXT_OUTPUT_STREAM
			l_temp: ET_IDENTIFIER
		do
			old_type := current_type
			current_type := a_type
				-- Print signature to `header_file' and `current_file'.
			old_file := current_file
			current_file := current_function_header_buffer
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_type_declaration (a_type, header_file)
			print_type_declaration (a_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_deep_twin)
			current_file.put_string (c_ge_deep_twin)
			header_file.put_integer (a_type.id)
			current_file.put_integer (a_type.id)
			header_file.put_character ('(')
			current_file.put_character ('(')
			print_type_declaration (current_type, header_file)
			print_type_declaration (current_type, current_file)
			if current_type.is_expanded then
				header_file.put_character ('*')
				current_file.put_character ('*')
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_current_name (header_file)
			print_current_name (current_file)
			header_file.put_character (',')
			header_file.put_character (' ')
			current_file.put_character (',')
			current_file.put_character (' ')
			header_file.put_string (c_ge_deep)
			header_file.put_character ('*')
			header_file.put_character (' ')
			header_file.put_character ('d')
			current_file.put_string (c_ge_deep)
			current_file.put_character ('*')
			current_file.put_character (' ')
			current_file.put_character ('d')
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
				-- Declare the Result entity.
			print_indentation
			print_type_declaration (a_type, current_file)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			current_file := current_function_body_buffer
			if a_type.base_class = universe.type_class then
-- TODO: this built-in routine could be inlined.
					-- Cannot have two instances of class TYPE representing the same Eiffel type.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			else
				l_has_nested_references := a_type.has_nested_reference_attributes
				if l_has_nested_references then
					print_indentation
					current_file.put_string (c_ge_deep)
					current_file.put_character ('*')
					current_file.put_character (' ')
					current_file.put_character ('t')
					current_file.put_character ('0')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('d')
					current_file.put_character (';')
					current_file.put_new_line
				end
				l_special_type ?= a_type
				if l_special_type /= Void then
					l_attribute_type_set := l_special_type.item_type_set
					l_attribute_type := l_attribute_type_set.static_type
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_type_declaration (l_special_type, current_file)
					current_file.put_character (')')
					current_file.put_string (c_ge_alloc)
					current_file.put_character ('(')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_name (l_special_type, current_file)
					current_file.put_character (')')
					current_file.put_character ('+')
					print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
					current_file.put_character ('*')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_declaration (l_attribute_type, current_file)
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					if not l_special_type.is_expanded then
						current_file.put_character ('*')
					end
					print_type_cast (l_special_type, current_file)
					current_file.put_character ('(')
					print_result_name (current_file)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					if not l_special_type.is_expanded then
						current_file.put_character ('*')
					end
					print_type_cast (l_special_type, current_file)
					current_file.put_character ('(')
					print_current_name (current_file)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					if not l_has_nested_references then
							-- Copy items if they are not reference objects or expanded
							-- objects containing (recursively) reference attributes.
						print_indentation
						current_file.put_string (c_memcpy)
						current_file.put_character ('(')
						print_attribute_special_item_access (tokens.result_keyword, l_special_type, False)
						current_file.put_character (',')
						print_attribute_special_item_access (tokens.current_keyword, l_special_type, False)
						current_file.put_character (',')
						print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
						current_file.put_character ('*')
						current_file.put_string (c_sizeof)
						current_file.put_character ('(')
						print_type_declaration (l_attribute_type, current_file)
						current_file.put_character (')')
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					end
				elseif a_type.is_expanded then
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('*')
					print_current_name (current_file)
					current_file.put_character (';')
					current_file.put_new_line
				else
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_type_declaration (a_type, current_file)
					current_file.put_character (')')
					current_file.put_string (c_ge_alloc)
					current_file.put_character ('(')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_name (a_type, current_file)
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_character ('*')
					print_type_cast (a_type, current_file)
					current_file.put_character ('(')
					print_result_name (current_file)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('*')
					print_type_cast (a_type, current_file)
					current_file.put_character ('(')
					print_current_name (current_file)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
				if l_has_nested_references then
						-- Allocate a 'GE_deep' struct to keep track of already twined
						-- reference objects, or use 'd' if not a null pointer (which
						-- means that the current object is not the root of the deep twin).
					print_indentation
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_character ('!')
					current_file.put_character ('t')
					current_file.put_character ('0')
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string ("t0 = GE_deep_new();")
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
					if not a_type.is_expanded then
							-- Keep track of reference objects already twined.
						print_indentation
						current_file.put_string ("GE_deep_put")
						current_file.put_character ('(')
						print_current_name (current_file)
						current_file.put_character (',')
						current_file.put_character (' ')
						print_result_name (current_file)
						current_file.put_character (',')
						current_file.put_character (' ')
						current_file.put_character ('t')
						current_file.put_character ('0')
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					end
						-- Twin reference attributes or expanded attributes that
						-- contain themselves (recursively) reference attributes
					if l_special_type /= Void then
							-- Twin items.
						if l_attribute_type_set.is_empty then
								-- If the dynamic type set of the items is empty,
								-- then the items is always Void. No need to twin
								-- it in that case.
						elseif l_attribute_type.is_expanded then
								-- If the items are expanded.
								-- We need to deep twin them only if they themselves contain
								-- (recursively) reference attributes. Otherwise we can copy
								-- their contents without further ado.
							if l_attribute_type.has_nested_reference_attributes then
								l_temp := new_temp_variable (current_system.integer_type)
								print_indentation
								current_file.put_string (c_for)
								current_file.put_character (' ')
								current_file.put_character ('(')
								print_temp_name (l_temp, current_file)
								current_file.put_character (' ')
								current_file.put_character ('=')
								current_file.put_character (' ')
								print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
								current_file.put_character (';')
								current_file.put_character (' ')
								print_temp_name (l_temp, current_file)
								current_file.put_character (' ')
								current_file.put_character ('>')
								current_file.put_character ('=')
								current_file.put_character (' ')
								current_file.put_character ('0')
								current_file.put_character (';')
								current_file.put_character (' ')
								print_temp_name (l_temp, current_file)
								current_file.put_character ('-')
								current_file.put_character ('-')
								current_file.put_character (')')
								current_file.put_character (' ')
								current_file.put_character ('{')
								current_file.put_new_line
								indent
								print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_special_indexed_item_access (l_temp,  tokens.result_keyword, a_type, False))
								dedent
								print_indentation
								current_file.put_character ('}')
								current_file.put_new_line
								mark_temp_variable_free (l_temp)
							end
						else
								-- We are in the case of reference items.
							l_temp := new_temp_variable (current_system.integer_type)
							print_indentation
							current_file.put_string (c_for)
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_temp_name (l_temp, current_file)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
							current_file.put_character (';')
							current_file.put_character (' ')
							print_temp_name (l_temp, current_file)
							current_file.put_character (' ')
							current_file.put_character ('>')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('0')
							current_file.put_character (';')
							current_file.put_character (' ')
							print_temp_name (l_temp, current_file)
							current_file.put_character ('-')
							current_file.put_character ('-')
							current_file.put_character (')')
							current_file.put_character (' ')
							current_file.put_character ('{')
							current_file.put_new_line
							indent
							print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_special_indexed_item_access (l_temp,  tokens.result_keyword, a_type, False))
							dedent
							print_indentation
							current_file.put_character ('}')
							current_file.put_new_line
							mark_temp_variable_free (l_temp)
						end
					else
						l_queries := a_type.queries
						nb := a_type.attribute_count
						from i := 1 until i > nb loop
							l_attribute := l_queries.item (i)
							l_attribute_type_set := l_attribute.result_type_set
							l_attribute_type := l_attribute_type_set.static_type
							if l_attribute_type_set.is_empty then
									-- If the dynamic type set of the attribute is empty,
									-- then this attribute is always Void. No need to twin
									-- it in that case.
							elseif l_attribute_type.is_expanded then
									-- If the attribute is expanded, then its contents has
									-- already been copied. We need to deep twin it only if
									-- it itself contains (recursively) reference attributes.
								if l_attribute_type.has_nested_reference_attributes then
									print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_access (l_attribute, tokens.result_keyword, a_type, False))
								end
							else
								print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_access (l_attribute, tokens.result_keyword, a_type, False))
							end
							i := i + 1
						end
						l_tuple_type ?= a_type
						if l_tuple_type /= Void then
							l_item_type_sets := l_tuple_type.item_type_sets
							nb := l_item_type_sets.count
							from i := 1 until i > nb loop
								l_attribute_type_set := l_item_type_sets.item (i)
								l_attribute_type := l_attribute_type_set.static_type
								if l_attribute_type_set.is_empty then
										-- If the dynamic type set of the item is empty,
										-- then this item is always Void. No need to twin
										-- it in that case.
								elseif l_attribute_type.is_expanded then
										-- If the item is expanded, then its contents has
										-- already been copied. We need to deep twin it only if
										-- it itself contains (recursively) reference attributes.
									if l_attribute_type.has_nested_reference_attributes then
										print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_tuple_item_access (i, tokens.result_keyword, a_type, False))
									end
								else
									print_set_deep_twined_attribute (l_attribute_type_set, agent print_attribute_tuple_item_access (i, tokens.result_keyword, a_type, False))
								end
								i := i + 1
							end
						end
					end
						-- Free previously allocated 'GE_deep' struct, if any (i.e. if
						-- the current object was the root object of the deep twin).
					print_indentation
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_character ('t')
					current_file.put_character ('0')
					current_file.put_character (' ')
					current_file.put_character ('!')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('d')
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string ("GE_deep_free(t0);")
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				elseif not a_type.is_expanded then
						-- Keep track of reference objects already twined.
						-- If 'd' is a null pointer, then there is no need
						-- to keep track of this object because it is the
						-- only object to be twined: it is the root object
						-- of the deep twin ('d' being a null pointer) and
						-- it has not reference attributes.
					print_indentation
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_character ('d')
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string ("GE_deep_put")
					current_file.put_character ('(')
					print_current_name (current_file)
					current_file.put_character (',')
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_character ('d')
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				end
			end
				-- Return the deep twined object.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			flush_to_c_file
			reset_temp_variables
			current_type := old_type
		end

	print_deep_twin_polymorphic_call_function (a_target_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Print 'GE_deep_twin<type-id>x' function to `current_file' and its signature to `header_file'.
			-- 'GE_deep_twin<type-id>x' corresponds to a polymorphic call to 'deep_twin'
			-- whose target has `a_target_type_set' as dynamic type set.
			-- 'type-id' is the type-id of the static type of the target.
		require
			a_target_type_set_not_void: a_target_type_set /= Void
		local
			l_target_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]
			l_target_dynamic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]
			l_static_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_type_id: INTEGER
			l_temp: ET_IDENTIFIER
			i, nb: INTEGER
			l_switch: BOOLEAN
			old_type: ET_DYNAMIC_TYPE
		do
			l_static_type := a_target_type_set.static_type
			old_type := current_type
			current_type := l_static_type
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_type_declaration (l_static_type, header_file)
			print_type_declaration (l_static_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_deep_twin)
			current_file.put_string (c_ge_deep_twin)
			header_file.put_integer (l_static_type.id)
			current_file.put_integer (l_static_type.id)
			header_file.put_character ('x')
			current_file.put_character ('x')
			header_file.put_character ('(')
			current_file.put_character ('(')
			print_type_declaration (current_type, header_file)
			print_type_declaration (current_type, current_file)
			if current_type.is_expanded then
				header_file.put_character ('*')
				current_file.put_character ('*')
			end
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_current_name (header_file)
			print_current_name (current_file)
			header_file.put_character (',')
			header_file.put_character (' ')
			current_file.put_character (',')
			current_file.put_character (' ')
			header_file.put_string (c_ge_deep)
			header_file.put_character ('*')
			header_file.put_character (' ')
			header_file.put_character ('t')
			header_file.put_character ('0')
			current_file.put_string (c_ge_deep)
			current_file.put_character ('*')
			current_file.put_character (' ')
			current_file.put_character ('t')
			current_file.put_character ('0')
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			l_target_dynamic_type_ids := target_dynamic_type_ids
			l_target_dynamic_types := target_dynamic_types
			nb := a_target_type_set.count
			from i := 1 until i > nb loop
				l_dynamic_type := a_target_type_set.dynamic_type (i)
				l_type_id := l_dynamic_type.id
				l_target_dynamic_type_ids.force_last (l_type_id)
				l_target_dynamic_types.force_last (l_dynamic_type, l_type_id)
				i := i + 1
			end
			l_target_dynamic_type_ids.sort (dynamic_type_id_sorter)
			if l_switch then
					-- Use switch statement.
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_attribute_type_id_access (tokens.current_keyword, l_static_type, False)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				nb := l_target_dynamic_type_ids.count
				from i := 1 until i > nb loop
					l_type_id := l_target_dynamic_type_ids.item (i)
					l_dynamic_type := l_target_dynamic_types.item (l_type_id)
					print_indentation
					current_file.put_string (c_case)
					current_file.put_character (' ')
					current_file.put_integer (l_type_id)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_adapted_deep_twin_call (tokens.current_keyword, l_dynamic_type, l_static_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					i := i + 1
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_string (c_int)
				current_file.put_character (' ')
				l_temp := temp_variable
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_attribute_type_id_access (tokens.current_keyword, l_static_type, False)
				current_file.put_character (';')
				current_file.put_new_line
					-- Use binary search.
				print_deep_twin_binary_search_polymorphic_call (l_static_type, 1, l_target_dynamic_type_ids.count, l_target_dynamic_type_ids, l_target_dynamic_types)
			end
			l_target_dynamic_type_ids.wipe_out
			l_target_dynamic_types.wipe_out
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_default_entity_value (l_static_type, current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			flush_to_c_file
			current_type := old_type
		end

	print_deep_twin_binary_search_polymorphic_call (a_target_static_type: ET_DYNAMIC_TYPE; l, u: INTEGER; a_target_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]; a_target_dynamic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]) is
			-- Print to `current_file' dynamic binding code for the call to 'GE_deep_twin'
			-- whose target's static type is `a_target_static_type' and whose target's
			-- dynamic types are those stored in `a_target_dynamic_types' whose type-id is
			-- itself stored between indexes `l' and `u' in `a_target_dynamic_type_ids'.
			-- The generated code uses binary search to find out which feature to execute.
		require
			a_target_static_type_not_void: a_target_static_type /= Void
			a_target_dynamic_type_ids_not_void: a_target_dynamic_type_ids /= Void
			a_target_dynamic_types_not_void: a_target_dynamic_types /= Void
			no_void_target_dynamic_type: not a_target_dynamic_types.has_item (Void)
			consistent_count: a_target_dynamic_types.count = a_target_dynamic_type_ids.count
			l_large_enough: l >= 1
			l_small_enough: l <= u
			u_small_enough: u <= a_target_dynamic_type_ids.count
		local
			t: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_type_id: INTEGER
			l_temp: ET_IDENTIFIER
		do
			l_temp := temp_variable
			if l = u then
				l_type_id := a_target_dynamic_type_ids.item (l)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_adapted_deep_twin_call (tokens.current_keyword, l_dynamic_type, a_target_static_type)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			elseif l + 1 = u then
				l_type_id := a_target_dynamic_type_ids.item (l)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_integer (l_type_id)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_adapted_deep_twin_call (tokens.current_keyword, l_dynamic_type, a_target_static_type)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_type_id := a_target_dynamic_type_ids.item (u)
				l_dynamic_type := a_target_dynamic_types.item (l_type_id)
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_adapted_deep_twin_call (tokens.current_keyword, l_dynamic_type, a_target_static_type)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				current_file.put_character ('}')
				current_file.put_new_line
			else
				t := l + (u - l) // 2
				l_type_id := a_target_dynamic_type_ids.item (t)
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_integer (l_type_id)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_deep_twin_binary_search_polymorphic_call (a_target_static_type, l, t, a_target_dynamic_type_ids, a_target_dynamic_types)
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_deep_twin_binary_search_polymorphic_call (a_target_static_type, t + 1, u, a_target_dynamic_type_ids, a_target_dynamic_types)
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_set_deep_twined_attribute (an_attribute_type_set: ET_DYNAMIC_TYPE_SET; a_print_attribute_access: PROCEDURE [ANY, TUPLE]) is
			-- Print to `current_file' the instructions needed to deep twin an attribute
			-- of `current_type' whose dynamic type set is `an_attribute_type_set'.
			-- `a_print_attribute_access' is used to print to `current_file'
			-- the code to access this attribute. Indeed, it can be a "regular"
			-- attribute, but it can also be items of a SPECIAL object, fields
			-- of a TUPLE object, closed operands of an Agent object, ...
		require
			an_attribute_type_set_not_void: an_attribute_type_set /= Void
			an_attribute_type_set_not_empty: not an_attribute_type_set.is_empty
			a_print_attribute_access_not_void: a_print_attribute_access /= Void
		local
			l_attribute_type: ET_DYNAMIC_TYPE
			l_temp1, l_temp2: ET_IDENTIFIER
		do
			l_attribute_type := an_attribute_type_set.static_type
			l_temp1 := new_temp_variable (l_attribute_type)
			print_indentation
			print_temp_name (l_temp1, current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			a_print_attribute_access.call ([])
			current_file.put_character (';')
			current_file.put_new_line
			if l_attribute_type.is_expanded then
					-- No need to test whether the attribute is Void or not:
					-- expanded attributes are never Void.
				print_indentation
				a_print_attribute_access.call ([])
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_deep_twined_attribute (l_temp1, an_attribute_type_set)
				current_file.put_character (';')
				current_file.put_new_line
			else
					-- If the attribute is Void, then there is no need to twin it.
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp1, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				l_temp2 := new_temp_variable (l_attribute_type)
				print_indentation
				print_temp_name (l_temp2, current_file)
				current_file.put_string (" = GE_deep_item(")
				print_temp_name (l_temp1, current_file)
				current_file.put_string (", t0);")
				current_file.put_new_line
				print_indentation
				a_print_attribute_access.call ([])
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp2, current_file)
				current_file.put_character ('?')
					-- The object has not been twined yet.
				print_temp_name (l_temp2, current_file)
				current_file.put_character (':')
				current_file.put_character ('(')
				print_deep_twined_attribute (l_temp1, an_attribute_type_set)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
				mark_temp_variable_free (l_temp2)
			end
			mark_temp_variable_free (l_temp1)
		end

	print_deep_twined_attribute (an_attribute: ET_EXPRESSION; an_attribute_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Print to `current_file' deep twined version of the attribute `an_attribute'
			-- belonging to `current_type', with dynamic type set `an_attribute_type_set'.
			-- The test for Void-ness of the attribute is assumed to have
			-- been generated elsewhere. And the attribute is assumed not to
			-- have been deep twined already.
		require
			an_attribute_not_void: an_attribute /= Void
			an_attribute_type_set_not_void: an_attribute_type_set /= Void
			an_attribute_type_set_not_empty: not an_attribute_type_set.is_empty
		local
			i, nb: INTEGER
			l_attribute_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_standalone_type_set: ET_DYNAMIC_STANDALONE_TYPE_SET
		do
			l_attribute_type := an_attribute_type_set.static_type
			nb := an_attribute_type_set.count
			if nb = 1 then
					-- Monomorphic call.
				l_dynamic_type := an_attribute_type_set.dynamic_type (1)
				deep_twin_types.force_last (l_dynamic_type)
				print_adapted_deep_twin_call (an_attribute, l_dynamic_type, l_attribute_type)
			elseif nb = 2 then
					-- Polymorphic with only two possible types at run-time.
				l_dynamic_type := an_attribute_type_set.dynamic_type (1)
				deep_twin_types.force_last (l_dynamic_type)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_attribute_type_id_access (an_attribute, l_attribute_type, False)
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_integer (l_dynamic_type.id)
				current_file.put_character (')')
				current_file.put_character ('?')
				print_adapted_deep_twin_call (an_attribute, l_dynamic_type, l_attribute_type)
				current_file.put_character (':')
				l_dynamic_type := an_attribute_type_set.dynamic_type (2)
				deep_twin_types.force_last (l_dynamic_type)
				print_adapted_deep_twin_call (an_attribute, l_dynamic_type, l_attribute_type)
				current_file.put_character (')')
			else
					-- Polymorphic with more than two possible types at run-time.
					-- Wrap this polymorphic call into a funtion that will be
					-- shared by other polymorphic calls having the same target
					-- static type.
					--
					-- First, register all what is needed so that this shared
					-- function will be generated correctly.
				deep_feature_target_type_sets.search (l_attribute_type)
				if deep_feature_target_type_sets.found then
					l_standalone_type_set := deep_feature_target_type_sets.found_item
				else
					if standalone_type_sets.count > deep_feature_target_type_sets.count then
						l_standalone_type_set := standalone_type_sets.item (deep_feature_target_type_sets.count + 1)
						l_standalone_type_set.reset (l_attribute_type)
					else
						create l_standalone_type_set.make (l_attribute_type)
						standalone_type_sets.force_last (l_standalone_type_set)
					end
					deep_feature_target_type_sets.force_last (l_standalone_type_set, l_attribute_type)
				end
				l_standalone_type_set.put_types (an_attribute_type_set)
				from i := 1 until i > nb loop
					deep_twin_types.force_last (an_attribute_type_set.dynamic_type (i))
					i := i + 1
				end
					-- Now call the shared function that will trigger the
					-- polymorphic call.
				current_file.put_string (c_ge_deep_twin)
				current_file.put_integer (l_attribute_type.id)
				current_file.put_character ('x')
				current_file.put_character ('(')
				print_target_expression (an_attribute, l_attribute_type, False)
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character ('t')
				current_file.put_character ('0')
				current_file.put_character (')')
			end
		end

	print_adapted_deep_twin_call (a_target: ET_EXPRESSION; a_target_type, a_result_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to the 'GE_deep_twin' function that
			-- will deep twin `a_target' of type `a_target_type'.
			-- `a_result_type' is the static type of the result expected by the caller,
			-- used to adapt the result of 'GE_deep_twin' if needed (see header comment
			-- of `print_adapted_expression' for details).
			-- The test for Void-ness of the target is assumed to have
			-- been generated elsewhere.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
			a_result_type_not_void: a_result_type /= Void
		do
			print_adapted_expression (agent print_deep_twin_call (a_target, a_target_type), a_target_type, a_result_type)
		end

	print_deep_twin_call (a_target: ET_EXPRESSION; a_target_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call to the 'GE_deep_twin' function that
			-- will deep twin `a_target' of type `a_target_type'.
			-- The test for Void-ness of the target is assumed to have
			-- been generated elsewhere.
			-- Note that the result of 'GE_deep_twin' is not adapted to match the
			-- kind of result type expected by the caller. It is recommended to
			-- use `print_adapted_deep_twin_call' whenever possible.
		require
			a_target_not_void: a_target /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			current_file.put_string (c_ge_deep_twin)
			current_file.put_integer (a_target_type.id)
			current_file.put_character ('(')
			print_target_expression (a_target, a_target_type, False)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_character ('t')
			current_file.put_character ('0')
			current_file.put_character (')')
		end

	deep_twin_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of object that need to be deep twined

	deep_equal_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of object that need deep equality

	deep_feature_target_type_sets: DS_HASH_TABLE [ET_DYNAMIC_STANDALONE_TYPE_SET, ET_DYNAMIC_TYPE]
			-- Dynamic type sets of target of deep feature (deep twin or deep equal),
			-- indexed by target static type

feature {NONE} -- Built-in feature generation

	print_builtin_any_conforms_to_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ANY.conforms_to'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_conforming_types: ET_DYNAMIC_TYPE_LIST
			l_non_conforming_types: ET_DYNAMIC_TYPE_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_argument_type_set := current_feature.argument_type_set (1)
			if l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parse.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_argument_type_set = Void then
					-- Internal error: the dynamic type set of the argument
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_argument_type_set.count
				l_conforming_types := conforming_types
				l_conforming_types.resize (nb)
				l_non_conforming_types := non_conforming_types
				l_non_conforming_types.resize (nb)
				from i := 1 until i > nb loop
					l_dynamic_type := l_argument_type_set.dynamic_type (i)
					if current_type.conforms_to_type (l_dynamic_type, current_system) then
						l_conforming_types.put_last (l_dynamic_type)
					else
						l_non_conforming_types.put_last (l_dynamic_type)
					end
					i := i + 1
				end
				if l_non_conforming_types.is_empty then
						-- `current_type' conforms to all types of `l_argument_type_set'.
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_true)
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_conforming_types.is_empty then
						-- `current_type' conforms to none of the types of `l_argument_type_set'.
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_false)
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_non_conforming_types.count < l_conforming_types.count then
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (l_arguments.formal_argument (1).name, current_system.any_type, True)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_non_conforming_types.count
					from i := 1 until i > nb loop
						l_dynamic_type := l_non_conforming_types.dynamic_type (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						i := i + 1
					end
					indent
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_false)
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_string (c_default)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_true)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
				else
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (l_arguments.formal_argument (1).name, current_system.any_type, True)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_conforming_types.count
					from i := 1 until i > nb loop
						l_dynamic_type := l_conforming_types.dynamic_type (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						i := i + 1
					end
					indent
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_true)
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_string (c_default)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_false)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
				end
				l_conforming_types.wipe_out
				l_non_conforming_types.wipe_out
			end
		end

	print_builtin_any_copy_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.copy'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_builtin_any_standard_copy_call (a_feature, a_target_type, a_check_void_target)
		end

	print_builtin_any_deep_twin_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.deep_twin'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			deep_twin_types.force_last (a_target_type)
			current_file.put_string (c_ge_deep_twin)
			current_file.put_integer (a_target_type.id)
			current_file.put_character ('(')
			print_target_expression (call_operands.first, a_target_type, a_check_void_target)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_character ('0')
			current_file.put_character (')')
		end

	print_builtin_any_generating_type_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.generating_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_string: STRING
		do
			l_string := a_target_type.base_type.unaliased_to_text
			current_file.put_string (c_ge_ms)
			current_file.put_character ('(')
			print_escaped_string (l_string)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_generating_type2_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ANY.generating_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_meta_type: ET_DYNAMIC_TYPE
		do
-- TODO: this built-in routine could be inlined.
			l_meta_type := current_type.meta_type
			if l_meta_type = Void then
					-- Internal error: the meta type of current type should have been
					-- computed when analyzing the dynamic type sets of `a_feature'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_meta_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('&')
				current_file.put_character ('(')
				current_file.put_string (c_ge_types)
				current_file.put_character ('[')
				current_file.put_integer (current_type.id)
				current_file.put_character (']')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_generator_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.generator'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_string: STRING
		do
			l_string := a_target_type.base_class.upper_name
			current_file.put_string (c_ge_ms)
			current_file.put_character ('(')
			print_escaped_string (l_string)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_is_deep_equal_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' then body of `a_feature' corresponding
			-- to built-in feature 'ANY.is_deep_equal'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
-- TODO
print ("ET_C_GENERATOR.print_builtin_any_is_deep_equal_body%N")
		end

	print_builtin_any_same_type_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.same_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_static_type: ET_DYNAMIC_TYPE
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := call_operands.item (2)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_argument_static_type := l_argument_type_set.static_type
					if not l_argument_type_set.has_type (a_target_type) then
-- TODO: check to see whether we need to call 'copy' on the argument
-- as part of the argument passing attachment.
						current_file.put_string (c_eif_false)
					elseif l_argument_type_set.count = 1 then
-- TODO: check to see whether we need to call 'copy' on the argument
-- as part of the argument passing attachment.
							-- `a_target_type' is one of the types held in `l_argument_type_set'
							-- (see the if-branch above). Now we know that it is the only one.
						current_file.put_string (c_eif_true)
					else
-- TODO: check to see whether we need to call 'copy' on the argument
-- as part of the argument passing attachment.
						print_type_cast (current_system.boolean_type, current_file)
						current_file.put_character ('(')
							-- We know that the argument is equipped with a type-id
							-- attribute, otherwise `l_argument_static_type' would have
							-- to be a non-generic expanded type, and this is covered
							-- by the elseif-branch just above. Indeed non-generic
							-- expanded types cannot be polymorphic, so the number
							-- of types in `l_argument_type_set' can only be one.
						print_attribute_type_id_access (l_argument, l_argument_static_type, True)
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_integer (a_target_type.id)
						current_file.put_character (')')
					end
				end
			end
		end

	print_builtin_any_standard_is_equal_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.standard_is_equal'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif
					a_target_type.is_expanded and then
					(a_target_type = current_system.boolean_type or
					a_target_type = current_system.character_8_type or
					a_target_type = current_system.character_32_type or
					a_target_type = current_system.integer_8_type or
					a_target_type = current_system.integer_16_type or
					a_target_type = current_system.integer_32_type or
					a_target_type = current_system.integer_64_type or
					a_target_type = current_system.natural_8_type or
					a_target_type = current_system.natural_16_type or
					a_target_type = current_system.natural_32_type or
					a_target_type = current_system.natural_64_type or
					a_target_type = current_system.real_32_type or
					a_target_type = current_system.real_64_type or
					a_target_type = current_system.pointer_type)
				then
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('=')
					current_file.put_character ('=')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('!')
					current_file.put_string (c_memcmp)
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_expression (l_target)
						current_file.put_character (')')
					elseif a_target_type.is_expanded and not a_target_type.is_generic then
							-- We need to unbox the object.
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
						current_file.put_character (')')
					else
						print_expression (l_target)
					end
					current_file.put_character (',')
					current_file.put_character (' ')
					if a_target_type.is_expanded then
-- TODO: address of what when constant or result of a function?
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
						current_file.put_character (')')
					else
						print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					end
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_name (a_target_type, current_file)
					current_file.put_character (')')
					l_special_type ?= a_target_type
					if l_special_type /= Void then
						current_file.put_character ('+')
						print_attribute_special_count_access (l_target, l_special_type, a_check_void_target)
						current_file.put_character ('*')
						current_file.put_string (c_sizeof)
						current_file.put_character ('(')
						print_type_declaration (l_special_type.item_type_set.static_type, current_file)
						current_file.put_character (')')
					end
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_any_standard_copy_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static_binding) to `a_feature'
			-- corresponding to built-in feature 'ANY.standard_copy'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_temp: ET_IDENTIFIER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_special_type ?= a_target_type
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_special_type /= Void then
-- TODO: both objects have to be of the same type.
					print_indentation
					l_temp := new_temp_variable (current_system.integer_type)
					print_temp_name (l_temp, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_attribute_special_count_access (l_argument, l_special_type, True)
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_temp_name (l_temp, current_file)
					current_file.put_character ('<')
					current_file.put_character ('=')
					print_attribute_special_count_access (l_target, l_special_type, a_check_void_target)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string (c_memcpy)
					current_file.put_character ('(')
					print_type_cast (l_special_type, current_file)
					current_file.put_character ('(')
					print_expression (l_target)
					current_file.put_character (')')
					current_file.put_character (',')
					print_type_cast (l_special_type, current_file)
					current_file.put_character ('(')
					print_expression (l_argument)
					current_file.put_character (')')
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_name (l_special_type, current_file)
					current_file.put_character (')')
					current_file.put_character ('+')
					print_temp_name (l_temp, current_file)
					current_file.put_character ('*')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_declaration (l_special_type.item_type_set.static_type, current_file)
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_character (' ')
					current_file.put_string (c_else)
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
-- TODO: what to do if Current is not large enough?
					print_info_message_call ("Exception in SPECIAL.standard_copy: target not big enough")
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				elseif a_target_type.is_expanded then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					print_indentation
					current_file.put_character ('*')
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
					print_expression (l_target)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('*')
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_builtin_any_standard_twin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ANY.standard_twin'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= current_type
			if l_special_type /= Void then
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_result_name (current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_current_name (current_file)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items.
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				print_attribute_special_item_access (tokens.result_keyword, l_special_type, False)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character (',')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			elseif current_type.base_class = universe.type_class then
-- TODO: this built-in routine could be inlined.
					-- Cannot have two instances of class TYPE representing the same Eiffel type.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			elseif current_type.is_expanded then
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('*')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_character ('*')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				print_result_name (current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('*')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				print_current_name (current_file)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_tagged_out_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ANY.tagged_out'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_string: STRING
		do
-- TODO
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			l_string := current_type.base_type.unaliased_to_text
			current_file.put_string (c_ge_ms)
			current_file.put_character ('(')
			print_escaped_string (l_string)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
			l_special_type ?= current_type
			if l_special_type /= Void then
			elseif current_type = current_system.boolean_type then
			elseif current_type = current_system.character_8_type then
			elseif current_type = current_system.character_32_type then
			elseif current_type = current_system.integer_8_type then
			elseif current_type = current_system.integer_16_type then
			elseif current_type = current_system.integer_32_type then
			elseif current_type = current_system.integer_64_type then
			elseif current_type = current_system.natural_8_type then
			elseif current_type = current_system.natural_16_type then
			elseif current_type = current_system.natural_32_type then
			elseif current_type = current_system.natural_64_type then
			elseif current_type = current_system.natural_type then
			elseif current_type = current_system.real_32_type then
			elseif current_type = current_system.real_64_type then
			elseif current_type = current_system.pointer_type then
			else
			end
		end

	print_builtin_any_twin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ANY.twin'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_copy_feature: ET_DYNAMIC_FEATURE
		do
			l_special_type ?= current_type
			if l_special_type /= Void then
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				print_result_name (current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				print_current_name (current_file)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items.
-- TODO: should we rather call SPECIAL.copy?
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				print_attribute_special_item_access (tokens.result_keyword, l_special_type, False)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character (',')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			elseif current_type.base_class = universe.type_class then
-- TODO: this built-in routine could be inlined.
					-- Cannot have two instances of class TYPE representing the same Eiffel type.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			elseif current_type.is_expanded then
-- TODO: call 'copy' if redefined.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('*')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
-- TODO: should the object be duplicated, or should
-- we just get a blank copy before calling `copy'?
				print_indentation
				print_attribute_type_id_access (tokens.result_keyword, current_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (current_type.id)
				current_file.put_character (';')
				current_file.put_new_line
-- TODO: call 'copy' only when redefined.
				l_copy_feature := current_type.seeded_dynamic_procedure (universe.copy_seed, current_system)
				if l_copy_feature = Void then
						-- Internal error: this error should already have been reported during parsing.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if not l_copy_feature.is_generated then
						l_copy_feature.set_generated (True)
						called_features.force_last (l_copy_feature)
					end
					print_indentation
					print_routine_name (l_copy_feature, current_type, current_file)
					current_file.put_character ('(')
					if current_type.is_expanded then
						current_file.put_character ('&')
						print_result_name (current_file)
						current_file.put_character (',')
						current_file.put_character (' ')
						current_file.put_character ('*')
						print_current_name (current_file)
					else
						print_result_name (current_file)
						current_file.put_character (',')
						current_file.put_character (' ')
						print_current_name (current_file)
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_builtin_arguments_argument_count_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'ARGUMENTS.argument_count'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_ge_argc)
			current_file.put_character (' ')
			current_file.put_character ('-')
			current_file.put_character (' ')
			current_file.put_character ('1')
			current_file.put_character (')')
		end

	print_builtin_arguments_argument_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'ARGUMENTS.argument'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			l_arguments := a_feature.arguments
			if l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				current_file.put_string (c_char)
				current_file.put_character ('*')
				current_file.put_character (' ')
				current_file.put_character ('s')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_string (c_ge_argv)
				current_file.put_character ('[')
				print_argument_name (l_arguments.formal_argument (1).name, current_file)
				current_file.put_character (']')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_string ("GE_ms(s,strlen(s))")
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_boolean_and_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "and"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('&')
					current_file.put_character ('&')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_boolean_and_then_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "and then"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('&')
					current_file.put_character ('&')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_boolean_implies_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "implies"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_character ('!')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character ('|')
					current_file.put_character ('|')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_boolean_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN_REF.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			if a_target_type = current_system.boolean_type then
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
				end
			else
					-- Internal attribute.
				print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
			end
		end

	print_builtin_boolean_not_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.prefix "not"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('!')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_or_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "or"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('|')
					current_file.put_character ('|')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_boolean_or_else_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "or else"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('|')
					current_file.put_character ('|')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_boolean_set_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN_REF.set_item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_item_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif a_target_type = current_system.boolean_type then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					l_builtin_item_code := builtin_boolean_feature (builtin_boolean_item)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_item_code then
							l_item_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_item_attribute /= Void then
							-- Set the built-in attribute 'item'.
						print_indentation
						print_attribute_access (l_item_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, current_system.boolean_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_item_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_boolean_xor_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'BOOLEAN.infix "xor"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.boolean_type then
					-- Internal error: given its signature (containing 'like Current') and
					-- considering that no type other than itself conforms to non-generic
					-- expanded types, this routine would have to be redefined (to a
					-- non-built-in feature) in descendants of BOOLEAN. Therefore this
					-- built-in feature can only defined for objects of type BOOLEAN.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('^')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_function_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_feature' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'FUNCTION.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_builtin_routine_call_call (a_feature, a_target_type, a_check_void_target)
		end

	print_builtin_identified_eif_id_object_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'IDENTIFIED.eif_id_object'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := call_operands.item (2)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					include_runtime_header_file ("ge_identified.h", False, header_file)
					current_file.put_string (c_ge_id_object)
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (')')
				end
			end
		end

	print_builtin_identified_eif_object_id_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'IDENTIFIED.eif_object_id'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := call_operands.item (2)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					include_runtime_header_file ("ge_identified.h", False, header_file)
					current_file.put_string (c_ge_object_id)
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.any_type)
					current_file.put_character (')')
				end
			end
		end

	print_builtin_identified_eif_object_id_free_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'IDENTIFIED.eif_object_id_free'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := call_operands.item (2)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					include_runtime_header_file ("ge_identified.h", False, header_file)
					print_indentation
					current_file.put_string (c_ge_object_id_free)
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_builtin_platform_boolean_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.boolean_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_boolean)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_platform_character_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.character_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_character)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_platform_integer_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.integer_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_integer)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_platform_is_dotnet_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.is_dotnet'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_false)
		end

	print_builtin_platform_is_thread_capable_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.is_thread_capable'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_false)
		end

	print_builtin_platform_is_unix_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.is_unix'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_unix)
		end

	print_builtin_platform_is_vms_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.is_vms'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_vms)
		end

	print_builtin_platform_is_windows_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.is_windows'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_windows)
		end

	print_builtin_platform_pointer_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.pointer_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_pointer)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_platform_real_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.real_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_real)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_platform_wide_character_bytes_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PLATFORM.wide_character_bytes'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			current_file.put_string (c_eif_wide_char)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_pointer_hash_code_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'POINTER.hash_code'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= current_system.pointer_type then
-- TODO: it should be able to compute the 'hash_code' in descendants of POINTER.
-- We should use 'item' for that.
					-- Internal error: this built-in feature is only
					-- defined for objects of type POINTER.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character ('&')
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_string ("0x7FFFFFFF")
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_pointer_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'POINTER_REF.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			if a_target_type = current_system.pointer_type then
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
				end
			else
					-- Internal attribute.
				print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
			end
		end

	print_builtin_pointer_out_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'POINTER.out'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
-- TODO: make sure that it works with descendants of POINTER.
-- Use 'item' for that.
			print_indentation
			current_file.put_string (c_char)
			current_file.put_character (' ')
			current_file.put_character ('s')
			current_file.put_character ('[')
			current_file.put_character ('2')
			current_file.put_character ('0')
			current_file.put_character (']')
			current_file.put_character (';')
			current_file.put_new_line
			print_indentation
			current_file.put_string ("int l = snprintf(s,20,%"0x%%lX%",(unsigned long)*C);")
			current_file.put_new_line
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_string ("GE_ms(s,l)")
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_pointer_plus_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'POINTER.infix "+"'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= current_system.pointer_type then
-- TODO: this feature should work in descendants of POINTER.
-- We should use 'item' for that.
					-- Internal error: this built-in feature is only
					-- defined for objects of type POINTER.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.pointer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_string (c_char)
					current_file.put_character ('*')
					current_file.put_character (')')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character ('+')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_pointer_set_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'POINTER_REF.set_item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_item_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif a_target_type = current_system.pointer_type then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					l_builtin_item_code := builtin_pointer_feature (builtin_pointer_item)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_item_code then
							l_item_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_item_attribute /= Void then
							-- Set the built-in attribute 'item'.
						print_indentation
						print_attribute_access (l_item_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, current_system.pointer_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_item_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_pointer_to_integer_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'POINTER.to_integer_32'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= current_system.pointer_type then
-- TODO: this feature should work in descendants of POINTER.
-- We should use 'item' for that.
					-- Internal error: this built-in feature is only
					-- defined for objects of type POINTER.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_procedure_call_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'PROCEDURE.call'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_builtin_routine_call_call (a_feature, a_target_type, a_check_void_target)
		end

	print_builtin_routine_call_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'FUNCTION.item' or 'PROCEDURE.call'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_routine_type: ET_DYNAMIC_ROUTINE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_routine_object: ET_EXPRESSION
			l_tuple: ET_EXPRESSION
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_tuple_target_type: ET_DYNAMIC_TUPLE_TYPE
			l_tuple_target_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_source_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_conforming_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_conforming_types: ET_DYNAMIC_TYPE_LIST
			l_has_non_conforming_types: BOOLEAN
			i, nb: INTEGER
			old_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			old_tuple_index: INTEGER
			l_tuple_item_expression: ET_CALL_EXPRESSION
			old_target: ET_EXPRESSION
			l_query_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_query_target_type_set: ET_DYNAMIC_STANDALONE_TYPE_SET
			l_operand: ET_EXPRESSION
			l_operand_type_set: ET_DYNAMIC_TYPE_SET
		do
			l_tuple_target_type_set := a_feature.argument_type_set (1)
			l_routine_type ?= a_target_type
			if l_routine_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class PROCEDURE (and
					-- its descendants) or class FUNCTION (and its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_tuple_target_type_set = Void then
					-- Internal error: the number of formal and actual arguments
					-- should be the same.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_tuple_target_type ?= l_tuple_target_type_set.static_type
				if l_tuple_target_type = Void then
						-- Internal error: The formal argument of this built-in
						-- routine should be a Tuple type.
					set_fatal_error
					error_handler.report_giaaa_error
				end
				l_routine_object := call_operands.first
				l_tuple := call_operands.item (2)
				l_manifest_tuple ?= l_tuple
				l_tuple_source_type_set := dynamic_type_set (l_tuple)
				if l_tuple_source_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
			if a_feature.is_procedure then
				print_indentation
			end
			if l_tuple_target_type = Void then
				-- Error already reported.
			elseif l_tuple_source_type_set = Void then
				-- Error already reported.
			elseif l_manifest_tuple /= Void then
				l_open_operand_type_sets := l_routine_type.open_operand_type_sets
				nb := l_open_operand_type_sets.count
				if l_manifest_tuple.count < nb then
						-- CAT-call: we don't have enough operands to pass to the routine.
					current_file.put_character ('(')
					print_attachment_expression (l_manifest_tuple, l_tuple_source_type_set, l_tuple_target_type)
					current_file.put_character (')')
				else
						-- We have enough operands to pass to the routine.
					current_file.put_character ('(')
					current_file.put_character ('(')
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
-- TODO: we need to check whether the target is from an expanded descendant of FUNCTION or PROCEDURE.
-- In that case we need to use its address.
					print_expression (l_routine_object)
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_string (c_arrow)
					current_file.put_character ('f')
					current_file.put_character (')')
					current_file.put_character ('(')
					print_expression (l_routine_object)
					from i := 1 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						l_operand := l_manifest_tuple.expression (i)
						l_operand_type_set := dynamic_type_set (l_operand)
						if l_operand_type_set = Void then
								-- Internal error: the dynamic type sets of the operands
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							print_attachment_expression (l_operand, l_operand_type_set, l_open_operand_type_sets.item (i).static_type)
						end
						i := i + 1
					end
					current_file.put_character (')')
				end
			else
					-- Try to find out whether there are some potential CAT-calls,
					-- e.g. there are some Tuple types that don't conform to the
					-- expected type. Here is an example where this can occur:
					--
					--   p: PROCEDURE [ANY, TUPLE [ANY]]
					--   f (a: ANY; i: INTEGER) do ... end
					--   p := agent f
					--   p.call (["gobo"])
					--
					-- The dynamic type of 'p' is PROCEDURE [ANY, TUPLE [ANY, INTEGER]].
					-- So the expected argument type is 'TUPLE [ANY, INTEGER]'. But what
					-- is passed is of type 'TUPLE [STRING]'. We are missing the integer
					-- field to pass to feature 'f'.
				l_conforming_types := conforming_types
				if l_tuple_source_type_set.static_type.conforms_to_type (l_tuple_target_type, current_system) then
						-- All Tuple types conform to the expected one.
						-- Therefore we know for sure that there will be
						-- no CAT-call.
					if not l_tuple_source_type_set.is_never_void or else not l_tuple_source_type_set.is_empty then
						l_tuple_conforming_type_set := l_tuple_source_type_set
					else
							-- Make sure that `is_never_void' is not set when the type set is empty.
						l_conforming_types.append_last (l_tuple_source_type_set)
						conforming_type_set.reset_with_types (l_tuple_target_type, l_conforming_types)
						l_tuple_conforming_type_set := conforming_type_set
					end
				else
						-- Make sure that CAT-call errors will be reported at run-time.
					nb := l_tuple_source_type_set.count
					l_conforming_types.resize (nb)
					from i := 1 until i > nb loop
						l_dynamic_type := l_tuple_source_type_set.dynamic_type (i)
						if l_dynamic_type.conforms_to_type (l_tuple_target_type, current_system) then
							l_conforming_types.put_last (l_dynamic_type)
						else
							l_has_non_conforming_types := True
						end
						i := i + 1
					end
					conforming_type_set.reset_with_types (l_tuple_target_type, l_conforming_types)
					l_tuple_conforming_type_set := conforming_type_set
					if l_tuple_source_type_set.is_never_void and not l_tuple_source_type_set.is_empty then
						l_tuple_conforming_type_set.set_never_void
					end
				end
				if l_has_non_conforming_types then
					current_file.put_character ('(')
					print_attachment_expression (l_tuple, l_tuple_source_type_set, l_tuple_target_type)
					current_file.put_character (',')
				end
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
-- TODO: we need to check whether the target is from an expanded descendant of FUNCTION or PROCEDURE.
-- In that case we need to use its address.
				print_expression (l_routine_object)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('f')
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (l_routine_object)
				l_open_operand_type_sets := l_routine_type.open_operand_type_sets
				nb := l_open_operand_type_sets.count
				if nb > 0 then
						-- Prepare dynamic type sets.
					old_dynamic_type_sets := current_dynamic_type_sets
					l_dynamic_type_sets := internal_dynamic_type_sets
					current_dynamic_type_sets := l_dynamic_type_sets
					l_dynamic_type_sets.resize (old_dynamic_type_sets.count + 2)
					if l_dynamic_type_sets /= old_dynamic_type_sets then
							-- When we were already using the `internal_dynamic_type_sets'
							-- as `current_dynamic_type_sets', then there is no need to
							-- copy the dynamic type sets from one list to the other.
						l_dynamic_type_sets.append_last (old_dynamic_type_sets)
					end
						-- Temporarily change the dynamic type set of the
						-- tuple so that it is only made up of conforming
						-- type, without any remaining CAT-call problems.
					l_dynamic_type_sets.put_last (l_tuple_conforming_type_set)
					old_tuple_index := l_tuple.index
					l_tuple.set_index (l_dynamic_type_sets.count)
						-- Mark the temporary variable representing the tuple and the
						-- routine object as frozen so that they are not reused in any
						-- way when printing the tuple item extract expressions.
					mark_call_operands_frozen
						-- When printing the tuple item extract expressions, it is likely that
						-- `call_operands' will be used and then wiped out (see
						-- `print_qualified_call_expression' which will be called indirectly from
						-- `print_attachment_expression'). Put `call_operands' in a clean state
						-- beforehand to avoid any problem.
					call_operands.wipe_out
						-- Extract the items of the tuple and pass them as argument
						-- of the function to fill in the open operands of the agent.
					from i := 1 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
							-- Prepare the expression to extract the tuple item.
						l_dynamic_type_sets.put_last (l_open_operand_type_sets.item (i))
						l_tuple_item_expression := new_agent_tuple_item_expression (i)
						old_target := l_tuple_item_expression.target
						l_tuple_item_expression.set_target (l_tuple)
						l_tuple_item_expression.set_index (l_dynamic_type_sets.count)
							-- Register the call to extract the tuple item so that
							-- it is handled correctly in case of polymorphism.
						l_query_call := l_tuple_target_type.agent_tuple_item_calls.item (i)
						if l_query_call = Void then
							create l_query_target_type_set.make (l_tuple_target_type)
							if l_tuple_conforming_type_set.is_never_void then
								l_query_target_type_set.set_never_void
							end
							l_query_target_type_set.put_types (l_tuple_conforming_type_set)
							create l_query_call.make (l_tuple_item_expression, l_query_target_type_set, l_tuple_target_type.item_type_sets.item (i), current_feature, current_type)
							l_tuple_target_type.agent_tuple_item_calls.replace (l_query_call, i)
							l_tuple_target_type.put_query_call (l_query_call)
						else
							l_query_target_type_set ?= l_query_call.target_type_set
							if l_query_target_type_set /= Void then
								l_query_target_type_set.put_types (l_tuple_conforming_type_set)
								if not l_tuple_conforming_type_set.is_never_void then
									l_query_target_type_set.propagate_can_be_void (l_tuple_conforming_type_set)
								end
							else
									-- Internal error: we expected to have a standalone dynamic type set here.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
							-- Print the actual call to extract the tuple item.
						print_attachment_expression (l_tuple_item_expression, l_open_operand_type_sets.item (i), l_open_operand_type_sets.item (i).static_type)
							-- Clean up.
						l_tuple_item_expression.set_target (old_target)
						l_dynamic_type_sets.remove_last
							-- No need to check for the void-ness of the tuple when accessing
							-- each of its items. The first time is enough.
						l_tuple_conforming_type_set.set_never_void
						i := i + 1
					end
						-- Clean up.
					l_tuple.set_index (old_tuple_index)
					current_dynamic_type_sets := old_dynamic_type_sets
					if l_dynamic_type_sets /= old_dynamic_type_sets then
						l_dynamic_type_sets.wipe_out
					else
							-- We were already using `internal_dynamic_type_sets' as
							-- `current_dynamic_type_sets'. We just have to remove the
							-- dynamic type set that have been inserted here, and
							-- leave all the others as they were before.
						l_dynamic_type_sets.remove_last
					end
						-- Put back the operands of current call onto `call_operands'.
					call_operands.put_last (l_routine_object)
					call_operands.put_last (l_tuple)
						-- Unfreeze the temporary variables corresponding to the tuple
						-- and routine objects.
					mark_call_operands_unfrozen
				end
				current_file.put_character (')')
				if l_has_non_conforming_types then
					current_file.put_character (')')
				end
					-- Clean up.
				conforming_type_set.reset_with_types (current_system.none_type, Void)
				l_conforming_types.wipe_out
			end
			if a_feature.is_procedure then
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_sized_character_code_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx.code'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_character_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type CHARACTER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_character_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx_REF.item'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			if a_target_type = a_character_type then
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
				end
			else
					-- Internal attribute.
				print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_character_natural_32_code_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx.natural_32_code'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_character_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type CHARACTER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.natural_32_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_character_set_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx_REF.set_item'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `a_character_type'.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_item_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif a_target_type = a_character_type then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_character_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_character_item)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_item_code then
							l_item_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_item_attribute /= Void then
							-- Set the built-in attribute 'item'.
						print_indentation
						print_attribute_access (l_item_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, a_character_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_item_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_sized_character_to_character_8_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx.to_character_8'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_character_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type CHARACTER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.character_8_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_character_to_character_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_character_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'CHARACTER_xx.to_character_32'
			-- from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_character_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type CHARACTER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.character_32_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_integer_8_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_integer_8'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_8_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_integer_16_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_integer_16'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_16_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_integer_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_integer_32'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_integer_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_integer_64'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_64_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_natural_8_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_natural_8'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.natural_8_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_natural_16_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_natural_16'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.natural_16_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_natural_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_natural_32'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.natural_32_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_as_natural_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.as_natural_64'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.natural_64_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_and_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_and'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('&')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_bit_not_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_not'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('~')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_or_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_or'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('|')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_bit_shift_left_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_shift_left'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('<')
					current_file.put_character ('<')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_bit_shift_right_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_shift_right'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('>')
					current_file.put_character ('>')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_bit_xor_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.bit_xor'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('^')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_div_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "//"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('/')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_divide_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "/"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.double_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('/')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_identity_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.prefix "+"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx_REF.item'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			if a_target_type = an_integer_type then
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
				end
			else
					-- Internal attribute.
				print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_integer_lt_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "<"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('<')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_minus_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "-"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_mod_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "\\"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('%%')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_opposite_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.prefix "-"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('-')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_plus_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "+"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('+')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_power_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "^"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					include_runtime_header_file ("ge_integer.h", False, header_file)
					print_type_cast (current_system.double_type, current_file)
					current_file.put_string (c_ge_power)
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.double_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_set_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print to `current_file' a call (static file) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_REF.set_item'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `an_integer_type'.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_item_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif a_target_type = an_integer_type then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, an_integer_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_integer_item)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_item_code then
							l_item_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_item_attribute /= Void then
							-- Set the built-in attribute 'item'.
						print_indentation
						print_attribute_access (l_item_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, an_integer_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_item_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_sized_integer_times_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.infix "*"'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (an_integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('*')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_integer_to_character_8_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_character_8'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.character_8_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_character_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_character_32'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.character_32_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_double_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_double'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_real_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_real'
			-- from sized integer type `an_integer_type',
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.real_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_real_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_real_32'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.real_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_real_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'INTEGER_xx.to_real_64'
			-- from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= an_integer_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type INTEGER_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_ceiling_real_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.ceiling_real_32'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_real.h", False, header_file)
				print_type_cast (current_system.real_32_type, current_file)
				current_file.put_string (c_ge_ceiling)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_ceiling_real_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.ceiling_real_64'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_real.h", False, header_file)
				print_type_cast (current_system.real_64_type, current_file)
				current_file.put_string (c_ge_ceiling)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_divide_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "/"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (a_real_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('/')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_floor_real_32_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.floor_real_32'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_real.h", False, header_file)
				print_type_cast (current_system.real_32_type, current_file)
				current_file.put_string (c_ge_floor)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_floor_real_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.floor_real_64'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_real.h", False, header_file)
				print_type_cast (current_system.real_64_type, current_file)
				current_file.put_string (c_ge_floor)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_identity_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.prefix "+"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx_REF.item'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			if a_target_type = a_real_type then
				l_target_type_set := dynamic_type_set (l_target)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
				end
			else
					-- Internal attribute.
				print_attribute_access (a_feature, l_target, a_target_type, a_check_void_target)
			end
		end

	print_builtin_sized_real_lt_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "<"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (current_system.boolean_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('<')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_minus_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "-"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (a_real_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_opposite_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.prefix "-"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('-')
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_out_body (a_feature: ET_EXTERNAL_ROUTINE; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'REAL_xx.out' from sized real type `a_real_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			a_real_type_not_void: a_real_type /= Void
		do
			print_indentation
			current_file.put_string (c_char)
			current_file.put_character (' ')
			current_file.put_character ('s')
			current_file.put_character ('[')
			current_file.put_character ('4')
			current_file.put_character ('0')
			current_file.put_character (']')
			current_file.put_character (';')
			current_file.put_new_line
			print_indentation
			if a_real_type = current_system.real_32_type then
				current_file.put_string ("int l = snprintf(s,40,%"%%g%",*C);")
			else
				current_file.put_string ("int l = snprintf(s,40,%"%%.17g%",*C);")
			end
			current_file.put_new_line
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_string ("GE_ms(s,l)")
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_sized_real_plus_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "+"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (a_real_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('+')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_power_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "^"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					include_runtime_header_file ("ge_real.h", False, header_file)
					print_type_cast (current_system.double_type, current_file)
					current_file.put_string (c_ge_power)
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_string (c_double)
					current_file.put_character (')')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.double_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_set_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx_REF.set_item'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `a_real_type'.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_item_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif a_target_type = a_real_type then
					print_indentation
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_real_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_real_item)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_item_code then
							l_item_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_item_attribute /= Void then
							-- Set the built-in attribute 'item'.
						print_indentation
						print_attribute_access (l_item_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, a_real_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_item_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_sized_real_times_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.infix "*"'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_type_cast (a_real_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					l_target_static_type := l_target_type_set.static_type
					if l_target_static_type.is_expanded then
							-- Current value.
						print_expression (l_target)
					else
							-- We need to unbox the object.
						print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
					end
					current_file.put_character (')')
					current_file.put_character ('*')
					current_file.put_character ('(')
					print_attachment_expression (l_argument, l_argument_type_set, a_target_type)
					current_file.put_character (')')
					current_file.put_character (')')
				end
			end
		end

	print_builtin_sized_real_to_double_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.to_double'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_truncated_to_integer_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.truncated_to_integer'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_truncated_to_integer_64_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.truncated_to_integer_64'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_64_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_truncated_to_real_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN; a_real_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'REAL_xx.truncated_to_real'
			-- from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_static_type: ET_DYNAMIC_TYPE
		do
			l_target := call_operands.first
			l_target_type_set := dynamic_type_set (l_target)
			if a_target_type /= a_real_type then
					-- Internal error: this built-in feature is only
					-- defined for objects of type REAL_xx.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- of the call should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.real_32_type, current_file)
				current_file.put_character ('(')
				l_target_static_type := l_target_type_set.static_type
				if l_target_static_type.is_expanded then
						-- Current value.
					print_expression (l_target)
				else
						-- We need to unbox the object.
					print_boxed_attribute_item_access (l_target, a_target_type, a_check_void_target)
				end
				current_file.put_character (')')
			end
		end

	print_builtin_special_aliased_resized_area_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'SPECIAL.aliased_resized_area'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: ET_IDENTIFIER
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_temp: ET_IDENTIFIER
		do
			l_arguments := a_feature.arguments
			l_special_type ?= current_type
			if l_special_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class SPECIAL (and its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parse.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_temp := new_temp_variable (current_system.integer_type)
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				l_name := l_arguments.formal_argument (1).name
				print_argument_name (l_name, current_file)
				current_file.put_character ('>')
				print_temp_name (l_temp, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
					-- Need to allocate a new object.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				print_argument_name (l_name, current_file)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_result_name (current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_current_name (current_file)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy old items.
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				print_attribute_special_item_access (tokens.result_keyword, l_special_type, False)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type, False)
				current_file.put_character (',')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
-- TODO: initialize new items when expanded.
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
					-- Set new count.
				print_indentation
				print_attribute_special_count_access (tokens.result_keyword, l_special_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_argument_name (l_name, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_special_count_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'SPECIAL.count'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_attribute_special_count_access (call_operands.first, a_target_type, a_check_void_target)
		end

	print_builtin_special_element_size_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'SPECIAL.element_size'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= a_target_type
			if l_special_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class SPECIAL (and its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			else
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
			end
		end

	print_builtin_special_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'SPECIAL.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := call_operands.item (2)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_attribute_special_item_access (call_operands.first, a_target_type, a_check_void_target)
					current_file.put_character ('[')
					print_attachment_expression (l_argument, l_argument_type_set, current_system.integer_type)
					current_file.put_character (']')
				end
			end
		end

	print_builtin_special_put_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'SPECIAL.put'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_argument1: ET_EXPRESSION
			l_argument1_type_set: ET_DYNAMIC_TYPE_SET
			l_argument2: ET_EXPRESSION
			l_argument2_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			if call_operands.count /= 3 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_special_type ?= a_target_type
				l_argument1 := call_operands.item (2)
				l_argument1_type_set := dynamic_type_set (l_argument1)
				l_argument2 := call_operands.item (3)
				l_argument2_type_set := dynamic_type_set (l_argument2)
				if l_special_type = Void then
						-- Internal error: this was already reported during parsing.
						-- This built-in can only be in class SPECIAL (and its descendants).
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument1_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument2_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_indentation
					print_attribute_special_item_access (call_operands.first, a_target_type, a_check_void_target)
					current_file.put_character ('[')
					print_attachment_expression (l_argument2, l_argument2_type_set, current_system.integer_type)
					current_file.put_character (']')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attachment_expression (l_argument1, l_argument1_type_set, l_special_type.item_type_set.static_type)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
		end

	print_builtin_tuple_boolean_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.boolean_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.boolean_type)
		end

	print_builtin_tuple_character_8_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.character_8_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.character_8_type)
		end

	print_builtin_tuple_character_32_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.character_32_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.character_32_type)
		end

	print_builtin_tuple_count_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'TUPLE.count'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
		do
			l_tuple_type ?= a_target_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_integer (l_tuple_type.item_type_sets.count)
				current_file.put_character (')')
			end
		end

	print_builtin_tuple_integer_8_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.integer_8_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.integer_8_type)
		end

	print_builtin_tuple_integer_16_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.integer_16_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.integer_16_type)
		end

	print_builtin_tuple_integer_32_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.integer_32_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.integer_type)
		end

	print_builtin_tuple_integer_64_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.integer_64_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.integer_64_type)
		end

	print_builtin_tuple_item_code_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.item_code'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_tuple_type ?= current_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_argument_name (l_arguments.formal_argument (1).name, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_item_type_sets := l_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					print_indentation
					current_file.put_string (c_case)
					current_file.put_character (' ')
					current_file.put_integer (i)
					current_file.put_character (':')
					current_file.put_new_line
					indent
					print_indentation
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_type_cast (current_system.natural_8_type, current_file)
					l_item_type := l_item_type_sets.item (i).static_type
					if l_item_type = current_system.boolean_type then
						current_file.put_integer (0x01)
					elseif l_item_type = current_system.character_8_type then
						current_file.put_integer (0x02)
					elseif l_item_type = current_system.character_32_type then
						current_file.put_integer (0x0E)
					elseif l_item_type = current_system.integer_8_type then
						current_file.put_integer (0x06)
					elseif l_item_type = current_system.integer_16_type then
						current_file.put_integer (0x07)
					elseif l_item_type = current_system.integer_32_type then
						current_file.put_integer (0x08)
					elseif l_item_type = current_system.integer_64_type then
						current_file.put_integer (0x09)
					elseif l_item_type = current_system.natural_8_type then
						current_file.put_integer (0x0A)
					elseif l_item_type = current_system.natural_16_type then
						current_file.put_integer (0x0B)
					elseif l_item_type = current_system.natural_32_type then
						current_file.put_integer (0x0C)
					elseif l_item_type = current_system.natural_64_type then
						current_file.put_integer (0x0D)
					elseif l_item_type = current_system.pointer_type then
						current_file.put_integer (0x05)
					elseif l_item_type = current_system.real_32_type then
						current_file.put_integer (0x04)
					elseif l_item_type = current_system.real_64_type then
						current_file.put_integer (0x03)
					else
						current_file.put_integer (0x00)
					end
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_break)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					i := i + 1
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_builtin_tuple_natural_8_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.natural_8_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.natural_8_type)
		end

	print_builtin_tuple_natural_16_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.natural_16_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.natural_16_type)
		end

	print_builtin_tuple_natural_32_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.natural_32_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.natural_32_type)
		end

	print_builtin_tuple_natural_64_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.natural_64_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.natural_64_type)
		end

	print_builtin_tuple_object_comparison_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'TUPLE.object_comparison'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
				-- Internal attribute.
			print_attribute_access (a_feature, call_operands.first, a_target_type, a_check_void_target)
		end

	print_builtin_tuple_pointer_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.pointer_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.pointer_type)
		end

	print_builtin_tuple_put_boolean_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_boolean'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.boolean_type)
		end

	print_builtin_tuple_put_character_8_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_character_8'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.character_8_type)
		end

	print_builtin_tuple_put_character_32_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_character_32'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.character_32_type)
		end

	print_builtin_tuple_put_integer_8_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_integer_8'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.integer_8_type)
		end

	print_builtin_tuple_put_integer_16_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_integer_16'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.integer_16_type)
		end

	print_builtin_tuple_put_integer_32_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_integer_32'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.integer_type)
		end

	print_builtin_tuple_put_integer_64_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_integer_64'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.integer_64_type)
		end

	print_builtin_tuple_put_natural_8_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_natural_8'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.natural_8_type)
		end

	print_builtin_tuple_put_natural_16_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_natural_16'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.natural_16_type)
		end

	print_builtin_tuple_put_natural_32_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_natural_32'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.natural_32_type)
		end

	print_builtin_tuple_put_natural_64_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_natural_64'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.natural_64_type)
		end

	print_builtin_tuple_put_pointer_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_pointer'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.pointer_type)
		end

	print_builtin_tuple_put_real_32_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_real_32'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.real_type)
		end

	print_builtin_tuple_put_real_64_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_real_64'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_put_typed_item_body (a_feature, current_system.double_type)
		end

	print_builtin_tuple_put_reference_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.put_reference'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type: ET_DYNAMIC_TYPE
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument: ET_IDENTIFIER
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_tuple_type ?= current_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 2 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_argument := l_arguments.formal_argument (1).name
				l_argument_type_set := current_feature.dynamic_type_set (l_argument)
				if l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the formal
						-- argument should be know at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_argument_name (l_arguments.formal_argument (2).name, current_file)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					l_item_type_sets := l_tuple_type.item_type_sets
					nb := l_item_type_sets.count
					from i := 1 until i > nb loop
						l_item_type := l_item_type_sets.item (i).static_type
						if
							not l_item_type.is_expanded or else
							(l_item_type /= current_system.boolean_type and
							l_item_type /= current_system.character_8_type and
							l_item_type /= current_system.character_32_type and
							l_item_type /= current_system.integer_8_type and
							l_item_type /= current_system.integer_16_type and
							l_item_type /= current_system.integer_type and
							l_item_type /= current_system.integer_32_type and
							l_item_type /= current_system.natural_8_type and
							l_item_type /= current_system.natural_16_type and
							l_item_type /= current_system.natural_32_type and
							l_item_type /= current_system.natural_64_type and
							l_item_type /= current_system.pointer_type and
							l_item_type /= current_system.real_type and
							l_item_type /= current_system.double_type)
						then
							print_indentation
							current_file.put_string (c_case)
							current_file.put_character (' ')
							current_file.put_integer (i)
							current_file.put_character (':')
							current_file.put_new_line
							indent
							print_indentation
							print_attribute_tuple_item_access (i, tokens.current_keyword, l_tuple_type, False)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
-- TODO: Using `print_attachment_expression' may trigger a call to 'copy'. We should avoid that.
-- Use `print_attachment_expression' anyway here so that there is no object of the wrong type
-- assigned to the Tuple item (this is forbidden by the preconditions, but we should not let them
-- go through when preconditions are turn off for example).
							print_attachment_expression (l_argument, l_argument_type_set, l_item_type)
							current_file.put_character (';')
							current_file.put_new_line
							print_indentation
							current_file.put_string (c_break)
							current_file.put_character (';')
							current_file.put_new_line
							dedent
						end
						i := i + 1
					end
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				end
			end
		end

	print_builtin_tuple_put_typed_item_body (a_feature: ET_EXTERNAL_ROUTINE; an_item_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to a built-in feature of class "TUPLE" that sets the items
			-- of type `an_item_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			an_item_type_not_void: an_item_type /= Void
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_tuple_type ?= current_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 2 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_argument_name (l_arguments.formal_argument (2).name, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_item_type_sets := l_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					if l_item_type_sets.item (i).static_type = an_item_type then
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (i)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_indentation
						print_attribute_tuple_item_access (i, tokens.current_keyword, l_tuple_type, False)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_argument_name (l_arguments.formal_argument (1).name, current_file)
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						current_file.put_string (c_break)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
					end
					i := i + 1
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_builtin_tuple_real_32_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.real_32_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.real_type)
		end

	print_builtin_tuple_real_64_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.real_64_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_builtin_tuple_typed_item_body (a_feature, current_system.double_type)
		end

	print_builtin_tuple_reference_item_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to built-in feature 'TUPLE.reference_item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type: ET_DYNAMIC_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_tuple_type ?= current_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_argument_name (l_arguments.formal_argument (1).name, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_item_type_sets := l_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					l_item_type_set := l_item_type_sets.item (i)
					l_item_type := l_item_type_set.static_type
					if
						not l_item_type.is_expanded or else
						(l_item_type /= current_system.boolean_type and
						l_item_type /= current_system.character_8_type and
						l_item_type /= current_system.character_32_type and
						l_item_type /= current_system.integer_8_type and
						l_item_type /= current_system.integer_16_type and
						l_item_type /= current_system.integer_type and
						l_item_type /= current_system.integer_32_type and
						l_item_type /= current_system.natural_8_type and
						l_item_type /= current_system.natural_16_type and
						l_item_type /= current_system.natural_32_type and
						l_item_type /= current_system.natural_64_type and
						l_item_type /= current_system.pointer_type and
						l_item_type /= current_system.real_type and
						l_item_type /= current_system.double_type)
					then
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (i)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_indentation
						print_result_name (current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_adapted_expression (agent print_attribute_tuple_item_access (i, tokens.current_keyword, l_tuple_type, False), l_item_type_set, current_system.any_type)
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						current_file.put_string (c_break)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
					end
					i := i + 1
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_builtin_tuple_set_object_comparison_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'TUPLE.set_object_comparison'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_target: ET_EXPRESSION
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_argument: ET_EXPRESSION
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_object_comparison_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_object_comparison_code: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target := call_operands.first
				l_argument := call_operands.item (2)
				l_target_type_set := dynamic_type_set (l_target)
				l_argument_type_set := dynamic_type_set (l_argument)
				if l_target_type_set = Void then
						-- Internal error: the dynamic type set of the target
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_argument_type_set = Void then
						-- Internal error: the dynamic type set of the argument
						-- of the call should be known at this stage.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_builtin_object_comparison_code := builtin_tuple_feature (builtin_tuple_object_comparison)
					l_queries := a_target_type.queries
					nb := a_target_type.attribute_count
					from i := 1 until i > nb loop
						l_query := l_queries.item (i)
						if l_query.builtin_code = l_builtin_object_comparison_code then
							l_object_comparison_attribute := l_query
							i := nb + 1
						else
							i := i + 1
						end
					end
					if l_object_comparison_attribute /= Void then
							-- Set the built-in attribute 'object_comparison'.
						print_indentation
						print_attribute_access (l_object_comparison_attribute, l_target, a_target_type, a_check_void_target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attachment_expression (l_argument, l_argument_type_set, current_system.boolean_type)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					else
						-- If `l_object_comparison_attribute' is Void, it means that it is never used,
						-- therefore there is no need to set it.
					end
				end
			end
		end

	print_builtin_tuple_typed_item_body (a_feature: ET_EXTERNAL_ROUTINE; an_item_type: ET_DYNAMIC_TYPE) is
			-- Print to `current_file' the body of `a_feature' corresponding
			-- to a built-in feature of class "TUPLE" that returns the items
			-- of type `an_item_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			an_item_type_not_void: an_item_type /= Void
		local
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			i, nb: INTEGER
		do
			l_arguments := a_feature.arguments
			l_tuple_type ?= current_type
			if l_tuple_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in feature can only be in class TUPLE (and
					-- its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_argument_name (l_arguments.formal_argument (1).name, current_file)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_item_type_sets := l_tuple_type.item_type_sets
				nb := l_item_type_sets.count
				from i := 1 until i > nb loop
					if l_item_type_sets.item (i).static_type = an_item_type then
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (i)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_indentation
						print_result_name (current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_attribute_tuple_item_access (i, tokens.current_keyword, l_tuple_type, False)
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						current_file.put_string (c_break)
						current_file.put_character (';')
						current_file.put_new_line
						dedent
					end
					i := i + 1
				end
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_builtin_type_generating_type_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print to `current_file' then body of `a_feature' corresponding
			-- to built-in feature 'TYPE.generating_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
-- TODO: what to do to avoid having a infinite number of types?
		end

	print_builtin_type_name_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'TYPE.name'>
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_string: STRING
		do
			l_parameters := a_target_type.base_type.actual_parameters
			if l_parameters = Void or else l_parameters.count < 1 then
					-- Internal error: we should have already checked by now
					-- that class TYPE has a generic parameter.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_string := l_parameters.type (1).unaliased_to_text
				current_file.put_string (c_ge_ms)
				current_file.put_character ('(')
				print_escaped_string (l_string)
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_integer (l_string.count)
				current_file.put_character (')')
			end
		end

	print_builtin_type_type_id_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_check_void_target: BOOLEAN) is
			-- Print to `current_file' a call (static binding) to `a_feature'
			-- corresponding to built-in feature 'TYPE.type_id'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_check_void_target' means that we need to check whether the target is Void or not.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (c_eif_type)
			current_file.put_character ('*')
			current_file.put_character (')')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			current_file.put_string (c_type_id)
		end

feature {NONE} -- C function generation

	print_main_function is
			-- Print 'main' function to `current_file'.
		local
			l_root_type: ET_DYNAMIC_TYPE
			l_root_creation: ET_DYNAMIC_FEATURE
			l_temp: ET_IDENTIFIER
		do
			current_file.put_line ("int main(int argc, char** argv)")
			current_file.put_character ('{')
			current_file.put_new_line
			l_root_type := current_system.root_type
			l_root_creation := current_system.root_creation_procedure
			if l_root_type /= Void and l_root_creation /= Void then
				indent
				print_indentation
				print_type_declaration (l_root_type, current_file)
				current_file.put_character (' ')
				l_temp := temp_variable
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_line ("GE_argc = argc;")
				print_indentation
				current_file.put_line ("GE_argv = argv;")
				print_indentation
				current_file.put_line ("GE_rescue = 0;")
				print_indentation
				current_file.put_line ("GE_init_gc();")
				print_indentation
				current_file.put_line ("GE_const_init();")
					-- Initialize variable used in WEL.
				include_runtime_header_file ("eif_main.h", False, header_file)
				current_file.put_string (c_ifdef)
				current_file.put_character (' ')
				current_file.put_line (c_eif_windows)
				print_indentation
				current_file.put_line ("eif_hInstance = GetModuleHandle(NULL);")
				current_file.put_line (c_endif)
				if trace_mode then
						-- We need to make sure that a DOS console is available (for
						-- Windows application) when in trace mode, because information
						-- will be displayed to the console.
					current_file.put_string (c_ifdef)
					current_file.put_character (' ')
					current_file.put_line (c_eif_trace)
					print_show_console_call
					current_file.put_line (c_endif)
				end
					-- Create root object.
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_creation_expression (l_temp, l_root_type, l_root_creation, Void)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
			end
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_manifest_string_function is
			-- Print 'GE_ms' function to `current_file' and its signature to `header_file'.
			-- 'GE_ms' is used to create manifest strings.
		local
			l_string_type: ET_DYNAMIC_TYPE
			l_area_type: ET_DYNAMIC_TYPE
			l_count_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_queries: ET_DYNAMIC_FEATURE_LIST
		do
			l_string_type := current_system.string_type
			l_area_type := current_system.special_character_type
			l_count_type := current_system.integer_type
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_type_declaration (l_string_type, header_file)
			print_type_declaration (l_string_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_ms)
			current_file.put_string (c_ge_ms)
			header_file.put_string ("(char* s, ")
			current_file.put_string ("(char* s, ")
			print_type_declaration (l_count_type, header_file)
			print_type_declaration (l_count_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_character ('c')
			current_file.put_character ('c')
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			print_indentation
			print_type_declaration (l_string_type, current_file)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			if l_string_type.is_alive then
				l_temp := temp_variable
				print_indentation
				print_type_declaration (l_area_type, current_file)
				current_file.put_character (' ')
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Create 'area'.
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_area_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_area_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
					-- Note: no need to allocate an extra character for '\0', it
					-- is already included with the "struct hack" used to implement
					-- SPECIAL objects.
				current_file.put_character ('c')
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (current_system.character_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of 'area'.
				print_indentation
				print_attribute_type_id_access (l_temp, l_area_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_area_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'count' of 'area'.
				print_indentation
				print_attribute_special_count_access (l_temp, l_area_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_character ('c')
				current_file.put_character ('+')
				current_file.put_character ('1')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy characters to 'area'.
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				print_attribute_special_item_access (l_temp, l_area_type, False)
				current_file.put_line (", s, c);")
					-- Create string object.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_string_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_string_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of string.
				print_indentation
				print_attribute_type_id_access (tokens.result_keyword, l_string_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_string_type.id)
				current_file.put_character (';')
				current_file.put_new_line
				l_queries := l_string_type.queries
				if l_string_type.attribute_count < 2 then
						-- Internal error: the STRING type should have at least
						-- the attributes 'area' and 'count' as first features.
					set_fatal_error
					error_handler.report_giaaa_error
				else
						-- Set 'area'.
					print_indentation
					print_attribute_access (l_queries.first, tokens.result_keyword, l_string_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_temp_name (l_temp, current_file)
					current_file.put_character (';')
					current_file.put_new_line
						-- Set 'count'.
					print_indentation
					print_attribute_access (l_queries.item (2), tokens.result_keyword, l_string_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_type_cast (l_count_type, current_file)
					current_file.put_character ('c')
					current_file.put_character (';')
					current_file.put_new_line
				end
			else
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_string (c_eif_void)
				current_file.put_character (';')
				current_file.put_new_line
			end
				-- Return the string.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_manifest_array_function (an_array_type: ET_DYNAMIC_TYPE) is
			-- Print 'GE_ma' function to `current_file' and its signature to `header_file'.
			-- 'GE_ma<type-id>' is used to create manifest arrays of type 'type-id'.
		require
			an_array_type_not_void: an_array_type /= Void
		local
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_item_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
		do
			l_queries := an_array_type.queries
			if an_array_type.attribute_count < 3 then
					-- Internal error: class ARRAY should have at least the
					-- features 'area', 'lower' and 'upper' as first features.
					-- Already reported in ET_SYSTEM.compile_kernel.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_area_type_set := l_queries.first.result_type_set
				if l_area_type_set = Void then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_special_type ?= l_area_type_set.static_type
					if l_special_type = Void then
							-- Internal error: it has already been checked in ET_SYSTEM.compile_kernel
							-- that the attribute `area' is of SPECIAL type.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				end
			end
			if l_special_type /= Void then
				l_item_type := l_special_type.item_type_set.static_type
					-- Print signature to `header_file' and `current_file'.
				header_file.put_string (c_extern)
				header_file.put_character (' ')
				print_type_declaration (an_array_type, header_file)
				print_type_declaration (an_array_type, current_file)
				header_file.put_character (' ')
				current_file.put_character (' ')
				header_file.put_string (c_ge_ma)
				current_file.put_string (c_ge_ma)
				header_file.put_integer (an_array_type.id)
				current_file.put_integer (an_array_type.id)
					-- Use varargs rather than inlining the code, this
					-- makes the C compilation with the -O2 faster and
					-- the resulting application is not slower.
				header_file.put_character ('(')
				print_type_declaration (current_system.integer_type, header_file)
				header_file.put_string (" c, ...)")
				current_file.put_character ('(')
				print_type_declaration (current_system.integer_type, current_file)
				current_file.put_string (" c, ...)")
				header_file.put_character (';')
				header_file.put_new_line
				current_file.put_new_line
					-- Print body to `current_file'.
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_type_declaration (an_array_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
				l_temp := temp_variable
				print_indentation
				print_type_declaration (l_special_type, current_file)
				current_file.put_character (' ')
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Create 'area'.
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('c')
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_item_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of 'area'.
				print_indentation
				print_attribute_type_id_access (l_temp, l_special_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_special_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'count' of 'area'.
				print_indentation
				print_attribute_special_count_access (l_temp, l_special_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('c')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items to 'area'.
				print_indentation
				current_file.put_line ("if (c!=0) {")
				indent
				print_indentation
				current_file.put_line ("va_list v;")
				print_indentation
				print_type_declaration (current_system.integer_type, current_file)
				current_file.put_line (" n = c;")
				print_indentation
				print_type_declaration (l_item_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('*')
				current_file.put_character ('i')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_attribute_special_item_access (l_temp, l_special_type, False)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_line ("va_start(v, c);")
				print_indentation
				current_file.put_line ("while (n--) {")
				indent
				print_indentation
				if
					l_item_type = current_system.boolean_type or
					l_item_type = current_system.character_8_type or
					l_item_type = current_system.integer_8_type or
					l_item_type = current_system.natural_8_type or
					l_item_type = current_system.integer_16_type or
					l_item_type = current_system.natural_16_type
				then
						-- ISO C 99 says that through "..." the types are promoted to
						-- 'int', and that promotion to 'int' leaves the type unchanged
						-- if all values cannot be represented with an 'int' or
						-- 'unsigned int'.
					current_file.put_string ("*(i++) = ")
					print_type_cast (l_item_type, current_file)
					current_file.put_string ("va_arg(v, int")
				elseif
					l_item_type = current_system.real_type
				then
						-- ISO C 99 says that 'float' is promoted to 'double' when
						-- passed as argument of a function.
					current_file.put_string ("*(i++) = ")
					print_type_cast (l_item_type, current_file)
					current_file.put_string ("va_arg(v, double")
				else
					current_file.put_string ("*(i++) = va_arg(v, ")
					print_type_declaration (l_item_type, current_file)
				end
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
				print_indentation
				current_file.put_line ("va_end(v);")
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
					-- Create array object.
				print_indentation
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (an_array_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (an_array_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of array.
				print_indentation
				print_attribute_type_id_access (tokens.result_keyword, an_array_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (an_array_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'area'.
				print_indentation
				print_attribute_access (l_queries.first, tokens.result_keyword, an_array_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'lower'.
				print_indentation
				print_attribute_access (l_queries.item (2), tokens.result_keyword, an_array_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'upper'.
				print_indentation
				print_attribute_access (l_queries.item (3), tokens.result_keyword, an_array_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('c')
				current_file.put_character (';')
				current_file.put_new_line
					-- Return the array.
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_manifest_tuple_function (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE) is
			-- Print 'GE_mt' function to `current_file' and its signature to `header_file'.
			-- 'GE_mt<type-id>' is used to create manifest tuples of type 'type-id'.
		require
			a_tuple_type_not_void: a_tuple_type /= Void
		local
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_item_type_sets := a_tuple_type.item_type_sets
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_type_declaration (a_tuple_type, header_file)
			print_type_declaration (a_tuple_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_mt)
			current_file.put_string (c_ge_mt)
			header_file.put_integer (a_tuple_type.id)
			current_file.put_integer (a_tuple_type.id)
			header_file.put_character ('(')
			current_file.put_character ('(')
			nb := l_item_type_sets.count
			from i := 1 until i > nb loop
				if i /= 1 then
					header_file.put_character (',')
					header_file.put_character (' ')
					current_file.put_character (',')
					current_file.put_character (' ')
				end
				l_item_type := l_item_type_sets.item (i).static_type
				print_type_declaration (l_item_type, header_file)
				print_type_declaration (l_item_type, current_file)
				header_file.put_character (' ')
				header_file.put_character ('a')
				header_file.put_integer (i)
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_integer (i)
				i := i + 1
			end
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			print_indentation
			print_type_declaration (a_tuple_type, current_file)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
				-- Create tuple object.
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_type_declaration (a_tuple_type, current_file)
			current_file.put_character (')')
			current_file.put_string (c_ge_alloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (a_tuple_type, current_file)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
				-- Set type id of tuple.
			print_indentation
			print_attribute_type_id_access (tokens.result_keyword, a_tuple_type, False)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_integer (a_tuple_type.id)
			current_file.put_character (';')
			current_file.put_new_line
				-- Set fields.
			from i := 1 until i > nb loop
				print_indentation
				print_attribute_tuple_item_access (i, tokens.result_keyword, a_tuple_type, False)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_integer (i)
				current_file.put_character (';')
				current_file.put_new_line
				i := i + 1
			end
				-- Return the tuple.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_boxed_function (a_type: ET_DYNAMIC_TYPE) is
			-- Print 'GE_boxed' function to `current_file' and its signature to `header_file'.
			-- 'GE_boxed<type-id>' is used to create boxed objects of type `a_type' (with id <type_id>).
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
		do
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_boxed_type_declaration (a_type, header_file)
			print_boxed_type_declaration (a_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_boxed)
			current_file.put_string (c_ge_boxed)
			header_file.put_integer (a_type.id)
			current_file.put_integer (a_type.id)
			header_file.put_character ('(')
			current_file.put_character ('(')
			print_type_declaration (a_type, header_file)
			print_type_declaration (a_type, current_file)
			header_file.put_character (' ')
			header_file.put_character ('a')
			header_file.put_character ('1')
			current_file.put_character (' ')
			current_file.put_character ('a')
			current_file.put_character ('1')
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			print_indentation
			print_boxed_type_declaration (a_type, current_file)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
				-- Create boxed object.
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_boxed_type_declaration (a_type, current_file)
			current_file.put_character (')')
			current_file.put_string (c_ge_alloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_boxed_type_name (a_type, current_file)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
				-- Set type id.
			print_indentation
			print_boxed_attribute_type_id_access (tokens.result_keyword, a_type, False)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_integer (a_type.id)
			current_file.put_character (';')
			current_file.put_new_line
				-- Set item.
			print_indentation
			print_boxed_attribute_item_access (tokens.result_keyword, a_type, False)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (';')
			current_file.put_new_line
				-- Return the boxed object.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			print_result_name (current_file)
			current_file.put_character (';')
			current_file.put_new_line
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
		end

	print_const_init_function is
			-- Print 'GE_const_init' function to `current_file', and its signature to `header_file'.
			-- 'GE_const_init' is called to initialize the value of the non-expanded constant attributes
			-- and inline constants (such as once manifest strings).
		local
			l_feature: ET_FEATURE
			l_constant: ET_INLINE_CONSTANT
		do
			header_file.put_string (c_void)
			current_file.put_string (c_void)
			header_file.put_character (' ')
			current_file.put_character (' ')
			header_file.put_string (c_ge_const_init)
			current_file.put_string (c_ge_const_init)
			header_file.put_character ('(')
			current_file.put_character ('(')
			header_file.put_string (c_void)
			header_file.put_character (')')
			current_file.put_character (')')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			from constant_features.start until constant_features.after loop
				l_feature := constant_features.key_for_iteration
				if once_features.has (l_feature) then
					print_indentation
					print_once_status_name (l_feature, current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('%'')
					current_file.put_character ('\')
					current_file.put_character ('1')
					current_file.put_character ('%'')
					current_file.put_character (';')
					current_file.put_new_line
				end
				print_indentation
				print_once_value_name (l_feature, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				constant_features.item_for_iteration.process (Current)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				constant_features.forth
			end
			from inline_constants.start until inline_constants.after loop
				l_constant := inline_constants.item_for_iteration
				print_indentation
				print_inline_constant_name (l_constant, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				l_constant.constant.process (Current)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				inline_constants.forth
			end
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_dynamic_type_id_set_constants is
			-- Print 'GE_dtsN' constants to `current_file', and their signature to `header_file'.
			-- 'GE_dtsN' are dymamic type id sets whose ids are sorted in increasing order.
		local
			l_dts_name: STRING
			l_dts_ids: STRING
			l_size: INTEGER
		do
			if not dynamic_type_id_set_names.is_empty then
				from dynamic_type_id_set_names.start until dynamic_type_id_set_names.after loop
					l_dts_name := dynamic_type_id_set_names.item_for_iteration
					l_dts_ids := dynamic_type_id_set_names.key_for_iteration
					l_size := l_dts_ids.occurrences (',') + 1
					header_file.put_string (c_int)
					header_file.put_character (' ')
					header_file.put_string (l_dts_name)
					header_file.put_character ('[')
					header_file.put_integer (l_size)
					header_file.put_character (']')
					header_file.put_character (';')
					header_file.put_new_line
					current_file.put_string (c_int)
					current_file.put_character (' ')
					current_file.put_string (l_dts_name)
					current_file.put_character ('[')
					current_file.put_integer (l_size)
					current_file.put_character (']')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_string (l_dts_ids)
					current_file.put_character ('}')
					current_file.put_character (';')
					current_file.put_new_line
					dynamic_type_id_set_names.forth
				end
				header_file.put_new_line
				current_file.put_new_line
			end
		end

feature {NONE} -- Malloc

	print_malloc_current (a_feature: ET_FEATURE) is
			-- Print memory allocation of 'Current' with `a_feature' as creation procedure.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_temp: ET_IDENTIFIER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: ET_IDENTIFIER
			old_file: KI_TEXT_OUTPUT_STREAM
		do
			if current_type.is_expanded then
					-- Variable declarations.
					-- They go to the beginning of the generated C function.
				old_file := current_file
				current_file := current_function_header_buffer
				l_temp := new_temp_variable (current_type)
				print_indentation
				print_type_declaration (current_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('&')
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Instructions.
					-- They go to the current location in the generated C function.
				current_file := old_file
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_name (current_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			else
					-- Variable declarations.
					-- They go to the beginning of the generated C function.
				old_file := current_file
				current_file := current_function_header_buffer
				print_indentation
				print_type_declaration (current_type, current_file)
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Instructions.
					-- They go to the current location in the generated C function.
				current_file := old_file
				print_indentation
				print_current_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_ge_alloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
				current_file.put_character (')')
				l_special_type ?= current_type
				if l_special_type /= Void then
					l_arguments := a_feature.arguments
					if l_arguments = Void or else l_arguments.count /= 1 then
							-- Internal error: the creation procedure of class SPECIAL
							-- should have one argument of type INTEGER.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_name := l_arguments.formal_argument (1).name
						current_file.put_character ('+')
						print_argument_name (l_name, current_file)
						current_file.put_character ('*')
						current_file.put_string (c_sizeof)
						current_file.put_character ('(')
						print_type_declaration (l_special_type.item_type_set.static_type, current_file)
						current_file.put_character (')')
					end
				end
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_character ('*')
				print_type_cast (current_type, current_file)
				print_current_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_default_name (current_type, current_file)
				current_file.put_character (';')
				current_file.put_new_line
				if l_special_type /= Void then
						-- Set 'count'.
					print_indentation
					print_attribute_special_count_access (tokens.current_keyword, l_special_type, False)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_argument_name (l_name, current_file)
					current_file.put_character (';')
					current_file.put_new_line
-- TODO: initialize items when expanded.
				end
			end
		end

feature {NONE} -- Trace generation

	print_feature_trace_message_call (in: BOOLEAN) is
			-- Print to `current_file' a call that will display to 'stderr' information
			-- about the fact that we just entered (if `in' is True) or just exited
			-- (if `in' is False) the current feature.
		local
			l_result_type: ET_DYNAMIC_TYPE
		do
			if trace_mode then
				current_file.put_string (c_ifdef)
				current_file.put_character (' ')
				current_file.put_line (c_eif_trace)
				if in then
						-- Instruction to print the trace message.
					print_indentation
					print_unindented_feature_info_message_call ("->")
					current_file.put_new_line
						-- This is a trick to make sure that the exit trace
						-- message will be displayed, even when there is a
						-- call to return before the end of the feature
						-- (this can happen in external inline C functions
						-- for example).
					current_file.put_string (c_define)
					current_file.put_character (' ')
					current_file.put_string (c_return)
					current_file.put_character (' ')
					print_unindented_feature_info_message_call ("<-")
					current_file.put_character (' ')
					current_file.put_line (c_return)
						-- Put the body of the feature in a block so that there
						-- is no C compilation error if some variables are
						-- declared after the instruction to print the trace message.
					print_indentation
					current_file.put_character ('{')
					current_file.put_new_line
				else
						-- Close the block containing the body of the feature.
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
						-- 'return' will be preceded by the instruction
						-- to print the trace message thanks to the #define
						-- clause (see the description of the trick in the
						-- 'in' section above).
					print_indentation
					current_file.put_string (c_return)
					if current_feature.is_query then
						current_file.put_character (' ')
						l_result_type := current_feature.result_type_set.static_type
						current_file.put_character ('(')
						print_type_declaration (l_result_type, current_file)
						current_file.put_character (')')
						current_file.put_character ('(')
						print_default_entity_value (l_result_type, current_file)
						current_file.put_character (')')
					end
					current_file.put_character (';')
					current_file.put_new_line
						-- Undefine 'return' (see the description of
						-- the trick in the 'in' section above).
					current_file.put_string (c_undef)
					current_file.put_character (' ')
					current_file.put_line (c_return)
				end
				current_file.put_line (c_endif)
			end
		end

	print_agent_trace_message_call (an_agent: ET_AGENT; in: BOOLEAN) is
			-- Print to `current_file' a call that will display to 'stderr' information
			-- about the fact that we just entered (if `in' is True) or just exited
			-- (if `in' is False) the agent `an_agent' appearing in current feature.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_agent_message: STRING
			l_result: ET_RESULT
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
		do
			if trace_mode then
				if an_agent.is_inline_agent then
					l_agent_message := " inline agent at line " + an_agent.position.line.out + " in"
				else
					l_agent_message := " agent at line " + an_agent.position.line.out + " in"
				end
				current_file.put_string (c_ifdef)
				current_file.put_character (' ')
				current_file.put_line (c_eif_trace)
				if in then
						-- Instruction to print the trace message.
					print_indentation
					print_unindented_feature_info_message_call ("->" + l_agent_message)
					current_file.put_new_line
						-- This is a trick to make sure that the exit trace
						-- message will be displayed, even when there is a
						-- call to return before the end of the feature
						-- (this can happen in external inline C functions
						-- for example).
					current_file.put_string (c_define)
					current_file.put_character (' ')
					current_file.put_string (c_return)
					current_file.put_character (' ')
					print_unindented_feature_info_message_call ("<-" + l_agent_message)
					current_file.put_character (' ')
					current_file.put_line (c_return)
						-- Put the body of the feature in a block so that there
						-- is no C compilation error if some variables are
						-- declared after the instruction to print the trace message.
					print_indentation
					current_file.put_character ('{')
					current_file.put_new_line
				else
						-- Close the block containing the body of the feature.
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
						-- 'return' will be preceded by the instruction
						-- to print the trace message thanks to the #define
						-- clause (see the description of the trick in the
						-- 'in' section above).
					print_indentation
					current_file.put_string (c_return)
					if not an_agent.is_procedure then
						l_result := an_agent.implicit_result
						l_result_type_set := dynamic_type_set (l_result)
						if l_result_type_set = Void then
								-- Internal error: if the associated feature is a query,
								-- then the dynamic type set should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_result_type := l_result_type_set.static_type
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_type_declaration (l_result_type, current_file)
							current_file.put_character (')')
							current_file.put_character ('(')
							print_default_entity_value (l_result_type, current_file)
							current_file.put_character (')')
						end
					end
					current_file.put_character (';')
					current_file.put_new_line
						-- Undefine 'return' (see the description of
						-- the trick in the 'in' section above).
					current_file.put_string (c_undef)
					current_file.put_character (' ')
					current_file.put_line (c_return)
				end
				current_file.put_line (c_endif)
			end
		end

	print_feature_info_message_call (a_message: STRING) is
			-- Print to `current_file' a call that will display to 'stderr' information
			-- about the current feature of form: `a_message' TYPE.feature
		require
			a_message_not_void: a_message /= Void
		do
			print_show_console_call
			print_indentation
			print_unindented_feature_info_message_call (a_message)
			current_file.put_new_line
		end

	print_unindented_feature_info_message_call (a_message: STRING) is
			-- Print to `current_file' a call that will display to 'stderr' information
			-- about the current feature of form: `a_message' TYPE.feature
			-- This call is not indented nor finished by a new-line.
			-- Useful to define a macro.
		require
			a_message_not_void: a_message /= Void
		do
			current_file.put_string (c_fprintf)
			current_file.put_character ('(')
			current_file.put_string (c_stderr)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_string ("%"%%s %%s.%%s\n%"")
			current_file.put_character (',')
			current_file.put_character (' ')
			print_escaped_string (a_message)
			current_file.put_character (',')
			current_file.put_character (' ')
			print_escaped_string (current_type.base_type.unaliased_to_text)
			current_file.put_character (',')
			current_file.put_character (' ')
			print_escaped_string (current_feature.static_feature.lower_name)
			current_file.put_character (')')
			current_file.put_character (';')
		end

	print_info_message_call (a_message: STRING) is
			-- Print to `current_file' a call that will display to 'stderr'
			-- information form: `a_message'
		require
			a_message_not_void: a_message /= Void
		do
			print_show_console_call
			print_indentation
			current_file.put_string (c_fprintf)
			current_file.put_character ('(')
			current_file.put_string (c_stderr)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_string ("%"%%s\n%"")
			current_file.put_character (',')
			current_file.put_character (' ')
			print_escaped_string (a_message)
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_show_console_call is
			-- Print to `current_file' a call to 'GE_show_console' to make sure
			-- that a DOS console is available for Windows applications.
		do
			current_file.put_string (c_ifdef)
			current_file.put_character (' ')
			current_file.put_line (c_eif_windows)
			print_indentation
			current_file.put_string (c_ge_show_console)
			current_file.put_character ('(')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
			current_file.put_line (c_endif)
		end

feature {NONE} -- Type generation

	print_types (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print declarations of types of `current_system' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_attribute_type: ET_DYNAMIC_TYPE
			j, nb2: INTEGER
			l_expanded_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_DYNAMIC_TYPE]
			l_expanded_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
		do
				-- Type with just the type_id attribute 'id'.
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_eif_any_type_name (a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_any)
			a_file.put_new_line
				-- Aliased basic types.
			print_aliased_character_type_definition (a_file)
			print_aliased_wide_character_type_definition (a_file)
			print_aliased_integer_type_definition (a_file)
			print_aliased_natural_type_definition (a_file)
			print_aliased_real_type_definition (a_file)
			print_aliased_double_type_definition (a_file)
				-- Alive types.
			create l_expanded_sorter.make_default
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive then
					a_file.put_character ('/')
					a_file.put_character ('*')
					a_file.put_character (' ')
					a_file.put_string (l_type.static_type.base_type.unaliased_to_text)
					a_file.put_character (' ')
					a_file.put_character ('*')
					a_file.put_character ('/')
					a_file.put_new_line
					if l_type.is_expanded then
							-- Keep track of expanded types.
						if not l_expanded_sorter.has (l_type) then
							l_expanded_sorter.force (l_type)
						end
						if not l_type.is_generic then
								-- For expanded types with no generics, there is no type
								-- other than themselves that conform to them. Therefore
								-- we do not keep the type-id in each object for those types
								-- because if it is used as static type of an entity there
								-- will be no polymorphic call. A boxed version (containing
								-- the type-id) is nevertheless generated when those objects
								-- are attached to entities of reference types (which might
								-- be polymorphic).
							if l_type = current_system.boolean_type then
								print_boolean_type_definition (l_type, a_file)
							elseif l_type = current_system.character_8_type then
								print_character_8_type_definition (l_type, a_file)
							elseif l_type = current_system.character_32_type then
								print_character_32_type_definition (l_type, a_file)
							elseif l_type = current_system.character_type then
									-- This should never happen when compliant to ECMA 367.
								print_character_type_definition (l_type, a_file)
							elseif l_type = current_system.wide_character_type then
									-- This should never happen when compliant to ECMA 367.
								print_wide_character_type_definition (l_type, a_file)
							elseif l_type = current_system.integer_8_type then
								print_integer_8_type_definition (l_type, a_file)
							elseif l_type = current_system.integer_16_type then
								print_integer_16_type_definition (l_type, a_file)
							elseif l_type = current_system.integer_32_type then
								print_integer_32_type_definition (l_type, a_file)
							elseif l_type = current_system.integer_64_type then
								print_integer_64_type_definition (l_type, a_file)
							elseif l_type = current_system.integer_type then
									-- This should never happen when compliant to ECMA 367.
								print_integer_type_definition (l_type, a_file)
							elseif l_type = current_system.natural_8_type then
								print_natural_8_type_definition (l_type, a_file)
							elseif l_type = current_system.natural_16_type then
								print_natural_16_type_definition (l_type, a_file)
							elseif l_type = current_system.natural_32_type then
								print_natural_32_type_definition (l_type, a_file)
							elseif l_type = current_system.natural_64_type then
								print_natural_64_type_definition (l_type, a_file)
							elseif l_type = current_system.natural_type then
									-- This should never happen when compliant to ECMA 367.
								print_natural_type_definition (l_type, a_file)
							elseif l_type = current_system.real_32_type then
								print_real_32_type_definition (l_type, a_file)
							elseif l_type = current_system.real_64_type then
								print_real_64_type_definition (l_type, a_file)
							elseif l_type = current_system.real_type then
									-- This should never happen when compliant to ECMA 367.
								print_real_type_definition (l_type, a_file)
							elseif l_type = current_system.double_type then
									-- This should never happen when compliant to ECMA 367.
								print_double_type_definition (l_type, a_file)
							elseif l_type = current_system.pointer_type then
								print_pointer_type_definition (l_type, a_file)
							else
								print_type_definition (l_type, a_file)
									-- Keep track of dependencies between expanded types.
								l_queries := l_type.queries
								nb2 := l_type.attribute_count
								from j := 1 until j > nb2 loop
									l_query := l_queries.item (j)
									l_attribute_type := l_query.result_type_set.static_type
									if l_attribute_type.is_expanded then
										l_expanded_sorter.force_relation (l_attribute_type, l_type)
									end
									j := j + 1
								end
							end
							print_boxed_function (l_type)
						end
					end
					if l_type.base_class = universe.type_class then
						print_type_type_definition (l_type, a_file)
					else
						print_boxed_type_definition (l_type, a_file)
					end
					a_file.put_new_line
				end
				i := i + 1
			end
			l_expanded_sorter.sort
			if l_expanded_sorter.has_cycle then
					-- Internal error: this should already have been taken care of, either by
					-- Eiffel validity rule (see VLEC in ETL2), or by proper handling if ECMA
					-- relaxed this rule (through the introduction of attached types).
				set_fatal_error
				error_handler.report_giaaa_error
			end
				-- Struct for each expanded type.
			l_expanded_types := l_expanded_sorter.sorted_items
			nb := l_expanded_types.count
			from i := 1 until i > nb loop
				l_type := l_expanded_types.item (i)
				print_type_struct (l_type, a_file)
				print_boxed_type_struct (l_type, a_file)
				i := i + 1
			end
				-- Struct for each non-expanded type.
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive and not l_type.is_expanded then
					print_type_struct (l_type, a_file)
				end
				i := i + 1
			end
				-- Type EIF_TYPE representing Eiffel types.
			print_eif_type_struct (a_file)
		end

	print_aliased_character_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "CHARACTER".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.character_type
			if l_type = current_system.character_8_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.character_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_character)
				a_file.put_character (' ')
				a_file.put_line (c_eif_character_8)
				a_file.put_new_line
			elseif l_type = current_system.character_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.character_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_character)
				a_file.put_character (' ')
				a_file.put_line (c_eif_character_32)
				a_file.put_new_line
			end
		end

	print_aliased_wide_character_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "WIDE_CHARACTER".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.wide_character_type
			if l_type = current_system.character_8_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.wide_character_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_wide_char)
				a_file.put_character (' ')
				a_file.put_line (c_eif_character_8)
				a_file.put_new_line
			elseif l_type = current_system.character_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.wide_character_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_wide_char)
				a_file.put_character (' ')
				a_file.put_line (c_eif_character_32)
				a_file.put_new_line
			end
		end

	print_aliased_integer_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "INTEGER".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.integer_type
			if l_type = current_system.integer_8_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.integer_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_integer)
				a_file.put_character (' ')
				a_file.put_line (c_eif_integer_8)
				a_file.put_new_line
			elseif l_type = current_system.integer_16_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.integer_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_integer)
				a_file.put_character (' ')
				a_file.put_line (c_eif_integer_16)
				a_file.put_new_line
			elseif l_type = current_system.integer_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.integer_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_integer)
				a_file.put_character (' ')
				a_file.put_line (c_eif_integer_32)
				a_file.put_new_line
			elseif l_type = current_system.integer_64_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.integer_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_integer)
				a_file.put_character (' ')
				a_file.put_line (c_eif_integer_64)
				a_file.put_new_line
			end
		end

	print_aliased_natural_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "NATURAL".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.natural_type
			if l_type = current_system.natural_8_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.natural_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_natural)
				a_file.put_character (' ')
				a_file.put_line (c_eif_natural_8)
				a_file.put_new_line
			elseif l_type = current_system.natural_16_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.natural_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_natural)
				a_file.put_character (' ')
				a_file.put_line (c_eif_natural_16)
				a_file.put_new_line
			elseif l_type = current_system.natural_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.natural_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_natural)
				a_file.put_character (' ')
				a_file.put_line (c_eif_natural_32)
				a_file.put_new_line
			elseif l_type = current_system.natural_64_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.natural_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_natural)
				a_file.put_character (' ')
				a_file.put_line (c_eif_natural_64)
				a_file.put_new_line
			end
		end

	print_aliased_real_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "REAL".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.real_type
			if l_type = current_system.real_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.real_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_real)
				a_file.put_character (' ')
				a_file.put_line (c_eif_real_32)
				a_file.put_new_line
			elseif l_type = current_system.real_64_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.real_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_real)
				a_file.put_character (' ')
				a_file.put_line (c_eif_real_64)
				a_file.put_new_line
			end
		end

	print_aliased_double_type_definition (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of aliased type "DOUBLE".
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := current_system.double_type
			if l_type = current_system.real_32_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.double_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_double)
				a_file.put_character (' ')
				a_file.put_line (c_eif_real_32)
				a_file.put_new_line
			elseif l_type = current_system.real_64_type then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string (tokens.double_class_name.upper_name)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_define)
				a_file.put_character (' ')
				a_file.put_string (c_eif_double)
				a_file.put_character (' ')
				a_file.put_line (c_eif_real_64)
				a_file.put_new_line
			end
		end

	print_boolean_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "BOOLEAN".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_boolean)
		end

	print_character_8_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "CHARACTER_8".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_character_8)
		end

	print_character_32_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "CHARACTER_32".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_character_32)
		end

	print_character_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "CHARACTER".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_character)
		end

	print_wide_character_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "WIDE_CHARACTER".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_wide_char)
		end

	print_integer_8_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "INTEGER_8".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_integer_8)
		end

	print_integer_16_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "INTEGER_16".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_integer_16)
		end

	print_integer_32_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "INTEGER_32".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_integer_32)
		end

	print_integer_64_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "INTEGER_64".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_integer_64)
		end

	print_integer_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "INTEGER".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_integer)
		end

	print_natural_8_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "NATURAL_8".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_natural_8)
		end

	print_natural_16_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "NATURAL_16".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_natural_16)
		end

	print_natural_32_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "NATURAL_32".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_natural_32)
		end

	print_natural_64_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "NATURAL_64".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_natural_64)
		end

	print_natural_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "NATURAL".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_natural)
		end

	print_real_32_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "REAL_32".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_real_32)
		end

	print_real_64_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "REAL_64".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_real_64)
		end

	print_real_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "REAL".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_real_32)
		end

	print_double_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "DOUBLE".
			-- This should not be needed anymore if compliant to ECMA 367.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_real_64)
		end

	print_pointer_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "POINTER".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_pointer)
		end

	print_type_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type "TYPE [X]".
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_type)
		end

	print_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the definition of type `a_type'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_typedef)
			a_file.put_character (' ')
			a_file.put_string (c_struct)
			a_file.put_character (' ')
			print_struct_name (a_type, a_file)
			a_file.put_character (' ')
			print_type_name (a_type, a_file)
			a_file.put_character (';')
			a_file.put_new_line
		end

	print_boxed_type_definition (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the type definition of the boxed version of `a_type'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_typedef)
			a_file.put_character (' ')
			a_file.put_string (c_struct)
			a_file.put_character (' ')
			print_boxed_struct_name (a_type, a_file)
			a_file.put_character (' ')
			print_boxed_type_name (a_type, a_file)
			a_file.put_character (';')
			a_file.put_new_line
		end

	print_type_struct (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' declaration of C struct corresponding to `a_type', if_any.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_function_type: ET_DYNAMIC_FUNCTION_TYPE
			l_procedure_type: ET_DYNAMIC_PROCEDURE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
		do
			if
				a_type.base_class /= universe.type_class and
				(not a_type.is_expanded or else
				(a_type /= current_system.boolean_type and
				a_type /= current_system.character_8_type and
				a_type /= current_system.character_32_type and
				a_type /= current_system.integer_8_type and
				a_type /= current_system.integer_16_type and
				a_type /= current_system.integer_32_type and
				a_type /= current_system.integer_64_type and
				a_type /= current_system.natural_8_type and
				a_type /= current_system.natural_16_type and
				a_type /= current_system.natural_32_type and
				a_type /= current_system.natural_64_type and
				a_type /= current_system.real_32_type and
				a_type /= current_system.real_64_type and
				a_type /= current_system.pointer_type))
			then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string ("Struct for type ")
				a_file.put_string (a_type.static_type.base_type.unaliased_to_text)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_struct)
				a_file.put_character (' ')
				print_struct_name (a_type, a_file)
				a_file.put_character (' ')
				a_file.put_character ('{')
				a_file.put_new_line
				if not a_type.is_expanded or else a_type.is_generic then
					a_file.put_character ('%T')
					a_file.put_string (c_int)
					a_file.put_character (' ')
					print_attribute_type_id_name (a_type, a_file)
					a_file.put_character (';')
					a_file.put_new_line
				end
				l_queries := a_type.queries
				nb := a_type.attribute_count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					a_file.put_character ('%T')
					print_type_declaration (l_query.result_type_set.static_type, a_file)
					a_file.put_character (' ')
					print_attribute_name (l_query, a_type, a_file)
					a_file.put_character (';')
					a_file.put_character (' ')
					a_file.put_character ('/')
					a_file.put_character ('*')
					a_file.put_character (' ')
					a_file.put_string (l_query.static_feature.name.name)
					a_file.put_character (' ')
					a_file.put_character ('*')
					a_file.put_character ('/')
					a_file.put_new_line
					i := i + 1
				end
				l_special_type ?= a_type
				if l_special_type /= Void then
						-- We use the "struct hack" to represent SPECIAL
						-- object header. The last member of the struct
						-- is an array of size 1, but we malloc the needed
						-- space when creating the SPECIAL object. We use
						-- an array of size 1 because some compilers don't
						-- like having an array of size 0 here. Note that
						-- the "struct hack" is superseded by the concept
						-- of "flexible array member" in ISO C 99.
					a_file.put_character ('%T')
					print_type_declaration (current_system.integer_type, a_file)
					a_file.put_character (' ')
					print_attribute_special_count_name (l_special_type, a_file)
					a_file.put_character (';')
					a_file.put_character (' ')
					a_file.put_character ('/')
					a_file.put_character ('*')
					a_file.put_character (' ')
					a_file.put_character ('c')
					a_file.put_character ('o')
					a_file.put_character ('u')
					a_file.put_character ('n')
					a_file.put_character ('t')
					a_file.put_character (' ')
					a_file.put_character ('*')
					a_file.put_character ('/')
					a_file.put_new_line
					a_file.put_character ('%T')
					l_item_type_set := l_special_type.item_type_set
					print_type_declaration (l_item_type_set.static_type, a_file)
					a_file.put_character (' ')
					print_attribute_special_item_name (l_special_type, a_file)
					a_file.put_character ('[')
					a_file.put_character ('1')
					a_file.put_character (']')
					a_file.put_character (';')
					a_file.put_character (' ')
					a_file.put_character ('/')
					a_file.put_character ('*')
					a_file.put_character (' ')
					a_file.put_character ('i')
					a_file.put_character ('t')
					a_file.put_character ('e')
					a_file.put_character ('m')
					a_file.put_character (' ')
					a_file.put_character ('*')
					a_file.put_character ('/')
					a_file.put_new_line
				else
					l_tuple_type ?= a_type
					if l_tuple_type /= Void then
						l_item_type_sets := l_tuple_type.item_type_sets
						nb := l_item_type_sets.count
						from i := 1 until i > nb loop
							a_file.put_character ('%T')
							print_type_declaration (l_item_type_sets.item (i).static_type, a_file)
							a_file.put_character (' ')
							print_attribute_tuple_item_name (i, l_tuple_type, a_file)
							a_file.put_character (';')
							a_file.put_new_line
							i := i + 1
						end
					else
						l_function_type ?= a_type
						if l_function_type /= Void then
								-- Function pointer.
							a_file.put_character ('%T')
							print_type_declaration (l_function_type.result_type_set.static_type, a_file)
							a_file.put_character (' ')
							a_file.put_character ('(')
							a_file.put_character ('*')
							a_file.put_character ('f')
							a_file.put_character (')')
							a_file.put_character ('(')
							print_type_declaration (a_type, a_file)
							l_open_operand_type_sets := l_function_type.open_operand_type_sets
							nb := l_open_operand_type_sets.count
							from i := 1 until i > nb loop
								a_file.put_character (',')
								a_file.put_character (' ')
								print_type_declaration (l_open_operand_type_sets.item (i).static_type, a_file)
								i := i + 1
							end
							a_file.put_character (')')
							a_file.put_character (';')
							a_file.put_new_line
						else
							l_procedure_type ?= a_type
							if l_procedure_type /= Void then
									-- Function pointer.
								a_file.put_character ('%T')
								a_file.put_string (c_void)
								a_file.put_character (' ')
								a_file.put_character ('(')
								a_file.put_character ('*')
								a_file.put_character ('f')
								a_file.put_character (')')
								a_file.put_character ('(')
								print_type_declaration (a_type, a_file)
								l_open_operand_type_sets := l_procedure_type.open_operand_type_sets
								nb := l_open_operand_type_sets.count
								from i := 1 until i > nb loop
									a_file.put_character (',')
									a_file.put_character (' ')
									print_type_declaration (l_open_operand_type_sets.item (i).static_type, a_file)
									i := i + 1
								end
								a_file.put_character (')')
								a_file.put_character (';')
								a_file.put_new_line
							end
						end
					end
				end
				a_file.put_character ('}')
				a_file.put_character (';')
				a_file.put_new_line
				a_file.put_new_line
			end
		end

	print_boxed_type_struct (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' declaration of C struct corresponding to boxed version of `a_type', if_any.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if a_type.is_expanded and not a_type.is_generic then
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_string ("Struct for boxed version of type ")
				a_file.put_string (a_type.static_type.base_type.unaliased_to_text)
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_string (c_struct)
				a_file.put_character (' ')
				print_boxed_struct_name (a_type, a_file)
				a_file.put_character (' ')
				a_file.put_character ('{')
				a_file.put_new_line
				a_file.put_character ('%T')
				a_file.put_string (c_int)
				a_file.put_character (' ')
				print_attribute_type_id_name (a_type, a_file)
				a_file.put_character (';')
				a_file.put_new_line
				a_file.put_character ('%T')
				print_type_declaration (a_type, a_file)
				a_file.put_character (' ')
				print_boxed_attribute_item_name (a_type, a_file)
				a_file.put_character (';')
				a_file.put_character (' ')
				a_file.put_character ('/')
				a_file.put_character ('*')
				a_file.put_character (' ')
				a_file.put_character ('i')
				a_file.put_character ('t')
				a_file.put_character ('e')
				a_file.put_character ('m')
				a_file.put_character (' ')
				a_file.put_character ('*')
				a_file.put_character ('/')
				a_file.put_new_line
				a_file.put_character ('}')
				a_file.put_character (';')
				a_file.put_new_line
				a_file.put_new_line
			end
		end

	print_eif_type_struct (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' declaration of C struct corresponding to 'EIF_TYPE', if_any.
			-- Type EIF_TYPE represents Eiffel types.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (c_typedef)
			a_file.put_character (' ')
			a_file.put_string (c_struct)
			a_file.put_character (' ')
			a_file.put_character ('{')
			a_file.put_new_line
			a_file.put_character ('%T')
			a_file.put_string (c_int)
			a_file.put_character (' ')
			print_attribute_type_id_name (current_system.any_type, a_file)
			a_file.put_character (';')
			a_file.put_new_line
			a_file.put_character ('%T')
			a_file.put_string (c_eif_integer)
			a_file.put_character (' ')
			a_file.put_string (c_type_id)
			a_file.put_character (';')
			a_file.put_new_line
			a_file.put_character ('%T')
			a_file.put_string (c_eif_boolean)
			a_file.put_character (' ')
			a_file.put_string (c_is_special)
			a_file.put_character (';')
			a_file.put_new_line
			a_file.put_character ('}')
			a_file.put_character (' ')
			a_file.put_string (c_eif_type)
			a_file.put_character (';')
			a_file.put_new_line
			a_file.put_new_line
		end

	print_types_array is
			-- Print 'GE_types' array to `current_file' and its declaration to `header_file'.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_meta_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
				-- Print declaration of 'GE_types' in `header_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			header_file.put_string (c_eif_type)
			header_file.put_character (' ')
			header_file.put_string (c_ge_types)
			header_file.put_character ('[')
			header_file.put_character (']')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_string (c_eif_type)
			current_file.put_character (' ')
			current_file.put_string (c_ge_types)
			current_file.put_character ('[')
			current_file.put_integer (nb + 1)
			current_file.put_character (']')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
				-- Dummy type at index 0.
			current_file.put_character ('{')
			current_file.put_integer (0)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (0)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_string (c_eif_false)
			current_file.put_character ('}')
			current_file.put_character (',')
			current_file.put_new_line
-- TODO: here we might include types that are used in our system!
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				current_file.put_character ('{')
					-- id.
				l_meta_type := l_type.meta_type
				if l_meta_type /= Void then
					current_file.put_integer (l_meta_type.id)
				else
					current_file.put_integer (0)
				end
				current_file.put_character (',')
				current_file.put_character (' ')
					-- type_id.
				current_file.put_integer (l_type.id)
				current_file.put_character (',')
				current_file.put_character (' ')
					-- is_special.
				if l_type.is_special then
					current_file.put_string (c_eif_true)
				else
					current_file.put_string (c_eif_false)
				end
				current_file.put_character ('}')
				if i /= nb then
					current_file.put_character (',')
				end
				current_file.put_new_line
				i := i + 1
			end
			current_file.put_character ('}')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_type_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_type' to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('T')
				a_file.put_integer (a_type.id)
			else
-- TODO: long names
				short_names := True
				print_type_name (a_type, a_file)
				short_names := False
			end
		end

	print_boxed_type_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of boxed version of `a_type' to `a_file'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('T')
				if a_type.is_expanded and then not a_type.is_generic then
					a_file.put_character ('b')
				end
				a_file.put_integer (a_type.id)
			else
-- TODO: long names
				short_names := True
				print_boxed_type_name (a_type, a_file)
				short_names := False
			end
		end

	print_struct_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of C struct corresponding to `a_type' to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('S')
				a_file.put_integer (a_type.id)
			else
-- TODO: long names
				short_names := True
				print_struct_name (a_type, a_file)
				short_names := False
			end
		end

	print_boxed_struct_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of C struct corresponding to the boxed version of `a_type' to `a_file'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('S')
				if a_type.is_expanded and then not a_type.is_generic then
					a_file.put_character ('b')
				end
				a_file.put_integer (a_type.id)
			else
-- TODO: long names
				short_names := True
				print_boxed_struct_name (a_type, a_file)
				short_names := False
			end
		end

	print_eif_any_type_name (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of type 'EIF_ANY' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('T')
				a_file.put_character ('0')
			else
-- TODO: long names
				short_names := True
				print_eif_any_type_name (a_file)
				short_names := False
			end
		end

	print_type_declaration (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print declaration of `a_type' to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if a_type.is_expanded then
				print_type_name (a_type, a_file)
			else
				print_eif_any_type_name (a_file)
				a_file.put_character ('*')
			end
		end

	print_boxed_type_declaration (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print declaration of boxed version of `a_type' to `a_file'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_eif_any_type_name (a_file)
			a_file.put_character ('*')
		end

	print_type_cast (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print type cast of `a_type' to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('(')
			print_type_name (a_type, a_file)
			if not a_type.is_expanded then
				a_file.put_character ('*')
			end
			a_file.put_character (')')
		end

	print_boxed_type_cast (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print type cast of boxed version of `a_type' to `a_file'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('(')
			print_boxed_type_name (a_type, a_file)
			a_file.put_character ('*')
			a_file.put_character (')')
		end

feature {NONE} -- Default initialization values generation

	print_default_declarations is
			-- Print default initialization declaration of each type
			-- to `current_file' and their signature to `header_file'.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive then
					if l_type.base_class /= universe.type_class then
						print_default_declaration (l_type)
					end
				end
				i := i + 1
			end
		end

	print_default_declaration (a_type: ET_DYNAMIC_TYPE) is
			-- Print default initialization declaration of `a_type'
			-- to `current_file' and their signature to `header_file'.
		require
			a_type_not_void: a_type /= Void
		do
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			print_type_name (a_type, header_file)
			print_type_name (a_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_default_name (a_type, header_file)
			print_default_name (a_type, current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_default_object_value (a_type, current_file)
			header_file.put_character (';')
			current_file.put_character (';')
			header_file.put_new_line
			current_file.put_new_line
		end

	print_default_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' name of default initialization for object of type `a_type'.
			-- (In case of expanded types being involved, this default initialization
			-- does not take into account possible calls to 'default_create' which need
			-- to be applied subsequently.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_string (c_ge_default)
				a_file.put_integer (a_type.id)
			else
-- TODO: long names
				short_names := True
				print_default_name (a_type, a_file)
				short_names := False
			end
		end

	print_default_object_value (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' default initialization value for objects of type `a_type'.
			-- (In case of expanded types being involved, this default initialization
			-- does not take into account possible calls to 'default_create' which need
			-- to be applied subsequently.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_function_type: ET_DYNAMIC_FUNCTION_TYPE
			l_procedure_type: ET_DYNAMIC_PROCEDURE_TYPE
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_comma_needed: BOOLEAN
		do
			if
				not a_type.is_expanded or else
				(a_type /= current_system.boolean_type and
				a_type /= current_system.character_8_type and
				a_type /= current_system.character_32_type and
				a_type /= current_system.integer_8_type and
				a_type /= current_system.integer_16_type and
				a_type /= current_system.integer_32_type and
				a_type /= current_system.integer_64_type and
				a_type /= current_system.natural_8_type and
				a_type /= current_system.natural_16_type and
				a_type /= current_system.natural_32_type and
				a_type /= current_system.natural_64_type and
				a_type /= current_system.real_32_type and
				a_type /= current_system.real_64_type and
				a_type /= current_system.pointer_type)
			then
				a_file.put_character ('{')
				if not a_type.is_expanded or else a_type.is_generic then
						-- Type id.
					a_file.put_integer (a_type.id)
					l_comma_needed := True
				end
					-- Attributes.
				l_queries := a_type.queries
				nb := a_type.attribute_count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					if l_comma_needed then
						a_file.put_character (',')
					end
					l_comma_needed := True
					print_default_attribute_value (l_query.result_type_set.static_type, a_file)
					i := i + 1
				end
				l_special_type ?= a_type
				if l_special_type /= Void then
						-- Count.
					if l_comma_needed then
						a_file.put_character (',')
					end
					l_comma_needed := True
					a_file.put_character ('0')
						-- Items.
					a_file.put_character (',')
					a_file.put_character ('{')
					print_default_attribute_value (l_special_type.item_type_set.static_type, a_file)
					a_file.put_character ('}')
				else
					l_tuple_type ?= a_type
					if l_tuple_type /= Void then
						l_item_type_sets := l_tuple_type.item_type_sets
						nb := l_item_type_sets.count
						from i := 1 until i > nb loop
							if l_comma_needed then
								a_file.put_character (',')
							end
							l_comma_needed := True
							print_default_attribute_value (l_item_type_sets.item (i).static_type, a_file)
							i := i + 1
						end
					else
						l_function_type ?= a_type
						if l_function_type /= Void then
								-- Function pointer.
							if l_comma_needed then
								a_file.put_character (',')
							end
							l_comma_needed := True
							a_file.put_character ('0')
						else
							l_procedure_type ?= a_type
							if l_procedure_type /= Void then
									-- Function pointer.
								if l_comma_needed then
									a_file.put_character (',')
								end
								l_comma_needed := True
								a_file.put_character ('0')
							end
						end
					end
				end
				a_file.put_character ('}')
			else
				a_file.put_character ('0')
			end
		end

	print_default_entity_value (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' default initialization value for entities declared of type `a_type'.
			-- Note that an entity can be a reference to an object, and in that case
			-- its default initialization value is 'Void', and not a default initialized
			-- object of the corresponding type.
			-- This routine is mainly useful when declaring entities of non-basic expanded types.
			-- (In case of expanded types being involved, this default initialization
			-- does not take into account possible calls to 'default_create' which need
			-- to be applied subsequently.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if
				not a_type.is_expanded or else
				(a_type = current_system.boolean_type or
				a_type = current_system.character_8_type or
				a_type = current_system.character_32_type or
				a_type = current_system.integer_8_type or
				a_type = current_system.integer_16_type or
				a_type = current_system.integer_32_type or
				a_type = current_system.integer_64_type or
				a_type = current_system.natural_8_type or
				a_type = current_system.natural_16_type or
				a_type = current_system.natural_32_type or
				a_type = current_system.natural_64_type or
				a_type = current_system.real_32_type or
				a_type = current_system.real_64_type or
				a_type = current_system.pointer_type)
			then
				a_file.put_character ('0')
			else
				print_default_name (a_type, a_file)
			end
		end

	print_default_attribute_value (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' default initialization value for attributes declared of type `a_type'.
			-- Note that an attribute is a special kind of entity, and therefore
			-- it can be a reference to an object, and in that case its default initialization
			-- value is 'Void', and not a default initialized object of the corresponding type.
			-- This routine is mainly useful for attributes of non-basic expanded types
			-- when determining the default initialization value of their enclosing objects.
			-- (In case of expanded types being involved, this default initialization
			-- does not take into account possible calls to 'default_create' which need
			-- to be applied subsequently.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if
				not a_type.is_expanded or else
				(a_type = current_system.boolean_type and
				a_type = current_system.character_8_type and
				a_type = current_system.character_32_type and
				a_type = current_system.integer_8_type and
				a_type = current_system.integer_16_type and
				a_type = current_system.integer_32_type and
				a_type = current_system.integer_64_type and
				a_type = current_system.natural_8_type and
				a_type = current_system.natural_16_type and
				a_type = current_system.natural_32_type and
				a_type = current_system.natural_64_type and
				a_type = current_system.real_32_type and
				a_type = current_system.real_64_type and
				a_type = current_system.pointer_type)
			then
				a_file.put_character ('0')
			else
				print_default_object_value (a_type, a_file)
			end
		end

feature {NONE} -- Feature name generation

	print_routine_name (a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_routine' from `a_type' to `a_file'.
		require
			a_routine_not_void: a_routine /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
		do
			if short_names then
				print_type_name (a_type, a_file)
				a_file.put_character ('f')
				l_precursor ?= a_routine
				if l_precursor /= Void then
					a_file.put_integer (l_precursor.current_feature.id)
					a_file.put_character ('p')
				end
				a_file.put_integer (a_routine.id)
			else
-- TODO: long names
				short_names := True
				print_routine_name (a_routine, a_type, a_file)
				short_names := False
			end
		end

	print_static_routine_name (a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of static feature `a_feature' to `a_file'.
		require
			a_routine_not_void: a_routine /= Void
			a_routine_static: a_routine.is_static
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
		do
			if short_names then
				print_type_name (a_type, a_file)
				a_file.put_character ('s')
				l_precursor ?= a_routine
				if l_precursor /= Void then
					a_file.put_integer (l_precursor.current_feature.id)
					a_file.put_character ('p')
				end
				a_file.put_integer (a_routine.id)
			else
-- TODO: long names
				short_names := True
				print_static_routine_name (a_routine, a_type, a_file)
				short_names := False
			end
		end

	print_creation_procedure_name (a_procedure: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of creation procedure `a_procedure' to `a_file'.
		require
			a_procedure_not_void: a_procedure /= Void
			a_procedure_creation: a_procedure.is_creation
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				print_type_name (a_type, a_file)
				a_file.put_character ('c')
				a_file.put_integer (a_procedure.id)
			else
-- TODO: long names
				short_names := True
				print_creation_procedure_name (a_procedure, a_type, a_file)
				short_names := False
			end
		end

	print_attribute_name (an_attribute: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `an_attribute' to `a_file'.
		require
			an_attribute_not_void: an_attribute /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('a')
				a_file.put_integer (an_attribute.id)
			else
-- TODO: long names
				short_names := True
				print_attribute_name (an_attribute, a_type, a_file)
				short_names := False
			end
		end

	print_attribute_type_id_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'type_id' pseudo attribute to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_string (c_id)
			else
-- TODO: long names
				short_names := True
				print_attribute_type_id_name (a_type, a_file)
				short_names := False
			end
		end

	print_attribute_special_item_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'item' pseudo attribute of class SPECIAL to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('z')
				a_file.put_character ('2')
			else
-- TODO: long names
				short_names := True
				print_attribute_special_item_name (a_type, a_file)
				short_names := False
			end
		end

	print_attribute_special_count_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'count' pseudo attribute of class SPECIAL to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('z')
				a_file.put_character ('1')
			else
-- TODO: long names
				short_names := True
				print_attribute_special_count_name (a_type, a_file)
				short_names := False
			end
		end

	print_attribute_tuple_item_name (i: INTEGER; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `i'-th 'item' pseudo attribute of class TUPLE to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('z')
				a_file.put_integer (i)
			else
-- TODO: long names
				short_names := True
				print_attribute_tuple_item_name (i, a_type, a_file)
				short_names := False
			end
		end

	print_boxed_attribute_item_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'item' pseudo attribute of boxed version of `a_type' to `a_file'.
			-- (The boxed version of a type makes sure that each object
			-- of that type contains its type-id. It can be the type itself
			-- if it already contains its type-id, or a wrapper otherwise.)
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('z')
				a_file.put_character ('1')
			else
-- TODO: long names
				short_names := True
				print_boxed_attribute_item_name (a_type, a_file)
				short_names := False
			end
		end

	print_call_name (a_call: ET_CALL_COMPONENT; a_caller: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_call' appearing in `a_caller' with `a_target_type' as target static type to `a_file'.
		require
			a_call_not_void: a_call /= Void
			a_caller_not_void: a_caller /= Void
			a_target_type_not_void: a_target_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_arguments: ET_ARGUMENT_OPERANDS
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type: ET_DYNAMIC_TYPE
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_seed: INTEGER
			i, nb: INTEGER
		do
			if short_names then
				l_seed := a_call.name.seed
				l_arguments := a_call.arguments
				print_type_name (a_target_type, a_file)
				a_file.put_character ('x')
				if a_call.name.is_tuple_label then
					a_file.put_character ('t')
				elseif l_seed = universe.routine_call_seed or l_seed = universe.function_item_seed then
					if l_arguments /= Void and then l_arguments.count = 1 then
						l_manifest_tuple ?= l_arguments.actual_argument (1)
						if l_manifest_tuple /= Void then
							a_file.put_character ('m')
							a_file.put_character ('t')
						end
					end
				end
				a_file.put_integer (l_seed)
				if l_manifest_tuple /= Void then
					l_argument_type_set := a_caller.dynamic_type_set (l_manifest_tuple)
					if l_argument_type_set = Void then
							-- Internal error: the dynamic type set of the
							-- actual arguments of the call should be known
							-- at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_type_name (l_argument_type_set.static_type, a_file)
					end
				elseif l_arguments /= Void then
					nb := l_arguments.count
					from i := 1 until i > nb loop
						l_argument_type_set := a_caller.dynamic_type_set (l_arguments.actual_argument (i))
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_argument_type := l_argument_type_set.static_type
							if l_argument_type.is_expanded then
								print_type_name (l_argument_type, a_file)
							else
								print_eif_any_type_name (a_file)
							end
						end
						i := i + 1
					end
				end
			else
-- TODO: long names
				short_names := True
				print_call_name (a_call, a_caller, a_target_type, a_file)
				short_names := False
			end
		end

	print_argument_name (a_name: ET_IDENTIFIER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of argument `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('a')
				a_file.put_integer (a_name.seed)
			else
-- TODO: long names
				short_names := True
				print_argument_name (a_name, a_file)
				short_names := False
			end
		end

	print_local_name (a_name: ET_IDENTIFIER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of local variable `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('l')
				a_file.put_integer (a_name.seed)
			else
-- TODO: long names
				short_names := True
				print_local_name (a_name, a_file)
				short_names := False
			end
		end

	print_temp_name (a_name: ET_IDENTIFIER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of temporary variable `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_name_temp: a_name.is_temporary
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('t')
				a_file.put_integer (a_name.seed)
			else
-- TODO: long names
				short_names := True
				print_temp_name (a_name, a_file)
				short_names := False
			end
		end

	print_agent_open_operand_name (a_name: ET_IDENTIFIER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of agent open operand `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_name_open_operand: a_name.is_agent_open_operand
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('a')
				a_file.put_integer (a_name.seed)
			else
-- TODO: long names
				short_names := True
				print_agent_open_operand_name (a_name, a_file)
				short_names := False
			end
		end

	print_agent_closed_operand_name (a_name: ET_IDENTIFIER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of agent closed operand `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_name_closed_operand: a_name.is_agent_closed_operand
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('z')
				a_file.put_integer (a_name.seed)
			else
-- TODO: long names
				short_names := True
				print_agent_closed_operand_name (a_name, a_file)
				short_names := False
			end
		end

	print_current_name (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'Current' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('C')
			else
-- TODO: long names
				short_names := True
				print_current_name (a_file)
				short_names := False
			end
		end

	print_result_name (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of 'Result' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('R')
			else
-- TODO: long names
				short_names := True
				print_result_name (a_file)
				short_names := False
			end
		end

	print_once_status_name (a_feature: ET_FEATURE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of variable holding the status of execution
			-- of the once-feature `a_feature' to `a_file'.
		require
			a_feature_not_void: a_feature /= Void
			implementation_feature: a_feature = a_feature.implementation_feature
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('g')
			a_file.put_character ('e')
			a_file.put_integer (a_feature.implementation_class.id)
			a_file.put_character ('o')
			a_file.put_character ('s')
			a_file.put_integer (a_feature.first_seed)
		end

	print_once_value_name (a_feature: ET_FEATURE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of variable holding the value of first
			-- execution of the once-feature `a_feature' to `a_file'.
		require
			a_feature_not_void: a_feature /= Void
			implementation_feature: a_feature = a_feature.implementation_feature
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('g')
			a_file.put_character ('e')
			a_file.put_integer (a_feature.implementation_class.id)
			a_file.put_character ('o')
			a_file.put_character ('v')
			a_file.put_integer (a_feature.first_seed)
		end

	print_agent_type_name (i: INTEGER; a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print type name of `i'-th agent appearing in `a_routine' from `a_type' to `a_file'.
		require
			a_routine_not_void: a_routine /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_routine_name (a_routine, a_type, a_file)
			a_file.put_character ('a')
			a_file.put_character ('t')
			a_file.put_integer (i)
		end

	print_agent_creation_name (i: INTEGER; a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of creation function of `i'-th agent appearing in `a_routine' from `a_type' to `a_file'.
		require
			a_routine_not_void: a_routine /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_routine_name (a_routine, a_type, a_file)
			a_file.put_character ('a')
			a_file.put_character ('c')
			a_file.put_integer (i)
		end

	print_agent_function_name (i: INTEGER; a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of function associated with `i'-th agent appearing in `a_routine' from `a_type' to `a_file'.
		require
			a_routine_not_void: a_routine /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_routine_name (a_routine, a_type, a_file)
			a_file.put_character ('a')
			a_file.put_character ('f')
			a_file.put_integer (i)
		end

	print_inline_constant_name (a_constant: ET_INLINE_CONSTANT; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of variable holding the value of inline constant
			-- `a_constant' (such as a once manifest string) to `a_file'.
		require
			a_constant_not_void: a_constant /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('g')
			a_file.put_character ('e')
			a_file.put_character ('i')
			a_file.put_character ('c')
			a_file.put_integer (a_constant.id)
		end

	print_feature_name_comment (a_feature: ET_FEATURE; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_feature' from `a_type' as a C comment to `a_file'.
		require
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('/')
			a_file.put_character ('*')
			a_file.put_character (' ')
			a_file.put_string (a_type.base_type.unaliased_to_text)
			a_file.put_character ('.')
			a_file.put_string (STRING_.replaced_all_substrings (a_feature.lower_name, "*/", "star/"))
			a_file.put_character (' ')
			a_file.put_character ('*')
			a_file.put_character ('/')
			a_file.put_new_line
		end

	print_call_name_comment (a_call: ET_CALL_COMPONENT; a_caller: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_call', appearing in `a_caller' with `a_type' as target static type, as a C comment to `a_file'.
		require
			a_call_not_void: a_call /= Void
			a_caller_not_void: a_caller /= Void
			a_target_type_not_void: a_target_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_arguments: ET_ARGUMENT_OPERANDS
			l_argument_type_set: ET_DYNAMIC_TYPE_SET
			l_manifest_tuple: ET_MANIFEST_TUPLE
			l_seed: INTEGER
		do
			a_file.put_character ('/')
			a_file.put_character ('*')
			a_file.put_character (' ')
			a_file.put_character ('C')
			a_file.put_character ('a')
			a_file.put_character ('l')
			a_file.put_character ('l')
			a_file.put_character (' ')
			a_file.put_character ('t')
			a_file.put_character ('o')
			a_file.put_character (' ')
			a_file.put_string (a_target_type.base_type.unaliased_to_text)
			a_file.put_character ('.')
			a_file.put_string (STRING_.replaced_all_substrings (a_call.name.lower_name, "*/", "star/"))
			l_seed := a_call.name.seed
			if a_call.name.is_tuple_label then
				a_file.put_string (once " (label on item #")
				a_file.put_integer (l_seed)
				a_file.put_character (')')
			elseif l_seed = universe.routine_call_seed or l_seed = universe.function_item_seed then
				l_arguments := a_call.arguments
				if l_arguments /= Void and then l_arguments.count = 1 then
					l_manifest_tuple ?= l_arguments.actual_argument (1)
					if l_manifest_tuple /= Void then
						a_file.put_string (once " with a manifest tuple argument")
						l_argument_type_set := a_caller.dynamic_type_set (l_manifest_tuple)
						if l_argument_type_set = Void then
								-- Internal error: the dynamic type set of the
								-- actual arguments of the call should be known
								-- at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							a_file.put_string (once " of type ")
							a_file.put_string (l_argument_type_set.static_type.base_type.unaliased_to_text)
						end
					end
				end
			end
			a_file.put_character (' ')
			a_file.put_character ('*')
			a_file.put_character ('/')
			a_file.put_new_line
		end

feature {NONE} -- String generation

	print_escaped_string (a_string: STRING) is
			-- Print escaped version of `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
			l_code: INTEGER
			l_splitted: BOOLEAN
			l_split_size: INTEGER
		do
			l_split_size := 512
			current_file.put_character ('%"')
			nb := a_string.count
			from i := 1 until i > nb loop
				if (i \\ l_split_size) = 1 and i /= 1 then
						-- Some C compilers don't accept too big strings.
						-- Split them in several smaller ones.
					current_file.put_character ('%"')
					if not l_splitted then
						l_splitted := True
						indent
					end
					print_indentation
					current_file.put_character ('%"')
				end
				c := a_string.item (i)
				inspect c
				when ' ', '!', '#', '$', '&', '('..'>', '@'..'[', ']'..'~' then
					current_file.put_character (c)
				when '%N' then
					current_file.put_character ('\')
					current_file.put_character ('n')
				when '%R' then
					current_file.put_character ('\')
					current_file.put_character ('r')
				when '%T' then
					current_file.put_character ('\')
					current_file.put_character ('t')
				when '%U' then
					current_file.put_character ('\')
					current_file.put_character ('0')
					current_file.put_character ('0')
					current_file.put_character ('0')
				when '\' then
					current_file.put_character ('\')
					current_file.put_character ('\')
				when '%'' then
					current_file.put_character ('\')
					current_file.put_character ('%'')
				when '%"' then
					current_file.put_character ('\')
					current_file.put_character ('%"')
				when '?' then
						-- Make sure that ? is not recognized as
						-- part of a trigraph sequence.
					current_file.put_character ('\')
					current_file.put_character ('?')
				else
					current_file.put_character ('\')
					l_code := c.code
					if l_code < 8 then
						current_file.put_character ('0')
						current_file.put_character ('0')
					elseif l_code < 64 then
						current_file.put_character ('0')
					end
					INTEGER_FORMATTER_.put_octal_integer (current_file, l_code)
				end
				i := i + 1
			end
			current_file.put_character ('%"')
			if l_splitted then
				dedent
			end
		end

	print_escaped_character (c: CHARACTER) is
			-- Print escaped version of `c'.
		local
			l_code: INTEGER
		do
			current_file.put_character ('%'')
			inspect c
			when ' ', '!', '#', '$', '&', '('..'[', ']'..'~' then
				current_file.put_character (c)
			when '%N' then
				current_file.put_character ('\')
				current_file.put_character ('n')
			when '%R' then
				current_file.put_character ('\')
				current_file.put_character ('r')
			when '%T' then
				current_file.put_character ('\')
				current_file.put_character ('t')
			when '%U' then
				current_file.put_character ('\')
				current_file.put_character ('0')
				current_file.put_character ('0')
				current_file.put_character ('0')
			when '\' then
				current_file.put_character ('\')
				current_file.put_character ('\')
			when '%'' then
				current_file.put_character ('\')
				current_file.put_character ('%'')
			when '%"' then
				current_file.put_character ('\')
				current_file.put_character ('%"')
			else
				current_file.put_character ('\')
				l_code := c.code
				if l_code < 8 then
					current_file.put_character ('0')
					current_file.put_character ('0')
				elseif l_code < 64 then
					current_file.put_character ('0')
				end
				INTEGER_FORMATTER_.put_octal_integer (current_file, l_code)
			end
			current_file.put_character ('%'')
		end

feature {NONE} -- Indentation

	indentation: INTEGER
			-- Indentation in `current_file'

	indent is
			-- Increment indentation.
		do
			indentation := indentation + 1
		end

	dedent is
			-- Decrement indentation.
		do
			indentation := indentation - 1
		end

	print_indentation is
			-- Print indentation to `current_file'.
		local
			i, nb: INTEGER
		do
			nb := indentation
			from i := 1 until i > nb loop
				current_file.put_character ('%T')
				i := i + 1
			end
		end

feature {NONE} -- Convenience

	print_indentation_assign_to_result is
			-- Print indentation followed by 'R = ' to `current_file'.
		do
			print_indentation
			print_result_name (current_file)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
		end

	print_semicolon_newline is
			-- Print a smicolon followed by a newline to `current_file'.
		do
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_start_extern_c (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the beginning of 'extern "C"' section.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("#ifdef __cplusplus")
			a_file.put_line ("extern %"C%" {")
			a_file.put_line ("#endif")
			a_file.put_new_line
		end

	print_end_extern_c (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' the end of 'extern "C"' section.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_new_line
			a_file.put_line ("#ifdef __cplusplus")
			a_file.put_line ("}")
			a_file.put_line ("#endif")
		end

feature {NONE} -- Include files

	include_file (a_filename: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Include content of file `a_filename' to `a_file'.
		require
			a_filename_not_void: a_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_other_file: KL_TEXT_INPUT_FILE
		do
			create l_other_file.make (a_filename)
			l_other_file.open_read
			if l_other_file.is_open_read then
				a_file.append (l_other_file)
				l_other_file.close
			else
-- TODO: report error.
				set_fatal_error
			end
		end

	include_runtime_c_file (a_filename: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Include content of runtime C file `a_filename' to `a_file'.
		require
			a_filename_not_void: a_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_full_pathname: STRING
		do
			l_full_pathname := file_system.nested_pathname ("${GOBO}", <<"tool", "gec", "runtime", "c", a_filename>>)
			l_full_pathname := Execution_environment.interpreted_string (l_full_pathname)
			include_file (l_full_pathname, a_file)
		end

	include_header_filename (a_filename: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Include header filename `a_filename' to `a_file'.
		require
			a_filename_not_void: a_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if not included_header_filenames.has (a_filename) then
				if a_filename.same_string ("%"eif_console.h%"") then
					include_runtime_header_file ("eif_console.h", False, a_file)
				elseif a_filename.same_string ("%"eif_dir.h%"") then
					include_runtime_header_file ("eif_dir.h", False, a_file)
				elseif a_filename.same_string ("%"eif_eiffel.h%"") then
					include_runtime_header_file ("eif_eiffel.h", False, a_file)
				elseif a_filename.same_string ("%"eif_except.h%"") then
					include_runtime_header_file ("eif_except.h", False, a_file)
				elseif a_filename.same_string ("%"eif_file.h%"") then
					include_runtime_header_file ("eif_file.h", False, a_file)
				elseif a_filename.same_string ("%"eif_main.h%"") then
					include_runtime_header_file ("eif_main.h", False, a_file)
				elseif a_filename.same_string ("%"eif_memory.h%"") then
					include_runtime_header_file ("eif_memory.h", False, a_file)
				elseif a_filename.same_string ("%"eif_misc.h%"") then
					include_runtime_header_file ("eif_misc.h", False, a_file)
				elseif a_filename.same_string ("%"eif_path_name.h%"") then
					include_runtime_header_file ("eif_path_name.h", False, a_file)
				elseif a_filename.same_string ("%"eif_retrieve.h%"") then
					include_runtime_header_file ("eif_retrieve.h", False, a_file)
				elseif a_filename.same_string ("%"eif_sig.h%"") then
					include_runtime_header_file ("eif_sig.h", False, a_file)
				elseif a_filename.same_string ("%"eif_store.h%"") then
					include_runtime_header_file ("eif_store.h", False, a_file)
				elseif a_filename.same_string ("%"eif_threads.h%"") then
					include_runtime_header_file ("eif_threads.h", False, a_file)
				elseif a_filename.same_string ("%"eif_traverse.h%"") then
					include_runtime_header_file ("eif_traverse.h", False, a_file)
				elseif a_filename.same_string ("%"ge_time.h%"") then
					include_runtime_header_file ("ge_time.h", False, a_file)
				else
					included_header_filenames.force (a_filename)
				end
			end
		end

	include_runtime_header_file (a_filename: STRING; a_force: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Include runtime header file `a_filename' to `a_file'.
			-- `a_force' means that the file should be included now.
		require
			a_filename_not_void: a_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if not included_runtime_header_files.has (a_filename) then
				if a_filename.same_string ("ge_arguments.h") then
					included_runtime_c_files.force ("ge_arguments.c")
				elseif a_filename.same_string ("ge_console.h") then
					included_runtime_c_files.force ("ge_console.c")
				elseif a_filename.same_string ("ge_dll.h") then
					included_runtime_c_files.force ("ge_dll.c")
				elseif a_filename.same_string ("ge_exception.h") then
					included_runtime_c_files.force ("ge_exception.c")
				elseif a_filename.same_string ("ge_deep.h") then
					included_runtime_c_files.force ("ge_deep.c")
				elseif a_filename.same_string ("ge_gc.h") then
					included_runtime_c_files.force ("ge_gc.c")
				elseif a_filename.same_string ("ge_identified.h") then
					included_runtime_c_files.force ("ge_identified.c")
				elseif a_filename.same_string ("ge_main.h") then
					included_runtime_c_files.force ("ge_main.c")
				elseif a_filename.same_string ("eif_console.h") then
					include_runtime_header_file ("ge_console.h", False, a_file)
					include_runtime_header_file ("eif_file.h", False, a_file)
					included_runtime_c_files.force ("eif_console.c")
				elseif a_filename.same_string ("eif_dir.h") then
					included_runtime_c_files.force ("eif_dir.c")
				elseif a_filename.same_string ("eif_except.h") then
					include_runtime_header_file ("ge_exception.h", False, a_file)
					included_runtime_c_files.force ("eif_except.c")
				elseif a_filename.same_string ("eif_file.h") then
					included_runtime_c_files.force ("eif_file.c")
				elseif a_filename.same_string ("eif_main.h") then
					included_runtime_c_files.force ("eif_main.c")
				elseif a_filename.same_string ("eif_memory.h") then
					included_runtime_c_files.force ("eif_memory.c")
				elseif a_filename.same_string ("eif_misc.h") then
					include_runtime_header_file ("ge_dll.h", False, a_file)
					included_runtime_c_files.force ("eif_misc.c")
				elseif a_filename.same_string ("eif_path_name.h") then
					included_runtime_c_files.force ("eif_path_name.c")
				elseif a_filename.same_string ("eif_retrieve.h") then
					included_runtime_c_files.force ("eif_retrieve.c")
				elseif a_filename.same_string ("eif_sig.h") then
					included_runtime_c_files.force ("eif_sig.c")
				elseif a_filename.same_string ("eif_store.h") then
					included_runtime_c_files.force ("eif_store.c")
				elseif a_filename.same_string ("eif_traverse.h") then
					included_runtime_c_files.force ("eif_traverse.c")
				end
				if a_force then
					include_runtime_c_file (a_filename, a_file)
					included_runtime_header_files.force (True, a_filename)
				else
					included_runtime_header_files.force (False, a_filename)
				end
			elseif a_force and then not included_runtime_header_files.item (a_filename) then
				include_runtime_c_file (a_filename, a_file)
				included_runtime_header_files.replace (True, a_filename)
			end
		end

	included_header_filenames: DS_HASH_SET [STRING]
			-- Name of header filenames already included

	included_runtime_header_files: DS_HASH_TABLE [BOOLEAN, STRING]
			-- Name of runtime header files already included;
			-- True means that it has already been printed

	included_runtime_c_files: DS_HASH_SET [STRING]
			-- Name of runtime C files already included

feature {NONE} -- Output files/buffers

	header_file: KI_TEXT_OUTPUT_STREAM
			-- Header file

	c_file: KL_TEXT_OUTPUT_FILE
			-- C file
			-- (May be Void if not open yet.)

	c_file_size: INTEGER
			-- Number of bytes already written to `c_file'

	c_filenames: DS_HASH_TABLE [STRING, STRING]
			-- List of C (or C++) filenames generated;
			-- The key is the filename without the extension,
			-- the item is the file extension

	open_c_file is
			-- Open C file if necessary.
		do
		end

	flush_to_c_file is
			-- Open C file if not already done, and then
			-- flush to C file the code written in buffers.
			-- Take into account where we are in `split_mode' or not.
		local
			l_buffer: STRING
			l_filename: STRING
			l_header_filename: STRING
		do
			if c_file = Void then
				c_file_size := 0
				l_header_filename := system_name + h_file_extension
				l_filename := system_name + (c_filenames.count + 1).out
				c_filenames.force_last (c_file_extension, l_filename)
				create c_file.make (l_filename + c_file_extension)
				c_file.open_write
			elseif not c_file.is_open_write then
				c_file.open_append
			end
			if not c_file.is_open_write then
				set_fatal_error
				report_cannot_write_error (c_file.name)
				c_file := Void
			else
				if l_header_filename /= Void then
					c_file.put_string ("#include %"")
					c_file.put_string (l_header_filename)
					c_file.put_character ('%"')
					c_file.put_new_line
					c_file.put_new_line
					c_file_size := c_file_size + l_header_filename.count + 13
					print_start_extern_c (c_file)
					c_file_size := c_file_size + 40
				end
				l_buffer := current_function_header_buffer.string
				c_file.put_string (l_buffer)
				c_file_size := c_file_size + l_buffer.count
				STRING_.wipe_out (l_buffer)
				l_buffer := current_function_body_buffer.string
				c_file.put_string (l_buffer)
				c_file_size := c_file_size + l_buffer.count
				STRING_.wipe_out (l_buffer)
				if split_mode and then c_file_size >= split_threshold then
					close_c_file
				end
			end
		ensure
			flushed1: not has_fatal_error implies current_function_header_buffer.string.is_empty
			flushed2: not has_fatal_error implies current_function_body_buffer.string.is_empty
		end

	close_c_file is
			-- Close C file if not already done.
		do
			if c_file /= Void and then not c_file.is_closed then
				print_end_extern_c (c_file)
				c_file.close
			end
			c_file := Void
			c_file_size := 0
		ensure
			c_file_reset: c_file = Void
			c_file_size_reset: c_file_size = 0
		end

	cpp_file: KL_TEXT_OUTPUT_FILE
			-- C++ file
			-- (May be Void if not open yet.)

	cpp_file_size: INTEGER
			-- Number of bytes already written to `cpp_file'

	open_cpp_file is
			-- Open C++ file if necessary.
		do
		end

	flush_to_cpp_file is
			-- Open C++ file if not already done, and then
			-- flush to C++ file the code written in buffers.
			-- Take into account where we are in `split_mode' or not.
		local
			l_buffer: STRING
			l_filename: STRING
			l_header_filename: STRING
		do
			if cpp_file = Void then
				cpp_file_size := 0
				l_header_filename := system_name + h_file_extension
				l_filename := system_name + (c_filenames.count + 1).out
				c_filenames.force_last (cpp_file_extension, l_filename)
				create cpp_file.make (l_filename + cpp_file_extension)
				cpp_file.open_write
			elseif not cpp_file.is_open_write then
				cpp_file.open_append
			end
			if not cpp_file.is_open_write then
				set_fatal_error
				report_cannot_write_error (cpp_file.name)
				cpp_file := Void
			else
				if l_header_filename /= Void then
					cpp_file.put_string ("#include %"")
					cpp_file.put_string (l_header_filename)
					cpp_file.put_character ('%"')
					cpp_file.put_new_line
					cpp_file.put_new_line
					cpp_file_size := cpp_file_size + l_header_filename.count + 13
					print_start_extern_c (cpp_file)
					cpp_file_size := cpp_file_size + 40
				end
				l_buffer := current_function_header_buffer.string
				cpp_file.put_string (l_buffer)
				cpp_file_size := cpp_file_size + l_buffer.count
				STRING_.wipe_out (l_buffer)
				l_buffer := current_function_body_buffer.string
				cpp_file.put_string (l_buffer)
				cpp_file_size := cpp_file_size + l_buffer.count
				STRING_.wipe_out (l_buffer)
				if split_mode and then cpp_file_size >= split_threshold then
					close_cpp_file
				end
			end
		ensure
			flushed1: not has_fatal_error implies current_function_header_buffer.string.is_empty
			flushed2: not has_fatal_error implies current_function_body_buffer.string.is_empty
		end

	close_cpp_file is
			-- Close C++ file if not already done.
		do
			if cpp_file /= Void and then not cpp_file.is_closed then
				print_end_extern_c (cpp_file)
				cpp_file.close
			end
			cpp_file := Void
			cpp_file_size := 0
		ensure
			cpp_file_reset: cpp_file = Void
			cpp_file_size_reset: cpp_file_size = 0
		end

	current_file: KI_TEXT_OUTPUT_STREAM
			-- Output file;
			-- In fact, it's not a file but a buffer (either `current_function_header_buffer'
			-- or `current_function_body_buffer'), which is then flushed to either a C or
			-- C++ file.

	current_function_header_buffer: KL_STRING_OUTPUT_STREAM
			-- Buffer to write the C header of the current function;
			-- This is useful when we need to declare local variables
			-- on the fly while generating the code for the body of
			-- the C function.

	current_function_body_buffer: KL_STRING_OUTPUT_STREAM
			-- Buffer to write the C body of the current function

feature {ET_AST_NODE} -- Processing

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_assigner_instruction (an_instruction)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			print_assignment (an_instruction)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			print_assignment_attempt (an_instruction)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			print_attribute (a_feature)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_bang_instruction (an_instruction)
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			print_bit_constant (a_constant)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_bracket_expression (an_expression)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_character_constant (a_constant)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_character_constant (a_constant)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_character_constant (a_constant)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			if an_expression = current_agent then
				print_call_agent_body_declaration (an_expression)
			else
				print_call_agent (an_expression)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_call_expression (an_expression)
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_call_instruction (an_instruction)
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_check_instruction (an_instruction)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			print_constant_attribute (a_feature)
		end

	process_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_convert_expression (an_expression)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_convert_to_expression (an_expression)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_create_expression (an_expression)
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_create_instruction (an_instruction)
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			print_current (an_expression)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			print_current_address (an_expression)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_debug_instruction (an_instruction)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
			print_deferred_function (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_deferred_procedure (a_feature)
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
			print_do_function (a_feature)
		end

	process_do_function_inline_agent (an_agent: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_do_function_inline_agent_body_declaration (an_agent)
			else
				print_do_function_inline_agent (an_agent)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_do_procedure (a_feature)
		end

	process_do_procedure_inline_agent (an_agent: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_do_procedure_inline_agent_body_declaration (an_agent)
			else
				print_do_procedure_inline_agent (an_agent)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_equality_expression (an_expression)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			print_expression_address (an_expression)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
			print_external_function (a_feature)
		end

	process_external_function_inline_agent (an_agent: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_external_function_inline_agent_body_declaration (an_agent)
			else
				print_external_function_inline_agent (an_agent)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_external_procedure (a_feature)
		end

	process_external_procedure_inline_agent (an_agent: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_external_procedure_inline_agent_body_declaration (an_agent)
			else
				print_external_procedure_inline_agent (an_agent)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			print_false_constant (a_constant)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			print_feature_address (an_expression)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_hexadecimal_integer_constant (a_constant)
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
			if an_identifier.is_argument then
				print_formal_argument (an_identifier)
			elseif an_identifier.is_temporary then
				print_temporary_variable (an_identifier)
			elseif an_identifier.is_local then
				print_local_variable (an_identifier)
			elseif an_identifier.is_agent_open_operand then
				print_agent_open_operand (an_identifier)
			elseif an_identifier.is_agent_closed_operand then
				print_agent_closed_operand (an_identifier)
			elseif an_identifier.is_instruction then
				print_unqualified_identifier_call_instruction (an_identifier)
			else
				print_unqualified_identifier_call_expression (an_identifier)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_if_instruction (an_instruction)
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_infix_cast_expression (an_expression)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_infix_expression (an_expression)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_inspect_instruction (an_instruction)
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_loop_instruction (an_instruction)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			print_manifest_array (an_expression)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			print_manifest_tuple (an_expression)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			print_manifest_type (an_expression)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_old_expression (an_expression)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			print_once_function (a_feature)
		end

	process_once_function_inline_agent (an_agent: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_once_function_inline_agent_body_declaration (an_agent)
			else
				print_once_function_inline_agent (an_agent)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			print_once_manifest_string (an_expression)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_once_procedure (a_feature)
		end

	process_once_procedure_inline_agent (an_agent: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_agent'.
		do
			if an_agent = current_agent then
				print_once_procedure_inline_agent_body_declaration (an_agent)
			else
				print_once_procedure_inline_agent (an_agent)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_parenthesized_expression (an_expression)
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_precursor_expression (an_expression)
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_precursor_instruction (an_instruction)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_prefix_expression (an_expression)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_regular_integer_constant (a_constant)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			print_regular_manifest_string (a_string)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			print_regular_real_constant (a_constant)
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			print_result (an_expression)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			print_result_address (an_expression)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_retry_instruction (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			-- Do nothing.
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			print_special_manifest_string (a_string)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_static_call_expression (an_expression)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			print_static_call_instruction (an_instruction)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_strip_expression (an_expression)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			print_true_constant (a_constant)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_underscored_integer_constant (a_constant)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			print_underscored_real_constant (a_constant)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			print_unique_attribute (a_feature)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			print_verbatim_string (a_string)
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
			print_void (an_expression)
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

	report_cannot_read_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_cannot_write_error (a_filename: STRING) is
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

feature {NONE} -- Type resolving

	resolved_formal_parameters (a_type: ET_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' (when WRITTEN
			-- in class `current_feature.static_feature.implementation_class')
			-- by their corresponding actual parameters in `current_type.base_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			Result := type_checker.resolved_formal_parameters (a_type, current_feature.static_feature.implementation_class, current_type.base_type)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			resolved_type_not_void: Result /= Void
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Access

	system_name: STRING
			-- Name of the system being compiled

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature being processed

	current_type: ET_DYNAMIC_TYPE
			-- Type where `current_feature' belongs

	current_agent: ET_AGENT
			-- Agent being processed if any, Void otherwise

	current_agents: DS_ARRAYED_LIST [ET_AGENT]
			-- Agents already processed in `current_feature'

	called_features: DS_ARRAYED_LIST [ET_DYNAMIC_FEATURE]
			-- Features being called

	manifest_array_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of manifest arrays

	manifest_tuple_types: DS_HASH_SET [ET_DYNAMIC_TUPLE_TYPE]
			-- Types of manifest tuples

	once_features: DS_HASH_SET [ET_FEATURE]
			-- Once features already generated

	constant_features: DS_HASH_TABLE [ET_CONSTANT, ET_FEATURE]
			-- Features returning a constant

	inline_constants: DS_HASH_SET [ET_INLINE_CONSTANT]
			-- Inline constants (such as once manifest strings)

	dynamic_type_id_set_names: DS_HASH_TABLE [STRING, STRING]
			-- Names of C arrays made up of dynamic type ids, indexed by those dynamic type ids;
			-- Those dynamic type ids which are used as keys are of the form
			-- "<type-id1>,<type-id2>,...,<type-idN>" and are sorted in increasing order.

feature {NONE} -- Dynamic type sets

	dynamic_type_set (an_operand: ET_OPERAND): ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set associated with `an_operand';
			-- Report a fatal error if not known
		require
			an_operand_not_void: an_operand /= Void
		local
			i: INTEGER
		do
			if an_operand = tokens.current_keyword then
				Result := current_type
			else
				i := an_operand.index
				if i >= 1 and i <= current_dynamic_type_sets.count then
					Result := current_dynamic_type_sets.item (i)
				else
						-- Internal error: dynamic type set not known.
--					set_fatal_error
--					error_handler.report_giaaa_error
--					Result := current_system.none_type
				end
			end
		ensure
--			dynamic_type_set_not_void: Result /= Void
		end

	current_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets of expressions within feature being printed

	internal_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets used internally when needed

	conforming_type_set: ET_DYNAMIC_STANDALONE_TYPE_SET
			-- Set of types conforming to the target of the current assignment attempt or
			-- types to which the target of the current call to 'ANY.conforms_to' conform

	conforming_types: ET_DYNAMIC_TYPE_LIST
			-- Types conforming to the target of the current assignment attempt or
			-- types to which the target of the current call to 'ANY.conforms_to' conform;
			-- Also used for the arguments of PROCEDURE.call and FUNCTION.item to
			-- detect CAT-calls

	non_conforming_types: ET_DYNAMIC_TYPE_LIST
			-- Types non-conforming to the target of the current assignment attempt or
			-- types to which the target of the current call to 'ANY.conforms_to' do not conform

	attachment_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]
			-- List of dynamic type ids of the source of an attachment

	target_dynamic_type_ids: DS_ARRAYED_LIST [INTEGER]
			-- List of dynamic type ids of the target of a  call

	target_dynamic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]
			-- Dynamic types of the target of a call indexed by type ids

	dynamic_type_id_sorter: DS_QUICK_SORTER [INTEGER] is
			-- Dynamic type id sorter
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		once
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			sorter_not_void: Result /= Void
		end

	standalone_type_sets: ET_DYNAMIC_STANDALONE_TYPE_SET_LIST
			-- Standalone type sets to be used as argument type sets when processing
			-- polymorphic calls, or as target type sets when attributes are deep twined

feature {NONE} -- Temporary variables

	new_temp_variable (a_type: ET_DYNAMIC_TYPE): ET_IDENTIFIER is
			-- New temporary variable of type `a_type'
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
		do
			nb := free_temp_variables.count
			from i := 1 until i > nb loop
				if frozen_temp_variables.item (i) = 0 then
					l_type := free_temp_variables.item (i)
					if l_type /= Void and then same_declaration_types (a_type, l_type) then
						used_temp_variables.replace (a_type, i)
						free_temp_variables.replace (Void, i)
						Result := temp_variables.item (i)
						i := nb + 1
					end
				end
				i := i + 1
			end
			if Result = Void then
				nb := nb + 1
				if nb <= temp_variables.count then
					Result := temp_variables.item (nb)
				elseif short_names then
					create Result.make ("t" + nb.out)
					Result.set_temporary (True)
					Result.set_seed (nb)
					temp_variables.force_last (Result)
				else
-- TODO: long names
					create Result.make ("t" + nb.out)
					Result.set_temporary (True)
					Result.set_seed (nb)
					temp_variables.force_last (Result)
				end
				free_temp_variables.force_last (Void)
				used_temp_variables.force_last (a_type)
				frozen_temp_variables.force_last (0)
				current_function_header_buffer.put_character ('%T')
				print_type_declaration (a_type, current_function_header_buffer)
				current_function_header_buffer.put_character (' ')
				print_temp_name (Result, current_function_header_buffer)
				current_function_header_buffer.put_character (';')
				current_function_header_buffer.put_new_line
			end
		ensure
			variable_not_void: Result /= Void
			known_variable: is_temp_variable_known (Result)
			used_variable: is_temp_variable_used (Result)
			not_free_variable: not is_temp_variable_free (Result)
			not_frozen_variable: not is_temp_variable_frozen (Result)
		end

	is_temp_variable_known (a_temp: ET_IDENTIFIER): BOOLEAN is
			-- Is temporary variable `a_temp' under management?
		require
			a_temp_not_void: a_temp /= Void
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			Result := (l_seed >= 1 and l_seed <= used_temp_variables.count)
		end

	is_temp_variable_used (a_temp: ET_IDENTIFIER): BOOLEAN is
			-- Is temporary variable `a_temp' currently used?
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
		do
			Result := used_temp_variables.item (a_temp.seed) /= Void
		ensure
			definition: Result = (used_temp_variables.item (a_temp.seed) /= Void)
		end

	is_temp_variable_free (a_temp: ET_IDENTIFIER): BOOLEAN is
			-- Is temporary variable `a_temp' currently free?
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
		do
			Result := free_temp_variables.item (a_temp.seed) /= Void
		ensure
			definition: Result = (free_temp_variables.item (a_temp.seed) /= Void)
		end

	is_temp_variable_frozen (a_temp: ET_IDENTIFIER): BOOLEAN is
			-- Is temporary variable `a_temp' currently frozen?
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
		do
			Result := frozen_temp_variables.item (a_temp.seed) /= 0
		ensure
			definition: Result = (frozen_temp_variables.item (a_temp.seed) /= 0)
		end

	mark_temp_variable_used (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as used.
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
			a_temp_free: is_temp_variable_free (a_temp)
			a_temp_not_frozen: not is_temp_variable_frozen (a_temp)
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			used_temp_variables.replace (free_temp_variables.item (l_seed), l_seed)
			free_temp_variables.replace (Void, l_seed)
		ensure
			a_temp_used: is_temp_variable_used (a_temp)
		end

	mark_temp_variable_free (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as free.
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
			a_temp_used: is_temp_variable_used (a_temp)
			a_temp_not_frozen: not is_temp_variable_frozen (a_temp)
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			free_temp_variables.replace (used_temp_variables.item (l_seed), l_seed)
			used_temp_variables.replace (Void, l_seed)
		ensure
			a_temp_free: is_temp_variable_free (a_temp)
		end

	mark_temp_variable_frozen (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as frozen.
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			frozen_temp_variables.replace (frozen_temp_variables.item (l_seed) + 1, l_seed)
		ensure
			a_temp_frozen: is_temp_variable_frozen (a_temp)
			a_temp_frozen_by_one_level: frozen_temp_variables.item (a_temp.seed) = old frozen_temp_variables.item (a_temp.seed) + 1
		end

	mark_temp_variable_unfrozen (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as not frozen.
		require
			a_temp_not_void: a_temp /= Void
			a_temp_known: is_temp_variable_known (a_temp)
			a_temp_frozen: is_temp_variable_frozen (a_temp)
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			frozen_temp_variables.replace (frozen_temp_variables.item (l_seed) - 1, l_seed)
		ensure
			a_temp_unfrozen_by_one_level: frozen_temp_variables.item (a_temp.seed) = old frozen_temp_variables.item (a_temp.seed) - 1
		end

	mark_call_operands_frozen is
			-- Mark temporary variables in `call_operands' as frozen.
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
		do
			nb := call_operands.count
			from i := 1 until i > nb loop
				l_temp ?= call_operands.item (i)
				if l_temp /= Void and then l_temp.is_temporary then
					mark_temp_variable_frozen (l_temp)
				end
				i := i + 1
			end
		end

	mark_call_operands_unfrozen is
			-- Mark temporary variables in `call_operands' as unfrozen.
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
		do
			nb := call_operands.count
			from i := 1 until i > nb loop
				l_temp ?= call_operands.item (i)
				if l_temp /= Void and then l_temp.is_temporary and then is_temp_variable_frozen (l_temp) then
					mark_temp_variable_unfrozen (l_temp)
				end
				i := i + 1
			end
		end

	mark_expressions_frozen (a_expressions: ET_EXPRESSIONS) is
			-- Mark temporary variables in `a_expressions' as frozen.
		require
			a_expressions_not_void: a_expressions /= Void
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
		do
			nb := a_expressions.count
			from i := 1 until i > nb loop
				l_temp ?= a_expressions.expression (i)
				if l_temp /= Void and then l_temp.is_temporary then
					mark_temp_variable_frozen (l_temp)
				end
				i := i + 1
			end
		end

	mark_expressions_unfrozen (a_expressions: ET_EXPRESSIONS) is
			-- Mark temporary variables in `a_expressions' as unfrozen.
		require
			a_expressions_not_void: a_expressions /= Void
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
		do
			nb := a_expressions.count
			from i := 1 until i > nb loop
				l_temp ?= a_expressions.expression (i)
				if l_temp /= Void and then l_temp.is_temporary and then is_temp_variable_frozen (l_temp) then
					mark_temp_variable_unfrozen (l_temp)
				end
				i := i + 1
			end
		end

	reset_temp_variables is
			-- Reset temporary variables so that they can be used again in another function. 
		do
			used_temp_variables.wipe_out
			free_temp_variables.wipe_out
			frozen_temp_variables.wipe_out
		end

feature {NONE} -- Temporary variables (Implementation)

	temp_variables: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Names of temporary variables generated so far

	used_temp_variables: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Temporary variables currently in used by the current feature

	free_temp_variables: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Temporary variables declared for the current feature but
			-- not currently used

	frozen_temp_variables: DS_ARRAYED_LIST [INTEGER]
			-- Temporay variables currently marked as frozen (which means
			-- that we need to keep them in their current used/free state);
			-- 0 means not frozen, N means that it was been frozen N times.

	temp_variable: ET_IDENTIFIER is
			-- Shared temporary variable, to be used in non-Eiffel features
			-- such as 'GE_ms', 'GE_ma*' or 'main'.
		once
			if short_names then
				create Result.make ("t1")
			else
-- TODO: long names
				create Result.make ("t1")
			end
			Result.set_temporary (True)
			Result.set_seed (1)
		ensure
			temp_variable_not_void: Result /= Void
		end

feature {NONE} -- Formal arguments

	formal_argument (i: INTEGER): ET_IDENTIFIER is
			-- Formal argument at index `i'
			-- Note: to be used only functions that are not the direct
			-- translation of an Eiffel feature. Otherwise we should use
			-- the corresponding formal argument in that Eiffel feature
			-- (e.g. 'a_feature.arguments.formal_argument (i).name').
		require
			i_large_enough: i >= 1
		local
			nb: INTEGER
			l_arg: ET_IDENTIFIER
		do
			nb := formal_arguments.count
			if i > nb then
				if i > formal_arguments.capacity then
					formal_arguments.resize (i)
				end
				from until nb = i loop
					nb := nb + 1
					create l_arg.make ("a" + nb.out)
					l_arg.set_argument (True)
					l_arg.set_seed (nb)
					l_arg.set_index (nb)
					formal_arguments.put_last (l_arg)
				end
			end
			Result := formal_arguments.item (i)
		ensure
			formal_argument_not_void: Result /= Void
		end

feature {NONE} -- Formal arguments (Implementation)

	formal_arguments: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Formal arguments indexed by argument position

feature {NONE} -- Operand stack

	operand_stack: DS_ARRAYED_STACK [ET_EXPRESSION]
			-- Operand stack

	call_operands: DS_ARRAYED_LIST [ET_EXPRESSION]
			-- Operands of call being processed

	fill_call_operands (nb: INTEGER) is
			-- Fill `call_operands' with nb operands found in `operand_stack'.
		require
			nb_not_negative: nb >= 0
		local
			i, j: INTEGER
			l_operand: ET_EXPRESSION
			l_temp: ET_IDENTIFIER
		do
			call_operands.wipe_out
			if call_operands.capacity < nb then
				call_operands.resize (nb)
			end
			if nb > operand_stack.count then
					-- Internal error.
				set_fatal_error
				error_handler.report_giaaa_error
					-- Put some dummy operands to preserve the postcondition.
				from i := 1 until i > nb loop
					call_operands.put_last (tokens.current_keyword)
					i := i + 1
				end
			else
				j := operand_stack.count - nb + 1
				from i := 1 until i > nb loop
					l_operand := operand_stack.i_th (j)
					l_temp ?= l_operand
					if l_temp /= Void and then l_temp.is_temporary then
						if not is_temp_variable_frozen (l_temp) then
							mark_temp_variable_free (l_temp)
						end
					end
					call_operands.put_last (l_operand)
					j := j + 1
					i := i + 1
				end
				operand_stack.prune (nb)
			end
		ensure
			filled: call_operands.count = nb
		end

	fill_call_formal_arguments (a_feature: ET_FEATURE) is
			-- Fill `call_operands' with 'Current' followed by the formal arguments of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: ET_IDENTIFIER
		do
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb := l_arguments.count
			end
			call_operands.wipe_out
			if call_operands.capacity < nb + 1 then
				call_operands.resize (nb + 1)
			end
			call_operands.put_last (tokens.current_keyword)
			from i := 1 until i > nb loop
				l_name := l_arguments.formal_argument (i).name
				l_name.set_index (i)
				call_operands.force_last (l_name)
				i := i + 1
			end
		ensure
			filled: call_operands.count = a_feature.arguments_count + 1
		end

feature {NONE} -- Tuple arguments in agent routines

	new_agent_tuple_item_expression (i: INTEGER): ET_CALL_EXPRESSION is
			-- Expression to extract the `i'-th item of the tuple argument of an agent
		require
			i_large_enough: i >= 1
		local
			l_label: ET_IDENTIFIER
			nb: INTEGER
		do
			nb := agent_tuple_item_expressions.count
			if i > nb then
				if i > agent_tuple_item_expressions.capacity then
					agent_tuple_item_expressions.resize (i)
				end
				from until nb = i loop
					agent_tuple_item_expressions.put_last (Void)
					nb := nb + 1
				end
			end
			Result := agent_tuple_item_expressions.item (i)
			if Result = Void then
				create l_label.make ("l")
				l_label.set_tuple_label (True)
				l_label.set_seed (i)
				create Result.make (tokens.current_keyword, l_label, Void)
				agent_tuple_item_expressions.replace (Result, i)
			end
		ensure
			expresssion_not_void: Result /= Void
		end

	agent_manifest_tuple: ET_MANIFEST_TUPLE
			-- Manifest tuple used when calling an agent

feature {NONE} -- Tuple arguments in agent routines (Implementation)

	agent_tuple_item_expressions: DS_ARRAYED_LIST [ET_CALL_EXPRESSION]
			-- Expressions to extract items of the tuple argument of an agent,
			-- indexed by item index

feature {NONE} -- Implementation

	in_operand: BOOLEAN
			-- Is an operand being processed?

	in_target: BOOLEAN is
			-- Is the target of a call being processed?
		do
			Result := (call_target_type /= Void)
		ensure
			definition: Result = (call_target_type /= Void)
		end

	call_target_type: ET_DYNAMIC_TYPE
			-- Dynamic type of the target of the call being processed, if any
			-- (The dynamic type is the type of the object, not its declared
			-- type, also called static type.)

	call_target_check_void: BOOLEAN
			-- Do we need to check whether the target is Void or not
			-- when both `in_target' and not `in_operand' mode?

	assignment_target: ET_WRITABLE
			-- Target of expression currently being processed, if any

	same_declaration_types (a_type1, a_type2: ET_DYNAMIC_TYPE): BOOLEAN is
			-- Do `a_type1' and `a_type2' have the same declaration type?
		require
			a_type1_not_void: a_type1 /= Void
			a_type2_not_void: a_type2 /= Void
		do
			if a_type1 = a_type2 then
				Result := True
			else
				Result := (not a_type1.is_expanded and not a_type2.is_expanded)
			end
		end

	dummy_feature: ET_DYNAMIC_FEATURE is
			-- Dummy feature
		local
			l_name: ET_FEATURE_NAME
			l_feature: ET_FEATURE
		once
			create {ET_IDENTIFIER} l_name.make ("**dummy**")
			create {ET_DO_PROCEDURE} l_feature.make (l_name, Void, current_type.base_class)
			create Result.make (l_feature, current_type, current_system)
		ensure
			dummy_feature_not_void: Result /= Void
		end

feature {NONE} -- External regexp

	external_c_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C [blocking] [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			-- \5: has signature arguments
			-- \6: signature arguments
			-- \11: signature result
			-- \18: include files

	external_c_macro_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C [blocking] macro [signature ["(" {<type> "," ...}* ")"] [":" <type>]] use {<include> "," ...}+
			-- \4: has signature arguments
			-- \5: signature arguments
			-- \10: signature result
			-- \17: include files

	external_c_struct_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C struct <struct-type> (access|get) <field-name> [type <field-type>] use {<include> "," ...}+
			-- \1: struct type
			-- \6: field name
			-- \9: field type
			-- \16: include files

	external_c_inline_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C [blocking] inline [use {<include> "," ...}+]
			-- \3: include files

	old_external_c_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C ["(" {<type> "," ...}* ")" [":" <type>]] ["|" {<include> "," ...}+]
			-- \1: has signature
			-- \2: signature arguments
			-- \4: signature result
			-- \6: include files

	old_external_c_macro_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C "[" macro <include> "]" ["(" {<type> "," ...}* ")"] [":" <type>]
			-- \1: include file
			-- \2: has signature arguments
			-- \3: signature arguments
			-- \5: signature result

	old_external_c_struct_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C "[" struct <include> "]" "(" {<type> "," ...}+ ")" [":" <type>]
			-- \1: include file
			-- \2: signature arguments
			-- \4: signature result

	external_cpp_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C [blocking] <class_type> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			-- \2: class type
			-- \5: has signature arguments
			-- \6: signature arguments
			-- \11: signature result
			-- \18: include files

	external_cpp_inline_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: C++ [blocking] inline [use {<include> "," ...}+]
			-- \3: include files

	external_dllwin_regexp: RX_PCRE_REGULAR_EXPRESSION
			-- Regexp: [blocking] dllwin <dll_file> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			-- \2: dll file
			-- \5: has signature arguments
			-- \6: signature arguments
			-- \11: signature result
			-- \18: include files

	make_external_regexps is
			-- Create external regular expressions.
		do
				-- Regexp: C [blocking] [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			create external_c_regexp.make
			external_c_regexp.compile ("[ \t\r\n]*[Cc]([ \t\r\n]+|$)(blocking([ \t\r\n]+|$))?(signature[ \t\r\n]*(\((([ \t\r\n]*[^ \t\r\n,)])+([ \t\r\n]*,([ \t\r\n]*[^ \t\r\n,)])+)*)?[ \t\r\n]*\))[ \t\r\n]*(:[ \t\r\n]*((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$)((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$))*))?)?(use[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C [blocking] macro [signature ["(" {<type> "," ...}* ")"] [":" <type>]] use {<include> "," ...}+
			create external_c_macro_regexp.make
			external_c_macro_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]+(blocking[ \t\r\n]+)?macro([ \t\r\n]+|$)(signature[ \t\r\n]*(\((([ \t\r\n]*[^ \t\r\n,)])+([ \t\r\n]*,([ \t\r\n]*[^ \t\r\n,)])+)*)?[ \t\r\n]*\))[ \t\r\n]*(:[ \t\r\n]*((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$)((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$))*))?)?(use[ \t\r\n]*((.|\n)+))")
				-- Regexp: C struct <struct-type> (access|get) <field-name> [type <field-type>] use {<include> "," ...}+
			create external_c_struct_regexp.make
			external_c_struct_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]+struct[ \t\r\n]+((a|ac|acc|acce|acces|g|ge|[^ag \t\r\n][^ \t\r\n]*|g[^e \t\r\n][^ \t\r\n]*|ge[^t \t\r\n][^ \t\r\n]*|get[^ \t\r\n]+|a[^c \t\r\n][^ \t\r\n]*|ac[^c \t\r\n][^ \t\r\n]*|acc[^e \t\r\n][^ \t\r\n]*|acce[^s \t\r\n][^ \t\r\n]*|acces[^s \t\r\n][^ \t\r\n]*|access[^ \t\r\n]+)[ \t\r\n]+((a|ac|acc|acce|acces|g|ge|[^ag \t\r\n][^ \t\r\n]*|g[^e \t\r\n][^ \t\r\n]*|ge[^t \t\r\n][^ \t\r\n]*|get[^ \t\r\n]+|a[^c \t\r\n][^ \t\r\n]*|ac[^c \t\r\n][^ \t\r\n]*|acc[^e \t\r\n][^ \t\r\n]*|acce[^s \t\r\n][^ \t\r\n]*|acces[^s \t\r\n][^ \t\r\n]*|access[^ \t\r\n]+)[ \t\r\n]+)*)(access|get)[ \t\r\n]+([^ \t\r\n]+)([ \t\r\n]+|$)(type[ \t\r\n]+((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$)((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$))*))?(use[ \t\r\n]*((.|\n)+))")
				-- Regexp: C [blocking] inline [use {<include> "," ...}+]
			create external_c_inline_regexp.make
			external_c_inline_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]+(blocking[ \t\r\n]+)?inline([ \t\r\n]+use[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C ["(" {<type> "," ...}* ")" [":" <type>]] ["|" {<include> "," ...}+]
			create old_external_c_regexp.make
			old_external_c_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]*(\(([^)]*)\)[ \t\r\n]*(:[ \t\r\n]*([^|]+))?)?[ \t\r\n]*(\|[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C "[" macro <include> "]" ["(" {<type> "," ...}* ")"] [":" <type>]
			create old_external_c_macro_regexp.make
			old_external_c_macro_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]*\[[ \t\r\n]*macro[ \t\r\n]*([^]]+)\][ \t\r\n]*(\(([^)]*)\))?[ \t\r\n]*(:[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C "[" struct <include> "]" "(" {<type> "," ...}+ ")" [":" <type>]
			create old_external_c_struct_regexp.make
			old_external_c_struct_regexp.compile ("[ \t\r\n]*[Cc][ \t\r\n]*\[[ \t\r\n]*struct[ \t\r\n]*([^]]+)\][ \t\r\n]*\(([^)]+)\)[ \t\r\n]*(:[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C++ [blocking] <class_type> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			create external_cpp_regexp.make
			external_cpp_regexp.compile ("[ \t\r\n]*[Cc]\+\+[ \t\r\n]+(blocking[ \t\r\n]+)?([^ \t\r\n]+)([ \t\r\n]+|$)(signature[ \t\r\n]*(\((([ \t\r\n]*[^ \t\r\n,)])+([ \t\r\n]*,([ \t\r\n]*[^ \t\r\n,)])+)*)?[ \t\r\n]*\))[ \t\r\n]*(:[ \t\r\n]*((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$)((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$))*))?)?(use[ \t\r\n]*((.|\n)+))?")
				-- Regexp: C++ [blocking] inline [use {<include> "," ...}+]
			create external_cpp_inline_regexp.make
			external_cpp_inline_regexp.compile ("[ \t\r\n]*[Cc]\+\+[ \t\r\n]+(blocking[ \t\r\n]+)?inline([ \t\r\n]+use[ \t\r\n]*((.|\n)+))?")
				-- Regexp: [blocking] dllwin <dll_file> [signature ["(" {<type> "," ...}* ")"] [":" <type>]] [use {<include> "," ...}+]
			create external_dllwin_regexp.make
			external_dllwin_regexp.compile ("[ \t\r\n]*(blocking[ \t\r\n]+)?[Dd][Ll][Ll][Ww][Ii][Nn][ \t\r\n]+([^ \t\r\n]+)([ \t\r\n]+|$)(signature[ \t\r\n]*(\((([ \t\r\n]*[^ \t\r\n,)])+([ \t\r\n]*,([ \t\r\n]*[^ \t\r\n,)])+)*)?[ \t\r\n]*\))[ \t\r\n]*(:[ \t\r\n]*((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$)((u|us|use[^ \t\r\n<%"]+|[^u \t\r\n][^ \t\r\n]*|u[^s \t\r\n][^ \t\r\n]*|us[^e \t\r\n][^ \t\r\n]*)([ \t\r\n]+|$))*))?)?(use[ \t\r\n]*((.|\n)+))?")
		ensure
			external_c_regexp_not_void: external_c_regexp /= Void
			external_c_regexp_compiled: external_c_regexp.is_compiled
			external_c_macro_regexp_not_void: external_c_macro_regexp /= Void
			external_c_macro_regexp_compiled: external_c_macro_regexp.is_compiled
			external_c_struct_regexp_not_void: external_c_struct_regexp /= Void
			external_c_struct_regexp_compiled: external_c_struct_regexp.is_compiled
			external_c_inline_regexp_not_void: external_c_inline_regexp /= Void
			external_c_inline_regexp_compiled: external_c_inline_regexp.is_compiled
			old_external_c_regexp_not_void: old_external_c_regexp /= Void
			old_external_c_regexp_compiled: old_external_c_regexp.is_compiled
			old_external_c_macro_regexp_not_void: old_external_c_macro_regexp /= Void
			old_external_c_macro_regexp_compiled: old_external_c_macro_regexp.is_compiled
			old_external_c_struct_regexp_not_void: old_external_c_struct_regexp /= Void
			old_external_c_struct_regexp_compiled: old_external_c_struct_regexp.is_compiled
			external_cpp_regexp_not_void: external_cpp_regexp /= Void
			external_cpp_regexp_compiled: external_cpp_regexp.is_compiled
			external_cpp_inline_regexp_not_void: external_cpp_inline_regexp /= Void
			external_cpp_inline_regexp_compiled: external_cpp_inline_regexp.is_compiled
			external_dllwin_regexp_not_void: external_dllwin_regexp /= Void
			external_dllwin_regexp_compiled: external_dllwin_regexp.is_compiled
		end

feature {NONE} -- Constants

	c_arrow: STRING is "->"
	c_break: STRING is "break"
	c_case: STRING is "case"
	c_char: STRING is "char"
	c_default: STRING is "default"
	c_define: STRING is "#define"
	c_double: STRING is "double"
	c_eif_any: STRING is "EIF_ANY"
	c_eif_boolean: STRING is "EIF_BOOLEAN"
	c_eif_boehm_gc: STRING is "EIF_BOEHM_GC"
	c_eif_character: STRING is "EIF_CHARACTER"
	c_eif_character_8: STRING is "EIF_CHARACTER_8"
	c_eif_character_32: STRING is "EIF_CHARACTER_32"
	c_eif_double: STRING is "EIF_DOUBLE"
	c_eif_false: STRING is "EIF_FALSE"
	c_eif_integer: STRING is "EIF_INTEGER"
	c_eif_integer_8: STRING is "EIF_INTEGER_8"
	c_eif_integer_16: STRING is "EIF_INTEGER_16"
	c_eif_integer_32: STRING is "EIF_INTEGER_32"
	c_eif_integer_64: STRING is "EIF_INTEGER_64"
	c_eif_is_unix: STRING is "EIF_IS_UNIX"
	c_eif_is_vms: STRING is "EIF_IS_VMS"
	c_eif_is_windows: STRING is "EIF_IS_WINDOWS"
	c_eif_natural: STRING is "EIF_NATURAL"
	c_eif_natural_8: STRING is "EIF_NATURAL_8"
	c_eif_natural_16: STRING is "EIF_NATURAL_16"
	c_eif_natural_32: STRING is "EIF_NATURAL_32"
	c_eif_natural_64: STRING is "EIF_NATURAL_64"
	c_eif_object: STRING is "EIF_OBJECT"
	c_eif_pointer: STRING is "EIF_POINTER"
	c_eif_real: STRING is "EIF_REAL"
	c_eif_real_32: STRING is "EIF_REAL_32"
	c_eif_real_64: STRING is "EIF_REAL_64"
	c_eif_reference: STRING is "EIF_REFERENCE"
	c_eif_test: STRING is "EIF_TEST"
	c_eif_trace: STRING is "EIF_TRACE"
	c_eif_true: STRING is "EIF_TRUE"
	c_eif_type: STRING is "EIF_TYPE"
	c_eif_void: STRING is "EIF_VOID"
	c_eif_wide_char: STRING is "EIF_WIDE_CHAR"
	c_eif_windows: STRING is "EIF_WINDOWS"
	c_else: STRING is "else"
	c_endif: STRING is "#endif"
	c_extern: STRING is "extern"
	c_float: STRING is "float"
	c_for: STRING is "for"
	c_fprintf: STRING is "fprintf"
	c_ge_alloc: STRING is "GE_alloc"
	c_ge_argc: STRING is "GE_argc"
	c_ge_argv: STRING is "GE_argv"
	c_ge_boxed: STRING is "GE_boxed"
	c_ge_catcall: STRING is "GE_catcall"
	c_ge_ceiling: STRING is "GE_ceiling"
	c_ge_const_init: STRING is "GE_const_init"
	c_ge_deep: STRING is "GE_deep"
	c_ge_deep_twin: STRING is "GE_deep_twin"
	c_ge_default: STRING is "GE_default"
	c_ge_dts: STRING is "GE_dts"
	c_ge_floor: STRING is "GE_floor"
	c_ge_id_object: STRING is "GE_id_object"
	c_ge_int8: STRING is "GE_int8"
	c_ge_int16: STRING is "GE_int16"
	c_ge_int32: STRING is "GE_int32"
	c_ge_int64: STRING is "GE_int64"
	c_ge_ma: STRING is "GE_ma"
	c_ge_ms: STRING is "GE_ms"
	c_ge_mt: STRING is "GE_mt"
	c_ge_nat8: STRING is "GE_nat8"
	c_ge_nat16: STRING is "GE_nat16"
	c_ge_nat32: STRING is "GE_nat32"
	c_ge_nat64: STRING is "GE_nat64"
	c_ge_object_id: STRING is "GE_object_id"
	c_ge_object_id_free: STRING is "GE_object_id_free"
	c_ge_power: STRING is "GE_power"
	c_ge_raise: STRING is "GE_raise"
	c_ge_rescue: STRING is "GE_rescue"
	c_ge_retry: STRING is "GE_retry"
	c_ge_setjmp: STRING is "GE_setjmp"
	c_ge_show_console: STRING is "GE_show_console"
	c_ge_types: STRING is "GE_types"
	c_ge_void: STRING is "GE_void"
	c_goto: STRING is "goto"
	c_id: STRING is "id"
	c_if: STRING is "if"
	c_ifdef: STRING is "#ifdef"
	c_include: STRING is "#include"
	c_int: STRING is "int"
	c_int8_t: STRING is "int8_t"
	c_int16_t: STRING is "int16_t"
	c_int32_t: STRING is "int32_t"
	c_int64_t: STRING is "int64_t"
	c_is_special: STRING is "is_special"
	c_memcmp: STRING is "memcmp"
	c_memcpy: STRING is "memcpy"
	c_return: STRING is "return"
	c_sizeof: STRING is "sizeof"
	c_stderr: STRING is "stderr"
	c_struct: STRING is "struct"
	c_switch: STRING is "switch"
	c_type_id: STRING is "type_id"
	c_typedef: STRING is "typedef"
	c_undef: STRING is "#undef"
	c_unsigned: STRING is "unsigned"
	c_void: STRING is "void"
	c_while: STRING is "while"
			-- String constants

	default_split_threshold: INTEGER is 1000000
			-- Default value for `split_threshold'

	bat_file_extension: STRING is ".bat"
	c_file_extension: STRING is ".c"
	cfg_file_extension: STRING is ".cfg"
	cpp_file_extension: STRING is ".cpp"
	h_file_extension: STRING is ".h"
	sh_file_extension: STRING is ".sh"
			-- File extensions

invariant

	current_system_not_void: current_system /= Void
	current_file_not_void: current_file /= Void
	current_file_open_write: current_file.is_open_write
	header_file_not_void: header_file /= Void
	header_file_open_write: header_file.is_open_write
	current_function_header_buffer_not_void: current_function_header_buffer /= Void
	current_function_body_buffer_not_void: current_function_body_buffer /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void
	type_checker_not_void: type_checker /= Void
	operand_stack_not_void: operand_stack /= Void
	no_void_operand: not operand_stack.has (Void)
	call_operands_not_void: call_operands /= Void
	no_void_call_operand: not call_operands.has (Void)
	conforming_type_set_not_void: conforming_type_set /= Void
	conforming_types_not_void: conforming_types /= Void
	non_conforming_types_not_void: non_conforming_types /= Void
	attachment_dynamic_type_ids_not_void: attachment_dynamic_type_ids /= Void
	target_dynamic_type_ids_not_void: target_dynamic_type_ids /= Void
	target_dynamic_types_not_void: target_dynamic_types /= Void
	no_void_target_dynamic_type: not target_dynamic_types.has_item (Void)
	standalone_type_sets_not_void: standalone_type_sets /= Void
	no_void_standalone_type_set: standalone_type_sets.has (Void)
	deep_twin_types_not_void: deep_twin_types /= Void
	no_void_deep_twin_type: not deep_twin_types.has (Void)
	deep_equal_types_not_void: deep_equal_types /= Void
	no_void_deep_equal_type: not deep_equal_types.has (Void)
	deep_feature_target_type_sets_not_void: deep_feature_target_type_sets /= Void
	no_void_deep_feature_target_type_set: not deep_feature_target_type_sets.has_item (Void)
	no_void_deep_feature_static_target_type: not deep_feature_target_type_sets.has (Void)
	current_agents_not_void: current_agents /= Void
	no_void_agent: not current_agents.has (Void)
	agent_instruction_not_void: agent_instruction /= Void
	agent_expression_not_void: agent_expression /= Void
	agent_target_not_void: agent_target /= Void
	agent_arguments_not_void: agent_arguments /= Void
	agent_open_operands_not_void: agent_open_operands /= Void
	no_void_agent_open_operand: not agent_open_operands.has (Void)
	agent_closed_operands_not_void: agent_closed_operands /= Void
	no_void_agent_closed_operand: not agent_closed_operands.has (Void)
	wrapper_expression_not_void: wrapper_expression /= Void
	manifest_array_types_not_void: manifest_array_types /= Void
	no_void_manifest_array_type: not manifest_array_types.has (Void)
	manifest_tuple_types_not_void: manifest_tuple_types /= Void
	no_void_manifest_tuple_type: not manifest_tuple_types.has (Void)
	called_features_not_void: called_features /= Void
	no_void_called_feature: not called_features.has (Void)
	once_features_not_void: once_features /= Void
	no_void_once_feature: not once_features.has (Void)
	-- once_feature_constraint: forall f in once_features, f = f.implementation_feature
	constant_features_not_void: constant_features /= Void
	no_void_constant_feature: not constant_features.has (Void)
	-- constant_feature_constraint: forall f in constant_features, f = f.implementation_feature
	inline_constants_not_void: inline_constants /= Void
	no_void_inline_constant: not inline_constants.has (Void)
		-- Temporary variables.
	temp_variables_not_void: temp_variables /= Void
	no_void_temp_variable: not temp_variables.has (Void)
	used_temp_variables_not_void: used_temp_variables /= Void
	used_temp_variables_count: used_temp_variables.count <= temp_variables.count
	free_temp_variables_not_void: free_temp_variables /= Void
	free_temp_variables_count: free_temp_variables.count = used_temp_variables.count
	frozen_temp_variables_not_void: frozen_temp_variables /= Void
	frozen_temp_variables_count: frozen_temp_variables.count = used_temp_variables.count
		--
	included_header_filenames_not_void: included_header_filenames /= Void
	no_void_included_header_filename: not included_header_filenames.has (Void)
	included_runtime_header_files_not_void: included_runtime_header_files /= Void
	no_void_included_runtime_header_file: not included_runtime_header_files.has (Void)
	included_runtime_c_files_not_void: included_runtime_c_files /= Void
	no_void_included_runtime_c_file: not included_runtime_c_files.has (Void)
	c_filenames_not_void: c_filenames /= Void
	no_void_c_filename: not c_filenames.has (Void)
	no_void_c_file_extension: not c_filenames.has_item (Void)
		-- Regular expressions for external features.
	external_c_regexp_not_void: external_c_regexp /= Void
	external_c_regexp_compiled: external_c_regexp.is_compiled
	external_c_macro_regexp_not_void: external_c_macro_regexp /= Void
	external_c_macro_regexp_compiled: external_c_macro_regexp.is_compiled
	external_c_struct_regexp_not_void: external_c_struct_regexp /= Void
	external_c_struct_regexp_compiled: external_c_struct_regexp.is_compiled
	external_c_inline_regexp_not_void: external_c_inline_regexp /= Void
	external_c_inline_regexp_compiled: external_c_inline_regexp.is_compiled
	old_external_c_regexp_not_void: old_external_c_regexp /= Void
	old_external_c_regexp_compiled: old_external_c_regexp.is_compiled
	old_external_c_macro_regexp_not_void: old_external_c_macro_regexp /= Void
	old_external_c_macro_regexp_compiled: old_external_c_macro_regexp.is_compiled
	old_external_c_struct_regexp_not_void: old_external_c_struct_regexp /= Void
	old_external_c_struct_regexp_compiled: old_external_c_struct_regexp.is_compiled
	external_cpp_regexp_not_void: external_cpp_regexp /= Void
	external_cpp_regexp_compiled: external_cpp_regexp.is_compiled
	external_cpp_inline_regexp_not_void: external_cpp_inline_regexp /= Void
	external_cpp_inline_regexp_compiled: external_cpp_inline_regexp.is_compiled
	external_dllwin_regexp_not_void: external_dllwin_regexp /= Void
	external_dllwin_regexp_compiled: external_dllwin_regexp.is_compiled
		--
	split_threshold_positive: split_threshold > 0
	system_name_not_void: system_name /= Void
	dynamic_type_id_set_names_not_void: dynamic_type_id_set_names /= Void
	no_void_dynamic_type_id_set_name: not dynamic_type_id_set_names.has_item (Void)
	no_void_dynamic_type_id_set: not dynamic_type_id_set_names.has (Void)
	current_dynamic_type_sets_not_void: current_dynamic_type_sets /= Void
	internal_dynamic_type_sets_not_void: internal_dynamic_type_sets /= Void
	agent_tuple_item_expressions_not_void: agent_tuple_item_expressions /= Void
	agent_manifest_tuple_not_void: agent_manifest_tuple /= Void
	formal_arguments_not_void: formal_arguments /= Void
	no_void_formal_argument: not formal_arguments.has (Void)

end
