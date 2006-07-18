indexing

	description:

		"C code generators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			process_do_procedure,
			process_equality_expression,
			process_expression_address,
			process_external_function,
			process_external_procedure,
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
			process_once_manifest_string,
			process_once_procedure,
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
			create type_checker.make (universe)
			current_system := a_system
			current_file := null_output_stream
			header_file := null_output_stream
			current_type := a_system.none_type
			current_feature := dummy_feature
			create l_buffer.make (1024)
			create current_function_header_buffer.make (l_buffer)
			create l_buffer.make (100000)
			create current_function_body_buffer.make (l_buffer)
			create temp_variables.make (40)
			create used_temp_variables.make (40)
			create free_temp_variables.make (40)
			create accepted_types.make_with_capacity (100)
			create denied_types.make_with_capacity (100)
			create operand_stack.make (5000)
			create call_operands.make (5000)
			create polymorphic_seeds.make (1000)
			create polymorphic_type_ids.make (100)
			create polymorphic_types.make_map (100)
			create call_agents.make (20)
			create agent_open_operands.make (20)
			create agent_closed_operands.make (20)
			create agent_arguments.make_with_capacity (100)
			create agent_instruction.make (Void, current_feature.static_feature.name, Void)
			create agent_expression.make (Void, current_feature.static_feature.name, Void)
			create agent_assignment.make (tokens.result_keyword, agent_expression)
			create wrapper_expression.make (Void, current_feature.static_feature.name, Void)
			create wrapper_assignment.make (tokens.result_keyword, wrapper_expression)
			create manifest_array_types.make (100)
			create manifest_tuple_types.make (100)
			create once_features.make (10000)
			create constant_features.make_map (10000)
			create called_features.make (1000)
			create included_header_filenames.make (100)
			included_header_filenames.set_equality_tester (string_equality_tester)
			create included_runtime_header_files.make (100)
			included_runtime_header_files.set_equality_tester (string_equality_tester)
			create included_runtime_c_files.make (100)
			included_runtime_c_files.set_equality_tester (string_equality_tester)
		end

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when generating `current_system'?

	short_names: BOOLEAN
			-- Should short names be generated for type and feature names?

feature -- Generation

	generate (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate C code for `current_system' in to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			old_file: KI_TEXT_OUTPUT_STREAM
			old_header_file: KI_TEXT_OUTPUT_STREAM
			l_header_filename: STRING
			l_header_file: KL_TEXT_OUTPUT_FILE
			l_root_procedure: ET_DYNAMIC_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			has_fatal_error := False
			if current_system.universe.system_name /= Void then
				l_header_filename := current_system.universe.system_name + ".h"
			else
				l_header_filename := current_system.universe.root_class.name.name + ".h"
			end
			create l_header_file.make (l_header_filename)
			l_header_file.open_write
			if not l_header_file.is_open_write then
				set_fatal_error
