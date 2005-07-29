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
			process_typed_expression,
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
			create polymorphic_calls.make (100000)
			create instruction_buffer_stack.make (10)
			create local_buffer_stack.make (10)
			create current_local_buffer.make ("")
			create accepted_types.make_with_capacity (15)
			create denied_types.make_with_capacity (15)
			create internal_local_name.make ("z")
			create polymorphic_type_ids.make (100)
			create polymorphic_types.make_map (100)
			create manifest_array_types.make (100)
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
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
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
				a_file.put_line ("#include <stdlib.h>")
				a_file.put_line ("#include <stdio.h>")
				a_file.put_line ("#include %"gobo_directory.c%"")
				a_file.put_line ("#if defined(_MSC_VER) && (_MSC_VER < 1400) /* MSVC older than v8 */")
				a_file.put_line ("typedef signed char int8_t;")
				a_file.put_line ("typedef signed short int16_t;")
				a_file.put_line ("typedef signed int int32_t;")
				a_file.put_line ("typedef signed __int64 int64_t;")
				a_file.put_line ("#else")
				a_file.put_line ("#include <inttypes.h>")
				a_file.put_line ("#endif")
				a_file.put_new_line
				print_types
				a_file.put_new_line
				--a_file.put_line ("#define EIF_MALLOC malloc")
				a_file.put_line ("#define EIF_MALLOC(x) calloc((x),1)")
				a_file.put_line ("#define EIF_VOID ((T0*)0)")
				a_file.put_string ("#define EIF_TRUE (")
				print_type_cast (current_system.boolean_type)
				a_file.put_line ("1)")
				a_file.put_string ("#define EIF_FALSE (")
				print_type_cast (current_system.boolean_type)
				a_file.put_line ("0)")
				a_file.put_new_line
				print_gems
				a_file.put_new_line
				l_dynamic_types := current_system.dynamic_types
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.is_alive or l_type.has_static then
						l_features := l_type.features
						nb2 := l_features.count
						from j := 1 until j > nb2 loop
							print_feature_declaration (l_features.item (j), l_type)
							j := j + 1
						end
					end
					i := i + 1
				end
				a_file.put_new_line
				a_file.put_string ("#include %"")
				a_file.put_string (l_header_filename)
				a_file.put_character ('%"')
				a_file.put_new_line
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.is_alive or l_type.has_static then
						print_features (l_type)
					end
					i := i + 1
				end
				print_polymorphic_features
				polymorphic_calls.wipe_out
					-- Print features which build manifest arrays.
				from manifest_array_types.start until manifest_array_types.after loop
					print_gema (manifest_array_types.item_for_iteration)
					a_file.put_new_line
					manifest_array_types.forth
				end
				manifest_array_types.wipe_out
					-- Print 'main' function.
				print_main
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
		do
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				l_count := l_count + 1
				l_type.set_id (l_count)
				if l_type.is_alive or l_type.has_static then
					l_features := l_type.features
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
				end
				i := i + 1
			end
		end

feature {NONE} -- Feature generation

	print_feature_declaration (a_feature: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print feature declaration.
		require
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
		do
			if a_feature.is_semistrict then
				-- Do nothing: code will be inlined.
			elseif a_feature.is_function or a_feature.is_constant_attribute then
				if a_feature.is_regular then
					current_file.put_string (c_extern)
					current_file.put_character (' ')
					print_type_declaration (a_feature.result_type_set.static_type, current_file)
					current_file.put_character (' ')
					print_routine_name (a_feature, a_type)
					current_file.put_character ('(')
					print_type_declaration (a_type, current_file)
					current_file.put_character (' ')
					current_file.put_character ('C')
					l_arguments := a_feature.static_feature.arguments
					if l_arguments /= Void then
						nb := l_arguments.count
						if nb > 0 then
								-- Dynamic type sets for arguments are stored first
								-- in `dynamic_type_sets'.
							l_dynamic_type_sets := a_feature.dynamic_type_sets
							if l_dynamic_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_gibar_error
							else
								from i := 1 until i > nb loop
									current_file.put_character (',')
									current_file.put_character (' ')
									print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (i)
									i := i + 1
								end
							end
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
				 	current_file.put_new_line
				end
				if a_feature.is_static then
					current_file.put_string (c_extern)
					current_file.put_character (' ')
					print_type_declaration (a_feature.result_type_set.static_type, current_file)
					current_file.put_character (' ')
					print_static_routine_name (a_feature, a_type)
					current_file.put_character ('(')
					l_arguments := a_feature.static_feature.arguments
					if l_arguments /= Void then
						nb := l_arguments.count
						if nb > 0 then
								-- Dynamic type sets for arguments are stored first
								-- in `dynamic_type_sets'.
							l_dynamic_type_sets := a_feature.dynamic_type_sets
							if l_dynamic_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_giaed_error
							else
								from i := 1 until i > nb loop
									if i /= 1 then
										current_file.put_character (',')
										current_file.put_character (' ')
									end
									print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (i)
									i := i + 1
								end
							end
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
			elseif a_feature.is_procedure then
				if a_feature.is_regular then
					current_file.put_string (c_extern)
					current_file.put_character (' ')
					current_file.put_string (c_void)
					current_file.put_character (' ')
					print_routine_name (a_feature, a_type)
					current_file.put_character ('(')
					print_type_declaration (a_type, current_file)
					current_file.put_character (' ')
					current_file.put_character ('C')
					l_arguments := a_feature.static_feature.arguments
					if l_arguments /= Void then
						nb := l_arguments.count
						if nb > 0 then
								-- Dynamic type sets for arguments are stored first
								-- in `dynamic_type_sets'.
							l_dynamic_type_sets := a_feature.dynamic_type_sets
							if l_dynamic_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_giaec_error
							else
								from i := 1 until i > nb loop
									current_file.put_character (',')
									current_file.put_character (' ')
									print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (i)
									i := i + 1
								end
							end
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
				if a_feature.is_creation then
					current_file.put_string (c_extern)
					current_file.put_character (' ')
					print_type_declaration (a_type, current_file)
					current_file.put_character (' ')
					print_creation_procedure_name (a_feature, a_type)
					current_file.put_character ('(')
					l_arguments := a_feature.static_feature.arguments
					if l_arguments /= Void then
						nb := l_arguments.count
						if nb > 0 then
								-- Dynamic type sets for arguments are stored first
								-- in `dynamic_type_sets'.
							l_dynamic_type_sets := a_feature.dynamic_type_sets
							if l_dynamic_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_gibcb_error
							else
								from i := 1 until i > nb loop
									if i /= 1 then
										current_file.put_character (',')
										current_file.put_character (' ')
									end
									print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (i)
									i := i + 1
								end
							end
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
				if a_feature.is_static then
					current_file.put_string (c_extern)
					current_file.put_character (' ')
					current_file.put_string (c_void)
					current_file.put_character (' ')
					print_static_routine_name (a_feature, a_type)
					current_file.put_character ('(')
					l_arguments := a_feature.static_feature.arguments
					if l_arguments /= Void then
						nb := l_arguments.count
						if nb > 0 then
								-- Dynamic type sets for arguments are stored first
								-- in `dynamic_type_sets'.
							l_dynamic_type_sets := a_feature.dynamic_type_sets
							if l_dynamic_type_sets.count < nb then
									-- Internal error: it has already been checked somewhere else
									-- that there was the same number of actual and formal arguments.
								set_fatal_error
								error_handler.report_gibca_error
							else
								from i := 1 until i > nb loop
									if i /= 1 then
										current_file.put_character (',')
										current_file.put_character (' ')
									end
									print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (i)
									i := i + 1
								end
							end
						end
					end
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
				end
			end
			l_precursor := a_feature.first_precursor
			if l_precursor /= Void then
				print_feature_declaration (l_precursor, a_type)
				l_other_precursors := a_feature.other_precursors
				if l_other_precursors /= Void then
					nb := l_other_precursors.count
					from i := 1 until i > nb loop
						print_feature_declaration (l_other_precursors.item (i), a_type)
						i := i + 1
					end
				end
			end
		end

	print_features (a_type: ET_DYNAMIC_TYPE) is
			-- Print features of `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			old_type: ET_DYNAMIC_TYPE
			l_features: ET_DYNAMIC_FEATURE_LIST
			i, nb: INTEGER
		do
			old_type := current_type
			current_type := a_type
			l_features := a_type.features
			nb := l_features.count
			from i := 1 until i > nb loop
				print_feature (l_features.item (i))
				i := i + 1
			end
			current_type := old_type
		end

	print_feature (a_feature: ET_DYNAMIC_FEATURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			old_feature: ET_DYNAMIC_FEATURE
			l_precursor: ET_DYNAMIC_PRECURSOR
			l_other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			i, nb: INTEGER
		do
			if not a_feature.is_semistrict then
				old_feature := current_feature
				current_feature := a_feature
				local_count := 0
				a_feature.static_feature.process (Current)
				current_feature := old_feature
				l_precursor := a_feature.first_precursor
				if l_precursor /= Void then
					print_feature (l_precursor)
					l_other_precursors := a_feature.other_precursors
					if l_other_precursors /= Void then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							print_feature (l_other_precursors.item (i))
							i := i + 1
						end
					end
				end
			end
		end

	print_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			print_feature_name_comment (a_feature, current_type)
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set = Void then
				set_fatal_error
-- TODO.
			else
				print_type_declaration (l_result_type_set.static_type, current_file)
				current_file.put_character (' ')
				print_routine_name (current_feature, current_type)
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_new_line
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				current_file.put_line ("static int called = 0;")
				print_indentation
				current_file.put_string ("static ")
				print_type_declaration (l_result_type_set.static_type, current_file)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('0')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_line ("if (called) {")
				indent
				print_indentation
				current_file.put_line ("return R;")
				dedent
				print_indentation
				current_file.put_line ("} else {")
				indent
				print_indentation
				current_file.put_line ("called = 1;")
				dedent
				print_indentation
				current_file.put_line ("};")
				print_indentation
				current_file.put_string ("R = (")
				a_feature.constant.process (Current)
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				current_file.put_string (c_return)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
			end
		end

	print_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- Internal error: deferred features cannot be executed at run-time.
			set_fatal_error
			error_handler.report_gibdm_error
		end

	print_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
				-- Internal error: deferred features cannot be executed at run-time.
			set_fatal_error
			error_handler.report_gibdn_error
		end

	print_do_function (a_feature: ET_DO_FUNCTION) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_function (a_feature)
		end

	print_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_procedure (a_feature)
		end

	print_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Print `a_feature'.
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
			-- Print `a_feature'.
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
			-- Print `a_feature'.
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
			print_feature_name_comment (a_feature, current_type)
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set /= Void then
				print_type_declaration (l_result_type_set.static_type, current_file)
			elseif a_creation then
				print_type_declaration (current_type, current_file)
			else
				current_file.put_string (c_void)
			end
			current_file.put_character (' ')
			if a_static then
				print_static_routine_name (current_feature, current_type)
				current_file.put_character ('(')
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type)
				current_file.put_character ('(')
			else
				print_routine_name (current_feature, current_type)
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (' ')
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
								current_file.put_character (',')
								current_file.put_character (' ')
							else
								l_comma := True
							end
							print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
							current_file.put_character (' ')
							current_file.put_character ('a')
							current_file.put_integer (i)
							i := i + 1
						end
					end
				end
			end
			current_file.put_character (')')
			current_file.put_new_line
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
						print_builtin_any_twin_feature (a_feature)
					when builtin_any_same_type then
						print_builtin_any_same_type_feature (a_feature)
					when builtin_any_standard_is_equal then
						print_builtin_any_standard_is_equal_feature (a_feature)
					when builtin_special_item then
						print_builtin_special_item_feature (a_feature)
					when builtin_special_count then
						print_builtin_special_count_feature (a_feature)
					when builtin_character_code then
						print_builtin_character_code_feature (a_feature)
					when builtin_integer_plus then
						print_builtin_integer_plus_feature (a_feature)
					when builtin_integer_minus then
						print_builtin_integer_minus_feature (a_feature)
					when builtin_integer_times then
						print_builtin_integer_times_feature (a_feature)
					when builtin_integer_divide then
						print_builtin_integer_divide_feature (a_feature)
					when builtin_integer_div then
						print_builtin_integer_div_feature (a_feature)
					when builtin_integer_mod then
						print_builtin_integer_mod_feature (a_feature)
					when builtin_integer_opposite then
						print_builtin_integer_opposite_feature (a_feature)
					when builtin_integer_lt then
						print_builtin_integer_lt_feature (a_feature)
					when builtin_integer_to_character then
						print_builtin_integer_to_character_feature (a_feature)
					when builtin_integer_bit_or then
						print_builtin_integer_bit_or_feature (a_feature)
					when builtin_integer_bit_shift_left then
						print_builtin_integer_bit_shift_left_feature (a_feature)
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
						print_builtin_any_standard_copy_feature (a_feature)
					when builtin_special_make then
						print_builtin_special_make_feature (a_feature)
					when builtin_special_put then
						print_builtin_special_put_feature (a_feature)
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
			-- Print `a_feature'.
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
			-- Print `a_feature'.
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
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			is_static: a_static implies current_feature.is_static
			is_creation: a_creation implies current_feature.is_creation
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_compound: ET_COMPOUND
			l_comma: BOOLEAN
		do
			print_feature_name_comment (a_feature, current_type)
			l_result_type_set := current_feature.result_type_set
			if l_result_type_set /= Void then
				print_type_declaration (l_result_type_set.static_type, current_file)
			elseif a_creation then
				print_type_declaration (current_type, current_file)
			else
				current_file.put_string (c_void)
			end
			current_file.put_character (' ')
			if a_static then
				print_static_routine_name (current_feature, current_type)
				current_file.put_character ('(')
			elseif a_creation then
				print_creation_procedure_name (current_feature, current_type)
				current_file.put_character ('(')
			else
				print_routine_name (current_feature, current_type)
				current_file.put_character ('(')
				print_type_declaration (current_type, current_file)
				current_file.put_character (' ')
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
								current_file.put_character (',')
								current_file.put_character (' ')
							else
								l_comma := True
							end
							print_type_declaration (l_dynamic_type_sets.item (i).static_type, current_file)
							current_file.put_character (' ')
							current_file.put_character ('a')
							current_file.put_integer (i)
							i := i + 1
						end
					end
				end
			end
			current_file.put_character (')')
			current_file.put_new_line
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			if l_result_type_set /= Void then
				print_indentation
				if a_feature.is_once then
					current_file.put_line ("static int called = 0;")
					print_indentation
					current_file.put_string ("static ")
				end
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
			if a_feature.is_once then
				print_indentation
				current_file.put_line ("if (called) {")
				indent
				print_indentation
				current_file.put_line ("return R;")
				dedent
				print_indentation
				current_file.put_line ("} else {")
				indent
				print_indentation
				current_file.put_line ("called = 1;")
				dedent
				print_indentation
				current_file.put_line ("};")
			end
			if a_creation then
				print_malloc_current
			end
-- TODO
--			if current_type = current_system.character_type then
--			elseif current_type = current_system.boolean_type then
--			elseif current_type = current_system.integer_8_type then
--			elseif current_type = current_system.integer_16_type then
--			elseif current_type = current_system.integer_type then
--			elseif current_type = current_system.integer_64_type then
--			elseif current_type = current_system.real_type then
--			elseif current_type = current_system.double_type then
--			elseif current_type = current_system.pointer_type then
--			else
				l_compound := a_feature.compound
				if l_compound /= Void then
					print_compound (l_compound)
				end
--			end
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

	print_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			print_internal_function (a_feature)
		end

	print_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Print `a_feature'.
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
					current_file.put_character (';')
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
				print_qualified_call (an_instruction)
			else
				print_unqualified_call (an_instruction)
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
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
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
				l_feature := l_dynamic_type.base_class.seeded_feature (l_seed)
				if l_feature = Void then
						-- Internal error: there should be a feature with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_gibcr_error
				elseif not l_feature.is_procedure then
						-- Internal error: the creation routine should be a procedure.
					set_fatal_error
					error_handler.report_gibcs_error
				else
					print_writable (l_target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					l_dynamic_feature := l_dynamic_type.dynamic_feature (l_feature, current_system)
					print_creation_expression (l_dynamic_type, l_dynamic_feature, l_actuals)
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
			current_file.put_character (';')
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
			current_file.put_character (';')
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
				current_file.put_character (';')
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
			current_file.put_character (';')
		end

	print_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Print `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			print_precursor_call (an_instruction)
			current_file.put_character (';')
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
		do
			print_static_call (an_instruction)
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
			print_qualified_call (an_expression)
		end

	print_character_constant (a_constant: ET_CHARACTER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			print_type_cast (current_system.character_type)
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
				print_qualified_call (an_expression)
			else
				print_unqualified_call (an_expression)
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
				an_actuals := an_expression.expression
-- TODO.
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
			print_qualified_call (an_expression)
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
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
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
				l_feature := l_dynamic_type.base_class.seeded_feature (l_seed)
				if l_feature = Void then
						-- Internal error: there should be a feature with `l_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_gibct_error
				elseif not l_feature.is_procedure then
						-- Internal error: the creation routine should be a procedure.
					set_fatal_error
					error_handler.report_gibcu_error
				else
					l_dynamic_feature := l_dynamic_type.dynamic_feature (l_feature, current_system)
					print_creation_expression (l_dynamic_type, l_dynamic_feature, l_actuals)
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
			print_creation_procedure_name (a_procedure, a_type)
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
-- TODO.
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
					print_type_cast (current_system.pointer_type)
					current_file.put_character ('(')
					current_file.put_character ('(')
					print_type_cast (current_type)
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
-- TODO.
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

	print_feature_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print feature call `a_call' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			a_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
			a_string_constant: ET_MANIFEST_STRING
			a_seed: INTEGER
			i, nb: INTEGER
		do
			a_seed := a_call.name.seed
			a_feature := a_target_type.base_class.seeded_feature (a_seed)
			if a_feature = Void then
					-- Internal error: there should be a feature with `a_seed'.
					-- It has been computed in ET_FEATURE_FLATTENER.
				set_fatal_error
				error_handler.report_gibdb_error
			elseif a_feature.is_procedure then
				l_dynamic_feature := a_target_type.dynamic_feature (a_feature, current_system)
				inspect l_dynamic_feature.builtin_code
				when builtin_any_standard_copy then
					print_builtin_any_standard_copy_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_special_put then
					print_builtin_special_put_call (a_call, a_target_type, a_target, an_actuals)
				else
					print_routine_name (l_dynamic_feature, a_target_type)
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
			elseif a_feature.is_attribute then
				if a_target /= Void then
					print_attribute_name (a_target_type.dynamic_feature (a_feature, current_system), a_target, a_target_type)
				else
					print_current_attribute_name (a_target_type.dynamic_feature (a_feature, current_system))
				end
			elseif a_feature.is_unique_attribute then
-- TODO.
				if a_target /= Void then
					current_file.put_character ('(')
					print_expression (a_target)
					current_file.put_character (',')
					print_type_cast (current_system.integer_type)
					current_file.put_character ('(')
					unique_count := unique_count + 1
					current_file.put_integer (unique_count)
					current_file.put_character (')')
					current_file.put_character (')')
				else
					print_type_cast (current_system.integer_type)
					current_file.put_character ('(')
					unique_count := unique_count + 1
					current_file.put_integer (unique_count)
					current_file.put_character (')')
				end
			elseif a_feature.is_constant_attribute then
-- TODO.
				a_constant_attribute ?= a_feature
				if a_constant_attribute = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_gibdc_error
				else
					a_string_constant ?= a_constant_attribute.constant
					if a_string_constant /= Void then
						print_routine_name (a_target_type.dynamic_feature (a_feature, current_system), a_target_type)
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
					elseif a_target /= Void then
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (',')
						a_constant_attribute.constant.process (Current)
						current_file.put_character (')')
					else
						a_constant_attribute.constant.process (Current)
					end
				end
			else
				l_dynamic_feature := a_target_type.dynamic_feature (a_feature, current_system)
				inspect l_dynamic_feature.builtin_code
				when builtin_any_same_type then
					print_builtin_any_same_type_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_any_standard_is_equal then
					print_builtin_any_standard_is_equal_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_special_item then
					print_builtin_special_item_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_special_count then
					print_builtin_special_count_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_character_code then
					print_builtin_character_code_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_plus then
					print_builtin_integer_plus_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_minus then
					print_builtin_integer_minus_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_times then
					print_builtin_integer_times_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_divide then
					print_builtin_integer_divide_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_div then
					print_builtin_integer_div_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_mod then
					print_builtin_integer_mod_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_lt then
					print_builtin_integer_lt_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_opposite then
					print_builtin_integer_opposite_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_to_character then
					print_builtin_integer_to_character_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_bit_or then
					print_builtin_integer_bit_or_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_integer_bit_shift_left then
					print_builtin_integer_bit_shift_left_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_boolean_and_then then
					print_builtin_boolean_and_then_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_boolean_or_else then
					print_builtin_boolean_or_else_call (a_call, a_target_type, a_target, an_actuals)
				when builtin_boolean_implies then
					print_builtin_boolean_implies_call (a_call, a_target_type, a_target, an_actuals)
				else
					print_routine_name (l_dynamic_feature, a_target_type)
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
				print_type_cast (current_system.integer_8_type)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 6 then
					-- 0[xX][a-fA-F0-9]{4}
				print_type_cast (current_system.integer_16_type)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 10 then
					-- 0[xX][a-fA-F0-9]{8}
				print_type_cast (current_system.integer_type)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			when 18 then
					-- 0[xX][a-fA-F0-9]{16}
				print_type_cast (current_system.integer_64_type)
				current_file.put_character ('(')
				current_file.put_string (a_literal)
				current_file.put_character (')')
			else
				print_type_cast (current_system.integer_type)
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
			print_qualified_call (an_expression)
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
-- TODO.
--				error_handler.report_gibdg_error
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
					current_file.put_character (' ')
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
			current_file.put_character ('(')
			print_expression (an_expression.expression)
			current_file.put_character (')')
		end

	print_precursor_call (a_precursor: ET_PRECURSOR) is
			-- Print `a_precursor'.
		require
			a_precursor_not_void: a_precursor /= Void
		local
			a_precursor_keyword: ET_PRECURSOR_KEYWORD
			a_feature: ET_FEATURE
			a_parent_type, an_ancestor: ET_BASE_TYPE
			a_class: ET_CLASS
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_current_class: ET_CLASS
			l_class_impl: ET_CLASS
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_dynamic_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_comma: BOOLEAN
		do
			a_parent_type := a_precursor.parent_type
			if a_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
				error_handler.report_gibcv_error
			else
				a_precursor_keyword := a_precursor.precursor_keyword
				a_class := a_parent_type.direct_base_class (universe)
				a_feature := a_class.seeded_feature (a_precursor_keyword.seed)
				if a_feature = Void then
						-- Internal error: the Precursor construct should
						-- already have been resolved when flattening the
						-- features of `a_class_impl'.
					set_fatal_error
					error_handler.report_gibcw_error
				else
					if a_parent_type.is_generic then
						l_current_class := current_type.base_class
						l_class_impl := current_feature.static_feature.implementation_class
						if l_current_class /= l_class_impl then
								-- Resolve generic parameters in the
								-- context of `current_type'.
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
						l_dynamic_type := current_system.dynamic_type (a_parent_type, current_type.base_type)
						l_dynamic_feature := current_feature.dynamic_precursor (a_feature, l_dynamic_type, current_system)
						if l_dynamic_feature.is_static then
							print_static_routine_name (l_dynamic_feature, current_type)
							current_file.put_character ('(')
						else
							print_routine_name (l_dynamic_feature, current_type)
							current_file.put_character ('(')
							current_file.put_character ('C')
							l_comma := True
						end
						an_actuals := a_precursor.arguments
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

	print_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_precursor_call (an_expression)
		end

	print_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_qualified_call (an_expression)
		end

	print_qualified_call (a_call: ET_FEATURE_CALL) is
			-- Print qualified call.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
		local
			a_name: ET_CALL_NAME
			a_target: ET_EXPRESSION
			a_target_type_set: ET_DYNAMIC_TYPE_SET
			an_actuals: ET_ACTUAL_ARGUMENTS
			a_feature: ET_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			j, nb2: INTEGER
			l_local_index: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_CALL
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
					a_feature := a_target_type_set.static_type.base_class.seeded_feature (a_seed)
					if a_feature = Void then
							-- Internal error: there should be a feature with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibco_error
-- TODO error.
					elseif a_feature.is_procedure then
-- TODO
						local_count := local_count + 1
						l_local_index := local_count
						print_reference_local_declaration (l_local_index)
						current_file.put_character ('z')
						current_file.put_integer (l_local_index)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('(')
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (')')
						current_file.put_character (',')
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								current_file.put_character ('(')
								print_expression (an_actuals.actual_argument (i))
								current_file.put_character (')')
								current_file.put_character (',')
								i := i + 1
							end
						end
						current_file.put_string (c_eif_void)
						current_file.put_character (')')
						current_file.put_character (';')
					else
-- TODO
						current_file.put_character ('(')
						current_file.put_character ('(')
						print_expression (a_target)
						current_file.put_character (')')
						current_file.put_character (',')
						if an_actuals /= Void then
							nb := an_actuals.count
							from i := 1 until i > nb loop
								current_file.put_character ('(')
								print_expression (an_actuals.actual_argument (i))
								current_file.put_character (')')
								current_file.put_character (',')
								i := i + 1
							end
						end
						current_file.put_character ('0')
						current_file.put_character (')')
					end
				elseif l_other_dynamic_types = Void then
						-- Static binding.
					print_feature_call (a_call, l_dynamic_type, a_target, an_actuals)
				else
						-- Dynamic binding.
					a_feature := l_dynamic_type.base_class.seeded_feature (a_seed)
					if a_feature = Void then
							-- Internal error: there should be a feature with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibcp_error
					elseif l_other_dynamic_types.count > 1 then
						create l_polymorphic_call.make (a_call, a_target_type_set, current_feature, current_type)
						polymorphic_calls.force_last (l_polymorphic_call)
						if a_feature.is_procedure then
							print_indentation
						end
						current_file.put_character ('X')
						current_file.put_integer (polymorphic_calls.count)
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
						if a_feature.is_procedure then
							current_file.put_character (';')
						end
					elseif a_feature.is_procedure then
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
								-- calling `print_feature_call' because it might have been
								-- overwritten inbetween when printing the arguments of the calls.
							internal_local_name.set_seed (l_local_index)
							print_feature_call (a_call, l_dynamic_type, internal_local_name, an_actuals)
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
								a_feature := l_dynamic_type.base_class.seeded_feature (a_seed)
								j := j + 1
							end
						end
						print_indentation
						current_file.put_character ('}')
						current_file.put_character (';')
					else
							-- Query.
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
								-- calling `print_feature_call' because it might have been
								-- overwritten inbetween when printing the arguments of the calls.
							internal_local_name.set_seed (l_local_index)
							print_feature_call (a_call, l_dynamic_type, internal_local_name, an_actuals)
							if j > nb2 then
								l_dynamic_type := Void
							else
								current_file.put_character (':')
								l_dynamic_type := l_other_dynamic_types.item (j)
								a_feature := l_dynamic_type.base_class.seeded_feature (a_seed)
								j := j + 1
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
		do
			if a_constant.is_integer_8 then
				print_type_cast (current_system.integer_8_type)
			elseif a_constant.is_integer_16 then
				print_type_cast (current_system.integer_16_type)
			elseif a_constant.is_integer_32 then
				print_type_cast (current_system.integer_32_type)
			elseif a_constant.is_integer_64 then
				print_type_cast (current_system.integer_64_type)
			elseif a_constant.is_natural then
				print_type_cast (current_system.natural_type)
			elseif a_constant.is_natural_8 then
				print_type_cast (current_system.natural_8_type)
			elseif a_constant.is_natural_16 then
				print_type_cast (current_system.natural_16_type)
			elseif a_constant.is_natural_32 then
				print_type_cast (current_system.natural_32_type)
			elseif a_constant.is_natural_64 then
				print_type_cast (current_system.natural_64_type)
			else
				print_type_cast (current_system.integer_type)
			end
			current_file.put_character ('(')
			if a_constant.is_negative then
				current_file.put_character ('-')
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
				from until i > nb loop
					current_file.put_character (l_literal.item (i))
					i := i + 1
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
				print_type_cast (current_system.real_type)
			else
				print_type_cast (current_system.double_type)
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
-- TODO.
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

	print_static_call (a_call: ET_STATIC_FEATURE_CALL) is
			-- Check validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			a_type: ET_TYPE
			a_resolved_type: ET_TYPE
			a_target_type: ET_DYNAMIC_TYPE
			a_feature: ET_FEATURE
			an_actuals: ET_ACTUAL_ARGUMENT_LIST
			a_constant_attribute: ET_CONSTANT_ATTRIBUTE
			a_seed: INTEGER
			i, nb: INTEGER
		do
			a_type := a_call.type
			a_resolved_type := resolved_formal_parameters (a_type)
			if not has_fatal_error then
				a_target_type := current_system.dynamic_type (a_resolved_type, current_type.base_type)
				a_seed := a_call.name.seed
				a_feature := a_target_type.base_class.seeded_feature (a_seed)
				if a_feature = Void then
						-- Internal error: there should be a feature with `a_seed'.
						-- It has been computed in ET_FEATURE_CHECKER or else an
						-- error should have already been reported.
					set_fatal_error
					error_handler.report_gibdd_error
				elseif a_feature.is_procedure then
					print_static_routine_name (a_target_type.dynamic_feature (a_feature, current_system), a_target_type)
					current_file.put_character ('(')
					an_actuals := a_call.arguments
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
				elseif a_feature.is_attribute then
						-- Internal error: no object available.
					set_fatal_error
					error_handler.report_gibdl_error
				elseif a_feature.is_constant_attribute then
					a_constant_attribute ?= a_feature
					if a_constant_attribute = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_gibde_error
					else
						a_constant_attribute.constant.process (Current)
					end
				elseif a_feature.is_unique_attribute then
-- TODO.
					print_type_cast (current_system.integer_type)
					current_file.put_character ('(')
					unique_count := unique_count + 1
					current_file.put_integer (unique_count)
					current_file.put_character (')')
				else
					print_static_routine_name (a_target_type.dynamic_feature (a_feature, current_system), a_target_type)
					current_file.put_character ('(')
					an_actuals := a_call.arguments
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

	print_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			print_static_call (an_expression)
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

	print_typed_expression (an_expression: ET_TYPED_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
print ("ET_C_GENERATOR.print_typed_expression%N")
			print_expression (an_expression.expression)
		end

	print_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		local
			i, nb: INTEGER
			l_literal: STRING
		do
			if a_constant.is_integer_8 then
				print_type_cast (current_system.integer_8_type)
			elseif a_constant.is_integer_16 then
				print_type_cast (current_system.integer_16_type)
			elseif a_constant.is_integer_32 then
				print_type_cast (current_system.integer_32_type)
			elseif a_constant.is_integer_64 then
				print_type_cast (current_system.integer_64_type)
			elseif a_constant.is_natural then
				print_type_cast (current_system.natural_type)
			elseif a_constant.is_natural_8 then
				print_type_cast (current_system.natural_8_type)
			elseif a_constant.is_natural_16 then
				print_type_cast (current_system.natural_16_type)
			elseif a_constant.is_natural_32 then
				print_type_cast (current_system.natural_32_type)
			elseif a_constant.is_natural_64 then
				print_type_cast (current_system.natural_64_type)
			else
				print_type_cast (current_system.integer_type)
			end
			current_file.put_character ('(')
			if a_constant.is_negative then
				current_file.put_character ('-')
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
				from until i > nb loop
					if l_literal.item (i) /= '_' then
						current_file.put_character (l_literal.item (i))
					end
					i := i + 1
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
				print_type_cast (current_system.real_type)
			else
				print_type_cast (current_system.double_type)
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

	print_unqualified_call (a_call: ET_FEATURE_CALL) is
			-- Print unqualified call.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
		do
			print_feature_call (a_call, current_type, Void, a_call.arguments)
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

feature {NONE} -- Polymorphic calls

	print_polymorphic_features is
			-- Print polymorphic features.
		local
			i, nb: INTEGER
			l_polymorphic_call: ET_DYNAMIC_QUALIFIED_CALL
			l_call: ET_CALL_COMPONENT
			l_target_type_set: ET_DYNAMIC_TYPE_SET
			l_result_type: ET_DYNAMIC_TYPE
			l_argument_type: ET_DYNAMIC_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_types: ET_DYNAMIC_TYPE_LIST
			l_type: ET_TYPE
			l_base_type: ET_BASE_TYPE
			l_feature: ET_FEATURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_seed: INTEGER
			j, nb2: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_switch: BOOLEAN
		do
			nb := polymorphic_calls.count
			from i := 1 until i > nb loop
				l_polymorphic_call := polymorphic_calls.item (i)
				l_call := l_polymorphic_call.static_call
				l_seed := l_call.name.seed
				l_target_type_set := l_polymorphic_call.target_type_set
				l_base_type := l_target_type_set.static_type.base_type
				l_dynamic_type := l_target_type_set.first_type
				l_other_dynamic_types := l_target_type_set.other_types
				if l_dynamic_type /= Void then
					l_feature := l_dynamic_type.base_class.seeded_feature (l_seed)
					if l_feature = Void then
							-- Internal error: there should be a feature with `a_seed'.
							-- It has been computed in ET_FEATURE_FLATTENER.
						set_fatal_error
						error_handler.report_gibiz_error
					else
							-- Print feature signature.
						header_file.put_string (c_extern)
						header_file.put_character (' ')
						l_type := l_feature.type
						if l_type /= Void then
							l_result_type := current_system.dynamic_type (l_type, l_base_type)
							print_type_declaration (l_result_type, header_file)
							print_type_declaration (l_result_type, current_file)
						else
							l_result_type := Void
							header_file.put_string (c_void)
							current_file.put_string (c_void)
						end
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
						l_arguments := l_feature.arguments
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
						if l_switch then
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
								if l_result_type /= Void then
									current_file.put_string (c_return)
									current_file.put_character (' ')
									current_file.put_character ('(')
								end
								print_feature_call (l_call, l_dynamic_type, tokens.current_keyword, l_actuals)
								if l_result_type /= Void then
									current_file.put_character (')')
								else
									current_file.put_new_line
									print_indentation
									current_file.put_string (c_break)
								end
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
							current_file.put_character (';')
						else
								-- Use binary search.
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
						if l_result_type /= Void then
							print_indentation
							current_file.put_string (c_return)
							current_file.put_character (' ')
							current_file.put_character ('0')
							current_file.put_character (';')
							current_file.put_new_line
						end
						dedent
						current_file.put_character ('}')
						current_file.put_new_line
						current_file.put_new_line
					end
				end
				i := i + 1
			end
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
				end
				print_feature_call (a_call, l_dynamic_type, a_target, an_actuals)
				if a_result_type /= Void then
					current_file.put_character (')')
					current_file.put_character (';')
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
				end
				print_feature_call (a_call, l_dynamic_type, a_target, an_actuals)
				if a_result_type /= Void then
					current_file.put_character (')')
					current_file.put_character (';')
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
				end
				print_feature_call (a_call, l_dynamic_type, a_target, an_actuals)
				if a_result_type /= Void then
					current_file.put_character (')')
					current_file.put_character (';')
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
			current_file.put_string (c_eif_malloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (current_type)
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
				print_type_cast (current_type)
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
-- TODO: initialize items.
			else
				current_file.put_character (')')
			end
			current_file.put_character (';')
			current_file.put_new_line
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_type)
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

feature {NONE} -- Built-in features

	print_builtin_any_twin_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'ANY.twin'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_copy_feature: ET_FEATURE
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
				current_file.put_string (c_eif_malloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type)
				current_file.put_character (')')
				current_file.put_character ('+')
				current_file.put_character ('(')
				print_type_cast (current_type)
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
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Copy items.
				print_indentation
				current_file.put_string ("memcpy(")
				current_file.put_character ('(')
				print_type_cast (current_type)
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
				print_type_cast (current_type)
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
				print_type_cast (current_type)
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
				current_file.put_string (c_eif_malloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (current_type)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				print_indentation
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('R')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
				l_copy_feature := current_type.base_class.seeded_feature (universe.copy_seed)
				if l_copy_feature = Void then
						-- Internal error: this error should already have been reported during parsing.
					set_fatal_error
					error_handler.report_gibic_error
				else
					print_indentation
					print_routine_name (current_type.dynamic_feature (l_copy_feature, current_system), current_type)
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

	print_builtin_any_same_type_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'ANY.same_type'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
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
				print_indentation
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_string (c_eif_false)
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_type_cast (current_system.boolean_type)
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('(')
				current_file.put_character ('T')
				current_file.put_character ('0')
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('(')
				current_file.put_character ('C')
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
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character ('-')
				current_file.put_character ('>')
				current_file.put_character ('i')
				current_file.put_character ('d')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_same_type_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.same_type' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
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
				print_type_cast (current_system.boolean_type)
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

	print_builtin_any_standard_is_equal_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'ANY.standard_is_equal'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= current_type
			if l_special_type /= Void then
-- TODO: compare items.
print ("ET_C_GENERATOR.print_builtin_any_standard_is_equal - special%N")
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
				print_type_cast (current_system.boolean_type)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character ('=')
				current_file.put_character ('=')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			else
				print_indentation
				current_file.put_character ('R')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				print_type_cast (current_system.boolean_type)
				current_file.put_character ('(')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character ('=')
				current_file.put_character ('=')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_standard_is_equal_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.standard_is_equal' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= a_target_type
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibix_error
			elseif l_special_type /= Void then
-- TODO: compare items.
print ("ET_C_GENERATOR.print_builtin_any_standard_is_equal_call - special%N")
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
				print_type_cast (current_system.boolean_type)
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
				print_type_cast (current_system.boolean_type)
				current_file.put_character ('(')
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (a_target_type)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character ('=')
				current_file.put_character ('=')
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (a_target_type)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_any_standard_copy_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'ANY.standard_copy'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= current_type
			if l_special_type /= Void then
-- TODO: what to do if Current is not large enough?
print ("ET_C_GENERATOR.print_builtin_any_standard_copy - special%N")
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
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_type_name (current_type)
				current_file.put_character ('*')
				current_file.put_character (')')
				current_file.put_character ('(')
				current_file.put_character ('&')
				current_file.put_character ('C')
				current_file.put_character (')')
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (';')
				current_file.put_new_line
			else
-- TODO: both objects have to be of the same type.
				print_indentation
				if not current_type.is_expanded then
					current_file.put_character ('*')
					print_type_cast (current_type)
					current_file.put_character ('(')
					current_file.put_character ('C')
					current_file.put_character (')')
				else
					current_file.put_character ('*')
					current_file.put_character ('(')
					print_type_name (current_type)
					current_file.put_character ('*')
					current_file.put_character (')')
					current_file.put_character ('(')
					current_file.put_character ('&')
					current_file.put_character ('C')
					current_file.put_character (')')
				end
				current_file.put_character (' ')
				current_file.put_character ('=')
				current_file.put_character (' ')
				if not current_type.is_expanded then
					current_file.put_character ('*')
				end
				print_type_cast (current_type)
				current_file.put_character ('(')
				current_file.put_character ('a')
				current_file.put_character ('1')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_any_standard_copy_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'ANY.standard_copy' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		local
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
		do
			l_special_type ?= a_target_type
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiy_error
			elseif l_special_type /= Void then
			-- TODO: what to do if Current is not large enough?
print ("ET_C_GENERATOR.print_builtin_any_standard_copy_call - special%N")
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
				print_indentation
				current_file.put_character ('*')
				current_file.put_character ('(')
				print_type_name (a_target_type)
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
				print_indentation
				if not a_target_type.is_expanded then
					current_file.put_character ('*')
					print_type_cast (a_target_type)
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
					print_type_name (a_target_type)
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
				print_type_cast (a_target_type)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
			end
		end

	print_builtin_special_make_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'SPECIAL.make'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			-- Do nothing: already done in `print_malloc_current'.
		end

	print_builtin_special_item_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'SPECIAL.item'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_type_cast (current_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_character ('2')
			current_file.put_character ('[')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (']')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_special_item_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.item' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiv_error
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type)
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

	print_builtin_special_put_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'SPECIAL.put'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_character ('2')
			current_file.put_character ('[')
			current_file.put_character ('a')
			current_file.put_character ('2')
			current_file.put_character (']')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_special_put_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.put' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 2 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiu_error
			else
				current_file.put_character ('(')
				print_type_cast (a_target_type)
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

	print_builtin_special_count_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'SPECIAL.count'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_type_cast (current_type)
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
		end

	print_builtin_special_count_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'SPECIAL.count' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_target_type)
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

	print_builtin_character_code_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'CHARACTER.code'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_character_code_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'CHARACTER.code' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			if a_target /= Void then
				print_expression (a_target)
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_integer_plus_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "+"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('+')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_plus_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "+"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibda_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_minus_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "-"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('-')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_minus_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "-"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibir_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_times_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "*"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('*')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_times_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "*"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibiq_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_divide_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "/"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.double_type)
			current_file.put_character ('(')
			print_type_cast (current_system.double_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character ('/')
			print_type_cast (current_system.double_type)
			current_file.put_character ('(')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_divide_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "/"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibip_error
			else
				print_type_cast (current_system.double_type)
				current_file.put_character ('(')
				print_type_cast (current_system.double_type)
				current_file.put_character ('(')
				if a_target /= Void then
					print_expression (a_target)
				else
					current_file.put_character ('C')
				end
				current_file.put_character (')')
				current_file.put_character ('/')
				print_type_cast (current_system.double_type)
				current_file.put_character ('(')
				print_expression (an_actuals.actual_argument (1))
				current_file.put_character (')')
				current_file.put_character (')')
			end
		end

	print_builtin_integer_div_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "//"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('/')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_div_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "//"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibio_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_mod_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "\\"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('%%')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_mod_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "\\"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibin_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_opposite_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.prefix "-"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('-')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_opposite_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.prefix "-"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			print_type_cast (current_system.integer_type)
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

	print_builtin_integer_lt_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.infix "<"'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.boolean_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('<')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_lt_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.infix "<"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibcz_error
			else
				print_type_cast (current_system.boolean_type)
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

	print_builtin_integer_to_character_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.to_character'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.character_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_to_character_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.to_character' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			print_type_cast (current_system.character_type)
			current_file.put_character ('(')
			if a_target /= Void then
				print_expression (a_target)
			else
				current_file.put_character ('C')
			end
			current_file.put_character (')')
		end

	print_builtin_integer_bit_or_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.bit_or'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('|')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_bit_or_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.bit_or' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibit_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_integer_bit_shift_left_feature (a_feature: ET_EXTERNAL_ROUTINE) is
			-- Print built-in feature 'INTEGER.bit_shift_left'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
		do
			print_indentation
			current_file.put_character ('R')
			current_file.put_character (' ')
			current_file.put_character ('=')
			current_file.put_character (' ')
			print_type_cast (current_system.integer_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character ('<')
			current_file.put_character ('<')
			current_file.put_character ('a')
			current_file.put_character ('1')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
		end

	print_builtin_integer_bit_shift_left_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'INTEGER.bit_shift_left' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibis_error
			else
				print_type_cast (current_system.integer_type)
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

	print_builtin_boolean_and_then_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "and then"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdf_error
			else
				print_type_cast (current_system.boolean_type)
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

	print_builtin_boolean_or_else_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "or else"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdh_error
			else
				print_type_cast (current_system.boolean_type)
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

	print_builtin_boolean_implies_call (a_call: ET_CALL_COMPONENT; a_target_type: ET_DYNAMIC_TYPE; a_target: ET_EXPRESSION; an_actuals: ET_ACTUAL_ARGUMENTS) is
			-- Print call to built-in feature 'BOOLEAN.infix "implies"' (static binding).
			-- `a_target' (which is Void in case of unqualified call) and `an_actuals'
			-- are not necessarily the same as `a_call.target' and `a_call.arguments'.
			-- They might be temporary names used to hold their already computed values.
			-- `a_target_type' is the dynamic type of the target, or
			-- `current_type' for unqualified call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_not_void: a_target_type /= Void
		do
			if an_actuals = Void or else an_actuals.count /= 1 then
					-- Internal error: this was already reported during parsing.
				set_fatal_error
				error_handler.report_gibdi_error
			else
				print_type_cast (current_system.boolean_type)
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

feature {NONE} -- C functions

	print_main is
			-- Print 'main' function.
		local
			l_root_type: ET_DYNAMIC_TYPE
			l_root_creation: ET_DYNAMIC_FEATURE
		do
			l_root_type := current_system.root_type
			l_root_creation := current_system.root_creation_procedure
			if l_root_type = Void or l_root_creation = Void then
				current_file.put_line ("main(char** argv, int argc)")
				current_file.put_character ('{')
				current_file.put_new_line
				current_file.put_character ('}')
				current_file.put_new_line
			else
				current_file.put_line ("main (char** argv, int argc)")
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_type_declaration (l_root_type, current_file)
				current_file.put_string (" l1;")
				current_file.put_new_line
				print_indentation
				current_file.put_string ("l1 = ")
				print_creation_expression (l_root_type, l_root_creation, Void)
				current_file.put_character (';')
				current_file.put_new_line
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
			end
		end

	print_gems is
			-- Print manifest string function.
		do
			current_file.put_line ("T0* gems(char* s, int c)")
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			print_indentation
			current_file.put_line ("T0* a;")
			print_indentation
			current_file.put_line ("T0* R;")
				-- Create `area'.
			print_indentation
			current_file.put_string ("a = (T0*)")
			current_file.put_string (c_eif_malloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (current_system.special_character_type)
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
				-- Set type id of `area'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type)
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
				-- Set `count' of `area'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type)
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
				-- Copy characters to `area'.
			print_indentation
			current_file.put_string ("memcpy(")
			current_file.put_character ('(')
			print_type_cast (current_system.special_character_type)
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
			current_file.put_string (c_eif_malloc)
			current_file.put_character ('(')
			current_file.put_string (c_sizeof)
			current_file.put_character ('(')
			print_type_name (current_system.string_type)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character (';')
			current_file.put_new_line
				-- Set type id of string.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type)
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
				-- Set `area'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type)
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
				-- Set `count'.
			print_indentation
			current_file.put_character ('(')
			print_type_cast (current_system.string_type)
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
			print_type_cast (current_system.integer_type)
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

	print_gema (an_array_type: ET_DYNAMIC_TYPE) is
			-- Print manifest array function.
		require
			an_array_type_not_void: an_array_type /= Void
		local
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_area_type_set: ET_DYNAMIC_TYPE_SET
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_item_type: ET_DYNAMIC_TYPE
		do
			l_features := an_array_type.features
			if l_features.is_empty then
					-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
				set_fatal_error
--- TODO: internal error
			else
				l_area_type_set := l_features.item (1).result_type_set
				if l_area_type_set = Void then
						-- Error in feature 'area', already reported in ET_SYSTEM.compile_kernel.
					set_fatal_error
-- TODO: internal error
				else
					l_special_type ?= l_area_type_set.static_type
					if l_special_type = Void then
							-- Internal error: it has already been checked in ET_SYSTEM.compile_kernel
							-- that the attribute `area' is of SPECIAL type.
						set_fatal_error
-- TODO: internal error
					end
				end
			end
			if l_special_type /= Void then
				l_item_type := l_special_type.item_type_set.static_type
					-- Print signature.
				header_file.put_string (c_extern)
				header_file.put_character (' ')
				header_file.put_string ("T0* gema")
				current_file.put_string ("T0* gema")
				header_file.put_integer (an_array_type.id)
				current_file.put_integer (an_array_type.id)
				header_file.put_string ("(int c, ...)")
				current_file.put_string ("(int c, ...)")
				header_file.put_character (';')
				header_file.put_new_line
					-- Print body.
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				current_file.put_line ("T0* R;")
				print_indentation
				current_file.put_line ("T0* a;")
					-- Create `area'.
				print_indentation
				current_file.put_string ("a = (T0*)")
				current_file.put_string (c_eif_malloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (l_special_type)
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
					-- Set type id of `area'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (l_special_type)
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
					-- Set `count' of `area'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (l_special_type)
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
					-- Copy items to `area'.
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
				print_type_cast (l_special_type)
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
				current_file.put_string (c_eif_malloc)
				current_file.put_character ('(')
				current_file.put_string (c_sizeof)
				current_file.put_character ('(')
				print_type_name (an_array_type)
				current_file.put_character (')')
				current_file.put_character (')')
				current_file.put_character (';')
				current_file.put_new_line
					-- Set type id of array.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type)
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
					-- Set `area'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type)
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
					-- Set `lower'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type)
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
					-- Set `upper'.
				print_indentation
				current_file.put_character ('(')
				print_type_cast (an_array_type)
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
				print_type_cast (current_system.integer_type)
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

feature {NONE} -- Type generation

	print_types is
			-- Print declarations of types of `current_system'.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_type: ET_DYNAMIC_TYPE
			l_special_type: ET_DYNAMIC_SPECIAL_TYPE
			l_tuple_type: ET_DYNAMIC_TUPLE_TYPE
			l_item_type_set: ET_DYNAMIC_TYPE_SET
			l_item_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			j, nb2: INTEGER
		do
				-- Type with type id 'id'.
			current_file.put_string (c_typedef)
			current_file.put_character (' ')
			current_file.put_string (c_struct)
			current_file.put_character (' ')
			current_file.put_character ('{')
			current_file.put_string (c_int)
			current_file.put_character (' ')
			current_file.put_string (c_id)
			current_file.put_character (';')
			current_file.put_character ('}')
			current_file.put_character (' ')
			current_file.put_character ('T')
			current_file.put_character ('0')
			current_file.put_character (';')
			current_file.put_new_line
			current_file.put_new_line
			l_dynamic_types := current_system.dynamic_types
			nb := l_dynamic_types.count
			from i := 1 until i > nb loop
				l_type := l_dynamic_types.item (i)
				if l_type.is_alive then
					current_file.put_character ('/')
					current_file.put_character ('*')
					current_file.put_character (' ')
					current_file.put_string (l_type.static_type.base_type.to_text)
					current_file.put_character (' ')
					current_file.put_character ('*')
					current_file.put_character ('/')
					current_file.put_new_line
					if l_type = current_system.character_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_unsigned)
						current_file.put_character (' ')
						current_file.put_string (c_char)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.boolean_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_char)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.integer_8_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_int8_t)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.integer_16_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_int16_t)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.integer_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_int32_t)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.integer_64_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_int64_t)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.real_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_float)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.double_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_double)
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					elseif l_type = current_system.pointer_type then
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_void)
						current_file.put_character ('*')
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					else
						current_file.put_string (c_typedef)
						current_file.put_character (' ')
						current_file.put_string (c_struct)
						current_file.put_character (' ')
						current_file.put_character ('{')
						current_file.put_new_line
						current_file.put_character ('%T')
						current_file.put_string (c_int)
						current_file.put_character (' ')
						current_file.put_string (c_id)
						current_file.put_character (';')
						current_file.put_new_line
						l_special_type ?= l_type
						if l_special_type /= Void then
							current_file.put_character ('%T')
							print_type_declaration (current_system.integer_type, current_file)
							current_file.put_character (' ')
							current_file.put_character ('a')
							current_file.put_integer (1)
							current_file.put_character (';')
							current_file.put_character (' ')
							current_file.put_character ('/')
							current_file.put_character ('*')
							current_file.put_character (' ')
							current_file.put_character ('c')
							current_file.put_character ('o')
							current_file.put_character ('u')
							current_file.put_character ('n')
							current_file.put_character ('t')
							current_file.put_character (' ')
							current_file.put_character ('*')
							current_file.put_character ('/')
							current_file.put_new_line
							current_file.put_character ('%T')
							l_item_type_set := l_special_type.item_type_set
							print_type_declaration (l_item_type_set.static_type, current_file)
							current_file.put_character (' ')
							current_file.put_character ('a')
							current_file.put_integer (2)
							current_file.put_character ('[')
							current_file.put_integer (0)
							current_file.put_character (']')
							current_file.put_character (';')
							current_file.put_character (' ')
							current_file.put_character ('/')
							current_file.put_character ('*')
							current_file.put_character (' ')
							current_file.put_character ('i')
							current_file.put_character ('t')
							current_file.put_character ('e')
							current_file.put_character ('m')
							current_file.put_character (' ')
							current_file.put_character ('*')
							current_file.put_character ('/')
							current_file.put_new_line
						else
							l_tuple_type ?= l_type
							if l_tuple_type /= Void then
								l_item_type_sets := l_tuple_type.item_type_sets
								nb2 := l_item_type_sets.count
								from j := 1 until j > nb2 loop
									current_file.put_character (' ')
									print_type_declaration (l_item_type_sets.item (j).static_type, current_file)
									current_file.put_character (' ')
									current_file.put_character ('a')
									current_file.put_integer (j)
									current_file.put_character (';')
									j := j + 1
								end
							else
								l_features := l_type.features
								nb2 := l_features.count
								from j := 1 until j > nb2 loop
									l_feature := l_features.item (j)
									if l_feature.is_attribute then
										current_file.put_character ('%T')
										print_type_declaration (l_feature.result_type_set.static_type, current_file)
										current_file.put_character (' ')
										current_file.put_character ('a')
										current_file.put_integer (l_feature.id)
										current_file.put_character (';')
										current_file.put_character (' ')
										current_file.put_character ('/')
										current_file.put_character ('*')
										current_file.put_character (' ')
										current_file.put_string (l_feature.static_feature.name.name)
										current_file.put_character (' ')
										current_file.put_character ('*')
										current_file.put_character ('/')
										current_file.put_new_line
									end
									j := j + 1
								end
							end
						end
						current_file.put_character ('}')
						current_file.put_character (' ')
						print_type_name (l_type)
						current_file.put_character (';')
						current_file.put_new_line
					end
					current_file.put_new_line
				end
				i := i + 1
			end
		end

	print_type_name (a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if a_type.is_expanded then
				current_file.put_character ('T')
				current_file.put_integer (a_type.id)
			else
				current_file.put_character ('T')
				current_file.put_integer (a_type.id)
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

	print_type_cast (a_type: ET_DYNAMIC_TYPE) is
			-- Print type cast of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_name (a_type)
			if not a_type.is_expanded then
				current_file.put_character ('*')
			end
			current_file.put_character (')')
		end

feature {NONE} -- Feature name generation

	print_routine_name (a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `a_routine'.
		require
			a_routine_not_void: a_routine /= Void
			a_type_not_void: a_type /= Void
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
		do
			print_type_name (a_type)
			current_file.put_character ('f')
			l_precursor ?= a_routine
			if l_precursor /= Void then
				current_file.put_integer (l_precursor.current_feature.id)
				current_file.put_character ('p')
			end
			current_file.put_integer (a_routine.id)
		end

	print_static_routine_name (a_routine: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of static feature `a_feature'.
		require
			a_routine_not_void: a_routine /= Void
			a_routine_static: a_routine.is_static
			a_type_not_void: a_type /= Void
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
		do
			print_type_name (a_type)
			current_file.put_character ('s')
			l_precursor ?= a_routine
			if l_precursor /= Void then
				current_file.put_integer (l_precursor.current_feature.id)
				current_file.put_character ('p')
			end
			current_file.put_integer (a_routine.id)
		end

	print_attribute_name (an_attribute: ET_DYNAMIC_FEATURE; a_target: ET_EXPRESSION; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `an_attribute' applied on `a_target' of type `a_type'.
		require
			an_attribute_not_void: an_attribute /= Void
			a_target_not_void: a_target /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type)
			current_file.put_character ('(')
			print_expression (a_target)
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_integer (an_attribute.id)
		end

	print_current_attribute_name (an_attribute: ET_DYNAMIC_FEATURE) is
			-- Print name of `an_attribute' with current object as target.
		require
			an_attribute_not_void: an_attribute /= Void
		do
			current_file.put_character ('(')
			print_type_cast (current_type)
			current_file.put_character ('(')
			current_file.put_character ('C')
			current_file.put_character (')')
			current_file.put_character (')')
			current_file.put_character ('-')
			current_file.put_character ('>')
			current_file.put_character ('a')
			current_file.put_integer (an_attribute.id)
		end

	print_creation_procedure_name (a_procedure: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of creation procedure `a_procedure'.
		require
			a_procedure_not_void: a_procedure /= Void
			a_procedure_creation: a_procedure.is_creation
			a_type_not_void: a_type /= Void
		do
			print_type_name (a_type)
			current_file.put_character ('c')
			current_file.put_integer (a_procedure.id)
		end

	print_feature_name_comment (a_feature: ET_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `a_feature' from `a_type' as a C comment.
		require
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('/')
			current_file.put_character ('*')
			current_file.put_character (' ')
			current_file.put_string (a_type.base_type.to_text)
			current_file.put_character ('.')
			current_file.put_string (a_feature.name.name)
			current_file.put_character (' ')
			current_file.put_character ('*')
			current_file.put_character ('/')
			current_file.put_new_line
		end

feature {NONE} -- Strings

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
			-- Indentation

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
			-- Print indentation.
		local
			i, nb: INTEGER
		do
			nb := indentation
			from i := 1 until i > nb loop
				current_file.put_character ('%T')
				i := i + 1
			end
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
			elseif an_identifier.is_local then
				print_local_variable (an_identifier)
			else
				print_unqualified_call (an_identifier)
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

	process_typed_expression (an_expression: ET_TYPED_EXPRESSION) is
			-- Process `an_expression'.
		do
			print_typed_expression (an_expression)
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

	polymorphic_calls: DS_ARRAYED_LIST [ET_DYNAMIC_QUALIFIED_CALL]
			-- Polymorphic calls

	manifest_array_types: DS_HASH_SET [ET_DYNAMIC_TYPE]
			-- Types of manifest arrays

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
	c_double: STRING is "double"
	c_eif_false: STRING is "EIF_FALSE"
	c_eif_malloc: STRING is "EIF_MALLOC"
	c_eif_true: STRING is "EIF_TRUE"
	c_eif_void: STRING is "EIF_VOID"
	c_else: STRING is "else"
	c_extern: STRING is "extern"
	c_float: STRING is "float"
	c_id: STRING is "id"
	c_if: STRING is "if"
	c_int: STRING is "int"
	c_int8_t: STRING is "int8_t"
	c_int16_t: STRING is "int16_t"
	c_int32_t: STRING is "int32_t"
	c_int64_t: STRING is "int64_t"
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
	polymorphic_calls_not_void: polymorphic_calls /= Void
	no_void_polymorphic_call: not polymorphic_calls.has (Void)
	polymorphic_type_ids_not_void: polymorphic_type_ids /= Void
	polymorphic_types_not_void: polymorphic_types /= Void
	no_void_polymorphic_type: not polymorphic_types.has_item (Void)
	manifest_array_types_not_void: manifest_array_types /= Void
	no_void_manifest_array_type: not manifest_array_types.has (Void)

end
