indexing

	description:

		"C code generators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_C_GENERATOR

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_processor
		redefine
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_bit_constant,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_constant_attribute,
			process_convert_expression,
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

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_system: like current_system) is
			-- Create a new C code generator.
		do
			make_processor (a_system.universe)
			create type_checker.make (universe)
			current_system := a_system
			current_file := null_output_stream
			current_type := a_system.none_type
			current_feature := dummy_feature
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
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_cursor: DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [ET_DYNAMIC_TYPE], ET_CLASS]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			j, nb2: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			k, nb3: INTEGER
			l_arguments: ET_DYNAMIC_TYPE_SET_LIST
			l_root_type: ET_DYNAMIC_TYPE
			l_root_creation: ET_DYNAMIC_FEATURE
		do
			has_fatal_error := False
			old_file := current_file
			current_file := a_file
			a_file.put_line ("#include <stdlib.h>")
			a_file.put_new_line
			print_types
			a_file.put_new_line
			a_file.put_line ("#define EIF_VOID ((T0*)0)")
			a_file.put_string ("#define EIF_TRUE (")
			print_type_cast (current_system.boolean_type)
			a_file.put_line ("1)")
			a_file.put_string ("#define EIF_FALSE (")
			print_type_cast (current_system.boolean_type)
			a_file.put_line ("0)")
			a_file.put_new_line
			l_cursor := current_system.dynamic_types.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_dynamic_types := l_cursor.item
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.is_alive then
						l_features := l_type.features
						if l_features /= Void then
							nb2 := l_features.count
							from j := 1 until j > nb2 loop
								l_feature := l_features.item (j)
								if l_feature.is_function then
									a_file.put_string ("extern ")
									print_type_declaration (l_feature.result_type.static_type)
									a_file.put_character (' ')
									print_routine_name (l_feature, l_type)
									a_file.put_character ('(')
									print_type_declaration (l_type)
									a_file.put_character (' ')
									a_file.put_character ('C')
									l_arguments := l_feature.argument_types
									if l_arguments /= Void then
										nb3 := l_arguments.count
										from k := 1 until k > nb3 loop
											a_file.put_character (',')
											a_file.put_character (' ')
											print_type_declaration (l_arguments.item (k).static_type)
											a_file.put_character (' ')
											a_file.put_character ('a')
											a_file.put_integer (k)
											k := k + 1
										end
									end
									a_file.put_character (')')
									a_file.put_character (';')
									a_file.put_new_line
								elseif l_feature.is_procedure then
									if l_feature.is_regular then
										a_file.put_string ("extern void ")
										print_routine_name (l_feature, l_type)
										a_file.put_character ('(')
										print_type_declaration (l_type)
										a_file.put_character (' ')
										a_file.put_character ('C')
										l_arguments := l_feature.argument_types
										if l_arguments /= Void then
											nb3 := l_arguments.count
											from k := 1 until k > nb3 loop
												a_file.put_character (',')
												a_file.put_character (' ')
												print_type_declaration (l_arguments.item (k).static_type)
												a_file.put_character (' ')
												a_file.put_character ('a')
												a_file.put_integer (k)
												k := k + 1
											end
										end
										a_file.put_character (')')
										a_file.put_character (';')
										a_file.put_new_line
									end
									if l_feature.is_creation then
										a_file.put_string ("extern ")
										print_type_declaration (l_type)
										a_file.put_character (' ')
										print_creation_procedure_name (l_feature, l_type)
										a_file.put_character ('(')
										l_arguments := l_feature.argument_types
										if l_arguments /= Void then
											nb3 := l_arguments.count
											from k := 1 until k > nb3 loop
												if k /= 1 then
													a_file.put_character (',')
													a_file.put_character (' ')
												end
												print_type_declaration (l_arguments.item (k).static_type)
												a_file.put_character (' ')
												a_file.put_character ('a')
												a_file.put_integer (k)
												k := k + 1
											end
										end
										a_file.put_character (')')
										a_file.put_character (';')
										a_file.put_new_line
									end
								end
								j := j + 1
							end
						end
					end
					i := i + 1
				end
				l_cursor.forth
			end
			a_file.put_new_line
			from l_cursor.start until l_cursor.after loop
				l_dynamic_types := l_cursor.item
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.is_alive then
						print_features (l_type)
					end
					i := i + 1
				end
				l_cursor.forth
			end
			l_root_type := current_system.root_type
			l_root_creation := current_system.root_creation_procedure
			if l_root_type = Void or l_root_creation = Void then
				a_file.put_line ("main(char** argv, int argc)")
				a_file.put_line ("{")
				a_file.put_line ("}")
			else
				a_file.put_line ("main (char** argv, int argc)")
				a_file.put_line ("{")
				indent
				print_indentation
				print_type_declaration (l_root_type)
				a_file.put_string (" l1;")
				a_file.put_new_line
				print_indentation
				a_file.put_string ("l1 = ")
				print_creation_expression (l_root_type, l_root_creation, Void)
				a_file.put_line (";")
				dedent
				a_file.put_line ("}")
			end
			current_file := old_file
		end