-- TODO: report error.
			else
				old_header_file := header_file
				header_file := l_header_file
				old_file := current_file
				current_file := a_file
				generate_ids
				include_runtime_header_file ("ge_eiffel.h", header_file)
				header_file.put_new_line
				print_types (header_file)
				header_file.put_new_line
				header_file.put_line ("extern int geargc;")
				header_file.put_line ("extern char** geargv;")
				header_file.put_new_line
				a_file.put_string ("#include %"")
				a_file.put_string (l_header_filename)
				a_file.put_character ('%"')
				a_file.put_new_line
				a_file.put_new_line
				print_gems_function
				a_file.put_new_line
					-- Print polymorphic calls.
				print_polymorphic_query_calls
				print_polymorphic_procedure_calls
					-- Print Eiffel features.
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
					-- Print features which build manifest arrays.
				from manifest_array_types.start until manifest_array_types.after loop
					print_gema_function (manifest_array_types.item_for_iteration)
					a_file.put_new_line
					manifest_array_types.forth
				end
				manifest_array_types.wipe_out
					-- Print features which build manifest tuples.
				from manifest_tuple_types.start until manifest_tuple_types.after loop
					print_gemt_function (manifest_tuple_types.item_for_iteration)
					a_file.put_new_line
					manifest_tuple_types.forth
				end
				manifest_tuple_types.wipe_out
					-- Print call-on-void-target function.
				print_gevoid_function
				a_file.put_new_line
					-- Print arguments.
				a_file.put_line ("int geargc;")
				a_file.put_line ("char** geargv;")
				a_file.put_new_line
					-- Print constants declarations.
				print_constants_declaration
				a_file.put_new_line
				print_geconst_function
				a_file.put_new_line
					-- Print 'getypes' array.
				print_getypes_array
				a_file.put_new_line
					-- Print 'main' function.
				print_main_function
				a_file.put_new_line
					-- Include runtime C files.
				header_file.put_new_line
				from included_runtime_c_files.start until included_runtime_c_files.after loop
					include_runtime_c_file (included_runtime_c_files.item_for_iteration, a_file)
					included_runtime_c_files.forth
				end
				included_header_filenames.wipe_out
				included_runtime_header_files.wipe_out
				included_runtime_c_files.wipe_out
				once_features.wipe_out
				constant_features.wipe_out
				header_file := old_header_file
				l_header_file.close
				current_file := old_file
				current_type := current_system.none_type
				current_feature := dummy_feature
			end
		end

feature {NONE} -- Generation

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
			i, nb: INTEGER
		do
			if not a_feature.is_semistrict then
				old_type := current_type
				current_type := a_feature.target_type
				old_feature := current_feature
				current_feature := a_feature
				a_feature.static_feature.process (Current)
					-- Print declaration of agents used in `a_feature'.
				nb := call_agents.count
				from i := 1 until i > nb loop
					print_call_agent_declaration (i, call_agents.item (i))
					i := i + 1
				end
				call_agents.wipe_out
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
			l_any: ET_CLASS
			l_result_type: ET_DYNAMIC_TYPE
		do
			l_any := current_system.universe.any_class
			from constant_features.start until constant_features.after loop
				l_feature := constant_features.key_for_iteration
				if not once_features.has (l_feature) then
					l_type := l_feature.type
					if l_type = Void then
							-- Internal feature: a constant attribute has a type.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_result_type := current_system.dynamic_type (l_type, l_any)
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
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: ET_IDENTIFIER
			i, nb, nb_args: INTEGER
			l_language: ET_EXTERNAL_LANGUAGE
			l_language_value: ET_MANIFEST_STRING
			l_language_string: STRING
			l_language_name: STRING
			l_inline: STRING
			l_blocking: STRING
			l_macro: STRING
			l_include_filename: STRING
			l_signature: STRING
			l_use: STRING
			l_signature_arguments: STRING
			l_signature_result: STRING
			c: CHARACTER
			stop: BOOLEAN
			l_comma: BOOLEAN
			l_alias: ET_EXTERNAL_ALIAS
			l_alias_value: ET_MANIFEST_STRING
			l_splitter: ST_SPLITTER
			l_list: DS_LIST [STRING]
			l_cursor: DS_LIST_CURSOR [STRING]
			l_struct: STRING
			l_access: STRING
			l_type: STRING
			l_get: STRING
			l_struct_field_name: STRING
			l_struct_field_type: STRING
			l_struct_type: STRING
			old_file: KI_TEXT_OUTPUT_STREAM
			l_buffer: STRING
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
				print_type_declaration (l_result_type_set.static_type, header_file)
				print_type_declaration (l_result_type_set.static_type, current_file)
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
					-- Dynamic type sets for arguments are stored first
					-- in `dynamic_type_sets'.
				l_dynamic_type_sets := current_feature.dynamic_type_sets
				if l_dynamic_type_sets.count < nb_args then
						-- Internal error: it has already been checked somewhere else
						-- that there was the same number of actual and formal arguments.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					from i := 1 until i > nb_args loop
						if l_comma then
							header_file.put_character (',')
							current_file.put_character (',')
							header_file.put_character (' ')
							current_file.put_character (' ')
						else
							l_comma := True
						end
						print_type_declaration (l_dynamic_type_sets.item (i).static_type, header_file)
						print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
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
			nb := l_language_string.count
				-- Remove leading spaces.
			from
				i := 1
			until
				i > nb or stop
			loop
				inspect l_language_string.item (i)
				when ' ', '%R', '%T', '%N' then
					i := i + 1
				else
					stop := True
				end
			end
				-- Read language name.
			from
				stop := False
				create l_language_name.make (10)
			until
				i > nb or stop
			loop
				c := l_language_string.item (i)
				inspect c
				when ' ', '%R', '%T', '%N' then
					stop := True
				else
					l_language_name.append_character (c)
					i := i + 1
				end
			end
				-- Remove spaces.
			from
				stop := False
			until
				i > nb or stop
			loop
				inspect l_language_string.item (i)
				when ' ', '%R', '%T', '%N' then
					i := i + 1
				else
					stop := True
				end
			end
			if l_language_name.is_empty then
-- TODO: error
			elseif STRING_.same_case_insensitive (l_language_name, e_c) then
					-- Look for 'blocking' keyword.
				if i + 7 <= nb then
					l_blocking := l_language_string.substring (i, i + 7)
					if not STRING_.same_case_insensitive (l_blocking, e_blocking) then
						l_blocking := Void
					else
							-- Remove spaces.
						from
							i := i + 8
							stop := False
						until
							i > nb or stop
						loop
							inspect l_language_string.item (i)
							when ' ', '%R', '%T', '%N' then
								i := i + 1
							else
								stop := True
							end
						end
					end
				end
					-- Look for 'inline' keyword.
				if i + 5 <= nb then
					l_inline := l_language_string.substring (i, i + 5)
					if not STRING_.same_case_insensitive (l_inline, e_inline) then
						l_inline := Void
					else
							-- Remove spaces.
						from
							i := i + 6
							stop := False
						until
							i > nb or stop
						loop
							inspect l_language_string.item (i)
							when ' ', '%R', '%T', '%N' then
								i := i + 1
							else
								stop := True
							end
						end
					end
				end
					-- Look for 'macro' keyword.
				if i + 4 <= nb then
					l_macro := l_language_string.substring (i, i + 4)
					if not STRING_.same_case_insensitive (l_macro, e_macro) then
						l_macro := Void
					else
							-- Remove spaces.
						from
							i := i + 5
							stop := False
						until
							i > nb or stop
						loop
							inspect l_language_string.item (i)
							when ' ', '%R', '%T', '%N' then
								i := i + 1
							else
								stop := True
							end
						end
					end
				end
					-- Look for 'struct' keyword.
				if i + 5 <= nb then
					l_struct := l_language_string.substring (i, i + 5)
					if not STRING_.same_case_insensitive (l_struct, e_struct) then
						l_struct := Void
					else
							-- Look for struct type.
						from
							i := i + 6
							stop := False
							create l_struct_type.make (10)
						until
							i > nb or stop
						loop
							c := l_language_string.item (i)
							inspect c
							when 'a', 'A' then
								if i + 5 <= nb then
									l_access := l_language_string.substring (i, i + 5)
									if not STRING_.same_case_insensitive (l_access, e_access) then
										l_access := Void
									else
										i := i + 6
										stop := True
									end
								end
								if not stop then
									l_struct_type.append_character (c)
									i := i + 1
								end
							when 'g', 'G' then
								if i + 2 <= nb then
									l_get := l_language_string.substring (i, i + 2)
									if not STRING_.same_case_insensitive (l_get, e_get) then
										l_get := Void
									else
										i := i + 3
										stop := True
									end
								end
								if not stop then
									l_struct_type.append_character (c)
									i := i + 1
								end
							else
								l_struct_type.append_character (c)
								i := i + 1
							end
						end
							-- Look for field name.
						from
							stop := False
							create l_struct_field_name.make (10)
						until
							i > nb or stop
						loop
							c := l_language_string.item (i)
							inspect c
							when 't', 'T' then
								if i + 3 <= nb then
									l_type := l_language_string.substring (i, i + 3)
									if not STRING_.same_case_insensitive (l_type, e_type) then
										l_type := Void
									else
										i := i + 4
										stop := True
									end
								end
								if not stop then
									l_struct_field_name.append_character (c)
									i := i + 1
								end
							when 'u', 'U' then
								if i + 2 <= nb then
									l_use := l_language_string.substring (i, i + 2)
									if not STRING_.same_case_insensitive (l_use, e_use) then
										l_use := Void
									else
										stop := True
									end
								end
								if not stop then
									l_struct_field_name.append_character (c)
									i := i + 1
								end
							else
								l_struct_field_name.append_character (c)
								i := i + 1
							end
						end
							-- Look for field type.
						if l_type /= Void then
							from
								stop := False
								create l_struct_field_type.make (10)
							until
								i > nb or stop
							loop
								c := l_language_string.item (i)
								inspect c
								when 'u', 'U' then
									if i + 2 <= nb then
										l_use := l_language_string.substring (i, i + 2)
										if not STRING_.same_case_insensitive (l_use, e_use) then
											l_use := Void
										else
											stop := True
										end
									end
									if not stop then
										l_struct_field_type.append_character (c)
										i := i + 1
									end
								else
									l_struct_field_type.append_character (c)
									i := i + 1
								end
							end
						end
							-- Remove spaces.
						from
							i := i + 6
							stop := False
						until
							i > nb or stop
						loop
							inspect l_language_string.item (i)
							when ' ', '%R', '%T', '%N' then
								i := i + 1
							else
								stop := True
							end
						end
					end
				end
					-- Look for old 'macro' or 'struct' syntax.
				if i <= nb and then l_language_string.item (i) = '[' then
						-- Remove spaces.
					from
						i := i + 1
						stop := False
					until
						i > nb or stop
					loop
						inspect l_language_string.item (i)
						when ' ', '%R', '%T', '%N' then
							i := i + 1
						else
							stop := True
						end
					end
					if i + 4 <= nb then
						l_macro := l_language_string.substring (i, i + 4)
						if not STRING_.same_case_insensitive (l_macro, e_macro) then
							l_macro := Void
						else
								-- Remove spaces.
							from
								i := i + 5
								stop := False
							until
								i > nb or stop
							loop
								inspect l_language_string.item (i)
								when ' ', '%R', '%T', '%N' then
									i := i + 1
								else
									stop := True
								end
							end
						end
					end
					if i + 5 <= nb then
						l_struct := l_language_string.substring (i, i + 5)
						if not STRING_.same_case_insensitive (l_struct, e_struct) then
							l_struct := Void
						else
								-- Remove spaces.
							from
								i := i + 6
								stop := False
							until
								i > nb or stop
							loop
								inspect l_language_string.item (i)
								when ' ', '%R', '%T', '%N' then
									i := i + 1
								else
									stop := True
								end
							end
						end
					end
					if l_macro = Void and l_struct = Void then
-- TODO: syntax error
					end
					from
						i := i + 1
						stop := False
						create l_include_filename.make (50)
					until
						i > nb or stop
					loop
						c := l_language_string.item (i)
						inspect c
						when ']' then
							stop := True
						else
							l_include_filename.append_character (c)
							i := i + 1
						end
					end
					if i > nb then
-- TODO: error
					else
						i := i + 1
						STRING_.left_adjust (l_include_filename)
						STRING_.right_adjust (l_include_filename)
						include_header_filename (l_include_filename, header_file)
					end
						-- Remove spaces.
					from
						stop := False
					until
						i > nb or stop
					loop
						inspect l_language_string.item (i)
						when ' ', '%R', '%T', '%N' then
							i := i + 1
						else
							stop := True
						end
					end
				end
					-- Look for signature.
				if i + 8 <= nb then
					l_signature := l_language_string.substring (i, i + 8)
					if not STRING_.same_case_insensitive (l_signature, e_signature) then
						l_signature := Void
					else
							-- Remove spaces.
						from
							i := i + 9
							stop := False
						until
							i > nb or stop
						loop
							inspect l_language_string.item (i)
							when ' ', '%R', '%T', '%N' then
								i := i + 1
							else
								stop := True
							end
						end
					end
				end
				if i <= nb and then l_language_string.item (i) = '(' then
						-- Read signature arguments.
					from
						i := i + 1
						stop := False
						create l_signature_arguments.make (50)
					until
						i > nb or stop
					loop
						c := l_language_string.item (i)
						inspect c
						when ')' then
							stop := True
						else
							l_signature_arguments.append_character (c)
							i := i + 1
						end
					end
					if i > nb then
-- TODO: error
					else
						i := i + 1
					end
						-- Remove spaces.
					from
						stop := False
					until
						i > nb or stop
					loop
						inspect l_language_string.item (i)
						when ' ', '%R', '%T', '%N' then
							i := i + 1
						else
							stop := True
						end
					end
				end
				if i <= nb and then l_language_string.item (i) = ':' then
						-- Read signature result.
					from
						i := i + 1
						stop := False
						create l_signature_result.make (10)
					until
						i > nb or stop
					loop
						c := l_language_string.item (i)
						inspect c
						when '|' then
							stop := True
						when 'u', 'U' then
							if i + 2 <= nb then
								l_use := l_language_string.substring (i, i + 2)
								if not STRING_.same_case_insensitive (l_use, e_use) then
									l_use := Void
								else
									stop := True
								end
							end
							if not stop then
								l_signature_result.append_character (c)
								i := i + 1
							end
						else
							l_signature_result.append_character (c)
							i := i + 1
						end
					end
				end
				if l_signature_arguments = Void and l_signature_result = Void then
					if l_signature /= Void then
-- TODO: syntax error.
					end
				elseif l_signature = Void then
					l_signature := e_signature
				end
					-- Look for use.
				if i <= nb and then l_language_string.item (i) = '|' then
					l_use := e_use
					i := i + 1
				elseif i + 2 <= nb then
					l_use := l_language_string.substring (i, i + 2)
					if not STRING_.same_case_insensitive (l_use, e_use) then
						l_use := Void
					else
						i := i + 3
					end
				end
				if l_use /= Void then
					if i > nb then
-- TODO: syntax error
					else
						create l_splitter.make_with_separators (",")
						l_list := l_splitter.split (l_language_string.substring (i, nb))
						l_cursor := l_list.new_cursor
						from l_cursor.start until l_cursor.after loop
							l_include_filename := l_cursor.item
							STRING_.left_adjust (l_include_filename)
							STRING_.right_adjust (l_include_filename)
							include_header_filename (l_include_filename, header_file)
							l_cursor.forth
						end
					end
				end
			elseif not a_feature.is_builtin then
-- TODO: not supported
			end
				-- Print body.
			if l_inline = Void and l_result_type_set /= Void then
				print_indentation
				print_type_declaration (l_result_type_set.static_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
			if a_creation then
				print_malloc_current (a_feature)
			end
			if a_feature.is_builtin then
				print_external_builtin_body (a_feature)
			elseif l_inline /= Void then
					-- external "C inline".
				if l_signature /= Void then
-- TODO: syntax error
				end
				print_external_c_inline_body (a_feature)
			elseif l_struct /= Void then
				if l_result_type_set /= Void then
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_type_cast (l_result_type_set.static_type, current_file)
					current_file.put_character ('(')
				end
				if l_struct_type = Void then
					if l_signature_arguments = Void then
-- TODO: syntax error
					else
						create l_splitter.make_with_separators (",")
						l_list := l_splitter.split (l_signature_arguments)
						inspect l_list.count
						when 1 then
							l_struct_type := l_list.item (1)
						when 2 then
							l_struct_type := l_list.item (1)
							l_struct_field_type := l_list.item (2)
						else
-- TODO: syntax error
						end
					end
					if l_signature_result /= Void then
						l_struct_field_type := l_signature_result
					end
					l_alias := a_feature.alias_clause
					if l_alias /= Void then
						l_alias_value := l_alias.manifest_string
						l_struct_field_name := l_alias_value.value
					else
						l_struct_field_name := a_feature.implementation_feature.name.lower_name
					end
				end
				if l_struct_type /= Void and l_struct_field_name /= Void then
					if not l_struct_field_name.is_empty then
						inspect l_struct_field_name.item (1)
						when '@' then
							l_struct_field_name.remove_head (1)
						when '&' then
							l_struct_field_name.remove_head (1)
							current_file.put_character ('&')
						else
						end
					end
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_character ('(')
					current_file.put_string (l_struct_type)
					current_file.put_character ('*')
					current_file.put_character (')')
					if nb_args >= 1 then
						l_name := l_arguments.formal_argument (1).name
						print_argument_name (l_name, current_file)
					else
-- TODO: error
					end
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('>')
					current_file.put_string (l_struct_field_name)
					current_file.put_character (')')
					if l_result_type_set = Void then
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						if l_struct_field_type /= Void then
							current_file.put_character ('(')
							current_file.put_string (l_struct_field_type)
							current_file.put_character (')')
						end
						if nb_args >= 2 then
							l_name := l_arguments.formal_argument (2).name
							print_argument_name (l_name, current_file)
						else
-- TODO: error
						end
					end
				end
				if l_result_type_set /= Void then
					current_file.put_character (')')
				end
				current_file.put_character (';')
				current_file.put_new_line
			else
					-- external "C".
				print_indentation
				if l_result_type_set /= Void then
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_type_declaration (l_result_type_set.static_type, current_file)
					current_file.put_character (')')
					if l_signature_result /= Void then
						current_file.put_character ('(')
						current_file.put_string (l_signature_result)
						current_file.put_character (')')
					end
				end
				l_alias := a_feature.alias_clause
				if l_alias /= Void then
					l_alias_value := l_alias.manifest_string
					current_file.put_string (l_alias_value.value)
				else
					current_file.put_string (a_feature.implementation_feature.name.lower_name)
				end
				if nb_args > 0 then
					current_file.put_character ('(')
					if l_signature_arguments /= Void then
						create l_splitter.make_with_separators (",")
						l_list := l_splitter.split (l_signature_arguments)
						if l_list.count /= nb_args then
-- TODO: error
						end
						l_cursor := l_list.new_cursor
						l_cursor.start
						if not l_cursor.after then
							current_file.put_character ('(')
							current_file.put_string (l_cursor.item)
							current_file.put_character (')')
							l_cursor.forth
						end
						l_name := l_arguments.formal_argument (1).name
						print_argument_name (l_name, current_file)
						from i := 2 until i > nb_args loop
							current_file.put_character (',')
							if not l_cursor.after then
								current_file.put_character ('(')
								current_file.put_string (l_cursor.item)
								current_file.put_character (')')
								l_cursor.forth
							end
							l_name := l_arguments.formal_argument (i).name
							print_argument_name (l_name, current_file)
							i := i + 1
						end
					else
						l_name := l_arguments.formal_argument (1).name
						print_argument_name (l_name, current_file)
						from i := 2 until i > nb_args loop
							current_file.put_character (',')
							l_name := l_arguments.formal_argument (i).name
							print_argument_name (l_name, current_file)
							i := i + 1
						end
					end
					current_file.put_character (')')
				elseif l_macro = Void or else l_signature_arguments /= Void then
					current_file.put_character ('(')
					current_file.put_character (')')
				end
				current_file.put_character (';')
				current_file.put_new_line
			end
			if l_inline = Void and l_result_type_set /= Void then
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
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			l_buffer := current_function_header_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			l_buffer := current_function_body_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			free_temp_variables.wipe_out
			used_temp_variables.wipe_out
		end

	print_external_builtin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature `a_feature' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_builtin_code: INTEGER
			l_builtin_class: INTEGER
			l_integer_type: ET_DYNAMIC_TYPE
			l_real_type: ET_DYNAMIC_TYPE
			l_character_type: ET_DYNAMIC_TYPE
		do
			l_builtin_code := a_feature.builtin_code
			l_builtin_class := l_builtin_code // builtin_capacity
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set /= Void then
					-- This is a built-in function.
				inspect l_builtin_class
				when builtin_any_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_any_twin then
						print_builtin_any_twin_body (a_feature)
					when builtin_any_same_type then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_any_same_type_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_any_standard_is_equal then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_any_standard_is_equal_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_any_conforms_to then
						print_builtin_any_conforms_to_body (a_feature)
					when builtin_any_generator then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_any_generator_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_any_generating_type then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_any_generating_type_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_any_standard_twin then
						print_builtin_any_standard_twin_body (a_feature)
					when builtin_any_tagged_out then
						print_builtin_any_tagged_out_body (a_feature)
					when builtin_any_is_deep_equal then
						print_builtin_any_is_deep_equal_body (a_feature)
					when builtin_any_deep_twin then
						print_builtin_any_deep_twin_body (a_feature)
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_special_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_special_item then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_special_item_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_special_count then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_special_count_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_special_element_size then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_special_element_size_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_special_aliased_resized_area then
						print_builtin_special_aliased_resized_area_body (a_feature)
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_boolean_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_boolean_and then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_boolean_and_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_boolean_or then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_boolean_or_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_boolean_xor then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_boolean_xor_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_boolean_not then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_boolean_not_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_boolean_item then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_boolean_item_call (current_type, current_feature)
						print_semicolon_newline
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_pointer_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_pointer_item then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_pointer_item_call (current_type, current_feature)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_pointer_plus then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_pointer_plus_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_pointer_to_integer_32 then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_pointer_to_integer_32_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_pointer_out then
						print_builtin_pointer_out_body (a_feature)
					when builtin_pointer_hash_code then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_pointer_hash_code_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_arguments_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_arguments_argument then
						print_builtin_arguments_argument_body (a_feature)
					when builtin_arguments_argument_count then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_arguments_argument_count_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_platform_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_platform_is_dotnet then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_is_dotnet_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_is_unix then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_is_unix_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_is_vms then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_is_vms_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_is_windows then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_is_windows_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_boolean_bytes then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_boolean_bytes_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_character_bytes then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_character_bytes_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_integer_bytes then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_integer_bytes_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_pointer_bytes then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_pointer_bytes_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					when builtin_platform_real_bytes then
						fill_call_formal_arguments (a_feature)
						print_indentation_assign_to_result
						print_builtin_platform_real_bytes_call (current_type)
						print_semicolon_newline
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_function_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_function_item then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_function_item_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				else
					inspect l_builtin_class
					when builtin_integer_class then
						l_integer_type := current_system.integer_type
					when builtin_integer_8_class then
						l_integer_type := current_system.integer_8_type
					when builtin_integer_16_class then
						l_integer_type := current_system.integer_16_type
					when builtin_integer_64_class then
						l_integer_type := current_system.integer_64_type
					when builtin_natural_8_class then
						l_integer_type := current_system.natural_8_type
					when builtin_natural_16_class then
						l_integer_type := current_system.natural_16_type
					when builtin_natural_32_class then
						l_integer_type := current_system.natural_32_type
					when builtin_natural_64_class then
						l_integer_type := current_system.natural_64_type
					when builtin_character_class then
						l_character_type := current_system.character_type
					when builtin_wide_character_class then
						l_character_type := current_system.wide_character_type
					when builtin_real_class then
						l_real_type := current_system.real_type
					when builtin_double_class then
						l_real_type := current_system.double_type
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if l_integer_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_integer_plus then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_plus_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_minus then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_minus_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_times then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_times_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_divide then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_divide_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_div then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_div_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_mod then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_mod_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_power then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_power_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_opposite then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_opposite_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_identity then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_identity_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_lt then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_lt_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_to_character then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_to_character_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_to_real then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_to_real_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_to_real_32 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_to_real_32_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_to_real_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_to_real_64_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_to_double then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_to_double_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_natural_8 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_natural_8_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_natural_16 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_natural_16_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_natural_32 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_natural_32_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_natural_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_natural_64_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_integer_8 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_integer_8_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_integer_16 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_integer_16_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_integer_32 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_integer_32_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_as_integer_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_as_integer_64_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_or then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_or_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_and then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_and_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_shift_left then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_shift_left_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_shift_right then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_shift_right_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_xor then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_xor_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_bit_not then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_bit_not_call (current_type, l_integer_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_integer_item then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_integer_item_call (current_type, l_integer_type, current_feature)
							print_semicolon_newline
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif l_character_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_character_code then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_character_code_call (current_type, l_character_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_character_item then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_character_item_call (current_type, l_character_type, current_feature)
							print_semicolon_newline
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif l_real_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_real_plus then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_plus_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_minus then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_minus_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_times then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_times_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_divide then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_divide_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_power then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_power_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_opposite then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_opposite_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_identity then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_identity_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_lt then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_lt_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_truncated_to_integer then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_truncated_to_integer_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_truncated_to_integer_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_truncated_to_integer_64_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_truncated_to_real then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_truncated_to_real_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_to_double then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_to_double_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_ceiling_real_32 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_ceiling_real_32_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_ceiling_real_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_ceiling_real_64_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_floor_real_32 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_floor_real_32_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_floor_real_64 then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_floor_real_64_call (current_type, l_real_type)
							print_semicolon_newline
							call_operands.wipe_out
						when builtin_real_out then
							print_builtin_real_out_body (a_feature)
						when builtin_real_item then
							fill_call_formal_arguments (a_feature)
							print_indentation_assign_to_result
							print_builtin_sized_real_item_call (current_type, l_real_type, current_feature)
							print_semicolon_newline
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
			else
					-- This is a built-in procedure.
				inspect l_builtin_class
				when builtin_any_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_any_standard_copy then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_any_standard_copy_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_special_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_special_make then
						-- Do nothing: already done in `print_malloc_current'.
					when builtin_special_put then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_special_put_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_boolean_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_boolean_set_item then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_boolean_set_item_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_pointer_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_pointer_set_item then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_pointer_set_item_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				when builtin_procedure_class then
					inspect l_builtin_code \\ builtin_capacity
					when builtin_procedure_call then
						fill_call_formal_arguments (a_feature)
						print_indentation
						print_builtin_procedure_call_call (current_type)
						current_file.put_new_line
						call_operands.wipe_out
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				else
					inspect l_builtin_class
					when builtin_integer_class then
						l_integer_type := current_system.integer_type
					when builtin_integer_8_class then
						l_integer_type := current_system.integer_8_type
					when builtin_integer_16_class then
						l_integer_type := current_system.integer_16_type
					when builtin_integer_64_class then
						l_integer_type := current_system.integer_64_type
					when builtin_natural_8_class then
						l_integer_type := current_system.natural_8_type
					when builtin_natural_16_class then
						l_integer_type := current_system.natural_16_type
					when builtin_natural_32_class then
						l_integer_type := current_system.natural_32_type
					when builtin_natural_64_class then
						l_integer_type := current_system.natural_64_type
					when builtin_character_class then
						l_character_type := current_system.character_type
					when builtin_wide_character_class then
						l_character_type := current_system.wide_character_type
					when builtin_real_class then
						l_real_type := current_system.real_type
					when builtin_double_class then
						l_real_type := current_system.double_type
					else
							-- Internal error: unknown built-in feature.
							-- This error should already have been reported during parsing.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if l_integer_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_integer_set_item then
							fill_call_formal_arguments (a_feature)
							print_indentation
							print_builtin_sized_integer_set_item_call (current_type, l_integer_type, l_builtin_class)
							current_file.put_new_line
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif l_character_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_character_set_item then
							fill_call_formal_arguments (a_feature)
							print_indentation
							print_builtin_sized_character_set_item_call (current_type, l_character_type, l_builtin_class)
							current_file.put_new_line
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif l_real_type /= Void then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_real_set_item then
							fill_call_formal_arguments (a_feature)
							print_indentation
							print_builtin_sized_real_set_item_call (current_type, l_real_type, l_builtin_class)
							current_file.put_new_line
							call_operands.wipe_out
						else
								-- Internal error: unknown built-in feature.
								-- This error should already have been reported during parsing.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
			end
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
										print_argument_name (l_argument_name, current_file)
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
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local_type_set: ET_DYNAMIC_TYPE_SET
			l_once_feature: ET_FEATURE
			i, nb, nb_args: INTEGER
			l_compound: ET_COMPOUND
			l_comma: BOOLEAN
			old_file: KI_TEXT_OUTPUT_STREAM
			l_buffer: STRING
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
					-- Dynamic type sets for arguments are stored first
					-- in `dynamic_type_sets'.
				l_dynamic_type_sets := current_feature.dynamic_type_sets
				if l_dynamic_type_sets.count < nb_args then
						-- Internal error: it has already been checked somewhere else
						-- that there was the same number of actual and formal arguments.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					from i := 1 until i > nb_args loop
						if l_comma then
							header_file.put_character (',')
							current_file.put_character (',')
							header_file.put_character (' ')
							current_file.put_character (' ')
						else
							l_comma := True
						end
						l_dynamic_type := l_dynamic_type_sets.item (i).static_type
						print_type_declaration (l_dynamic_type, header_file)
						print_type_declaration (l_dynamic_type, current_file)
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
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					l_name := l_locals.local_variable (i).name
					l_local_type_set := current_feature.dynamic_type_set (l_name)
					if l_local_type_set = Void then
							-- Internal error: the dynamic type of local variable
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						print_indentation
						print_type_declaration (l_local_type_set.static_type, current_file)
						current_file.put_character (' ')
						print_local_name (l_name, current_file)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('0')
						current_file.put_character (';')
						current_file.put_new_line
					end
					i := i + 1
				end
			end
			current_file := current_function_body_buffer
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
			l_compound := a_feature.compound
			if l_compound /= Void then
				print_compound (l_compound)
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
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
			current_file := old_file
			l_buffer := current_function_header_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			l_buffer := current_function_body_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			free_temp_variables.wipe_out
			used_temp_variables.wipe_out
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
			l_buffer: STRING
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_name: ET_FEATURE_NAME
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
				print_type_declaration (l_result_type_set.static_type, header_file)
				print_type_declaration (l_result_type_set.static_type, current_file)
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
			if l_result_type_set /= Void then
				print_indentation
				print_type_declaration (l_result_type_set.static_type, current_file)
				current_file.put_character (' ')
				print_result_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			end
			current_file := current_function_body_buffer
			l_name := a_feature.name
			l_name.set_seed (a_feature.first_seed)
			wrapper_expression.set_name (l_name)
			print_assignment (wrapper_assignment)
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
			l_buffer := current_function_header_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			l_buffer := current_function_body_buffer.string
			current_file.put_string (l_buffer)
			STRING_.wipe_out (l_buffer)
			free_temp_variables.wipe_out
			used_temp_variables.wipe_out
		end

	wrapper_expression: ET_CALL_EXPRESSION
			-- Wrapper expression

	wrapper_assignment: ET_ASSIGNMENT
			-- Wrapper assignment

feature {NONE} -- Instruction generation

	print_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
-- TODO:
print ("ET_C_GENERATOR.print_assigner_instruction%N")
		end

	print_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			assignment_target := an_instruction.target
			print_operand (an_instruction.source)
			assignment_target := Void
			fill_call_operands (1)
			if call_operands.first /= an_instruction.target then
				print_indentation
				print_writable (an_instruction.target)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
			call_operands.wipe_out
		end

	print_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
			l_source_type_set: ET_DYNAMIC_TYPE_SET
			l_source_type: ET_DYNAMIC_TYPE
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_target_type: ET_DYNAMIC_TYPE
			l_accepted_types: ET_DYNAMIC_TYPE_LIST
			l_denied_types: ET_DYNAMIC_TYPE_LIST
		do
			l_source_type_set := current_feature.dynamic_type_set (an_instruction.source)
			l_target_type_set := current_feature.dynamic_type_set (an_instruction.target)
			if l_source_type_set = Void or l_target_type_set = Void then
					-- Internal error: the dynamic type sets of the source
					-- and the target should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_source_type_set.count
				l_accepted_types := accepted_types
				l_accepted_types.resize (nb)
				l_denied_types := denied_types
				l_denied_types.resize (nb)
				l_target_type := l_target_type_set.static_type
				l_source_type := l_source_type_set.first_type
				if l_source_type /= Void then
					if l_source_type.conforms_to_type (l_target_type, current_system) then
						l_accepted_types.put_last (l_source_type)
					else
						l_denied_types.put_last (l_source_type)
					end
					l_other_types := l_source_type_set.other_types
					if l_other_types /= Void then
						nb := l_other_types.count
						from i := 1 until i > nb loop
							l_source_type := l_other_types.item (i)
							if l_source_type.conforms_to_type (l_target_type, current_system) then
								l_accepted_types.put_last (l_source_type)
							else
								l_denied_types.put_last (l_source_type)
							end
							i := i + 1
						end
					end
				end
				print_operand (an_instruction.source)
				fill_call_operands (1)
				if l_denied_types.is_empty then
						-- Direct assignment.
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.first)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_accepted_types.is_empty then
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_void)
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_denied_types.count < l_accepted_types.count then
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
					current_file.put_character (' ')
					current_file.put_string (c_else)
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (call_operands.first, l_target_type)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_denied_types.count
					from i := 1 until i > nb loop
						l_source_type := l_denied_types.item (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_source_type.id)
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
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_expression (call_operands.first)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				else
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
					current_file.put_character (' ')
					current_file.put_string (c_else)
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_attribute_type_id_access (call_operands.first, l_target_type)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					nb := l_accepted_types.count
					from i := 1 until i > nb loop
						l_source_type := l_accepted_types.item (i)
						print_indentation
						current_file.put_string (c_case)
						current_file.put_character (' ')
						current_file.put_integer (l_source_type.id)
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
					print_expression (call_operands.first)
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
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_new_line
				end
				l_accepted_types.wipe_out
				l_denied_types.wipe_out
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
			i, nb: INTEGER
		do
				-- Look for the dynamic type of the creation type.
			l_target := an_instruction.target
			l_type := an_instruction.type
			if l_type /= Void then
				l_resolved_type := resolved_formal_parameters (l_type)
				if not has_fatal_error then
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
				end
			else
					-- Look for the dynamic type of the target.
				l_dynamic_type_set := current_feature.dynamic_type_set (l_target)
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
						print_expression (call_operands.item (i))
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
			l_value_type_set := current_feature.dynamic_type_set (l_expression)
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
							print_expression (call_operands.item (i))
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

	print_procedure_call (a_target_type: ET_DYNAMIC_TYPE; a_name: ET_CALL_NAME) is
			-- Print call to procedure `a_name' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_seed: INTEGER
			i, nb: INTEGER
			l_printed: BOOLEAN
			l_builtin_code: INTEGER
			l_builtin_class: INTEGER
			l_integer_type: ET_DYNAMIC_TYPE
			l_real_type: ET_DYNAMIC_TYPE
			l_character_type: ET_DYNAMIC_TYPE
		do
			l_seed := a_name.seed
			l_dynamic_feature := a_target_type.seeded_dynamic_procedure (l_seed, current_system)
			if l_dynamic_feature = Void then
					-- Internal error: there should be a procedure with `l_seed'.
					-- It has been computed in ET_FEATURE_CHECKER.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_indentation
				if l_dynamic_feature.is_builtin then
					l_printed := True
					l_builtin_code := l_dynamic_feature.builtin_code
					l_builtin_class := l_builtin_code // builtin_capacity
					inspect l_builtin_class
					when builtin_any_class then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_any_standard_copy then
							print_builtin_any_standard_copy_call (a_target_type)
						else
							l_printed := False
						end
					when builtin_special_class then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_special_put then
							print_builtin_special_put_call (a_target_type)
						else
							l_printed := False
						end
					when builtin_boolean_class then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_boolean_set_item then
							print_builtin_boolean_set_item_call (a_target_type)
						else
							l_printed := False
						end
					when builtin_pointer_class then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_pointer_set_item then
							print_builtin_pointer_set_item_call (a_target_type)
						else
							l_printed := False
						end
					when builtin_procedure_class then
						inspect l_builtin_code \\ builtin_capacity
						when builtin_procedure_call then
							print_builtin_procedure_call_call (a_target_type)
						else
							l_printed := False
						end
					else
						inspect l_builtin_class
						when builtin_integer_class then
							l_integer_type := current_system.integer_type
						when builtin_integer_8_class then
							l_integer_type := current_system.integer_8_type
						when builtin_integer_16_class then
							l_integer_type := current_system.integer_16_type
						when builtin_integer_64_class then
							l_integer_type := current_system.integer_64_type
						when builtin_natural_8_class then
							l_integer_type := current_system.natural_8_type
						when builtin_natural_16_class then
							l_integer_type := current_system.natural_16_type
						when builtin_natural_32_class then
							l_integer_type := current_system.natural_32_type
						when builtin_natural_64_class then
							l_integer_type := current_system.natural_64_type
						when builtin_character_class then
							l_character_type := current_system.character_type
						when builtin_wide_character_class then
							l_character_type := current_system.wide_character_type
						when builtin_real_class then
							l_real_type := current_system.real_type
						when builtin_double_class then
							l_real_type := current_system.double_type
						else
							l_printed := False
						end
						if l_integer_type /= Void then
							inspect l_builtin_code \\ builtin_capacity
							when builtin_integer_set_item then
								print_builtin_sized_integer_set_item_call (a_target_type, l_integer_type, l_builtin_class)
							else
								l_printed := False
							end
						elseif l_character_type /= Void then
							inspect l_builtin_code \\ builtin_capacity
							when builtin_character_set_item then
								print_builtin_sized_character_set_item_call (a_target_type, l_character_type, l_builtin_class)
							else
								l_printed := False
							end
						elseif l_real_type /= Void then
							inspect l_builtin_code \\ builtin_capacity
							when builtin_real_set_item then
								print_builtin_sized_real_set_item_call (a_target_type, l_real_type, l_builtin_class)
							else
								l_printed := False
							end
						end
					end
				end
				if not l_printed then
					if not l_dynamic_feature.is_generated then
						l_dynamic_feature.set_generated (True)
						called_features.force_last (l_dynamic_feature)
					end
					print_routine_name (l_dynamic_feature, a_target_type, current_file)
					current_file.put_character ('(')
					nb := call_operands.count
					if a_target_type.is_expanded then
						print_target_expression (call_operands.first)
					else
						print_expression (call_operands.first)
					end
					from i := 2 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						print_expression (call_operands.item (i))
						i := i + 1
					end
					current_file.put_character (')')
					current_file.put_character (';')
				end
				current_file.put_new_line
			end
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
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_seed: INTEGER
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_switch: BOOLEAN
		do
			l_target := a_call.target
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_target_type_set := current_feature.dynamic_type_set (l_target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if l_target_type_set.is_expanded then
					print_target_operand (l_target)
				else
					print_operand (l_target)
				end
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						print_operand (l_actuals.actual_argument (i))
						i := i + 1
					end
				end
				nb := nb + 1
				fill_call_operands (nb)
				l_seed := l_name.seed
				l_dynamic_type := l_target_type_set.first_type
				l_other_dynamic_types := l_target_type_set.other_types
				if l_dynamic_type = Void then
						-- Call on Void target.
					print_indentation
					current_file.put_string (c_gevoid)
					current_file.put_character ('(')
					if l_target_type_set.is_expanded then
						print_target_expression (call_operands.first)
					else
						print_expression (call_operands.first)
					end
					from i := 2 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						print_expression (call_operands.item (i))
						i := i + 1
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				elseif l_other_dynamic_types = Void then
						-- Static binding.
					print_procedure_call (l_dynamic_type, a_call.name)
				else
						-- Dynamic binding.
					if l_other_dynamic_types.count /= 1 then
						print_indentation
						print_call_name (a_call, l_target_type_set.static_type, current_file)
						current_file.put_character ('(')
						if l_target_type_set.is_expanded then
							print_target_expression (call_operands.first)
						else
							print_expression (call_operands.first)
						end
						from i := 2 until i > nb loop
							current_file.put_character (',')
							current_file.put_character (' ')
							print_expression (call_operands.item (i))
							i := i + 1
						end
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_switch then
						from
							j := 1
							nb2 := l_other_dynamic_types.count
							print_indentation
							current_file.put_string (c_switch)
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_attribute_type_id_access (call_operands.first, l_target_type_set.static_type)
							current_file.put_character (')')
							current_file.put_character (' ')
							current_file.put_character ('{')
							current_file.put_new_line
						until
							l_dynamic_type = Void
						loop
							print_indentation
							current_file.put_string (c_case)
							current_file.put_character (' ')
							current_file.put_integer (l_dynamic_type.id)
							current_file.put_character (':')
							current_file.put_new_line
							indent
							print_procedure_call (l_dynamic_type, a_call.name)
							print_indentation
							current_file.put_string (c_break)
							current_file.put_character (';')
							current_file.put_new_line
							dedent
							if j > nb2 then
								l_dynamic_type := Void
							else
								l_dynamic_type := l_other_dynamic_types.item (j)
								j := j + 1
							end
						end
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					else
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_attribute_type_id_access (call_operands.first, l_target_type_set.static_type)
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_procedure_call (l_dynamic_type, a_call.name)
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_character (' ')
						current_file.put_string (c_else)
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_procedure_call (l_other_dynamic_types.item (1), a_call.name)
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					end
				end
			end
			call_operands.wipe_out
		end

	print_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_retry_instruction%N")
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
		do
			l_type := an_instruction.type
			l_resolved_type := resolved_formal_parameters (l_type)
			if not has_fatal_error then
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
						print_expression (call_operands.item (i))
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
			i, nb: INTEGER
		do
			l_actuals := a_call.arguments
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
			print_procedure_call (current_type, a_call.name)
			call_operands.wipe_out
		end

	print_unqualified_identifier_call_instruction (an_identifier: ET_IDENTIFIER) is
			-- Print unqualified identifier call instruction.
		require
			an_identifier_not_void: an_identifier /= Void
			instruction: an_identifier.is_instruction
		do
			call_operands.wipe_out
			call_operands.force_last (tokens.current_keyword)
			print_procedure_call (current_type, an_identifier)
			call_operands.wipe_out
		end

feature {NONE} -- Expression generation

	print_attribute_access (an_attribute: ET_DYNAMIC_FEATURE; a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print access to `an_attribute' applied to `a_target' of type `a_type'.
		require
			an_attribute_not_void: an_attribute /= Void
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			if a_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				print_type_cast (a_type, current_file)
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_name (an_attribute, a_type, current_file)
		end

	print_attribute_type_id_access (a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print access to 'type_id' pseudo attribute applied to `a_target' of type `a_type'.
		require
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			if a_type.is_expanded then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character ('.')
			else
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (a_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
			end
			print_attribute_type_id_name (a_type, current_file)
		end

	print_attribute_special_count_access (a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print access to 'count' pseudo attribute of class SPECIAL applied to `a_target' of type `a_type'.
		require
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type, current_file)
			current_file.put_character ('(')
			print_expression (a_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			print_attribute_special_count_name (a_type, current_file)
		end

	print_attribute_special_item_access (a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print access to 'item' pseudo attribute of class SPECIAL applied to `a_target' of type `a_type'.
		require
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type, current_file)
			current_file.put_character ('(')
			print_expression (a_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			print_attribute_special_item_name (a_type, current_file)
		end

	print_attribute_tuple_item_access (i: INTEGER; a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print access to `i'-th 'item' pseudo attribute of class TUPLE
			-- applied to `a_target' of type `a_type'.
		require
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type, current_file)
			current_file.put_character ('(')
			print_expression (a_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			print_attribute_tuple_item_name (i, a_type, current_file)
		end

	print_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_bit_constant%N")
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
			l_target_type_set := current_feature.dynamic_type_set (an_expression)
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
						print_creation_expression (l_target_type, l_dynamic_procedure, an_expression.expression)
					end
				else
						-- This is a built-in conversion.
					l_source_type_set := current_feature.dynamic_type_set (an_expression.expression)
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
									print_creation_expression (l_target_type, l_dynamic_procedure, an_expression.expression)
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
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_call: ET_QUALIFIED_CALL
			l_seed: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
		do
			l_type := an_expression.type
			l_resolved_type := resolved_formal_parameters (l_type)
			if not has_fatal_error then
				l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
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
					print_creation_expression (l_dynamic_type, l_dynamic_procedure, l_actuals)
				end
			end
		end

	print_creation_expression (a_type: ET_DYNAMIC_TYPE; a_procedure: ET_DYNAMIC_FEATURE; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print a creation expression.
		require
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
			is_procedure: a_procedure.is_procedure
		local
			i, nb: INTEGER
			l_temp: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
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
				print_expression (call_operands.item (i))
				i := i + 1
			end
			current_file.put_character (')')
			if in_operand then
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
			call_operands.wipe_out
		end

	print_current (an_expression: ET_CURRENT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if in_operand then
				operand_stack.force (an_expression)
			elseif in_target or not current_type.is_expanded then
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
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
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
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type)
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
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type)
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
					l_special_type ?= current_type
					if l_special_type /= Void then
						print_attribute_special_item_access (tokens.current_keyword, l_special_type)
					else
						print_current_name (current_file)
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
					operand_stack.force (l_temp)
					print_indentation
					print_temp_name (l_temp, current_file)
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
			end
			l_left_type_set := current_feature.dynamic_type_set (an_expression.left)
			l_right_type_set := current_feature.dynamic_type_set (an_expression.right)
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
		end

	print_expression (an_expression: ET_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			old_in_operand: BOOLEAN
			old_in_target: BOOLEAN
		do
			old_in_operand := in_operand
			old_in_target := in_target
			in_operand := False
			in_target := False
			an_expression.process (Current)
			in_target := old_in_target
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
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
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
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type)
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
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type)
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
						l_value_type_set := current_feature.dynamic_type_set (l_name_expression)
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
								current_file.put_string (c_getypes)
								current_file.put_character ('[')
								print_attribute_type_id_access (l_name_expression, l_value_type_set.static_type)
								current_file.put_character (']')
								current_file.put_character ('.')
								current_file.put_string (c_is_special)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								print_attribute_special_item_access (l_name_expression, l_special_type)
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
						l_value_type_set := current_feature.dynamic_type_set (l_name_expression)
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
								current_file.put_string (c_getypes)
								current_file.put_character ('[')
								print_attribute_type_id_access (l_name_expression, l_value_type_set.static_type)
								current_file.put_character (']')
								current_file.put_character ('.')
								current_file.put_string (c_is_special)
								current_file.put_character ('?')
								print_type_cast (current_system.pointer_type, current_file)
								print_attribute_special_item_access (l_name_expression, l_special_type)
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
							if l_query.is_attribute then
								l_value_type_set := l_query.result_type_set
								if l_value_type_set = Void then
										-- Internal error: we know that `l_query' is an attribute.
									set_fatal_error
									error_handler.report_giaaa_error
								elseif l_value_type_set.is_expanded then
									print_type_cast (current_system.pointer_type, current_file)
									current_file.put_character ('&')
									current_file.put_character ('(')
									print_attribute_access (l_query, tokens.current_keyword, current_type)
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
										print_attribute_access (l_query, tokens.current_keyword, current_type)
										current_file.put_character (')')
										current_file.put_character ('?')
										print_type_cast (current_system.pointer_type, current_file)
										current_file.put_character ('(')
										current_file.put_string (c_getypes)
										current_file.put_character ('[')
										print_attribute_type_id_access (l_temp, l_value_type_set.static_type)
										current_file.put_character (']')
										current_file.put_character ('.')
										current_file.put_string (c_is_special)
										current_file.put_character ('?')
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_special_item_access (l_temp, l_special_type)
										current_file.put_character (':')
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_access (l_query, tokens.current_keyword, current_type)
										current_file.put_character (')')
										current_file.put_character (':')
										print_type_cast (current_system.pointer_type, current_file)
										current_file.put_character ('0')
										current_file.put_character (')')
										mark_temp_variable_free (l_temp)
									else
										print_type_cast (current_system.pointer_type, current_file)
										print_attribute_access (l_query, tokens.current_keyword, current_type)
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
							l_procedure := current_type.seeded_dynamic_query (l_name.seed, current_system)
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
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := current_feature.dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type_set.static_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_argument_name (a_name, current_file)
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
					current_file.put_string (c_geint8)
				when 6 then
						-- 0[xX][a-fA-F0-9]{4}
					print_type_cast (current_system.integer_16_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_geint16)
				when 10 then
						-- 0[xX][a-fA-F0-9]{8}
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_geint32)
				when 18 then
						-- 0[xX][a-fA-F0-9]{16}
					print_type_cast (current_system.integer_64_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_geint64)
				else
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
					current_file.put_string (c_geint32)
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
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := current_feature.dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- local variables should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type_set.static_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_local_name (a_name, current_file)
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
			i, nb: INTEGER
			l_assignment_target: ET_WRITABLE
			l_int_promoted: BOOLEAN
			l_double_promoted: BOOLEAN
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_item_type: ET_DYNAMIC_TYPE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
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
							l_item_type := l_special_type.item_type_set.static_type
						end
					end
				end
			end
			if l_item_type /= Void then
				nb := an_expression.count
				from i := 1 until i > nb loop
					print_operand (an_expression.expression (i))
					i := i + 1
				end
				fill_call_operands (nb)
				if
					l_item_type = current_system.boolean_type or
					l_item_type = current_system.character_type or
					l_item_type = current_system.integer_8_type or
					l_item_type = current_system.natural_8_type or
					l_item_type = current_system.integer_16_type or
					l_item_type = current_system.natural_16_type
				then
						-- ISO C 99 says that through "..." the types are promoted to
						-- 'int', and that promotion to 'int' leaves the type unchanged
						-- if all values cannot be represented with an 'int' or
						-- 'unsigned int'.
					l_int_promoted := True
				elseif
					l_item_type = current_system.real_type
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
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				current_file.put_string (c_gema)
				current_file.put_integer (l_dynamic_type.id)
				current_file.put_character ('(')
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_integer (nb)
				from i := 1 until i > nb loop
					current_file.put_character (',')
						-- Print one item per line for better readability,
						-- avoidind too long lines for big arrays.
					current_file.put_new_line
					if l_int_promoted then
						current_file.put_character ('(')
						current_file.put_string (c_int)
						current_file.put_character (')')
						current_file.put_character ('(')
						print_expression (call_operands.item (i))
						current_file.put_character (')')
					elseif l_double_promoted then
						current_file.put_character ('(')
						current_file.put_string (c_double)
						current_file.put_character (')')
						current_file.put_character ('(')
						print_expression (call_operands.item (i))
						current_file.put_character (')')
					else
						print_expression (call_operands.item (i))
					end
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
			end
		end

	print_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_temp: ET_IDENTIFIER
			i, nb: INTEGER
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_assignment_target: ET_WRITABLE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
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
				from i := 1 until i > nb loop
					print_operand (an_expression.expression (i))
					i := i + 1
				end
				fill_call_operands (nb)
				manifest_tuple_types.force_last (l_tuple_type)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_temp := new_temp_variable (l_tuple_type)
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				current_file.put_string (c_gemt)
				current_file.put_integer (l_tuple_type.id)
				current_file.put_character ('(')
				from i := 1 until i > nb loop
					if i /= 1 then
						current_file.put_character (',')
					end
					print_expression (call_operands.item (i))
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
			end
		end

	print_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_manifest_type%N")
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
-- TODO.
print ("ET_C_GENERATOR.print_once_manifest_string%N")
				current_file.put_string (c_eif_void)
			end
		end

	print_operand (an_operand: ET_EXPRESSION) is
			-- Print `an_operand'.
		require
			an_operand_not_void: an_operand /= Void
		local
			old_in_operand: BOOLEAN
			old_in_target: BOOLEAN
		do
			old_in_operand := in_operand
			old_in_target := in_target
			in_operand := True
			in_target := False
			an_operand.process (Current)
			in_target := old_in_target
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
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_assignment_target: ET_WRITABLE
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
								l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
								if l_dynamic_type_set = Void then
										-- Internal error: the dynamic type set of `an_expression'
										-- should be known at this stage.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_dynamic_type := l_dynamic_type_set.static_type
									l_temp := new_temp_variable (l_dynamic_type)
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
							print_expression (call_operands.item (i))
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
			l_other_target_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_temp_target: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
			l_semistrict_target: ET_WRITABLE
			l_implies: BOOLEAN
			l_or: BOOLEAN
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_target := a_call.target
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_target_type_set := current_feature.dynamic_type_set (l_target)
			if l_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_target_static_type := l_target_type_set.static_type
				if
					l_target_static_type = current_system.boolean_type and then
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
					if l_target_static_type.is_expanded then
						print_target_operand (l_target)
					else
						print_operand (l_target)
					end
					if l_actuals /= Void then
						nb := l_actuals.count
						from i := 1 until i > nb loop
							print_operand (l_actuals.actual_argument (i))
							i := i + 1
						end
					end
					nb := nb + 1
					fill_call_operands (nb)
					if in_operand then
						if l_assignment_target /= Void then
							operand_stack.force (l_assignment_target)
							print_indentation
							print_writable (l_assignment_target)
						else
							l_dynamic_type_set := current_feature.dynamic_type_set (a_call)
							if l_dynamic_type_set = Void then
									-- Internal error: the dynamic type set of `a_call'
									-- should be known at this stage.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_dynamic_type := l_dynamic_type_set.static_type
								l_temp := new_temp_variable (l_dynamic_type)
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
					l_seed := l_name.seed
					l_target_dynamic_type := l_target_type_set.first_type
					l_other_target_dynamic_types := l_target_type_set.other_types
					if l_target_dynamic_type = Void then
							-- Call on Void target.
						l_dynamic_type_set := current_feature.dynamic_type_set (a_call)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of `a_call'
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type := l_dynamic_type_set.static_type
							current_file.put_character ('(')
							print_type_declaration (l_dynamic_type, current_file)
							current_file.put_character (')')
							current_file.put_string (c_gevoid)
							current_file.put_character ('(')
							if l_target_static_type.is_expanded then
								print_target_expression (call_operands.first)
							else
								print_expression (call_operands.first)
							end
							from i := 2 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (call_operands.item (i))
								i := i + 1
							end
							current_file.put_character (')')
						end
					elseif l_other_target_dynamic_types = Void then
							-- Static binding.
						print_query_call (l_target_dynamic_type, l_name)
					else
							-- Dynamic binding.
						if l_name.is_tuple_label then
							print_query_call (l_target_dynamic_type, l_name)
						else
							l_query := l_target_static_type.base_class.seeded_query (l_seed)
							if l_query = Void then
									-- Internal error: there should be a query with `a_seed'.
									-- It has been computed in ET_FEATURE_CHECKER.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_constant_attribute ?= l_query
								if l_constant_attribute /= Void then
									print_query_call (l_target_dynamic_type, l_name)
								elseif l_other_target_dynamic_types.count /= 1 then
									print_call_name (a_call, l_target_static_type, current_file)
									current_file.put_character ('(')
									if l_target_static_type.is_expanded then
										print_target_expression (call_operands.first)
									else
										print_expression (call_operands.first)
									end
									from i := 2 until i > nb loop
										current_file.put_character (',')
										current_file.put_character (' ')
										print_expression (call_operands.item (i))
										i := i + 1
									end
									current_file.put_character (')')
								else
									from
										j := 1
										nb2 := l_other_target_dynamic_types.count
										current_file.put_character ('(')
									until
										l_target_dynamic_type = Void
									loop
										if j <= nb2 then
											current_file.put_character ('(')
											print_attribute_type_id_access (call_operands.first, l_target_static_type)
											current_file.put_character ('=')
											current_file.put_character ('=')
											current_file.put_integer (l_target_dynamic_type.id)
											current_file.put_character (')')
											current_file.put_character ('?')
										end
										print_query_call (l_target_dynamic_type, l_name)
										if j > nb2 then
											l_target_dynamic_type := Void
										else
											current_file.put_character (':')
											l_target_dynamic_type := l_other_target_dynamic_types.item (j)
											j := j + 1
										end
									end
									current_file.put_character (')')
								end
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
		end

	print_query_call (a_target_type: ET_DYNAMIC_TYPE; a_name: ET_CALL_NAME) is
			-- Print call to query `a_name' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_query: ET_QUERY
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
			l_unique_attribute: ET_UNIQUE_ATTRIBUTE
			l_attribute: ET_ATTRIBUTE
			l_seed: INTEGER
			i, nb: INTEGER
			l_printed: BOOLEAN
			l_builtin_code: INTEGER
			l_builtin_class: INTEGER
			l_integer_type: ET_DYNAMIC_TYPE
			l_real_type: ET_DYNAMIC_TYPE
			l_character_type: ET_DYNAMIC_TYPE
		do
			l_seed := a_name.seed
			if a_name.is_tuple_label then
				print_attribute_tuple_item_access (l_seed, call_operands.first, a_target_type)
			else
				l_query := a_target_type.base_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: there should be a query with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_constant_attribute ?= l_query
					if l_constant_attribute /= Void then
						l_printed := True
						l_string_constant ?= l_constant_attribute.constant
						if l_string_constant /= Void then
							l_once_feature := l_constant_attribute.implementation_feature
							constant_features.force_last (l_string_constant, l_once_feature)
							print_once_value_name (l_once_feature, current_file)
						else
							print_expression (l_constant_attribute.constant)
						end
					else
						l_unique_attribute ?= l_query
						if l_unique_attribute /= Void then
-- TODO: compute the values of the unique features.
							l_printed := True
							print_type_cast (current_system.integer_type, current_file)
							current_file.put_character ('(')
							unique_count := unique_count + 1
							current_file.put_integer (unique_count)
							current_file.put_character (')')
						end
					end
					if not l_printed then
						l_dynamic_feature := a_target_type.dynamic_query (l_query, current_system)
						l_attribute ?= l_query
						if l_attribute /= Void then
							l_printed := True
							print_attribute_access (l_dynamic_feature, call_operands.first, a_target_type)
						elseif l_dynamic_feature.is_builtin then
							l_printed := True
							l_builtin_code := l_dynamic_feature.builtin_code
							l_builtin_class := l_builtin_code // builtin_capacity
							inspect l_builtin_class
							when builtin_any_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_any_same_type then
									print_builtin_any_same_type_call (a_target_type)
								when builtin_any_standard_is_equal then
									print_builtin_any_standard_is_equal_call (a_target_type)
								when builtin_any_generator then
									print_builtin_any_generator_call (a_target_type)
								when builtin_any_generating_type then
									print_builtin_any_generating_type_call (a_target_type)
								else
									l_printed := False
								end
							when builtin_special_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_special_item then
									print_builtin_special_item_call (a_target_type)
								when builtin_special_count then
									print_builtin_special_count_call (a_target_type)
								when builtin_special_element_size then
									print_builtin_special_element_size_call (a_target_type)
								else
									l_printed := False
								end
							when builtin_boolean_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_boolean_and then
									print_builtin_boolean_and_call (a_target_type)
								when builtin_boolean_and_then then
									print_builtin_boolean_and_then_call (a_target_type)
								when builtin_boolean_or then
									print_builtin_boolean_or_call (a_target_type)
								when builtin_boolean_or_else then
									print_builtin_boolean_or_else_call (a_target_type)
								when builtin_boolean_xor then
									print_builtin_boolean_xor_call (a_target_type)
								when builtin_boolean_implies then
									print_builtin_boolean_implies_call (a_target_type)
								when builtin_boolean_not then
									print_builtin_boolean_not_call (a_target_type)
								when builtin_boolean_item then
									print_builtin_boolean_item_call (a_target_type, l_dynamic_feature)
								else
									l_printed := False
								end
							when builtin_pointer_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_pointer_item then
									print_builtin_pointer_item_call (a_target_type, l_dynamic_feature)
								when builtin_pointer_plus then
									print_builtin_pointer_plus_call (a_target_type)
								when builtin_pointer_to_integer_32 then
									print_builtin_pointer_to_integer_32_call (a_target_type)
								when builtin_pointer_hash_code then
									print_builtin_pointer_hash_code_call (a_target_type)
								else
									l_printed := False
								end
							when builtin_arguments_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_arguments_argument_count then
									print_builtin_arguments_argument_count_call (a_target_type)
								else
									l_printed := False
								end
							when builtin_platform_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_platform_is_dotnet then
									print_builtin_platform_is_dotnet_call (a_target_type)
								when builtin_platform_is_unix then
									print_builtin_platform_is_unix_call (a_target_type)
								when builtin_platform_is_vms then
									print_builtin_platform_is_vms_call (a_target_type)
								when builtin_platform_is_windows then
									print_builtin_platform_is_windows_call (a_target_type)
								when builtin_platform_boolean_bytes then
									print_builtin_platform_boolean_bytes_call (a_target_type)
								when builtin_platform_character_bytes then
									print_builtin_platform_character_bytes_call (a_target_type)
								when builtin_platform_integer_bytes then
									print_builtin_platform_integer_bytes_call (a_target_type)
								when builtin_platform_pointer_bytes then
									print_builtin_platform_pointer_bytes_call (a_target_type)
								when builtin_platform_real_bytes then
									print_builtin_platform_real_bytes_call (a_target_type)
								else
									l_printed := False
								end
							when builtin_function_class then
								inspect l_builtin_code \\ builtin_capacity
								when builtin_function_item then
									print_builtin_function_item_call (a_target_type)
								else
									l_printed := False
								end
							else
								inspect l_builtin_class
								when builtin_integer_class then
									l_integer_type := current_system.integer_type
								when builtin_integer_8_class then
									l_integer_type := current_system.integer_8_type
								when builtin_integer_16_class then
									l_integer_type := current_system.integer_16_type
								when builtin_integer_64_class then
									l_integer_type := current_system.integer_64_type
								when builtin_natural_8_class then
									l_integer_type := current_system.natural_8_type
								when builtin_natural_16_class then
									l_integer_type := current_system.natural_16_type
								when builtin_natural_32_class then
									l_integer_type := current_system.natural_32_type
								when builtin_natural_64_class then
									l_integer_type := current_system.natural_64_type
								when builtin_character_class then
									l_character_type := current_system.character_type
								when builtin_wide_character_class then
									l_character_type := current_system.wide_character_type
								when builtin_real_class then
									l_real_type := current_system.real_type
								when builtin_double_class then
									l_real_type := current_system.double_type
								else
									l_printed := False
								end
								if l_integer_type /= Void then
									inspect l_builtin_code \\ builtin_capacity
									when builtin_integer_plus then
										print_builtin_sized_integer_plus_call (a_target_type, l_integer_type)
									when builtin_integer_minus then
										print_builtin_sized_integer_minus_call (a_target_type, l_integer_type)
									when builtin_integer_times then
										print_builtin_sized_integer_times_call (a_target_type, l_integer_type)
									when builtin_integer_divide then
										print_builtin_sized_integer_divide_call (a_target_type, l_integer_type)
									when builtin_integer_div then
										print_builtin_sized_integer_div_call (a_target_type, l_integer_type)
									when builtin_integer_mod then
										print_builtin_sized_integer_mod_call (a_target_type, l_integer_type)
									when builtin_integer_power then
										print_builtin_sized_integer_power_call (a_target_type, l_integer_type)
									when builtin_integer_lt then
										print_builtin_sized_integer_lt_call (a_target_type, l_integer_type)
									when builtin_integer_opposite then
										print_builtin_sized_integer_opposite_call (a_target_type, l_integer_type)
									when builtin_integer_identity then
										print_builtin_sized_integer_identity_call (a_target_type, l_integer_type)
									when builtin_integer_to_character then
										print_builtin_sized_integer_to_character_call (a_target_type, l_integer_type)
									when builtin_integer_to_real then
										print_builtin_sized_integer_to_real_call (a_target_type, l_integer_type)
									when builtin_integer_to_real_32 then
										print_builtin_sized_integer_to_real_32_call (a_target_type, l_integer_type)
									when builtin_integer_to_real_64 then
										print_builtin_sized_integer_to_real_64_call (a_target_type, l_integer_type)
									when builtin_integer_to_double then
										print_builtin_sized_integer_to_double_call (a_target_type, l_integer_type)
									when builtin_integer_as_natural_8 then
										print_builtin_sized_integer_as_natural_8_call (a_target_type, l_integer_type)
									when builtin_integer_as_natural_16 then
										print_builtin_sized_integer_as_natural_16_call (a_target_type, l_integer_type)
									when builtin_integer_as_natural_32 then
										print_builtin_sized_integer_as_natural_32_call (a_target_type, l_integer_type)
									when builtin_integer_as_natural_64 then
										print_builtin_sized_integer_as_natural_64_call (a_target_type, l_integer_type)
									when builtin_integer_as_integer_8 then
										print_builtin_sized_integer_as_integer_8_call (a_target_type, l_integer_type)
									when builtin_integer_as_integer_16 then
										print_builtin_sized_integer_as_integer_16_call (a_target_type, l_integer_type)
									when builtin_integer_as_integer_32 then
										print_builtin_sized_integer_as_integer_32_call (a_target_type, l_integer_type)
									when builtin_integer_as_integer_64 then
										print_builtin_sized_integer_as_integer_64_call (a_target_type, l_integer_type)
									when builtin_integer_bit_or then
										print_builtin_sized_integer_bit_or_call (a_target_type, l_integer_type)
									when builtin_integer_bit_and then
										print_builtin_sized_integer_bit_and_call (a_target_type, l_integer_type)
									when builtin_integer_bit_shift_left then
										print_builtin_sized_integer_bit_shift_left_call (a_target_type, l_integer_type)
									when builtin_integer_bit_shift_right then
										print_builtin_sized_integer_bit_shift_right_call (a_target_type, l_integer_type)
									when builtin_integer_bit_xor then
										print_builtin_sized_integer_bit_xor_call (a_target_type, l_integer_type)
									when builtin_integer_bit_not then
										print_builtin_sized_integer_bit_not_call (a_target_type, l_integer_type)
									when builtin_integer_item then
										print_builtin_sized_integer_item_call (a_target_type, l_integer_type, l_dynamic_feature)
									else
										l_printed := False
									end
								elseif l_character_type /= Void then
									inspect l_builtin_code \\ builtin_capacity
									when builtin_character_code then
										print_builtin_sized_character_code_call (a_target_type, l_character_type)
									when builtin_character_item then
										print_builtin_sized_character_item_call (a_target_type, l_character_type, l_dynamic_feature)
									else
										l_printed := False
									end
								elseif l_real_type /= Void then
									inspect l_builtin_code \\ builtin_capacity
									when builtin_real_plus then
										print_builtin_sized_real_plus_call (a_target_type, l_real_type)
									when builtin_real_minus then
										print_builtin_sized_real_minus_call (a_target_type, l_real_type)
									when builtin_real_times then
										print_builtin_sized_real_times_call (a_target_type, l_real_type)
									when builtin_real_divide then
										print_builtin_sized_real_divide_call (a_target_type, l_real_type)
									when builtin_real_power then
										print_builtin_sized_real_power_call (a_target_type, l_real_type)
									when builtin_real_opposite then
										print_builtin_sized_real_opposite_call (a_target_type, l_real_type)
									when builtin_real_identity then
										print_builtin_sized_real_identity_call (a_target_type, l_real_type)
									when builtin_real_lt then
										print_builtin_sized_real_lt_call (a_target_type, l_real_type)
									when builtin_real_truncated_to_integer then
										print_builtin_sized_real_truncated_to_integer_call (a_target_type, l_real_type)
									when builtin_real_truncated_to_integer_64 then
										print_builtin_sized_real_truncated_to_integer_64_call (a_target_type, l_real_type)
									when builtin_real_truncated_to_real then
										print_builtin_sized_real_truncated_to_real_call (a_target_type, l_real_type)
									when builtin_real_to_double then
										print_builtin_sized_real_to_double_call (a_target_type, l_real_type)
									when builtin_real_ceiling_real_32 then
										print_builtin_sized_real_ceiling_real_32_call (a_target_type, l_real_type)
									when builtin_real_ceiling_real_64 then
										print_builtin_sized_real_ceiling_real_64_call (a_target_type, l_real_type)
									when builtin_real_floor_real_32 then
										print_builtin_sized_real_floor_real_32_call (a_target_type, l_real_type)
									when builtin_real_floor_real_64 then
										print_builtin_sized_real_floor_real_64_call (a_target_type, l_real_type)
									when builtin_integer_item then
										print_builtin_sized_real_item_call (a_target_type, l_real_type, l_dynamic_feature)
									else
										l_printed := False
									end
								end
							end
						end
						if not l_printed then
							if not l_dynamic_feature.is_generated then
								l_dynamic_feature.set_generated (True)
								called_features.force_last (l_dynamic_feature)
							end
							print_routine_name (l_dynamic_feature, a_target_type, current_file)
							current_file.put_character ('(')
							nb := call_operands.count
							if a_target_type.is_expanded then
								print_target_expression (call_operands.first)
							else
								print_expression (call_operands.first)
							end
							from i := 2 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (call_operands.item (i))
								i := i + 1
							end
							current_file.put_character (')')
						end
					end
				end
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
					current_file.put_string (c_geint8)
				elseif l_dynamic_type = current_system.integer_16_type then
					current_file.put_string (c_geint16)
				elseif l_dynamic_type = current_system.integer_32_type then
					current_file.put_string (c_geint32)
				elseif l_dynamic_type = current_system.integer_64_type then
					current_file.put_string (c_geint64)
				elseif l_dynamic_type = current_system.natural_type then
					current_file.put_string (c_genat32)
				elseif l_dynamic_type = current_system.natural_8_type then
					current_file.put_string (c_genat8)
				elseif l_dynamic_type = current_system.natural_16_type then
					current_file.put_string (c_genat16)
				elseif l_dynamic_type = current_system.natural_32_type then
					current_file.put_string (c_genat32)
				elseif l_dynamic_type = current_system.natural_64_type then
					current_file.put_string (c_genat64)
				else
					current_file.put_string (c_geint32)
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
				current_file.put_string (c_gems)
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
					print_type_cast (current_system.double_type, current_file)
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
		do
			if in_operand then
				operand_stack.force (an_expression)
			else
				if in_target then
					l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- 'Result' should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type_set.static_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_result_name (current_file)
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
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
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
					operand_stack.force (l_temp)
					print_indentation
					print_attribute_type_id_access (l_temp, l_dynamic_type)
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
						print_attribute_access (l_queries.first, l_temp, l_dynamic_type)
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
							current_file.put_string (c_getypes)
							current_file.put_character ('[')
							print_attribute_type_id_access (tokens.result_keyword, l_result_type_set.static_type)
							current_file.put_character (']')
							current_file.put_character ('.')
							current_file.put_string (c_is_special)
							current_file.put_character ('?')
							print_type_cast (current_system.pointer_type, current_file)
							print_attribute_special_item_access (an_expression.result_keyword, l_special_type)
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
				current_file.put_string (c_gems)
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
			l_assignment_target: ET_WRITABLE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_type := an_expression.type
			l_resolved_type := resolved_formal_parameters (l_type)
			if not has_fatal_error then
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
						l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of `an_expression'
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type := l_dynamic_type_set.static_type
							l_temp := new_temp_variable (l_dynamic_type)
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
-- TODO.
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
					unique_count := unique_count + 1
					current_file.put_integer (unique_count)
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
						print_expression (call_operands.item (i))
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
			end
		end

	print_target_expression (an_expression: ET_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			old_in_operand: BOOLEAN
			old_in_target: BOOLEAN
		do
			old_in_operand := in_operand
			old_in_target := in_target
			in_operand := False
			in_target := True
			an_expression.process (Current)
			in_target := old_in_target
			in_operand := old_in_operand
		end

	print_target_operand (an_operand: ET_EXPRESSION) is
			-- Print `an_operand'.
		require
			an_operand_not_void: an_operand /= Void
		local
			old_in_operand: BOOLEAN
			old_in_target: BOOLEAN
		do
			old_in_operand := in_operand
			old_in_target := in_target
			in_operand := True
			in_target := True
			an_operand.process (Current)
			in_target := old_in_target
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
			l_dynamic_type: ET_DYNAMIC_TYPE
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_seed := a_name.seed
					l_dynamic_type := free_temp_variables.item (l_seed)
					if l_dynamic_type = Void then
						l_dynamic_type := used_temp_variables.item (l_seed)
					end
					if l_dynamic_type = Void then
							-- Internal error: the type set of temporary
							-- variables should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_temp_name (a_name, current_file)
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
					current_file.put_string (c_geint8)
				elseif l_dynamic_type = current_system.integer_16_type then
					current_file.put_string (c_geint16)
				elseif l_dynamic_type = current_system.integer_32_type then
					current_file.put_string (c_geint32)
				elseif l_dynamic_type = current_system.integer_64_type then
					current_file.put_string (c_geint64)
				elseif l_dynamic_type = current_system.natural_type then
					current_file.put_string (c_genat32)
				elseif l_dynamic_type = current_system.natural_8_type then
					current_file.put_string (c_genat8)
				elseif l_dynamic_type = current_system.natural_16_type then
					current_file.put_string (c_genat16)
				elseif l_dynamic_type = current_system.natural_32_type then
					current_file.put_string (c_genat32)
				elseif l_dynamic_type = current_system.natural_64_type then
					current_file.put_string (c_genat64)
				else
					current_file.put_string (c_geint32)
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
					print_type_cast (current_system.double_type, current_file)
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
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
			l_query: ET_QUERY
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_query := current_type.base_class.seeded_query (a_call.name.seed)
			if l_query = Void then
					-- Internal error: there should be a query for that seed.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_query.is_attribute then
				if in_operand then
					operand_stack.force (a_call)
				else
					l_dynamic_feature := current_type.dynamic_query (l_query, current_system)
					if in_target and l_dynamic_feature.result_type_set.is_expanded then
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type)
						current_file.put_character (')')
					else
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type)
					end
				end
			elseif l_query.is_constant_attribute then
				if in_operand then
					if in_target then
						l_dynamic_feature := current_type.dynamic_query (l_query, current_system)
						l_dynamic_type := l_dynamic_feature.result_type_set.static_type
						if l_dynamic_type.is_expanded then
							in_operand := False
							l_temp := new_temp_variable (l_dynamic_type)
							print_indentation
							print_temp_name (l_temp, current_file)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							print_unqualified_call_expression (a_call)
							current_file.put_character (';')
							current_file.put_new_line
							operand_stack.force (l_temp)
							in_operand := True
						else
							operand_stack.force (a_call)
						end
					else
						operand_stack.force (a_call)
					end
				else
					l_constant_attribute ?= l_query
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
				operand_stack.force (tokens.current_keyword)
				l_actuals := a_call.arguments
				if l_actuals /= Void then
					nb := l_actuals.count
					from i := 1 until i > nb loop
						print_operand (l_actuals.actual_argument (i))
						i := i + 1
					end
				end
				nb := nb + 1
				fill_call_operands (nb)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_dynamic_type_set := current_feature.dynamic_type_set (a_call)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of `a_call'
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type := l_dynamic_type_set.static_type
							l_temp := new_temp_variable (l_dynamic_type)
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_query_call (current_type, a_call.name)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					print_query_call (current_type, a_call.name)
				end
				call_operands.wipe_out
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
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_temp: ET_IDENTIFIER
			l_assignment_target: ET_WRITABLE
			l_query: ET_QUERY
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_string_constant: ET_MANIFEST_STRING
			l_once_feature: ET_FEATURE
		do
			l_assignment_target := assignment_target
			assignment_target := Void
			l_query := current_type.base_class.seeded_query (an_identifier.seed)
			if l_query = Void then
					-- Internal error: there should be a query for that seed.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_query.is_attribute then
				if in_operand then
					operand_stack.force (an_identifier)
				else
					l_dynamic_feature := current_type.dynamic_query (l_query, current_system)
					if in_target and l_dynamic_feature.result_type_set.is_expanded then
						current_file.put_character ('&')
						current_file.put_character ('(')
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type)
						current_file.put_character (')')
					else
						print_attribute_access (l_dynamic_feature, tokens.current_keyword, current_type)
					end
				end
			elseif l_query.is_constant_attribute then
				if in_operand then
					if in_target then
						l_dynamic_feature := current_type.dynamic_query (l_query, current_system)
						l_dynamic_type := l_dynamic_feature.result_type_set.static_type
						if l_dynamic_type.is_expanded then
							in_operand := False
							l_temp := new_temp_variable (l_dynamic_type)
							print_indentation
							print_temp_name (l_temp, current_file)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							print_unqualified_identifier_call_expression (an_identifier)
							current_file.put_character (';')
							current_file.put_new_line
							operand_stack.force (l_temp)
							in_operand := True
						else
							operand_stack.force (an_identifier)
						end
					else
						operand_stack.force (an_identifier)
					end
				else
					l_constant_attribute ?= l_query
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
						l_dynamic_type_set := current_feature.dynamic_type_set (an_identifier)
						if l_dynamic_type_set = Void then
								-- Internal error: the dynamic type set of `an_identifier'
								-- should be known at this stage.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type := l_dynamic_type_set.static_type
							l_temp := new_temp_variable (l_dynamic_type)
							operand_stack.force (l_temp)
							print_indentation
							print_temp_name (l_temp, current_file)
						end
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_query_call (current_type, an_identifier)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				else
					print_query_call (current_type, an_identifier)
				end
				call_operands.wipe_out
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
				current_file.put_string (c_gems)
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
			old_in_target: BOOLEAN
		do
			old_in_operand := in_operand
			old_in_target := in_target
			in_operand := False
			in_target := False
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
						print_attribute_access (l_query, tokens.current_keyword, current_type)
					end
				end
			else
				a_writable.process (Current)
			end
			in_target := old_in_target
			in_operand := old_in_operand
		end

feature {NONE} -- Agent generation

	print_call_agent (an_expression: ET_CALL_AGENT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_temp: ET_IDENTIFIER
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
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_agent_type := l_dynamic_type_set.static_type
				if not an_expression.is_qualified_call then
					print_operand (tokens.current_keyword)
					nb_operands := 1
				else
					l_closed_operand ?= an_expression.target
					if l_closed_operand /= Void then
						print_operand (l_closed_operand)
						nb_operands := 1
					end
				end
				l_arguments := an_expression.arguments
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
				call_agents.force_last (an_expression)
				if in_operand then
					if l_assignment_target /= Void then
						operand_stack.force (l_assignment_target)
						print_indentation
						print_writable (l_assignment_target)
					else
						l_temp := new_temp_variable (l_agent_type)
						operand_stack.force (l_temp)
						print_indentation
						print_temp_name (l_temp, current_file)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
				end
				print_agent_creation_name (call_agents.count, current_feature, current_type, current_file)
				current_file.put_character ('(')
				from i := 1 until i > nb_operands loop
					if i /= 1 then
						current_file.put_character (',')
					end
					print_expression (call_operands.item (i))
					i := i + 1
				end
				current_file.put_character (')')
				if in_operand then
					current_file.put_character (';')
					current_file.put_new_line
				end
				call_operands.wipe_out
			end
		end

	print_agent_open_operand (a_name: ET_IDENTIFIER) is
			-- Print agent open operand `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_open_operand: a_name.is_agent_open_operand
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := current_feature.dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type_set.static_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_agent_open_operand_name (a_name, current_file)
			end
		end

	print_agent_closed_operand (a_name: ET_IDENTIFIER) is
			-- Print agent closed operand `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_closed_operand: a_name.is_agent_closed_operand
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
		do
			if in_operand then
				operand_stack.force (a_name)
			else
				if in_target then
					l_dynamic_type_set := current_feature.dynamic_type_set (a_name)
					if l_dynamic_type_set = Void then
							-- Internal error: the dynamic type set of
							-- formal arguments should be known at this stage.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_dynamic_type_set.static_type.is_expanded then
						current_file.put_character ('&')
					end
				end
				print_agent_closed_operand_access (a_name, tokens.current_keyword)
			end
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
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				print_agent_closed_operand_name (a_name, current_file)
			end
		end

	print_call_agent_declaration (i: INTEGER; an_expression: ET_CALL_AGENT) is
			-- Print declaration of `i'-th call agent `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_target_type: ET_DYNAMIC_TYPE
			nb_closed_operands: INTEGER
			nb_open_operands: INTEGER
			l_open_operand: ET_IDENTIFIER
			l_closed_operand: ET_IDENTIFIER
			l_target: ET_AGENT_TARGET
			l_arguments: ET_AGENT_ARGUMENT_OPERANDS
			l_argument: ET_AGENT_ARGUMENT_OPERAND
			l_name: ET_FEATURE_NAME
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			j, nb: INTEGER
			l_agent_type: ET_DYNAMIC_TYPE
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_query_type: ET_DYNAMIC_TYPE
			l_actual_parameters: ET_ACTUAL_PARAMETER_LIST
			l_index: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_open_index: INTEGER
			l_closed_index: INTEGER
			old_file: KI_TEXT_OUTPUT_STREAM
			l_buffer: STRING
		do
				--
				-- Determine agent type.
				--
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_agent_type := l_dynamic_type_set.static_type
			end
				--
				-- Determine target type.
				--
			l_target := an_expression.target
			l_dynamic_type_set := current_feature.dynamic_type_set (l_target)
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
				l_name := an_expression.name
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
				l_arguments := an_expression.arguments
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
				header_file.put_string (current_type.base_type.to_text)
				header_file.put_character ('.')
				header_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.name.lower_name, "*/", "star/"))
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
				nb := l_queries.count
				from j := 1 until j > nb loop
					l_query := l_queries.item (j)
					if l_query.is_attribute then
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
					end
					j := j + 1
				end
					-- Function pointer.
				header_file.put_character ('%T')
				if an_expression.is_procedure then
					header_file.put_string (c_void)
				else
					if l_name.is_tuple_label then
						l_index := l_name.seed
						l_actual_parameters := l_target_type.base_type.actual_parameters
						if l_actual_parameters /= Void and then (l_index >= 1 and l_index <= l_actual_parameters.count) then
							l_query_type := current_system.dynamic_type (l_actual_parameters.type (l_index), universe.any_type)
						else
								-- Internal error: this is an invalid labeled tuple.
								-- This has been checked by ET_FEATURE_CHECKER.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						l_query := l_target_type.seeded_dynamic_query (l_name.seed, current_system)
						if l_query = Void then
								-- Internal error: there should be a query with that seed.
								-- This has been checked by ET_FEATURE_CHECKER.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_dynamic_type_set := l_query.result_type_set
							if l_dynamic_type_set = Void then
									-- Internal error: a query should have a result type.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_query_type := l_dynamic_type_set.static_type
							end
						end
					end
					if l_query_type /= Void then
						print_type_declaration (l_query_type, header_file)
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
					l_dynamic_type_set := current_feature.dynamic_type_set (agent_open_operands.item (j))
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
					l_dynamic_type_set := current_feature.dynamic_type_set (l_closed_operand)
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
				current_file.put_string (current_type.base_type.to_text)
				current_file.put_character ('.')
				current_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.name.lower_name, "*/", "star/"))
				current_file.put_character (' ')
				current_file.put_character ('*')
				current_file.put_character ('/')
				current_file.put_new_line
				if l_query_type /= Void then
					print_type_declaration (l_query_type, current_file)
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
					l_dynamic_type_set := current_feature.dynamic_type_set (l_open_operand)
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
				if l_query_type /= Void then
					print_indentation
					print_type_declaration (l_query_type, current_file)
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('0')
					current_file.put_character (';')
					current_file.put_new_line
					current_file := current_function_body_buffer
					if l_target.is_open_operand then
						l_open_index := 1
						agent_expression.set_target (agent_open_operands.item (l_open_index))
					else
						l_closed_index := 1
						agent_expression.set_target (agent_closed_operands.item (l_closed_index))
					end
					agent_expression.set_name (l_name)
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
						agent_expression.set_arguments (agent_arguments)
					else
						agent_expression.set_arguments (Void)
					end
					print_assignment (agent_assignment)
					print_indentation
					current_file.put_string (c_return)
					current_file.put_character (' ')
					print_result_name (current_file)
					current_file.put_character (';')
					current_file.put_new_line
				else
					current_file := current_function_body_buffer
					if l_target.is_open_operand then
						l_open_index := 1
						agent_instruction.set_target (agent_open_operands.item (l_open_index))
					else
						l_closed_index := 1
						agent_instruction.set_target (agent_closed_operands.item (l_closed_index))
					end
					agent_instruction.set_name (l_name)
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
						agent_instruction.set_arguments (agent_arguments)
					else
						agent_instruction.set_arguments (Void)
					end
					print_qualified_call_instruction (agent_instruction)
				end
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
				current_file := old_file
				l_buffer := current_function_header_buffer.string
				current_file.put_string (l_buffer)
				STRING_.wipe_out (l_buffer)
				l_buffer := current_function_body_buffer.string
				current_file.put_string (l_buffer)
				STRING_.wipe_out (l_buffer)
				free_temp_variables.wipe_out
				used_temp_variables.wipe_out
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
				header_file.put_string (current_type.base_type.to_text)
				header_file.put_character ('.')
				header_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.name.lower_name, "*/", "star/"))
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
				current_file.put_string (current_type.base_type.to_text)
				current_file.put_character ('.')
				current_file.put_string (STRING_.replaced_all_substrings (current_feature.static_feature.name.lower_name, "*/", "star/"))
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
					l_dynamic_type_set := current_feature.dynamic_type_set (agent_closed_operands.item (j))
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (tokens.result_keyword, l_agent_type)
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
			end
		end

	agent_instruction: ET_CALL_INSTRUCTION
			-- Agent instruction

	agent_expression: ET_CALL_EXPRESSION
			-- Agent expression

	agent_arguments: ET_ACTUAL_ARGUMENT_LIST
			-- Agent arguments

	agent_assignment: ET_ASSIGNMENT
			-- Agent assignment

	agent_open_operands: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Agent open operands

	agent_closed_operands: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Agent closed operands

