indexing

	description:

		"C code generators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2005, Eric Bezault and others"
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

	KL_IMPORTED_CHARACTER_ROUTINES
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
		do
			make_processor (a_system.universe)
			create type_checker.make (universe)
			current_system := a_system
			current_file := null_output_stream
			header_file := null_output_stream
			current_type := a_system.none_type
			current_feature := dummy_feature
			create polymorphic_query_calls.make (100000)
			create polymorphic_procedure_calls.make (100000)
			create instruction_buffer_stack.make (10)
			create local_buffer_stack.make (10)
			create current_local_buffer.make ("")
			create accepted_types.make_with_capacity (15)
			create denied_types.make_with_capacity (15)
			create internal_local_name.make ("z")
			create polymorphic_type_ids.make (100)
			create polymorphic_types.make_map (100)
			create manifest_array_types.make (100)
			create once_features.make (10000)
			create constant_features.make_map (10000)
			create called_features.make (1000)
			create polymorphic_equivalent_types1.make (100)
			create polymorphic_equivalent_types2.make (100)
			create polymorphic_equivalent_types3.make (100)
		end

feature -- Access

	current_system: ET_SYSTEM
			-- Surrounding system
			-- (Note: there is a frozen feature called `system' in
			-- class GENERAL of SmartEiffel 1.0)

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred when generating `current_system'?

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
				include_runtime_c_file ("ge_eiffel.h", header_file)
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
					-- Print Eiffel features.
				l_root_procedure := current_system.root_creation_procedure
				if l_root_procedure /= Void then
					l_root_procedure.set_generated (True)
					called_features.force_last (l_root_procedure)
					last_polymorphic_query_index := 1
					last_polymorphic_procedure_index := 1
					from until called_features.is_empty loop
						l_dynamic_feature := called_features.last
						called_features.remove_last
						print_feature (l_dynamic_feature)
						print_polymorphic_queries
						print_polymorphic_procedures
					end
				end
				polymorphic_query_calls.wipe_out
				polymorphic_procedure_calls.wipe_out
					-- Print features which build manifest arrays.
				from manifest_array_types.start until manifest_array_types.after loop
					print_gema_function (manifest_array_types.item_for_iteration)
					a_file.put_new_line
					manifest_array_types.forth
				end
				manifest_array_types.wipe_out
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
					-- Print 'main' function.
				print_main_function
					-- Include runtime C files.
				a_file.put_new_line
				header_file.put_new_line
				include_runtime_c_file ("ge_directory.h", header_file)
				include_runtime_c_file ("ge_directory.c", a_file)
				once_features.wipe_out
				constant_features.wipe_out
				header_file := old_header_file
				l_header_file.close
				current_file := old_file
				current_type := current_system.none_type
				current_feature := dummy_feature
				local_count := 0
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
		do
			if not a_feature.is_semistrict then
				old_type := current_type
				current_type := a_feature.target_type
				old_feature := current_feature
				current_feature := a_feature
				local_count := 0
				a_feature.static_feature.process (Current)
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
						error_handler.report_gibdc_error
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
			error_handler.report_gibdm_error
		end

	print_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Print `a_feature' to `current_file' and its signature to `header_file'.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- Internal error: deferred features cannot be executed at run-time.
			set_fatal_error
			error_handler.report_gibdn_error
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
				error_handler.report_giadl_error
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
				error_handler.report_giadu_error
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
			i, j, nb: INTEGER
			i2, nb2: INTEGER
			i3, nb3: INTEGER
			l_max: INTEGER
			l_max_index: INTEGER
			c, c3: CHARACTER
			l_language: ET_EXTERNAL_LANGUAGE
			l_language_value: ET_MANIFEST_STRING
			l_alias: ET_EXTERNAL_ALIAS
			l_alias_value: ET_MANIFEST_STRING
			l_c_code: STRING
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: STRING
			l_comma: BOOLEAN
		do
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
			if a_static then
				print_static_routine_name (current_feature, current_type, header_file)
				print_static_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type, header_file)
				print_creation_procedure_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
			else
				print_routine_name (current_feature, current_type, header_file)
				print_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
				header_file.put_character (' ')
				current_file.put_character (' ')
				header_file.put_character ('C')
				current_file.put_character ('C')
				l_comma := True
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb := l_arguments.count
				if nb > 0 then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_dynamic_type_sets := current_feature.dynamic_type_sets
					if l_dynamic_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibdz_error
					else
						from i := 1 until i > nb loop
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
							header_file.put_character ('a')
							current_file.put_character ('a')
							header_file.put_integer (i)
							current_file.put_integer (i)
							i := i + 1
						end
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
			if l_result_type_set /= Void then
				print_indentation
				print_type_declaration (l_result_type_set.static_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			end
			if a_creation then
				print_malloc_current
			end
			if a_feature.is_builtin then
				if l_result_type_set /= Void then
						-- This is a built-in function.
					inspect a_feature.builtin_code
					when builtin_any_twin then
						print_builtin_any_twin_body (a_feature)
					when builtin_any_same_type then
						print_indentation_assign_to_result
						print_builtin_any_same_type_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_any_standard_is_equal then
						print_indentation_assign_to_result
						print_builtin_any_standard_is_equal_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_any_conforms_to then
						print_builtin_any_conforms_to_body (a_feature)
					when builtin_any_generator then
						print_indentation_assign_to_result
						print_builtin_any_generator_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_any_generating_type then
						print_indentation_assign_to_result
						print_builtin_any_generating_type_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_any_standard_twin then
						print_builtin_any_standard_twin_body (a_feature)
					when builtin_any_tagged_out then
						print_builtin_any_tagged_out_body (a_feature)
					when builtin_any_is_deep_equal then
						print_builtin_any_is_deep_equal_body (a_feature)
					when builtin_any_deep_twin then
						print_builtin_any_deep_twin_body (a_feature)
					when builtin_special_item then
						print_indentation_assign_to_result
						print_builtin_special_item_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_special_count then
						print_indentation_assign_to_result
						print_builtin_special_count_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_special_element_size then
						print_indentation_assign_to_result
						print_builtin_special_element_size_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_special_aliased_resized_area then
						print_builtin_special_aliased_resized_area_body (a_feature)
					when builtin_character_code then
						print_indentation_assign_to_result
						print_builtin_character_code_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_character_lt then
						print_indentation_assign_to_result
						print_builtin_character_lt_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_character_gt then
						print_indentation_assign_to_result
						print_builtin_character_gt_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_character_le then
						print_indentation_assign_to_result
						print_builtin_character_le_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_character_ge then
						print_indentation_assign_to_result
						print_builtin_character_ge_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_boolean_and then
						print_indentation_assign_to_result
						print_builtin_boolean_and_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_boolean_or then
						print_indentation_assign_to_result
						print_builtin_boolean_or_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_boolean_xor then
						print_indentation_assign_to_result
						print_builtin_boolean_xor_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_boolean_not then
						print_indentation_assign_to_result
						print_builtin_boolean_not_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_boolean_item then
						print_indentation_assign_to_result
						print_builtin_boolean_item_call (current_feature, current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_integer_plus then
						print_indentation_assign_to_result
						print_builtin_integer_plus_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_minus then
						print_indentation_assign_to_result
						print_builtin_integer_minus_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_times then
						print_indentation_assign_to_result
						print_builtin_integer_times_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_divide then
						print_indentation_assign_to_result
						print_builtin_integer_divide_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_div then
						print_indentation_assign_to_result
						print_builtin_integer_div_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_mod then
						print_indentation_assign_to_result
						print_builtin_integer_mod_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_opposite then
						print_indentation_assign_to_result
						print_builtin_integer_opposite_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_integer_lt then
						print_indentation_assign_to_result
						print_builtin_integer_lt_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_gt then
						print_indentation_assign_to_result
						print_builtin_integer_gt_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_le then
						print_indentation_assign_to_result
						print_builtin_integer_le_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_ge then
						print_indentation_assign_to_result
						print_builtin_integer_ge_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_to_character then
						print_indentation_assign_to_result
						print_builtin_integer_to_character_call (current_type, Void, a_feature.name, Void)
						print_semicolon_newline
					when builtin_integer_bit_or then
						print_indentation_assign_to_result
						print_builtin_integer_bit_or_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					when builtin_integer_bit_shift_left then
						print_indentation_assign_to_result
						print_builtin_integer_bit_shift_left_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						print_semicolon_newline
					else
							-- Unknown built-in feature.
							-- This error should already have been reported during parsing.
							-- building the dynamic type sets.
						set_fatal_error
						error_handler.report_gibib_error
					end
				else
						-- This is a built-in procedure.
					inspect a_feature.builtin_code
					when builtin_any_standard_copy then
						print_indentation
						print_builtin_any_standard_copy_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						current_file.put_new_line
					when builtin_special_make then
						-- Do nothing: already done in `print_malloc_current'.
					when builtin_special_put then
						print_indentation
						print_builtin_special_put_call (current_type, Void, a_feature.name, internal_formal_arguments (2))
						current_file.put_new_line
					when builtin_boolean_set_item then
						print_indentation
						print_builtin_boolean_set_item_call (current_type, Void, a_feature.name, internal_formal_arguments (1))
						current_file.put_new_line
					else
							-- Unknown built-in feature.
							-- This error should already have been reported during parsing.
							-- building the dynamic type sets.
						set_fatal_error
						error_handler.report_gibib_error
					end
				end
			else
				l_language := a_feature.language
				l_language_value := l_language.manifest_string
				if STRING_.same_case_insensitive (l_language_value.value, e_inline) then
					l_alias := a_feature.alias_clause
					if l_alias /= Void then
						l_alias_value := l_alias.manifest_string
						l_c_code := l_alias_value.value
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
												current_file.put_character ('a')
												current_file.put_integer (l_max_index)
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
							current_file.put_new_line
						else
							current_file.put_line (l_c_code)
						end
					end
--						-- No need to print "return R;", this should
--						-- already be done in the inlined code.
--					l_result_type_set := Void
				end
			end
			if l_result_type_set /= Void then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (';')
				current_file.put_new_line
			elseif a_creation then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (';')
				current_file.put_new_line
			end
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
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
				error_handler.report_gibcg_error
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
				error_handler.report_gibci_error
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
			i, nb: INTEGER
			l_compound: ET_COMPOUND
			l_comma: BOOLEAN
		do
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
			if a_static then
				print_static_routine_name (current_feature, current_type, header_file)
				print_static_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type, header_file)
				print_creation_procedure_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
			else
				print_routine_name (current_feature, current_type, header_file)
				print_routine_name (current_feature, current_type, current_file)
				header_file.put_character ('(')
				current_file.put_character ('(')
				print_type_declaration (current_type, header_file)
				print_type_declaration (current_type, current_file)
				header_file.put_character (' ')
				current_file.put_character (' ')
				header_file.put_character ('C')
				current_file.put_character ('C')
				l_comma := True
			end
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				nb := l_arguments.count
				if nb > 0 then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_dynamic_type_sets := current_feature.dynamic_type_sets
					if l_dynamic_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of actual and formal arguments.
						set_fatal_error
						error_handler.report_gibdy_error
					else
						from i := 1 until i > nb loop
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
							header_file.put_character ('a')
							current_file.put_character ('a')
							header_file.put_integer (i)
							current_file.put_integer (i)
							i := i + 1
						end
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
				current_file.put_character ('R')
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
					l_local_type_set := current_feature.dynamic_type_set (l_locals.local_variable (i).name)
					if l_local_type_set = Void then
							-- Internal error: the dynamic type of local variable
							-- should be known at this stage.
						set_fatal_error
						error_handler.report_gibdx_error
					else
						print_indentation
						print_type_declaration (l_local_type_set.static_type, current_file)
						current_file.put_character (' ')
						current_file.put_character ('l')
						current_file.put_integer (i)
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
			if a_creation then
				print_malloc_current
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
					current_file.put_character ('R')
					current_file.put_character (';')
					current_file.put_new_line
				end
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (';')
				current_file.put_new_line
			elseif a_creation then
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (';')
				current_file.put_new_line
			end
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
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
			print_writable (an_instruction.target)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_expression (an_instruction.source)
			current_file.put_character (')')
			current_file.put_character (';')
		end

	print_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
			l_local_index: INTEGER
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
				error_handler.report_gibcj_error
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
				if l_denied_types.is_empty then
						-- Direct assignment.
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
				elseif l_accepted_types.is_empty then
						-- We need to compute the source (in case there is
						-- a side-effect) before assigning Void to the target.
					local_count := local_count + 1
					l_local_index := local_count
					print_reference_local_declaration (l_local_index)
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string (c_eif_void)
					current_file.put_character (';')
				elseif l_denied_types.count < l_accepted_types.count then
					local_count := local_count + 1
					l_local_index := local_count
					print_reference_local_declaration (l_local_index)
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_string (c_arrow)
					current_file.put_string (c_id)
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
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
				else
					local_count := local_count + 1
					l_local_index := local_count
					print_reference_local_declaration (l_local_index)
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_string (c_switch)
					current_file.put_character (' ')
					current_file.put_character ('(')
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
					current_file.put_string (c_arrow)
					current_file.put_string (c_id)
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
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
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
				end
				l_accepted_types.wipe_out
				l_denied_types.wipe_out
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
				print_procedure_call (current_type, Void, an_instruction.name, an_instruction.arguments)
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
				print_indentation
				print_instruction (a_compound.item (i))
				current_file.put_new_line
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
					error_handler.report_gibck_error
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
					error_handler.report_gibcr_error
				else
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_creation_expression (l_dynamic_type, l_dynamic_procedure, l_actuals)
					current_file.put_character (')')
					current_file.put_character (';')
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
			a_compound: ET_COMPOUND
			an_elseif_parts: ET_ELSEIF_PART_LIST
			an_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
		do
			current_file.put_string (c_if)
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_expression (an_instruction.expression)
			current_file.put_character (')')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
			a_compound := an_instruction.then_compound
			if a_compound /= Void then
				indent
				print_compound (a_compound)
				dedent
			end
			print_indentation
			current_file.put_character ('}')
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				nb := an_elseif_parts.count
				from i := 1 until i > nb loop
					an_elseif := an_elseif_parts.item (i)
					current_file.put_character (' ')
					current_file.put_string (c_else)
					current_file.put_character (' ')
					current_file.put_string (c_if)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_elseif.expression)
					current_file.put_character (')')
					current_file.put_character (' ')
					current_file.put_character ('{')
					current_file.put_new_line
					a_compound := an_elseif.then_compound
					if a_compound /= Void then
						indent
						print_compound (a_compound)
						dedent
					end
					print_indentation
					current_file.put_character ('}')
					i := i + 1
				end
			end
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_compound (a_compound)
				dedent
				print_indentation
				current_file.put_character ('}')
			end
		end

	print_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			an_expression: ET_EXPRESSION
			a_when_parts: ET_WHEN_PART_LIST
			a_when_part: ET_WHEN_PART
			a_choices: ET_CHOICE_LIST
			a_choice: ET_CHOICE
			a_compound: ET_COMPOUND
			i, nb: INTEGER
			j, nb2: INTEGER
			l_has_case: BOOLEAN
			l_lower: ET_CHOICE_CONSTANT
			l_upper: ET_CHOICE_CONSTANT
			l_lower_integer: ET_INTEGER_CONSTANT
			l_upper_integer: ET_INTEGER_CONSTANT
			l_lower_character: ET_CHARACTER_CONSTANT
			l_upper_character: ET_CHARACTER_CONSTANT
			k, nb3: INTEGER
		do
-- TODO.
			current_file.put_string (c_switch)
			current_file.put_character (' ')
			current_file.put_character ('(')
			an_expression := an_instruction.conditional.expression
			print_expression (an_expression)
			current_file.put_character (')')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				nb := a_when_parts.count
				from i := 1 until i > nb loop
					a_when_part := a_when_parts.item (i)
					a_choices := a_when_part.choices
					nb2 := a_choices.count
					if nb2 = 0 then
						-- Do nothing.
					else
						l_has_case := False
						from j := 1 until j > nb2 loop
							a_choice := a_choices.choice (j)
							if a_choice.is_range then
-- TODO
								l_lower := a_choice.lower
								l_upper := a_choice.upper
								l_lower_integer ?= l_lower
								l_upper_integer ?= l_upper
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
										current_file.put_integer (k)
										current_file.put_character (':')
										current_file.put_new_line
										k := k + 1
									end
								else
									l_lower_character ?= l_lower
									l_upper_character ?= l_upper
									if l_lower_character /= Void and l_upper_character /= Void then
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
											current_file.put_character ('%'')
											print_escaped_character (k.to_character)
											current_file.put_character ('%'')
											current_file.put_character (':')
											current_file.put_new_line
											k := k + 1
										end
									else
-- TODO
print ("ET_C_GENERATOR.print_inspect_instruction - range%N")
									end
								end
							else
								l_has_case := True
								print_indentation
								current_file.put_string (c_case)
								current_file.put_character (' ')
								print_expression (a_choice.lower.expression)
								current_file.put_character (':')
								current_file.put_new_line
							end
							j := j + 1
						end
						if l_has_case then
							indent
							a_compound := a_when_part.then_compound
							if a_compound /= Void then
								print_compound (a_compound)
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
			a_compound := an_instruction.else_compound
			if a_compound /= Void then
				indent
				print_compound (a_compound)
				dedent
			else
-- TODO.
				indent
				print_indentation
				current_file.put_character (';')
				current_file.put_new_line
				dedent
			end
			print_indentation
			current_file.put_character ('}')
		end

	print_instruction (an_instruction: ET_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_instruction_buffer_string: STRING
			l_instruction_buffer: KL_STRING_OUTPUT_STREAM
			l_local_buffer_string: STRING
			l_local_buffer: KL_STRING_OUTPUT_STREAM
			old_file: like current_file
			old_local_buffer: like current_local_buffer
		do
			if not instruction_buffer_stack.is_empty then
				l_instruction_buffer := instruction_buffer_stack.item
				instruction_buffer_stack.remove
				l_instruction_buffer_string := l_instruction_buffer.string
				STRING_.wipe_out (l_instruction_buffer_string)
			else
				create l_instruction_buffer_string.make (1024)
				create l_instruction_buffer.make (l_instruction_buffer_string)
			end
			old_file := current_file
			current_file := l_instruction_buffer
			if not local_buffer_stack.is_empty then
				l_local_buffer := local_buffer_stack.item
				local_buffer_stack.remove
				l_local_buffer_string := l_local_buffer.string
				STRING_.wipe_out (l_local_buffer_string)
			else
				create l_local_buffer_string.make (256)
				create l_local_buffer.make (l_local_buffer_string)
			end
			old_local_buffer := current_local_buffer
			current_local_buffer := l_local_buffer
			an_instruction.process (Current)
			current_file := old_file
			instruction_buffer_stack.force (l_instruction_buffer)
			current_local_buffer := old_local_buffer
			local_buffer_stack.force (l_local_buffer)
			if l_local_buffer_string.count > 0 then
				current_file.put_character ('{')
				current_file.put_new_line
				current_file.put_string (l_local_buffer_string)
				print_indentation
				current_file.put_string (l_instruction_buffer_string)
				current_file.put_new_line
				print_indentation
				current_file.put_character ('}')
			else
				current_file.put_string (l_instruction_buffer_string)
			end
		end

	print_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				print_compound (a_compound)
				print_indentation
			end
			current_file.put_string (c_while)
			current_file.put_character (' ')
			current_file.put_character ('(')
			current_file.put_character ('!')
			current_file.put_character ('(')
			print_expression (an_instruction.until_expression)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_new_line
			a_compound := an_instruction.loop_compound
			if a_compound /= Void then
				indent
				print_compound (a_compound)
				dedent
			end
			print_indentation
			current_file.put_character ('}')
		end

	print_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_procedure: ET_PROCEDURE
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_current_class: ET_CLASS
			l_class_impl: ET_CLASS
			l_dynamic_precursor: ET_DYNAMIC_PRECURSOR
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_comma: BOOLEAN
		do
			a_parent_type := an_instruction.parent_type
			if a_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
				error_handler.report_gibcv_error
			else
				if a_parent_type.is_generic then
					l_current_class := current_type.base_class
					l_class_impl := current_feature.static_feature.implementation_class
					if l_current_class /= l_class_impl then
							-- Resolve generic parameters in the context of `current_type'.
-- TODO: I think that 'ancestor_builder' has already been executed on `l_current_class'
-- at this stage, and therefore there is no need to check it again here.
						l_current_class.process (universe.ancestor_builder)
						if not l_current_class.ancestors_built or else l_current_class.has_ancestors_error then
							set_fatal_error
						else
							an_ancestor := l_current_class.ancestor (a_parent_type, universe)
							if an_ancestor = Void then
									-- Internal error: `a_parent_type' is an ancestor
									-- of `l_class_impl', and hence of `l_current_class'.
								set_fatal_error
								error_handler.report_gibcx_error
							else
								a_parent_type := an_ancestor
							end
						end
					end
				end
				if not has_fatal_error then
					a_precursor_keyword := an_instruction.precursor_keyword
					a_class := a_parent_type.direct_base_class (universe)
					l_procedure := a_class.seeded_procedure (a_precursor_keyword.seed)
					if l_procedure = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `a_class_impl'.
						set_fatal_error
						error_handler.report_gibcw_error
					else
						l_dynamic_type := current_system.dynamic_type (a_parent_type, current_type.base_type)
						l_dynamic_precursor := current_feature.dynamic_precursor (l_procedure, l_dynamic_type, current_system)
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
							current_file.put_character ('C')
							l_comma := True
						end
						an_actuals := an_instruction.arguments
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								if l_comma then
									current_file.put_character (',')
									current_file.put_character (' ')
								else
									l_comma := True
								end
								print_expression (an_actuals.actual_argument (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
						current_file.put_character (';')
					end
				end
			end
		end

	print_procedure_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to procedure `a_name' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
			l_printed: BOOLEAN
		do
			a_seed := a_name.seed
			l_dynamic_feature := a_target_type.seeded_dynamic_procedure (a_seed, current_system)
			if l_dynamic_feature = Void then
					-- Internal error: there should be a procedure with `a_seed'.
					-- It has been computed in ET_FEATURE_FLATTENER.
				set_fatal_error
				error_handler.report_giaec_error
			else
				if l_dynamic_feature.is_builtin then
					l_printed := True
					inspect l_dynamic_feature.builtin_code
					when builtin_any_standard_copy then
						print_builtin_any_standard_copy_call (a_target_type, a_target, a_name, an_actuals)
					when builtin_special_put then
						print_builtin_special_put_call (a_target_type, a_target, a_name, an_actuals)
					when builtin_boolean_set_item then
						print_builtin_boolean_set_item_call (a_target_type, a_target, a_name, an_actuals)
					else
						l_printed := False
					end
				end
				if not l_printed then
					if not l_dynamic_feature.is_generated then
						l_dynamic_feature.set_generated (True)
						called_features.force_last (l_dynamic_feature)
					end
					print_routine_name (l_dynamic_feature, a_target_type, current_file)
					current_file.put_character ('(')
					if a_target /= Void then
						print_expression (a_target)
					else
						current_file.put_character ('C')
					end
					if an_actuals /= Void then
						nb := an_actuals.count
						from i := 1 until i > nb loop
							current_file.put_character (',')
							current_file.put_character (' ')
							print_expression (an_actuals.actual_argument (i))
							i := i + 1
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

	print_qualified_call_instruction (a_call: ET_FEATURE_CALL_INSTRUCTION) is
			-- Print qualified call instruction.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
		local
			a_name: ET_CALL_NAME
			a_target: ET_EXPRESSION
			a_target_type_set: ET_DYNAMIC_TYPE_SET
			an_actuals: ET_ACTUAL_ARGUMENTS
			a_seed: INTEGER
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_local_index: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_switch: BOOLEAN
		do
			a_target := a_call.target
			a_name := a_call.name
			an_actuals := a_call.arguments
			a_target_type_set := current_feature.dynamic_type_set (a_target)
			if a_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibjb_error
			else
				a_seed := a_name.seed
				l_dynamic_type := a_target_type_set.first_type
				l_other_dynamic_types := a_target_type_set.other_types
				if l_dynamic_type = Void then
						-- Call on Void target.
					current_file.put_string ("gevoid(")
					print_expression (a_target)
					if an_actuals /= Void then
						nb := an_actuals.count
						from i := 1 until i > nb loop
							current_file.put_character (',')
							print_expression (an_actuals.actual_argument (i))
							i := i + 1
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
				elseif l_other_dynamic_types = Void then
						-- Static binding.
					print_procedure_call (l_dynamic_type, a_target, a_call.name, an_actuals)
				else
						-- Dynamic binding.
					if l_other_dynamic_types.count /= 1 then
						create l_polymorphic_call.make (a_call, a_target_type_set, current_feature, current_type)
						polymorphic_procedure_calls.force_last (l_polymorphic_call)
						print_indentation
						current_file.put_character ('X')
						current_file.put_integer (polymorphic_procedure_calls.count)
						current_file.put_character ('(')
						print_expression (a_target)
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (an_actuals.actual_argument (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
						current_file.put_character (';')
					elseif l_switch then
						from
							j := 1
							nb2 := l_other_dynamic_types.count
							local_count := local_count + 1
							l_local_index := local_count
							print_reference_local_declaration (l_local_index)
							current_file.put_character ('z')
							current_file.put_integer (l_local_index)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_expression (a_target)
							current_file.put_character (')')
							current_file.put_character (';')
							current_file.put_new_line
							print_indentation
							current_file.put_string (c_switch)
							current_file.put_character (' ')
							current_file.put_character ('(')
							current_file.put_character ('z')
							current_file.put_integer (l_local_index)
							current_file.put_string (c_arrow)
							current_file.put_string (c_id)
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
							print_indentation
								-- Set index of `internal_local_name' again and again just before
								-- calling `print_procedure_call' because it might have been
								-- overwritten inbetween when printing the arguments of the calls.
							internal_local_name.set_seed (l_local_index)
							print_procedure_call (l_dynamic_type, internal_local_name, a_call.name, an_actuals)
							current_file.put_new_line
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
					else
						local_count := local_count + 1
						l_local_index := local_count
						print_reference_local_declaration (l_local_index)
						current_file.put_character ('z')
						current_file.put_integer (l_local_index)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (')')
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						current_file.put_string (c_if)
						current_file.put_character (' ')
						current_file.put_character ('(')
						current_file.put_character ('z')
						current_file.put_integer (l_local_index)
						current_file.put_string (c_arrow)
						current_file.put_string (c_id)
						current_file.put_character ('=')
						current_file.put_character ('=')
						current_file.put_integer (l_dynamic_type.id)
						current_file.put_character (')')
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						indent
						print_indentation
							-- Set index of `internal_local_name' again and again just before
							-- calling `print_procedure_call' because it might have been
							-- overwritten inbetween when printing the arguments of the calls.
						internal_local_name.set_seed (l_local_index)
						print_procedure_call (l_dynamic_type, internal_local_name, a_call.name, an_actuals)
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
							-- Set index of `internal_local_name' again and again just before
							-- calling `print_procedure_call' because it might have been
							-- overwritten inbetween when printing the arguments of the calls.
						internal_local_name.set_seed (l_local_index)
						print_procedure_call (l_other_dynamic_types.item (1), internal_local_name, a_call.name, an_actuals)
						current_file.put_new_line
						dedent
						print_indentation
						current_file.put_character ('}')
						current_file.put_new_line
					end
				end
			end
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
			a_type: ET_TYPE
			a_resolved_type: ET_TYPE
			a_target_type: ET_DYNAMIC_TYPE
			l_dynamic_procedure: ET_DYNAMIC_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			a_seed: INTEGER
			i, nb: INTEGER
		do
			a_type := an_instruction.type
			a_resolved_type := resolved_formal_parameters (a_type)
			if not has_fatal_error then
				a_target_type := current_system.dynamic_type (a_resolved_type, current_type.base_type)
				a_seed := an_instruction.name.seed
				l_dynamic_procedure := a_target_type.seeded_dynamic_procedure (a_seed, current_system)
				if l_dynamic_procedure = Void then
						-- Internal error: there should be a procedure with `a_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_gibcu_error
				else
					if not l_dynamic_procedure.is_generated then
						l_dynamic_procedure.set_generated (True)
						called_features.force_last (l_dynamic_procedure)
					end
					print_static_routine_name (l_dynamic_procedure, a_target_type, current_file)
					current_file.put_character ('(')
					an_actuals := an_instruction.arguments
					if an_actuals /= Void then
						nb := an_actuals.count
						from i := 1 until i > nb loop
							if i > 1 then
								current_file.put_character (',')
								current_file.put_character (' ')
							end
							print_expression (an_actuals.actual_argument (i))
							i := i + 1
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
				end
			end
		end

feature {NONE} -- Expression generation

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
		do
			print_type_cast (current_system.character_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('%'')
			print_escaped_character (a_constant.value)
			current_file.put_character ('%'')
			current_file.put_character (')')
		end

	print_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if an_expression.is_qualified_call then
				print_qualified_call_expression (an_expression)
			else
				print_query_call (current_type, Void, an_expression.name, an_expression.arguments)
			end
		end

	print_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_convert_feature: ET_CONVERT_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENTS
		do
print ("ET_C_GENERATOR.print_convert_expression%N")
			a_convert_feature := an_expression.convert_feature
			if a_convert_feature.is_convert_from then
-- TODO.
				an_actuals := an_expression.expression
--				check_creation_expression_validity (current_target_type.named_type (universe),
--					a_convert_feature.name, an_actuals)
				print_expression (an_expression.expression)
			else
				print_expression (an_expression.expression)
			end
		end

	print_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
print ("ET_C_GENERATOR.print_convert_to_expression%N")
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
					error_handler.report_gibct_error
				else
					print_creation_expression (l_dynamic_type, l_dynamic_procedure, l_actuals)
				end
			end
		end

	print_creation_expression (a_type: ET_DYNAMIC_TYPE; a_procedure: ET_DYNAMIC_FEATURE; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Print a creation expression.
		require
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
			is_procedure: a_procedure.is_procedure
		local
			i, nb: INTEGER
		do
			if not a_procedure.is_generated then
				a_procedure.set_generated (True)
				called_features.force_last (a_procedure)
			end
			print_creation_procedure_name (a_procedure, a_type, current_file)
			current_file.put_character ('(')
			if an_actuals /= Void then
				nb := an_actuals.count
				from i := 1 until i > nb loop
					if i /= 1 then
						current_file.put_character (',')
						current_file.put_character (' ')
					end
					print_expression (an_actuals.actual_argument (i))
					i := i + 1
				end
			end
			current_file.put_character (')')
		end

	print_current (an_expression: ET_CURRENT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			current_file.put_character ('C')
		end

	print_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_local_index: INTEGER
			a_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			a_dynamic_type: ET_DYNAMIC_TYPE
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
-- TODO: TYPED_POINTER vs. POINTER.
			a_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if a_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibdg_error
			else
				a_dynamic_type := a_dynamic_type_set.static_type
				l_special_type ?= current_type
				if l_special_type /= Void then
					print_type_cast (current_system.pointer_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('(')
					print_type_cast (current_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('C')
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('>')
					current_file.put_character ('a')
					current_file.put_character ('2')
					current_file.put_character (')')
				else
print ("ET_C_GENERATOR.print_current_address%N")
					local_count := local_count + 1
					l_local_index := local_count
					print_typed_pointer_local_declaration (l_local_index, a_dynamic_type)
					if current_type.is_expanded then
--					current_file.put_character ('&')
--					current_file.put_character ('C')
						current_file.put_character ('z')
						current_file.put_integer (l_local_index)
					else
--					current_file.put_character ('C')
						current_file.put_character ('z')
						current_file.put_integer (l_local_index)
					end
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
		do
			l_left_type_set := current_feature.dynamic_type_set (an_expression.left)
			l_right_type_set := current_feature.dynamic_type_set (an_expression.right)
			if l_left_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression.left'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibil_error
			elseif l_right_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression.right'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibim_error
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
				print_expression (an_expression.left)
				current_file.put_character (')')
				if an_expression.operator.is_not_equal then
					current_file.put_character ('!')
				else
					current_file.put_character ('=')
				end
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_expression.right)
				current_file.put_character (')')
			end
		end

	print_expression (an_expression: ET_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			an_expression.process (Current)
		end

	print_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO: TYPED_POINTER vs. POINTER.
			current_file.put_character ('0')
print ("ET_C_GENERATOR.print_expression_address%N")
		end

	print_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			current_file.put_string (c_eif_false)
		end

	print_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			a_dynamic_type: ET_DYNAMIC_TYPE
			l_local_index: INTEGER
		do
-- TODO.
print ("ET_C_GENERATOR.print_feature_address%N")
			a_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if a_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known atthis stage.
				set_fatal_error
				error_handler.report_gibch_error
			else
				a_dynamic_type := a_dynamic_type_set.static_type
				if a_dynamic_type = current_system.pointer_type then
						-- $feature_name is of type POINTER, even
						-- in ISE and its TYPED_POINTER support.
					current_file.put_character ('0')
				else
					local_count := local_count + 1
					l_local_index := local_count
					print_typed_pointer_local_declaration (l_local_index, a_dynamic_type)
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
				end
			end
		end

	print_formal_argument (a_name: ET_IDENTIFIER) is
			-- Print formal argument `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
		do
			current_file.put_character ('a')
			current_file.put_integer (a_name.seed)
		end

	print_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			a_literal: STRING
		do
			a_literal := a_constant.literal
			inspect a_literal.count
			when 4 then
					-- 0[xX][a-fA-F0-9]{2}
				print_type_cast (current_system.integer_8_type, current_file)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 6 then
					-- 0[xX][a-fA-F0-9]{4}
				print_type_cast (current_system.integer_16_type, current_file)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 10 then
					-- 0[xX][a-fA-F0-9]{8}
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 18 then
					-- 0[xX][a-fA-F0-9]{16}
				print_type_cast (current_system.integer_64_type, current_file)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			end
		end

	print_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_infix_cast_expression%N")
			print_expression (an_expression.expression)
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
			l_internal_local_name: ET_INTERNAL_LOCAL_NAME
		do
			l_internal_local_name ?= a_name
			if l_internal_local_name /= Void then
				current_file.put_character ('z')
			else
				current_file.put_character ('l')
			end
			current_file.put_integer (a_name.seed)
		end

	print_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			l_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if l_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibjc_error
			else
				l_dynamic_type := l_dynamic_type_set.static_type
				manifest_array_types.force_last (l_dynamic_type)
				nb := an_expression.count
				current_file.put_character ('g')
				current_file.put_character ('e')
				current_file.put_character ('m')
				current_file.put_character ('a')
				current_file.put_integer (l_dynamic_type.id)
				current_file.put_character ('(')
				current_file.put_integer (nb)
				from i := 1 until i > nb loop
					current_file.put_character (',')
						-- Print one item per line for better readability,
						-- avoidind too long lines for big arrays.
					current_file.put_new_line
					print_expression (an_expression.expression (i))
					i := i + 1
				end
				current_file.put_character (')')
			end
		end

	print_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_local_index: INTEGER
			i, nb: INTEGER
		do
-- TODO.
print ("ET_C_GENERATOR.print_manifest_tuple%N")
			local_count := local_count + 1
			l_local_index := local_count
			print_reference_local_declaration (l_local_index)
			nb := an_expression.count
			current_file.put_character ('(')
			from i := 1 until i > nb loop
				current_file.put_character ('(')
				print_expression (an_expression.expression (i))
				current_file.put_character (')')
				current_file.put_character (',')
				i := i + 1
			end
			current_file.put_string (c_eif_void)
			current_file.put_character (')')
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
			print_expression (an_expression.expression)
		end

	print_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_once_manifest_string%N")
			current_file.put_string (c_eif_void)
		end

	print_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_expression (an_expression.expression)
		end

	print_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_query: ET_QUERY
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_current_class: ET_CLASS
			l_class_impl: ET_CLASS
			l_dynamic_precursor: ET_DYNAMIC_PRECURSOR
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_comma: BOOLEAN
		do
			a_parent_type := an_expression.parent_type
			if a_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
				error_handler.report_gibja_error
			else
				if a_parent_type.is_generic then
					l_current_class := current_type.base_class
					l_class_impl := current_feature.static_feature.implementation_class
					if l_current_class /= l_class_impl then
							-- Resolve generic parameters in the context of `current_type'.
-- TODO: I think that 'ancestor_builder' has already been executed on `l_current_class'
-- at this stage, and therefore there is no need to check it again here.
						l_current_class.process (universe.ancestor_builder)
						if not l_current_class.ancestors_built or else l_current_class.has_ancestors_error then
							set_fatal_error
						else
							an_ancestor := l_current_class.ancestor (a_parent_type, universe)
							if an_ancestor = Void then
									-- Internal error: `a_parent_type' is an ancestor
									-- of `l_class_impl', and hence of `l_current_class'.
								set_fatal_error
								error_handler.report_gibey_error
							else
								a_parent_type := an_ancestor
							end
						end
					end
				end
				if not has_fatal_error then
					a_precursor_keyword := an_expression.precursor_keyword
					a_class := a_parent_type.direct_base_class (universe)
					l_query := a_class.seeded_query (a_precursor_keyword.seed)
					if l_query = Void then
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `a_class_impl'.
						set_fatal_error
						error_handler.report_gibbc_error
					else
						l_dynamic_type := current_system.dynamic_type (a_parent_type, current_type.base_type)
						l_dynamic_precursor := current_feature.dynamic_precursor (l_query, l_dynamic_type, current_system)
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
							current_file.put_character ('C')
							l_comma := True
						end
						an_actuals := an_expression.arguments
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								if l_comma then
									current_file.put_character (',')
									current_file.put_character (' ')
								else
									l_comma := True
								end
								print_expression (an_actuals.actual_argument (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
					end
				end
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
			a_name: ET_CALL_NAME
			a_target: ET_EXPRESSION
			a_target_type_set: ET_DYNAMIC_TYPE_SET
			an_actuals: ET_ACTUAL_ARGUMENTS
			l_query: ET_QUERY
			a_seed: INTEGER
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_static_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_local_index: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
		do
			a_target := a_call.target
			a_name := a_call.name
			an_actuals := a_call.arguments
			a_target_type_set := current_feature.dynamic_type_set (a_target)
			if a_target_type_set = Void then
					-- Internal error: the dynamic type set of the target
					-- should be known at this stage.
				set_fatal_error
				error_handler.report_gibcy_error
			else
				a_seed := a_name.seed
				l_dynamic_type := a_target_type_set.first_type
				l_other_dynamic_types := a_target_type_set.other_types
				if l_dynamic_type = Void then
						-- Call on Void target.
					l_static_type := a_target_type_set.static_type
					l_query := l_static_type.base_class.seeded_query (a_seed)
					if l_query = Void then
							-- Internal error: there should be a query with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibco_error
					else
						current_file.put_character ('(')
						print_type_declaration (current_system.dynamic_type (l_query.type, l_static_type.base_type), current_file)
						current_file.put_character (')')
						current_file.put_string ("gevoid(")
						print_expression (a_target)
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								current_file.put_character (',')
								print_expression (an_actuals.actual_argument (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
					end
				elseif l_other_dynamic_types = Void then
						-- Static binding.
					print_query_call (l_dynamic_type, a_target, a_call.name, an_actuals)
				else
						-- Dynamic binding.
					l_static_type := a_target_type_set.static_type
					l_query := l_static_type.base_class.seeded_query (a_seed)
					if l_query = Void then
							-- Internal error: there should be a query with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibcp_error
					else
						l_constant_attribute ?= l_query
						if l_constant_attribute /= Void then
							print_query_call (l_dynamic_type, a_target, a_call.name, an_actuals)
						elseif l_other_dynamic_types.count /= 1 then
							create l_polymorphic_call.make (a_call, a_target_type_set, current_system.none_type, current_feature, current_type)
							polymorphic_query_calls.force_last (l_polymorphic_call)
							current_file.put_character ('Y')
							current_file.put_integer (polymorphic_query_calls.count)
							current_file.put_character ('(')
							print_expression (a_target)
							if an_actuals /= Void then
								nb := an_actuals.count
								from i := 1 until i > nb loop
									current_file.put_character (',')
									current_file.put_character (' ')
									print_expression (an_actuals.actual_argument (i))
									i := i + 1
								end
							end
							current_file.put_character (')')
						else
							from
								j := 1
								nb2 := l_other_dynamic_types.count
								local_count := local_count + 1
								l_local_index := local_count
								print_reference_local_declaration (l_local_index)
								current_file.put_character ('(')
								current_file.put_character ('(')
								current_file.put_character ('z')
								current_file.put_integer (l_local_index)
								current_file.put_character (' ')
								current_file.put_character ('=')
								current_file.put_character (' ')
								current_file.put_character ('(')
								print_expression (a_target)
								current_file.put_character (')')
								current_file.put_character (')')
								current_file.put_character (',')
							until
								l_dynamic_type = Void
							loop
								if j <= nb2 then
									current_file.put_character ('(')
									current_file.put_character ('z')
									current_file.put_integer (l_local_index)
									current_file.put_string (c_arrow)
									current_file.put_string (c_id)
									current_file.put_character ('=')
									current_file.put_character ('=')
									current_file.put_integer (l_dynamic_type.id)
									current_file.put_character (')')
									current_file.put_character ('?')
								end
									-- Set index of `internal_local_name' again and again just before
									-- calling `print_query_call' because it might have been
									-- overwritten inbetween when printing the arguments of the calls.
								internal_local_name.set_seed (l_local_index)
								print_query_call (l_dynamic_type, internal_local_name, a_call.name, an_actuals)
								if j > nb2 then
									l_dynamic_type := Void
								else
									current_file.put_character (':')
									l_dynamic_type := l_other_dynamic_types.item (j)
									j := j + 1
								end
							end
							current_file.put_character (')')
						end
					end
				end
			end
		end

	print_query_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to query `a_name' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
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
		do
			l_seed := a_name.seed
			l_query := a_target_type.base_class.seeded_query (l_seed)
			if l_query = Void then
					-- Internal error: there should be a query with `l_seed'.
					-- It has been computed in ET_FEATURE_FLATTENER.
				set_fatal_error
				error_handler.report_gibdb_error
			else
				l_constant_attribute ?= l_query
				if l_constant_attribute /= Void then
					l_printed := True
					l_string_constant ?= l_constant_attribute.constant
					if l_string_constant /= Void then
						l_once_feature := l_constant_attribute.implementation_feature
						constant_features.force_last (l_string_constant, l_once_feature)
						if a_target /= Void then
							current_file.put_character ('(')
							print_expression (a_target)
							current_file.put_character (',')
							print_once_value_name (l_once_feature, current_file)
							current_file.put_character (')')
						else
							print_once_value_name (l_once_feature, current_file)
						end
					elseif a_target /= Void then
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (',')
						l_constant_attribute.constant.process (Current)
						current_file.put_character (')')
					else
						l_constant_attribute.constant.process (Current)
					end
				else
					l_unique_attribute ?= l_query
					if l_unique_attribute /= Void then
-- TODO: compute the values of the unique features.
						l_printed := True
						if a_target /= Void then
							current_file.put_character ('(')
							print_expression (a_target)
							current_file.put_character (',')
							print_type_cast (current_system.integer_type, current_file)
							current_file.put_character ('(')
							unique_count := unique_count + 1
							current_file.put_integer (unique_count)
							current_file.put_character (')')
							current_file.put_character (')')
						else
							print_type_cast (current_system.integer_type, current_file)
							current_file.put_character ('(')
							unique_count := unique_count + 1
							current_file.put_integer (unique_count)
							current_file.put_character (')')
						end
					end
				end
				if not l_printed then
					l_dynamic_feature := a_target_type.dynamic_query (l_query, current_system)
					l_attribute ?= l_query
					if l_attribute /= Void then
						l_printed := True
						if a_target /= Void then
							print_attribute_name (l_dynamic_feature, a_target, a_target_type)
						else
							print_current_attribute_name (l_dynamic_feature)
						end
					elseif l_dynamic_feature.is_builtin then
						l_printed := True
						inspect l_dynamic_feature.builtin_code
						when builtin_any_same_type then
							print_builtin_any_same_type_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_any_standard_is_equal then
							print_builtin_any_standard_is_equal_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_any_generator then
							print_builtin_any_generator_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_any_generating_type then
							print_builtin_any_generating_type_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_special_item then
							print_builtin_special_item_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_special_count then
							print_builtin_special_count_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_special_element_size then
							print_builtin_special_element_size_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_character_code then
							print_builtin_character_code_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_character_lt then
							print_builtin_character_lt_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_character_gt then
							print_builtin_character_gt_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_character_le then
							print_builtin_character_le_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_character_ge then
							print_builtin_character_ge_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_plus then
							print_builtin_integer_plus_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_minus then
							print_builtin_integer_minus_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_times then
							print_builtin_integer_times_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_divide then
							print_builtin_integer_divide_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_div then
							print_builtin_integer_div_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_mod then
							print_builtin_integer_mod_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_lt then
							print_builtin_integer_lt_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_gt then
							print_builtin_integer_gt_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_le then
							print_builtin_integer_le_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_ge then
							print_builtin_integer_ge_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_opposite then
							print_builtin_integer_opposite_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_to_character then
							print_builtin_integer_to_character_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_bit_or then
							print_builtin_integer_bit_or_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_integer_bit_shift_left then
							print_builtin_integer_bit_shift_left_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_and then
							print_builtin_boolean_and_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_and_then then
							print_builtin_boolean_and_then_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_or then
							print_builtin_boolean_or_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_or_else then
							print_builtin_boolean_or_else_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_xor then
							print_builtin_boolean_xor_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_implies then
							print_builtin_boolean_implies_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_not then
							print_builtin_boolean_not_call (a_target_type, a_target, a_name, an_actuals)
						when builtin_boolean_item then
							print_builtin_boolean_item_call (l_dynamic_feature, a_target_type, a_target, a_name, an_actuals)
						else
							l_printed := False
						end
					end
					if not l_printed then
						if not l_dynamic_feature.is_generated then
							l_dynamic_feature.set_generated (True)
							called_features.force_last (l_dynamic_feature)
						end
						print_routine_name (l_dynamic_feature, a_target_type, current_file)
						current_file.put_character ('(')
						if a_target /= Void then
							print_expression (a_target)
						else
							current_file.put_character ('C')
						end
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								current_file.put_character (',')
								current_file.put_character (' ')
								print_expression (an_actuals.actual_argument (i))
								i := i + 1
							end
						end
						current_file.put_character (')')
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
		do
			if a_constant.is_integer_8 then
				print_type_cast (current_system.integer_8_type, current_file)
			elseif a_constant.is_integer_16 then
				print_type_cast (current_system.integer_16_type, current_file)
			elseif a_constant.is_integer_32 then
				print_type_cast (current_system.integer_32_type, current_file)
			elseif a_constant.is_integer_64 then
				print_type_cast (current_system.integer_64_type, current_file)
			elseif a_constant.is_natural then
				print_type_cast (current_system.natural_type, current_file)
			elseif a_constant.is_natural_8 then
				print_type_cast (current_system.natural_8_type, current_file)
			elseif a_constant.is_natural_16 then
				print_type_cast (current_system.natural_16_type, current_file)
			elseif a_constant.is_natural_32 then
				print_type_cast (current_system.natural_32_type, current_file)
			elseif a_constant.is_natural_64 then
				print_type_cast (current_system.natural_64_type, current_file)
			else
				print_type_cast (current_system.integer_type, current_file)
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
			else
				if l_negative and (nb - i + 1) >= 10 then
					create l_buffer.make (nb - i + 1)
					from until i > nb loop
						l_buffer.append_character (l_literal.item (i))
						i := i + 1
					end
					if l_buffer.is_equal ("2147483648") then
						current_file.put_string ("2147483647-1")
					else
						current_file.put_string (l_buffer)
					end
				else
					from until i > nb loop
						current_file.put_character (l_literal.item (i))
						i := i + 1
					end
				end
			end
			current_file.put_character (')')
		end

	print_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_string: STRING
		do
			l_string := a_string.value
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if a_constant.is_real_32 then
				print_type_cast (current_system.real_type, current_file)
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

	print_result (an_expression: ET_RESULT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			current_file.put_character ('R')
		end

	print_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_local_index: INTEGER
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			a_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			a_dynamic_type: ET_DYNAMIC_TYPE
		do
-- TODO: TYPED_POINTER vs. POINTER.
print ("ET_C_GENERATOR.print_result_address%N")
			a_dynamic_type_set := current_feature.dynamic_type_set (an_expression)
			if a_dynamic_type_set = Void then
					-- Internal error: the dynamic type set of `an_expression'
					-- should be known atthis stage.
				set_fatal_error
				error_handler.report_gibdj_error
			else
				a_dynamic_type := a_dynamic_type_set.static_type
				local_count := local_count + 1
				l_local_index := local_count
				print_typed_pointer_local_declaration (l_local_index, a_dynamic_type)
				l_result_type_set := current_feature.result_type_set
				if l_result_type_set = Void then
						-- Internal error: it should have been checked elsewhere that
						-- the current feature is a function.
					set_fatal_error
					error_handler.report_gibdk_error
				elseif l_result_type_set.static_type.is_expanded then
--					current_file.put_character ('&')
--					current_file.put_character ('R')
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
				else
--					current_file.put_character ('R')
					current_file.put_character ('z')
					current_file.put_integer (l_local_index)
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
			l_string := a_string.value
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_type: ET_TYPE
			a_resolved_type: ET_TYPE
			a_target_type: ET_DYNAMIC_TYPE
			a_query: ET_QUERY
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
			a_seed: INTEGER
			i, nb: INTEGER
		do
			a_type := an_expression.type
			a_resolved_type := resolved_formal_parameters (a_type)
			if not has_fatal_error then
				a_target_type := current_system.dynamic_type (a_resolved_type, current_type.base_type)
				a_seed := an_expression.name.seed
				a_query := a_target_type.base_class.seeded_query (a_seed)
				if a_query = Void then
						-- Internal error: there should be a query with `a_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_gibdd_error
				elseif a_query.is_attribute then
						-- Internal error: no object available.
					set_fatal_error
					error_handler.report_gibdl_error
				elseif a_query.is_constant_attribute then
-- TODO: make the difference between expanded and reference "constants".
					a_constant_attribute ?= a_query
					if a_constant_attribute = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_gibde_error
					else
						a_constant_attribute.constant.process (Current)
					end
				elseif a_query.is_unique_attribute then
-- TODO.
					print_type_cast (current_system.integer_type, current_file)
					current_file.put_character ('(')
					unique_count := unique_count + 1
					current_file.put_integer (unique_count)
					current_file.put_character (')')
				else
					l_dynamic_feature := a_target_type.dynamic_query (a_query, current_system)
					if not l_dynamic_feature.is_generated then
						l_dynamic_feature.set_generated (True)
						called_features.force_last (l_dynamic_feature)
					end
					print_static_routine_name (l_dynamic_feature, a_target_type, current_file)
					current_file.put_character ('(')
					an_actuals := an_expression.arguments
					if an_actuals /= Void then
						nb := an_actuals.count
						from i := 1 until i > nb loop
							if i > 1 then
								current_file.put_character (',')
								current_file.put_character (' ')
							end
							print_expression (an_actuals.actual_argument (i))
							i := i + 1
						end
					end
					current_file.put_character (')')
				end
			end
		end

	print_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_strip_expression%N")
			current_file.put_string (c_eif_void)
		end

	print_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			current_file.put_string (c_eif_true)
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
		do
			if a_constant.is_integer_8 then
				print_type_cast (current_system.integer_8_type, current_file)
			elseif a_constant.is_integer_16 then
				print_type_cast (current_system.integer_16_type, current_file)
			elseif a_constant.is_integer_32 then
				print_type_cast (current_system.integer_32_type, current_file)
			elseif a_constant.is_integer_64 then
				print_type_cast (current_system.integer_64_type, current_file)
			elseif a_constant.is_natural then
				print_type_cast (current_system.natural_type, current_file)
			elseif a_constant.is_natural_8 then
				print_type_cast (current_system.natural_8_type, current_file)
			elseif a_constant.is_natural_16 then
				print_type_cast (current_system.natural_16_type, current_file)
			elseif a_constant.is_natural_32 then
				print_type_cast (current_system.natural_32_type, current_file)
			elseif a_constant.is_natural_64 then
				print_type_cast (current_system.natural_64_type, current_file)
			else
				print_type_cast (current_system.integer_type, current_file)
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
						current_file.put_string ("2147483647-1")
					else
						current_file.put_string (l_buffer)
					end
				else
					from until i > nb loop
						if l_literal.item (i) /= '_' then
							current_file.put_character (l_literal.item (i))
						end
						i := i + 1
					end
				end
			end
			current_file.put_character (')')
		end

	print_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			i, nb: INTEGER
			l_literal: STRING
		do
			if a_constant.is_real_32 then
				print_type_cast (current_system.real_type, current_file)
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

	print_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			l_string: STRING
		do
			l_string := a_string.value
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_void (an_expression: ET_VOID) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			current_file.put_string (c_eif_void)
		end

	print_writable (a_writable: ET_WRITABLE) is
			-- Print `a_writable'.
		require
			a_writable_not_void: a_writable /= Void
		do
			a_writable.process (Current)
		end

feature {NONE} -- Agent generation

	print_call_agent (an_expression: ET_CALL_AGENT) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		local
			a_name: ET_FEATURE_NAME
			an_arguments: ET_AGENT_ARGUMENT_OPERANDS
			a_target: ET_AGENT_TARGET
			an_expression_target: ET_EXPRESSION
			a_type_target: ET_TARGET_TYPE
			an_any: ANY
		do
			a_name := an_expression.name
			an_arguments := an_expression.arguments
			a_target := an_expression.target
			if a_target = Void then
				print_unqualified_call_agent (a_name, an_arguments)
			else
				-- SmartEiffel 1.1 does not allow the assignment attempt
				-- because ET_EXPRESSION does not conform to ET_AGENT_TARGET.
				-- an_expression_target ?= a_target
				an_any := a_target
				an_expression_target ?= an_any
				if an_expression_target /= Void then
					print_qualified_call_agent (an_expression_target, a_name, an_arguments)
				else
					-- SmartEiffel 2.1 does not allow the assignment attempt
					-- because ET_TARGET_TYPE does not conform to ET_AGENT_TARGET.
					-- a_type_target ?= a_target
					an_any := a_target
					a_type_target ?= an_any
					if a_type_target /= Void then
						print_typed_call_agent (a_type_target.type, a_name, an_arguments)
					else
							-- Internal error: no other kind of targets.
						set_fatal_error
-- TODO
--						error_handler.report_giaca_error
					end
				end
			end
		end

	print_unqualified_call_agent (a_name: ET_FEATURE_NAME; an_actuals: ET_AGENT_ARGUMENT_OPERANDS) is
			-- Print unqualified call agent.
		require
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

	print_qualified_call_agent (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ARGUMENT_OPERANDS) is
			-- Print qualified call agent.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

	print_typed_call_agent (a_type: ET_TYPE; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ARGUMENT_OPERANDS) is
			-- Print typed call agent.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

feature {NONE} -- Polymorphic call generation

	print_polymorphic_queries is
			-- Print polymorphic queries.
		local
			i, nb: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL
			l_call: ET_CALL_COMPONENT
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_argument_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			l_type: ET_TYPE
			l_base_type: ET_BASE_TYPE
			l_query: ET_QUERY
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_seed: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_switch: BOOLEAN
			l_equivalent_feature1: ET_DYNAMIC_FEATURE
			l_equivalent_types1: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_equivalent_feature2: ET_DYNAMIC_FEATURE
			l_equivalent_types2: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_equivalent_feature3: ET_DYNAMIC_FEATURE
			l_equivalent_types3: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_other_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			k, nb3: INTEGER
		do
			nb := polymorphic_query_calls.count
			from i := last_polymorphic_query_index until i > nb loop
				l_polymorphic_call := polymorphic_query_calls.item (i)
				l_call := l_polymorphic_call.static_call
				l_seed := l_call.name.seed
				l_target_type_set := l_polymorphic_call.target_type_set
				l_base_type := l_target_type_set.static_type.base_type
				l_dynamic_type := l_target_type_set.first_type
				l_other_dynamic_types := l_target_type_set.other_types
				if l_dynamic_type /= Void and l_other_dynamic_types /= Void then
					l_query := l_dynamic_type.base_class.seeded_query (l_seed)
					if l_query = Void then
							-- Internal error: there should be a query with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibiz_error
					else
							-- Print feature signature.
						header_file.put_string (c_extern)
						header_file.put_character (' ')
						l_type := l_query.type
						l_result_type := current_system.dynamic_type (l_type, l_base_type)
						print_type_declaration (l_result_type, header_file)
						print_type_declaration (l_result_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						header_file.put_character ('Y')
						current_file.put_character ('Y')
						header_file.put_integer (i)
						current_file.put_integer (i)
						header_file.put_character ('(')
						current_file.put_character ('(')
						print_type_declaration (l_target_type_set.static_type, header_file)
						print_type_declaration (l_target_type_set.static_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						header_file.put_character ('C')
						current_file.put_character ('C')
						l_actuals := Void
						l_arguments := l_query.arguments
						if l_arguments /= Void then
							nb2 := l_arguments.count
							if nb2 > 0 then
								l_actuals := internal_formal_arguments (nb2)
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
									header_file.put_character ('a')
									current_file.put_character ('a')
									header_file.put_integer (j)
									current_file.put_integer (j)
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
						resolve_polymorphic_query_call (l_target_type_set, l_seed)
						l_equivalent_feature1 := polymorphic_equivalent_feature1
						l_equivalent_feature2 := polymorphic_equivalent_feature2
						l_equivalent_feature3 := polymorphic_equivalent_feature3
						if l_equivalent_feature1 /= Void and l_equivalent_feature2 = Void then
								-- Static binding.
							print_indentation
							current_file.put_string (c_return)
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_query_call (l_dynamic_type, tokens.current_keyword, l_call.name, l_actuals)
							current_file.put_character (')')
							current_file.put_character (';')
							current_file.put_new_line
						elseif l_equivalent_feature1 /= Void and l_other_dynamic_types.count > 10 then
							l_equivalent_types1 := polymorphic_equivalent_types1
							l_equivalent_types2 := polymorphic_equivalent_types2
							l_equivalent_types3 := polymorphic_equivalent_types3
							print_indentation
							current_file.put_string (c_int)
							current_file.put_character (' ')
							current_file.put_character ('z')
							current_file.put_character ('1')
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('C')
							current_file.put_string (c_arrow)
							current_file.put_string (c_id)
							current_file.put_character (';')
							current_file.put_new_line
							l_types := l_equivalent_types1
							if l_types.count < l_equivalent_types2.count then
								l_types := l_equivalent_types2
							end
							if l_equivalent_feature3 /= Void and then l_types.count < l_equivalent_types3.count then
								l_types := l_equivalent_types3
							end
							from
								j := 1
								l_other_types := l_equivalent_types1
							until
								l_other_types = Void
							loop
								if l_other_types /= l_types then
									nb3 := l_other_types.count
									from k := 1 until k > nb3 loop
										if j = 1 and k = 1 then
											print_indentation
										end
										current_file.put_string (c_if)
										current_file.put_character (' ')
										current_file.put_character ('(')
										current_file.put_character ('z')
										current_file.put_character ('1')
										current_file.put_character ('=')
										current_file.put_character ('=')
										current_file.put_integer (l_other_types.item (k).id)
										current_file.put_character (')')
										current_file.put_character (' ')
										current_file.put_character ('{')
										current_file.put_new_line
										indent
										print_indentation
										current_file.put_string (c_return)
										current_file.put_character (' ')
										current_file.put_character ('(')
										print_query_call (l_other_types.item (k), tokens.current_keyword, l_call.name, l_actuals)
										current_file.put_character (')')
										current_file.put_character (';')
										current_file.put_new_line
										dedent
										print_indentation
										current_file.put_character ('}')
										current_file.put_character (' ')
										current_file.put_string (c_else)
										current_file.put_character (' ')
										k := k + 1
									end
								end
								j := j + 1
								if j = 2 then
									l_other_types := l_equivalent_types2
								elseif j = 3 and l_equivalent_feature3 /= Void then
									l_other_types := l_equivalent_types3
								else
									l_other_types := Void
								end
							end
							current_file.put_character ('{')
							current_file.put_new_line
							indent
							print_indentation
							current_file.put_string (c_return)
							current_file.put_character (' ')
							current_file.put_character ('(')
							print_query_call (l_types.first, tokens.current_keyword, l_call.name, l_actuals)
							current_file.put_character (')')
							current_file.put_character (';')
							current_file.put_new_line
							dedent
							print_indentation
							current_file.put_character ('}')
							current_file.put_new_line
						elseif l_switch then
								-- Use switch statement.
							from
								j := 1
								if l_other_dynamic_types /= Void then
									nb2 := l_other_dynamic_types.count
								else
									nb2 := 0
								end
								print_indentation
								current_file.put_string (c_switch)
								current_file.put_character (' ')
								current_file.put_character ('(')
								current_file.put_character ('C')
								current_file.put_string (c_arrow)
								current_file.put_string (c_id)
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
								print_indentation
								current_file.put_string (c_return)
								current_file.put_character (' ')
								current_file.put_character ('(')
								print_query_call (l_dynamic_type, tokens.current_keyword, l_call.name, l_actuals)
								current_file.put_character (')')
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
						else
							print_indentation
							current_file.put_string (c_int)
							current_file.put_character (' ')
							current_file.put_character ('z')
							current_file.put_character ('1')
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('C')
							current_file.put_string (c_arrow)
							current_file.put_string (c_id)
							current_file.put_character (';')
							current_file.put_new_line
								-- Use binary search.
							polymorphic_type_ids.force_last (l_dynamic_type.id)
							polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
							if l_other_dynamic_types /= Void then
								nb2 := l_other_dynamic_types.count
								from j := 1 until j > nb2 loop
									l_dynamic_type := l_other_dynamic_types.item (j)
									polymorphic_type_ids.force_last (l_dynamic_type.id)
									polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
									j := j + 1
								end
							end
							polymorphic_type_ids.sort (polymorphic_type_id_sorter)
							print_binary_search_polymorphic_calls (l_call, tokens.current_keyword, l_actuals, l_result_type, 1, polymorphic_type_ids.count)
							polymorphic_type_ids.wipe_out
							polymorphic_types.wipe_out
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
					end
				end
				wipe_out_polymorphic_equivalent_features
				i := i + 1
			end
			last_polymorphic_query_index := i
		end

	print_polymorphic_procedures is
			-- Print polymorphic procedures.
		local
			i, nb: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL
			l_call: ET_CALL_COMPONENT
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_argument_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			l_base_type: ET_BASE_TYPE
			l_procedure: ET_PROCEDURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_seed: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_switch: BOOLEAN
			l_equivalent_feature1: ET_DYNAMIC_FEATURE
			l_equivalent_types1: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_equivalent_feature2: ET_DYNAMIC_FEATURE
			l_equivalent_types2: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_equivalent_feature3: ET_DYNAMIC_FEATURE
			l_equivalent_types3: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_other_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			k, nb3: INTEGER
		do
			nb := polymorphic_procedure_calls.count
			from i := last_polymorphic_procedure_index until i > nb loop
				l_polymorphic_call := polymorphic_procedure_calls.item (i)
				l_call := l_polymorphic_call.static_call
				l_seed := l_call.name.seed
				l_target_type_set := l_polymorphic_call.target_type_set
				l_base_type := l_target_type_set.static_type.base_type
				l_dynamic_type := l_target_type_set.first_type
				l_other_dynamic_types := l_target_type_set.other_types
				if l_dynamic_type /= Void and l_other_dynamic_types /= Void then
					l_procedure := l_dynamic_type.base_class.seeded_procedure (l_seed)
					if l_procedure = Void then
							-- Internal error: there should be a procedure with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_giaed_error
					else
							-- Print feature signature.
						header_file.put_string (c_extern)
						header_file.put_character (' ')
						header_file.put_string (c_void)
						current_file.put_string (c_void)
						header_file.put_character (' ')
						current_file.put_character (' ')
						header_file.put_character ('X')
						current_file.put_character ('X')
						header_file.put_integer (i)
						current_file.put_integer (i)
						header_file.put_character ('(')
						current_file.put_character ('(')
						print_type_declaration (l_target_type_set.static_type, header_file)
						print_type_declaration (l_target_type_set.static_type, current_file)
						header_file.put_character (' ')
						current_file.put_character (' ')
						header_file.put_character ('C')
						current_file.put_character ('C')
						l_actuals := Void
						l_arguments := l_procedure.arguments
						if l_arguments /= Void then
							nb2 := l_arguments.count
							if nb2 > 0 then
								l_actuals := internal_formal_arguments (nb2)
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
									header_file.put_character ('a')
									current_file.put_character ('a')
									header_file.put_integer (j)
									current_file.put_integer (j)
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
						resolve_polymorphic_procedure_call (l_target_type_set, l_seed)
						l_equivalent_feature1 := polymorphic_equivalent_feature1
						l_equivalent_feature2 := polymorphic_equivalent_feature2
						l_equivalent_feature3 := polymorphic_equivalent_feature3
						if l_equivalent_feature1 /= Void and l_equivalent_feature2 = Void then
								-- Static binding.
							print_indentation
							print_procedure_call (l_dynamic_type, tokens.current_keyword, l_call.name, l_actuals)
							current_file.put_new_line
						elseif l_equivalent_feature1 /= Void and l_other_dynamic_types.count > 10 then
							l_equivalent_types1 := polymorphic_equivalent_types1
							l_equivalent_types2 := polymorphic_equivalent_types2
							l_equivalent_types3 := polymorphic_equivalent_types3
							print_indentation
							current_file.put_string (c_int)
							current_file.put_character (' ')
							current_file.put_character ('z')
							current_file.put_character ('1')
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('C')
							current_file.put_string (c_arrow)
							current_file.put_string (c_id)
							current_file.put_character (';')
							current_file.put_new_line
							l_types := l_equivalent_types1
							if l_types.count < l_equivalent_types2.count then
								l_types := l_equivalent_types2
							end
							if l_equivalent_feature3 /= Void and then l_types.count < l_equivalent_types3.count then
								l_types := l_equivalent_types3
							end
							from
								j := 1
								l_other_types := l_equivalent_types1
							until
								l_other_types = Void
							loop
								if l_other_types /= l_types then
									nb3 := l_other_types.count
									from k := 1 until k > nb3 loop
										if j = 1 and k = 1 then
											print_indentation
										end
										current_file.put_string (c_if)
										current_file.put_character (' ')
										current_file.put_character ('(')
										current_file.put_character ('z')
										current_file.put_character ('1')
										current_file.put_character ('=')
										current_file.put_character ('=')
										current_file.put_integer (l_other_types.item (k).id)
										current_file.put_character (')')
										current_file.put_character (' ')
										current_file.put_character ('{')
										current_file.put_new_line
										indent
										print_indentation
										print_procedure_call (l_other_types.item (k), tokens.current_keyword, l_call.name, l_actuals)
										current_file.put_new_line
										dedent
										print_indentation
										current_file.put_character ('}')
										current_file.put_character (' ')
										current_file.put_string (c_else)
										current_file.put_character (' ')
										k := k + 1
									end
								end
								j := j + 1
								if j = 2 then
									l_other_types := l_equivalent_types2
								elseif j = 3 and l_equivalent_feature3 /= Void then
									l_other_types := l_equivalent_types3
								else
									l_other_types := Void
								end
							end
							current_file.put_character ('{')
							current_file.put_new_line
							indent
							print_indentation
							print_procedure_call (l_types.first, tokens.current_keyword, l_call.name, l_actuals)
							current_file.put_new_line
							dedent
							print_indentation
							current_file.put_character ('}')
							current_file.put_new_line
						elseif l_switch then
								-- Use switch statement.
							from
								j := 1
								if l_other_dynamic_types /= Void then
									nb2 := l_other_dynamic_types.count
								else
									nb2 := 0
								end
								print_indentation
								current_file.put_string (c_switch)
								current_file.put_character (' ')
								current_file.put_character ('(')
								current_file.put_character ('C')
								current_file.put_string (c_arrow)
								current_file.put_string (c_id)
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
								print_indentation
								print_procedure_call (l_dynamic_type, tokens.current_keyword, l_call.name, l_actuals)
								current_file.put_new_line
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
						else
							print_indentation
							current_file.put_string (c_int)
							current_file.put_character (' ')
							current_file.put_character ('z')
							current_file.put_character ('1')
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('C')
							current_file.put_string (c_arrow)
							current_file.put_string (c_id)
							current_file.put_character (';')
							current_file.put_new_line
								-- Use binary search.
							polymorphic_type_ids.force_last (l_dynamic_type.id)
							polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
							if l_other_dynamic_types /= Void then
								nb2 := l_other_dynamic_types.count
								from j := 1 until j > nb2 loop
									l_dynamic_type := l_other_dynamic_types.item (j)
									polymorphic_type_ids.force_last (l_dynamic_type.id)
									polymorphic_types.force_last (l_dynamic_type, l_dynamic_type.id)
									j := j + 1
								end
							end
							polymorphic_type_ids.sort (polymorphic_type_id_sorter)
							print_binary_search_polymorphic_calls (l_call, tokens.current_keyword, l_actuals, Void, 1, polymorphic_type_ids.count)
							polymorphic_type_ids.wipe_out
							polymorphic_types.wipe_out
						end
						dedent
						current_file.put_character ('}')
						current_file.put_new_line
						current_file.put_new_line
					end
				end
				wipe_out_polymorphic_equivalent_features
				i := i + 1
			end
			last_polymorphic_procedure_index := i
		end

	print_binary_search_polymorphic_calls (a_call: ET_CALL_COMPONENT; a_target: ET_EXPRESSION;
		an_actuals: ET_ACTUAL_ARGUMENTS; a_result_type: ET_DYNAMIC_TYPE; l, u: INTEGER) is
			-- Print code for actions indexed from `l' to `u'
			-- to `a_file'. The generated code uses binary search
			-- to find out which action to execute.
		require
			a_call_not_void: a_call /= Void
			a_target_not_void: a_target /= Void
			an_actuals_not_void: an_actuals /= Void
			l_large_enough: l >= 1
			l_small_enough: l <= u
			u_small_enough: u <= polymorphic_type_ids.count
		local
			t: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_type_id: INTEGER
		do
			if l = u then
				l_type_id := polymorphic_type_ids.item (l)
				l_dynamic_type := polymorphic_types.item (l_type_id)
				print_indentation
				if a_result_type /= Void then
					current_file.put_string (c_return)
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_query_call (l_dynamic_type, a_target, a_call.name, an_actuals)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_target, a_call.name, an_actuals)
				end
				current_file.put_new_line
			elseif l + 1 = u then
				l_type_id := polymorphic_type_ids.item (l)
				l_dynamic_type := polymorphic_types.item (l_type_id)
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_character ('z')
				current_file.put_character ('1')
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
					print_query_call (l_dynamic_type, a_target, a_call.name, an_actuals)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_target, a_call.name, an_actuals)
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
					print_query_call (l_dynamic_type, a_target, a_call.name, an_actuals)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					print_procedure_call (l_dynamic_type, a_target, a_call.name, an_actuals)
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
				current_file.put_character ('z')
				current_file.put_character ('1')
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_integer (l_type_id)
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_binary_search_polymorphic_calls (a_call, a_target, an_actuals, a_result_type, l, t)
				current_file.put_character ('}')
				current_file.put_character (' ')
				current_file.put_string (c_else)
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				print_binary_search_polymorphic_calls (a_call, a_target, an_actuals, a_result_type, t + 1, u)
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

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

	last_polymorphic_query_index: INTEGER
	last_polymorphic_procedure_index: INTEGER

	resolve_polymorphic_query_call (a_target_type_set: ET_DYNAMIC_TYPE_SET; a_seed: INTEGER) is
			-- Try to find similarities between the queries with seed `a_seed'
			-- in the various types of `a_target_type_set' and group them by
			-- equivalence classes in (`polymorphic_equivalent_featureN',
			-- `polymorphic_equivalent_typesN') where 1<=N<=3, or leave the
			-- `polymorphic_equivalent_featuresN' Void if there are more
			-- than N equivalence classes.
		require
			a_target_type_set_not_void: a_target_type_set /= Void
			not_call_on_void_target: a_target_type_set.first_type /= Void
			polymorphic_call: a_target_type_set.other_types /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_feature1: ET_DYNAMIC_FEATURE
			l_feature2: ET_DYNAMIC_FEATURE
			l_feature3: ET_DYNAMIC_FEATURE
			l_static_feature: ET_FEATURE
			l_static_feature1: ET_FEATURE
			l_static_feature2: ET_FEATURE
			l_static_feature3: ET_FEATURE
			i, nb: INTEGER
			l_new: BOOLEAN
			l_found: BOOLEAN
		do
			l_type := a_target_type_set.first_type
			l_feature := l_type.seeded_dynamic_query (a_seed, current_system)
			if l_feature = Void then
					-- Internal error: there should be a query with that seed.
				set_fatal_error
				error_handler.report_giabr_error
			else
				l_found := True
				l_feature1 := l_feature
				l_static_feature1 := l_feature1.static_feature.implementation_feature
				polymorphic_equivalent_types1.force_last (l_type)
				l_other_types := a_target_type_set.other_types
				nb := l_other_types.count
				from i := 1 until i > nb loop
					l_type := l_other_types.item (i)
					l_feature := l_type.seeded_dynamic_query (a_seed, current_system)
					if l_feature = Void then
							-- Internal error: there should be a query with that seed.
						set_fatal_error
						error_handler.report_giady_error
						l_found := False
						i := nb + 1 -- Jump out of the loop.
					else
						l_new := True
						l_static_feature := l_feature.static_feature.implementation_feature
-- TODO: The following implementation to find out whether features are
-- polymorphically equivalent or not does not work if the feature
-- contains code of the form 'a.f' where the dynamic type set of
-- `a' is different in the various types of `a_target_type_set'.
--						if l_feature.is_current_type_needed then
--							-- New equivalence class.
--						elseif not l_feature1.is_current_type_needed and then l_static_feature1 = l_static_feature then
--							polymorphic_equivalent_types1.force_last (l_type)
--							l_new := False
--						elseif l_feature2 /= Void then
--							if not l_feature2.is_current_type_needed and then l_static_feature2 = l_static_feature then
--								polymorphic_equivalent_types2.force_last (l_type)
--									l_new := False
--							elseif l_feature3 /= Void then
--								if not l_feature3.is_current_type_needed and then l_static_feature3 = l_static_feature then
--									polymorphic_equivalent_types3.force_last (l_type)
--									l_new := False
--								end
--							end
--						end
						if l_new then
							if l_feature2 = Void then
								l_feature2 := l_feature
								l_static_feature2 := l_static_feature
								polymorphic_equivalent_types2.force_last (l_type)
							elseif l_feature3 = Void then
								l_feature3 := l_feature
								l_static_feature3 := l_static_feature
								polymorphic_equivalent_types3.force_last (l_type)
							else
									-- Too many equivalence classes.
								l_found := False
								i := nb + 1
							end
						end
					end
					i := i + 1
				end
				if l_found then
					polymorphic_equivalent_feature1 := l_feature1
					polymorphic_equivalent_feature2 := l_feature2
					polymorphic_equivalent_feature3 := l_feature3
				else
					polymorphic_equivalent_types1.wipe_out
					polymorphic_equivalent_types2.wipe_out
					polymorphic_equivalent_types3.wipe_out
				end
			end
		end

	resolve_polymorphic_procedure_call (a_target_type_set: ET_DYNAMIC_TYPE_SET; a_seed: INTEGER) is
			-- Try to find similarities between the procedures with seed `a_seed'
			-- in the various types of `a_target_type_set' and group them by
			-- equivalence classes in (`polymorphic_equivalent_featureN',
			-- `polymorphic_equivalent_typesN') where 1<=N<=3, or leave the
			-- `polymorphic_equivalent_featuresN' Void if there are more
			-- than N equivalence classes.
		require
			a_target_type_set_not_void: a_target_type_set /= Void
			not_call_on_void_target: a_target_type_set.first_type /= Void
			polymorphic_call: a_target_type_set.other_types /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			l_feature1: ET_DYNAMIC_FEATURE
			l_feature2: ET_DYNAMIC_FEATURE
			l_feature3: ET_DYNAMIC_FEATURE
			l_static_feature: ET_FEATURE
			l_static_feature1: ET_FEATURE
			l_static_feature2: ET_FEATURE
			l_static_feature3: ET_FEATURE
			i, nb: INTEGER
			l_new: BOOLEAN
			l_found: BOOLEAN
		do
			l_type := a_target_type_set.first_type
			l_feature := l_type.seeded_dynamic_procedure (a_seed, current_system)
			if l_feature = Void then
					-- Internal error: there should be a procedure with that seed.
				set_fatal_error
				error_handler.report_gibbx_error
			else
				l_found := True
				l_feature1 := l_feature
				l_static_feature1 := l_feature1.static_feature.implementation_feature
				polymorphic_equivalent_types1.force_last (l_type)
				l_other_types := a_target_type_set.other_types
				nb := l_other_types.count
				from i := 1 until i > nb loop
					l_type := l_other_types.item (i)
					l_feature := l_type.seeded_dynamic_procedure (a_seed, current_system)
					if l_feature = Void then
							-- Internal error: there should be a procedure with that seed.
						set_fatal_error
						error_handler.report_gibed_error
						l_found := False
						i := nb + 1 -- Jump out of the loop.
					else
						l_new := True
						l_static_feature := l_feature.static_feature.implementation_feature
-- TODO: The following implementation to find out whether features are
-- polymorphically equivalent or not does not work if the feature
-- contains code of the form 'a.f' where the dynamic type set of
-- `a' is different in the various types of `a_target_type_set'.
--						if l_feature.is_current_type_needed then
--							-- New equivalence class.
--						elseif not l_feature1.is_current_type_needed and then l_static_feature1 = l_static_feature then
--							polymorphic_equivalent_types1.force_last (l_type)
--							l_new := False
--						elseif l_feature2 /= Void then
--							if not l_feature2.is_current_type_needed and then l_static_feature2 = l_static_feature then
--								polymorphic_equivalent_types2.force_last (l_type)
--									l_new := False
--							elseif l_feature3 /= Void then
--								if not l_feature3.is_current_type_needed and then l_static_feature3 = l_static_feature then
--									polymorphic_equivalent_types3.force_last (l_type)
--									l_new := False
--								end
--							end
--						end
						if l_new then
							if l_feature2 = Void then
								l_feature2 := l_feature
								l_static_feature2 := l_static_feature
								polymorphic_equivalent_types2.force_last (l_type)
							elseif l_feature3 = Void then
								l_feature3 := l_feature
								l_static_feature3 := l_static_feature
								polymorphic_equivalent_types3.force_last (l_type)
							else
									-- Too many equivalence classes.
								l_found := False
								i := nb + 1
							end
						end
					end
					i := i + 1
				end
				if l_found then
					polymorphic_equivalent_feature1 := l_feature1
					polymorphic_equivalent_feature2 := l_feature2
					polymorphic_equivalent_feature3 := l_feature3
				else
					polymorphic_equivalent_types1.wipe_out
					polymorphic_equivalent_types2.wipe_out
					polymorphic_equivalent_types3.wipe_out
				end
			end
		end

	wipe_out_polymorphic_equivalent_features is
			-- Wipe out structures generated by `resolve_polymorphic_call'.
		do
			polymorphic_equivalent_feature1 := Void
			polymorphic_equivalent_feature2 := Void
			polymorphic_equivalent_feature3 := Void
			polymorphic_equivalent_types1.wipe_out
			polymorphic_equivalent_types2.wipe_out
			polymorphic_equivalent_types3.wipe_out
		end

	polymorphic_equivalent_feature1: ET_DYNAMIC_FEATURE
	polymorphic_equivalent_types1: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
	polymorphic_equivalent_feature2: ET_DYNAMIC_FEATURE
	polymorphic_equivalent_types2: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
	polymorphic_equivalent_feature3: ET_DYNAMIC_FEATURE
	polymorphic_equivalent_types3: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			-- Equivalence classes for polymorphic calls

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
				current_file.put_character ('R')
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
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
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
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items.
-- TODO: should we rather call SPECIAL.copy?
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
			elseif
				current_type = current_system.character_type or
				current_type = current_system.boolean_type or
				current_type = current_system.integer_8_type or
				current_type = current_system.integer_16_type or
				current_type = current_system.integer_type or
				current_type = current_system.integer_64_type or
				current_type = current_system.real_type or
				current_type = current_system.double_type or
				current_type = current_system.pointer_type
			then
				print_indentation
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_character ('R')
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
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (current_type.id)
				current_file.put_character (';')
				current_file.put_new_line
--				print_indentation
--				if not current_type.is_expanded then
--					current_file.put_character ('*')
--				end
--				print_type_cast (current_type, current_file)
--				current_file.put_character ('(')
--				current_file.put_character ('R')
--				current_file.put_character (')')
--				current_file.put_character (' ')
--				current_file.put_character ('=')
--				current_file.put_character (' ')
--				if not current_type.is_expanded then
--					current_file.put_character ('*')
--				end
--				print_type_cast (current_type, current_file)
--				current_file.put_character ('(')
--				current_file.put_character ('C')
--				current_file.put_character (')')
--				current_file.put_character (';')
--				current_file.put_new_line
				l_copy_feature := current_type.seeded_dynamic_procedure (universe.copy_seed, current_system)
				if l_copy_feature = Void then
						-- Internal error: this error should already have been reported during parsing.
					set_fatal_error
					error_handler.report_gibic_error
				else
					if not l_copy_feature.is_generated then
						l_copy_feature.set_generated (True)
						called_features.force_last (l_copy_feature)
					end
					print_indentation
					print_routine_name (l_copy_feature, current_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('R')
					current_file.put_character (',')
					current_file.put_character (' ')
					current_file.put_character ('C')
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
				current_file.put_character ('R')
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
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
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
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items.
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character ('*')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_declaration (l_special_type.item_type_set.static_type, current_file)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
			elseif
				current_type = current_system.character_type or
				current_type = current_system.boolean_type or
				current_type = current_system.integer_8_type or
				current_type = current_system.integer_16_type or
				current_type = current_system.integer_type or
				current_type = current_system.integer_64_type or
				current_type = current_system.real_type or
				current_type = current_system.double_type or
				current_type = current_system.pointer_type
			then
				print_indentation
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_character ('R')
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
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
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
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			l_string := current_type.base_type.to_text
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
			current_file.put_character (';')
			l_special_type ?= current_type
			if l_special_type /= Void then
			elseif current_type = current_system.character_type then
			elseif current_type = current_system.boolean_type then
			elseif current_type = current_system.integer_8_type then
			elseif current_type = current_system.integer_16_type then
			elseif current_type = current_system.integer_type then
			elseif current_type = current_system.integer_64_type then
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

	print_builtin_any_same_type_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.same_type' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiw_error
			elseif
				a_target_type = current_system.character_type or
				a_target_type = current_system.boolean_type or
				a_target_type = current_system.integer_8_type or
				a_target_type = current_system.integer_16_type or
				a_target_type = current_system.integer_type or
				a_target_type = current_system.integer_64_type or
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
				current_file.put_string (c_eif_false)
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('T')
				current_file.put_character ('0')
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('T')
				current_file.put_character ('0')
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character (')')
			end
		end

	print_builtin_any_conforms_to_body (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print body of built-in feature 'ANY.conforms_to' to `current_file'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_found: BOOLEAN
		do
			current_file.put_string (c_switch)
			current_file.put_character (' ')
			current_file.put_character ('(')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_string (c_arrow)
			current_file.put_string (c_id)
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
				current_file.put_character ('R')
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
			current_file.put_character ('R')
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

	print_builtin_any_generator_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.generator' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_string: STRING
		do
			l_string := a_target_type.base_class.name.upper_name
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_generating_type_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.generating_type' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_string: STRING
		do
			l_string := a_target_type.base_type.to_text
			current_file.put_string ("gems(%"")
			print_escaped_string (l_string)
			current_file.put_string ("%", ")
			current_file.put_integer (l_string.count)
			current_file.put_character (')')
		end

	print_builtin_any_standard_is_equal_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.standard_is_equal' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibix_error
			elseif
				a_target_type = current_system.character_type or
				a_target_type = current_system.boolean_type or
				a_target_type = current_system.integer_8_type or
				a_target_type = current_system.integer_16_type or
				a_target_type = current_system.integer_type or
				a_target_type = current_system.integer_64_type or
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('!')
				current_file.put_string (c_memcmp)
				current_file.put_character ('(')
				if a_target_type.is_expanded then
					current_file.put_character ('&')
				end
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (',')
				current_file.put_character (' ')
				if a_target_type.is_expanded then
					current_file.put_character ('&')
				end
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
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
					current_file.put_character ('(')
					current_file.put_character ('(')
					print_type_cast (l_special_type, current_file)
					current_file.put_character ('(')
					if a_target /= Void then
						print_expression (a_target)
					else
						current_file.put_character ('C')
					end
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('>')
					current_file.put_character ('a')
					current_file.put_character ('1')
					current_file.put_character (')')
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

	print_builtin_any_standard_copy_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.standard_copy' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= a_target_type
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiy_error
			elseif l_special_type /= Void then
-- TODO: both objects have to be of the same type.
				print_indentation
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_type_name (current_system.integer_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('n')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_character ('n')
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
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
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (',')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type, current_file)
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('n')
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
				a_target_type = current_system.real_type or
				a_target_type = current_system.double_type or
				a_target_type = current_system.pointer_type
			then
-- TODO: thins does not work because we copy onto a copy of the object.
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_type_name (a_target_type, current_file)
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('(')
				current_file.put_character ('&')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (';')
			else
-- TODO: both objects have to be of the same type.
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
					print_type_cast (a_target_type, current_file)
					current_file.put_character ('(')
					if a_target /= Void then
						print_expression (a_target)
					else
						current_file.put_character ('C')
					end
					current_file.put_character (')')
				else
					current_file.put_character ('*')
					current_file.put_character ('(')
					print_type_name (a_target_type, current_file)
					current_file.put_character ('*')
					current_file.put_character (')')
					current_file.put_character ('(')
					current_file.put_character ('&')
					if a_target /= Void then
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (')')
					else
						current_file.put_character ('C')
					end
					current_file.put_character (')')
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (';')
			end
		end

	print_builtin_special_item_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiv_error
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character ('[')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (']')
			end
		end

	print_builtin_special_put_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.put' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiu_error
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character ('[')
				print_expression (an_actuals.actual_argument (2))
				current_file.put_character (']')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (';')
			end
		end

	print_builtin_special_count_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.count' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_target_type, current_file)
			current_file.put_character ('(')
			if a_target /= Void then
				print_expression (a_target)
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_character ('1')
		end

	print_builtin_special_element_size_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.element_size' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= a_target_type
			if l_special_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class SPECIAL (and its descendants).
				set_fatal_error
				error_handler.report_gibgm_error
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
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= current_type
			if l_special_type = Void then
					-- Internal error: this was already reported during parsing.
					-- This built-in can only be in class SPECIAL (and its descendants).
				set_fatal_error
				error_handler.report_gibjv_error
			else
				print_indentation
				print_type_declaration (current_system.integer_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('n')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_if)
				current_file.put_character (' ')
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character ('>')
				current_file.put_character ('n')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('{')
				current_file.put_new_line
				indent
					-- Need to allocate a new object.
				print_indentation
				current_file.put_character ('R')
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
				current_file.put_character ('a')
				current_file.put_character ('1')
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
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not l_special_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy old items.
				print_indentation
				current_file.put_string (c_memcpy)
				current_file.put_character ('(')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (',')
				current_file.put_character (' ')
				current_file.put_character (' ')
				current_file.put_character ('n')
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
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				print_indentation
				current_file.put_character ('}')
				current_file.put_new_line
					-- Set new count.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_character_code_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.code' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			if a_target /= Void then
				print_expression (a_target)
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_character_lt_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.infix "<"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjd_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_character_gt_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.infix ">"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibje_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('>')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_character_le_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.infix "<="' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjf_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_character_ge_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.infix ">="' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjg_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('>')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_plus_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "+"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibda_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('+')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_minus_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "-"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibir_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('-')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_times_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "*"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiq_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_divide_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "/"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibip_error
			else
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character ('/')
				print_type_cast (current_system.double_type, current_file)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_div_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "//"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibio_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('/')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_mod_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "\\"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibin_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('%%')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_opposite_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.prefix "-"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('-')
			if a_target /= Void then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_integer_lt_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "<"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibcz_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_gt_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix ">"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjh_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('>')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_le_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "<="' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibji_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('<')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_ge_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix ">="' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjj_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('>')
				current_file.put_character ('=')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_to_character_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.to_character' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			print_type_cast (current_system.character_type, current_file)
			current_file.put_character ('(')
			if a_target /= Void then
				print_expression (a_target)
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_integer_bit_or_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.bit_or' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibit_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_bit_shift_left_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.bit_shift_left' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibis_error
			else
				print_type_cast (current_system.integer_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('<')
				current_file.put_character ('<')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_and_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "and"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjk_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('&')
				current_file.put_character ('&')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_and_then_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "and then"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdf_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('&')
				current_file.put_character ('&')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_or_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "or"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjl_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_or_else_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "or else"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdh_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_implies_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "implies"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdi_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('!')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character ('|')
				current_file.put_character ('|')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_xor_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "xor"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibjm_error
			else
				print_type_cast (current_system.boolean_type, current_file)
				current_file.put_character ('(')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character ('^')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_boolean_not_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.prefix "not"' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			print_type_cast (current_system.boolean_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('!')
			if a_target /= Void then
				current_file.put_character ('(')
				print_expression (a_target)
				current_file.put_character (')')
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_boolean_item_call (a_feature: ET_DYNAMIC_FEATURE; a_target_type: ET_DYNAMIC_TYPE;
		a_target: ET_EXPRESSION; a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print to `current_file' a call (static binding) to built-in
			-- feature `a_feature' corresponding to 'BOOLEAN_REF.item'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		do
			if a_target_type = current_system.boolean_type then
					-- Current value.
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
			else
					-- Internal attribute.
				if a_target /= Void then
					print_attribute_name (a_feature, a_target, a_target_type)
				else
					print_current_attribute_name (a_feature)
				end
			end
		end

	print_builtin_boolean_set_item_call (a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION;
		a_name: ET_CALL_NAME; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN_REF.set_item' (static binding) to `current_file'.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_target_type_not_void: a_target_type /= Void
			a_name_not_void: a_name /= Void
		local
			l_queries: ET_DYNAMIC_FEATURE_LIST
			l_query: ET_DYNAMIC_FEATURE
			l_item_attribute: ET_DYNAMIC_FEATURE
			i, nb: INTEGER
		do
			if a_target_type = current_system.boolean_type then
					-- Set current value.
				current_file.put_character ('*')
				current_file.put_character ('(')
				current_file.put_character ('&')
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (')')
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (';')
			else
				l_queries := a_target_type.queries
				nb := l_queries.count
				from i := 1 until i > nb loop
					l_query := l_queries.item (i)
					if l_query.builtin_code = builtin_boolean_item then
						l_item_attribute := l_query
						i := nb + 1
					else
						i := i + 1
					end
				end
				if l_item_attribute /= Void then
						-- Set the built-in attribute.
					if a_target /= Void then
						print_attribute_name (l_item_attribute, a_target, a_target_type)
					else
						print_current_attribute_name (l_item_attribute)
					end
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_actuals.actual_argument (1))
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
				current_file.put_string (" l1;")
				current_file.put_new_line
				print_indentation
				current_file.put_line ("geargc = argc;")
				print_indentation
				current_file.put_line ("geargv = argv;")
				print_indentation
				current_file.put_line ("geconst();")
				print_indentation
				current_file.put_string ("l1 = ")
				print_creation_expression (l_root_type, l_root_creation, Void)
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
		do
			current_file.put_line ("T0* gems(char* s, int c)")
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			print_indentation
			current_file.put_line ("T0* a;")
			print_indentation
			current_file.put_line ("T0* R;")
				-- Create 'area'.
			print_indentation
			current_file.put_string ("a = (T0*)")
			current_file.put_string (c_gealloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (current_system.special_character_type, current_file)
			current_file.put_character (')')
			current_file.put_character ('+')
			current_file.put_character ('(')
			current_file.put_character ('c')
			current_file.put_character ('+')
			current_file.put_character ('1')
			current_file.put_character (')')
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
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('a')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('i')
			current_file.put_character ('d')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_integer (current_system.special_character_type.id)
			current_file.put_character (';')
			current_file.put_new_line
				-- Set 'count' of 'area'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('a')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_character ('1')
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
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('a')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_character ('2')
			current_file.put_line (", s, c);")
				-- Create string object.
			print_indentation
			current_file.put_string ("R = (T0*)")
			current_file.put_string (c_gealloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (current_system.string_type, current_file)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
				-- Set type id of string.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('R')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('i')
			current_file.put_character ('d')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_integer (current_system.string_type.id)
			current_file.put_character (';')
			current_file.put_new_line
				-- Set 'area'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('R')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('a')
			current_file.put_character (';')
			current_file.put_new_line
				-- Set 'count'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('R')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_string (c_arrow)
			current_file.put_character ('a')
			current_file.put_character ('2')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type, current_file)
			current_file.put_character ('c')
			current_file.put_character (';')
			current_file.put_new_line
				-- Return the string.
			print_indentation
			current_file.put_string (c_return)
			current_file.put_character (' ')
			current_file.put_character ('R')
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
		do
			l_queries := an_array_type.queries
			if l_queries.is_empty then
					-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
				set_fatal_error
				error_handler.report_gibjn_error
			else
				l_area_type_set := l_queries.item (1).result_type_set
				if l_area_type_set = Void then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
					error_handler.report_gibjo_error
				else
					l_special_type ?= l_area_type_set.static_type
					if l_special_type = Void then
							-- Internal error: it has already been checked in ET_SYSTEM.compile_kernel
							-- that the attribute `area' is of SPECIAL type.
						set_fatal_error
						error_handler.report_gibjp_error
					end
				end
			end
			if l_special_type /= Void then
				l_item_type := l_special_type.item_type_set.static_type
					-- Print signature to `header_file' and `current_file'.
				header_file.put_string (c_extern)
				header_file.put_character (' ')
				header_file.put_string ("T0* gema")
				current_file.put_string ("T0* gema")
				header_file.put_integer (an_array_type.id)
				current_file.put_integer (an_array_type.id)
					-- Use varargs rather than inlining the code, this
					-- makes the C compilation with the -O2 faster and
					-- the resulting application is not slower.
				header_file.put_string ("(int c, ...)")
				current_file.put_string ("(int c, ...)")
				header_file.put_character (';')
				header_file.put_new_line
				current_file.put_new_line
					-- Print body to `current_file'.
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				current_file.put_line ("T0* R;")
				print_indentation
				current_file.put_line ("T0* a;")
					-- Create 'area'.
				print_indentation
				current_file.put_string ("a = (T0*)")
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
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (l_special_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'count' of 'area'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('1')
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
				current_file.put_line ("int n = c;")
				print_indentation
				print_type_declaration (l_item_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('*')
				current_file.put_character ('i')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('(')
				print_type_cast (l_special_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_line ("va_start(v, c);")
				print_indentation
				current_file.put_line ("while (n--) {")
				indent
				print_indentation
				current_file.put_string ("*(i++) = va_arg(v, ")
				print_type_declaration (l_item_type, current_file)
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
				current_file.put_string ("R = (T0*)")
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
				current_file.put_character ('(')
				print_type_cast (an_array_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_integer (an_array_type.id)
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'area'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'lower'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('a')
				current_file.put_character ('2')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set 'upper'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_string (c_arrow)
				current_file.put_character ('a')
				current_file.put_character ('3')
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
				current_file.put_character ('R')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
			end
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
			header_file.put_string (" gevoid")
			current_file.put_string (c_int)
			current_file.put_string (" gevoid")
			header_file.put_string ("(T0* C, ...)")
			current_file.put_string ("(T0* C, ...)")
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

feature {NONE} -- Locals

	print_reference_local_declaration (i: INTEGER) is
			-- Print declaration of reference local z`i'.
		local
			old_file: like current_file
		do
			old_file := current_file
			current_file := current_local_buffer
			print_indentation
			current_file.put_character ('T')
			current_file.put_character ('0')
			current_file.put_character ('*')
			current_file.put_character (' ')
			current_file.put_character ('z')
			current_file.put_integer (i)
			current_file.put_character (';')
			current_file.put_new_line
			current_file := old_file
		end

	print_typed_pointer_local_declaration (i: INTEGER; a_type: ET_DYNAMIC_TYPE) is
			-- Print declaration of typed pointer local z`i'.
		require
			a_type_not_void: a_type /= Void
		local
			old_file: like current_file
		do
			old_file := current_file
			current_file := current_local_buffer
			print_indentation
			current_file.put_character ('T')
			current_file.put_integer (a_type.id)
			current_file.put_character (' ')
			current_file.put_character ('z')
			current_file.put_integer (i)
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_character ('0')
			current_file.put_character ('}')
			current_file.put_character (';')
			current_file.put_new_line
			current_file := old_file
		end

feature {NONE} -- Malloc

	print_malloc_current is
			-- Print memory allocation of 'Current'.
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			print_indentation
			print_type_declaration (current_type, current_file)
			current_file.put_character (' ')
			current_file.put_character ('C')
			if
				current_type = current_system.character_type or
				current_type = current_system.boolean_type or
				current_type = current_system.integer_8_type or
				current_type = current_system.integer_16_type or
				current_type = current_system.integer_type or
				current_type = current_system.integer_64_type or
				current_type = current_system.real_type or
				current_type = current_system.double_type or
				current_type = current_system.pointer_type
			then
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
			else
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_character ('C')
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
					current_file.put_character ('+')
					current_file.put_character ('a')
					current_file.put_character ('1')
					current_file.put_character ('*')
					current_file.put_string (c_sizeof)
					current_file.put_character ('(')
					print_type_declaration (l_special_type.item_type_set.static_type, current_file)
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_character ('(')
					print_type_cast (current_type, current_file)
					current_file.put_character ('(')
					current_file.put_character ('C')
					current_file.put_character (')')
					current_file.put_character (')')
					current_file.put_character ('-')
					current_file.put_character ('>')
					current_file.put_character ('a')
					current_file.put_character ('1')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('a')
					current_file.put_character ('1')
-- TODO: initialize items when expanded.
				else
					current_file.put_character (')')
				end
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_character ('(')
				print_type_cast (current_type, current_file)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
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
			a_file.put_character ('T')
			a_file.put_character ('0')
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
						a_file.put_character ('{')
						a_file.put_new_line
						a_file.put_character ('%T')
						a_file.put_string (c_int)
						a_file.put_character (' ')
						a_file.put_string (c_id)
						a_file.put_character (';')
						a_file.put_new_line
						l_special_type ?= l_type
						if l_special_type /= Void then
							a_file.put_character ('%T')
							print_type_declaration (current_system.integer_type, a_file)
							a_file.put_character (' ')
							a_file.put_character ('a')
							a_file.put_integer (1)
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
							a_file.put_character ('a')
							a_file.put_integer (2)
							a_file.put_character ('[')
							a_file.put_integer (0)
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
									a_file.put_character (' ')
									print_type_declaration (l_item_type_sets.item (j).static_type, a_file)
									a_file.put_character (' ')
									a_file.put_character ('a')
									a_file.put_integer (j)
									a_file.put_character (';')
									j := j + 1
								end
							else
								l_queries := l_type.queries
								nb2 := l_queries.count
								from j := 1 until j > nb2 loop
									l_query := l_queries.item (j)
									if l_query.is_attribute then
										a_file.put_character ('%T')
										print_type_declaration (l_query.result_type_set.static_type, a_file)
										a_file.put_character (' ')
										a_file.put_character ('a')
										a_file.put_integer (l_query.id)
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
							end
						end
						a_file.put_character ('}')
						a_file.put_character (' ')
						print_type_name (l_type, a_file)
						a_file.put_character (';')
						a_file.put_new_line
					end
					a_file.put_new_line
				end
				i := i + 1
			end
		end

	print_type_name (a_type: ET_DYNAMIC_TYPE; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print name of `a_type' to `a_file'.
		require
			a_type_not_void: a_type /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if a_type.is_expanded then
				a_file.put_character ('T')
				a_file.put_integer (a_type.id)
			else
				a_file.put_character ('T')
				a_file.put_integer (a_type.id)
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
				a_file.put_character ('T')
				a_file.put_integer (a_type.id)
			else
				a_file.put_character ('T')
				a_file.put_character ('0')
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
			print_type_name (a_type, a_file)
			a_file.put_character ('f')
			l_precursor ?= a_routine
			if l_precursor /= Void then
				a_file.put_integer (l_precursor.current_feature.id)
				a_file.put_character ('p')
			end
			a_file.put_integer (a_routine.id)
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
			print_type_name (a_type, a_file)
			a_file.put_character ('s')
			l_precursor ?= a_routine
			if l_precursor /= Void then
				a_file.put_integer (l_precursor.current_feature.id)
				a_file.put_character ('p')
			end
			a_file.put_integer (a_routine.id)
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
			print_type_name (a_type, a_file)
			a_file.put_character ('c')
			a_file.put_integer (a_procedure.id)
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
			a_file.put_string (a_feature.name.name)
			a_file.put_character (' ')
			a_file.put_character ('*')
			a_file.put_character ('/')
			a_file.put_new_line
		end

feature {NONE} -- Attribute access generation

	print_attribute_name (an_attribute: ET_DYNAMIC_FEATURE; a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `an_attribute' applied on `a_target' of type `a_type'.
		require
			an_attribute_not_void: an_attribute /= Void
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type, current_file)
			current_file.put_character ('(')
			print_expression (a_target)
			current_file.put_character (')')
			current_file.put_character (')')
			if a_type.is_expanded then
				current_file.put_character ('.')
			else
				current_file.put_character ('-')
				current_file.put_character ('>')
			end
			current_file.put_character ('a')
			current_file.put_integer (an_attribute.id)
		end

	print_current_attribute_name (an_attribute: ET_DYNAMIC_FEATURE) is
			-- Print name of `an_attribute' with current object as target.
		require
			an_attribute_not_void: an_attribute /= Void
		do
			current_file.put_character ('(')
			print_type_cast (current_type, current_file)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (')')
			if current_type.is_expanded then
				current_file.put_character ('.')
			else
				current_file.put_character ('-')
				current_file.put_character ('>')
			end
			current_file.put_character ('a')
			current_file.put_integer (an_attribute.id)
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
		do
			nb := a_string.count
			from i := 1 until i > nb loop
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
		end

	print_escaped_character (c: CHARACTER) is
			-- Print escaped version of `c'.
		local
			l_code: INTEGER
		do
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
			current_file.put_character ('R')
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
			l_full_pathname := file_system.nested_pathname ("${GOBO}", <<"misc", "gec", "runtime", "c", a_filename>>)
			l_full_pathname := Execution_environment.interpreted_string (l_full_pathname)
			include_file (l_full_pathname, a_file)
		end

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
			-- Do nothing.
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
			-- Do nothing.
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
			elseif an_identifier.is_local then
				print_local_variable (an_identifier)
			elseif an_identifier.is_instruction then
				print_procedure_call (current_type, Void, an_identifier, Void)
			else
				print_query_call (current_type, Void, an_identifier, Void)
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
			-- Do nothing.
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

	header_file: KI_TEXT_OUTPUT_STREAM
			-- Header file

	current_local_buffer: KL_STRING_OUTPUT_STREAM
			-- Current buffer for internal C local declarations

	called_features: DS_ARRAYED_LIST [ET_DYNAMIC_FEATURE]
			-- Features being called

	polymorphic_query_calls: DS_ARRAYED_LIST [ET_DYNAMIC_QUALIFIED_QUERY_CALL]
			-- Polymorphic query calls

	polymorphic_procedure_calls: DS_ARRAYED_LIST [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL]
			-- Polymorphic procedure calls

	manifest_array_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of manifest arrays

	once_features: DS_HASH_SET [ET_FEATURE]
			-- Once features already generated

	constant_features: DS_HASH_TABLE [ET_CONSTANT, ET_FEATURE]
			-- Features returning a constant

	unique_count: INTEGER
			-- Number of unique attributes found so far

	local_count: INTEGER
			-- Number of internal C local variables declared

	instruction_buffer_stack: DS_ARRAYED_STACK [KL_STRING_OUTPUT_STREAM]
			-- Output buffers for instructions

	local_buffer_stack: DS_ARRAYED_STACK [KL_STRING_OUTPUT_STREAM]
			-- Output buffers for internal C local declarations

feature {NONE} -- Implementation

	accepted_types: ET_DYNAMIC_TYPE_LIST
			-- Types accepted by the current assignment attempt

	denied_types: ET_DYNAMIC_TYPE_LIST
			-- Types denied by the current assignment attempt

	internal_local_name: ET_INTERNAL_LOCAL_NAME
			-- Internal local name used to hold result of expressions

	internal_formal_arguments (nb: INTEGER): ET_ACTUAL_ARGUMENT_LIST is
			-- List of `nb' format arguments used as actual arguments
			-- in a feature call
		require
			nb_positive: nb > 0
		local
			l_name: ET_IDENTIFIER
			i: INTEGER
		do
			if internal_formal_arguments_table = Void then
				create internal_formal_arguments_table.make (1, nb.max (10))
				create Result.make_with_capacity (nb)
				from i := nb until i < 1 loop
					create l_name.make ("a")
					l_name.set_seed (i)
					l_name.set_argument (True)
					Result.put_first (l_name)
					i := i - 1
				end
				internal_formal_arguments_table.put (Result, nb)
			elseif not internal_formal_arguments_table.valid_index (nb) then
				create Result.make_with_capacity (nb)
				from i := nb until i < 1 loop
					create l_name.make ("a")
					l_name.set_seed (i)
					l_name.set_argument (True)
					Result.put_first (l_name)
					i := i - 1
				end
				internal_formal_arguments_table.force (Result, nb)
			else
				Result := internal_formal_arguments_table.item (nb)
				if Result = Void then
					create Result.make_with_capacity (nb)
					from i := nb until i < 1 loop
						create l_name.make ("a")
						l_name.set_seed (i)
						l_name.set_argument (True)
						Result.put_first (l_name)
						i := i - 1
					end
					internal_formal_arguments_table.put (Result, nb)
				end
			end
		ensure
			internal_formal_arguments_not_void: Result /= Void
			count_set: Result.count = nb
		end

	internal_formal_arguments_table: ARRAY [ET_ACTUAL_ARGUMENT_LIST]
			-- Cache for `internal_formal_arguments', indexed by size

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

	e_inline: STRING is "C inline"
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
	c_eif_integer_64: STRING is "EIF_INTEGER_64"
	c_eif_natural_8: STRING is "EIF_NATURAL_8"
	c_eif_natural_16: STRING is "EIF_NATURAL_16"
	c_eif_natural_32: STRING is "EIF_NATURAL_32"
	c_eif_natural_64: STRING is "EIF_NATURAL_64"
	c_eif_object: STRING is "EIF_OBJECT"
	c_eif_pointer: STRING is "EIF_POINTER"
	c_eif_real_32: STRING is "EIF_REAL_32"
	c_eif_real_64: STRING is "EIF_REAL_64"
	c_eif_reference: STRING is "EIF_REFERENCE"
	c_eif_true: STRING is "EIF_TRUE"
	c_eif_void: STRING is "EIF_VOID"
	c_eif_wide_char: STRING is "EIF_WIDE_CHAR"
	c_else: STRING is "else"
	c_extern: STRING is "extern"
	c_float: STRING is "float"
	c_gealloc: STRING is "gealloc"
	c_id: STRING is "id"
	c_if: STRING is "if"
	c_int: STRING is "int"
	c_int8_t: STRING is "int8_t"
	c_int16_t: STRING is "int16_t"
	c_int32_t: STRING is "int32_t"
	c_int64_t: STRING is "int64_t"
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
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void
	type_checker_not_void: type_checker /= Void
	instruction_buffer_stack_not_void: instruction_buffer_stack /= Void
	no_void_instruction_buffer: not instruction_buffer_stack.has (Void)
	local_buffer_stack_not_void: local_buffer_stack /= Void
	no_void_local_buffer: not local_buffer_stack.has (Void)
	current_local_buffer_not_void: current_local_buffer /= Void
	accepted_types_not_void: accepted_types /= Void
	denied_types_not_void: denied_types /= Void
	internal_local_name_not_void: internal_local_name /= Void
	polymorphic_query_calls_not_void: polymorphic_query_calls /= Void
	no_void_polymorphic_query_call: not polymorphic_query_calls.has (Void)
	polymorphic_procedure_calls_not_void: polymorphic_procedure_calls /= Void
	no_void_polymorphic_procedure_call: not polymorphic_procedure_calls.has (Void)
	polymorphic_type_ids_not_void: polymorphic_type_ids /= Void
	polymorphic_types_not_void: polymorphic_types /= Void
	no_void_polymorphic_type: not polymorphic_types.has_item (Void)
	manifest_array_types_not_void: manifest_array_types /= Void
	no_void_manifest_array_type: not manifest_array_types.has (Void)
	called_features_not_void: called_features /= Void
	no_void_called_feature: not called_features.has (Void)
	once_features_not_void: once_features /= Void
	no_void_once_feature: not once_features.has (Void)
	constant_features_not_void: constant_features /= Void
	no_void_constant_feature: not constant_features.has (Void)
	polymorphic_equivalent_types1_not_void: polymorphic_equivalent_types1 /= Void
	no_void_polymorphic_equivalent_type1: not polymorphic_equivalent_types1.has (Void)
	polymorphic_equivalent_types2_not_void: polymorphic_equivalent_types2 /= Void
	no_void_polymorphic_equivalent_type2: not polymorphic_equivalent_types2.has (Void)
	polymorphic_equivalent_types3_not_void: polymorphic_equivalent_types3 /= Void
	no_void_polymorphic_equivalent_type3: not polymorphic_equivalent_types3.has (Void)

end