feature {NONE} -- Feature generation

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
			if l_features /= Void then
				nb := l_features.count
				from i := 1 until i > nb loop
					print_feature (l_features.item (i))
					i := i + 1
				end
			end
			current_type := old_type
		end

	print_feature (a_feature: ET_DYNAMIC_FEATURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			old_feature: ET_DYNAMIC_FEATURE
		do
			old_feature := current_feature
			current_feature := a_feature
			current_assignment_attempt := a_feature.first_assignment_attempt
			current_feature_call := a_feature.first_feature_call
			a_feature.static_feature.process (Current)
			current_feature := old_feature
			current_assignment_attempt := Void
			current_feature_call := Void
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
-- TODO
		end

	print_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_arguments: ET_DYNAMIC_TYPE_SET_LIST
			i, j, nb: INTEGER
			i2, nb2: INTEGER
			i3, nb3: INTEGER
			l_max: INTEGER
			l_max_index: INTEGER
			c, c3: CHARACTER
			l_alias: ET_EXTERNAL_ALIAS
			l_alias_value: ET_MANIFEST_STRING
			l_c_code: STRING
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_name: STRING
		do
			if current_feature.static_feature /= a_feature then
-- TODO: error
			else
				current_file.put_string ("void ")
				print_routine_name (current_feature, current_type)
				current_file.put_character ('(')
				print_type_declaration (current_type)
				current_file.put_character (' ')
				current_file.put_character ('C')
				l_arguments := current_feature.argument_types
				if l_arguments /= Void then
					nb := l_arguments.count
					from i := 1 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						print_type_declaration (l_arguments.item (i).static_type)
						current_file.put_character (' ')
						current_file.put_character ('a')
						current_file.put_integer (i)
						i := i + 1
					end
				end
				current_file.put_character (')')
				current_file.put_new_line
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				l_alias := a_feature.alias_clause
				if l_alias /= Void then
					l_alias_value := l_alias.manifest_string
					if not l_alias_value.computed then
						l_alias_value.compute (error_handler)
					end
					l_c_code := l_alias_value.value
					l_formal_arguments := a_feature.arguments
					if l_formal_arguments /= Void then
--						nb := l_formal_arguments.count
--						from i := 1 until i > nb loop
--							l_name := l_formal_arguments.formal_argument (i).name.name
--							--l_c_code.replace_substring_all ("$"+l_name, "a"+i.out)
--							i := i + 1
--						end
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
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
			end
		end

	print_internal_creation_procedure (a_feature: ET_INTERNAL_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			is_creation: current_feature.is_creation
		local
			l_arguments: ET_DYNAMIC_TYPE_SET_LIST
			l_locals: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_compound: ET_COMPOUND
		do
			print_type_declaration (current_type)
			current_file.put_character (' ')
			print_creation_procedure_name (current_feature, current_type)
			current_file.put_character ('(')
			l_arguments := current_feature.argument_types
			if l_arguments /= Void then
				nb := l_arguments.count
				from i := 1 until i > nb loop
					if i /= 1 then
						current_file.put_character (',')
						current_file.put_character (' ')
					end
					print_type_declaration (l_arguments.item (i).static_type)
					current_file.put_character (' ')
					current_file.put_character ('a')
					current_file.put_integer (i)
					i := i + 1
				end
			end
			current_file.put_character (')')
			current_file.put_new_line
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			l_locals := current_feature.local_types
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					print_indentation
					print_type_declaration (l_locals.item (i).static_type)
					current_file.put_character (' ')
					current_file.put_character ('l')
					current_file.put_integer (i)
					current_file.put_character (';')
					current_file.put_new_line
					i := i + 1
				end
			end
			print_indentation
			print_type_declaration (current_type)
			current_file.put_character (' ')
			current_file.put_character ('C')
			current_file.put_character (';')
			current_file.put_new_line
			print_indentation
			current_file.put_string ("C = (")
			print_type_declaration (current_type)
			current_file.put_string (")malloc(sizeof(")
			print_type_name (current_type)
			current_file.put_line ("));")
			l_compound := a_feature.compound
			if l_compound /= Void then
				print_compound (l_compound)
			end
			print_indentation
			current_file.put_line ("return C;")
			dedent
			current_file.put_character ('}')
			current_file.put_new_line
			current_file.put_new_line
		end

	print_internal_function (a_feature: ET_INTERNAL_FUNCTION) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_arguments: ET_DYNAMIC_TYPE_SET_LIST
			l_locals: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_compound: ET_COMPOUND
		do
			if current_feature.static_feature /= a_feature then
-- TODO: error
			else
				print_type_declaration (current_feature.result_type.static_type)
				current_file.put_character (' ')
				print_routine_name (current_feature, current_type)
				current_file.put_character ('(')
				print_type_declaration (current_type)
				current_file.put_character (' ')
				current_file.put_character ('C')
				l_arguments := current_feature.argument_types
				if l_arguments /= Void then
					nb := l_arguments.count
					from i := 1 until i > nb loop
						current_file.put_character (',')
						current_file.put_character (' ')
						print_type_declaration (l_arguments.item (i).static_type)
						current_file.put_character (' ')
						current_file.put_character ('a')
						current_file.put_integer (i)
						i := i + 1
					end
				end
				current_file.put_character (')')
				current_file.put_new_line
				current_file.put_character ('{')
				current_file.put_new_line
				indent
				print_indentation
				print_type_declaration (current_feature.result_type.static_type)
				current_file.put_character (' ')
				current_file.put_character ('R')
				current_file.put_character (';')
				current_file.put_new_line
				l_locals := current_feature.local_types
				if l_locals /= Void then
					nb := l_locals.count
					from i := 1 until i > nb loop
						print_indentation
						print_type_declaration (l_locals.item (i).static_type)
						current_file.put_character (' ')
						current_file.put_character ('l')
						current_file.put_integer (i)
						current_file.put_character (';')
						current_file.put_new_line
						i := i + 1
					end
				end
				l_compound := a_feature.compound
				if l_compound /= Void then
					print_compound (l_compound)
				end
				print_indentation
				current_file.put_line ("return R;")
				dedent
				current_file.put_character ('}')
				current_file.put_new_line
				current_file.put_new_line
			end
		end

	print_internal_procedure (a_feature: ET_INTERNAL_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if current_feature.static_feature /= a_feature then
-- TODO: error
			else
				if current_feature.is_regular then
					print_internal_regular_procedure (a_feature)
				end
				if current_feature.is_creation then
					print_internal_creation_procedure (a_feature)
				end
			end
		end

	print_internal_regular_procedure (a_feature: ET_INTERNAL_PROCEDURE) is
			-- Print `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: current_feature.static_feature = a_feature
			is_regular: current_feature.is_regular
		local
			l_arguments: ET_DYNAMIC_TYPE_SET_LIST
			l_locals: ET_DYNAMIC_TYPE_SET_LIST
			i, nb: INTEGER
			l_compound: ET_COMPOUND
		do
			current_file.put_string ("void ")
			print_routine_name (current_feature, current_type)
			current_file.put_character ('(')
			print_type_declaration (current_type)
			current_file.put_character (' ')
			current_file.put_character ('C')
			l_arguments := current_feature.argument_types
			if l_arguments /= Void then
				nb := l_arguments.count
				from i := 1 until i > nb loop
					current_file.put_character (',')
					current_file.put_character (' ')
					print_type_declaration (l_arguments.item (i).static_type)
					current_file.put_character (' ')
					current_file.put_character ('a')
					current_file.put_integer (i)
					i := i + 1
				end
			end
			current_file.put_character (')')
			current_file.put_new_line
			current_file.put_character ('{')
			current_file.put_new_line
			indent
			l_locals := current_feature.local_types
			if l_locals /= Void then
				nb := l_locals.count
				from i := 1 until i > nb loop
					print_indentation
					print_type_declaration (l_locals.item (i).static_type)
					current_file.put_character (' ')
					current_file.put_character ('l')
					current_file.put_integer (i)
					current_file.put_character (';')
					current_file.put_new_line
					i := i + 1
				end
			end
			l_compound := a_feature.compound
			if l_compound /= Void then
				print_compound (l_compound)
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
			l_dynamic_assignment: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
		do
			l_dynamic_assignment := current_assignment_attempt
			if l_dynamic_assignment = Void then
-- TODO: error
			else
				current_assignment_attempt := l_dynamic_assignment.next_assignment_attempt
				if l_dynamic_assignment.is_direct_assignment then
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
				else
					current_file.put_character ('{')
					current_file.put_new_line
					indent
					print_indentation
					current_file.put_character ('T')
					current_file.put_character ('0')
					current_file.put_character ('*')
					current_file.put_character (' ')
					current_file.put_character ('z')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_character ('z')
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_instruction.source)
					current_file.put_character (')')
					current_file.put_character (';')
					current_file.put_new_line
					print_indentation
					current_file.put_line ("switch (z->id) {")
					if l_dynamic_assignment.first_type /= Void then
						print_indentation
						current_file.put_string ("case ")
						current_file.put_integer (l_dynamic_assignment.first_type.id)
						current_file.put_character (':')
						current_file.put_new_line
						indent
						print_indentation
						print_writable (an_instruction.target)
						current_file.put_character (' ')
						current_file.put_character ('=')
						current_file.put_character (' ')
						current_file.put_character ('z')
						current_file.put_character (';')
						current_file.put_new_line
						print_indentation
						current_file.put_string ("break;")
						current_file.put_new_line
						dedent
						from 
							l_other_type := l_dynamic_assignment.other_types
						until
							l_other_type = Void
						loop
							print_indentation
							current_file.put_string ("case ")
							current_file.put_integer (l_other_type.item.id)
							current_file.put_character (':')
							current_file.put_new_line
							indent
							print_indentation
							print_writable (an_instruction.target)
							current_file.put_character (' ')
							current_file.put_character ('=')
							current_file.put_character (' ')
							current_file.put_character ('z')
							current_file.put_character (';')
							current_file.put_new_line
							print_indentation
							current_file.put_string ("break;")
							current_file.put_new_line
							dedent
							l_other_type := l_other_type.right
						end
					end
					print_indentation
					current_file.put_string ("default:")
					current_file.put_new_line
					indent
					print_indentation
					print_writable (an_instruction.target)
					current_file.put_character (' ')
					current_file.put_character ('=')
					current_file.put_character (' ')
					current_file.put_string ("EIF_VOID;")
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_character (';')
					current_file.put_new_line
					dedent
					print_indentation
					current_file.put_character ('}')
					current_file.put_character (';')
				end
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
			if an_instruction.target = Void then
				print_unqualified_call (an_instruction.name, an_instruction.arguments)
			else
				print_qualified_call (an_instruction.target, an_instruction.name, an_instruction.arguments)
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
			l_result: ET_RESULT
			l_identifier: ET_IDENTIFIER
			l_locals: ET_DYNAMIC_TYPE_SET_LIST
			l_feature_name: ET_FEATURE_NAME
			l_any: ANY
		do
			l_target := an_instruction.target
			l_type := an_instruction.type
			if l_type /= Void then
				l_resolved_type := resolved_formal_parameters (l_type)
				if not has_fatal_error then
					l_dynamic_type := current_system.dynamic_type (l_resolved_type, current_type.base_type)
				end
			else
				l_result ?= l_target
				if l_result /= Void then
					l_dynamic_type_set := current_feature.result_type
					if l_dynamic_type_set = Void then
-- TODO: error
					else
						l_dynamic_type := l_dynamic_type_set.static_type
					end
				else
					l_identifier ?= l_target
					if l_identifier /= Void then
						l_seed := l_identifier.seed
						if l_identifier.is_local then
							l_locals := current_feature.local_types
							if l_locals = Void or else (l_seed < 1 and l_seed > l_locals.count) then
-- TODO: error
							else
								l_dynamic_type_set := l_locals.item (l_seed)
								l_dynamic_type := l_dynamic_type_set.static_type
							end
						else
							l_feature := current_type.base_class.seeded_feature (l_seed)
							if l_feature = Void then
-- TODO: error
							else
								l_dynamic_feature := current_type.dynamic_feature (l_feature, current_system)
								l_dynamic_type_set := l_dynamic_feature.result_type
								if l_dynamic_type_set = Void then
-- TODO: error
								else
									l_dynamic_type := l_dynamic_type_set.static_type
								end
							end
						end
					else
							-- SmartEiffel 1.1 does not allow the assignment attempt
							-- because ET_FEATURE_NAME does not conform to ET_WRITABLE.
						-- l_feature_name ?= l_target
						l_any := l_target
						l_feature_name ?= l_any
						if l_feature_name /= Void then
							l_seed := l_feature_name.seed
							l_feature := current_type.base_class.seeded_feature (l_seed)
							if l_feature = Void then
-- TODO: error
							else
								l_dynamic_feature := current_type.dynamic_feature (l_feature, current_system)
								l_dynamic_type_set := l_dynamic_feature.result_type
								if l_dynamic_type_set = Void then
-- TODO: error
								else
									l_dynamic_type := l_dynamic_type_set.static_type
								end
							end
						else
-- TODO: error
						end
					end
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
-- TODO:
--				error_handler.report_giabe_error
				elseif not l_feature.is_procedure then
-- TODO: error
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
			current_file.put_character ('i')
			current_file.put_character ('f')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_expression (an_instruction.conditional.expression)
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
					current_file.put_character ('e')
					current_file.put_character ('l')
					current_file.put_character ('s')
					current_file.put_character ('e')
					current_file.put_character (' ')
					current_file.put_character ('i')
					current_file.put_character ('f')
					current_file.put_character (' ')
					current_file.put_character ('(')
					print_expression (an_elseif.conditional.expression)
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
				current_file.put_character ('e')
				current_file.put_character ('l')
				current_file.put_character ('s')
				current_file.put_character ('e')
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
		do
-- TODO.
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
			a_compound: ET_COMPOUND
		do
			a_compound := an_instruction.from_compound
			if a_compound /= Void then
				current_file.put_line ("/* Loop from */")
				print_compound (a_compound)
				print_indentation
			end
			current_file.put_character ('w')
			current_file.put_character ('h')
			current_file.put_character ('i')
			current_file.put_character ('l')
			current_file.put_character ('e')
			current_file.put_character (' ')
			current_file.put_character ('(')
			print_expression (an_instruction.until_conditional.expression)
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
		end

	print_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			print_type_cast (current_system.character_type)
			current_file.put_character ('(')
			current_file.put_character ('%'')
			current_file.put_character (a_constant.value)
			current_file.put_character ('%'')
			current_file.put_character (')')
		end

	print_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
		end

	print_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
		end

	print_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			if an_expression.target = Void then
				print_unqualified_call (an_expression.name, an_expression.arguments)
			else
				print_qualified_call (an_expression.target, an_expression.name, an_expression.arguments)
			end
		end

	print_convert_expression (an_expression: ET_CONVERT_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
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
-- TODO:
				elseif not l_feature.is_procedure then
-- TODO: error
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
		do
			if current_type.is_expanded then
				current_file.put_character ('&')
				current_file.put_character ('C')
			else
				current_file.put_character ('C')
			end
		end

	print_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO: expandedness
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
		end

	print_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			current_file.put_string ("EIF_FALSE")
		end

	print_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
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
		end

	print_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
		end

	print_local_variable (a_name: ET_IDENTIFIER) is
			-- Print local variable `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
		do
			current_file.put_character ('l')
			current_file.put_integer (a_name.seed)
		end

	print_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
		end

	print_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
		end

	print_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
		end

	print_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
-- TODO.
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
		do
			a_parent_type := a_precursor.parent_type
			if a_parent_type = Void then
					-- Internal error: the Precursor construct should already
					-- have been resolved when flattening the features of the
					-- implementation class of current feature.
				set_fatal_error
-- TODO: error
			else
				a_precursor_keyword := a_precursor.precursor_keyword
				a_class := a_parent_type.direct_base_class (universe)
				a_feature := a_class.seeded_feature (a_precursor_keyword.seed)
				if a_feature = Void then
						-- Internal error: the Precursor construct should
						-- already have been resolved when flattening the
						-- features of `a_class_impl'.
					set_fatal_error
-- TODO: error
				else
					if a_parent_type.is_generic then
						l_current_class := current_type.base_class
						l_class_impl := current_feature.static_feature.implementation_class
						if l_current_class /= l_class_impl then
								-- Resolve generic parameters in the
								-- context of `current_type'.
							l_current_class.process (universe.ancestor_builder)
							if l_current_class.has_ancestors_error then
								set_fatal_error
							else
								an_ancestor := l_current_class.ancestor (a_parent_type, universe)
								if an_ancestor = Void then
										-- Internal error: `a_parent_type' is an ancestor
										-- of `l_class_impl', and hence of `l_current_class'.
									set_fatal_error
-- TODO.
								else
									a_parent_type := an_ancestor
								end
							end
						end
					end
					if not has_fatal_error then
						l_dynamic_type := current_system.dynamic_type (a_parent_type, current_type.base_type)
						l_dynamic_feature := l_dynamic_type.dynamic_feature (a_feature, current_system)
-- TODO: generate special rotuines for precursors.
						print_routine_name (l_dynamic_feature, l_dynamic_type)
						current_file.put_character ('(')
						an_actuals := a_precursor.arguments
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
			print_qualified_call (an_expression.expression, an_expression.name, Void)
		end

	print_qualified_call (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Print qualified call.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		local
			a_feature: ET_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
			l_call: ET_DYNAMIC_CALL
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_other_dynamic_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
		do
			l_call := current_feature_call
			if l_call = Void then
-- TODO: error
			else
				current_feature_call := l_call.next_call
				a_feature := l_call.static_feature
				a_seed := a_feature.first_seed
				if a_feature.is_procedure then
					l_other_dynamic_type := l_call.target_type.other_types
					if l_other_dynamic_type = Void then
						l_dynamic_type := l_call.target_type.first_type
						if l_dynamic_type /= Void then
							a_feature := l_dynamic_type.base_class.seeded_feature (a_seed)
							if a_feature = Void then
-- TODO: error
							else
								print_routine_name (l_dynamic_type.dynamic_feature (a_feature, current_system), l_dynamic_type)
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
							end
						else
-- TODO.
						end
					else
-- TODO.
					end
				else
-- TODO.
					if a_feature.is_attribute then
						print_attribute_name (l_call.target_type.static_type.dynamic_feature (a_feature, current_system), current_type)
					elseif a_feature.is_constant_attribute then
-- TODO.
					elseif a_feature.is_unique_attribute then
-- TODO.
					else
-- TODO.
						print_routine_name (l_call.target_type.static_type.dynamic_feature (a_feature, current_system), current_type)
						current_file.put_character ('(')
						current_file.put_character ('C')
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
		do
-- TODO.
		end

	print_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
-- TODO.
		end

	print_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
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
		do
-- TODO.
		end

	print_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
-- TODO.
		end

	print_static_call (a_call: ET_STATIC_FEATURE_CALL) is
			-- Check validity of `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
-- TODO.
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
		end

	print_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			current_file.put_string ("EIF_TRUE")
		end

	print_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
		end

	print_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Print `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
-- TODO.
		end

	print_unqualified_call (a_name: ET_FEATURE_NAME; an_actuals: ET_ACTUAL_ARGUMENT_LIST) is
			-- Print unqualified call.
		require
			a_name_not_void: a_name /= Void
		local
			a_feature: ET_FEATURE
			a_seed: INTEGER
			i, nb: INTEGER
		do
			a_seed := a_name.seed
			a_feature := current_type.base_class.seeded_feature (a_seed)
			if a_feature = Void then
					-- Internal error: there should be a feature with `a_seed'.
					-- It has been computed in ET_FEATURE_CHECKER or else an
					-- error should have already been reported.
				set_fatal_error
-- TODO:
--				error_handler.report_giabe_error
			elseif a_feature.is_procedure then
				print_routine_name (current_type.dynamic_feature (a_feature, current_system), current_type)
				current_file.put_character ('(')
				current_file.put_character ('C')
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
			else
				if a_feature.is_attribute then
					print_attribute_name (current_type.dynamic_feature (a_feature, current_system), current_type)
				elseif a_feature.is_constant_attribute then
-- TODO.
				elseif a_feature.is_unique_attribute then
-- TODO.
				else
					print_routine_name (current_type.dynamic_feature (a_feature, current_system), current_type)
					current_file.put_character ('(')
					current_file.put_character ('C')
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

	print_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Print `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
-- TODO.
		end

	print_void (an_expression: ET_VOID) is
			-- Print `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			current_file.put_string ("EIF_VOID")
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
			an_arguments: ET_AGENT_ACTUAL_ARGUMENT_LIST
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
					a_type_target ?= a_target
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

	print_unqualified_call_agent (a_name: ET_FEATURE_NAME; an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST) is
			-- Print unqualified call agent.
		require
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

	print_qualified_call_agent (a_target: ET_EXPRESSION; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST) is
			-- Print qualified call agent.
		require
			a_target_not_void: a_target /= Void
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

	print_typed_call_agent (a_type: ET_TYPE; a_name: ET_FEATURE_NAME;
		an_actuals: ET_AGENT_ACTUAL_ARGUMENT_LIST) is
			-- Print typed call agent.
		require
			a_type_not_void: a_type /= Void
			a_name_not_void: a_name /= Void
		do
-- TODO.
		end

feature {NONE} -- Type generation

	print_types is
			-- Print declarations of types of `current_system'.
		local
			l_dynamic_types: DS_ARRAYED_LIST [ET_DYNAMIC_TYPE]
			l_cursor: DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [ET_DYNAMIC_TYPE], ET_CLASS]
			l_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
			l_features: ET_DYNAMIC_FEATURE_LIST
			l_feature: ET_DYNAMIC_FEATURE
			j, nb2: INTEGER
		do
			current_file.put_line ("typedef struct {int id;} T0;")
			l_cursor := current_system.dynamic_types.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_dynamic_types := l_cursor.item
				nb := l_dynamic_types.count
				from i := 1 until i > nb loop
					l_type := l_dynamic_types.item (i)
					if l_type.is_alive then
						if l_type = current_system.character_type then
							current_file.put_string ("typedef unsigned char ")
							print_type_name (l_type)
							current_file.put_character (';')
							current_file.put_new_line
						elseif l_type = current_system.boolean_type then
							current_file.put_string ("typedef int ")
							print_type_name (l_type)
							current_file.put_character (';')
							current_file.put_new_line
						else
							current_file.put_string ("typedef struct {int id;")
							l_features := l_type.features
							if l_features /= Void then
								nb2 := l_features.count
								from j := 1 until j > nb2 loop
									l_feature := l_features.item (j)
									if l_feature.is_attribute then
										current_file.put_character (' ')
										print_type_declaration (l_feature.result_type.static_type)
										current_file.put_character (' ')
										current_file.put_character ('a')
										current_file.put_integer (l_feature.id)
										current_file.put_character (';')
									end
									j := j + 1
								end
							end
							current_file.put_character ('}')
							current_file.put_character (' ')
							print_type_name (l_type)
							current_file.put_character (';')
							current_file.put_new_line
						end
					end
					i := i + 1
				end
				l_cursor.forth
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

	print_type_declaration (a_type: ET_DYNAMIC_TYPE) is
			-- Print declaration of `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if a_type.is_expanded then
				current_file.put_character ('T')
				current_file.put_integer (a_type.id)
			else
				current_file.put_character ('T')
				current_file.put_character ('0')
				current_file.put_character ('*')
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
		do
			print_type_name (a_type)
			current_file.put_character ('f')
			current_file.put_integer (a_routine.id)
		end

	print_attribute_name (an_attribute: ET_DYNAMIC_FEATURE; a_type: ET_DYNAMIC_TYPE) is
			-- Print name of `an_attribute'.
		require
			an_attribute_not_void: an_attribute /= Void
			a_type_not_void: a_type /= Void
		do
			current_file.put_character ('(')
			print_type_cast (a_type)
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

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_c1_character_constant (a_constant)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_c2_character_constant (a_constant)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			print_c3_character_constant (a_constant)
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
-- TODO: error
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
-- TODO: error
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
				print_unqualified_call (an_identifier, Void)
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

	current_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
			-- Dynamic type set of current assignment attempt

	current_feature_call: ET_DYNAMIC_CALL
			-- Dynamic type set of current polymorphic call

	current_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

feature {NONE} -- Implementation

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

invariant

	current_system_not_void: current_system /= Void
	current_file_not_void: current_file /= Void
	current_file_open_write: current_file.is_open_write
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void
	type_checker_not_void: type_checker /= Void

end