feature {NONE} -- Polymorphic call generation

	print_polymorphic_query_calls is
			-- Print polymorphic query calls.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_call, l_other_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_query: ET_QUERY
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument_type: ET_DYNAMIC_TYPE
			l_base_type: ET_BASE_TYPE
			l_result_type: ET_DYNAMIC_TYPE
			l_static_call: ET_CALL_COMPONENT
			l_switch: BOOLEAN
			l_name: ET_IDENTIFIER
			l_temp: ET_IDENTIFIER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				l_base_type := l_type.base_type
				from
					l_call := l_type.query_calls
				until
					l_call = Void
				loop
					if l_call.target_type_set.count > 2 then
						l_static_call := l_call.static_call
						l_seed := l_static_call.name.seed
						if not polymorphic_seeds.has (l_seed) then
							polymorphic_seeds.force_last (l_seed)
							from
								l_other_call := l_call
							until
								l_other_call = Void
							loop
								if l_other_call.static_call.name.seed = l_seed then
									l_target_type_set := l_other_call.target_type_set
									if l_target_type_set.count > 2 then
										l_dynamic_type := l_target_type_set.first_type
										l_other_dynamic_types := l_target_type_set.other_types
										if not polymorphic_types.has (l_dynamic_type.id) then
											if not l_switch then
												polymorphic_type_ids.force_last (l_dynamic_type.id)
											end
											polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
										end
										nb2 := l_other_dynamic_types.count
										from j := 1 until j > nb2 loop
											l_dynamic_type := l_other_dynamic_types.item (j)
											if not polymorphic_types.has (l_dynamic_type.id) then
												if not l_switch then
													polymorphic_type_ids.force_last (l_dynamic_type.id)
												end
												polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
											end
											j := j + 1
										end
									end
								end
								l_other_call := l_other_call.next
							end
							if not polymorphic_types.is_empty then
								l_dynamic_type := polymorphic_types.first
								l_query := l_dynamic_type.base_class.seeded_query (l_seed)
								if l_query = Void then
										-- Internal error: there should be a query with `a_seed'.
										-- It has been computed in ET_FEATURE_FLATTENER.
									set_fatal_error
									error_handler.report_giaaa_error
								else
										-- Print feature signature.
									print_call_name_comment (l_static_call, l_type, header_file)
									print_call_name_comment (l_static_call, l_type, current_file)
									header_file.put_string (c_extern)
									header_file.put_character (' ')
									l_result_type := current_system.dynamic_type (l_query.type, l_base_type)
									print_type_declaration (l_result_type, header_file)
									print_type_declaration (l_result_type, current_file)
									header_file.put_character (' ')
									current_file.put_character (' ')
									print_call_name (l_static_call, l_type, header_file)
									print_call_name (l_static_call, l_type, current_file)
									header_file.put_character ('(')
									current_file.put_character ('(')
									print_type_declaration (l_type, header_file)
									print_type_declaration (l_type, current_file)
									header_file.put_character (' ')
									current_file.put_character (' ')
									print_current_name (header_file)
									print_current_name (current_file)
									fill_call_formal_arguments (l_query)
									l_arguments := l_query.arguments
									if l_arguments /= Void then
										nb2 := l_arguments.count
										if nb2 > 0 then
											from j := 1 until j > nb2 loop
												header_file.put_character (',')
												current_file.put_character (',')
												header_file.put_character (' ')
												current_file.put_character (' ')
												l_argument_type := current_system.dynamic_type (l_arguments.item (j).type, l_base_type)
												print_type_declaration (l_argument_type, header_file)
												print_type_declaration (l_argument_type, current_file)
												header_file.put_character (' ')
												current_file.put_character (' ')
												l_name := l_arguments.formal_argument (j).name
												print_argument_name (l_name, header_file)
												print_argument_name (l_name, current_file)
												j := j + 1
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
										print_attribute_type_id_access (tokens.current_keyword, l_type)
										current_file.put_character (')')
										current_file.put_character (' ')
										current_file.put_character ('{')
										current_file.put_new_line
										from polymorphic_types.start until polymorphic_types.after loop
											l_dynamic_type := polymorphic_types.item_for_iteration
											print_indentation
											current_file.put_string (c_case)
											current_file.put_character (' ')
											current_file.put_integer (l_dynamic_type.id)
											current_file.put_character (':')
											current_file.put_new_line
											indent
											print_indentation
											current_file.put_string (c_return)
											current_file.put_character (' ')
											current_file.put_character ('(')
											print_query_call (l_dynamic_type, l_static_call.name)
											current_file.put_character (')')
											current_file.put_character (';')
											current_file.put_new_line
											dedent
											polymorphic_types.forth
										end
										print_indentation
										current_file.put_character ('}')
										current_file.put_new_line
									else
										polymorphic_type_ids.sort (polymorphic_type_id_sorter)
										print_indentation
										current_file.put_string (c_int)
										current_file.put_character (' ')
										l_temp := temp_variable
										print_temp_name (l_temp, current_file)
										current_file.put_character (' ')
										current_file.put_character ('=')
										current_file.put_character (' ')
										print_attribute_type_id_access (tokens.current_keyword, l_type)
										current_file.put_character (';')
										current_file.put_new_line
											-- Use binary search.
										print_binary_search_polymorphic_calls (l_static_call, l_result_type, 1, polymorphic_type_ids.count)
									end
									print_indentation
									current_file.put_string (c_return)
									current_file.put_character (' ')
									current_file.put_character ('0')
									current_file.put_character (';')
									current_file.put_new_line
									dedent
									current_file.put_character ('}')
									current_file.put_new_line
									current_file.put_new_line
									call_operands.wipe_out
								end
							end
							polymorphic_type_ids.wipe_out
							polymorphic_types.wipe_out
						end
					end
					l_call := l_call.next
				end
				polymorphic_seeds.wipe_out
				i := i + 1
			end
		end

	print_polymorphic_procedure_calls is
			-- Print polymorphic procedure calls.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_call, l_other_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_seed: INTEGER
			i, nb: INTEGER
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_procedure: ET_PROCEDURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument_type: ET_DYNAMIC_TYPE
			l_base_type: ET_BASE_TYPE
			l_switch: BOOLEAN
			l_static_call: ET_CALL_COMPONENT
			l_name: ET_IDENTIFIER
			l_temp: ET_IDENTIFIER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				l_base_type := l_type.base_type
				from
					l_call := l_type.procedure_calls
				until
					l_call = Void
				loop
					if l_call.target_type_set.count > 2 then
						l_static_call := l_call.static_call
						l_seed := l_static_call.name.seed
						if not polymorphic_seeds.has (l_seed) then
							polymorphic_seeds.force_last (l_seed)
							from
								l_other_call := l_call
							until
								l_other_call = Void
							loop
								if l_other_call.static_call.name.seed = l_seed then
									l_target_type_set := l_other_call.target_type_set
									if l_target_type_set.count > 2 then
										l_dynamic_type := l_target_type_set.first_type
										l_other_dynamic_types := l_target_type_set.other_types
										if not polymorphic_types.has (l_dynamic_type.id) then
											if not l_switch then
												polymorphic_type_ids.force_last (l_dynamic_type.id)
											end
											polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
										end
										nb2 := l_other_dynamic_types.count
										from j := 1 until j > nb2 loop
											l_dynamic_type := l_other_dynamic_types.item (j)
											if not polymorphic_types.has (l_dynamic_type.id) then
												if not l_switch then
													polymorphic_type_ids.force_last (l_dynamic_type.id)
												end
												polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
											end
											j := j + 1
										end
									end
								end
								l_other_call := l_other_call.next
							end
							if not polymorphic_types.is_empty then
								l_dynamic_type := polymorphic_types.first
								l_procedure := l_dynamic_type.base_class.seeded_procedure (l_seed)
								if l_procedure = Void then
										-- Internal error: there should be a procedure with `a_seed'.
										-- It has been computed in ET_FEATURE_FLATTENER.
									set_fatal_error
									error_handler.report_giaaa_error
								else
										-- Print feature signature.
									print_call_name_comment (l_static_call, l_type, header_file)
									print_call_name_comment (l_static_call, l_type, current_file)
									header_file.put_string (c_extern)
									header_file.put_character (' ')
									header_file.put_string (c_void)
									current_file.put_string (c_void)
									header_file.put_character (' ')
									current_file.put_character (' ')
									print_call_name (l_static_call, l_type, header_file)
									print_call_name (l_static_call, l_type, current_file)
									header_file.put_character ('(')
									current_file.put_character ('(')
									print_type_declaration (l_type, header_file)
									print_type_declaration (l_type, current_file)
									header_file.put_character (' ')
									current_file.put_character (' ')
									print_current_name (header_file)
									print_current_name (current_file)
									fill_call_formal_arguments (l_procedure)
									l_arguments := l_procedure.arguments
									if l_arguments /= Void then
										nb2 := l_arguments.count
										if nb2 > 0 then
											from j := 1 until j > nb2 loop
												header_file.put_character (',')
												current_file.put_character (',')
												header_file.put_character (' ')
												current_file.put_character (' ')
												l_argument_type := current_system.dynamic_type (l_arguments.item (j).type, l_base_type)
												print_type_declaration (l_argument_type, header_file)
												print_type_declaration (l_argument_type, current_file)
												header_file.put_character (' ')
												current_file.put_character (' ')
												l_name := l_arguments.formal_argument (j).name
												print_argument_name (l_name, header_file)
												print_argument_name (l_name, current_file)
												j := j + 1
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
										print_indentation
										current_file.put_string (c_switch)
										current_file.put_character (' ')
										current_file.put_character ('(')
										print_attribute_type_id_access (tokens.current_keyword, l_type)
										current_file.put_character (')')
										current_file.put_character (' ')
										current_file.put_character ('{')
										current_file.put_new_line
										from polymorphic_types.start until polymorphic_types.after loop
											l_dynamic_type := polymorphic_types.item_for_iteration
											print_indentation
											current_file.put_string (c_case)
											current_file.put_character (' ')
											current_file.put_integer (l_dynamic_type.id)
											current_file.put_character (':')
											current_file.put_new_line
											indent
											print_indentation
											print_procedure_call (l_dynamic_type, l_static_call.name)
											current_file.put_new_line
											print_indentation
											current_file.put_string (c_break)
											current_file.put_character (';')
											current_file.put_new_line
											dedent
											polymorphic_types.forth
										end
										print_indentation
										current_file.put_character ('}')
										current_file.put_new_line
									else
										polymorphic_type_ids.sort (polymorphic_type_id_sorter)
										print_indentation
										current_file.put_string (c_int)
										current_file.put_character (' ')
										l_temp := temp_variable
										print_temp_name (l_temp, current_file)
										current_file.put_character (' ')
										current_file.put_character ('=')
										current_file.put_character (' ')
										print_attribute_type_id_access (tokens.current_keyword, l_type)
										current_file.put_character (';')
										current_file.put_new_line
											-- Use binary search.
										print_binary_search_polymorphic_calls (l_static_call, Void, 1, polymorphic_type_ids.count)
									end
									dedent
									current_file.put_character ('}')
									current_file.put_new_line
									current_file.put_new_line
									call_operands.wipe_out
								end
							end
							polymorphic_type_ids.wipe_out
							polymorphic_types.wipe_out
						end
					end
					l_call := l_call.next
				end
				polymorphic_seeds.wipe_out
				i := i + 1
			end
		end

	print_binary_search_polymorphic_calls (a_call: ET_CALL_COMPONENT;
		a_result_type: ET_DYNAMIC_TYPE; l, u: INTEGER) is
			-- Print code for actions indexed from `l' to `u'
			-- to `a_file'. The generated code uses binary search
			-- to find out which action to execute.
		require
			a_call_not_void: a_call /= Void
			l_large_enough: l >= 1
			l_small_enough: l <= u
			u_small_enough: u <= polymorphic_type_ids.count
		local
			t: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_type_id: INTEGER
			l_temp: ET_IDENTIFIER
		do
			l_temp := temp_variable
			if l = u then
				l_type_id := polymorphic_type_ids.item (l)
				l_dynamic_type := polymorphic_types.item (l_type_id)
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_query_call (l_dynamic_type, a_call.name)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_call.name)
				end
				current_file.put_new_line
			elseif l + 1 = u then
				l_type_id := polymorphic_type_ids.item (l)
				l_dynamic_type := polymorphic_types.item (l_type_id)
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
					print_query_call (l_dynamic_type, a_call.name)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_call.name)
				end
				current_file.put_new_line
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_type_id := polymorphic_type_ids.item (u)
				l_dynamic_type := polymorphic_types.item (l_type_id)
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_query_call (l_dynamic_type, a_call.name)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_call.name)
				end
				current_file.put_new_line
				current_file.put_character ('}')
				current_file.put_new_line
			else
				t := l + (u - l) // 2
				l_type_id := polymorphic_type_ids.item (t)
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
				print_binary_search_polymorphic_calls (a_call, a_result_type, l, t)
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_binary_search_polymorphic_calls (a_call, a_result_type, t + 1, u)
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	polymorphic_seeds: DS_HASH_SET [INTEGER]
			-- Seeds of calls already visited when traversing
			-- qualified calls for a given target static type

	polymorphic_type_ids: DS_ARRAYED_LIST [INTEGER]
			-- List of target type ids of current polymorphic call

	polymorphic_types: DS_HASH_TABLE [ET_DYNAMIC_TYPE, INTEGER]
			-- Target type current polymorphic call indexed by type ids.

	polymorphic_type_id_sorter: DS_QUICK_SORTER [INTEGER] is
			-- Type id sorter
		local
			l_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
		once
			create l_comparator.make
			create Result.make (l_comparator)
		ensure
			sorter_not_void: Result /= Void
		end

feature {NONE} -- Built-in feature generation

	print_builtin_any_twin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.twin' to `current_file'.
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
				current_file.put_string (c_gealloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type)
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
				print_attribute_special_item_access (tokens.result_keyword, l_special_type)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type)
				current_file.put_character (',')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			elseif
				current_type = current_system.character_type or
				current_type = current_system.boolean_type or
				current_type = current_system.integer_8_type or
				current_type = current_system.integer_16_type or
				current_type = current_system.integer_type or
				current_type = current_system.integer_64_type or
				current_type = current_system.natural_8_type or
				current_type = current_system.natural_16_type or
				current_type = current_system.natural_32_type or
				current_type = current_system.natural_64_type or
				current_type = current_system.real_type or
				current_type = current_system.double_type or
				current_type = current_system.pointer_type
			then
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (tokens.result_keyword, current_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (current_type.id)
				current_file.put_character (';')
				current_file.put_new_line
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

	print_builtin_any_standard_twin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.standard_twin' to `current_file'.
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
				current_file.put_string (c_gealloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type)
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
				print_attribute_special_item_access (tokens.result_keyword, l_special_type)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type)
				current_file.put_character (',')
				print_attribute_special_count_access (tokens.current_keyword, l_special_type)
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			elseif
				current_type = current_system.character_type or
				current_type = current_system.boolean_type or
				current_type = current_system.integer_8_type or
				current_type = current_system.integer_16_type or
				current_type = current_system.integer_type or
				current_type = current_system.integer_64_type or
				current_type = current_system.natural_8_type or
				current_type = current_system.natural_16_type or
				current_type = current_system.natural_32_type or
				current_type = current_system.natural_64_type or
				current_type = current_system.real_type or
				current_type = current_system.double_type or
				current_type = current_system.pointer_type
			then
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
				current_file.put_string (c_gealloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type, current_file)
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
				if current_type.is_expanded then
					current_file.put_character ('*')
					print_current_name (current_file)
				else
					current_file.put_character ('*')
					print_type_cast (current_type, current_file)
					current_file.put_character ('(')
					print_current_name (current_file)
					current_file.put_character (')')
				end
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_tagged_out_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.tagged_out' to `current_file'.
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
			l_string := current_type.base_type.to_text
			current_file.put_string (c_gems)
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
			elseif current_type = current_system.character_type then
			elseif current_type = current_system.boolean_type then
			elseif current_type = current_system.integer_8_type then
			elseif current_type = current_system.integer_16_type then
			elseif current_type = current_system.integer_type then
			elseif current_type = current_system.integer_64_type then
			elseif current_type = current_system.natural_8_type then
			elseif current_type = current_system.natural_16_type then
			elseif current_type = current_system.natural_32_type then
			elseif current_type = current_system.natural_64_type then
			elseif current_type = current_system.real_type then
			elseif current_type = current_system.double_type then
			elseif current_type = current_system.pointer_type then
			else
			end
		end

	print_builtin_any_is_deep_equal_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.is_deep_equal' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
-- TODO
print ("ET_C_GENERATOR.print_builtin_any_is_deep_equal_body%N")
		end

	print_builtin_any_deep_twin_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.deep_twin' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
-- TODO
print ("ET_C_GENERATOR.print_builtin_any_deep_twin_body%N")
		end

	print_builtin_any_same_type_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ANY.same_type' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif
				a_target_type = current_system.character_type or
				a_target_type = current_system.boolean_type or
				a_target_type = current_system.integer_8_type or
				a_target_type = current_system.integer_16_type or
				a_target_type = current_system.integer_type or
				a_target_type = current_system.integer_64_type or
				a_target_type = current_system.natural_8_type or
				a_target_type = current_system.natural_16_type or
				a_target_type = current_system.natural_32_type or
				a_target_type = current_system.natural_64_type or
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
				current_file.put_string (c_eif_false)
			elseif a_target_type.is_expanded then
				current_file.put_string (c_eif_false)
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				print_attribute_type_id_access (call_operands.first, a_target_type)
				current_file.put_character ('=')
				current_file.put_character ('=')
				print_attribute_type_id_access (call_operands.item (2), current_system.any_type)
				current_file.put_character (')')
			end
		end

	print_builtin_any_conforms_to_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.conforms_to' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_found: BOOLEAN
		do
			l_arguments := a_feature.arguments
			if l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parse.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				current_file.put_string (c_switch)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_attribute_type_id_access (l_arguments.formal_argument (1).name, current_system.any_type)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				l_types := current_system.dynamic_types
				nb := l_types.count
				from i := 1 until i > nb loop
					l_type := l_types.item (i)
					if l_type.is_alive then
						if current_type.conforms_to_type (l_type, current_system) then
							l_found := True
							print_indentation
							current_file.put_string (c_case)
							current_file.put_character (' ')
							current_file.put_integer (l_type.id)
							current_file.put_character (':')
							current_file.put_new_line
						end
					end
					i := i + 1
				end
				if l_found then
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
				end
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
		end

	print_builtin_any_generator_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ANY.generator' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_string: STRING
		do
			l_string := a_target_type.base_class.name.upper_name
			current_file.put_string (c_gems)
			current_file.put_character ('(')
			print_escaped_string (l_string)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_generating_type_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ANY.generating_type' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_string: STRING
		do
			l_string := a_target_type.base_type.to_text
			current_file.put_string (c_gems)
			current_file.put_character ('(')
			print_escaped_string (l_string)
			current_file.put_character (',')
			current_file.put_character (' ')
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_standard_is_equal_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ANY.standard_is_equal' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif
				a_target_type = current_system.character_type or
				a_target_type = current_system.boolean_type or
				a_target_type = current_system.integer_8_type or
				a_target_type = current_system.integer_16_type or
				a_target_type = current_system.integer_type or
				a_target_type = current_system.integer_64_type or
				a_target_type = current_system.natural_8_type or
				a_target_type = current_system.natural_16_type or
				a_target_type = current_system.natural_32_type or
				a_target_type = current_system.natural_64_type or
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('!')
				current_file.put_string (c_memcmp)
				current_file.put_character ('(')
				if a_target_type.is_expanded then
					print_target_expression (call_operands.first)
				else
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
					print_expression (call_operands.first)
					current_file.put_character (')')
				end
				current_file.put_character (',')
				current_file.put_character (' ')
				if a_target_type.is_expanded then
-- TODO: address of what when constant or result of a function?
					current_file.put_character ('&')
				end
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (a_target_type, current_file)
				current_file.put_character (')')
				l_special_type ?= a_target_type
				if l_special_type /= Void then
					current_file.put_character ('+')
					print_attribute_special_count_access (call_operands.first, l_special_type)
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

	print_builtin_any_standard_copy_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ANY.standard_copy' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_temp: ET_IDENTIFIER
		do
			l_special_type ?= a_target_type
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_special_type /= Void then
-- TODO: both objects have to be of the same type.
				l_temp := new_temp_variable (current_system.integer_type)
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_attribute_special_count_access (call_operands.item (2), l_special_type)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_temp_name (l_temp, current_file)
				current_file.put_character ('<')
				current_file.put_character ('=')
				print_attribute_special_count_access (call_operands.first, l_special_type)
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
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (',')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
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
				current_file.put_string ("printf(%"Exception in SPECIAL.standard_copy: target not big enough\n%");")
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
			elseif
				a_target_type = current_system.character_type or
				a_target_type = current_system.boolean_type or
				a_target_type = current_system.integer_8_type or
				a_target_type = current_system.integer_16_type or
				a_target_type = current_system.integer_type or
				a_target_type = current_system.integer_64_type or
				a_target_type = current_system.natural_8_type or
				a_target_type = current_system.natural_16_type or
				a_target_type = current_system.natural_32_type or
				a_target_type = current_system.natural_64_type or
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
-- TODO: both objects have to be of the same type.
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
					print_expression (call_operands.first)
					current_file.put_character (')')
				else
					print_expression (call_operands.first)
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			end
		end

	print_builtin_special_item_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'SPECIAL.item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_attribute_special_item_access (call_operands.first, a_target_type)
				current_file.put_character ('[')
				print_expression (call_operands.item (2))
				current_file.put_character (']')
			end
		end

	print_builtin_special_put_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'SPECIAL.put' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 3 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_attribute_special_item_access (call_operands.first, a_target_type)
				current_file.put_character ('[')
				print_expression (call_operands.item (3))
				current_file.put_character (']')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			end
		end

	print_builtin_special_count_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'SPECIAL.count' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_attribute_special_count_access (call_operands.first, a_target_type)
		end

	print_builtin_special_element_size_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'SPECIAL.element_size' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_special_aliased_resized_area_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'SPECIAL.aliased_resized_area' to `current_file'.
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
				print_attribute_special_count_access (tokens.current_keyword, l_special_type)
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
				current_file.put_string (c_gealloc)
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
				print_attribute_special_item_access (tokens.result_keyword, l_special_type)
				current_file.put_character (',')
				print_attribute_special_item_access (tokens.current_keyword, l_special_type)
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
				print_attribute_special_count_access (tokens.result_keyword, l_special_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_argument_name (l_name, current_file)
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_sized_character_code_call (a_target_type, a_character_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'code' (static binding)
			-- from sized character type `a_character_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_character_item_call (a_target_type, a_character_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Print to `current_file' a call (static binding) to built-in feature `a_feature'
			-- corresponding to feature 'item' from sized character type `a_character_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_target_type = a_character_type then
					-- Current value.
				print_expression (call_operands.first)
			else
					-- Internal attribute.
				print_attribute_access (a_feature, call_operands.first, a_target_type)
			end
		end

	print_builtin_sized_character_set_item_call (a_target_type, a_character_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print call to built-in feature 'set_item' (static binding)
			-- from sized character type `a_character_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `a_character_type'.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_character_type_not_void: a_character_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
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
			elseif a_target_type = a_character_type then
					-- Set current value.
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_character_item)
				l_queries := a_target_type.queries
				nb := l_queries.count
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
						-- Set the built-in attribute.
					print_attribute_access (l_item_attribute, call_operands.first, a_target_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.item (2))
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_builtin_sized_integer_plus_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "+"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_minus_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "-"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_times_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "*"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_divide_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "/"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('/')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_div_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "//"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('/')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_mod_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "\\"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('%%')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_power_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "^"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_integer.h", header_file)
				print_type_cast (current_system.double_type, current_file)
				current_file.put_string (c_gepower)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_opposite_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'prefix "-"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (an_integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('-')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_integer_identity_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'prefix "+"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (an_integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_lt_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "<"' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_to_character_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_character' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.character_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_to_real_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_real' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.real_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_to_real_32_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_real_32' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.real_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_to_real_64_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_real_64' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.double_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_to_double_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_double' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.double_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_natural_8_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_natural_8' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.natural_8_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_natural_16_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_natural_16' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.natural_16_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_natural_32_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_natural_32' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.natural_32_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_natural_64_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_natural_64' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.natural_64_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_integer_8_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_integer_8' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_8_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_integer_16_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_integer_16' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_16_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_integer_32_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_integer_32' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_as_integer_64_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'as_integer_64' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_64_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_integer_bit_or_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_or' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_and_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_and' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('&')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_shift_left_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_shift_left' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('<')
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_shift_right_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_shift_right' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('>')
				current_file.put_character ('>')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_xor_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_xor' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (an_integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('^')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_integer_bit_not_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'bit_not' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (an_integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('~')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_integer_item_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Print to `current_file' a call (static binding) to built-in feature `a_feature'
			-- corresponding to feature 'item' from sized integer type `an_integer_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_target_type = an_integer_type then
					-- Current value.
				print_expression (call_operands.first)
			else
					-- Internal attribute.
				print_attribute_access (a_feature, call_operands.first, a_target_type)
			end
		end

	print_builtin_sized_integer_set_item_call (a_target_type, an_integer_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print call to built-in feature 'set_item' (static binding)
			-- from sized integer type `an_integer_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `an_integer_type'.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			an_integer_type_not_void: an_integer_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
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
			elseif a_target_type = an_integer_type then
					-- Set current value.
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_integer_item)
				l_queries := a_target_type.queries
				nb := l_queries.count
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
						-- Set the built-in attribute.
					print_attribute_access (l_item_attribute, call_operands.first, a_target_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.item (2))
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_builtin_boolean_and_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "and"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('&')
				current_file.put_character ('&')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_and_then_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "and then"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('&')
				current_file.put_character ('&')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_or_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "or"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_or_else_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "or else"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_implies_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "implies"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('!')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_xor_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.infix "xor"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('^')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_not_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN.prefix "not"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.boolean_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('!')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_boolean_item_call (a_target_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Print to `current_file' a call (static binding) to built-in
			-- feature `a_feature' corresponding to 'BOOLEAN_REF.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_feature_not_void: a_feature /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_target_type = current_system.boolean_type then
					-- Current value.
				print_expression (call_operands.first)
			else
					-- Internal attribute.
				print_attribute_access (a_feature, call_operands.first, a_target_type)
			end
		end

	print_builtin_boolean_set_item_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'BOOLEAN_REF.set_item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_boolean_item: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif a_target_type = current_system.boolean_type then
					-- Set current value.
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_builtin_boolean_item := builtin_boolean_feature (builtin_boolean_item)
				l_queries := a_target_type.queries
				nb := l_queries.count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					if l_query.builtin_code = l_builtin_boolean_item then
						l_item_attribute := l_query
						i := nb + 1
					else
						i := i + 1
					end
				end
				if l_item_attribute /= Void then
						-- Set the built-in attribute.
					print_attribute_access (l_item_attribute, call_operands.first, a_target_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.item (2))
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_builtin_pointer_plus_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'POINTER.infix "+"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
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
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_pointer_to_integer_32_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'POINTER.to_integer_32' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_pointer_out_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'POINTER.out' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
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
			current_file.put_string ("gems(s,l)")
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_pointer_hash_code_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'POINTER.hash_code' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character ('&')
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string ("0x7FFFFFFF")
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_pointer_item_call (a_target_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Print to `current_file' a call (static binding) to built-in
			-- feature `a_feature' corresponding to 'POINTER_REF.item'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_feature_not_void: a_feature /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_target_type = current_system.pointer_type then
					-- Current value.
				print_expression (call_operands.first)
			else
					-- Internal attribute.
				print_attribute_access (a_feature, call_operands.first, a_target_type)
			end
		end

	print_builtin_pointer_set_item_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'POINTER_REF.set_item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
			l_builtin_pointer_item: INTEGER
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif a_target_type = current_system.pointer_type then
					-- Set current value.
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_builtin_pointer_item := builtin_pointer_feature (builtin_pointer_item)
				l_queries := a_target_type.queries
				nb := l_queries.count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					if l_query.builtin_code = l_builtin_pointer_item then
						l_item_attribute := l_query
						i := nb + 1
					else
						i := i + 1
					end
				end
				if l_item_attribute /= Void then
						-- Set the built-in attribute.
					print_attribute_access (l_item_attribute, call_operands.first, a_target_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.item (2))
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_builtin_arguments_argument_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ARGUMENTS.argument' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
		do
			l_arguments := a_feature.arguments
			if l_arguments = Void or else l_arguments.count /= 1 then
					-- Internal error: this error should have been reported by the parse.
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
				current_file.put_string (c_geargv)
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
				current_file.put_string ("gems(s,strlen(s))")
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_arguments_argument_count_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ARGUMENTS.argument_count' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_string (c_geargc)
			current_file.put_character (' ')
			current_file.put_character ('-')
			current_file.put_character (' ')
			current_file.put_character ('1')
			current_file.put_character (')')
		end

	print_builtin_platform_is_dotnet_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.is_dotnet' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_false)
		end

	print_builtin_platform_is_unix_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.is_unix' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_unix)
		end

	print_builtin_platform_is_vms_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.is_vms' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_vms)
		end

	print_builtin_platform_is_windows_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.is_windows' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			current_file.put_string (c_eif_is_windows)
		end

	print_builtin_platform_boolean_bytes_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.boolean_bytes' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_platform_character_bytes_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.character_bytes' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_platform_integer_bytes_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.integer_bytes' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_platform_pointer_bytes_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.pointer_bytes' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_platform_real_bytes_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PLATFORM.real_bytes' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
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

	print_builtin_procedure_call_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'PROCEDURE.call' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_procedure_type: ET_DYNAMIC_PROCEDURE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_tuple: ET_EXPRESSION
			l_tuple_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_procedure_type ?= a_target_type
			if l_procedure_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class PROCEDURE (and its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_actuals := l_procedure_type.base_type.actual_parameters
				if l_actuals = Void or else l_actuals.count < 2 then
						-- Internal error: this was already reported during parsing.
						-- The class PROCEDURE has at least 2 actual parameters.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_type := current_system.dynamic_type (l_actuals.type (2), universe.any_class)
				end
			end
			if l_tuple_type = Void then
				-- Error already reported.
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('f')
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				l_tuple := call_operands.item (2)
				l_open_operand_type_sets := l_procedure_type.open_operand_type_sets
				nb := l_open_operand_type_sets.count
				from i := 1 until i > nb loop
					current_file.put_character (',')
					print_attribute_tuple_item_access (i, l_tuple, l_tuple_type)
					i := i + 1
				end
				current_file.put_character (')')
				current_file.put_character (';')
			end
		end

	print_builtin_function_item_call (a_target_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'FUNCTION.item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
			l_function_type: ET_DYNAMIC_FUNCTION_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_tuple: ET_EXPRESSION
			l_tuple_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_function_type ?= a_target_type
			if l_function_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class FUNCTION (and its descendants).
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_actuals := l_function_type.base_type.actual_parameters
				if l_actuals = Void or else l_actuals.count < 2 then
						-- Internal error: this was already reported during parsing.
						-- The class FUNCTION has at least 2 actual parameters.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_tuple_type := current_system.dynamic_type (l_actuals.type (2), universe.any_class)
				end
			end
			if l_tuple_type = Void then
				-- Error already reported.
			elseif call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('f')
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				l_tuple := call_operands.item (2)
				l_open_operand_type_sets := l_function_type.open_operand_type_sets
				nb := l_open_operand_type_sets.count
				from i := 1 until i > nb loop
					current_file.put_character (',')
					print_attribute_tuple_item_access (i, l_tuple, l_tuple_type)
					i := i + 1
				end
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_plus_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "+"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_minus_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "-"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_times_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "*"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_divide_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "/"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (a_real_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('/')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_power_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "^"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				include_runtime_header_file ("ge_real.h", header_file)
				print_type_cast (current_system.double_type, current_file)
				current_file.put_string (c_gepower)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_string (c_double)
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_opposite_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'prefix "-"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (a_real_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('-')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_real_identity_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'prefix "+"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (a_real_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_real_lt_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'infix "<"' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if call_operands.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_expression (call_operands.first)
				current_file.put_character (')')
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_sized_real_truncated_to_integer_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'truncated_to_integer' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_real_truncated_to_integer_64_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'truncated_to_integer_64' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.integer_64_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_real_truncated_to_real_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'truncated_to_real' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.real_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_real_to_double_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'to_double' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			print_type_cast (current_system.double_type, current_file)
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
		end

	print_builtin_sized_real_ceiling_real_32_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ceiling_real_32' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			include_runtime_header_file ("ge_real.h", header_file)
			print_type_cast (current_system.real_type, current_file)
			current_file.put_string (c_geceiling)
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (c_double)
			current_file.put_character (')')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_real_ceiling_real_64_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'ceiling_real_64' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			include_runtime_header_file ("ge_real.h", header_file)
			print_type_cast (current_system.double_type, current_file)
			current_file.put_string (c_geceiling)
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (c_double)
			current_file.put_character (')')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_real_floor_real_32_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'floor_real_32' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			include_runtime_header_file ("ge_real.h", header_file)
			print_type_cast (current_system.real_type, current_file)
			current_file.put_string (c_gefloor)
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (c_double)
			current_file.put_character (')')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_sized_real_floor_real_64_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE) is
			-- Print call to built-in feature 'floor_real_64' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			include_runtime_header_file ("ge_real.h", header_file)
			print_type_cast (current_system.double_type, current_file)
			current_file.put_string (c_gefloor)
			current_file.put_character ('(')
			current_file.put_character ('(')
			current_file.put_string (c_double)
			current_file.put_character (')')
			current_file.put_character ('(')
			print_expression (call_operands.first)
			current_file.put_character (')')
			current_file.put_character (')')
		end

	print_builtin_real_out_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'out' from sized
			-- real type `a_real_type' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
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
			if a_feature.builtin_code // builtin_capacity = builtin_real_class then
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
			current_file.put_string ("gems(s,l)")
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_sized_real_item_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Print to `current_file' a call (static binding) to built-in feature `a_feature'
			-- corresponding to feature 'item' from sized real type `a_real_type'.
			-- `a_target_type' is the dynamic type of the target.
			-- Operands can be found in `call_operands'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		do
			if a_target_type = a_real_type then
					-- Current value.
				print_expression (call_operands.first)
			else
					-- Internal attribute.
				print_attribute_access (a_feature, call_operands.first, a_target_type)
			end
		end

	print_builtin_sized_real_set_item_call (a_target_type, a_real_type: ET_DYNAMIC_TYPE; a_builtin_class_code: INTEGER) is
			-- Print call to built-in feature 'set_item' (static binding)
			-- from sized real type `a_real_type' to `current_file'.
			-- `a_target_type' is the dynamic type of the target.
			-- `a_builtin_class_code' is the built-in code of the
			-- base class of `a_real_type'.
			-- Operands can be found in `call_operands'.
		require
			a_target_type_not_void: a_target_type /= Void
			a_real_type_not_void: a_real_type /= Void
			call_operands_not_empty: not call_operands.is_empty
		local
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
			elseif a_target_type = a_real_type then
					-- Set current value.
				print_expression (call_operands.first)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (call_operands.item (2))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_builtin_item_code := builtin_feature (a_builtin_class_code, builtin_real_item)
				l_queries := a_target_type.queries
				nb := l_queries.count
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
						-- Set the built-in attribute.
					print_attribute_access (l_item_attribute, call_operands.first, a_target_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (call_operands.item (2))
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
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
				current_file.put_line ("geargc = argc;")
				print_indentation
				current_file.put_line ("geargv = argv;")
				print_indentation
				current_file.put_line ("geconst();")
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_creation_expression (l_root_type, l_root_creation, Void)
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

	print_gems_function is
			-- Print 'gems' function to `current_file'.
			-- 'gems' is used to create manifest strings.
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
			print_type_declaration (l_string_type, current_file)
			current_file.put_character (' ')
			current_file.put_string (c_gems)
			current_file.put_string ("(char* s, ")
			print_type_declaration (l_count_type, current_file)
			current_file.put_character (' ')
			current_file.put_character ('c')
			current_file.put_character (')')
			current_file.put_new_line
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (l_temp, l_area_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_area_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'count' of 'area'.
				print_indentation
				print_attribute_special_count_access (l_temp, l_area_type)
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
				print_attribute_special_item_access (l_temp, l_area_type)
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (tokens.result_keyword, l_string_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_string_type.id)
				current_file.put_character (';')
				current_file.put_new_line
				l_queries := l_string_type.queries
				if l_queries.count < 2 then
						-- Internal error: the STRING type should have at least
						-- the attributes 'area' and 'count' as first features.
					set_fatal_error
					error_handler.report_giaaa_error
				else
						-- Set 'area'.
					print_indentation
					print_attribute_access (l_queries.first, tokens.result_keyword, l_string_type)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					print_temp_name (l_temp, current_file)
					current_file.put_character (';')
					current_file.put_new_line
						-- Set 'count'.
					print_indentation
					print_attribute_access (l_queries.item (2), tokens.result_keyword, l_string_type)
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

	print_gema_function (an_array_type: ET_DYNAMIC_TYPE) is
			-- Print 'gema' function to `current_file' and its signature to `header_file'.
			-- 'gema<type-id>' is used to create manifest arrays of type 'type-id'.
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
			if l_queries.count < 3 then
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
				header_file.put_string (c_gema)
				current_file.put_string (c_gema)
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (l_temp, l_special_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_special_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'count' of 'area'.
				print_indentation
				print_attribute_special_count_access (l_temp, l_special_type)
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
				print_attribute_special_item_access (l_temp, l_special_type)
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
					l_item_type = current_system.character_type or
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
				current_file.put_string (c_gealloc)
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
				print_attribute_type_id_access (tokens.result_keyword, an_array_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (an_array_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'area'.
				print_indentation
				print_attribute_access (l_queries.first, tokens.result_keyword, an_array_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_temp_name (l_temp, current_file)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'lower'.
				print_indentation
				print_attribute_access (l_queries.item (2), tokens.result_keyword, an_array_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'upper'.
				print_indentation
				print_attribute_access (l_queries.item (3), tokens.result_keyword, an_array_type)
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

	print_gemt_function (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE) is
			-- Print 'gemt' function to `current_file' and its signature to `header_file'.
			-- 'gemt<type-id>' is used to create manifest tuples of type 'type-id'.
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
			header_file.put_string (c_gemt)
			current_file.put_string (c_gemt)
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
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_character (')')
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
			current_file.put_string (c_gealloc)
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
			print_attribute_type_id_access (tokens.result_keyword, a_tuple_type)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_integer (a_tuple_type.id)
			current_file.put_character (';')
			current_file.put_new_line
				-- Set fields.
			from i := 1 until i > nb loop
				print_indentation
				print_attribute_tuple_item_access (i, tokens.result_keyword, a_tuple_type)
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

	print_gevoid_function is
			-- Print 'gevoid' function to `current_file' and its signature to `header_file'.
			-- 'gevoid' is called when a feature call will always result
			-- in a call-on-void-target.
		do
				-- Print signature to `header_file' and `current_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			header_file.put_string (c_int)
			current_file.put_string (c_int)
			header_file.put_string (" gevoid")
			current_file.put_string (" gevoid")
			header_file.put_character ('(')
			current_file.put_character ('(')
			print_type_declaration (current_system.any_type, header_file)
			print_type_declaration (current_system.any_type, current_file)
			header_file.put_character (' ')
			current_file.put_character (' ')
			print_current_name (header_file)
			print_current_name (current_file)
			header_file.put_string (", ...)")
			current_file.put_string (", ...)")
			header_file.put_character (';')
			header_file.put_new_line
				-- Print body to `current_file'.
			current_file.put_character ('{')
			current_file.put_new_line
			indent
-- TODO: raise a "call on void target" exception.
			print_indentation
			current_file.put_line ("printf(%"Call on Void target!\n%");")
			print_indentation
			current_file.put_line ("exit(1);")
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
		end

	print_geconst_function is
			-- Print 'geconst' function to `current_file'.
			-- 'geconst' is called to initialize the value of
			-- the non-expanded constant attributes.
		local
			l_feature: ET_FEATURE
		do
			current_file.put_line ("void geconst()")
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
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
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
		do
			if current_type.is_expanded then
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
				print_indentation
				print_temp_name (l_temp, current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_type_cast (current_type, current_file)
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				print_type_declaration (current_type, current_file)
				current_file.put_character (' ')
				print_current_name (current_file)
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				print_current_name (current_file)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (')')
				current_file.put_string (c_gealloc)
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
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						print_attribute_special_count_access (tokens.current_keyword, l_special_type)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						print_argument_name (l_name, current_file)
-- TODO: initialize items when expanded.
					end
				else
					current_file.put_character (')')
				end
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				print_attribute_type_id_access (tokens.current_keyword, current_type)
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (current_type.id)
				current_file.put_character (';')
				current_file.put_new_line
			end
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
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_function_type: ET_DYNAMIC_FUNCTION_TYPE
			l_procedure_type: ET_DYNAMIC_PROCEDURE_TYPE
			l_open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			j, nb2: INTEGER
		do
				-- Type with type id 'id'.
			a_file.put_string (c_define)
			a_file.put_character (' ')
			print_eif_object_type_name (a_file)
			a_file.put_character (' ')
			a_file.put_line (c_eif_object)
			a_file.put_new_line
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive then
					a_file.put_character ('/')
					a_file.put_character ('*')
					a_file.put_character (' ')
					a_file.put_string (l_type.static_type.base_type.to_text)
					a_file.put_character (' ')
					a_file.put_character ('*')
					a_file.put_character ('/')
					a_file.put_new_line
					if l_type = current_system.character_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_character)
					elseif l_type = current_system.wide_character_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_wide_char)
					elseif l_type = current_system.boolean_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_boolean)
					elseif l_type = current_system.integer_8_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_integer_8)
					elseif l_type = current_system.integer_16_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_integer_16)
					elseif l_type = current_system.integer_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_integer)
					elseif l_type = current_system.integer_64_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_integer_64)
					elseif l_type = current_system.natural_8_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_natural_8)
					elseif l_type = current_system.natural_16_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_natural_16)
					elseif l_type = current_system.natural_32_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_natural_32)
					elseif l_type = current_system.natural_64_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_natural_64)
					elseif l_type = current_system.real_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_real_32)
					elseif l_type = current_system.double_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_real_64)
					elseif l_type = current_system.pointer_type then
						a_file.put_string (c_define)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_line (c_eif_pointer)
					else
						a_file.put_string (c_typedef)
						a_file.put_character (' ')
						a_file.put_string (c_struct)
						a_file.put_character (' ')
						print_struct_name (l_type, a_file)
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (';')
						a_file.put_new_line
					end
					a_file.put_new_line
				end
				i := i + 1
			end
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive then
					if l_type = current_system.character_type then
						-- Do nothing.
					elseif l_type = current_system.wide_character_type then
						-- Do nothing.
					elseif l_type = current_system.boolean_type then
						-- Do nothing.
					elseif l_type = current_system.integer_8_type then
						-- Do nothing.
					elseif l_type = current_system.integer_16_type then
						-- Do nothing.
					elseif l_type = current_system.integer_type then
						-- Do nothing.
					elseif l_type = current_system.integer_64_type then
						-- Do nothing.
					elseif l_type = current_system.natural_8_type then
						-- Do nothing.
					elseif l_type = current_system.natural_16_type then
						-- Do nothing.
					elseif l_type = current_system.natural_32_type then
						-- Do nothing.
					elseif l_type = current_system.natural_64_type then
						-- Do nothing.
					elseif l_type = current_system.real_type then
						-- Do nothing.
					elseif l_type = current_system.double_type then
						-- Do nothing.
					elseif l_type = current_system.pointer_type then
						-- Do nothing.
					else
						a_file.put_character ('/')
						a_file.put_character ('*')
						a_file.put_character (' ')
						a_file.put_string ("Struct for type ")
						a_file.put_string (l_type.static_type.base_type.to_text)
						a_file.put_character (' ')
						a_file.put_character ('*')
						a_file.put_character ('/')
						a_file.put_new_line
						a_file.put_string (c_struct)
						a_file.put_character (' ')
						print_struct_name (l_type, a_file)
						a_file.put_character (' ')
						a_file.put_character ('{')
						a_file.put_new_line
						a_file.put_character ('%T')
						a_file.put_string (c_int)
						a_file.put_character (' ')
						print_attribute_type_id_name (l_type, a_file)
						a_file.put_character (';')
						a_file.put_new_line
						l_queries := l_type.queries
						nb2 := l_queries.count
						from j := 1 until j > nb2 loop
							l_query := l_queries.item (j)
							if l_query.is_attribute then
								a_file.put_character ('%T')
								print_type_declaration (l_query.result_type_set.static_type, a_file)
								a_file.put_character (' ')
								print_attribute_name (l_query, l_type, a_file)
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
							end
							j := j + 1
						end
						l_special_type ?= l_type
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
							l_tuple_type ?= l_type
							if l_tuple_type /= Void then
								l_item_type_sets := l_tuple_type.item_type_sets
								nb2 := l_item_type_sets.count
								from j := 1 until j > nb2 loop
									a_file.put_character ('%T')
									print_type_declaration (l_item_type_sets.item (j).static_type, a_file)
									a_file.put_character (' ')
									print_attribute_tuple_item_name (j, l_tuple_type, a_file)
									a_file.put_character (';')
									a_file.put_new_line
									j := j + 1
								end
							else
								l_function_type ?= l_type
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
									print_type_declaration (l_type, a_file)
									l_open_operand_type_sets := l_function_type.open_operand_type_sets
									nb2 := l_open_operand_type_sets.count
									from j := 1 until j > nb2 loop
										a_file.put_character (',')
										a_file.put_character (' ')
										print_type_declaration (l_open_operand_type_sets.item (j).static_type, a_file)
										j := j + 1
									end
									a_file.put_character (')')
									a_file.put_character (';')
									a_file.put_new_line
								else
									l_procedure_type ?= l_type
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
										print_type_declaration (l_type, a_file)
										l_open_operand_type_sets := l_procedure_type.open_operand_type_sets
										nb2 := l_open_operand_type_sets.count
										from j := 1 until j > nb2 loop
											a_file.put_character (',')
											a_file.put_character (' ')
											print_type_declaration (l_open_operand_type_sets.item (j).static_type, a_file)
											j := j + 1
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
				i := i + 1
			end
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

	print_getypes_array is
			-- Print 'getypes' array to `current_file' and its declaration to `header_file'.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
				-- Print declaration of 'getypes' in `header_file'.
			header_file.put_string (c_extern)
			header_file.put_character (' ')
			header_file.put_string (c_eif_type)
			header_file.put_character (' ')
			header_file.put_string (c_getypes)
			header_file.put_character ('[')
			header_file.put_character (']')
			header_file.put_character (';')
			header_file.put_new_line
			current_file.put_string (c_eif_type)
			current_file.put_character (' ')
			current_file.put_string (c_getypes)
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
			current_file.put_string (c_eif_false)
			current_file.put_character ('}')
			current_file.put_character (',')
			current_file.put_new_line
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				current_file.put_character ('{')
				current_file.put_integer (0)
				current_file.put_character (',')
				current_file.put_character (' ')
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
				a_file.put_character ('T')
				a_file.put_integer (a_type.id)
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
				a_file.put_character ('S')
				a_file.put_integer (a_type.id)
			end
		end

	print_eif_object_type_name (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of type 'EIF_OBJECT' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				a_file.put_character ('T')
				a_file.put_character ('0')
			else
-- TODO: long names
				a_file.put_character ('T')
				a_file.put_character ('0')
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
				print_eif_object_type_name (a_file)
				a_file.put_character ('*')
			end
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
				print_type_name (a_type, a_file)
				a_file.put_character ('f')
				l_precursor ?= a_routine
				if l_precursor /= Void then
					a_file.put_integer (l_precursor.current_feature.id)
					a_file.put_character ('p')
				end
				a_file.put_integer (a_routine.id)
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
				print_type_name (a_type, a_file)
				a_file.put_character ('s')
				l_precursor ?= a_routine
				if l_precursor /= Void then
					a_file.put_integer (l_precursor.current_feature.id)
					a_file.put_character ('p')
				end
				a_file.put_integer (a_routine.id)
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
				print_type_name (a_type, a_file)
				a_file.put_character ('c')
				a_file.put_integer (a_procedure.id)
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
				a_file.put_character ('a')
				a_file.put_integer (an_attribute.id)
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
				a_file.put_string (c_id)
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
				a_file.put_character ('z')
				a_file.put_character ('2')
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
				a_file.put_character ('z')
				a_file.put_character ('1')
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
				a_file.put_character ('z')
				a_file.put_integer (i)
			end
		end

	print_call_name (a_call: ET_CALL_COMPONENT; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_call' with `a_type' as target static type to `a_file'.
		require
			a_call_not_void: a_call /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if short_names then
				print_type_name (a_type, a_file)
				a_file.put_character ('x')
				a_file.put_integer (a_call.name.seed)
			else
-- TODO: long names
				print_type_name (a_type, a_file)
				a_file.put_character ('x')
				a_file.put_integer (a_call.name.seed)
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
				a_file.put_character ('a')
				a_file.put_integer (a_name.seed)
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
				a_file.put_character ('l')
				a_file.put_integer (a_name.seed)
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
				a_file.put_character ('t')
				a_file.put_integer (a_name.seed)
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
				a_file.put_character ('a')
				a_file.put_integer (a_name.seed)
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
				a_file.put_character ('z')
				a_file.put_integer (a_name.seed)
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
				a_file.put_character ('C')
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
				a_file.put_character ('R')
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
			a_file.put_string (a_type.base_type.to_text)
			a_file.put_character ('.')
			a_file.put_string (STRING_.replaced_all_substrings (a_feature.name.lower_name, "*/", "star/"))
			a_file.put_character (' ')
			a_file.put_character ('*')
			a_file.put_character ('/')
			a_file.put_new_line
		end

	print_call_name_comment (a_call: ET_CALL_COMPONENT; a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_call', with `a_type' as target static type, as a C comment to `a_file'.
		require
			a_call_not_void: a_call /= Void
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
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
			a_file.put_string (a_type.base_type.to_text)
			a_file.put_character ('.')
			a_file.put_string (STRING_.replaced_all_substrings (a_call.name.lower_name, "*/", "star/"))
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
					include_runtime_header_file ("eif_file.h", a_file)
					include_runtime_header_file ("eif_console.h", a_file)
				elseif a_filename.same_string ("%"eif_dir.h%"") then
					include_runtime_header_file ("eif_dir.h", a_file)
				elseif a_filename.same_string ("%"eif_eiffel.h%"") then
					include_runtime_header_file ("eif_eiffel.h", a_file)
				elseif a_filename.same_string ("%"eif_except.h%"") then
					include_runtime_header_file ("eif_except.h", a_file)
				elseif a_filename.same_string ("%"eif_file.h%"") then
					include_runtime_header_file ("eif_file.h", a_file)
				elseif a_filename.same_string ("%"eif_memory.h%"") then
					include_runtime_header_file ("eif_memory.h", a_file)
				elseif a_filename.same_string ("%"eif_misc.h%"") then
					include_runtime_header_file ("eif_misc.h", a_file)
				elseif a_filename.same_string ("%"eif_path_name.h%"") then
					include_runtime_header_file ("eif_path_name.h", a_file)
				elseif a_filename.same_string ("%"eif_retrieve.h%"") then
					include_runtime_header_file ("eif_retrieve.h", a_file)
				elseif a_filename.same_string ("%"eif_sig.h%"") then
					include_runtime_header_file ("eif_sig.h", a_file)
				elseif a_filename.same_string ("%"eif_store.h%"") then
					include_runtime_header_file ("eif_store.h", a_file)
				elseif a_filename.same_string ("%"eif_traverse.h%"") then
					include_runtime_header_file ("eif_traverse.h", a_file)
				elseif a_filename.same_string ("%"ge_time.h%"") then
					include_runtime_header_file ("ge_time.h", a_file)
				else
					a_file.put_string (c_include)
					a_file.put_character (' ')
					a_file.put_string (a_filename)
					a_file.put_new_line
				end
				included_header_filenames.force (a_filename)
			end
		end

	include_runtime_header_file (a_filename: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Include runtime header file `a_filename' to `a_file'.
		require
			a_filename_not_void: a_filename /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if not included_runtime_header_files.has (a_filename) then
				if a_filename.same_string ("eif_console.h") then
					included_runtime_c_files.force ("eif_console.c")
				elseif a_filename.same_string ("eif_dir.h") then
					included_runtime_c_files.force ("eif_dir.c")
				elseif a_filename.same_string ("eif_except.h") then
					included_runtime_c_files.force ("eif_except.c")
				elseif a_filename.same_string ("eif_file.h") then
					included_runtime_c_files.force ("eif_file.c")
				elseif a_filename.same_string ("eif_memory.h") then
					included_runtime_c_files.force ("eif_memory.c")
				elseif a_filename.same_string ("eif_misc.h") then
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
				include_runtime_c_file (a_filename, a_file)
				included_runtime_header_files.force (a_filename)
			end
		end

	included_header_filenames: DS_HASH_SET [STRING]
			-- Name of header filenames already included

	included_runtime_header_files: DS_HASH_SET [STRING]
			-- Name of runtime header files already included

	included_runtime_c_files: DS_HASH_SET [STRING]
			-- Name of runtime C files already included

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
			print_call_agent (an_expression)
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

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_do_procedure (a_feature)
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

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			print_external_procedure (a_feature)
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

feature {NONE} -- Type resolving

	resolved_formal_parameters (a_type: ET_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' by their
			-- corresponding actual parameters if the class where
			-- `a_type' appears is generic and is not `current_type.base_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
-- TODO.
--			has_fatal_error := False
			Result := type_checker.resolved_formal_parameters (a_type, current_feature.static_feature, current_type.base_type)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			resolved_type_not_void: not has_fatal_error implies Result /= Void
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Access

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature being processed

	current_type: ET_DYNAMIC_TYPE
			-- Type where `current_feature' belongs

	current_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	current_function_header_buffer: KL_STRING_OUTPUT_STREAM
			-- Buffer to write the C header of the current function

	current_function_body_buffer: KL_STRING_OUTPUT_STREAM
			-- Buffer to write the C body of the current function

	header_file: KI_TEXT_OUTPUT_STREAM
			-- Header file

	called_features: DS_ARRAYED_LIST [ET_DYNAMIC_FEATURE]
			-- Features being called

	call_agents: DS_ARRAYED_LIST [ET_CALL_AGENT]
			-- Agents already processed in `current_feature'

	manifest_array_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of manifest arrays

	manifest_tuple_types: DS_HASH_SET [ET_DYNAMIC_TUPLE_TYPE]
			-- Types of manifest tuples

	once_features: DS_HASH_SET [ET_FEATURE]
			-- Once features already generated

	constant_features: DS_HASH_TABLE [ET_CONSTANT, ET_FEATURE]
			-- Features returning a constant

	unique_count: INTEGER
			-- Number of unique attributes found so far

	operand_stack: DS_ARRAYED_STACK [ET_EXPRESSION]
			-- Operand stack

	call_operands: DS_ARRAYED_LIST [ET_EXPRESSION]
			-- Operands of call being processed

feature {NONE} -- Implementation

	accepted_types: ET_DYNAMIC_TYPE_LIST
			-- Types accepted by the current assignment attempt

	denied_types: ET_DYNAMIC_TYPE_LIST
			-- Types denied by the current assignment attempt

	in_operand: BOOLEAN
			-- Is an operand being processed?

	in_target: BOOLEAN
			-- Is the target of a call being processed?

	assignment_target: ET_WRITABLE
			-- Target of expression currently being processed, if any

	new_temp_variable (a_type: ET_DYNAMIC_TYPE): ET_IDENTIFIER is
			-- New temporary variable of type `a_type'
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
		do
			nb := free_temp_variables.count
			from i := 1 until i > nb loop
				l_type := free_temp_variables.item (i)
				if l_type /= Void and then same_declaration_types (a_type, l_type) then
					used_temp_variables.replace (l_type, i)
					free_temp_variables.replace (Void, i)
					Result := temp_variables.item (i)
					i := nb + 1
				else
					i := i + 1
				end
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
				current_function_header_buffer.put_character ('%T')
				print_type_declaration (a_type, current_function_header_buffer)
				current_function_header_buffer.put_character (' ')
				print_temp_name (Result, current_function_header_buffer)
				current_function_header_buffer.put_character (';')
				current_function_header_buffer.put_new_line
			end
		ensure
			variable_not_void: Result /= Void
		end

	mark_temp_variable_used (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as used.
		require
			a_temp_not_void: a_temp /= Void
			not_used: free_temp_variables.item (a_temp.seed) /= Void
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			used_temp_variables.replace (free_temp_variables.item (l_seed), l_seed)
			free_temp_variables.replace (Void, l_seed)
		end

	mark_temp_variable_free (a_temp: ET_IDENTIFIER) is
			-- Mark temporary variable `a_temp' as free.
		require
			a_temp_not_void: a_temp /= Void
			used: used_temp_variables.item (a_temp.seed) /= Void
		local
			l_seed: INTEGER
		do
			l_seed := a_temp.seed
			free_temp_variables.replace (used_temp_variables.item (l_seed), l_seed)
			used_temp_variables.replace (Void, l_seed)
		end

	temp_variables: DS_ARRAYED_LIST [ET_IDENTIFIER]
			-- Names of temporary variables generated so far

	used_temp_variables: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Temporary variables currently in used by the current feature

	free_temp_variables: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Temporary variables declared for the current feature but
			-- not currently used

	temp_variable: ET_IDENTIFIER is
			-- Shared temporary variable, to be used in non-Eiffel features
			-- such as 'gems' or 'gema*'.
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

	fill_call_operands (nb: INTEGER) is
			-- Fill `call_operands' with nb operands.
		require
			nb_not_negative: nb >= 0
		local
			i, j: INTEGER
			l_operand: ET_EXPRESSION
			l_temp: ET_IDENTIFIER
			l_seed: INTEGER
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
						l_seed := l_temp.seed
						free_temp_variables.replace (used_temp_variables.item (l_seed), l_seed)
						used_temp_variables.replace (Void, l_seed)
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
			-- Fill `call_operands' with "Current" followed by the formal arguments of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			i, nb: INTEGER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
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
				call_operands.force_last (l_arguments.formal_argument (i).name)
				i := i + 1
			end
		ensure
			filled: call_operands.count = a_feature.arguments_count + 1
		end

	dummy_feature: ET_DYNAMIC_FEATURE is
			-- Dummy feature
		local
			l_name: ET_FEATURE_NAME
			l_feature: ET_FEATURE
		once
			create {ET_IDENTIFIER} l_name.make ("**dummy**")
			create {ET_DO_PROCEDURE} l_feature.make (l_name, Void, Void, Void, Void, Void, Void, Void, tokens.any_clients, current_type.base_class)
			create Result.make (l_feature, current_type, current_system)
		ensure
			dummy_feature_not_void: Result /= Void
		end

feature {NONE} -- Constants

	e_access: STRING is "access"
	e_blocking: STRING is "blocking"
	e_c: STRING is "C"
	e_get: STRING is "get"
	e_inline: STRING is "inline"
	e_macro: STRING is "macro"
	e_signature: STRING is "signature"
	e_struct: STRING is "struct"
	e_type: STRING is "type"
	e_use: STRING is "use"
	c_arrow: STRING is "->"
	c_break: STRING is "break"
	c_case: STRING is "case"
	c_char: STRING is "char"
	c_default: STRING is "default"
	c_define: STRING is "#define"
	c_double: STRING is "double"
	c_eif_boolean: STRING is "EIF_BOOLEAN"
	c_eif_character: STRING is "EIF_CHARACTER"
	c_eif_false: STRING is "EIF_FALSE"
	c_eif_integer: STRING is "EIF_INTEGER"
	c_eif_integer_8: STRING is "EIF_INTEGER_8"
	c_eif_integer_16: STRING is "EIF_INTEGER_16"
	c_eif_integer_32: STRING is "EIF_INTEGER_32"
	c_eif_integer_64: STRING is "EIF_INTEGER_64"
	c_eif_is_unix: STRING is "EIF_IS_UNIX"
	c_eif_is_vms: STRING is "EIF_IS_VMS"
	c_eif_is_windows: STRING is "EIF_IS_WINDOWS"
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
	c_eif_true: STRING is "EIF_TRUE"
	c_eif_type: STRING is "EIF_TYPE"
	c_eif_void: STRING is "EIF_VOID"
	c_eif_wide_char: STRING is "EIF_WIDE_CHAR"
	c_else: STRING is "else"
	c_extern: STRING is "extern"
	c_float: STRING is "float"
	c_gealloc: STRING is "gealloc"
	c_geargc: STRING is "geargc"
	c_geargv: STRING is "geargv"
	c_geceiling: STRING is "geceiling"
	c_gefloor: STRING is "gefloor"
	c_geint8: STRING is "geint8"
	c_geint16: STRING is "geint16"
	c_geint32: STRING is "geint32"
	c_geint64: STRING is "geint64"
	c_gema: STRING is "gema"
	c_gems: STRING is "gems"
	c_gemt: STRING is "gemt"
	c_genat8: STRING is "genat8"
	c_genat16: STRING is "genat16"
	c_genat32: STRING is "genat32"
	c_genat64: STRING is "genat64"
	c_gepower: STRING is "gepower"
	c_getypes: STRING is "getypes"
	c_gevoid: STRING is "gevoid"
	c_id: STRING is "id"
	c_if: STRING is "if"
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
	c_struct: STRING is "struct"
	c_switch: STRING is "switch"
	c_typedef: STRING is "typedef"
	c_unsigned: STRING is "unsigned"
	c_void: STRING is "void"
	c_while: STRING is "while"
			-- String constants

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
	accepted_types_not_void: accepted_types /= Void
	denied_types_not_void: denied_types /= Void
	polymorphic_seeds_not_void: polymorphic_seeds /= Void
	polymorphic_type_ids_not_void: polymorphic_type_ids /= Void
	polymorphic_types_not_void: polymorphic_types /= Void
	no_void_polymorphic_type: not polymorphic_types.has_item (Void)
	call_agents_not_void: call_agents /= Void
	no_void_call_agent: not call_agents.has (Void)
	agent_instruction_not_void: agent_instruction /= Void
	agent_expression_not_void: agent_expression /= Void
	agent_arguments_not_void: agent_arguments /= Void
	agent_assignment_not_void: agent_assignment /= Void
	agent_open_operands_not_void: agent_open_operands /= Void
	no_void_agent_open_operand: not agent_open_operands.has (Void)
	agent_closed_operands_not_void: agent_closed_operands /= Void
	no_void_agent_closed_operand: not agent_closed_operands.has (Void)
	wrapper_assignment_not_void: wrapper_assignment /= Void
	wrapper_expression_not_void: wrapper_expression /= Void
	manifest_array_types_not_void: manifest_array_types /= Void
	no_void_manifest_array_type: not manifest_array_types.has (Void)
	manifest_tuple_types_not_void: manifest_tuple_types /= Void
	no_void_manifest_tuple_type: not manifest_tuple_types.has (Void)
	called_features_not_void: called_features /= Void
	no_void_called_feature: not called_features.has (Void)
	once_features_not_void: once_features /= Void
	no_void_once_feature: not once_features.has (Void)
	constant_features_not_void: constant_features /= Void
	no_void_constant_feature: not constant_features.has (Void)
	temp_variables_not_void: temp_variables /= Void
	no_void_temp_variable: not temp_variables.has (Void)
	used_temp_variables_not_void: used_temp_variables /= Void
	free_temp_variables_not_void: free_temp_variables /= Void
	included_header_filenames_not_void: included_header_filenames /= Void
	no_void_included_header_filename: not included_header_filenames.has (Void)
	included_runtime_header_files_not_void: included_runtime_header_files /= Void
	no_void_included_runtime_header_file: not included_runtime_header_files.has (Void)
	included_runtime_c_files_not_void: included_runtime_c_files /= Void
	no_void_included_runtime_c_file: not included_runtime_c_files.has (Void)

end
