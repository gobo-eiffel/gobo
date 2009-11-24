indexing

	description:

		"Eiffel feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CHECKER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_binary_integer_constant,
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
			process_convert_builtin_expression,
			process_convert_from_expression,
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
			process_dotnet_attribute,
			process_dotnet_constant_attribute,
			process_dotnet_function,
			process_dotnet_procedure,
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
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_octal_integer_constant,
			process_old_expression,
			process_old_object_test,
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

	KL_SHARED_PLATFORM
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new feature validity checker.
		do
			create type_checker.make
			current_class := tokens.unknown_class
			current_type := current_class
			current_feature := dummy_feature
			current_feature_impl := dummy_feature.implementation_feature
			current_class_impl := current_feature_impl.implementation_class
				-- Inline agents.
			create enclosing_inline_agents.make (10)
				-- .NET overloading.
			create overloaded_procedures.make (10)
			create unused_overloaded_procedures_list.make (10)
			create overloaded_queries.make (10)
			create unused_overloaded_queries_list.make (10)
			create best_overloaded_features.make (10)
				-- Type contexts.
			create unused_contexts.make (20)
			current_context := new_context (current_type)
			current_target_type := tokens.unknown_class
			free_context (current_context)
				-- Object-tests.
			create current_object_test_types.make_map (50)
			create current_object_test_scope.make
			create object_test_scope_builder.make
			create current_expression_object_tests.make (dummy_expression)
		end

feature -- Status report

	implementation_checked (a_feature: ET_STANDALONE_CLOSURE): BOOLEAN is
			-- Has the implementation of `a_feature' been checked?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_assertion then
				Result := a_feature.implementation_feature.assertions_checked
			else
				Result := a_feature.implementation_feature.implementation_checked
			end
		end

	has_implementation_error (a_feature: ET_STANDALONE_CLOSURE): BOOLEAN is
			-- Has a fatal error occurred during checking
			-- of implementation of `a_feature'?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_assertion then
				Result := a_feature.implementation_feature.has_assertions_error
			else
				Result := a_feature.implementation_feature.has_implementation_error
			end
		end

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_feature' in `a_current_type'.
			-- Do not check assertions, call `check_preconditions_validity'
			-- and `check_postconditions_validity' for that.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			l_class: ET_CLASS
		do
			has_fatal_error := False
			l_feature_impl := a_feature.implementation_feature
			l_class_impl := a_feature.implementation_class
			l_class := a_current_type.base_class
			if not l_class_impl.is_preparsed then
			 		-- Internal error: we should already have reported a VTCT error
					-- somewhere stating that `l_class_impl' (which is supposed to
					-- be an ancestor of `a_current_type.base_class') does not exist.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_class_impl /= l_class or else not a_current_type.same_as_base_class then
					-- Check that this feature has already been checked in the
					-- context of its implementation class.
				if l_feature_impl.implementation_checked then
					if l_feature_impl.has_implementation_error then
							-- The error should have already been reported.
						set_fatal_error
					end
				else
					check_feature_validity (l_feature_impl, l_class_impl)
				end
			end
			if not has_fatal_error then
				old_feature_impl := current_feature_impl
				current_feature_impl := l_feature_impl
				old_feature := current_feature
				current_feature := a_feature
				old_class := current_class
				current_class := l_class
				old_type := current_type
				current_type := a_current_type
				old_class_impl := current_class_impl
				current_class_impl := l_class_impl
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					a_feature.process (Current)
					if current_type = current_class_impl then
						a_feature.set_implementation_checked
						if has_fatal_error then
							a_feature.set_implementation_error
						end
					end
				end
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_precursor_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_feature' which is the precursor of a feature from `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			old_in_precursor: BOOLEAN
		do
			old_in_precursor := in_precursor
			in_precursor := True
			check_feature_validity (a_feature, a_current_type)
			in_precursor := old_in_precursor
		end

	check_preconditions_validity (a_preconditions: ET_PRECONDITIONS;
		a_current_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_preconditions' of `a_current_feature'
			-- (written in `a_current_feature_impl') in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_preconditions_not_void: a_preconditions /= Void
			a_current_feature_impl_not_void: a_current_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_in_assertion: BOOLEAN
			old_in_precondition: BOOLEAN
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			l_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
			l_old_scope: INTEGER
		do
			has_fatal_error := False
			l_feature_impl := a_current_feature_impl.implementation_feature
			l_class_impl := a_current_feature_impl.implementation_class
			l_current_class := a_current_type.base_class
			if not l_class_impl.is_preparsed then
					-- Internal error: we should already have reported a VTCT error
					-- somewhere stating that `l_class_impl' (which is supposed to
					-- be an ancestor of `l_current_class') does not exist.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_class_impl /= l_current_class then
				if l_feature_impl.assertions_checked then
					if l_feature_impl.has_assertions_error then
							-- The error should have already been reported.
						set_fatal_error
					end
				else
					check_preconditions_validity (a_preconditions, l_feature_impl, l_feature_impl, l_class_impl)
				end
			end
			if not has_fatal_error then
				old_feature_impl := current_feature_impl
				current_feature_impl := l_feature_impl
				old_feature := current_feature
				current_feature := a_current_feature
				old_type := current_type
				current_type := a_current_type
				old_class := current_class
				current_class := l_current_class
				old_class_impl := current_class_impl
				current_class_impl := l_class_impl
				old_in_assertion := in_assertion
				in_assertion := True
				old_in_precondition := in_precondition
				in_precondition := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					l_old_scope := current_object_test_scope.count
					nb := a_preconditions.count
					from i := 1 until i > nb loop
						l_expression := a_preconditions.assertion (i).expression
						if l_expression /= Void then
							had_error := had_error or has_fatal_error
							check_expression_validity (l_expression, l_assertion_context, boolean_type)
							if has_fatal_error then
								-- Do nothing.
							elseif not l_assertion_context.same_named_type (boolean_type, current_class_impl) then
								set_fatal_error
								l_named_type := l_assertion_context.named_type
								error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
							end
							l_assertion_context.wipe_out
								-- The scope of object-test locals can cover the following assertions
								-- in the same precondition clause because it's as if they were separated
								-- by "and then" operators.
							object_test_scope_builder.build_scope (l_expression, current_object_test_scope)
						end
						i := i + 1
					end
					current_object_test_scope.keep_object_tests (l_old_scope)
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
				end
				in_assertion := old_in_assertion
				in_precondition := old_in_precondition
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_postconditions_validity (a_postconditions: ET_POSTCONDITIONS;
		a_current_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `a_postconditions' of `a_current_feature'
			-- (written in `a_current_feature_impl') in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_postconditions_not_void: a_postconditions /= Void
			a_current_feature_impl_not_void: a_current_feature_impl /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_in_assertion: BOOLEAN
			old_in_postcondition: BOOLEAN
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			l_expression: ET_EXPRESSION
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
		do
			has_fatal_error := False
			l_feature_impl := a_current_feature_impl.implementation_feature
			l_class_impl := a_current_feature_impl.implementation_class
			l_current_class := a_current_type.base_class
			if not l_class_impl.is_preparsed then
					-- Internal error: we should already have reported a VTCT error
					-- somewhere stating that `l_class_impl' (which is supposed to
					-- be an ancestor of `l_current_class') does not exist.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_class_impl /= l_current_class then
				if l_feature_impl.assertions_checked then
					if l_feature_impl.has_assertions_error then
							-- The error should have already been reported.
						set_fatal_error
					end
				else
					check_postconditions_validity (a_postconditions, l_feature_impl, l_feature_impl, l_class_impl)
				end
			end
			if not has_fatal_error then
				old_feature_impl := current_feature_impl
				current_feature_impl := l_feature_impl
				old_feature := current_feature
				current_feature := a_current_feature
				old_type := current_type
				current_type := a_current_type
				old_class := current_class
				current_class := l_current_class
				old_class_impl := current_class_impl
				current_class_impl := l_class_impl
				old_in_assertion := in_assertion
				in_assertion := True
				old_in_postcondition := in_postcondition
				in_postcondition := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					nb := a_postconditions.count
					from i := 1 until i > nb loop
						l_expression := a_postconditions.assertion (i).expression
						if l_expression /= Void then
							had_error := had_error or has_fatal_error
							check_expression_validity (l_expression, l_assertion_context, boolean_type)
							if has_fatal_error then
								-- Do nothing.
							elseif not l_assertion_context.same_named_type (boolean_type, current_class_impl) then
								set_fatal_error
								l_named_type := l_assertion_context.named_type
								error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
							end
							l_assertion_context.wipe_out
						end
						i := i + 1
					end
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
				end
				in_assertion := old_in_assertion
				in_postcondition := old_in_postcondition
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_invariants_validity (an_invariants: ET_INVARIANTS; a_current_type: ET_BASE_TYPE) is
			-- Check validity of `an_invariants' in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_invariants_not_void: an_invariants /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_in_assertion: BOOLEAN
			old_in_invariant: BOOLEAN
			i, nb: INTEGER
			l_expression: ET_EXPRESSION
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
		do
			has_fatal_error := False
			l_class_impl := an_invariants.implementation_class
			l_current_class := a_current_type.base_class
			if not l_class_impl.is_preparsed then
					-- Internal error: we should already have reported a VTCT error
					-- somewhere stating that `l_class_impl' (which is supposed to
					-- be an ancestor of `l_current_class') does not exist.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif l_class_impl /= l_current_class then
				if an_invariants.assertions_checked then
					if an_invariants.has_assertions_error then
							-- The error should have already been reported.
						set_fatal_error
					end
				else
					check_invariants_validity (an_invariants, l_class_impl)
				end
			end
			if not has_fatal_error then
				old_feature_impl := current_feature_impl
				current_feature_impl := an_invariants
				old_feature := current_feature
				current_feature := an_invariants
				old_type := current_type
				current_type := a_current_type
				old_class := current_class
				current_class := l_current_class
				old_class_impl := current_class_impl
				current_class_impl := l_class_impl
				old_in_assertion := in_assertion
				in_assertion := True
				old_in_invariant := in_invariant
				in_invariant := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					nb := an_invariants.count
					from i := 1 until i > nb loop
						l_expression := an_invariants.assertion (i).expression
						if l_expression /= Void then
							had_error := had_error or has_fatal_error
							check_expression_validity (l_expression, l_assertion_context, boolean_type)
							if has_fatal_error then
								-- Do nothing.
							elseif not l_assertion_context.same_named_type (boolean_type, current_class_impl) then
								set_fatal_error
								l_named_type := l_assertion_context.named_type
								error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
							end
							l_assertion_context.wipe_out
						end
						i := i + 1
					end
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
					if current_class = current_class_impl then
						an_invariants.set_assertions_checked
						if has_fatal_error then
							an_invariants.set_assertions_error
						end
					end
				end
				in_assertion := old_in_assertion
				in_invariant := old_in_invariant
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

feature {NONE} -- Feature validity

	check_attribute_validity (a_feature: ET_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_object_tests: ET_OBJECT_TEST_LIST
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_current_type_needed
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_constant_attribute_validity (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_object_tests: ET_OBJECT_TEST_LIST
			l_type: ET_TYPE
			l_constant: ET_CONSTANT
			l_bit_type: ET_BIT_TYPE
			l_integer_constant: ET_INTEGER_CONSTANT
			l_real_constant: ET_REAL_CONSTANT
			l_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_constant := a_feature.constant
				if l_constant.is_boolean_constant then
					if not l_type.same_named_type (current_universe_impl.boolean_type, current_type, current_class_impl) then
						set_fatal_error
						error_handler.report_vqmc1a_error (current_class, current_class_impl, a_feature)
					end
				elseif l_constant.is_character_constant then
					if current_universe_impl.character_8_type.same_named_type (l_type, current_type, current_class_impl) then
						-- OK.
					elseif current_universe_impl.character_32_type.same_named_type (l_type, current_type, current_class_impl) then
						-- OK.
					else
						set_fatal_error
						error_handler.report_vqmc2a_error (current_class, current_class_impl, a_feature)
					end
				elseif l_constant.is_integer_constant then
					l_integer_constant ?= l_constant
					check is_integer_constant: l_integer_constant /= Void end
					if l_integer_constant.cast_type /= Void then
							-- Check that the cast type is valid, and that the manifest value
							-- is representable as an instance of the cast type.
						l_context := new_context (current_type)
						check_integer_constant_validity (l_integer_constant, l_context)
						had_error := had_error or has_fatal_error
						free_context (l_context)
					end
					if current_universe_impl.integer_8_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_integer_8 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.integer_8_type)
					elseif current_universe_impl.integer_16_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_integer_16 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.integer_16_type)
					elseif current_universe_impl.integer_32_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_integer_32 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.integer_32_type)
					elseif current_universe_impl.integer_64_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_integer_64 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.integer_64_type)
					elseif current_universe_impl.natural_8_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_natural_8 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.natural_8_type)
					elseif current_universe_impl.natural_16_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_natural_16 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.natural_16_type)
					elseif current_universe_impl.natural_32_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_natural_32 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.natural_32_type)
					elseif current_universe_impl.natural_64_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_integer_constant.is_natural_64 then
							set_fatal_error
							error_handler.report_vqmc3b_error (current_class, current_class_impl, a_feature, l_integer_constant)
						end
						l_integer_constant.set_type (current_universe_impl.natural_64_type)
					else
						set_fatal_error
						error_handler.report_vqmc3a_error (current_class, current_class_impl, a_feature)
					end
				elseif l_constant.is_real_constant then
					l_real_constant ?= l_constant
					check is_real_constant: l_real_constant /= Void end
					if current_universe_impl.real_32_type.same_named_type (l_type, current_type, current_class_impl) then
							-- OK.
						l_real_constant.set_type (current_universe_impl.real_32_type)
					elseif current_universe_impl.real_64_type.same_named_type (l_type, current_type, current_class_impl) then
							-- OK.
						l_real_constant.set_type (current_universe_impl.real_64_type)
					else
						set_fatal_error
						error_handler.report_vqmc4a_error (current_class, current_class_impl, a_feature)
					end
				elseif l_constant.is_string_constant then
					if current_universe_impl.string_8_type.same_named_type (l_type, current_type, current_class_impl) then
						-- OK.
					elseif current_universe_impl.string_32_type.same_named_type (l_type, current_type, current_class_impl) then
						-- OK.
					elseif current_universe_impl.system_string_type.base_class.is_dotnet and then current_universe_impl.system_string_type.same_named_type (l_type, current_type, current_class_impl) then
						-- OK: this is an Eiffel for .NET extension.
					else
						set_fatal_error
						error_handler.report_vqmc5a_error (current_class, current_class_impl, a_feature)
					end
				elseif l_constant.is_bit_constant then
					l_bit_type ?= l_type.named_type (current_type)
					if l_bit_type /= Void then
-- TODO: check bit size.
					else
						set_fatal_error
						error_handler.report_vqmc6a_error (current_class, current_class_impl, a_feature)
					end
				else
						-- Internal error: no other kind of constant.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_deferred_function_validity (a_feature: ET_DEFERRED_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := had_error or has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_deferred_procedure_validity (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_do_function_validity (a_feature: ET_DO_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := had_error or has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := a_feature.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
			has_fatal_error := had_error
		end

	check_do_procedure_validity (a_feature: ET_DO_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := a_feature.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
			has_fatal_error := had_error
		end

	check_dotnet_attribute_validity (a_feature: ET_DOTNET_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		do
			check_attribute_validity (a_feature)
		end

	check_dotnet_constant_attribute_validity (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		do
			check_constant_attribute_validity (a_feature)
		end

	check_dotnet_function_validity (a_feature: ET_DOTNET_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := had_error or has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_dotnet_procedure_validity (a_feature: ET_DOTNET_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := had_error or has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_once_function_validity (a_feature: ET_ONCE_FUNCTION) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := had_error or has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := a_feature.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
			has_fatal_error := had_error
		end

	check_once_procedure_validity (a_feature: ET_ONCE_PROCEDURE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_arguments := a_feature.arguments
			if l_arguments /= Void then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := a_feature.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
			has_fatal_error := had_error
		end

	check_unique_attribute_validity (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_signature_type_validity (a_feature.implementation_feature.type)
			if not has_fatal_error then
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			l_object_tests := a_feature.object_tests
			if l_object_tests /= Void then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				if current_universe_impl.integer_8_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.integer_16_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.integer_32_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.integer_64_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.natural_8_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.natural_16_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.natural_32_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				elseif current_universe_impl.natural_64_type.same_named_type (l_type, current_type, current_class_impl) then
					-- Valid with ISE Eiffel. To be checked with other compilers.
				else
					set_fatal_error
					error_handler.report_vqui0a_error (current_class, current_class_impl, a_feature)
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

feature {NONE} -- Locals/Formal arguments validity

	check_formal_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST; a_feature: ET_ROUTINE) is
			-- Check validity of `an_arguments' of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_arguments_not_void: an_arguments /= Void
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			i, nb: INTEGER
			l_type: ET_TYPE
			l_formal: ET_FORMAL_ARGUMENT
			l_formals_impl: ET_FORMAL_ARGUMENT_LIST
			had_error: BOOLEAN
		do
				-- Note that validity rules VREG and VRFA have already been checked
				-- when flattening the features (in ET_FEATURE_FLATTENER).
			has_fatal_error := False
			nb := an_arguments.count
			if nb > 0 then
				l_formals_impl := a_feature.implementation_feature.arguments
				if l_formals_impl = Void or else l_formals_impl.count /= nb then
						-- Internal error: a feature should have the same number
						-- of formal arguments as its implementation feature.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					from i := 1 until i > nb loop
						l_formal := an_arguments.formal_argument (i)
						l_type := l_formal.type
						had_error := had_error or has_fatal_error
						check_signature_type_validity (l_formals_impl.formal_argument (i).type)
						if not has_fatal_error then
							report_formal_argument_declaration (l_formal)
							if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
							else
								report_argument_supplier (l_type, current_class, a_feature)
							end
						end
						i := i + 1
					end
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_inline_agent_formal_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST; an_agent: ET_INLINE_AGENT) is
			-- Check validity of `an_arguments' of `an_agent'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_arguments_not_void: an_arguments /= Void
			an_agent_not_void: an_agent /= Void
			consistent: an_agent = current_inline_agent
		local
			i, nb: INTEGER
			j, k, nb2: INTEGER
			l_type: ET_TYPE
			l_formal: ET_FORMAL_ARGUMENT
			l_name: ET_IDENTIFIER
			other_formal: ET_FORMAL_ARGUMENT
			l_other_feature: ET_FEATURE
			args: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_enclosing_agent: ET_INLINE_AGENT
			l_object_test: ET_NAMED_OBJECT_TEST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := an_arguments.count
				from i := 1 until i > nb loop
					l_formal := an_arguments.formal_argument (i)
					l_name := l_formal.name
					l_name.set_argument (True)
					l_name.set_seed (i)
					from j := 1 until j >= i loop
						other_formal := an_arguments.formal_argument (j)
						if other_formal.name.same_identifier (l_name) then
								-- Two formal arguments with the same name.
							set_fatal_error
							error_handler.report_vred0c_error (current_class, other_formal, l_formal, an_agent, current_feature)
						end
						j := j + 1
					end
					l_other_feature := current_class.named_query (l_name)
					if l_other_feature /= Void then
							-- This formal argument has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrfa0b_error (current_class, l_formal, an_agent, current_feature, l_other_feature)
					else
						l_other_feature := current_class.named_procedure (l_name)
						if l_other_feature /= Void then
								-- This formal argument has the same name as the
								-- final name of a feature in `current_class'.
							set_fatal_error
							error_handler.report_vrfa0b_error (current_class, l_formal, an_agent, current_feature, l_other_feature)
						end
					end
					nb2 := enclosing_inline_agents.count
					from j := 1 until j > nb2 loop
						l_enclosing_agent := enclosing_inline_agents.item (j)
						args := l_enclosing_agent.formal_arguments
						if args /= Void then
							k := args.index_of (l_name)
							if k /= 0 then
									-- This formal argument has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1a_error (current_class, l_formal, an_agent, args.formal_argument (k))
							end
						end
						l_locals := l_enclosing_agent.locals
						if l_locals /= Void then
							k := l_locals.index_of (l_name)
							if k /= 0 then
									-- This formal argument has the same name as a
									-- local variable of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1b_error (current_class, l_formal, an_agent, l_locals.local_variable (k))
							end
						end
						j := j + 1
					end
					args := current_feature.arguments
					if args /= Void then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This formal argument has the same name as a formal
								-- argument of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1a_error (current_class, l_formal, an_agent, args.formal_argument (k))
						end
					end
					l_locals := current_feature.locals
					if l_locals /= Void then
						k := l_locals.index_of (l_name)
						if k /= 0 then
								-- This formal argument has the same name as a
								-- local variable of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1b_error (current_class, l_formal, an_agent, l_locals.local_variable (k))
						end
					end
					l_object_test := current_object_test_scope.hidden_object_test (l_name)
					if l_object_test /= Void then
							-- This formal argument has the same name as an object-test local
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1e_error (current_class, l_formal, an_agent, l_object_test)
					end
					l_type := l_formal.type
					had_error := had_error or has_fatal_error
					check_signature_type_validity (l_type)
					if not has_fatal_error then
						report_inline_agent_formal_argument_declaration (l_formal)
						report_inline_agent_argument_supplier (l_type, current_class, current_feature)
					end
					i := i + 1
				end
			else
				nb := an_arguments.count
				from i := 1 until i > nb loop
					l_formal := an_arguments.formal_argument (i)
					l_type := l_formal.type
					had_error := had_error or has_fatal_error
					check_signature_type_validity (l_type)
					if not has_fatal_error then
						report_inline_agent_formal_argument_declaration (l_formal)
						report_inline_agent_argument_supplier (l_type, current_class, current_feature)
					end
					i := i + 1
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST; a_feature: ET_FEATURE) is
			-- Check validity of `a_locals' of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_locals_not_void: a_locals /= Void
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			i, j, k, nb: INTEGER
			l_local: ET_LOCAL_VARIABLE
			other_local: ET_LOCAL_VARIABLE
			l_name: ET_IDENTIFIER
			args: ET_FORMAL_ARGUMENT_LIST
			l_other_feature: ET_FEATURE
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_locals.count
				from i := 1 until i > nb loop
					l_local := a_locals.local_variable (i)
					l_name := l_local.name
					l_name.set_local (True)
					l_name.set_seed (i)
					from j := 1 until j >= i loop
						other_local := a_locals.local_variable (j)
						if other_local.name.same_identifier (l_name) then
								-- Two local variables with the same name.
							set_fatal_error
							error_handler.report_vreg0b_error (current_class, other_local, l_local, a_feature)
						end
						j := j + 1
					end
					args := a_feature.arguments
					if args /= Void then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of `a_feature' in `current_class'.
							set_fatal_error
							error_handler.report_vrle2a_error (current_class, l_local, a_feature, args.formal_argument (k))
						end
					end
					l_other_feature := current_class.named_query (l_name)
					if l_other_feature /= Void then
							-- This local variable has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrle1a_error (current_class, l_local, a_feature, l_other_feature)
					else
						l_other_feature := current_class.named_procedure (l_name)
						if l_other_feature /= Void then
								-- This local variable has the same name as the
								-- final name of a feature in `current_class'.
							set_fatal_error
							error_handler.report_vrle1a_error (current_class, l_local, a_feature, l_other_feature)
						end
					end
					l_type := l_local.type
					had_error := had_error or has_fatal_error
					check_local_type_validity (l_type)
					if not has_fatal_error then
						report_local_variable_declaration (l_local)
						report_local_supplier (l_type, current_class, a_feature)
					end
					i := i + 1
				end
			else
				nb := a_locals.count
				from i := 1 until i > nb loop
					l_local := a_locals.local_variable (i)
					l_type := l_local.type
					had_error := had_error or has_fatal_error
					check_local_type_validity (l_type)
					if not has_fatal_error then
						report_local_variable_declaration (l_local)
						report_local_supplier (l_type, current_class, a_feature)
					end
					i := i + 1
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_inline_agent_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST; an_agent: ET_INLINE_AGENT) is
			-- Check validity of `a_locals' of `an_agent'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_locals_not_void: a_locals /= Void
			an_agent_not_void: an_agent /= Void
			consistent: an_agent = current_inline_agent
		local
			i, k, nb: INTEGER
			j, nb2: INTEGER
			l_local: ET_LOCAL_VARIABLE
			other_local: ET_LOCAL_VARIABLE
			l_name: ET_IDENTIFIER
			args: ET_FORMAL_ARGUMENT_LIST
			l_other_feature: ET_FEATURE
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_enclosing_agent: ET_INLINE_AGENT
			l_type: ET_TYPE
			l_object_test: ET_NAMED_OBJECT_TEST
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_locals.count
				from i := 1 until i > nb loop
					l_local := a_locals.local_variable (i)
					l_name := l_local.name
					l_name.set_local (True)
					l_name.set_seed (i)
					from j := 1 until j >= i loop
						other_local := a_locals.local_variable (j)
						if other_local.name.same_identifier (l_name) then
								-- Two local variables with the same name.
							set_fatal_error
							error_handler.report_vred0d_error (current_class, other_local, l_local, an_agent, current_feature)
						end
						j := j + 1
					end
					args := an_agent.formal_arguments
					if args /= Void then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of `an_agent' in `current_class'.
							set_fatal_error
							error_handler.report_vrlv2b_error (current_class, l_local, an_agent, current_feature, args.formal_argument (k))
						end
					end
					l_other_feature := current_class.named_query (l_name)
					if l_other_feature /= Void then
							-- This local variable has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrlv1b_error (current_class, l_local, an_agent, current_feature, l_other_feature)
					else
						l_other_feature := current_class.named_procedure (l_name)
						if l_other_feature /= Void then
								-- This local variable has the same name as the
								-- final name of a feature in `current_class'.
							set_fatal_error
							error_handler.report_vrlv1b_error (current_class, l_local, an_agent, current_feature, l_other_feature)
						end
					end
					nb2 := enclosing_inline_agents.count
					from j := 1 until j > nb2 loop
						l_enclosing_agent := enclosing_inline_agents.item (j)
						args := l_enclosing_agent.formal_arguments
						if args /= Void then
							k := args.index_of (l_name)
							if k /= 0 then
									-- This local variable has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1c_error (current_class, l_local, an_agent, args.formal_argument (k))
							end
						end
						l_locals := l_enclosing_agent.locals
						if l_locals /= Void then
							k := l_locals.index_of (l_name)
							if k /= 0 then
									-- This local variable has the same name as a
									-- local variable of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1d_error (current_class, l_local, an_agent, l_locals.local_variable (k))
							end
						end
						j := j + 1
					end
					args := current_feature.arguments
					if args /= Void then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1c_error (current_class, l_local, an_agent, args.formal_argument (k))
						end
					end
					l_locals := current_feature.locals
					if l_locals /= Void then
						k := l_locals.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a
								-- local variable of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1d_error (current_class, l_local, an_agent, l_locals.local_variable (k))
						end
					end
					l_object_test := current_object_test_scope.hidden_object_test (l_name)
					if l_object_test /= Void then
							-- This local variable has the same name as an object-test local
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1f_error (current_class, l_local, an_agent, l_object_test)
					end
					l_type := l_local.type
					had_error := had_error or has_fatal_error
					check_local_type_validity (l_type)
					if not has_fatal_error then
						report_inline_agent_local_variable_declaration (l_local)
						report_inline_agent_local_supplier (l_type, current_class, current_feature)
					end
					i := i + 1
				end
			else
				nb := a_locals.count
				from i := 1 until i > nb loop
					l_local := a_locals.local_variable (i)
					l_type := l_local.type
					had_error := had_error or has_fatal_error
					check_local_type_validity (l_type)
					if not has_fatal_error then
						report_inline_agent_local_variable_declaration (l_local)
						report_inline_agent_local_supplier (l_type, current_class, current_feature)
					end
					i := i + 1
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_object_tests_validity (a_object_tests: ET_OBJECT_TEST_LIST; a_feature: ET_FEATURE) is
			-- Check validity of `a_object_tests' of `a_feature'.
			-- These are all the named object-tests declared in `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the validity of the declared types of the object-test
			-- locals and scope intersections will be checked when it appears
			-- in the class text.
		require
			a_object_tests_not_void: a_object_tests /= Void
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			i, j, nb: INTEGER
			l_object_test: ET_NAMED_OBJECT_TEST
			l_other_object_test: ET_NAMED_OBJECT_TEST
			l_name: ET_IDENTIFIER
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_object_tests.count
				from i := 1 until i > nb loop
					l_object_test := a_object_tests.object_test (i)
					l_name := l_object_test.name
					l_name.set_object_test_local (True)
					l_name.set_seed (i)
					if current_system.is_ise and then current_system.ise_version < ise_6_4_7_7252 then
							-- ISE used to have a validity rule VUOT-3 which forbids two
							-- object-tests in the same feature (or in the same inline
							-- agent) to have the same local name.
						from j := 1 until j >= i loop
							l_other_object_test := a_object_tests.object_test (j)
							if l_other_object_test.name.same_identifier (l_name) then
									-- Two object-test-locals with the same name.
								set_fatal_error
								error_handler.report_vuot3a_error (current_class, l_object_test, l_other_object_test, a_feature)
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

	check_inline_agent_object_tests_validity (a_object_tests: ET_OBJECT_TEST_LIST; an_agent: ET_INLINE_AGENT) is
			-- Check validity of `a_object_tests' of `an_agent'.
			-- These are all the object-tests declared in `an_agent'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the validity of the declared types of the object-test
			-- locals and scope intersections will be checked when it appears
			-- in the class text.
		require
			a_object_tests_not_void: a_object_tests /= Void
			an_agent_not_void: an_agent /= Void
			consistent: an_agent = current_inline_agent
		local
			i, j, nb: INTEGER
			l_object_test: ET_NAMED_OBJECT_TEST
			l_other_object_test: ET_NAMED_OBJECT_TEST
			l_name: ET_IDENTIFIER
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_object_tests.count
				from i := 1 until i > nb loop
					l_object_test := a_object_tests.object_test (i)
					l_name := l_object_test.name
					l_name.set_object_test_local (True)
					l_name.set_seed (i)
					if current_system.is_ise and then current_system.ise_version < ise_6_4_7_7252 then
							-- ISE used to have a validity rule VUOT-3 which forbids two
							-- object-tests in the same feature (or in the same inline
							-- agent) to have the same local name.
						from j := 1 until j >= i loop
							l_other_object_test := a_object_tests.object_test (j)
							if l_other_object_test.name.same_identifier (l_name) then
									-- Two object-test-locals with the same name.
								set_fatal_error
								error_handler.report_vuot3b_error (current_class, l_object_test, l_other_object_test)
							end
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Type checking

	check_signature_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears in signatures.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_class_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
			else
				if current_inline_agent /= Void then
						-- We check the validity of the signature types of inline agents
						-- in their implementation class because, as opposed to the
						-- signature types of features, they have not been resolved (i.e.
						-- if they contain formal generic parameter, these parameters may
						-- need to be resolved in the `current_class').
					type_checker.check_type_validity (a_type, current_inline_agent, current_class_impl, current_class_impl)
				else
					type_checker.check_type_validity (a_type, current_feature_impl, current_class_impl, current_type)
				end
				if type_checker.has_fatal_error then
					set_fatal_error
				else
					if a_type.is_type_expanded (current_type) then
						l_class_type ?= a_type.shallow_named_type (current_type)
						if l_class_type /= Void then
							type_checker.check_creation_type_validity (l_class_type, current_class_impl, current_type, a_type.position)
							if type_checker.has_fatal_error then
								set_fatal_error
							end
						end
					end
				end
			end
		end

	check_local_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears
			-- in local variable declarations.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_class_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
				-- We check the validity of the types of the local variables
				-- in their implementation class because, as opposed to the
				-- signature types of features, they have not been resolved
				-- (i.e. if they contain formal generic parameter, these
				-- parameters may need to be resolved in the `current_class').
			type_checker.check_type_validity (a_type, current_closure_impl, current_class_impl, current_class_impl)
			if type_checker.has_fatal_error then
				set_fatal_error
			else
				if a_type.is_type_expanded (current_type) then
					l_class_type ?= a_type.shallow_named_type (current_type)
					if l_class_type /= Void then
						type_checker.check_creation_type_validity (l_class_type, current_class_impl, current_type, a_type.position)
						if type_checker.has_fatal_error then
							set_fatal_error
						end
					end
				end
			end
		end

	check_type_validity (a_type: ET_TYPE) is
			-- Check validity of `a_type' when it appears in the
			-- body, assertions or rescue clause of a feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			has_fatal_error := False
			type_checker.check_type_validity (a_type, current_closure_impl, current_class_impl, current_class_impl)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	check_creation_type_validity (a_type: ET_CLASS_TYPE; a_position: ET_POSITION) is
			-- Check validity of `a_type' as a creation type in `current_type'.
			-- Note that `a_type' should already be a valid type by itself
			-- (call `check_type_validity' for that).
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_position_not_void: a_position /= Void
		do
			has_fatal_error := False
			type_checker.check_creation_type_validity (a_type, current_class_impl, current_type, a_position)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	resolved_formal_parameters (a_type: ET_TYPE; a_current_class_impl: ET_CLASS; a_current_type: ET_BASE_TYPE): ET_TYPE is
			-- Replace formal generic parameters in `a_type' (when
			-- written in class `a_current_class_impl') by their
			-- corresponding actual parameters in `a_current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_current_class_impl_not_void: a_current_class_impl /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		do
			has_fatal_error := False
			Result := type_checker.resolved_formal_parameters (a_type, a_current_class_impl, a_current_type)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			resolved_type_not_void: Result /= Void
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Instruction validity

	check_assigner_instruction_validity (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- An assigner instruction is of the form:
			--    call := source
			-- where 'call' is either:
			--    target.f
			--    target.f (args)
			--    target [args]
			-- We have to check that:
			--  * 'call' (including 'target' and 'args') and 'source' are valid.
			--  * the type of 'source' conforms or converts to the type
			--    of 'call' (see VBAC-1, ECMA 367-2 p.119).
			--  * 'f' or the feature with 'alias "[]"' is a query with
			--    an assigner procedure (see VBAC-2, ECMA 367-2 p.119),
			--    or 'f' (with no arguments) is a Tuple label (not in ECMA).
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_call: ET_FEATURE_CALL_EXPRESSION
			l_call_context: ET_NESTED_TYPE_CONTEXT
			l_target: ET_EXPRESSION
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_source: ET_EXPRESSION
			l_source_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_CALL_NAME
			l_label: ET_IDENTIFIER
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_assigner: ET_ASSIGNER
			l_assigner_seed: INTEGER
			l_assigner_procedure: ET_PROCEDURE
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_type: ET_TYPE
			l_seed: INTEGER
			i, nb: INTEGER
			nb_args: INTEGER
			l_convert_expression: ET_CONVERT_EXPRESSION
			any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			report_current_type_needed
			l_call := an_instruction.call
			l_target := l_call.target
			l_target_context := new_context (current_type)
			l_name := l_call.name
			l_actuals := l_call.arguments
			any_type := current_system.any_type
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the class where this code has been written.
				if current_class_impl /= current_class then
						-- Bad luck: we are not in the context of the class where this
						-- code has been written. An error should have been reported
						-- when processing `current_feature_impl' in `current_class_impl'.
						-- Check the validity of the target of the call despite the error.
					check_expression_validity (l_target, l_target_context, any_type)
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: either `l_name' should have been resolved in
							-- the implementation feature or an error should have been reported.
						error_handler.report_giaaa_error
					end
				else
						-- Check the validity of the target of the call.
						-- After this, `l_target_context' will represent the type of the target.
					check_expression_validity (l_target, l_target_context, any_type)
					if not has_fatal_error then
							-- Determine the base class of the target in order to find
							-- the feature of the call in this class.
						l_class := l_target_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
								-- There was an error when processing this class in
								-- a previous compilation pass. The error was reported
								-- at that time, so no need to report it here again.
								-- We just need to flag that there is an error.
							set_fatal_error
						else
							if l_class.is_dotnet then
									-- A class coming from a .NET assembly can contain overloaded
									-- features (i.e. several features with the same name).
									-- We have to be careful about that here.
								l_class.add_overloaded_queries (l_name, overloaded_queries)
								nb := overloaded_queries.count
								if nb = 0 then
									-- The error is reported later.
								elseif nb = 1 then
									l_query := overloaded_queries.first
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
										-- More than one query with that name.
										-- Start to remove those with the wrong number of arguments.
									nb_args := l_call.arguments_count
									from i := nb until i < 1 loop
										if overloaded_queries.item (i).arguments_count /= nb_args then
											overloaded_queries.remove (i)
										end
										i := i - 1
									end
									nb := overloaded_queries.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_query := overloaded_queries.first
										l_seed := l_query.first_seed
										l_name.set_seed (l_seed)
									elseif nb_args = 0 then
											-- Ambiguity in overloaded queries.
-- TODO: report VIOF
									else
										keep_best_overloaded_features (overloaded_queries, l_actuals, l_target_context)
										if not has_fatal_error then
											nb := overloaded_queries.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_query := overloaded_queries.first
												l_seed := l_query.first_seed
												l_name.set_seed (l_seed)
											else
													-- Ambiguity in overloaded queries.
-- TODO: report VIOF
											end
										end
									end
								end
								overloaded_queries.wipe_out
							end
							if l_query = Void and not has_fatal_error then
									-- We didn't find the feature (a query in our case) of the call
									-- when taking into account .NET peculiarities.
								l_query := l_class.named_query (l_name)
								if l_query /= Void then
										-- We found it.
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
									if l_class.is_tuple_class then
											-- Check whether this is a tuple label.
											-- For example:
											--     target: TUPLE [f: INTEGER]
											--     target.f := 5
										l_label ?= l_name
										if l_label /= Void then
											l_seed := l_target_context.base_type_index_of_label (l_label)
											if l_seed /= 0 then
													-- We found it.
												l_label.set_tuple_label (True)
												l_label.set_seed (l_seed)
											end
										end
									end
									if l_seed = 0 then
											-- It's not a query of the class nor a Tuple label.
											-- Check to see whether it is a procedure.
										l_procedure := l_class.named_procedure (l_name)
										if l_procedure /= Void then
												-- Report error: in a call expression, the feature has to be a query.
											set_fatal_error
											error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
										else
												-- Report error: there is no feature with that name in the
												-- base class of the target of the call.
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VUEX-2 (ETL2 p.368).
											set_fatal_error
											error_handler.report_vuex2a_error (current_class, l_name, l_class)
										end
									end
								end
							end
						end
					end
				end
			end
			if has_fatal_error then
				if l_actuals /= Void then
						-- Check the validity of the arguments of the call despite the error.
					check_expressions_validity (l_actuals)
					has_fatal_error := True
				end
			elseif l_name.is_tuple_label then
					-- This is a tuple label.
					-- For example:
					--     target: TUPLE [f: INTEGER]
					--     target.f := 5
				if l_label = Void then
						-- We didn't find the label yet. This is because the seed was already
						-- computed in a proper ancestor (or in another generic derivation) of
						-- `current_class' where this code was written.
						-- Check the validity of the target of the call.
						-- After this, `l_target_context' will represent the type of the target.
					check_expression_validity (l_target, l_target_context, any_type)
					if not has_fatal_error then
							-- Determine the base class of the target.
							-- It has to be the class 'TUPLE'.
						l_class := l_target_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
								-- There was an error when processing this class in
								-- a previous compilation pass. The error was reported
								-- at that time, so no need to report it here again.
								-- We just need to flag that there is an error.
							set_fatal_error
						elseif not l_class.is_tuple_class then
								-- Internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
				if l_actuals /= Void and then not l_actuals.is_empty then
						-- A call to a Tuple label cannot have arguments.
						-- Check the validity of the arguments despite the error.
					check_expressions_validity (l_actuals)
						-- Now, report the error.
					set_fatal_error
					if current_class = current_class_impl then
						error_handler.report_vuar1c_error (current_class, l_name)
					elseif not has_implementation_error (current_feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing `current_feature_impl' in `current_class_impl'.
						error_handler.report_giaaa_error
					end
				elseif l_seed > l_target_context.base_type_actual_count then
						-- Internal error: the index of the labeled
						-- actual parameter cannot be out of bound because
						-- for a Tuple type to conform to another Tuple type
						-- it needs to have more actual parameters.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_type := tokens.formal_parameter (l_seed)
				end
			else
					-- It's either:
					--    target [args] := source
					--    target.f := source
					--    target.f (args) := source
					-- where 'f' is a query.
				if l_query = Void then
						-- We didn't find the query yet. This is because the seed was already
						-- computed in a proper ancestor (or in another generic derivation) of
						-- `current_class' where this code was written.
						-- Check the validity of the target of the call.
						-- After this, `l_target_context' will represent the type of the target.
					check_expression_validity (l_target, l_target_context, any_type)
					if not has_fatal_error then
						l_class := l_target_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_query := l_class.seeded_query (l_seed)
							if l_query = Void then
									-- Internal error: if we got a seed, the
									-- `l_query' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
				if l_query = Void then
					if l_actuals /= Void then
							-- Check the validity of the arguments of the call despite the error.
						check has_fatal_error: has_fatal_error end
						check_expressions_validity (l_actuals)
						has_fatal_error := True
					end
				else
					check l_class_not_void: l_class /= Void end
					if not l_query.is_exported_to (current_class) then
							-- Report error: the feature is not exported to `current_class'.
						set_fatal_error
						error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_query, l_class)
					end
					had_error := has_fatal_error
						-- Check validity of the arguments of the call.
					check_actual_arguments_validity (l_actuals, l_target_context, l_name, l_query, l_class)
					has_fatal_error := has_fatal_error or had_error
					l_type := l_query.type
				end
			end
				-- Check the validity of the source.
			l_source := an_instruction.source
			l_source_context := new_context (current_type)
			if l_type = Void then
					-- The call is not valid. As a consequence its type has not
					-- been computed correctly. We will consider that it is of
					-- type 'ANY' when checking the validity of the source.
				check has_fatal_error: has_fatal_error end
				check_expression_validity (l_source, l_source_context, any_type)
				has_fatal_error := True
			else
					-- After this, `l_source_context' will represent the type of the source.
					-- In some cases we need the type of the call in order to determine the
					-- type of the source. For example:
					--    target.f := << "gobo", 'a', 2 >>
					-- where 'f' is declared of type 'ARRAY [COMPARABLE]' in the base class of 'target'.
					-- The type of the manifest array will be 'ARRAY [COMPARABLE]'. Without the
					-- this hint it could have been 'ARRAY [HASHABLE]' or even 'ARRAY [ANY]'.
				l_target_context.force_last (l_type)
				l_call_context := l_target_context
				had_error := has_fatal_error
				check_expression_validity (l_source, l_source_context, l_call_context)
				if not has_fatal_error then
						-- Both source and call have valid types. Check whether the type
						-- of the source conforms or converts to the type of the call.
					if not l_source_context.conforms_to_context (l_call_context) then
							-- The source does not conform to the call.
							-- Try to find out whether it converts to it.
						l_convert_expression := convert_expression (l_source, l_source_context, l_call_context)
						if has_fatal_error then
							-- Nothing to be done.
						elseif l_convert_expression /= Void then
								-- Insert the conversion feature call in the AST.
								-- Convertibility should be resolved in the implementation class.
							check implementation_class: current_class = current_class_impl end
							an_instruction.set_source (l_convert_expression)
						else
								-- Report error: the type of the source does not conform nor convert
								-- to the type of the call. See VBAC-1, ECMA 367-2 p.119.
							set_fatal_error
							error_handler.report_vbac1a_error (current_class, current_class_impl, an_instruction, l_source_context.named_type, l_target_context.named_type)
						end
					end
				end
				l_target_context.remove_last
				has_fatal_error := has_fatal_error or had_error
					-- Check whether the query has an associated assigner procedure.
				if l_name.is_tuple_label then
					if not has_fatal_error then
						an_instruction.set_name (l_name)
						report_tuple_label_setter (an_instruction, l_target_context)
					end
				elseif l_query /= Void then
					check l_class_not_void: l_class /= Void end
					l_assigner_seed := an_instruction.name.seed
					if l_assigner_seed = 0 then
							-- We should find the assigner in the context of the
							-- class where this code has been written.
						if current_class /= current_class_impl then
								-- Bad luck: we are not in the context of the class where this
								-- code has been written. An error should have been reported
								-- when processing `current_feature_impl' in `current_class_impl'.
							set_fatal_error
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: either `l_assigner_seed' should have been resolved
									-- in the implementation feature or an error should have been reported.
								error_handler.report_giaaa_error
							end
						else
							l_assigner := l_query.assigner
							if l_assigner = Void then
									-- Report error: `l_query' should have an assigner command
									-- associated with it. See VBAC-2, ECMA 367-2 p.119.
								set_fatal_error
								error_handler.report_vbac2a_error (current_class, an_instruction, l_query, l_class)
							else
								l_assigner_seed := l_assigner.feature_name.seed
								if l_assigner_seed = 0 then
										-- Internal error: invalid assigner. This error should have
										-- already been reported when flattening features of `l_class'
										-- (class containing `l_query').
									set_fatal_error
									error_handler.report_giaaa_error
								else
									an_instruction.set_name (l_assigner.feature_name)
								end
							end
						end
					end
					if l_assigner_seed /= 0 then
						l_assigner_procedure := l_class.seeded_procedure (l_assigner_seed)
						if l_assigner_procedure = Void then
								-- Internal error: if we got a seed, the
								-- `l_assigner_procedure' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif not has_fatal_error then
							report_qualified_call_instruction (an_instruction, l_target_context, l_assigner_procedure)
						end
					end
				end
			end
			free_context (l_target_context)
		end

	check_assignment_validity (an_instruction: ET_ASSIGNMENT) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- An assignment is of the form:
			--    target := source
			-- We have to check that:
			--  * both 'target' and 'source' are valid.
			--  * the type of 'source' either conforms or converts to the type of 'target'.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_target: ET_WRITABLE
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_source: ET_EXPRESSION
			l_source_context: ET_NESTED_TYPE_CONTEXT
			l_convert_expression: ET_CONVERT_EXPRESSION
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_target := an_instruction.target
			l_target_context := new_context (current_type)
				-- Check the validity of the target.
				-- After this, `l_target_context' will represent the type of the target.
			check_writable_validity (l_target, l_target_context)
			if has_fatal_error then
					-- The target is not valid. As a consequence its type might not
					-- have been computed correctly. We will consider that it is of
					-- type 'ANY' when checking the validity of the source.
				had_error := True
				l_target_context.wipe_out
				l_target_context.force_last (current_system.any_type)
			end
				-- Check the validity of the source.
				-- After this, `l_source_context' will represent the type of the source.
				-- In some cases we need the type of the target in order to determine the
				-- type of the source. For example:
				--    target: ARRAY [COMPARABLE]
				--    target := << "gobo", 'a', 2 >>
				-- The type of the manifest array will be 'ARRAY [COMPARABLE]'. Without the
				-- this hint it could have been 'ARRAY [HASHABLE]' or even 'ARRAY [ANY]'.
			l_source := an_instruction.source
			l_source_context := new_context (current_type)
			check_expression_validity (l_source, l_source_context, l_target_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
					-- Both source and target are valid. Check whether the type of the
					-- source conforms or converts to the type of the target.
				if not l_source_context.conforms_to_context (l_target_context) then
						-- The source does not conform to the target.
						-- Try to find out whether it converts to it.
					l_convert_expression := convert_expression (l_source, l_source_context, l_target_context)
					if has_fatal_error then
						-- Nothing to be done.
					elseif l_convert_expression /= Void then
							-- Insert the conversion feature call in the AST.
							-- Convertibility should be resolved in the implementation class.
						check implementation_class: current_class = current_class_impl end
						an_instruction.set_source (l_convert_expression)
						report_assignment (an_instruction)
					elseif
						current_system.is_ise and current_class /= current_class_impl and
						(current_class.is_basic or current_class.is_typed_pointer_class)
					then
							-- Compatibility with ISE 5.6.0610.
						report_assignment (an_instruction)
					else
							-- The type of the source does not conform nor convert to the type of the target.
						set_fatal_error
						error_handler.report_vjar0a_error (current_class, current_class_impl, an_instruction, l_source_context.named_type, l_target_context.named_type)
					end
				else
					report_assignment (an_instruction)
				end
			end
			free_context (l_source_context)
			free_context (l_target_context)
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- An assignment attempt is of the form:
			--    target ?= source
			-- We have to check that:
			--  * both 'target' and 'source' are valid
			--  * the type of 'target' is a reference type, unless we are under .NET or
			--    we are complying to a version of ISE greater than or equal to 5.7.
			--
			-- Note that assignment attempts are not supported in ECMA Eiffel 367-2.
			-- They are supported here for backward compatibility with ETL2.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_target: ET_WRITABLE
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_source: ET_EXPRESSION
			l_source_context: ET_NESTED_TYPE_CONTEXT
			l_target_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_target := an_instruction.target
			l_target_context := new_context (current_type)
				-- Check the validity of the target.
				-- After this call `l_target_context' will represent the type of the target.
			check_writable_validity (l_target, l_target_context)
			if has_fatal_error then
					-- The target is not valid. As a consequence its type might not
					-- have been computed correctly. We will consider that it is of
					-- type 'ANY' when checking the validity of the source.
				had_error := True
				l_target_context.wipe_out
				l_target_context.force_last (current_system.any_type)
			elseif not (current_system.is_dotnet or (current_system.is_ise and then current_system.ise_version >= ise_5_7_0)) and not l_target_context.is_type_reference then
					-- Assignment attempts with expanded targets are allowed in Eiffel for .NET
					-- and versions of ISE greater than or equal to 5.7. Otherwise, report a
					-- VJRV validity error.
				if current_class = current_class_impl then
					had_error := True
					set_fatal_error
					l_target_named_type := l_target_context.named_type
					error_handler.report_vjrv0a_error (current_class, current_class_impl, l_target, l_target_named_type)
				elseif not current_class_impl.is_any_class or else not current_system.is_ise then
						-- Note: Do not report this error if the assignment
						-- attempt appears in class ANY because of a design
						-- bug in ISE's class ANY.
					had_error := True
					set_fatal_error
					l_target_named_type := l_target_context.named_type
					error_handler.report_vjrv0a_error (current_class, current_class_impl, l_target, l_target_named_type)
				end
			end
				-- Check the validity of the source.
				-- After this call `l_source_context' will represent the type of the source.
				-- In some cases we need the type of the target in order to determine the
				-- type of the source. For example:
				--    target: ARRAY [COMPARABLE]
				--    target ?= << "gobo", 'a', 2 >>
				-- The type of the manifest array will be 'ARRAY[COMPARABLE]'. Without the
				-- this hint it could have been 'ARRAY[HASHABLE]' or even 'ARRAY[ANY]'.
			l_source := an_instruction.source
			l_source_context := new_context (current_type)
			check_expression_validity (l_source, l_source_context, l_target_context)
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				report_assignment_attempt (an_instruction)
			end
			free_context (l_source_context)
			free_context (l_target_context)
		end

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_call_instruction_validity (an_instruction: ET_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			if an_instruction.is_qualified_call then
				check_qualified_call_instruction_validity (an_instruction)
			else
				check_unqualified_call_instruction_validity (an_instruction)
			end
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
			l_expression: ET_EXPRESSION
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			in_check_instruction := True
			boolean_type := current_universe_impl.boolean_type
			l_assertion_context := new_context (current_type)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				l_expression := an_instruction.assertion (i).expression
				if l_expression /= Void then
					check_expression_validity (l_expression, l_assertion_context, boolean_type)
					if has_fatal_error then
						had_error := True
					elseif not l_assertion_context.same_named_type (boolean_type, current_class_impl) then
						set_fatal_error
						had_error := True
						l_named_type := l_assertion_context.named_type
						error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
					end
					l_assertion_context.wipe_out
				end
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
			free_context (l_assertion_context)
			in_check_instruction := False
		end

	check_create_instruction_validity (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_creation_instruction_validity (an_instruction: ET_CREATION_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_creation_context: ET_NESTED_TYPE_CONTEXT
			l_creation_type: ET_TYPE
			l_class: ET_CLASS
			l_creation_named_type: ET_NAMED_TYPE
			l_target_named_type: ET_NAMED_TYPE
			l_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			l_formal_parameter: ET_FORMAL_PARAMETER
			l_formal_parameters: ET_FORMAL_PARAMETER_LIST
			l_creator: ET_CONSTRAINT_CREATOR
			l_index: INTEGER
			l_class_type: ET_CLASS_TYPE
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_target: ET_WRITABLE
			l_target_type: ET_TYPE
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_explicit_creation_type: ET_TYPE
			l_seed: INTEGER
			l_call: ET_QUALIFIED_CALL
			l_name: ET_FEATURE_NAME
			l_position: ET_POSITION
			had_error: BOOLEAN
			l_result: ET_RESULT
			l_type: ET_TYPE
			l_identifier: ET_IDENTIFIER
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local_seed: INTEGER
			l_name_identifier: ET_IDENTIFIER
			l_name_position: ET_POSITION
			i, nb: INTEGER
			nb_args: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENTS
		do
			has_fatal_error := False
			l_target := an_instruction.target
			l_target_context := new_context (current_type)
			l_explicit_creation_type := an_instruction.type
			l_creation_context := new_context (current_type)
			if l_explicit_creation_type /= Void then
				check_type_validity (l_explicit_creation_type)
				l_position := l_explicit_creation_type.position
					-- Check whether the creation type, as it appears in the class where
					-- this creation instruction has been written, depends on the type of
					-- the 'Current' entity.
				if not has_fatal_error and then not l_explicit_creation_type.is_base_type then
						-- The explicit creation type contains formal generic parameters
						-- or anchored types whose resolved value may vary in various
						-- descendant classes/types.
					report_current_type_needed
				end
			else
				l_position := l_target.position
					-- Check whether the creation type, as it appears in the class where
					-- this creation instruction has been written, depends on the type of
					-- the 'Current' entity.
				l_result ?= l_target
				if l_result /= Void then
						-- Use type of implementation feature because the types of the signature
						-- of `current_feature' might have been resolved for `current_class'
						-- (or for its parent class when processing precursors in the context
						-- of current class).
					l_type := current_closure_impl.type
					if l_type = Void then
						-- This error will be reported in `check_writable_validity'.
					elseif not l_type.is_base_type then
							-- The type of 'Result' contains formal generic parameters
							-- or anchored types whose resolved value may vary in various
							-- descendant classes/types.
						report_current_type_needed
					end
				else
					l_identifier ?= l_target
					if l_identifier /= Void then
						if l_identifier.is_local then
							l_local_seed := l_identifier.seed
							l_locals := current_closure_impl.locals
							if l_locals = Void then
								-- This error will be reported in `check_writable_validity'.
							elseif l_local_seed < 1 or l_local_seed > l_locals.count then
								-- This error will be reported in `check_writable_validity'.
							else
									-- Contrary to the types appearing in the signatures, types of
									-- local variables in the AST are those found in the implementation
									-- class of `feature_impl', i.e. not resolved yet.
								l_type := l_locals.local_variable (l_local_seed).type
								if not l_type.is_base_type then
										-- The type of the local variable contains formal generic parameters
										-- or anchored types whose resolved value may vary in various
										-- descendant classes/types.
									report_current_type_needed
								end
							end
						else
								-- This is an attribute. Its type may vary in various
								-- descendant classes/types.
							report_current_type_needed
						end
					end
				end
			end
			if not has_fatal_error then
				l_call := an_instruction.creation_call
				if l_call /= Void then
					l_name := l_call.name
					l_actuals := l_call.arguments
					l_seed := l_name.seed
					if l_seed = 0 then
							-- We need to resolve `l_name' in the implementation
							-- class of `current_feature_impl' first.
						if current_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: `l_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
							check_writable_validity (l_target, l_target_context)
							if not has_fatal_error then
								l_target_type := l_target_context.last
								if l_explicit_creation_type /= Void then
									l_creation_type := l_explicit_creation_type
								else
									l_creation_type := l_target_type
								end
								l_creation_context.force_last (l_creation_type)
								l_class := l_creation_type.base_class (current_type)
								l_class.process (current_system.interface_checker)
								if not l_class.interface_checked or else l_class.has_interface_error then
									set_fatal_error
								else
									if l_class.is_dotnet then
										l_class.add_overloaded_procedures (l_name, overloaded_procedures)
										nb := overloaded_procedures.count
										if nb = 0 then
											-- The error is reported later.
										elseif nb = 1 then
											l_procedure := overloaded_procedures.first
											l_seed := l_procedure.first_seed
											l_name.set_seed (l_seed)
										else
												-- More than one procedure with that name.
												-- Start to remove those with the wrong number of arguments
												-- or which are not creators.
											nb_args := l_call.arguments_count
											from i := nb until i < 1 loop
-- TODO: remove non-creators
												if overloaded_procedures.item (i).arguments_count /= nb_args then
													overloaded_procedures.remove (i)
												end
												i := i - 1
											end
											nb := overloaded_procedures.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_procedure := overloaded_procedures.first
												l_seed := l_procedure.first_seed
												l_name.set_seed (l_seed)
											elseif nb_args = 0 then
													-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
											else
												keep_best_overloaded_features (overloaded_procedures, l_actuals, l_creation_context)
												if not has_fatal_error then
													nb := overloaded_procedures.count
													if nb = 0 then
														-- The error is reported later.
													elseif nb = 1 then
														l_procedure := overloaded_procedures.first
														l_seed := l_procedure.first_seed
														l_name.set_seed (l_seed)
													else
															-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
													end
												end
											end
										end
										overloaded_procedures.wipe_out
									end
									if l_procedure = Void and not has_fatal_error then
										l_procedure := l_class.named_procedure (l_name)
										if l_procedure /= Void then
											l_seed := l_procedure.first_seed
											l_name.set_seed (l_seed)
										else
											l_query := l_class.named_query (l_name)
											if l_query /= Void then
													-- This is not a procedure.
												set_fatal_error
												error_handler.report_vgcc6d_error (current_class, l_name, l_query, l_class)
											else
												set_fatal_error
													-- ISE Eiffel 5.4 reports this error as a VEEN,
													-- but it is in fact a VUEX-2 (ETL2 p.368).
												error_handler.report_vuex2a_error (current_class_impl, l_name, l_class)
											end
										end
									end
								end
							end
						end
					end
				else
					l_name := tokens.default_create_feature_name
					l_seed := current_system.default_create_seed
				end
			end
			if not has_fatal_error then
				if l_procedure = Void then
					check_writable_validity (l_target, l_target_context)
					if not has_fatal_error then
						l_target_type := l_target_context.last
						if l_explicit_creation_type /= Void then
							l_explicit_creation_type := resolved_formal_parameters (l_explicit_creation_type, current_class_impl, current_type)
							if not has_fatal_error then
								l_creation_type := l_explicit_creation_type
							end
						else
							l_creation_type := l_target_type
						end
					end
					if not has_fatal_error then
						l_creation_context.force_last (l_creation_type)
						l_class := l_creation_type.base_class (current_type)
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						elseif l_seed /= 0 then
							l_procedure := l_class.seeded_procedure (l_seed)
							if l_procedure = Void then
									-- Report internal error: if we got a seed, the
									-- `l_procedure' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check
					l_class_not_void: l_class /= Void
					l_creation_type_not_void: l_creation_type /= Void
				end
				if l_explicit_creation_type /= Void then
					if not l_explicit_creation_type.conforms_to_type (l_target_type, current_type, current_type) then
						set_fatal_error
						l_creation_named_type := l_explicit_creation_type.named_type (current_type)
						l_target_named_type := l_target_type.named_type (current_type)
						error_handler.report_vgcc3a_error (current_class, current_class_impl, an_instruction, l_creation_named_type, l_target_named_type)
					else
						report_create_supplier (l_explicit_creation_type, current_class, current_feature)
					end
				end
				l_creation_named_type := l_creation_type.shallow_named_type (current_type)
				l_class_type ?= l_creation_named_type
				if l_class_type /= Void then
					had_error := has_fatal_error
					check_creation_type_validity (l_class_type, l_position)
					if had_error then
						set_fatal_error
					end
				end
				if l_procedure = Void then
					check
							-- No creation call, and feature 'default_create' not
							-- supported by the underlying Eiffel compiler.
						no_call: l_call = Void
						no_default_create: current_system.default_create_seed = 0
					end
					if l_class.creators /= Void then
							-- The class explicitly declares creation procedures,
							-- so the creation call was required.
						set_fatal_error
						error_handler.report_vgcc5b_error (current_class, current_class_impl, an_instruction, l_class)
					elseif l_class.is_deferred then
							-- The class is deferred, so the creation is invalid.
						set_fatal_error
						error_handler.report_vgcc1b_error (current_class, current_class_impl, an_instruction, l_class)
					end
				else
					l_formal_parameter_type ?= l_creation_named_type
					if l_formal_parameter_type /= Void then
						l_index := l_formal_parameter_type.index
						l_formal_parameters := current_class.formal_parameters
						if l_formal_parameters = Void or else l_index > l_formal_parameters.count then
								-- Internal error: `l_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_formal_parameter := l_formal_parameters.formal_parameter (l_index)
							l_creator := l_formal_parameter.creation_procedures
							if l_creator = Void or else not l_creator.has_feature (l_procedure) then
								set_fatal_error
								if l_name = tokens.default_create_feature_name then
										-- The creation has no call part. Make sure that
										-- the error message will give a valid position.
									create l_name_identifier.make (l_name.name)
									l_name_position := an_instruction.last_position
									l_name_identifier.set_position (l_name_position.line, l_name_position.column)
									l_name := l_name_identifier
								end
								error_handler.report_vgcc8b_error (current_class, current_class_impl, l_name, l_procedure, l_class, l_formal_parameter)
							end
						end
					elseif not l_procedure.is_creation_exported_to (current_class, l_class) then
							-- The procedure is not a creation procedure exported to `current_class',
							-- and it is not the implicit creation procedure 'default_create'.
						if current_class /= current_class_impl and current_class.is_deferred and l_creation_type.is_like_current then
							-- In case of flat Degree 3, it is OK to create an entity
							-- declared of type 'like Current' in the current class
							-- if the current class is deferred.
						else
							set_fatal_error
							if l_name = tokens.default_create_feature_name then
									-- The creation has no call part. Make sure that
									-- the error message will give a valid position.
								create l_name_identifier.make (l_name.name)
								l_name_position := an_instruction.last_position
								l_name_identifier.set_position (l_name_position.line, l_name_position.column)
								l_name := l_name_identifier
							end
							error_handler.report_vgcc6e_error (current_class, current_class_impl, l_name, l_procedure, l_class)
						end
					end
					had_error := has_fatal_error
					if l_call /= Void then
						check_actual_arguments_validity (l_actuals, l_creation_context, l_name, l_procedure, l_class)
					else
-- TODO: `l_name' is "default_create". It may be a shared identifier not holding the correct
-- position! A solution could be to inline `check_actual_arguments_validity' here. It's
-- not a big deal: just checking that `l_procedure' has no formal arguments.
						check_actual_arguments_validity (Void, l_creation_context, l_name, l_procedure, l_class)
					end
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_creation_instruction (an_instruction, l_creation_named_type, l_procedure)
					end
				end
			end
			free_context (l_creation_context)
			free_context (l_target_context)
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_compound: ET_COMPOUND
		do
			l_compound := an_instruction.compound
			if l_compound /= Void then
				check_instructions_validity (l_compound)
			else
				has_fatal_error := False
			end
		end

	check_if_instruction_validity (an_instruction: ET_IF_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			boolean_type: ET_CLASS_TYPE
			l_conditional: ET_EXPRESSION
			l_conditional_context: ET_NESTED_TYPE_CONTEXT
			l_compound: ET_COMPOUND
			l_else_compound: ET_COMPOUND
			l_elseif_parts: ET_ELSEIF_PART_LIST
			l_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			l_old_scope: INTEGER
			l_old_elseif_scope: INTEGER
		do
			has_fatal_error := False
			boolean_type := current_universe_impl.boolean_type
			l_conditional := an_instruction.conditional.expression
			l_conditional_context := new_context (current_type)
			check_expression_validity (l_conditional, l_conditional_context, boolean_type)
			if has_fatal_error then
				had_error := True
			elseif not l_conditional_context.same_named_type (boolean_type, current_class_impl) then
				had_error := True
				set_fatal_error
				l_named_type := l_conditional_context.named_type
				error_handler.report_vwbe0a_error (current_class, current_class_impl, l_conditional, l_named_type)
			end
			free_context (l_conditional_context)
			l_old_scope := current_object_test_scope.count
			l_compound := an_instruction.then_compound
			if l_compound /= Void then
				object_test_scope_builder.build_scope (l_conditional, current_object_test_scope)
				check_instructions_validity (l_compound)
				current_object_test_scope.keep_object_tests (l_old_scope)
				if has_fatal_error then
					had_error := True
				end
			end
			l_elseif_parts := an_instruction.elseif_parts
			l_else_compound := an_instruction.else_compound
			if l_elseif_parts /= Void or l_else_compound /= Void then
				object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope)
				if l_elseif_parts /= Void then
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						l_elseif := l_elseif_parts.item (i)
						l_conditional := l_elseif.conditional.expression
						l_conditional_context := new_context (current_type)
						check_expression_validity (l_conditional, l_conditional_context, boolean_type)
						if has_fatal_error then
							had_error := True
						elseif not l_conditional_context.same_named_type (boolean_type, current_class_impl) then
							had_error := True
							set_fatal_error
							l_named_type := l_conditional_context.named_type
							error_handler.report_vwbe0a_error (current_class, current_class_impl, l_conditional, l_named_type)
						end
						free_context (l_conditional_context)
						l_compound := l_elseif.then_compound
						if l_compound /= Void then
							l_old_elseif_scope := current_object_test_scope.count
							object_test_scope_builder.build_scope (l_conditional, current_object_test_scope)
							check_instructions_validity (l_compound)
							current_object_test_scope.keep_object_tests (l_old_elseif_scope)
							if has_fatal_error then
								had_error := True
							end
						end
						if i < nb or else l_else_compound /= Void then
							object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope)
						end
						i := i + 1
					end
				end
				if l_else_compound /= Void then
					check_instructions_validity (l_else_compound)
					if has_fatal_error then
						had_error := True
					end
				end
				current_object_test_scope.keep_object_tests (l_old_scope)
			end
			if had_error then
				set_fatal_error
			end
		end

	check_inspect_instruction_validity (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_expression: ET_EXPRESSION
			l_when_parts: ET_WHEN_PART_LIST
			l_when_part: ET_WHEN_PART
			l_compound: ET_COMPOUND
			i, nb: INTEGER
			had_error: BOOLEAN
			had_value_error: BOOLEAN
			l_value_context: ET_NESTED_TYPE_CONTEXT
			l_value_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			l_value_named_type: ET_NAMED_TYPE
			l_choices: ET_CHOICE_LIST
			l_choice: ET_CHOICE
			l_choice_constant: ET_CHOICE_CONSTANT
			l_choice_context: ET_NESTED_TYPE_CONTEXT
			l_choice_named_type: ET_NAMED_TYPE
			j, nb2: INTEGER
			l_constant: ET_CONSTANT
			l_cast_type: ET_TARGET_TYPE
		do
			has_fatal_error := False
			any_type := current_system.any_type
			l_value_context := new_context (current_type)
			l_expression := an_instruction.conditional.expression
			check_expression_validity (l_expression, l_value_context, any_type)
			if has_fatal_error then
				had_error := True
			elseif l_value_context.same_named_type (current_universe_impl.integer_8_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.integer_16_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.integer_32_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.integer_64_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.natural_8_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.natural_16_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.natural_32_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.natural_64_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.character_8_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			elseif l_value_context.same_named_type (current_universe_impl.character_32_type, current_class_impl) then
				-- Valid with ISE Eiffel. To be checked with other compilers.
			else
				had_error := True
				set_fatal_error
				l_value_named_type := l_value_context.named_type
				error_handler.report_vomb1a_error (current_class, current_class_impl, l_expression, l_value_named_type)
			end
			had_value_error := had_error
			l_when_parts := an_instruction.when_parts
			if l_when_parts /= Void then
				l_choice_context := new_context (current_type)
				l_value_type := tokens.like_current
				nb := l_when_parts.count
				from i := 1 until i > nb loop
					l_when_part := l_when_parts.item (i)
					l_choices := l_when_part.choices
					nb2 := l_choices.count
					from j := 1 until j > nb2 loop
						l_choice := l_choices.choice (j)
						l_choice_constant := l_choice.lower
						check_expression_validity (l_choice_constant, l_choice_context, l_value_context)
						if has_fatal_error then
							had_error := True
						else
							l_constant := choice_constant (l_choice_constant)
							if l_constant = Void then
								had_error := True
								set_fatal_error
								error_handler.report_vomb2b_error (current_class, current_class_impl, l_choice_constant)
							elseif not had_value_error then
								if l_choice_context.same_named_type (l_value_type, l_value_context) then
									-- OK.
								elseif {l_integer_constant: ET_INTEGER_CONSTANT} l_constant then
									l_cast_type := l_integer_constant.cast_type
									l_integer_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_integer_constant, l_choice_context, l_value_context)
									l_integer_constant.set_cast_type (l_cast_type)
									if has_fatal_error then
										had_error := True
									elseif l_choice_context.same_named_type (l_value_type, l_value_context) then
										-- OK.
									else
										had_error := True
										set_fatal_error
										l_value_named_type := l_value_context.named_type
										l_choice_named_type := l_choice_context.named_type
										error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
									end
								elseif {l_character_constant: ET_CHARACTER_CONSTANT} l_constant then
									l_cast_type := l_character_constant.cast_type
									l_character_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_character_constant, l_choice_context, l_value_context)
									l_character_constant.set_cast_type (l_cast_type)
									if has_fatal_error then
										had_error := True
									elseif l_choice_context.same_named_type (l_value_type, l_value_context) then
										-- OK.
									else
										had_error := True
										set_fatal_error
										l_value_named_type := l_value_context.named_type
										l_choice_named_type := l_choice_context.named_type
										error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
									end
								else
									had_error := True
									set_fatal_error
									l_value_named_type := l_value_context.named_type
									l_choice_named_type := l_choice_context.named_type
									error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
								end
							end
						end
						l_choice_context.wipe_out
						if l_choice.is_range then
							l_choice_constant := l_choice.upper
							check_expression_validity (l_choice_constant, l_choice_context, l_value_context)
							if has_fatal_error then
								had_error := True
							else
								l_constant := choice_constant (l_choice_constant)
								if l_constant = Void then
									had_error := True
									set_fatal_error
									error_handler.report_vomb2b_error (current_class, current_class_impl, l_choice_constant)
								elseif not had_value_error then
									if l_choice_context.same_named_type (l_value_type, l_value_context) then
										-- OK.
									elseif {l_integer_constant2: ET_INTEGER_CONSTANT} l_constant then
										l_cast_type := l_integer_constant2.cast_type
										l_integer_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_integer_constant2, l_choice_context, l_value_context)
										l_integer_constant2.set_cast_type (l_cast_type)
										if has_fatal_error then
											had_error := True
										elseif l_choice_context.same_named_type (l_value_type, l_value_context) then
											-- OK.
										else
											had_error := True
											set_fatal_error
											l_value_named_type := l_value_context.named_type
											l_choice_named_type := l_choice_context.named_type
											error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
										end
									elseif {l_character_constant2: ET_CHARACTER_CONSTANT} l_constant then
										l_cast_type := l_character_constant2.cast_type
										l_character_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_character_constant2, l_choice_context, l_value_context)
										l_character_constant2.set_cast_type (l_cast_type)
										if has_fatal_error then
											had_error := True
										elseif l_choice_context.same_named_type (l_value_type, l_value_context) then
											-- OK.
										else
											had_error := True
											set_fatal_error
											l_value_named_type := l_value_context.named_type
											l_choice_named_type := l_choice_context.named_type
											error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
										end
									else
										had_error := True
										set_fatal_error
										l_value_named_type := l_value_context.named_type
										l_choice_named_type := l_choice_context.named_type
										error_handler.report_vomb2a_error (current_class, current_class_impl, l_choice_constant, l_choice_named_type, l_value_named_type)
									end
								end
							end
							l_choice_context.wipe_out
						end
						j := j + 1
-- TODO: check Unique and Constants and choice unicity.
					end
					i := i + 1
				end
				free_context (l_choice_context)
				free_context (l_value_context)
				from i := 1 until i > nb loop
					l_when_part := l_when_parts.item (i)
					l_compound := l_when_part.then_compound
					if l_compound /= Void then
						check_instructions_validity (l_compound)
						if has_fatal_error then
							had_error := True
						end
					end
					i := i + 1
				end
			else
				free_context (l_value_context)
			end
			l_compound := an_instruction.else_compound
			if l_compound /= Void then
				check_instructions_validity (l_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	choice_constant (a_choice_constant: ET_CHOICE_CONSTANT): ET_CONSTANT is
			-- Constant value of the inspect choice `a_choice_constant',
			-- or Void if it appears not to be a constant after all
			--
			-- Note that validity `a_choice_constant' as an expression
			-- is assumed to have already been checked.
			-- Therefore, this routine will not change the value of `has_fatal_error'.
			-- It will just return Void if something unexpected is encountered.
		require
			a_choice_constant_not_void: a_choice_constant /= Void
		local
			l_identifier: ET_IDENTIFIER
			l_query: ET_QUERY
			l_constant_attribute: ET_CONSTANT_ATTRIBUTE
			l_unique_attribute: ET_UNIQUE_ATTRIBUTE
			l_static_call: ET_STATIC_CALL_EXPRESSION
			l_static_type: ET_TYPE
			l_static_class: ET_CLASS
			l_static_context: ET_NESTED_TYPE_CONTEXT
			l_old_has_fatal_error: BOOLEAN
			l_seed: INTEGER
		do
			l_old_has_fatal_error := has_fatal_error
			Result ?= a_choice_constant
			if Result = Void then
				l_identifier ?= a_choice_constant
				if l_identifier /= Void then
					if l_identifier.is_argument then
							-- This is not a constant.
					elseif l_identifier.is_local then
							-- This is not a constant.
					elseif l_identifier.is_object_test_local then
							-- This is not a constant.
					else
						l_seed := l_identifier.seed
						l_query := current_class.seeded_query (l_seed)
					end
				else
					l_static_call ?= a_choice_constant
					if l_static_call /= Void then
						l_static_type := resolved_formal_parameters (l_static_call.type, current_class_impl, current_type)
						if not has_fatal_error then
							l_static_context := new_context (current_type)
							l_static_context.force_last (l_static_type)
							l_static_class := l_static_context.base_class
							l_query := l_static_class.seeded_query (l_static_call.name.seed)
							free_context (l_static_context)
						end
					end
				end
				if l_query /= Void then
					l_constant_attribute ?= l_query
					if l_constant_attribute /= Void then
						Result := l_constant_attribute.constant
					else
						l_unique_attribute ?= l_query
						if l_unique_attribute /= Void then
-- TODO: determine the exact value of the unique attribute.
							Result := create {ET_REGULAR_INTEGER_CONSTANT}.make ("1")
						end
					end
				end
			end
			has_fatal_error := l_old_has_fatal_error
		end

	check_loop_instruction_validity (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_expression: ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_compound: ET_COMPOUND
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			boolean_type: ET_CLASS_TYPE
			l_variant: ET_VARIANT
			l_invariant: ET_LOOP_INVARIANTS
			l_old_scope: INTEGER
		do
			has_fatal_error := False
			l_compound := an_instruction.from_compound
			if l_compound /= Void then
				check_instructions_validity (l_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			l_invariant := an_instruction.invariant_part
			if l_invariant /= Void then
				check_loop_invariant_validity (l_invariant)
				if has_fatal_error then
					had_error := True
				end
			end
			boolean_type := current_universe_impl.boolean_type
			l_expression := an_instruction.until_conditional.expression
			l_expression_context := new_context (current_type)
			check_expression_validity (l_expression, l_expression_context, boolean_type)
			if has_fatal_error then
				had_error := True
			elseif not l_expression_context.same_named_type (boolean_type, current_class_impl) then
				had_error := True
				set_fatal_error
				l_named_type := l_expression_context.named_type
				error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
			end
			free_context (l_expression_context)
			l_compound := an_instruction.loop_compound
			if l_compound /= Void then
				l_old_scope := current_object_test_scope.count
				object_test_scope_builder.build_negated_scope (l_expression, current_object_test_scope)
				check_instructions_validity (l_compound)
				current_object_test_scope.keep_object_tests (l_old_scope)
				if has_fatal_error then
					had_error := True
				end
			end
			l_variant := an_instruction.variant_part
			if l_variant /= Void then
				check_loop_variant_validity (l_variant)
				if has_fatal_error then
					had_error := True
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_invariant_validity (an_invariant: ET_LOOP_INVARIANTS) is
			-- Check validity of `an_invariant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_invariant_not_void: an_invariant /= Void
		local
			l_expression: ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			boolean_type: ET_CLASS_TYPE
			i, nb: INTEGER
			l_named_type: ET_NAMED_TYPE
		do
			has_fatal_error := False
			boolean_type := current_universe_impl.boolean_type
			l_expression_context := new_context (current_type)
			nb := an_invariant.count
			from i := 1 until i > nb loop
				l_expression := an_invariant.assertion (i).expression
				check_expression_validity (l_expression, l_expression_context, boolean_type)
				if has_fatal_error then
					had_error := True
				elseif not l_expression_context.same_named_type (boolean_type, current_class_impl) then
					had_error := True
					set_fatal_error
					l_named_type := l_expression_context.named_type
					error_handler.report_vwbe0a_error (current_class, current_class_impl, l_expression, l_named_type)
				end
				l_expression_context.wipe_out
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
			free_context (l_expression_context)
		end

	check_loop_variant_validity (a_variant: ET_VARIANT) is
			-- Check validity of `a_variant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_variant_not_void: a_variant /= Void
		local
			l_expression: ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			integer_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			l_expression := a_variant.expression
			if l_expression /= Void then
				integer_type := current_universe_impl.integer_type
				l_expression_context := new_context (current_type)
				check_expression_validity (l_expression, l_expression_context, integer_type)
				if has_fatal_error then
					had_error := True
				elseif not l_expression_context.same_named_type (integer_type, current_type) then
					had_error := True
					set_fatal_error
					l_named_type := l_expression_context.named_type
					error_handler.report_vave0a_error (current_class, current_class_impl, l_expression, l_named_type)
				end
				free_context (l_expression_context)
			else
-- TODO: syntax error.
			end
			if had_error then
				set_fatal_error
			end
		end

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_procedure: ET_PROCEDURE
			l_parent_type, l_ancestor: ET_BASE_TYPE
			l_class: ET_CLASS
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_feature_impl: ET_FEATURE
			l_procedure_impl: ET_PROCEDURE
			l_actual_context: ET_NESTED_TYPE_CONTEXT
		do
			l_feature_impl ?= current_feature_impl
			if l_feature_impl = Void then
					-- The Precursor instruction does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1a_error (current_class, an_instruction)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			elseif in_rescue then
					-- The Precursor instruction does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1a_error (current_class, an_instruction)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			elseif current_inline_agent /= Void then
					-- The associated feature of inline agents cannot be redefined.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr3e_error (current_class, an_instruction, current_inline_agent, l_feature_impl)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-3 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			else
				l_procedure_impl ?= l_feature_impl
				if l_procedure_impl = Void then
-- TODO: `current_feature' should be a procedure.
				else
					has_fatal_error := False
						-- This is an unqualified call, so there is a good chance that we
						-- will need the type of current to figure out which feature to call.
					report_current_type_needed
					if current_feature.first_precursor = Void then
							-- Immediate features cannot have Precursor.
						set_fatal_error
						if current_class_impl /= current_class then
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: Precursor should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
							error_handler.report_vdpr3d_error (current_class, an_instruction, l_procedure_impl)
						end
					else
							-- Make sure that the precursor `an_instruction' has been resolved.
-- TODO: I think that 'feature_flattener' has already been executed on `current_class'
-- at this stage, and hence on the ancestor class `current_class_impl'. Therefore there is
-- no need to check it again here.
						current_class_impl.process (current_system.feature_flattener)
						if not current_class_impl.features_flattened or else current_class_impl.has_flattening_error then
							set_fatal_error
						else
							l_parent_type := an_instruction.parent_type
							if l_parent_type = Void then
									-- Internal error: the Precursor construct should
									-- already have been resolved when flattening the
									-- features of `l_class_impl'.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_precursor_keyword := an_instruction.precursor_keyword
								l_class := l_parent_type.base_class
								l_procedure := l_class.seeded_procedure (l_precursor_keyword.seed)
								if l_procedure = Void then
										-- Internal error: the Precursor construct should
										-- already have been resolved when flattening the
										-- features of `current_class_impl'.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_actual_context := new_context (current_type)
									l_actual_context.force_last (l_parent_type)
									if current_class /= current_class_impl and l_parent_type.is_generic then
										-- Resolve generic parameters in the
										-- context of `current_type'.
-- TODO: I think that 'ancestor_builder' has already been executed on `current_class'
-- at this stage, and therefore there is no need to check it again here.
										current_class.process (current_system.ancestor_builder)
										if not current_class.ancestors_built or else current_class.has_ancestors_error then
											set_fatal_error
										else
											l_ancestor := current_class.ancestor (l_parent_type)
											if l_ancestor = Void then
													-- Internal error: `l_parent_type' is an ancestor
													-- of `current_class_impl', and hence of `current_class'.
												set_fatal_error
												error_handler.report_giaaa_error
											else
												l_parent_type := l_ancestor
												l_actual_context.wipe_out
												l_actual_context.force_last (l_parent_type)
											end
										end
									end
									if not has_fatal_error then
										l_actuals := an_instruction.arguments
										check_actual_arguments_validity (l_actuals, l_actual_context, l_precursor_keyword, l_procedure, l_class)
										if not has_fatal_error then
											report_precursor_instruction (an_instruction, l_parent_type, l_procedure)
											if precursor_procedures /= Void then
												precursor_procedures.force_last (l_procedure)
											end
										end
									end
									free_context (l_actual_context)
								end
							end
						end
					end
				end
			end
		end

	check_qualified_call_instruction_validity (a_call: ET_FEATURE_CALL_INSTRUCTION) is
			-- Check validity of qualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target: ET_EXPRESSION
			l_name: ET_CALL_NAME
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_seed: INTEGER
			any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
			i, nb: INTEGER
			nb_args: INTEGER
		do
			has_fatal_error := False
			l_target := a_call.target
			if l_target.is_current then
					-- If the target is the current object there is a good chance that
					-- we will need its type to figure out which feature to call.
				report_current_type_needed
			end
			l_context := new_context (current_type)
			l_name := a_call.name
			l_actuals := a_call.arguments
			any_type := current_system.any_type
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					check_expression_validity (l_target, l_context, any_type)
					if not has_fatal_error then
						l_class := l_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							if l_class.is_dotnet then
								l_class.add_overloaded_procedures (l_name, overloaded_procedures)
								nb := overloaded_procedures.count
								if nb = 0 then
									-- The error is reported later.
								elseif nb = 1 then
									l_procedure := overloaded_procedures.first
									l_seed := l_procedure.first_seed
									l_name.set_seed (l_seed)
								else
										-- More than one procedure with that name.
										-- Start to remove those with the wrong number of arguments.
									nb_args := a_call.arguments_count
									from i := nb until i < 1 loop
										if overloaded_procedures.item (i).arguments_count /= nb_args then
											overloaded_procedures.remove (i)
										end
										i := i - 1
									end
									nb := overloaded_procedures.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_procedure := overloaded_procedures.first
										l_seed := l_procedure.first_seed
										l_name.set_seed (l_seed)
									elseif nb_args = 0 then
											-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
									else
										keep_best_overloaded_features (overloaded_procedures, l_actuals, l_context)
										if not has_fatal_error then
											nb := overloaded_procedures.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_procedure := overloaded_procedures.first
												l_seed := l_procedure.first_seed
												l_name.set_seed (l_seed)
											else
													-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
											end
										end
									end
								end
								overloaded_procedures.wipe_out
							end
							if l_procedure = Void and not has_fatal_error then
								l_procedure := l_class.named_procedure (l_name)
								if l_procedure /= Void then
									l_seed := l_procedure.first_seed
									l_name.set_seed (l_seed)
								else
									l_query := l_class.named_query (l_name)
									if l_query /= Void then
											-- In a call instruction, the feature has to be a procedure.
										set_fatal_error
										error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
									else
										set_fatal_error
											-- ISE Eiffel 5.4 reports this error as a VEEN,
											-- but it is in fact a VUEX-2 (ETL2 p.368).
										error_handler.report_vuex2a_error (current_class, l_name, l_class)
									end
								end
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if l_procedure = Void then
						-- We didn't find the procedure yet. This is because the seed
						-- was already computed in a proper ancestor (or in another
						-- generic derivation) of `current_class' where this instruction
						-- was written.
					check_expression_validity (l_target, l_context, any_type)
					if not has_fatal_error then
						l_class := l_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_procedure := l_class.seeded_procedure (l_seed)
							if l_procedure = Void then
									-- Report internal error: if we got a seed, the
									-- `l_procedure' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
				if l_procedure /= Void then
					check l_class_not_void: l_class /= Void end
					if not l_procedure.is_exported_to (current_class) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_procedure, l_class)
					end
					had_error := has_fatal_error
					check_qualified_vape_validity (l_name, l_procedure, l_class)
					if has_fatal_error then
						had_error := True
					end
					check_actual_arguments_validity (l_actuals, l_context, l_name, l_procedure, l_class)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_qualified_call_instruction (a_call, l_context, l_procedure)
					end
				end
			end
			free_context (l_context)
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			if not in_rescue then
					-- The Retry instruction does not appear in a Rescue clause.
				set_fatal_error
				if current_class_impl /= current_class then
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VXRT error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					error_handler.report_vxrt0a_error (current_class, an_instruction)
				end
			else
				has_fatal_error := False
			end
		end

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_type: ET_TYPE
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			had_error: BOOLEAN
			i, nb: INTEGER
			nb_args: INTEGER
			l_dotnet_procedure: ET_DOTNET_PROCEDURE
			l_actuals: ET_ACTUAL_ARGUMENTS
		do
			has_fatal_error := False
			l_context := new_context (current_type)
			l_type := an_instruction.type
			check_type_validity (l_type)
			if not has_fatal_error then
				if not l_type.is_base_type then
						-- The type used to figure out which feature to call contains formal
						-- generic parameters or anchored types whose resolved value may vary
						-- in various descendant classes/types.
					report_current_type_needed
				end
				l_name := an_instruction.name
				l_actuals := an_instruction.arguments
				l_seed := l_name.seed
				if l_seed = 0 then
						-- We need to resolve `l_name' in the implementation
						-- class of `current_feature_impl' first.
					if current_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: `l_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giaaa_error
						end
					else
						l_context.force_last (l_type)
						l_class := l_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							if l_class.is_dotnet then
								l_class.add_overloaded_procedures (l_name, overloaded_procedures)
								nb := overloaded_procedures.count
								if nb = 0 then
									-- The error is reported later.
								elseif nb = 1 then
									l_procedure := overloaded_procedures.first
									l_seed := l_procedure.first_seed
									l_name.set_seed (l_seed)
								else
										-- More than one procedure with that name.
										-- Start to remove those with the wrong number of arguments
										-- or which are not declared as static.
									nb_args := an_instruction.arguments_count
									from i := nb until i < 1 loop
										l_dotnet_procedure ?= overloaded_procedures.item (i)
										if l_dotnet_procedure = Void or else not l_dotnet_procedure.is_static or else l_dotnet_procedure.arguments_count /= nb_args then
											overloaded_procedures.remove (i)
										end
										i := i - 1
									end
									nb := overloaded_procedures.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_procedure := overloaded_procedures.first
										l_seed := l_procedure.first_seed
										l_name.set_seed (l_seed)
									elseif nb_args = 0 then
											-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
									else
										keep_best_overloaded_features (overloaded_procedures, l_actuals, l_context)
										if not has_fatal_error then
											nb := overloaded_procedures.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_procedure := overloaded_procedures.first
												l_seed := l_procedure.first_seed
												l_name.set_seed (l_seed)
											else
													-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
											end
										end
									end
								end
								overloaded_procedures.wipe_out
							end
							if l_procedure = Void and not has_fatal_error then
								l_procedure := l_class.named_procedure (l_name)
								if l_procedure /= Void then
									l_seed := l_procedure.first_seed
									l_name.set_seed (l_seed)
								else
									l_query := l_class.named_query (l_name)
									if l_query /= Void then
											-- In a call instruction, the feature has to be a procedure.
										set_fatal_error
										error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
									else
										set_fatal_error
											-- ISE Eiffel 5.4 reports this error as a VEEN,
											-- but it is in fact a VUEX-2 (ETL2 p.368).
										error_handler.report_vuex2a_error (current_class, l_name, l_class)
									end
								end
							end
						end
					end
				end
				if not has_fatal_error then
					if l_procedure = Void then
							-- We didn't find the procedure yet. This is because the seed
							-- was already computed in a proper ancestor (or in another
							-- generic derivation) of `current_class' where this instruction
							-- was written.
						l_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
						if not has_fatal_error then
							l_context.force_last (l_type)
							l_class := l_context.base_class
							l_class.process (current_system.interface_checker)
							if not l_class.interface_checked or else l_class.has_interface_error then
								set_fatal_error
							else
								l_procedure := l_class.seeded_procedure (l_seed)
								if l_procedure = Void then
										-- Report internal error: if we got a seed, the
										-- `l_procedure' should not be void.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							end
						end
					end
					if l_procedure /= Void then
						report_static_supplier (l_type, current_class, current_feature)
						check l_class_not_void: l_class /= Void end
						if not l_procedure.is_exported_to (current_class) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_procedure, l_class)
						end
						had_error := has_fatal_error
						check_qualified_vape_validity (l_name, l_procedure, l_class)
						if has_fatal_error then
							had_error := True
						end
						check_actual_arguments_validity (l_actuals, l_context, l_name, l_procedure, l_class)
						if had_error then
							set_fatal_error
						end
						if not has_fatal_error then
-- TODO: check that `l_procedure' is an external procedure.
							report_static_call_instruction (an_instruction, l_type, l_procedure)
						end
					end
				end
			end
			free_context (l_context)
		end

	check_unqualified_call_instruction_validity (a_call: ET_FEATURE_CALL_INSTRUCTION) is
			-- Check validity of unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_CALL_NAME
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_seed: INTEGER
			l_identifier: ET_IDENTIFIER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- This is an unqualified call, so there is a good chance that we
				-- will need the type of current to figure out which feature to call.
			report_current_type_needed
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_procedure := current_class.named_procedure (l_name)
						if l_procedure /= Void then
							l_seed := l_procedure.first_seed
							l_name.set_seed (l_seed)
						else
							l_query := current_class.named_query (l_name)
							if l_query /= Void then
									-- In a call instruction, the feature has to be a procedure.
								set_fatal_error
								error_handler.report_vkcn1c_error (current_class, l_name, l_query)
							else
									-- Check whether it is a formal argument or a local variable.
								l_identifier ?= l_name
								if l_identifier /= Void then
									l_arguments := current_closure_impl.arguments
									if l_arguments /= Void then
										l_seed := l_arguments.index_of (l_identifier)
										if l_seed /= 0 then
												-- `l_name' is a fomal argument.
											if l_actuals /= Void then
													-- Syntax error: a formal argument cannot have arguments.
												set_fatal_error
												if current_inline_agent /= Void then
													error_handler.report_gvuaa0b_error (current_class, l_identifier, current_inline_agent)
												elseif current_feature_impl.is_feature then
													error_handler.report_gvuaa0a_error (current_class, l_identifier, current_feature_impl.as_feature)
												else
														-- Internal error: invariants don't have formal arguments.
													error_handler.report_giaaa_error
												end
											end
												-- Do not set the seed of `l_identifier' so that we report
												-- this error again when checked in a descendant class.
											l_identifier.set_argument (True)
												-- Syntax error: a formal argument cannot be an instruction.
											set_fatal_error
												-- Note: ISE 5.4 reports a VKCN-1 here. However
												-- `l_name' is not a function nor an attribute name.
											if current_inline_agent /= Void then
												error_handler.report_gvuia0b_error (current_class, l_identifier, current_inline_agent)
											elseif current_feature_impl.is_feature then
												error_handler.report_gvuia0a_error (current_class, l_identifier, current_feature_impl.as_feature)
											else
													-- Internal error: invariants don't have formal arguments.
												error_handler.report_giaaa_error
											end
										end
									end
									if l_seed = 0 then
										l_locals := current_feature_impl.locals
										if l_locals /= Void then
											l_seed := l_locals.index_of (l_identifier)
											if l_seed /= 0 then
													-- `l_name' is a local variable.
												if l_actuals /= Void then
														-- Syntax error: a local variable cannot have arguments.
													set_fatal_error
													if current_inline_agent /= Void then
														error_handler.report_gvual0b_error (current_class, l_identifier, current_inline_agent)
													elseif current_feature_impl.is_feature then
														error_handler.report_gvual0a_error (current_class, l_identifier, current_feature_impl.as_feature)
													else
															-- Internal error: invariants don't have formal arguments.
														error_handler.report_giaaa_error
													end
												end
													-- Do not set the seed of `l_identifier' so that we report
													-- this error again when checked in a descendant class.
												l_identifier.set_local (True)
													-- Syntax error: a local variable cannot be an instruction.
												set_fatal_error
													-- Note: ISE 5.4 reports a VKCN-1 here. However
													-- `a_name' is not a function nor an attribute name.
												if current_inline_agent /= Void then
													error_handler.report_gvuil0b_error (current_class, l_identifier, current_inline_agent)
												elseif current_feature_impl.is_feature then
													error_handler.report_gvuil0a_error (current_class, l_identifier, current_feature_impl.as_feature)
												else
														-- Internal error: invariants don't have formal arguments.
													error_handler.report_giaaa_error
												end
											end
										end
									end
								end
								if l_seed = 0 then
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VUEX-1 (ETL2 p.368).
									error_handler.report_vuex1a_error (current_class, l_name)
								end
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if l_procedure = Void then
						-- We didn't find the procedure yet. This is because the seed
						-- was already computed in a proper ancestor (or in another
						-- generic derivation) of `current_class' where this instruction
						-- was written.
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_procedure := current_class.seeded_procedure (l_seed)
						if l_procedure = Void then
								-- Report internal error: if we got a seed, the
								-- `l_procedure' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
				if l_procedure /= Void then
					check_unqualified_vape_validity (l_name, l_procedure)
					had_error := has_fatal_error
					l_context := new_context (current_type)
					check_actual_arguments_validity (l_actuals, l_context, l_name, l_procedure, Void)
					free_context (l_context)
					if has_fatal_error then
						had_error := True
					end
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_unqualified_call_instruction (a_call, l_procedure)
					end
				end
			end
		end

	check_instructions_validity (a_compound: ET_COMPOUND) is
			-- Check validity of `a_coumpound'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_compound_not_void: a_compound /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			nb := a_compound.count
			from i := 1 until i > nb loop
				has_fatal_error := False
				a_compound.item (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			if had_error then
				set_fatal_error
			end
		end

	check_rescue_validity (a_compound: ET_COMPOUND) is
			-- Check validity of `a_coumpound' in rescue clause.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_compound_not_void: a_compound /= Void
		local
			old_in_rescue: BOOLEAN
		do
			old_in_rescue := in_rescue
			in_rescue := True
			check_instructions_validity (a_compound)
			in_rescue := old_in_rescue
		end

feature {NONE} -- Expression validity

	check_binary_integer_constant_validity (a_constant: ET_BINARY_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_integer_constant_validity (a_constant, a_context)
		end

	check_bit_constant_validity (a_constant: ET_BIT_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_integer_constant: ET_REGULAR_INTEGER_CONSTANT
			l_type: ET_BIT_N
		do
			has_fatal_error := False
			create l_integer_constant.make ((a_constant.literal.count - 1).out)
			create l_type.make (l_integer_constant, tokens.unknown_class)
			a_context.force_last (l_type)
			report_bit_constant (a_constant)
		end

	check_bracket_expression_validity (an_expression: ET_BRACKET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_expression_validity (an_expression, a_context)
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_character_constant_validity (a_constant, a_context)
		end

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_character_constant_validity (a_constant, a_context)
		end

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_character_constant_validity (a_constant, a_context)
		end

	check_call_expression_validity (an_expression: ET_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			if an_expression.is_qualified_call then
				check_qualified_call_expression_validity (an_expression, a_context)
			else
				check_unqualified_call_expression_validity (an_expression, a_context)
			end
		end

	check_character_constant_validity (a_constant: ET_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
			l_cast_type: ET_TARGET_TYPE
			l_explicit_type: ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.like_current
			l_expected_type_context := current_target_type
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- Make sure that `l_cast_type' is a valid type.
					-- For example 'CHARACTER_8 [ANY]' is not valid.
				l_explicit_type := l_cast_type.type
				check_type_validity (l_explicit_type)
				if has_fatal_error then
					-- Do nothing.
				elseif not l_explicit_type.is_named_type then
						-- Error: invalid cast type, it should be a sized variant of "CHARACTER".
					set_fatal_error
					error_handler.report_vwmq0c_error (current_class, current_class_impl, a_constant)
				else
					l_expected_type := l_explicit_type
					l_expected_type_context := current_class_impl
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif current_universe_impl.character_8_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "CHARACTER_8".
				l_type := current_universe_impl.character_8_type
				report_character_8_constant (a_constant, l_type)
			elseif current_universe_impl.character_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "CHARACTER_32".
				l_type := current_universe_impl.character_32_type
				report_character_32_constant (a_constant, l_type)
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "CHARACTER".
				set_fatal_error
				error_handler.report_vwmq0c_error (current_class, current_class_impl, a_constant)
			else
-- TODO: check what ISE does here.
				l_type := current_universe_impl.character_8_type
				report_character_8_constant (a_constant, l_type)
			end
			if l_type /= Void then
				a_constant.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_convert_builtin_expression_validity (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_target_type: ET_TYPE
		do
			check_expression_validity (an_expression.expression, a_context, current_target_type)
			if not has_fatal_error then
				l_target_type := resolved_formal_parameters (an_expression.type, current_class_impl, current_type)
				if not has_fatal_error then
					report_builtin_conversion (an_expression, l_target_type)
					a_context.reset (current_type)
					a_context.force_last (l_target_type)
				end
			end
		end

	check_convert_from_expression_validity (an_expression: ET_CONVERT_FROM_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_creation_expression_validity (an_expression, a_context)
		end

	check_convert_to_expression_validity (an_expression: ET_CONVERT_TO_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_expression_validity (an_expression, a_context)
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_creation_expression_validity (an_expression, a_context)
		end

	check_creation_expression_validity (an_expression: ET_CREATION_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_class: ET_CLASS
			l_named_creation_type: ET_NAMED_TYPE
			l_formal_parameter_type: ET_FORMAL_PARAMETER_TYPE
			l_formal_parameter: ET_FORMAL_PARAMETER
			l_formal_parameters: ET_FORMAL_PARAMETER_LIST
			l_creator: ET_CONSTRAINT_CREATOR
			l_index: INTEGER
			l_class_type: ET_CLASS_TYPE
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_creation_type: ET_TYPE
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			had_error: BOOLEAN
			l_name_identifier: ET_IDENTIFIER
			l_name_position: ET_POSITION
			i, nb: INTEGER
			nb_args: INTEGER
			l_actuals: ET_ACTUAL_ARGUMENTS
		do
			has_fatal_error := False
			l_creation_type := an_expression.type
			check_type_validity (l_creation_type)
			if not has_fatal_error then
				if not l_creation_type.is_base_type then
						-- The creation type contains formal generic parameters
						-- or anchored types whose resolved value may vary in various
						-- descendant classes/types.
					report_current_type_needed
				end
				l_name := an_expression.name
				if l_name /= Void then
						-- There is an explicit creation call.
					l_actuals := an_expression.arguments
					l_seed := l_name.seed
					if l_seed = 0 then
							-- We need to resolve `l_name' in the implementation
							-- class of `current_feature_impl' first.
						if current_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: `l_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
							a_context.force_last (l_creation_type)
							l_class := l_creation_type.base_class (current_type)
							l_class.process (current_system.interface_checker)
							if not l_class.interface_checked or else l_class.has_interface_error then
								set_fatal_error
							else
								if l_class.is_dotnet then
									l_class.add_overloaded_procedures (l_name, overloaded_procedures)
									nb := overloaded_procedures.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_procedure := overloaded_procedures.first
										l_seed := l_procedure.first_seed
										l_name.set_seed (l_seed)
									else
											-- More than one procedure with that name.
											-- Start to remove those with the wrong number of arguments
											-- or which are not creators.
										if l_actuals /= Void then
											nb_args := l_actuals.count
										end
										from i := nb until i < 1 loop
-- TODO: remove non-creators
											if overloaded_procedures.item (i).arguments_count /= nb_args then
												overloaded_procedures.remove (i)
											end
											i := i - 1
										end
										nb := overloaded_procedures.count
										if nb = 0 then
											-- The error is reported later.
										elseif nb = 1 then
											l_procedure := overloaded_procedures.first
											l_seed := l_procedure.first_seed
											l_name.set_seed (l_seed)
										elseif nb_args = 0 then
												-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
										else
											keep_best_overloaded_features (overloaded_procedures, l_actuals, a_context)
											if not has_fatal_error then
												nb := overloaded_procedures.count
												if nb = 0 then
													-- The error is reported later.
												elseif nb = 1 then
													l_procedure := overloaded_procedures.first
													l_seed := l_procedure.first_seed
													l_name.set_seed (l_seed)
												else
														-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
												end
											end
										end
									end
									overloaded_procedures.wipe_out
								end
								if l_procedure = Void and not has_fatal_error then
									l_procedure := l_class.named_procedure (l_name)
									if l_procedure /= Void then
										l_seed := l_procedure.first_seed
										l_name.set_seed (l_seed)
									else
										l_query := l_class.named_query (l_name)
										if l_query /= Void then
												-- This is not a procedure.
											set_fatal_error
											error_handler.report_vgcc6b_error (current_class, l_name, l_query, l_class)
										else
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VUEX-2 (ETL2 p.368).
											error_handler.report_vuex2a_error (current_class, l_name, l_class)
										end
									end
								end
							end
						end
					end
				else
						-- No explicit creation call. Use 'default_create' instead.
					l_name := tokens.default_create_feature_name
					l_seed := current_system.default_create_seed
				end
			end
			if not has_fatal_error then
				if l_procedure = Void then
						-- We still need to find which procedure to call. It's either
						-- because there is no explicit creation call or `current_type'
						-- is a proper descendant (or a generic derivation) of the class
						-- where this creation expression was written and we need to
						-- find the version of the creation procedure in the context
						-- of `current_type'.
					l_creation_type := resolved_formal_parameters (l_creation_type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_creation_type)
						l_class := l_creation_type.base_class (current_type)
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						elseif l_seed /= 0 then
							l_procedure := l_class.seeded_procedure (l_seed)
							if l_procedure = Void then
									-- Report internal error: if we got a seed, the
									-- `l_procedure' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
			end
			if not has_fatal_error then
				check l_class_not_void: l_class /= Void end
				report_create_supplier (l_creation_type, current_class, current_feature)
				l_named_creation_type := l_creation_type.shallow_named_type (current_type)
				l_class_type ?= l_named_creation_type
				if l_class_type /= Void then
					check_creation_type_validity (l_class_type, an_expression.type_position)
				end
				if l_procedure = Void then
						-- No creation call, and feature 'default_create' not
						-- supported by the underlying Eiffel compiler.
					check
						no_call: an_expression.name = Void
						no_default_create: current_system.default_create_seed = 0
					end
					if l_class.creators /= Void then
							-- The class explicitly declares creation procedures,
							-- so the creation call was required.
						set_fatal_error
						error_handler.report_vgcc5a_error (current_class, current_class_impl, an_expression, l_class)
					elseif l_class.is_deferred then
							-- The class is deferred, so the creation is invalid.
						set_fatal_error
						error_handler.report_vgcc1a_error (current_class, current_class_impl, an_expression, l_class)
					end
				else
					l_formal_parameter_type ?= l_named_creation_type
					if l_formal_parameter_type /= Void then
							-- The creation type if a formal generic parameter.
							-- We need to find out what creation procedures are
							-- declared with the associated constraint.
						l_index := l_formal_parameter_type.index
						l_formal_parameters := current_class.formal_parameters
						if l_formal_parameters = Void or else l_index > l_formal_parameters.count then
								-- Internal error: `l_formal_parameter' is supposed
								-- to be a formal parameter of `current_class'.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_formal_parameter := l_formal_parameters.formal_parameter (l_index)
							l_creator := l_formal_parameter.creation_procedures
							if l_creator = Void or else not l_creator.has_feature (l_procedure) then
									-- The creation procedure of the expression is not
									-- one of those declared with the associated constraint.
								set_fatal_error
								if l_name = tokens.default_create_feature_name then
										-- The creation has no call part. Make sure that
										-- the error message will give a valid position.
									create l_name_identifier.make (l_name.name)
									l_name_position := an_expression.last_position
									l_name_identifier.set_position (l_name_position.line, l_name_position.column)
									l_name := l_name_identifier
								end
								error_handler.report_vgcc8a_error (current_class, current_class_impl, l_name, l_procedure, l_class, l_formal_parameter)
							end
						end
					elseif not l_procedure.is_creation_exported_to (current_class, l_class) then
							-- The procedure is not a creation procedure exported to `current_class',
							-- and it is not the implicit creation procedure 'default_create'.
						if current_class /= current_class_impl and current_class.is_deferred and l_creation_type.is_like_current then
							-- In case of flat Degree 3, it is OK to create an entity
							-- declared of type 'like Current' in the current class
							-- if the current class is deferred.
						else
							set_fatal_error
							if l_name = tokens.default_create_feature_name then
									-- The creation has no call part. Make sure that
									-- the error message will give a valid position.
								create l_name_identifier.make (l_name.name)
								l_name_position := an_expression.last_position
								l_name_identifier.set_position (l_name_position.line, l_name_position.column)
								l_name := l_name_identifier
							end
							error_handler.report_vgcc6c_error (current_class, current_class_impl, l_name, l_procedure, l_class)
						end
					end
					had_error := has_fatal_error
-- TODO: When `an_expression.name' is Void, then `l_name' is "default_create". It may be a shared identifier
-- not holding the correct position! A solution could be to inline `check_actual_arguments_validity'
-- here. It's not a big deal: just checking that `l_procedure' has no formal arguments.
					check_actual_arguments_validity (l_actuals, a_context, l_name, l_procedure, l_class)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						report_creation_expression (an_expression, l_named_creation_type, l_procedure)
					end
				end
			end
		end

	check_current_validity (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (current_type)
			report_current (an_expression)
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			has_fatal_error := False
			l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
			if l_typed_pointer_class.actual_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation: the type of '$Current' is 'TYPED_POINTER [like Current]'.
				create l_actuals.make_with_capacity (1)
-- TODO: shouldn't we use `tokens.like_current' instead of `current_type'.
				l_actuals.put_first (current_type)
				create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
				report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
				a_context.force_last (l_typed_pointer_type)
					-- Need current type to create an object of type 'TYPED_POINTER [<current_type>]'.
				report_current_type_needed
			else
					-- Use the ETL2 implementation: the type of '$Current' is POINTER.
				l_pointer_type := current_universe_impl.pointer_type
				a_context.force_last (l_pointer_type)
				report_pointer_expression (an_expression, l_pointer_type)
			end
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_left_operand: ET_EXPRESSION
			l_right_operand: ET_EXPRESSION
			l_left_context: ET_NESTED_TYPE_CONTEXT
			l_right_context: ET_NESTED_TYPE_CONTEXT
			l_left_convert_expression: ET_CONVERT_EXPRESSION
			l_right_convert_expression: ET_CONVERT_EXPRESSION
			l_any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_any_type := current_system.any_type
			l_left_context := new_context (current_type)
			l_right_context := new_context (current_type)
			l_left_operand := an_expression.left
			l_right_operand := an_expression.right
			check_expression_validity (l_left_operand, l_left_context, l_any_type)
			if not has_fatal_error then
				check_expression_validity (l_right_operand, l_right_context, l_any_type)
				if not has_fatal_error then
					if current_class /= current_class_impl then
						-- Possible convertibility should be resolved in the implementation class.
					elseif l_left_context.conforms_to_context (l_right_context) then
						-- OK.
					elseif l_right_context.conforms_to_context (l_left_context) then
						-- OK.
					elseif l_left_context.same_named_type (current_system.none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					elseif l_right_context.same_named_type (current_system.none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					else
						l_right_convert_expression := convert_expression (l_right_operand, l_right_context, l_left_context)
						had_error := has_fatal_error
						l_left_convert_expression := convert_expression (l_left_operand, l_left_context, l_right_context)
						has_fatal_error := has_fatal_error or had_error
						if has_fatal_error then
							-- Nothing to be done.
						elseif l_right_convert_expression /= Void then
							if l_left_convert_expression /= Void then
-- TODO: conversion in both directions
							end
								-- Insert the conversion feature call in the AST.
							an_expression.set_right (l_right_convert_expression)
						elseif l_left_convert_expression /= Void then
								-- Insert the conversion feature call in the AST.
								-- Convertibility should be resolved in the implementation class.
							check implementation_class: current_class = current_class_impl end
							an_expression.set_left (l_left_convert_expression)
						else
								-- We consider that VWEQ is not taken into account in flat Degree 3 mode.
								-- This is not considered as a fatal error.
							error_handler.report_vweq0a_error (current_class, current_class_impl, an_expression, l_left_context.named_type, l_right_context.named_type)
						end
					end
					if not has_fatal_error then
						a_context.force_last (current_universe_impl.boolean_type)
						report_equality_expression (an_expression)
					end
				end
			else
					-- The left expression is not valid. Check the right expression
					-- anyway, and then restore `has_fatal_error' to True.
				check_expression_validity (l_right_operand, l_right_context, l_any_type)
				set_fatal_error
			end
			free_context (l_right_context)
			free_context (l_left_context)
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			any_type: ET_CLASS_TYPE
			l_expression_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			any_type := current_system.any_type
			l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
			if l_typed_pointer_class.actual_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation: the type of '$(expr)' is 'TYPED_POINTER [<type-of-expr>]'.
				check_expression_validity (an_expression.expression, a_context, any_type)
				if not has_fatal_error then
					if not a_context.is_empty then
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (a_context.last)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						a_context.remove_last
						report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
						a_context.put_last (l_typed_pointer_type)
					else
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (a_context.root_context)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
						a_context.force_last (l_typed_pointer_type)
					end
						-- It might occur that the current type is needed to create
						-- an object of type 'TYPED_POINTER [<type-of-expr>]'.
-- TODO: try to find out whether <type-of_expr> depends on the type of current.
					report_current_type_needed
				end
			else
					-- Use the ETL2 implementation: the type of '$(expr)' is POINTER.
					-- Do not use `a_context' when checking the validity of the
					-- expression because we don't want it to be altered and we
					-- don't need the type of 'expr'.
				l_expression_context := new_context (current_type)
				check_expression_validity (an_expression.expression, l_expression_context, any_type)
				free_context (l_expression_context)
				if not has_fatal_error then
					l_pointer_type := current_universe_impl.pointer_type
					a_context.force_last (l_pointer_type)
					report_pointer_expression (an_expression, l_pointer_type)
				end
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			l_type := current_universe_impl.boolean_type
			a_context.force_last (l_type)
			report_boolean_constant (a_constant, l_type)
		end

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_procedure: ET_PROCEDURE
			l_query: ET_QUERY
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			already_checked: BOOLEAN
			l_identifier: ET_IDENTIFIER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument: ET_FORMAL_ARGUMENT
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local: ET_LOCAL_VARIABLE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_class_impl: ET_CLASS
			l_object_tests: ET_OBJECT_TEST_LIST
			l_object_test: ET_NAMED_OBJECT_TEST
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					if l_name.is_argument then
							-- Internal error: the seed of the argument should have
							-- been set by the parser.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_name.is_local then
							-- Internal error: the seed of the local should have
							-- been set by the parser.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_name.is_object_test_local then
							-- We need to resolve `a_name' in the implementation
							-- class of `current_feature_impl' first.
						if current_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: `a_name' should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
							l_identifier ?= l_name
							check is_object_test_local: l_identifier /= Void end
							l_object_test := current_object_test_scope.object_test (l_identifier)
							if l_object_test = Void then
									-- Error: `l_identifier' is an object-test local that is used outside of its scope.
								set_fatal_error
								if current_feature_impl.is_feature then
									error_handler.report_veen8a_error (current_class, l_identifier, current_feature_impl.as_feature)
								else
									error_handler.report_veen8b_error (current_class, l_identifier)
								end
							else
								report_object_test_local (l_identifier, l_object_test)
								l_seed := l_object_test.name.seed
								l_identifier.set_seed (l_seed)
								l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
								if l_typed_pointer_class.actual_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation: the type of '$object_test_local' is
										-- 'TYPED_POINTER [<type-of-object_test_local>]'.
									current_object_test_types.search (l_object_test)
									if not current_object_test_types.found then
											-- Internal error: the type of the object-test local should
											-- have been determined when processing the object-test itself.
											-- And this should have already been done this we are in the
											-- scope of that object-test.
										set_fatal_error
										error_handler.report_giaaa_error
									else
										a_context.copy_type_context (current_object_test_types.found_item)
										create l_actuals.make_with_capacity (1)
										l_actuals.put_first (tokens.like_current)
										create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
										report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
										a_context.force_last (l_typed_pointer_type)
										l_type := l_object_test.type
										if l_type /= Void and then not l_type.is_base_type then
												-- The type of the object-test local contains formal generic parameters
												-- or anchored types whose resolved value may vary in various
												-- descendant classes/types.
											report_current_type_needed
										end
									end
								else
										-- Use the ETL2 implementation: the type of '$object_test_local' is POINTER.
									l_pointer_type := current_universe_impl.pointer_type
									a_context.force_last (l_pointer_type)
									report_pointer_expression (an_expression, l_pointer_type)
								end
								already_checked := True
							end
						end
					else
							-- Try to see if it is of the form '$feature_name'.
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
						current_class.process (current_system.interface_checker)
						if not current_class.interface_checked or else current_class.has_interface_error then
							set_fatal_error
						else
							l_procedure := current_class.named_procedure (l_name)
							if l_procedure /= Void then
								l_seed := l_procedure.first_seed
								l_name.set_seed (l_seed)
								report_procedure_address (an_expression, l_procedure)
									-- $feature_name is of type POINTER, even
									-- in ISE and its TYPED_POINTER support.
								l_pointer_type := current_universe_impl.pointer_type
								a_context.force_last (l_pointer_type)
								report_pointer_expression (an_expression, l_pointer_type)
									-- No need to check validity in the context of `current_type' again.
								already_checked := True
							else
								l_query := current_class.named_query (l_name)
								if l_query /= Void then
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
									if l_query.is_attribute then
										report_attribute_address (an_expression, l_query)
										l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
										if l_typed_pointer_class.actual_class.is_preparsed then
												-- Class TYPED_POINTER has been found in the universe.
												-- Use ISE's implementation: the type of '$attribute' is 'TYPED_POINTER [<type-of-attribute>]'.
											l_type := l_query.type
											if l_type.is_base_type or current_class = current_type then
												create l_actuals.make_with_capacity (1)
												l_actuals.put_first (l_type)
												create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
												report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
												a_context.force_last (l_typed_pointer_type)
													-- The type of the attribute may vary in various descendant classes/types.
												report_current_type_needed
													-- No need to check validity in the context of `current_type' again.
												already_checked := True
											end
										else
												-- Use the ETL2 implementation: the type of '$attribute' is POINTER.
											l_pointer_type := current_universe_impl.pointer_type
											a_context.force_last (l_pointer_type)
											report_pointer_expression (an_expression, l_pointer_type)
												-- No need to check validity in the context of `current_type' again.
											already_checked := True
										end
									else
										report_function_address (an_expression, l_query)
											-- $feature_name is of type POINTER, even
											-- in ISE and its TYPED_POINTER support.
										l_pointer_type := current_universe_impl.pointer_type
										a_context.force_last (l_pointer_type)
										report_pointer_expression (an_expression, l_pointer_type)
											-- No need to check validity in the context of `current_type' again.
										already_checked := True
									end
								else
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VUAR-4 (ETL2 p.369).
									error_handler.report_vuar4a_error (current_class_impl, l_name)
								end
							end
						end
					end
				end
			end
			if not has_fatal_error and not already_checked then
				if l_name.is_argument then
						-- This is of the form '$argument'.
					if current_inline_agent = Void and in_invariant then
							-- VEEN-3: the formal argument appears in an invariant.
							-- Internal error: the invariant has no formal argument.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						if current_inline_agent /= Void then
							l_arguments := current_inline_agent.formal_arguments
							l_class_impl := current_class_impl
						else
								-- Use arguments of `current_feature' instead of `current_feature_impl'
								-- because when processing inherited assertions the types of signature
								-- should be those of the version of the feature in the current class.
								-- For example:
								--    deferred class A
								--    feature
								--       f (a: ANY) is
								--           require
								--               pre: g ($a)
								--           deferred
								--           end
								--      g (a: TYPED_POINTER [ANY]): BOOLEAN is deferred end
								--    end
								--    class B
								--    inherit
								--        A
								--    feature
								--        f (a: STRING) is do ... end
								--        g (a: TYPED_POINTER [STRING]): BOOLEAN is do ... end
								--    end
								-- `a' in the inherited precondition "pre" should be considered
								-- of type STRING (and not ANY) is class B.
								--
								-- Use arguments of implementation feature because the types
								-- of the signature of `current_feature' might not have been
								-- resolved for `current_class' (when processing precursors
								-- in the context of current class).
							l_arguments := current_feature.implementation_feature.arguments
							l_class_impl := current_feature.implementation_class
						end
						if l_arguments = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_seed < 1 or l_seed > l_arguments.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_argument := l_arguments.formal_argument (l_seed)
							l_identifier ?= l_name
							check is_argument: l_identifier /= Void end
							report_formal_argument (l_identifier, l_argument)
							l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$argument' is 'TYPED_POINTER [<type-of-argument>]'.
								l_type := l_argument.type
								l_resolved_type := resolved_formal_parameters (l_type, l_class_impl, current_type)
								if not has_fatal_error then
									create l_actuals.make_with_capacity (1)
									l_actuals.put_first (l_resolved_type)
									create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
									report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
									a_context.force_last (l_typed_pointer_type)
									if not l_type.is_base_type then
											-- The type of the argument contains formal generic parameters
											-- or anchored types whose resolved value may vary in various
											-- descendant classes/types.
										report_current_type_needed
									end
								end
							else
									-- Use the ETL2 implementation: the type of '$argument' is POINTER.
								l_pointer_type := current_universe_impl.pointer_type
								a_context.force_last (l_pointer_type)
								report_pointer_expression (an_expression, l_pointer_type)
							end
						end
					end
				elseif l_name.is_local then
						-- This is of the form '$local'.
					if current_inline_agent = Void and (in_precondition or in_postcondition) then
-- TODO: check the case where we are in the pre- or postcondition of an inline agent.
							-- The local entity appears in a pre- or postcondition.
						set_fatal_error
						if current_class_impl = current_class then
							if current_inline_agent /= Void then
								error_handler.report_veen2e_error (current_class, l_name, current_inline_agent)
							elseif current_feature_impl.is_feature then
								error_handler.report_veen2c_error (current_class, l_name, current_feature_impl.as_feature)
							else
									-- Internal error: invariants don't have pre- or postconditions.
								error_handler.report_giaaa_error
							end
						else
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: the VEEN-2 error should have been
									-- reported in the implementation feature.
								error_handler.report_giaaa_error
							end
						end
					elseif current_inline_agent = Void and in_invariant then
							-- VEEN-2: the local entity appears in an invariant.
							-- Internal error: the invariant has no local entity.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_locals := current_closure_impl.locals
						if l_locals = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_seed < 1 or l_seed > l_locals.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							l_local := l_locals.local_variable (l_seed)
							l_identifier ?= l_name
							check is_local: l_identifier /= Void end
							report_local_variable (l_identifier, l_local)
							l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$local' is 'TYPED_POINTER [<type-of-local>]'.
									-- Contrary to the types appearing in the signatures, types of
									-- local variables in the AST are those found in the implementation
									-- class of `current_feature', and hence need to be resolved in
									-- `current_type'.
								l_type := l_local.type
								l_resolved_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
								if not has_fatal_error then
									create l_actuals.make_with_capacity (1)
									l_actuals.put_first (l_resolved_type)
									create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
									report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
									a_context.force_last (l_typed_pointer_type)
									if not l_type.is_base_type then
											-- The type of the local variable contains formal generic parameters
											-- or anchored types whose resolved value may vary in various
											-- descendant classes/types.
										report_current_type_needed
									end
								end
							else
									-- Use the ETL2 implementation: the type of '$local' is POINTER.
								l_pointer_type := current_universe_impl.pointer_type
								a_context.force_last (l_pointer_type)
								report_pointer_expression (an_expression, l_pointer_type)
							end
						end
					end
				elseif l_name.is_object_test_local then
					l_object_tests := current_closure_impl.object_tests
					if l_object_tests = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_seed < 1 or l_seed > l_object_tests.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_object_test := l_object_tests.object_test (l_seed)
						l_identifier ?= l_name
						check is_object_test_local: l_identifier /= Void end
						report_object_test_local (l_identifier, l_object_test)
						l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
						if l_typed_pointer_class.actual_class.is_preparsed then
								-- Class TYPED_POINTER has been found in the universe.
								-- Use ISE's implementation: the type of '$object_test_local' is
								-- 'TYPED_POINTER [<type-of-object_test_local>]'.
							current_object_test_types.search (l_object_test)
							if not current_object_test_types.found then
									-- Internal error: the type of the object-test local should
									-- have been determined when processing the object-test itself.
									-- And this should have already been done this we are in the
									-- scope of that object-test.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								a_context.copy_type_context (current_object_test_types.found_item)
								create l_actuals.make_with_capacity (1)
								l_actuals.put_first (tokens.like_current)
								create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
								l_type := l_object_test.type
								if l_type /= Void and then not l_type.is_base_type then
										-- The type of the object-test local contains formal generic parameters
										-- or anchored types whose resolved value may vary in various
										-- descendant classes/types.
									report_current_type_needed
								end
							end
						else
								-- Use the ETL2 implementation: the type of '$object_test_local' is POINTER.
							l_pointer_type := current_universe_impl.pointer_type
							a_context.force_last (l_pointer_type)
							report_pointer_expression (an_expression, l_pointer_type)
						end
					end
				else
						-- This is of the form '$feature_name'.
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_procedure := current_class.seeded_procedure (l_seed)
						if l_procedure /= Void then
							report_procedure_address (an_expression, l_procedure)
								-- $feature_name is of type POINTER, even
								-- in ISE and its TYPED_POINTER support.
							l_pointer_type := current_universe_impl.pointer_type
							a_context.force_last (l_pointer_type)
							report_pointer_expression (an_expression, l_pointer_type)
						else
							l_query := current_class.seeded_query (l_seed)
							if l_query /= Void then
								if l_query.is_attribute then
									report_attribute_address (an_expression, l_query)
									l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
									if l_typed_pointer_class.actual_class.is_preparsed then
											-- Class TYPED_POINTER has been found in the universe.
											-- Use ISE's implementation: the type of '$attribute' is 'TYPED_POINTER [<type-of-attribute>]'.
										l_type := l_query.type
										l_resolved_type := resolved_formal_parameters (l_type, current_feature.implementation_class, current_type)
										if not has_fatal_error then
											create l_actuals.make_with_capacity (1)
											l_actuals.put_first (l_resolved_type)
											create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
											report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
											a_context.force_last (l_typed_pointer_type)
												-- The type of the attribute may vary in various descendant classes/types.
											report_current_type_needed
										end
									else
											-- Use the ETL2 implementation: the type of '$attribute' is POINTER.
										l_pointer_type := current_universe_impl.pointer_type
										a_context.force_last (l_pointer_type)
										report_pointer_expression (an_expression, l_pointer_type)
									end
								else
									report_function_address (an_expression, l_query)
										-- $feature_name is of type POINTER, even
										-- in ISE and its TYPED_POINTER support.
									l_pointer_type := current_universe_impl.pointer_type
									a_context.force_last (l_pointer_type)
									report_pointer_expression (an_expression, l_pointer_type)
								end
							else
									-- Internal error: if we got a seed, `l_query' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
			end
		end

	check_formal_argument_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of formal argument `a_name'.
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_argument: a_name.is_argument
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_formal: ET_FORMAL_ARGUMENT
			l_type: ET_TYPE
			l_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if current_inline_agent = Void and in_invariant then
					-- VEEN-3: the formal argument appears in an invariant.
					-- Internal error: the invariant has no formal argument.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if current_inline_agent /= Void then
					l_arguments := current_inline_agent.formal_arguments
					l_class_impl := current_class_impl
				else
						-- Use arguments of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f (a: ANY) is
						--           require
						--               pre: g (a)
						--           deferred
						--           end
						--      g (a: ANY): BOOLEAN is deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f (a: STRING) is do ... end
						--        g (a: STRING): BOOLEAN is do ... end
						--    end
						-- `a' in the inherited precondition "pre" should be considered
						-- of type STRING (and not ANY) is class B.
						--
						-- Use arguments of implementation feature because the types
						-- of the signature of `current_feature' might not have been
						-- resolved for `current_class' (when processing precursors
						-- in the context of current class).
					l_arguments := current_feature.implementation_feature.arguments
					l_class_impl := current_feature.implementation_class
				end
				l_seed := a_name.seed
				if l_arguments = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_arguments.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_formal := l_arguments.formal_argument (l_seed)
					l_type := resolved_formal_parameters (l_formal.type, l_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_type)
						report_formal_argument (a_name, l_formal)
					end
				end
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_integer_constant_validity (a_constant, a_context)
		end

	check_infix_cast_expression_validity (an_expression: ET_INFIX_CAST_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_target_type: ET_TYPE
		do
			check_expression_validity (an_expression.expression, a_context, current_target_type)
			if not has_fatal_error then
				an_expression.set_index (an_expression.expression.index)
				l_target_type := resolved_formal_parameters (an_expression.type, current_class_impl, current_type)
				if not has_fatal_error then
					a_context.reset (current_type)
					a_context.force_last (l_target_type)
				end
			end
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_target: ET_EXPRESSION
			l_boolean_target: ET_EXPRESSION
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_dotnet_function: ET_DOTNET_FUNCTION
			other_class: ET_CLASS
			other_query: ET_QUERY
			other_procedure: ET_PROCEDURE
			other_formals: ET_FORMAL_ARGUMENT_LIST
			other_formal: ET_FORMAL_ARGUMENT
			l_type: ET_TYPE
			l_seed: INTEGER
			l_actual: ET_EXPRESSION
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
			l_named_actual_type, l_named_formal_type: ET_NAMED_TYPE
			l_like: ET_LIKE_FEATURE
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_formal_type: ET_TYPE
			any_type: ET_CLASS_TYPE
			l_cast_expression: ET_INFIX_CAST_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_old_scope: INTEGER
		do
			has_fatal_error := False
			l_name := an_expression.name
			any_type := current_system.any_type
			l_target := an_expression.left
			if l_target.is_current then
					-- If the target is the current object there is a good chance that
					-- we will need its type to figure out which feature to call.
				report_current_type_needed
			end
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					check_expression_validity (l_target, a_context, any_type)
					if not has_fatal_error then
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_query := l_class.named_query (l_name)
							if l_query /= Void then
								l_seed := l_query.first_seed
								l_name.set_seed (l_seed)
							else
								l_procedure := l_class.named_procedure (l_name)
								if l_procedure /= Void then
										-- In an infix expression the feature has to be a query.
									set_fatal_error
									error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
								else
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VUEX-2 (ETL2 p.368).
									error_handler.report_vuex2a_error (current_class, l_name, l_class)
								end
							end
							if not has_fatal_error then
								if l_class.is_boolean_class then
										-- This is useful to know which binary expressions are
										-- boolean operators between two boolean expressions
										-- when trying to determine the scope of object-test locals.
									an_expression.set_boolean_operator (True)
								end
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if l_query = Void then
						-- We didn't find the query yet. This is because the seed
						-- was already computed in a proper ancestor (or in
						-- another generic derivation) of `current_class' where
						-- this expression was written.
					check_expression_validity (l_target, a_context, any_type)
					if not has_fatal_error then
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_query := l_class.seeded_query (l_seed)
							if l_query = Void then
									-- Report internal error: if we got a seed, the
									-- `l_query' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
				if l_query /= Void then
					check l_class_not_void: l_class /= Void end
					if not l_query.is_exported_to (current_class) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_query, l_class)
					end
					had_error := has_fatal_error
					check_qualified_vape_validity (l_name, l_query, l_class)
					if had_error then
						set_fatal_error
					end
						-- Check arguments validity.
					l_formals := l_query.arguments
					if l_formals = Void or else l_formals.count /= 1 then
						l_dotnet_function ?= l_query
						if l_dotnet_function /= Void and then l_dotnet_function.is_static and then l_formals.count = 2 then
								-- Under .NET, it is possible to have static infix functions with two arguments.
								-- In that case the left and right operands of the infix call are passed as arguments
								-- of this function.
								-- First check that the left-operand conforms or converts to the first formal argument.
							l_actual := l_target
							l_actual_context := a_context
							l_formal := l_formals.formal_argument (1)
							l_formal_context := a_context
							l_formal_type := l_formal.type
							if not l_actual_context.conforms_to_type (l_formal_type, l_formal_context) then
									-- The actual argument does not conform to the formal argument.
									-- Try to see if it converts to it.
								if has_fatal_error then
									had_error := True
								end
								l_formal_context.force_last (l_formal_type)
								l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
								l_formal_context.remove_last
								if has_fatal_error then
									had_error := True
								elseif l_convert_expression /= Void then
										-- Insert the conversion feature call in the AST.
										-- Convertibility should be resolved in the implementation class.
									check implementation_class: current_class = current_class_impl end
									an_expression.set_left (l_convert_expression)
									l_actual := l_convert_expression
								else
									set_fatal_error
									l_named_actual_type := l_actual_context.named_type
									l_named_formal_type := l_formal_type.named_type (l_formal_context)
									error_handler.report_vuar2a_error (current_class, current_class_impl, l_name, l_query, l_class, 1, l_named_actual_type, l_named_formal_type)
									had_error := True
								end
							end
								-- Then check that the right operand conforms or convert to the second formal argument.
							l_actual := an_expression.right
							l_actual_context := new_context (current_type)
							l_formal := l_formals.formal_argument (2)
							l_formal_context := a_context
							l_formal_type := l_formal.type
							l_formal_context.force_last (l_formal_type)
							if has_fatal_error then
								had_error := True
							end
							check_expression_validity (l_actual, l_actual_context, l_formal_context)
							if had_error then
								set_fatal_error
							end
							l_formal_context.remove_last
							if not has_fatal_error then
								if not l_actual_context.conforms_to_type (l_formal_type, l_formal_context) then
										-- The actual argument does not conform to the formal argument.
										-- Try to see if it converts to it.
									if has_fatal_error then
										had_error := True
									end
									l_formal_context.force_last (l_formal_type)
									l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
									l_formal_context.remove_last
									if has_fatal_error then
										had_error := True
									elseif l_convert_expression /= Void then
											-- Insert the conversion feature call in the AST.
											-- Convertibility should be resolved in the implementation class.
										check implementation_class: current_class = current_class_impl end
										an_expression.set_right (l_convert_expression)
										l_actual := l_convert_expression
									else
										set_fatal_error
										l_named_actual_type := l_actual_context.named_type
										l_named_formal_type := l_formal_type.named_type (l_formal_context)
										error_handler.report_vuar2a_error (current_class, current_class_impl, l_name, l_query, l_class, 2, l_named_actual_type, l_named_formal_type)
										had_error := True
									end
								end
							end
							free_context (l_actual_context)
						else
								-- The number of actual arguments is different from
								-- the number of formal arguments.
							set_fatal_error
							if current_class = current_class_impl then
								error_handler.report_vuar1a_error (current_class, l_name, l_query, l_class)
							elseif not has_implementation_error (current_feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation of `current_feature_impl' or in
									-- the feature flattener when redeclaring `l_query' in an
									-- ancestor of `l_class' or `current_class'.
								error_handler.report_giaaa_error
							end
						end
					else
						l_actual := an_expression.right
						l_actual_context := new_context (current_type)
						l_formal := l_formals.formal_argument (1)
						l_formal_context := a_context
						l_formal_type := l_formal.type
						l_formal_context.force_last (l_formal_type)
						if has_fatal_error then
							had_error := True
						end
							-- Make sure that the scope of object-test locals are handled
							-- correctly when the infix expression is a boolean operator
							-- between two boolean expressions. The right-hand-side of
							-- the infix expression might be part of an object-test local
							-- appearing in the left-hand-side.
						l_old_scope := current_object_test_scope.count
						if not an_expression.is_boolean_operator then
							-- Do nothing.
						elseif l_name.is_infix_and_then then
							object_test_scope_builder.build_scope (l_target, current_object_test_scope)
						elseif l_name.is_infix_implies then
							object_test_scope_builder.build_scope (l_target, current_object_test_scope)
						elseif l_name.is_infix_or_else then
							object_test_scope_builder.build_negated_scope (l_target, current_object_test_scope)
						end
						check_expression_validity (l_actual, l_actual_context, l_formal_context)
						current_object_test_scope.keep_object_tests (l_old_scope)
						if had_error then
							set_fatal_error
						end
						l_formal_context.remove_last
						if not has_fatal_error then
							if not l_actual_context.conforms_to_type (l_formal_type, l_formal_context) then
									-- The actual argument does not conform to the formal argument.
									-- Try to see if it converts to it.
								l_formal_context.force_last (l_formal_type)
								l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
								l_formal_context.remove_last
								if has_fatal_error then
									had_error := True
								elseif l_convert_expression /= Void then
										-- Insert the conversion feature call in the AST.
										-- Convertibility should be resolved in the implementation class.
									check implementation_class: current_class = current_class_impl end
									an_expression.set_right (l_convert_expression)
									l_actual := l_convert_expression
								else
									had_error := True
										-- Infix feature convertibility: try to convert
										-- the target (i.e. the left-hand-side) to the type
										-- of the argument (i.e. the right-hand-side).
									if current_class = current_class_impl then
										other_class := l_actual_context.base_class
										if
											other_class /= l_class or else
											not l_actual_context.same_named_context (l_formal_context)
										then
												-- Either the base classes of the left- and right-hand sides
												-- are not the same, or they have different types. No need
												-- to go further if the left- and right-hand sides have the
												-- same types.
												-- Left-hand side type: `l_formal_context'
												-- Right-hand side type: `l_actual_context'
											other_class.process (current_system.interface_checker)
											if other_class.interface_checked and then not other_class.has_interface_error then
												other_query := other_class.named_query (l_name)
												if other_query = Void then
													other_procedure := other_class.named_procedure (l_name)
													if other_procedure /= Void then
															-- In an infix expression the feature has to be a query.
														set_fatal_error
														error_handler.report_vkcn2a_error (current_class, l_name, other_procedure, l_class)
													end
												end
											end
										end
										if other_query /= Void then
											if other_query.is_exported_to (current_class) then
													-- There is an exported query with the same name in the
													-- base class of the right-hand-side of the infix expression.
													-- Now we need to find out whether it is possible to
													-- convert the left-hand-side to the type of the right-
													-- hand-side.
												l_convert_expression := convert_expression (l_target, l_formal_context, l_actual_context)
												if has_fatal_error then
													had_error := True
												elseif l_convert_expression /= Void then
														-- Insert the conversion feature call in the AST.
														-- Convertibility should be resolved in the implementation class.
													check implementation_class: current_class = current_class_impl end
													create l_cast_expression.make (l_convert_expression, l_actual_context.named_type)
													l_cast_expression.set_index (l_convert_expression.index)
												else
														-- If the left-hand-side does not convert to the type
														-- of the right-hand-side, it might conform!
													if l_formal_context.conforms_to_context (l_actual_context) then
														create l_cast_expression.make (l_target, l_actual_context.named_type)
														l_cast_expression.set_index (l_target.index)
													end
												end
											end
											if l_cast_expression /= Void then
													-- We managed to change (either through conversion or
													-- conformance) the type of the left-hand-side to the
													-- type of the right-hand-side.
												other_formals := other_query.arguments
												if other_formals /= Void and then other_formals.count = 1 then
														-- The replacement query has the right number of formal arguments.
													other_formal := other_formals.formal_argument (1)
-- TODO: should we check for convertibility if no conformance?
-- Check what ECMA Eiffel says.
													if l_actual_context.conforms_to_type (other_formal.type, l_actual_context) then
															-- The right-hand-side is a valid actual argument for
															-- the replacement query. Let's do the substitution
															-- and make as if there was no error in the first place.
														had_error := False
														l_seed := other_query.first_seed
														l_name.set_seed (l_seed)
														a_context.copy_type_context (l_actual_context)
														l_query := other_query
														l_class := other_class
															-- Insert the cast expression in the AST.
														an_expression.set_left (l_cast_expression)
														l_target := l_cast_expression
														if l_class.is_boolean_class then
																-- This is useful to know which binary expressions are
																-- boolean operators between two boolean expressions
																-- when trying to determine the scope of object-test locals.
															an_expression.set_boolean_operator (True)
																-- We should note that if the left-hand-side contains object-tests,
																-- then when we checked the right-hand-side earlier with the previous
																-- type for the target (i.e. the left-hand-side), no scope of
																-- object-test locals could be found because at that time the target
																-- was not of type boolean. Now the target is of type boolean, but
																-- nothing is changed to the scope of object-test locals in the
																-- right-hand-side. Indeed, when we change the type of the target
																-- to be boolean, we could not use boolean operators (boolean operators
																-- only have boolean operands, and the type of the target was not
																-- boolean). Therefore we cannot prove that object-tests appearing
																-- in the target will always evaluate to True if the new target
																-- evaluates to True, and likewise if the new target evaluates to
																-- False. So the right-hand-side cannot be part of the scope of
																-- their object-test locals.
														elseif an_expression.is_boolean_operator then
																-- We should note that if the left-hand-side contains object-tests,
																-- then when we checked the right-hand-side earlier with the
																-- previous type for the target (i.e. the left-hand-side), scope of
																-- object-test locals could be found because at that time the target
																-- was of type boolean. Now the target is not of type boolean anymore,
																-- so the right-hand-side should not be in the scope of these
																-- object-test locals anymore. We need to reprocess the right-hand-side
																-- in this new context.
															l_old_scope := current_object_test_scope.count
															l_boolean_target := an_expression.left
															if l_name.is_infix_and_then then
																object_test_scope_builder.build_scope (l_boolean_target, current_object_test_scope)
															elseif l_name.is_infix_implies then
																object_test_scope_builder.build_scope (l_boolean_target, current_object_test_scope)
															elseif l_name.is_infix_or_else then
																object_test_scope_builder.build_negated_scope (l_boolean_target, current_object_test_scope)
															end
															an_expression.set_boolean_operator (False)
															if l_old_scope /= current_object_test_scope.count then
																current_object_test_scope.keep_object_tests (l_old_scope)
																	-- The right-hand-side was in the scope of object-test locals
																	-- declared in the left-hand-side. So we need to reprocess
																	-- the right-hand-side as explained above.
																l_actual_context.reset (current_type)
																l_formal_context := a_context
																l_formal_type := other_formal.type
																l_formal_context.force_last (l_formal_type)
																check_expression_validity (l_actual, l_actual_context, l_formal_context)
																l_formal_context.remove_last
															end
														end
													end
												end
											end
										end
									end
									if had_error then
											-- We did not manage to convert the left-hand-side to
											-- the type of the right-hand-side.
										set_fatal_error
										l_named_actual_type := l_actual_context.named_type
										l_named_formal_type := l_formal_type.named_type (l_formal_context)
										error_handler.report_vuar2a_error (current_class, current_class_impl, l_name, l_query, l_class, 1, l_named_actual_type, l_named_formal_type)
									end
								end
							end
						end
						free_context (l_actual_context)
					end
					if not has_fatal_error then
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
						l_type := l_query.type
						l_like ?= l_type
						if l_like /= Void and then l_like.is_like_argument then
							l_formal_context := new_context (current_type)
							l_formal_context.copy_type_context (a_context)
							l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
							a_context.wipe_out
							l_actual := an_expression.right
								-- Make sure that the scope of object-test locals is handled
								-- correctly when the infix expression is a boolean operator
								-- between two boolean expressions. The right-hand-side of
								-- the infix expression might be part of an object-test local
								-- appearing in the left-hand-side.
							l_old_scope := current_object_test_scope.count
							if not an_expression.is_boolean_operator then
								-- Do nothing.
							elseif l_name.is_infix_and_then then
								object_test_scope_builder.build_scope (l_target, current_object_test_scope)
							elseif l_name.is_infix_implies then
								object_test_scope_builder.build_scope (l_target, current_object_test_scope)
							elseif l_name.is_infix_or_else then
								object_test_scope_builder.build_negated_scope (l_target, current_object_test_scope)
							end
							check_expression_validity (l_actual, a_context, l_formal_context)
							current_object_test_scope.keep_object_tests (l_old_scope)
							if not has_fatal_error then
								l_convert_expression ?= l_actual
								if l_convert_expression /= Void then
									l_builtin ?= l_convert_expression.convert_feature
									if l_builtin /= Void then
											-- Needed for compatibility with ISE 5.6.0610:
											-- a formal generic parameter either conforms or converts to its constraint,
											-- then the converted version can still be chained with a conformance to
											-- `current_target_type'.
										a_context.reset (current_type)
										a_context.force_last (l_builtin.type)
									end
								end
								l_formal_context.remove_last
								report_qualified_call_expression (an_expression, l_formal_context, l_query)
							end
							free_context (l_formal_context)
						else
							report_qualified_call_expression (an_expression, a_context, l_query)
							a_context.force_last (l_type)
						end
					end
				end
			end
		end

	check_integer_constant_validity (a_constant: ET_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- An integer constant is of the form:
			--    [manifest_type] manifest_value
			-- where the manifest_type is optional.
			-- We have to check that:
			--  * if 'manifest_type' is provided:
			--    * it is a valid type, and is one of the sized variants of "INTEGER".
			--    * 'manifest_value' is representable as an instance of 'manifest_type'.
			--  * otherwise, try to determine whether 'manifest_value' is representable
			--    as an instance of the type expected in the surrounding context.
			--  * otherwise, the constant will be of type "INTEGER_32" if 'manifest_value'
			--    is representable as an INTEGER_32, will be of type "INTEGER_64" if it
			--    is representable as an INTEGER_64, will be of type "NATURAL_64" if it
			--    is represenable as a NATURAL_64.
			--  * otherwise, report an overflow error.
			--
			-- Note that ECMA 367-2 says that the type of a manifest integer constant
			-- with no explicit 'manifest_type' is "INTEGER" (see 8.29.6 "Definition:
			-- Type of a manifest constant", page 143). So the third bullet above is
			-- not quite compliant with ECMA. But this is the way it is implemented
			-- in ISE (as of 6.3.7.60670) to be able to capture large numbers.
			--
			-- Note that the sized variants of "INTEGER" include "INTEGER" itself, as
			-- indicated in ECMA 367-2, 8.30.1 "Definition: Basic types and their sized
			-- variants", page 147.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
			l_cast_type: ET_TARGET_TYPE
			l_explicit_type: ET_TYPE
			l_sign: ET_SYMBOL_OPERATOR
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.like_current
			l_expected_type_context := current_target_type
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- Make sure that `l_cast_type' is a valid type.
					-- For example 'INTEGER_32 [STRING]' is not valid.
				l_explicit_type := l_cast_type.type
				check_type_validity (l_explicit_type)
				if has_fatal_error then
					-- Do nothing.
				elseif not l_explicit_type.is_named_type then
						-- Error: invalid cast type, it should be a sized variant of "INTEGER".
					set_fatal_error
					error_handler.report_vwmq0a_error (current_class, current_class_impl, a_constant)
				else
					l_expected_type := l_explicit_type
					l_expected_type_context := current_class_impl
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif current_universe_impl.integer_8_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_integer_8 then
					l_type := current_universe_impl.integer_8_type
					report_integer_8_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.integer_8_type)
				end
			elseif current_universe_impl.integer_16_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_integer_16 then
					l_type := current_universe_impl.integer_16_type
					report_integer_16_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.integer_16_type)
				end
			elseif current_universe_impl.integer_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_integer_32 then
					l_type := current_universe_impl.integer_32_type
					report_integer_32_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.integer_32_type)
				end
			elseif current_universe_impl.integer_64_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_integer_64 then
					l_type := current_universe_impl.integer_64_type
					report_integer_64_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.integer_64_type)
				end
			elseif current_universe_impl.natural_8_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_natural_8 then
					l_type := current_universe_impl.natural_8_type
					report_natural_8_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.natural_8_type)
				end
			elseif current_universe_impl.natural_16_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_natural_16 then
					l_type := current_universe_impl.natural_16_type
					report_natural_16_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.natural_16_type)
				end
			elseif current_universe_impl.natural_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_natural_32 then
					l_type := current_universe_impl.natural_32_type
					report_natural_32_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.natural_32_type)
				end
			elseif current_universe_impl.natural_64_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_natural_64 then
					l_type := current_universe_impl.natural_64_type
					report_natural_64_constant (a_constant, l_type)
				elseif l_explicit_type /= Void then
					set_fatal_error
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.natural_64_type)
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "INTEGER".
				set_fatal_error
				error_handler.report_vwmq0a_error (current_class, current_class_impl, a_constant)
			elseif a_constant.is_integer_32 then
				if (a_constant.is_hexadecimal or a_constant.is_binary) and then (a_constant.sign = Void and a_constant.value > {INTEGER_32}.Max_value.as_natural_64) then
						-- ISE Eiffel considers that:
						--   {INTEGER_32} 0xFFFFFFFF
						-- and:
						--   i: INTEGER_32
						--   i := 0xFFFFFFFF
						-- as valid (and mean -1), when appearing without an integer type
						-- context, then its type is INTEGER_64 and its value is 4294967295.
					l_type := current_universe_impl.integer_64_type
					report_integer_64_constant (a_constant, l_type)
				else
					l_type := current_universe_impl.integer_32_type
					report_integer_32_constant (a_constant, l_type)
				end
			elseif a_constant.is_integer_64 then
				if (a_constant.is_hexadecimal or a_constant.is_binary) and then (a_constant.sign = Void and a_constant.value > {INTEGER_64}.Max_value.as_natural_64) then
						-- ISE Eiffel considers that:
						--   {INTEGER_64} 0xFFFFFFFFFFFFFFFF
						-- and:
						--   i: INTEGER_64
						--   i := 0xFFFFFFFFFFFFFFFF
						-- as valid (and mean -1), when appearing without an integer type
						-- context, then its type is NATURAL_64 and its value is 18446744073709551615.
					l_type := current_universe_impl.natural_64_type
					report_natural_64_constant (a_constant, l_type)
				else
					l_type := current_universe_impl.integer_64_type
					report_integer_64_constant (a_constant, l_type)
				end
			elseif a_constant.is_natural_64 then
				l_type := current_universe_impl.natural_64_type
				report_natural_64_constant (a_constant, l_type)
			else
				set_fatal_error
				l_sign := a_constant.sign
				if l_sign /= Void and then l_sign.is_minus then
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.integer_64_type)
				else
					error_handler.report_gvwmc2a_error (current_class, current_class_impl, a_constant, current_universe_impl.natural_64_type)
				end
			end
			if l_type /= Void then
				a_constant.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of local variable `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local: ET_LOCAL_VARIABLE
			l_type: ET_TYPE
		do
			has_fatal_error := False
			if current_inline_agent = Void and (in_precondition or in_postcondition) then
-- TODO: check the case where we are in the pre- or postcondition of an inline agent.
					-- The local entity appears in a pre- or postcondition.
				set_fatal_error
				if current_class_impl = current_class then
					if current_inline_agent /= Void then
						error_handler.report_veen2e_error (current_class, a_name, current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_veen2c_error (current_class, a_name, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have pre- and postconditions.
						error_handler.report_giaaa_error
					end
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			elseif current_inline_agent = Void and in_invariant then
					-- VEEN-2: the local entity appears in an invariant.
					-- Internal error: the invariant has no local entity,
					-- this is guaranteed by the parser.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_locals := current_closure_impl.locals
				l_seed := a_name.seed
				if l_locals = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_locals.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
						-- Contrary to the types appearing in the signatures, types of
						-- local variables in the AST are those found in the implementation
						-- class of `current_feature', and hence need to be resolved in
						-- `current_type'.
					l_local := l_locals.local_variable (l_seed)
					l_type := resolved_formal_parameters (l_local.type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_type)
						report_local_variable (a_name, l_local)
					end
				end
			end
		end

	check_manifest_array_validity (an_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, j, nb: INTEGER
			had_error: BOOLEAN
			l_item_type: ET_TYPE
			hybrid_type: BOOLEAN
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			array_class: ET_NAMED_CLASS
			l_array_type: ET_CLASS_TYPE
			l_array_parameters: ET_ACTUAL_PARAMETER_LIST
			l_array_parameter: ET_TYPE
			l_generic_class_type: ET_GENERIC_CLASS_TYPE
			any_type: ET_CLASS_TYPE
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_parameter_context: ET_NESTED_TYPE_CONTEXT
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_expression_comma: ET_EXPRESSION_COMMA
			l_item: ET_EXPRESSION_ITEM
			l_item_expression: ET_EXPRESSION
		do
			has_fatal_error := False
-- TODO: check that the type of the manifest array does not depend on the
-- type of current. Be pessimistic for now and report it.
			report_current_type_needed
			array_class := current_universe_impl.array_any_type.named_base_class
				-- Try to find out whether the expected type (i.e. `current_target_type')
				-- for the manifest array is 'ARRAY [...]'. If this is the case then the
				-- manifest array will be created of that type.
			l_array_type ?= current_target_type.named_type
			if l_array_type /= Void and then l_array_type.base_class.is_array_class then
				l_array_parameters := l_array_type.actual_parameters
				if l_array_parameters /= Void and then l_array_parameters.count = 1 then
					l_array_parameter := l_array_parameters.type (1)
				end
			end
			nb := an_expression.count
			if l_array_parameter /= Void then
					-- The expected type for the manifest array is 'ARRAY [...]'.
					-- So the manifest array will be created of that type.
				l_parameter_context := new_context (current_type)
				l_parameter_context.force_last (l_array_parameter)
				l_expression_context := new_context (current_type)
				from i := 1 until i > nb loop
					l_item := an_expression.item (i)
					l_item_expression := l_item.expression
					check_expression_validity (l_item_expression, l_expression_context, l_parameter_context)
					if has_fatal_error then
						had_error := True
					else
						if not had_error then
							if l_item_type = Void then
								l_item_type := l_expression_context.named_type
							elseif not hybrid_type then
								hybrid_type := not l_expression_context.same_named_type (l_item_type, current_type)
							end
						end
						if l_array_type /= Void and then not l_expression_context.conforms_to_type (l_array_parameter, current_type) then
								-- The type of this item does not conform to the type of
								-- the parameter of the expected array type. Try to see
								-- if it converts to it.
							l_convert_expression := convert_expression (l_item_expression, l_expression_context, l_parameter_context)
							if has_fatal_error then
								had_error := True
							elseif l_convert_expression /= Void then
									-- Insert the conversion feature call in the AST.
									-- Convertibility should be resolved in the implementation class.
								check implementation_class: current_class = current_class_impl end
								l_expression_comma ?= l_item
								if l_expression_comma /= Void then
									l_expression_comma.set_expression (l_convert_expression)
								else
									an_expression.put (l_convert_expression, i)
								end
							else
									-- It does not conform nor convert. We are out of luck
									-- and revise our position: We will have to find another
									-- way to determine the type of the array, and a validity
									-- error will be reported when we try to pass this array as
									-- argument or in an assignment with a type that does
									-- not conform nor convert to the expected type.
									-- To determine the type of the array, we will now
									-- try to see if all items have the same type. If so then the
									-- type of the manifest array will be an array of that type.
									-- Otherwise we are out of luck and will consider that it is
									-- an 'ARRAY [ANY]'.
								l_array_type := Void
									-- We need to remove the convert features that we might
									-- have added to the AST.
								if current_class = current_class_impl then
									from j := 1 until j >= i loop
										l_item := an_expression.item (j)
										l_item_expression := l_item.expression
										l_convert_expression ?= l_item_expression
										if l_convert_expression /= Void then
											l_item_expression := l_convert_expression.expression
											l_expression_comma ?= l_item
											if l_expression_comma /= Void then
												l_expression_comma.set_expression (l_item_expression)
											else
												an_expression.put (l_item_expression, j)
											end
										end
										j := j + 1
									end
								end
							end
						end
					end
					l_expression_context.wipe_out
					i := i + 1
				end
				free_context (l_expression_context)
				free_context (l_parameter_context)
			else
					-- Try to see if all items have the same type. If so then the
					-- type of the manifest array will be an array of that type.
					-- Otherwise we are out of luck and will consider that it is
					-- an 'ARRAY [ANY]'.
				l_array_type := Void
				any_type := current_system.any_type
				l_expression_context := new_context (current_type)
				from i := 1 until i > nb loop
					check_expression_validity (an_expression.expression (i), l_expression_context, any_type)
					if has_fatal_error then
						had_error := True
					elseif not had_error then
						if l_item_type = Void then
							l_item_type := l_expression_context.named_type
						elseif not hybrid_type then
							hybrid_type := not l_expression_context.same_named_type (l_item_type, current_type)
						end
					end
					l_expression_context.wipe_out
					i := i + 1
				end
				free_context (l_expression_context)
			end
			if had_error then
				set_fatal_error
			elseif l_array_type /= Void then
				report_manifest_array (an_expression, l_array_type)
				a_context.force_last (l_array_type)
			elseif l_item_type = Void then
					-- This is an empty manifest array: '<< >>'. We have no way to
					-- find out the type of the parameter, so we use 'ARRAY [ANY]'.
				l_array_type := current_system.array_any_type
				report_manifest_array (an_expression, l_array_type)
				a_context.force_last (l_array_type)
			elseif hybrid_type then
					-- There are at least two items which don't have the same type.
					-- Use 'ARRAY [ANY]' in that type.
-- TODO: we could do better that 'ARRAY [ANY]', for example choosing one of the
-- common ancestors of these two types. But which one to choose? ETL2 does not say.
				l_array_type := current_system.array_any_type
				report_manifest_array (an_expression, l_array_type)
				a_context.force_last (l_array_type)
			else
					-- All items of the same type. So the manifest array will be
					-- an array of that type.
				create l_actuals.make_with_capacity (1)
				l_actuals.put_first (l_item_type)
				create l_generic_class_type.make (Void, array_class.name, l_actuals, array_class)
				l_generic_class_type.set_unresolved_type (current_system.array_any_type)
				report_manifest_array (an_expression, l_generic_class_type)
				a_context.force_last (l_generic_class_type)
			end
		end

	check_manifest_string_validity (a_string: ET_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
			l_cast_type: ET_TARGET_TYPE
			l_explicit_type: ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.like_current
			l_expected_type_context := current_target_type
			l_cast_type := a_string.cast_type
			if l_cast_type /= Void then
					-- Make sure that `l_cast_type' is a valid type.
					-- For example 'STRING_8 [ANY]' is not valid.
				l_explicit_type := l_cast_type.type
				check_type_validity (l_explicit_type)
				if has_fatal_error then
					-- Do nothing.
				elseif not l_explicit_type.is_named_type then
						-- Error: invalid cast type, it should be a sized variant of "STRING".
					set_fatal_error
					error_handler.report_vwmq0d_error (current_class, current_class_impl, a_string)
				else
					l_expected_type := l_explicit_type
					l_expected_type_context := current_class_impl
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif current_universe_impl.string_8_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "STRING_8".
				l_type := current_universe_impl.string_8_type
				report_string_8_constant (a_string, l_type)
			elseif current_universe_impl.string_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "STRING_32".
				l_type := current_universe_impl.string_32_type
				report_string_32_constant (a_string, l_type)
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "STRING".
				set_fatal_error
				error_handler.report_vwmq0d_error (current_class, current_class_impl, a_string)
			else
-- TODO: check what ISE does here.
				l_type := current_universe_impl.string_8_type
				report_string_8_constant (a_string, l_type)
			end
			if l_type /= Void then
				a_string.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb, nb2: INTEGER
			had_error: BOOLEAN
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_tuple_type: ET_TUPLE_TYPE
			l_tuple_parameters: ET_ACTUAL_PARAMETER_LIST
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_parameter_context: ET_NESTED_TYPE_CONTEXT
			any_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
-- TODO: check that the type of the manifest tuple does not depend on the
-- type of current. Be pessimistic for now and report it.
			report_current_type_needed
				-- Try to find out whether the expected type (i.e. `current_target_type')
				-- for the manifest tuple is 'TUPLE [...]'. If this is the case then we
				-- use these items types as expected types for the corresponding items
				-- in the manifest tuple. For example if we expect a 'TUPLE [INTEGER_64]'
				-- and we have '[3]' then '3' will be considered as a '{INTEGER_64} 3'.
				-- Likewise, if we expect a 'TUPLE [ARRAY [HASHABLE]]' and we have
				-- '[<<"gobo", 3>>]' then the manifest array '<<"gobo", 3>>' will be
				-- considered of type 'ARRAY [HASHABLE]' (rather than of type 'ARRAY [ANY]'
				-- if it were analyzed out of context).
			l_tuple_type ?= current_target_type.named_type
			if l_tuple_type /= Void then
				l_tuple_parameters := l_tuple_type.actual_parameters
				if l_tuple_parameters /= Void then
					nb2 := l_tuple_parameters.count
				end
			end
			any_type := current_system.any_type
			l_expression_context := new_context (current_type)
			nb := an_expression.count
			create l_actuals.make_with_capacity (nb)
			from i := nb until i <= nb2 loop
					-- There is no matching tuple item type.
				check_expression_validity (an_expression.expression (i), l_expression_context, any_type)
				if has_fatal_error then
					had_error := True
				else
					l_actuals.put_first (l_expression_context.named_type)
				end
				l_expression_context.wipe_out
				i := i - 1
			end
			l_parameter_context := new_context (current_type)
			from until i < 1 loop
					-- The expected type for the manifest tuple is 'TUPLE [...]'.
					-- Use these items types as expected types for the corresponding items
					-- in the manifest tuple. For example if we expect a 'TUPLE [INTEGER_64]'
					-- and we have '[3]' then '3' will be considered as a '{INTEGER_64} 3'.
					-- Likewise, if we expect a 'TUPLE [ARRAY [HASHABLE]]' and we have
					-- '[<<"gobo", 3>>]' then the manifest array '<<"gobo", 3>>' will be
					-- considered of type 'ARRAY [HASHABLE]' (rather than of type 'ARRAY [ANY]'
					-- if it were analyzed out of context).
				l_parameter_context.force_last (l_tuple_parameters.type (i))
				check_expression_validity (an_expression.expression (i), l_expression_context, l_parameter_context)
				if has_fatal_error then
					had_error := True
				else
					l_actuals.put_first (l_expression_context.named_type)
				end
				l_expression_context.wipe_out
				l_parameter_context.wipe_out
				i := i - 1
			end
			free_context (l_parameter_context)
			free_context (l_expression_context)
			if had_error then
				set_fatal_error
			else
				create l_tuple_type.make (Void, l_actuals, current_universe_impl.tuple_type.named_base_class)
				report_manifest_tuple (an_expression, l_tuple_type)
				a_context.force_last (l_tuple_type)
			end
		end

	check_manifest_type_validity (an_expression: ET_MANIFEST_TYPE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_type_class: ET_NAMED_CLASS
			l_type_type: ET_GENERIC_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			has_fatal_error := False
			l_type := an_expression.type
-- TODO: I think that the formal generic parameters of `l_type' need to
-- be resolved in the context of `current_type'.
			check_type_validity (l_type)
			if not has_fatal_error then
				if not l_type.is_base_type then
						-- The type of the manifest type contains formal generic parameters
						-- or anchored types whose resolved value may vary in various
						-- descendant classes/types.
					report_current_type_needed
				end
				l_type_class := current_universe_impl.type_any_type.named_base_class
				create l_actuals.make_with_capacity (1)
				l_actuals.put_first (l_type)
				create l_type_type.make (Void, l_type_class.name, l_actuals, l_type_class)
				report_manifest_type (an_expression, l_type_type, a_context)
				a_context.force_last (l_type_type)
			end
		end

	check_named_object_test_validity (an_expression: ET_NAMED_OBJECT_TEST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_other_object_test: ET_NAMED_OBJECT_TEST
			l_type: ET_TYPE
			l_had_error: BOOLEAN
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_IDENTIFIER
			l_feature: ET_FEATURE
			i, j, nb: INTEGER
			l_enclosing_agent: ET_INLINE_AGENT
			args: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_outermost_expression: ET_EXPRESSION
		do
			has_fatal_error := False
			l_expression_context := new_context (current_type)
			l_type := an_expression.type
			if l_type /= Void then
				check_type_validity (l_type)
				if not has_fatal_error then
						-- Contrary to the types appearing in the signatures, types of
						-- object-test locals in the AST are those found in the implementation
						-- class of `current_feature', and hence need to be resolved in
						-- `current_type'.
					l_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
				end
				if has_fatal_error then
						-- The type is not valid. We will consider that it is of
						-- type 'ANY' when checking the validity of the expression.
					l_had_error := True
					check_expression_validity (an_expression.expression, l_expression_context, current_system.any_type)
					has_fatal_error := has_fatal_error or l_had_error
				else
					l_expression_context.force_last (l_type)
					check_expression_validity (an_expression.expression, a_context, l_expression_context)
					a_context.reset (current_type)
				end
			else
				check_expression_validity (an_expression.expression, l_expression_context, current_system.any_type)
			end
			current_object_test_types.force_last (l_expression_context, an_expression)
				-- Check object-test local name clashes (see VUOT-1, in ECMA-367-2 p.127).
			if current_class = current_class_impl then
				l_name := an_expression.name
				l_feature := current_class.named_query (l_name)
				if l_feature /= Void then
						-- This object-test local has the same name as the
						-- final name of a feature in `current_class'.
					set_fatal_error
					error_handler.report_vuot1a_error (current_class, an_expression, l_feature)
				else
					l_feature := current_class.named_procedure (l_name)
					if l_feature /= Void then
							-- This object-test local has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vuot1a_error (current_class, an_expression, l_feature)
					end
				end
				if current_inline_agent /= Void then
					enclosing_inline_agents.force_last (current_inline_agent)
					nb := enclosing_inline_agents.count
					from i := 1 until i > nb loop
						l_enclosing_agent := enclosing_inline_agents.item (i)
						args := l_enclosing_agent.formal_arguments
						if args /= Void then
							j := args.index_of (l_name)
							if j /= 0 then
									-- This object-test local has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vuot1b_error (current_class, an_expression, args.formal_argument (j))
							end
						end
						l_locals := l_enclosing_agent.locals
						if l_locals /= Void then
							j := l_locals.index_of (l_name)
							if j /= 0 then
									-- This object-test local has the same name as a
									-- local variable of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vuot1c_error (current_class, an_expression, l_locals.local_variable (j))
							end
						end
						i := i + 1
					end
					enclosing_inline_agents.remove_last
				end
				args := current_feature.arguments
				if args /= Void then
					j := args.index_of (l_name)
					if j /= 0 then
							-- This object-test local has the same name as a formal
							-- argument of the enclosing feature.
						set_fatal_error
						error_handler.report_vuot1b_error (current_class, an_expression, args.formal_argument (j))
					end
				end
				l_locals := current_feature.locals
				if l_locals /= Void then
					j := l_locals.index_of (l_name)
					if j /= 0 then
							-- This object-test local has the same name as a
							-- local variable of the enclosing feature.
						set_fatal_error
						error_handler.report_vuot1c_error (current_class, an_expression, l_locals.local_variable (j))
					end
				end
				l_other_object_test := current_object_test_scope.object_test (l_name)
				if l_other_object_test /= Void then
						-- This object-test appears in the scope of another
						-- object-test local with the same name.
					set_fatal_error
					error_handler.report_vuot1d_error (current_class, an_expression, l_other_object_test)
				end
				if current_system.is_ise and then current_system.ise_version < ise_6_3_7_5660 then
						-- ISE did not support object-tests in preconditions before 6.3.7.5660.
					if current_inline_agent = Void and in_precondition then
-- TODO: check the case where we are in the precondition of an inline agent.
						set_fatal_error
						error_handler.report_vuot4a_error (current_class, an_expression)
					end
						-- ISE did not support object-tests in check instructions before 6.3.7.5660.
					if in_check_instruction then
						set_fatal_error
						error_handler.report_vuot4b_error (current_class, an_expression)
					end
				end
				if current_expression_object_tests.has_object_test (l_name) then
						-- Two object-tests with the same local name appear in the same
						-- expression. This is forbidden to avoid scope intersection,
						-- i.e. two object-tests with the same local name and whose
						-- scopes can overlap. For example:
						--
						--   if attached exp1 as x and attached exp2 as x then
						--      x.do_something
						--   end
					set_fatal_error
					l_other_object_test := current_expression_object_tests.object_test (l_name)
					l_outermost_expression := current_expression_object_tests.expression
					error_handler.report_vuot1e_error (current_class, an_expression, l_other_object_test, l_outermost_expression)
				else
					current_expression_object_tests.add_object_test (an_expression)
				end
			end
			if not has_fatal_error then
				a_context.force_last (current_universe_impl.boolean_type)
				report_named_object_test (an_expression, l_expression_context)
			else
					-- Make sure that `report_named_object_test' is called anyway
					-- in order to avoid an internal error to be reported when we
					-- try to determine the dynamic type set of the corresponding
					-- object-test local when it appears as an expression in its
					-- scope. This is so because even though we got a validity error
					-- with the object-test, we might try to check the validity of
					-- subsequent expressions/intructions contained in the scope
					-- in order to be able to report as many errors as possible.
				has_fatal_error := False
				report_named_object_test (an_expression, l_expression_context)
				has_fatal_error := True
			end
		end

	check_object_equality_expression_validity (an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_left_operand: ET_EXPRESSION
			l_right_operand: ET_EXPRESSION
			l_left_context: ET_NESTED_TYPE_CONTEXT
			l_right_context: ET_NESTED_TYPE_CONTEXT
			l_left_convert_expression: ET_CONVERT_EXPRESSION
			l_right_convert_expression: ET_CONVERT_EXPRESSION
			l_any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_expression.name.set_seed (current_system.is_equal_seed)
			l_any_type := current_system.any_type
			l_left_context := new_context (current_type)
			l_right_context := new_context (current_type)
			l_left_operand := an_expression.left
			l_right_operand := an_expression.right
			check_expression_validity (l_left_operand, l_left_context, l_any_type)
			if not has_fatal_error then
				check_expression_validity (l_right_operand, l_right_context, l_any_type)
				if not has_fatal_error then
					if current_class /= current_class_impl then
						-- Possible convertibility should be resolved in the implementation class.
					elseif l_left_context.conforms_to_context (l_right_context) then
						-- OK.
					elseif l_right_context.conforms_to_context (l_left_context) then
						-- OK.
					elseif l_left_context.same_named_type (current_system.none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					elseif l_right_context.same_named_type (current_system.none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					else
						l_right_convert_expression := convert_expression (l_right_operand, l_right_context, l_left_context)
						had_error := has_fatal_error
						l_left_convert_expression := convert_expression (l_left_operand, l_left_context, l_right_context)
						has_fatal_error := has_fatal_error or had_error
						if has_fatal_error then
							-- Nothing to be done.
						elseif l_right_convert_expression /= Void then
							if l_left_convert_expression /= Void then
-- TODO: conversion in both directions
							end
								-- Insert the conversion feature call in the AST.
							an_expression.set_right (l_right_convert_expression)
						elseif l_left_convert_expression /= Void then
								-- Insert the conversion feature call in the AST.
								-- Convertibility should be resolved in the implementation class.
							check implementation_class: current_class = current_class_impl end
							an_expression.set_left (l_left_convert_expression)
						else
								-- We consider that VWEQ is not taken into account in flat Degree 3 mode.
								-- This is not considered as a fatal error.
							error_handler.report_vweq0b_error (current_class, current_class_impl, an_expression, l_left_context.named_type, l_right_context.named_type)
						end
					end
					if not has_fatal_error then
						a_context.force_last (current_universe_impl.boolean_type)
						report_object_equality_expression (an_expression)
					end
				end
			else
					-- The left expression is not valid. Check the right expression
					-- anyway, and then restore `has_fatal_error' to True.
				check_expression_validity (l_right_operand, l_right_context, l_any_type)
				set_fatal_error
			end
			free_context (l_right_context)
			free_context (l_left_context)
		end

	check_object_test_validity (an_expression: ET_OBJECT_TEST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_had_error: BOOLEAN
			l_expression_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expression_context := new_context (current_type)
			l_type := an_expression.type
			if l_type /= Void then
				check_type_validity (l_type)
				if not has_fatal_error then
						-- Contrary to the types appearing in the signatures, types of
						-- object-test locals in the AST are those found in the implementation
						-- class of `current_feature', and hence need to be resolved in
						-- `current_type'.
					l_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
				end
				if has_fatal_error then
						-- The type is not valid. We will consider that it is of
						-- type 'ANY' when checking the validity of the expression.
					l_had_error := True
					check_expression_validity (an_expression.expression, l_expression_context, current_system.any_type)
					has_fatal_error := has_fatal_error or l_had_error
				else
					l_expression_context.force_last (l_type)
					check_expression_validity (an_expression.expression, a_context, l_expression_context)
					a_context.reset (current_type)
				end
			else
				check_expression_validity (an_expression.expression, l_expression_context, current_system.any_type)
			end
			free_context (l_expression_context)
			if not has_fatal_error then
				a_context.force_last (current_universe_impl.boolean_type)
				report_object_test (an_expression)
			end
		end

	check_object_test_local_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of object-test local `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_object_test_local: a_name.is_object_test_local
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_object_tests: ET_OBJECT_TEST_LIST
			l_object_test: ET_NAMED_OBJECT_TEST
		do
			has_fatal_error := False
			l_seed := a_name.seed
			if l_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					l_object_test := current_object_test_scope.object_test (a_name)
					if l_object_test = Void then
							-- Error: `a_name' is an object-test local that is used outside of its scope.
						set_fatal_error
						if current_feature_impl.is_feature then
							error_handler.report_veen8a_error (current_class, a_name, current_feature_impl.as_feature)
						else
							error_handler.report_veen8b_error (current_class, a_name)
						end
					else
						l_seed := l_object_test.name.seed
						a_name.set_seed (l_seed)
						current_object_test_types.search (l_object_test)
						if not current_object_test_types.found then
								-- Internal error: the type of the object-test local should
								-- have been determined when processing the object-test itself.
								-- And this should have already been done this we are in the
								-- scope of that object-test.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							a_context.copy_type_context (current_object_test_types.found_item)
							report_object_test_local (a_name, l_object_test)
						end
					end
				end
			else
				l_object_tests := current_closure_impl.object_tests
				if l_object_tests = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_object_tests.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_object_test := l_object_tests.object_test (l_seed)
					current_object_test_types.search (l_object_test)
					if not current_object_test_types.found then
							-- Internal error: the type of the object-test local should
							-- have been determined when processing the object-test itself.
							-- And this should have already been done this we are in the
							-- scope of that object-test.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						a_context.copy_type_context (current_object_test_types.found_item)
						report_object_test_local (a_name, l_object_test)
					end
				end
			end
		end

	check_octal_integer_constant_validity (a_constant: ET_OCTAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_integer_constant_validity (a_constant, a_context)
		end

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: ET_EXPRESSION
		do
				-- Check VAOL-2 (ETL2 p.124).
			l_expression := an_expression.expression
			check_expression_validity (l_expression, a_context, current_target_type)
			an_expression.set_index (l_expression.index)
			if not in_postcondition then
					-- Check VAOL-1 (ETL2 p.124).
				set_fatal_error
				if current_class_impl = current_class then
					error_handler.report_vaol1a_error (current_class, an_expression)
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VAOL-1 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			end
		end

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_string: ET_MANIFEST_STRING
		do
			l_string := an_expression.manifest_string
			check_expression_validity (l_string, a_context, current_target_type)
			an_expression.set_index (l_string.index)
		end

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: ET_EXPRESSION
		do
			l_expression := an_expression.expression
			check_expression_validity (l_expression, a_context, current_target_type)
			an_expression.set_index (l_expression.index)
		end

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_query: ET_QUERY
			l_parent_type, l_ancestor: ET_BASE_TYPE
			l_class: ET_CLASS
			l_actuals: ET_ACTUAL_ARGUMENT_LIST
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_function_impl: ET_FUNCTION
			l_feature_impl: ET_FEATURE
			l_type: ET_TYPE
		do
			l_feature_impl ?= current_feature_impl
			if l_feature_impl = Void then
					-- The Precursor expression does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1b_error (current_class, an_expression)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			elseif in_assertion then
					-- The Precursor expression does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1b_error (current_class, an_expression)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			elseif current_inline_agent /= Void then
					-- The associated feature of inline agents cannot be redefined.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr3e_error (current_class, an_expression, current_inline_agent, l_feature_impl)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-3 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
			else
				l_function_impl ?= l_feature_impl
				if l_function_impl = Void then
-- TODO: `current_feature' should be a function.
				else
					has_fatal_error := False
						-- This is an unqualified call, so there is a good chance that we
						-- will need the type of current to figure out which feature to call.
					report_current_type_needed
					if current_feature.first_precursor = Void then
							-- Immediate features cannot have Precursor.
						set_fatal_error
						if current_class_impl /= current_class then
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: Precursor should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
							error_handler.report_vdpr3d_error (current_class, an_expression, l_function_impl)
						end
					else
							-- Make sure that the precursor `an_expression' has been resolved.
-- TODO: I think that 'feature_flattener' has already been executed on `current_class'
-- at this stage, and hence on the ancestor class `current_class_impl'. Therefore there is
-- no need to check it again here.
						current_class_impl.process (current_system.feature_flattener)
						if not current_class_impl.features_flattened or else current_class_impl.has_flattening_error then
							set_fatal_error
						else
							l_parent_type := an_expression.parent_type
							if l_parent_type = Void then
									-- Internal error: the Precursor construct should
									-- already have been resolved when flattening the
									-- features of `current_class_impl'.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								l_precursor_keyword := an_expression.precursor_keyword
								l_class := l_parent_type.base_class
								l_query := l_class.seeded_query (l_precursor_keyword.seed)
								if l_query = Void then
										-- Internal error: the Precursor construct should
										-- already have been resolved when flattening the
										-- features of `current_class_impl'.
									set_fatal_error
									error_handler.report_giaaa_error
								else
									l_actual_context := new_context (current_type)
									l_actual_context.force_last (l_parent_type)
									if current_class /= current_class_impl and l_parent_type.is_generic then
										-- Resolve generic parameters in the
										-- context of `current_type'.
-- TODO: I think that 'ancestor_builder' has already been executed on `current_class'
-- at this stage, and therefore there is no need to check it again here.
										current_class.process (current_system.ancestor_builder)
										if not current_class.ancestors_built or else current_class.has_ancestors_error then
											set_fatal_error
										else
											l_ancestor := current_class.ancestor (l_parent_type)
											if l_ancestor = Void then
													-- Internal error: `l_parent_type' is an ancestor
													-- of `current_class_impl', and hence of `current_class'.
												set_fatal_error
												error_handler.report_giaaa_error
											else
												l_parent_type := l_ancestor
												l_actual_context.wipe_out
												l_actual_context.force_last (l_parent_type)
											end
										end
									end
									if not has_fatal_error then
										l_actuals := an_expression.arguments
										check_actual_arguments_validity (l_actuals, l_actual_context, l_precursor_keyword, l_query, l_class)
										if not has_fatal_error then
-- TODO: like argument.
											l_type := resolved_formal_parameters (l_query.type, l_class, current_type)
											if not has_fatal_error then
												a_context.force_last (l_type)
												report_precursor_expression (an_expression, l_parent_type, l_query)
												if precursor_queries /= Void then
													precursor_queries.force_last (l_query)
												end
											end
										end
									end
									free_context (l_actual_context)
								end
							end
						end
					end
				end
			end
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
-- TODO: Under .NET, it is possible to have static prefix functions with one argument.
-- In that case the target of the prefix call is passed as argument of this function.
			check_qualified_call_expression_validity (an_expression, a_context)
		end

	check_qualified_call_expression_validity (a_call: ET_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			qualified_call: a_call.is_qualified_call
			a_context_not_void: a_context /= Void
		local
			l_target: ET_EXPRESSION
			l_name: ET_CALL_NAME
			l_label: ET_IDENTIFIER
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_type: ET_TYPE
			l_seed: INTEGER
			l_like: ET_LIKE_FEATURE
			any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
			l_actual: ET_EXPRESSION
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			nb_args: INTEGER
			l_prefix_expression: ET_PREFIX_EXPRESSION
			l_infix_expression: ET_INFIX_EXPRESSION
		do
			has_fatal_error := False
			l_target := a_call.target
			if l_target.is_current then
					-- If the target is the current object there is a good chance that
					-- we will need its type to figure out which feature to call.
				report_current_type_needed
			end
			l_name := a_call.name
			l_actuals := a_call.arguments
			any_type := current_system.any_type
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					check_expression_validity (l_target, a_context, any_type)
					if not has_fatal_error then
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							if l_class.is_dotnet then
								l_class.add_overloaded_queries (l_name, overloaded_queries)
								nb := overloaded_queries.count
								if nb = 0 then
									-- The error is reported later.
								elseif nb = 1 then
									l_query := overloaded_queries.first
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
										-- More than one query with that name.
										-- Start to remove those with the wrong number of arguments.
									nb_args := a_call.arguments_count
									from i := nb until i < 1 loop
										if overloaded_queries.item (i).arguments_count /= nb_args then
											overloaded_queries.remove (i)
										end
										i := i - 1
									end
									nb := overloaded_queries.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_query := overloaded_queries.first
										l_seed := l_query.first_seed
										l_name.set_seed (l_seed)
									elseif nb_args = 0 then
											-- Ambiguity in overloaded queries.
-- TODO: report VIOF
									else
										keep_best_overloaded_features (overloaded_queries, l_actuals, a_context)
										if not has_fatal_error then
											nb := overloaded_queries.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_query := overloaded_queries.first
												l_seed := l_query.first_seed
												l_name.set_seed (l_seed)
											else
													-- Ambiguity in overloaded queries.
-- TODO: report VIOF
											end
										end
									end
								end
								overloaded_queries.wipe_out
							end
							if l_query = Void and not has_fatal_error then
								l_query := l_class.named_query (l_name)
								if l_query /= Void then
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
									if l_class.is_tuple_class then
											-- Check whether this is a tuple label.
										l_label ?= l_name
										if l_label /= Void then
											l_seed := a_context.base_type_index_of_label (l_label)
											if l_seed /= 0 then
												l_label.set_tuple_label (True)
												l_label.set_seed (l_seed)
											end
										end
									end
									if l_seed = 0 then
										l_procedure := l_class.named_procedure (l_name)
										if l_procedure /= Void then
												-- In a call expression, the feature has to be a query.
											set_fatal_error
											error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
										else
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VUEX-2 (ETL2 p.368).
											error_handler.report_vuex2a_error (current_class, l_name, l_class)
										end
									end
								end
							end
							if not has_fatal_error then
								if l_class.is_boolean_class then
										-- This is useful to know which unary and binary expressions
										-- are boolean operators between boolean expressions
										-- when trying to determine the scope of object-test locals.
									l_prefix_expression ?= a_call
									if l_prefix_expression /= Void then
										l_prefix_expression.set_boolean_operator (True)
									else
										l_infix_expression ?= a_call
										if l_infix_expression /= Void then
											l_infix_expression.set_boolean_operator (True)
										end
									end
								end
							end
						end
					end
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_name.is_tuple_label then
				if l_label = Void then
						-- We didn't find the label yet. This is because the seed
						-- was already computed in a proper ancestor (or in
						-- another generic derivation) of `current_class' where
						-- this expression was written.
					check_expression_validity (l_target, a_context, any_type)
					if not has_fatal_error then
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						elseif not l_class.is_tuple_class then
								-- Report internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
				if l_actuals /= Void and then not l_actuals.is_empty then
						-- A call to a Tuple label cannot have arguments.
					set_fatal_error
					if current_class = current_class_impl then
						error_handler.report_vuar1c_error (current_class, l_name)
					elseif not has_implementation_error (current_feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature_impl'.
						error_handler.report_giaaa_error
					end
				elseif l_seed > a_context.base_type_actual_count then
						-- Report internal error: the index of the labeled
						-- actual parameter cannot be out of bound because
						-- for a Tuple type to conform to another Tuple type
						-- it needs to have more actual parameters.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_type := tokens.formal_parameter (l_seed)
					report_tuple_label_expression (a_call, a_context)
					a_context.force_last (l_type)
				end
			else
				if l_query = Void then
						-- We didn't find the query yet. This is because the seed
						-- was already computed in a proper ancestor (or in
						-- another generic derivation) of `current_class' where
						-- this expression was written.
					check_expression_validity (l_target, a_context, any_type)
					if not has_fatal_error then
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							l_query := l_class.seeded_query (l_seed)
							if l_query = Void then
									-- Internal error: if we got a seed, `l_query' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					end
				end
				if l_query /= Void then
					check l_class_not_void: l_class /= Void end
					if not l_query.is_exported_to (current_class) then
							-- The feature is not exported to `current_class'.
						set_fatal_error
						error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_query, l_class)
					end
					had_error := has_fatal_error
					check_qualified_vape_validity (l_name, l_query, l_class)
					if has_fatal_error then
						had_error := True
					end
					check_actual_arguments_validity (l_actuals, a_context, l_name, l_query, l_class)
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						l_type := l_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
						l_like ?= l_type
						if l_like /= Void and then l_like.is_like_argument then
							if l_actuals /= Void and then l_actuals.count = 1 then
								l_formal_context := new_context (current_type)
								l_formal_context.copy_type_context (a_context)
								l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
								a_context.wipe_out
								l_actual := l_actuals.actual_argument (1)
								check_expression_validity (l_actual, a_context, l_formal_context)
								if not has_fatal_error then
									l_convert_expression ?= l_actual
									if l_convert_expression /= Void then
										l_builtin ?= l_convert_expression.convert_feature
										if l_builtin /= Void then
												-- Needed for compatibility with ISE 5.6.0610:
												-- a formal generic parameter either conforms or converts to its constraint,
												-- then the converted version can still be chained with a conformance to
												-- `current_target_type'.
											a_context.reset (current_type)
											a_context.force_last (l_builtin.type)
										end
									end
									l_formal_context.remove_last
									report_qualified_call_expression (a_call, l_formal_context, l_query)
								end
								free_context (l_formal_context)
							else
								report_qualified_call_expression (a_call, a_context, l_query)
								a_context.force_last (l_type)
							end
						else
							report_qualified_call_expression (a_call, a_context, l_query)
							a_context.force_last (l_type)
						end
					end
				end
			end
		end

	check_real_constant_validity (a_constant: ET_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
			l_cast_type: ET_TARGET_TYPE
			l_explicit_type: ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.like_current
			l_expected_type_context := current_target_type
			l_cast_type := a_constant.cast_type
			if l_cast_type /= Void then
					-- Make sure that `l_cast_type' is a valid type.
					-- For example 'REAL_32 [STRING]' is not valid.
				l_explicit_type := l_cast_type.type
				check_type_validity (l_explicit_type)
				if has_fatal_error then
					-- Do nothing.
				elseif not l_explicit_type.is_named_type then
						-- Error: invalid cast type, it should be a sized variant of "REAL".
					set_fatal_error
					error_handler.report_vwmq0b_error (current_class, current_class_impl, a_constant)
				else
					l_expected_type := l_explicit_type
					l_expected_type_context := current_class_impl
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif current_universe_impl.real_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "REAL_32".
				l_type := current_universe_impl.real_32_type
				report_real_32_constant (a_constant, l_type)
			elseif current_universe_impl.real_64_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
-- TODO: check that the value is representable as a "REAL_64".
				l_type := current_universe_impl.real_64_type
				report_real_64_constant (a_constant, l_type)
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "REAL".
				set_fatal_error
				error_handler.report_vwmq0b_error (current_class, current_class_impl, a_constant)
			else
-- TODO: according to ECMA it should be of type REAL, but ISE
-- treats it as being REAL_64.
				l_type := current_universe_impl.real_64_type
				report_real_64_constant (a_constant, l_type)
			end
			if l_type /= Void then
				a_constant.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_integer_constant_validity (a_constant, a_context)
		end

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			check_manifest_string_validity (a_string, a_context)
		end

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_real_constant_validity (a_constant, a_context)
		end

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition then
					-- The entity Result appears in a precondition.
				set_fatal_error
				if current_class_impl = current_class then
					if current_inline_agent /= Void then
						error_handler.report_veen2f_error (current_class, an_expression, current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_veen2b_error (current_class, an_expression, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have preconditions.
						error_handler.report_giaaa_error
					end
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			elseif current_inline_agent = Void and in_invariant then
					-- The entity Result appears in an invariant.
				set_fatal_error
				if current_class_impl = current_class then
					error_handler.report_veen2d_error (current_class, an_expression)
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			else
				if current_inline_agent /= Void then
					l_type := current_inline_agent.type
					l_class_impl := current_class_impl
				else
						-- Use type of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f: ANY is
						--           deferred
						--           ensure
						--              post: g (Result)
						--           end
						--      g (a: ANY): BOOLEAN is deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f: STRING is do ... end
						--        g (a: STRING): BOOLEAN is do ... end
						--    end
						-- 'Result' in the inherited postcondition "post" should be considered
						-- of type STRING (and not ANY) is class B.
						--
						-- Use type of implementation feature because the types of the signature
						-- of `current_feature' might not have been resolved for `current_class'
						-- (when processing precursors in the context of current class).
					l_type := current_feature.implementation_feature.type
					l_class_impl := current_feature.implementation_class
				end
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if current_inline_agent /= Void then
							error_handler.report_veen2g_error (current_class, an_expression, current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_veen2a_error (current_class, an_expression, current_feature_impl.as_feature)
						else
								-- Internal error: invariants have already been handled.
							error_handler.report_giaaa_error
						end
					else
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giaaa_error
						end
					end
				else
					l_type := resolved_formal_parameters (l_type, l_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_type)
						report_result (an_expression)
					end
				end
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_resolved_type: ET_TYPE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_class_impl: ET_CLASS
		do
			has_fatal_error := False
			if in_precondition then
					-- The entity Result appears in a precondition.
				set_fatal_error
				if current_class_impl = current_class then
					if current_inline_agent /= Void then
						error_handler.report_veen2f_error (current_class, an_expression.result_keyword, current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_veen2b_error (current_class, an_expression.result_keyword, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have preconditions.
						error_handler.report_giaaa_error
					end
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			elseif current_inline_agent = Void and in_invariant then
					-- The entity Result appears in an invariant.
				set_fatal_error
				if current_class_impl = current_class then
					error_handler.report_veen2d_error (current_class, an_expression.result_keyword)
				else
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: the VEEN-2 error should have been
							-- reported in the implementation feature.
						error_handler.report_giaaa_error
					end
				end
			else
				if current_inline_agent /= Void then
					l_type := current_inline_agent.type
					l_class_impl := current_class_impl
				else
						-- Use type of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f: ANY is
						--           deferred
						--           ensure
						--              post: g ($Result)
						--           end
						--      g (a: TYPED_POINTER [ANY]): BOOLEAN is deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f: STRING is do ... end
						--        g (a: TYPED_POINTER [STRING]): BOOLEAN is do ... end
						--    end
						-- 'Result' in the inherited postcondition "post" should be considered
						-- of type STRING (and not ANY) is class B.
						--
						-- Use type of implementation feature because the types of the signature
						-- of `current_feature' might not have been resolved for `current_class'
						-- (when processing precursors in the context of current class).
					l_type := current_feature.implementation_feature.type
					l_class_impl := current_feature.implementation_class
				end
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if current_inline_agent /= Void then
							error_handler.report_veen2f_error (current_class, an_expression.result_keyword, current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_veen2a_error (current_class, an_expression.result_keyword, current_feature_impl.as_feature)
						else
								-- Internal error: the case of invariants has already been handled.
							error_handler.report_giaaa_error
						end
					else
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giaaa_error
						end
					end
				else
					l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
					if l_typed_pointer_class.actual_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation: the type of '$Result' is 'TYPED_POINTER [<type-of-result>]'.
						l_resolved_type := resolved_formal_parameters (l_type, l_class_impl, current_type)
						if not has_fatal_error then
							create l_actuals.make_with_capacity (1)
							l_actuals.put_first (l_resolved_type)
							create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
							report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
							a_context.force_last (l_typed_pointer_type)
							if not l_type.is_base_type then
									-- The type of Result contains formal generic parameters
									-- or anchored types whose resolved value may vary in various
									-- descendant classes/types.
								report_current_type_needed
							end
						end
					else
							-- Use the ETL2 implementation: the type of '$argument' is POINTER.
						l_pointer_type := current_universe_impl.pointer_type
						a_context.force_last (l_pointer_type)
						report_pointer_expression (an_expression, l_pointer_type)
					end
				end
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			check_manifest_string_validity (a_string, a_context)
		end

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_type: ET_TYPE
			l_result_type: ET_TYPE
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			had_error: BOOLEAN
			i, nb: INTEGER
			nb_args: INTEGER
			l_dotnet_query: ET_DOTNET_QUERY
			l_actuals: ET_ACTUAL_ARGUMENTS
		do
			has_fatal_error := False
			l_type := an_expression.type
			check_type_validity (l_type)
			if not has_fatal_error then
				if not l_type.is_base_type then
						-- The type used to figure out which feature to call contains formal
						-- generic parameters or anchored types whose resolved value may vary
						-- in various descendant classes/types.
					report_current_type_needed
				end
				l_name := an_expression.name
				l_actuals := an_expression.arguments
				l_seed := l_name.seed
				if l_seed = 0 then
						-- We need to resolve `l_name' in the implementation
						-- class of `current_feature_impl' first.
					if current_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: `l_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giaaa_error
						end
					else
						a_context.force_last (l_type)
						l_class := a_context.base_class
						l_class.process (current_system.interface_checker)
						if not l_class.interface_checked or else l_class.has_interface_error then
							set_fatal_error
						else
							if l_class.is_dotnet then
								l_class.add_overloaded_queries (l_name, overloaded_queries)
								nb := overloaded_queries.count
								if nb = 0 then
									-- The error is reported later.
								elseif nb = 1 then
									l_query := overloaded_queries.first
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
										-- More than one query with that name.
										-- Start to remove those with the wrong number of arguments
										-- or which are not declared as static.
									nb_args := an_expression.arguments_count
									from i := nb until i < 1 loop
										l_dotnet_query ?= overloaded_queries.item (i)
										if l_dotnet_query = Void or else not l_dotnet_query.is_static or else l_dotnet_query.arguments_count /= nb_args then
											overloaded_queries.remove (i)
										end
										i := i - 1
									end
									nb := overloaded_queries.count
									if nb = 0 then
										-- The error is reported later.
									elseif nb = 1 then
										l_query := overloaded_queries.first
										l_seed := l_query.first_seed
										l_name.set_seed (l_seed)
									elseif nb_args = 0 then
											-- Ambiguity in overloaded queries.
-- TODO: report VIOF
									else
										keep_best_overloaded_features (overloaded_queries, l_actuals, a_context)
										if not has_fatal_error then
											nb := overloaded_queries.count
											if nb = 0 then
												-- The error is reported later.
											elseif nb = 1 then
												l_query := overloaded_queries.first
												l_seed := l_query.first_seed
												l_name.set_seed (l_seed)
											else
													-- Ambiguity in overloaded queries.
-- TODO: report VIOF
											end
										end
									end
								end
								overloaded_queries.wipe_out
							end
							if l_query = Void and not has_fatal_error then
								l_query := l_class.named_query (l_name)
								if l_query /= Void then
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
								else
									l_procedure := l_class.named_procedure (l_name)
									if l_procedure /= Void then
											-- In a call expression, ther feature has to be a query.
										set_fatal_error
										error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
									else
										set_fatal_error
											-- ISE Eiffel 5.4 reports this error as a VEEN,
											-- but it is in fact a VUEX-2 (ETL2 p.368).
										error_handler.report_vuex2a_error (current_class, l_name, l_class)
									end
								end
							end
						end
					end
				end
				if not has_fatal_error then
					if l_query = Void then
							-- We didn't find the query yet. This is because the seed
							-- was already computed in a proper ancestor (or in
							-- another generic derivation) of `current_class' where
							-- this expression was written.
						l_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
						if not has_fatal_error then
							a_context.force_last (l_type)
							l_class := a_context.base_class
							l_class.process (current_system.interface_checker)
							if not l_class.interface_checked or else l_class.has_interface_error then
								set_fatal_error
							else
								l_query := l_class.seeded_query (l_seed)
								if l_query = Void then
										-- Internal error: if we got a seed, `l_query' should not be void.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							end
						end
					end
					if l_query /= Void then
						report_static_supplier (l_type, current_class, current_feature)
						check l_class_not_void: l_class /= Void end
						if not l_query.is_exported_to (current_class) then
								-- The feature is not exported to `current_class'.
							set_fatal_error
							error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, l_query, l_class)
						end
						had_error := has_fatal_error
						check_qualified_vape_validity (l_name, l_query, l_class)
						if has_fatal_error then
							had_error := True
						end
						check_actual_arguments_validity (an_expression.arguments, a_context, l_name, l_query, l_class)
						if had_error then
							set_fatal_error
						end
						if not has_fatal_error then
-- TODO: check that `l_query' is a constant attribute or an external function.
-- TODO: like argument.
							l_result_type := l_query.type
							a_context.force_last (l_result_type)
							report_static_call_expression (an_expression, l_type, l_query)
						end
					end
				end
			end
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_name, other_name: ET_FEATURE_NAME
			l_seed: INTEGER
			i, j, nb: INTEGER
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			had_error: BOOLEAN
			already_checked: BOOLEAN
		do
			has_fatal_error := False
			nb := an_expression.count
			from i := 1 until i > nb loop
				l_name := an_expression.feature_name (i)
				l_seed := l_name.seed
				had_error := False
				already_checked := False
				if l_seed = 0 then
					had_error := True
						-- We need to resolve `l_name' in the implementation
						-- class of `current_feature_impl' first.
					if current_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: `l_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giaaa_error
						end
					else
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
						current_class.process (current_system.interface_checker)
						if not current_class.interface_checked or else current_class.has_interface_error then
							set_fatal_error
						else
							l_query := current_class.named_query (l_name)
							if l_query /= Void then
								if not l_query.is_attribute then
									set_fatal_error
									error_handler.report_vwst1b_error (current_class, l_name, l_query)
								else
									l_seed := l_query.first_seed
									l_name.set_seed (l_seed)
									had_error := False
									already_checked := True
								end
							else
								l_procedure := current_class.named_procedure (l_name)
								if l_procedure /= Void then
									set_fatal_error
									error_handler.report_vwst1b_error (current_class, l_name, l_procedure)
								else
									set_fatal_error
									error_handler.report_vwst1a_error (current_class, l_name)
								end
							end
						end
						from j := 1 until j >= i loop
							other_name := an_expression.feature_name (j)
							if l_name.same_feature_name (other_name) then
								had_error := True
								set_fatal_error
								error_handler.report_vwst2a_error (current_class, other_name, l_name)
							end
							j := j + 1
						end
					end
				end
				if not had_error and not already_checked then
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_query := current_class.seeded_query (l_seed)
						if l_query = Void then
								-- Internal error: if we got a seed, `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							if not l_query.is_attribute then
								set_fatal_error
								if current_class = current_class_impl then
									error_handler.report_vwst1b_error (current_class, l_name, l_query)
								elseif not has_implementation_error (current_feature_impl) then
										-- Internal error: this error should have been reported when
										-- processing the implementation of `current_feature_impl' or in
										-- the feature flattener when redeclaring attribute `l_query'
										-- to a non-attribute in an ancestor of `current_class'.
									error_handler.report_giaaa_error
								end
							end
						end
					end
				end
				i := i + 1
			end
			if not has_fatal_error then
				report_strip_expression (an_expression, current_system.array_any_type, a_context)
				a_context.force_last (current_system.array_any_type)
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			l_type := current_universe_impl.boolean_type
			a_context.force_last (l_type)
			report_boolean_constant (a_constant, l_type)
		end

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_integer_constant_validity (a_constant, a_context)
		end

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			check_real_constant_validity (a_constant, a_context)
		end

	check_unqualified_call_expression_validity (a_call: ET_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_type: ET_TYPE
			l_seed: INTEGER
			l_identifier: ET_IDENTIFIER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_like: ET_LIKE_FEATURE
			had_error: BOOLEAN
			l_actual: ET_EXPRESSION
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
				-- This is an unqualified call, so there is a good chance that we
				-- will need the type of current to figure out which feature to call.
			report_current_type_needed
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_seed := l_name.seed
			if l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_query := current_class.named_query (l_name)
						if l_query /= Void then
							l_seed := l_query.first_seed
							l_name.set_seed (l_seed)
						else
							l_procedure := current_class.named_procedure (l_name)
							if l_procedure /= Void then
									-- In a call expression, the feature has to be a query.
								set_fatal_error
								error_handler.report_vkcn2c_error (current_class, l_name, l_procedure)
							else
									-- Check whether it is a formal argument or a local variable.
								l_identifier ?= l_name
								if l_identifier /= Void then
									l_arguments := current_closure_impl.arguments
									if l_arguments /= Void then
										l_seed := l_arguments.index_of (l_identifier)
										if l_seed /= 0 then
												-- `l_name' is a fomal argument.
											if l_actuals /= Void then
													-- Syntax error: a formal argument cannot have arguments.
												set_fatal_error
												if current_inline_agent /= Void then
													error_handler.report_gvuaa0b_error (current_class, l_identifier, current_inline_agent)
												elseif current_feature_impl.is_feature then
													error_handler.report_gvuaa0a_error (current_class, l_identifier, current_feature_impl.as_feature)
												else
														-- Internal error: invariants don't have arguments.
													error_handler.report_giaaa_error
												end
											end
												-- Do not set the seed of `l_identifier' so that we report
												-- this error again when checked in a descendant class.
											l_identifier.set_argument (True)
											if not has_fatal_error then
													-- Make sure that we report the correct error when
													-- it appears in an invariant.
												l_identifier.set_seed (l_seed)
												check_expression_validity (l_identifier, a_context, current_system.any_type)
												l_identifier.set_seed (0)
											end
											if not has_fatal_error then
													-- Internal error: the parser should not have
													-- generated a feature call.
												set_fatal_error
												error_handler.report_giaaa_error
											end
										end
									end
									if l_seed = 0 then
										l_locals := current_closure_impl.locals
										if l_locals /= Void then
											l_seed := l_locals.index_of (l_identifier)
											if l_seed /= 0 then
													-- `l_name' is a local variable.
												if l_actuals /= Void then
														-- Syntax error: a local variable cannot have arguments.
													set_fatal_error
													if current_inline_agent /= Void then
														error_handler.report_gvual0b_error (current_class, l_identifier, current_inline_agent)
													elseif current_feature_impl.is_feature then
														error_handler.report_gvual0a_error (current_class, l_identifier, current_feature_impl.as_feature)
													else
															-- Internal error: invariants don't have local variables.
														error_handler.report_giaaa_error
													end
												end
													-- Do not set the seed of `l_identifier' so that we report
													-- this error again when checked in a descendant class.
												l_identifier.set_local (True)
												if not has_fatal_error then
														-- Make sure that we report the correct error when
														-- it appears in a precondition or invariant.
													l_identifier.set_seed (l_seed)
													check_expression_validity (l_identifier, a_context, current_system.any_type)
													l_identifier.set_seed (0)
												end
												if not has_fatal_error then
														-- Internal error: the parser should not have
														-- generated a feature call.
													set_fatal_error
													error_handler.report_giaaa_error
												end
											end
										end
									end
								end
								if l_seed = 0 then
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VUEX-1 (ETL2 p.368).
									error_handler.report_vuex1a_error (current_class, l_name)
								end
							end
						end
					end
				end
			end
			if not has_fatal_error then
				if l_query = Void then
						-- We didn't find the query yet. This is because the seed
						-- was already computed in a proper ancestor (or in
						-- another generic derivation) of `current_class' where
						-- this expression was written.
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_query := current_class.seeded_query (l_seed)
						if l_query = Void then
								-- Report internal error: if we got a seed, the
								-- `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
				end
				if l_query /= Void then
					check_unqualified_vape_validity (l_name, l_query)
					had_error := has_fatal_error
					check_actual_arguments_validity (l_actuals, a_context, l_name, l_query, Void)
					if has_fatal_error then
						had_error := True
					end
					if had_error then
						set_fatal_error
					end
					if not has_fatal_error then
						l_type := l_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
						l_like ?= l_type
						if l_like /= Void and then l_like.is_like_argument then
							if l_actuals /= Void and then l_actuals.count = 1 then
								l_formal_context := new_context (current_type)
								l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
								a_context.wipe_out
								l_actual := l_actuals.actual_argument (1)
								check_expression_validity (l_actual, a_context, l_formal_context)
								free_context (l_formal_context)
								if not has_fatal_error then
									l_convert_expression ?= l_actual
									if l_convert_expression /= Void then
										l_builtin ?= l_convert_expression.convert_feature
										if l_builtin /= Void then
												-- Needed for compatibility with ISE 5.6.0610:
												-- a formal generic parameter either conforms or converts to its constraint,
												-- then the converted version can still be chained with a conformance to
												-- `current_target_type'.
											a_context.reset (current_type)
											a_context.force_last (l_builtin.type)
										end
									end
									report_unqualified_call_expression (a_call, l_query)
								end
							else
								report_unqualified_call_expression (a_call, l_query)
								a_context.force_last (l_type)
							end
						else
							report_unqualified_call_expression (a_call, l_query)
							a_context.force_last (l_type)
						end
					end
				end
			end
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_string'.
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			check_manifest_string_validity (a_string, a_context)
		end

	check_void_validity (an_expression: ET_VOID; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (current_system.none_type)
			report_void_constant (an_expression)
		end

	check_writable_validity (a_writable: ET_WRITABLE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `a_writable' in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `a_writable' is appended to `a_context'.
		require
			a_writable_not_void: a_writable /= Void
			a_context_not_void: a_context /= Void
		local
			l_result: ET_RESULT
			l_identifier: ET_IDENTIFIER
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local: ET_LOCAL_VARIABLE
			l_seed: INTEGER
			l_attribute: ET_QUERY
			l_procedure: ET_PROCEDURE
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
		do
			has_fatal_error := False
			l_result ?= a_writable
			if l_result /= Void then
					-- Use type of implementation feature because the types of the signature
					-- of `current_feature' might not have been resolved for `current_class'
					-- (when processing precursors in the context of current class).
				l_type := current_closure_impl.type
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if current_inline_agent /= Void then
							error_handler.report_veen2g_error (current_class, l_result, current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_veen2a_error (current_class, l_result, current_feature_impl.as_feature)
						else
								-- Internal error: invariants don't have writables.
							error_handler.report_giaaa_error
						end
					else
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: the VEEN-2 error should have been
								-- reported in the implementation feature.
							error_handler.report_giaaa_error
						end
					end
				else
					l_type := resolved_formal_parameters (l_type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (l_type)
						report_result_assignment_target (l_result)
					end
				end
			else
				l_identifier ?= a_writable
				if l_identifier /= Void then
					l_seed := l_identifier.seed
					if l_identifier.is_local then
						l_locals := current_closure_impl.locals
						if l_locals = Void then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif l_seed < 1 or l_seed > l_locals.count then
								-- Internal error.
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Contrary to the types appearing in the signatures, types of
								-- local variables in the AST are those found in the implementation
								-- class of `current_feature_impl', and hence need to be resolved in
								-- `current_type'.
							l_local := l_locals.local_variable (l_seed)
							l_type := resolved_formal_parameters (l_local.type, current_class_impl, current_type)
							if not has_fatal_error then
								a_context.force_last (l_type)
								report_local_assignment_target (l_identifier, l_local)
							end
						end
					elseif l_seed /= 0 then
						l_attribute := current_class.seeded_query (l_seed)
						if l_attribute = Void then
								-- Internal error: if we got a seed, the
								-- `l_attribute' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						elseif not l_attribute.is_attribute then
							set_fatal_error
							if current_class = current_class_impl then
								error_handler.report_vjaw0a_error (current_class, l_identifier, l_attribute)
							elseif not has_implementation_error (current_feature_impl) then
									-- Internal error: this error should have been reported when
									-- processing the implementation `current_feature_impl' or in the
									-- feature flattener when redeclaring attribute `l_attribute'
									-- to a non-attribute in an ancestor of `current_class'.
								error_handler.report_giaaa_error
							end
						else
							l_type := l_attribute.type
							a_context.force_last (l_type)
							report_current_type_needed
							report_attribute_assignment_target (a_writable, l_attribute)
						end
					else
							-- We need to resolve `l_identifier' in the implementation
							-- class of `current_feature_impl' first.
						if current_class_impl /= current_class then
							set_fatal_error
							if not has_implementation_error (current_feature_impl) then
									-- Internal error: `l_identifier' should have been resolved in
									-- the implementation feature.
								error_handler.report_giaaa_error
							end
						else
-- TODO: I don't think we need to check the interface of `current_class' again.
-- I guess that's already done in `check_feature_validity'.
							current_class.process (current_system.interface_checker)
							if not current_class.interface_checked or else current_class.has_interface_error then
								set_fatal_error
							else
								l_attribute := current_class.named_query (l_identifier)
								if l_attribute /= Void then
									if l_attribute.is_attribute then
										l_seed := l_attribute.first_seed
										l_identifier.set_seed (l_seed)
										l_type := l_attribute.type
										a_context.force_last (l_type)
										report_current_type_needed
										report_attribute_assignment_target (a_writable, l_attribute)
									else
											-- There is a feature with that name, but it
											-- it is not an attribute.
										set_fatal_error
										error_handler.report_vjaw0a_error (current_class, l_identifier, l_attribute)
									end
								else
									l_procedure := current_class.named_procedure (l_identifier)
									if l_procedure /= Void then
											-- There is a feature with that name, but it
											-- it is not an attribute.
										set_fatal_error
										error_handler.report_vjaw0a_error (current_class, l_identifier, l_procedure)
									else
											-- There is no feature with that name.
											-- Check whether this is an argument in order
											-- to give a better error message.
										set_fatal_error
										l_arguments := current_closure_impl.arguments
										if l_arguments /= Void and then l_arguments.index_of (l_identifier) /= 0 then
											if current_inline_agent /= Void then
												error_handler.report_vjaw0c_error (current_class, l_identifier, current_inline_agent)
											elseif current_feature_impl.is_feature then
												error_handler.report_vjaw0b_error (current_class, l_identifier, current_feature_impl.as_feature)
											else
												-- Internal error: invariants don't have writables.
												error_handler.report_giaaa_error
											end
										else
											if current_inline_agent /= Void then
												error_handler.report_veen0b_error (current_class, l_identifier, current_inline_agent)
											elseif current_feature_impl.is_feature then
												error_handler.report_veen0a_error (current_class, l_identifier, current_feature_impl.as_feature)
											else
													-- Internal error: invariants don't have writables.
												error_handler.report_giaaa_error
											end
										end
									end
								end
							end
						end
					end
				else
						-- Internal error: a Writable is either a result or an identifier.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
			if not has_fatal_error then
				report_expression_supplier (a_context, current_class, current_feature)
			end
		ensure
			type_appended_to_context: not has_fatal_error implies (a_context.count = old (a_context.count) + 1)
		end

	check_qualified_vape_validity (a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check VAPE validity rule when there is a qualified call to `a_feature'
			-- named `a_name' in a precondition of `current_feature' in `current_class'.
			-- `a_class' is the base class of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature `f' should be exported to every class to which `f' is exported.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			l_feature_clients: ET_CLIENT_LIST
			l_clients: ET_CLIENT_LIST
			l_client: ET_CLIENT
			l_client_class: ET_CLASS
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_feature_clients := a_feature.clients
				l_clients := current_feature.clients
				nb := l_clients.count
				from i := 1 until i > nb loop
					l_client := l_clients.client (i)
					l_client_class := l_client.base_class
					if l_client_class.is_none then
						-- "NONE" is a descendant of all classes.
					elseif a_feature.is_exported_to (l_client_class) then
						-- The feature is exported to `l_client'.
					elseif l_feature_clients.has_class (current_universe.any_type.base_class) then
						-- The feature is not exported to `l_client'.
						-- But if `l_client' is not preparsed, we can still check
						-- whether `a_feature' be exported to "ANY".
					else
						set_fatal_error
						error_handler.report_vape0b_error (current_class, current_class_impl, a_name, a_feature, a_class, current_feature.as_feature, l_client)
					end
					i := i + 1
				end
			end
		end

	check_unqualified_vape_validity (a_name: ET_CALL_NAME; a_feature: ET_FEATURE) is
			-- Check VAPE validity rule when there is an unqualified call to `a_feature'
			-- named `a_name' in a precondition of `current_feature' in `current_class'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature `f' should be exported to every class to which `f' is exported.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_feature_clients: ET_CLIENT_LIST
			l_clients: ET_CLIENT_LIST
			l_client: ET_CLIENT
			l_client_class: ET_CLASS
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_feature_clients := a_feature.clients
				l_clients := current_feature.clients
				nb := l_clients.count
				from i := 1 until i > nb loop
					l_client := l_clients.client (i)
					l_client_class := l_client.base_class
					if l_client_class.is_none then
						-- "NONE" is a descendant of all classes.
					elseif a_feature.is_exported_to (l_client_class) then
						-- The feature is exported to `l_client'.
					elseif l_feature_clients.has_class (current_universe.any_type.base_class) then
						-- The feature is not exported to `l_client'.
						-- But if `l_client' is not preparsed, we can still check
						-- whether `a_feature' be exported to "ANY".
					else
						set_fatal_error
						error_handler.report_vape0a_error (current_class, current_class_impl, a_name, a_feature, current_feature.as_feature, l_client)
					end
					i := i + 1
				end
			end
		end

	check_expression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Check validity of `an_expression' (whose possible attachment target
			-- is of type `a_target_type') in `current_feature' of `current_type'.
			-- Set `has_fatal_error' if a fatal error occurred. Otherwise
			-- the type of `an_expression' is appended to `a_context'.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_context: ET_NESTED_TYPE_CONTEXT
			old_target_type: ET_TYPE_CONTEXT
			l_is_outermost_expression: BOOLEAN
		do
			has_fatal_error := False
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_context := current_context
			current_context := a_context
			if current_expression_object_tests.expression = dummy_expression then
				l_is_outermost_expression := True
				current_expression_object_tests.reset (an_expression)
			end
			an_expression.process (Current)
			if l_is_outermost_expression then
				current_expression_object_tests.reset (dummy_expression)
			end
			if not has_fatal_error then
				report_expression_supplier (a_context, current_class, current_feature)
			end
			current_context := old_context
			current_target_type := old_target_type
		end

	check_expressions_validity (an_expressions: ET_EXPRESSIONS) is
			-- Check validity of `an_expressions' (without any indication
			-- about the type of the possible attachment target)
			-- in `current_feature' of `current_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expressions_not_void: an_expressions /= Void
		local
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			any_type: ET_CLASS_TYPE
			i, nb: INTEGER
		do
			has_fatal_error := True
			if an_expressions /= Void then
				any_type := current_system.any_type
				l_expression_context := new_context (current_type)
				nb := an_expressions.count
				from i := 1 until i > nb loop
					check_expression_validity (an_expressions.expression (i), l_expression_context, any_type)
					l_expression_context.wipe_out
					i := i + 1
				end
				free_context (l_expression_context)
			end
		end

	check_actual_arguments_validity (an_actuals: ET_ACTUAL_ARGUMENTS; a_context: ET_NESTED_TYPE_CONTEXT;
		a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS) is
			-- Check actual arguments validity when calling `a_feature' named `a_name'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_context_not_void: a_context /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_actual: ET_EXPRESSION
			l_actual_list: ET_ACTUAL_ARGUMENT_LIST
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			l_actual_named_type: ET_NAMED_TYPE
			l_formal_named_type: ET_NAMED_TYPE
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_expression_comma: ET_EXPRESSION_COMMA
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_formals := a_feature.arguments
			if an_actuals = Void or else an_actuals.is_empty then
				if l_formals /= Void and then not l_formals.is_empty then
						-- The number of actual arguments is different from
						-- the number of formal arguments.
					set_fatal_error
					if current_class = current_class_impl then
						if a_class /= Void then
							if a_name.is_precursor then
								error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
							else
								error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
							end
						else
							error_handler.report_vuar1b_error (current_class, a_name, a_feature)
						end
					elseif not has_implementation_error (current_feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature_impl' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giaaa_error
					end
				end
			elseif l_formals = Void or else l_formals.count /= an_actuals.count then
					-- The number of actual arguments is different from
					-- the number of formal arguments.
				set_fatal_error
				if current_class = current_class_impl then
					if a_class /= Void then
						if a_name.is_precursor then
							error_handler.report_vdpr4a_error (current_class, a_name.precursor_keyword, a_feature, a_class)
						else
							error_handler.report_vuar1a_error (current_class, a_name, a_feature, a_class)
						end
					else
						error_handler.report_vuar1b_error (current_class, a_name, a_feature)
					end
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `current_feature_impl' or in
						-- the feature flattener when redeclaring `a_feature' in an
						-- ancestor of `a_class' or `current_class'.
					error_handler.report_giaaa_error
				end
			else
				l_actual_context := new_context (current_type)
				l_formal_context := a_context
				l_actual_list ?= an_actuals
				nb := an_actuals.count
				from i := 1 until i > nb loop
					l_actual := an_actuals.actual_argument (i)
					l_formal := l_formals.formal_argument (i)
					l_formal_context.force_last (l_formal.type)
					check_expression_validity (l_actual, l_actual_context, l_formal_context)
					if has_fatal_error then
						had_error := True
					elseif not l_actual_context.conforms_to_context (l_formal_context) then
							-- The actual type does not conform to the format type.
							-- Try to find out whether it converts to it.
						l_convert_expression := Void
						if l_actual_list /= Void then
							l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
						end
						if has_fatal_error then
							had_error := True
						elseif l_convert_expression /= Void then
								-- Insert the conversion feature call in the AST.
								-- Convertibility should be resolved in the implementation class.
							check implementation_class: current_class = current_class_impl end
							l_expression_comma ?= l_actual_list.item (i)
							if l_expression_comma /= Void then
								l_expression_comma.set_expression (l_convert_expression)
							else
								l_actual_list.put (l_convert_expression, i)
							end
						elseif
							current_system.is_ise and current_class /= current_class_impl and
							(current_class.is_basic or current_class.is_typed_pointer_class)
						then
							-- Compatibility with ISE 5.6.0610.
						else
							had_error := True
							set_fatal_error
							l_actual_named_type := l_actual_context.named_type
							l_formal_named_type := l_formal_context.named_type
							if a_class /= Void then
								if a_name.is_precursor then
									error_handler.report_vdpr4b_error (current_class, current_class_impl, a_name.precursor_keyword, a_feature, a_class, i, l_actual_named_type, l_formal_named_type)
								else
									error_handler.report_vuar2a_error (current_class, current_class_impl, a_name, a_feature, a_class, i, l_actual_named_type, l_formal_named_type)
								end
							else
								error_handler.report_vuar2b_error (current_class, current_class_impl, a_name, a_feature, i, l_actual_named_type, l_formal_named_type)
							end
						end
					end
					l_formal_context.remove_last
					l_actual_context.wipe_out
					i := i + 1
				end
				free_context (l_actual_context)
				if had_error then
					set_fatal_error
				end
			end
		end

feature {NONE} -- Agent validity

	check_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_target: ET_AGENT_TARGET
			an_expression_target: ET_EXPRESSION
			a_type_target: ET_AGENT_OPEN_TARGET
		do
			if not an_expression.is_qualified_call then
				check_unqualified_call_agent_validity (an_expression, a_context)
			else
				a_target := an_expression.target
				an_expression_target ?= a_target
				if an_expression_target /= Void then
					check_qualified_call_agent_validity (an_expression, an_expression_target, a_context)
				else
					a_type_target ?= a_target
					if a_type_target /= Void then
						check_typed_call_agent_validity (an_expression, a_type_target, a_context)
					else
							-- Internal error: no other kind of targets.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				end
			end
		end

	check_unqualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			a_seed: INTEGER
			l_expected_class: ET_CLASS
		do
			has_fatal_error := False
-- TODO: do we need to call `report_current_type_needed'.
			report_current_type_needed
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					current_class.process (current_system.interface_checker)
					if not current_class.interface_checked or else current_class.has_interface_error then
						set_fatal_error
					else
						l_expected_class := current_target_type.base_class
						if l_expected_class.is_procedure_class then
							l_procedure := current_class.named_procedure (a_name)
							if l_procedure /= Void then
								a_name.set_seed (l_procedure.first_seed)
								an_expression.set_procedure (True)
								check_unqualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
							else
								l_query := current_class.named_query (a_name)
								if l_query /= Void then
									a_name.set_seed (l_query.first_seed)
									an_expression.set_procedure (False)
									check_unqualified_query_call_agent_validity (an_expression, l_query, a_context)
								else
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
									error_handler.report_vpca1a_error (current_class, a_name)
								end
							end
						else
							l_query := current_class.named_query (a_name)
							if l_query /= Void then
								a_name.set_seed (l_query.first_seed)
								an_expression.set_procedure (False)
								check_unqualified_query_call_agent_validity (an_expression, l_query, a_context)
							else
								l_procedure := current_class.named_procedure (a_name)
								if l_procedure /= Void then
									a_name.set_seed (l_procedure.first_seed)
									an_expression.set_procedure (True)
									check_unqualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
								else
									set_fatal_error
										-- ISE Eiffel 5.4 reports this error as a VEEN,
										-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
									error_handler.report_vpca1a_error (current_class, a_name)
								end
							end
						end
					end
				end
			elseif an_expression.is_procedure then
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
					set_fatal_error
				else
					l_procedure := current_class.seeded_procedure (a_seed)
					if l_procedure = Void then
							-- Report internal error: if we got a seed, `l_procedure' should not be void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						check_unqualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
					end
				end
			else
					-- We still need to find `l_query'.
				current_class.process (current_system.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
					set_fatal_error
				else
					l_query := current_class.seeded_query (a_seed)
					if l_query = Void then
							-- Report internal error: if we got a seed, `l_query' should not be void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						check_unqualified_query_call_agent_validity (an_expression, l_query, a_context)
					end
				end
			end
		end

	check_unqualified_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified query call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			check_unqualified_vape_validity (a_name, a_query)
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_query, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					an_agent_class := current_universe_impl.predicate_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (current_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				else
					an_agent_class := current_universe_impl.function_type.named_base_class
					create a_parameters.make_with_capacity (3)
					a_parameters.put_first (a_type)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (current_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_unqualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_unqualified_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of unqualified procedure call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_procedure_not_void: a_procedure /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			check_unqualified_vape_validity (a_name, a_procedure)
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_procedure, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (current_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				report_unqualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			a_seed: INTEGER
			any_type: ET_CLASS_TYPE
			l_expected_class: ET_CLASS
			l_label: ET_IDENTIFIER
			had_error: BOOLEAN
		do
			has_fatal_error := False
-- TODO: do we need to call `report_current_type_needed'.
			report_current_type_needed
			a_name := an_expression.name
			any_type := current_system.any_type
			a_seed := a_name.seed
			if a_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
					check_expression_validity (a_target, a_context, any_type)
					if not has_fatal_error then
						a_class := a_context.base_class
						a_class.process (current_system.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							l_expected_class := current_target_type.base_class
							if l_expected_class.is_procedure_class then
								l_procedure := a_class.named_procedure (a_name)
								if l_procedure /= Void then
									a_name.set_seed (l_procedure.first_seed)
									an_expression.set_procedure (True)
									check_qualified_vape_validity (a_name, l_procedure, a_class)
									had_error := has_fatal_error
									check_qualified_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
									has_fatal_error := has_fatal_error or had_error
								else
									l_query := a_class.named_query (a_name)
									if l_query /= Void then
										a_name.set_seed (l_query.first_seed)
										an_expression.set_procedure (False)
										check_qualified_vape_validity (a_name, l_query, a_class)
										had_error := has_fatal_error
										check_qualified_query_call_agent_validity (an_expression, a_target, l_query, a_context)
										has_fatal_error := has_fatal_error or had_error
									else
										if a_class.is_tuple_class then
												-- Check whether this is a tuple label.
											l_label ?= a_name
											if l_label /= Void then
												a_seed := a_context.base_type_index_of_label (l_label)
												if a_seed /= 0 then
													l_label.set_tuple_label (True)
													l_label.set_seed (a_seed)
													an_expression.set_procedure (False)
													check_qualified_tuple_label_call_agent_validity (an_expression, a_target, a_context)
												end
											end
										end
										if a_seed = 0 then
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
											error_handler.report_vpca1b_error (current_class, a_name, a_class)
										end
									end
								end
							else
								l_query := a_class.named_query (a_name)
								if l_query /= Void then
									a_name.set_seed (l_query.first_seed)
									an_expression.set_procedure (False)
									check_qualified_vape_validity (a_name, l_query, a_class)
									had_error := has_fatal_error
									check_qualified_query_call_agent_validity (an_expression, a_target, l_query, a_context)
									has_fatal_error := has_fatal_error or had_error
								else
									if a_class.is_tuple_class then
											-- Check whether this is a tuple label.
										l_label ?= a_name
										if l_label /= Void then
											a_seed := a_context.base_type_index_of_label (l_label)
											if a_seed /= 0 then
												l_label.set_tuple_label (True)
												l_label.set_seed (a_seed)
												an_expression.set_procedure (False)
												check_qualified_tuple_label_call_agent_validity (an_expression, a_target, a_context)
											end
										end
									end
									if a_seed = 0 then
										l_procedure := a_class.named_procedure (a_name)
										if l_procedure /= Void then
											a_name.set_seed (l_procedure.first_seed)
											an_expression.set_procedure (True)
											check_qualified_vape_validity (a_name, l_procedure, a_class)
											had_error := has_fatal_error
											check_qualified_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
											has_fatal_error := has_fatal_error or had_error
										else
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
											error_handler.report_vpca1b_error (current_class, a_name, a_class)
										end
									end
								end
							end
						end
					end
				end
			elseif a_name.is_tuple_label then
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				check_expression_validity (a_target, a_context, any_type)
				if not has_fatal_error then
					a_class := a_context.base_class
					a_class.process (current_system.interface_checker)
					if not a_class.interface_checked or else a_class.has_interface_error then
						set_fatal_error
					elseif not a_class.is_tuple_class then
							-- Report internal error: if we got a call to tuple label,
							-- the class has to be TUPLE because it is not possible
							-- to inherit from TUPLE.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						check_qualified_tuple_label_call_agent_validity (an_expression, a_target, a_context)
					end
				end
			elseif an_expression.is_procedure then
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				check_expression_validity (a_target, a_context, any_type)
				if not has_fatal_error then
					a_class := a_context.base_class
					a_class.process (current_system.interface_checker)
					if not a_class.interface_checked or else a_class.has_interface_error then
						set_fatal_error
					else
						l_procedure := a_class.seeded_procedure (a_seed)
						if l_procedure = Void then
								-- Internal error: if we got a seed, `l_procedure' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							check_qualified_vape_validity (a_name, l_procedure, a_class)
							had_error := has_fatal_error
							check_qualified_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
							has_fatal_error := has_fatal_error or had_error
						end
					end
				end
			else
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				check_expression_validity (a_target, a_context, any_type)
				if not has_fatal_error then
					a_class := a_context.base_class
					a_class.process (current_system.interface_checker)
					if not a_class.interface_checked or else a_class.has_interface_error then
						set_fatal_error
					else
						l_query := a_class.seeded_query (a_seed)
						if l_query = Void then
								-- Internal error: if we got a seed, `l_query' should not be void.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							check_qualified_vape_validity (a_name, l_query, a_class)
							had_error := has_fatal_error
							check_qualified_query_call_agent_validity (an_expression, a_target, l_query, a_context)
							has_fatal_error := has_fatal_error or had_error
						end
					end
				end
			end
		end

	check_qualified_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified query call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			query_call: not an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_type: ET_TYPE
			a_seed: INTEGER
			any_type: ET_CLASS_TYPE
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			any_type := current_system.any_type
			a_seed := a_name.seed
			if not a_query.is_exported_to (current_class) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vpca2a_error (current_class, current_class_impl, a_name, a_query, a_context.base_class)
			end
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_query, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
				a_target_type := tokens.like_current
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					an_agent_class := current_universe_impl.predicate_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (a_target_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				else
					an_agent_class := current_universe_impl.function_type.named_base_class
					create a_parameters.make_with_capacity (3)
					a_parameters.put_first (a_type)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (a_target_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_qualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified procedure call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			procedure_call: an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_procedure_not_void: a_procedure /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			any_type: ET_CLASS_TYPE
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			any_type := current_system.any_type
			a_seed := a_name.seed
			if not a_procedure.is_exported_to (current_class) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vpca2a_error (current_class, current_class_impl, a_name, a_procedure, a_context.base_class)
			end
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_procedure, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
				a_target_type := tokens.like_current
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (a_target_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				report_qualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_tuple_label_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of qualified tuple label call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			query_call: not an_expression.is_procedure
			tuple_label: an_expression.name.is_tuple_label
			indexed: an_expression.name.seed /= 0
			a_context_not_void: a_context /= Void
		local
			l_name: ET_FEATURE_NAME
			l_index: INTEGER
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_GENERIC_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
			l_target_type: ET_TYPE
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_index := l_name.seed
			l_actuals := an_expression.arguments
			if l_actuals /= Void and then not l_actuals.is_empty then
					-- A call to a Tuple label cannot have arguments.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vuar1c_error (current_class, l_name)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `current_feature_impl'.
					error_handler.report_giaaa_error
				end
			elseif l_index > a_context.base_type_actual_count then
					-- Report internal error: the index of the labeled
					-- actual parameter cannot be out of bound because
					-- for a Tuple type to conform to another Tuple type
					-- it needs to have more actual parameters.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_type := tokens.formal_parameter (l_index)
				l_target_type := tokens.like_current
				if l_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					l_agent_class := current_universe_impl.predicate_type.named_base_class
					create l_parameters.make_with_capacity (2)
					l_parameters.put_first (current_universe_impl.tuple_type)
					l_parameters.put_first (l_target_type)
					create l_agent_type.make (Void, l_agent_class.name, l_parameters, l_agent_class)
				else
					l_agent_class := current_universe_impl.function_type.named_base_class
					create l_parameters.make_with_capacity (3)
					l_parameters.put_first (l_type)
					l_parameters.put_first (current_system.tuple_type)
					l_parameters.put_first (l_target_type)
					create l_agent_type.make (Void, l_agent_class.name, l_parameters, l_agent_class)
				end
				report_tuple_label_call_agent (an_expression, l_agent_type, a_context)
				a_context.force_last (l_agent_type)
			end
		end

	check_typed_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_class: ET_CLASS
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
			a_seed: INTEGER
			a_target_type: ET_TYPE
			l_expected_class: ET_CLASS
			l_label: ET_IDENTIFIER
			had_error: BOOLEAN
		do
			has_fatal_error := False
-- TODO: do we need to call `report_current_type_needed'.
			report_current_type_needed
			a_name := an_expression.name
			a_target_type := a_target.type
			check_type_validity (a_target_type)
			if not has_fatal_error then
				a_seed := a_name.seed
				if a_seed = 0 then
						-- We need to resolve `a_name' in the implementation
						-- class of `current_feature_impl' first.
					if current_class_impl /= current_class then
						set_fatal_error
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: `a_name' should have been resolved in
								-- the implementation feature.
							error_handler.report_giaaa_error
						end
					else
						a_context.force_last (a_target_type)
						a_class := a_context.base_class
						a_class.process (current_system.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							l_expected_class := current_target_type.base_class
							if l_expected_class.is_procedure_class then
								l_procedure := a_class.named_procedure (a_name)
								if l_procedure /= Void then
									a_name.set_seed (l_procedure.first_seed)
									an_expression.set_procedure (True)
									check_qualified_vape_validity (a_name, l_procedure, a_class)
									had_error := has_fatal_error
									check_typed_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
									has_fatal_error := has_fatal_error or had_error
								else
									l_query := a_class.named_query (a_name)
									if l_query /= Void then
										a_name.set_seed (l_query.first_seed)
										an_expression.set_procedure (False)
										check_qualified_vape_validity (a_name, l_query, a_class)
										had_error := has_fatal_error
										check_typed_query_call_agent_validity (an_expression, a_target, l_query, a_context)
										has_fatal_error := has_fatal_error or had_error
									else
										if a_class.is_tuple_class then
												-- Check whether this is a tuple label.
											l_label ?= a_name
											if l_label /= Void then
												a_seed := a_context.base_type_index_of_label (l_label)
												if a_seed /= 0 then
													l_label.set_tuple_label (True)
													l_label.set_seed (a_seed)
													an_expression.set_procedure (False)
													check_typed_tuple_label_call_agent_validity (an_expression, a_target, a_context)
												end
											end
										end
										if a_seed = 0 then
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
											error_handler.report_vpca1b_error (current_class, a_name, a_class)
										end
									end
								end
							else
								l_query := a_class.named_query (a_name)
								if l_query /= Void then
									a_name.set_seed (l_query.first_seed)
									an_expression.set_procedure (False)
									check_qualified_vape_validity (a_name, l_query, a_class)
									had_error := has_fatal_error
									check_typed_query_call_agent_validity (an_expression, a_target, l_query, a_context)
									has_fatal_error := has_fatal_error or had_error
								else
									if a_class.is_tuple_class then
											-- Check whether this is a tuple label.
										l_label ?= a_name
										if l_label /= Void then
											a_seed := a_context.base_type_index_of_label (l_label)
											if a_seed /= 0 then
												l_label.set_tuple_label (True)
												l_label.set_seed (a_seed)
												an_expression.set_procedure (False)
												check_typed_tuple_label_call_agent_validity (an_expression, a_target, a_context)
											end
										end
									end
									if a_seed = 0 then
										l_procedure := a_class.named_procedure (a_name)
										if l_procedure /= Void then
											a_name.set_seed (l_procedure.first_seed)
											an_expression.set_procedure (True)
											check_qualified_vape_validity (a_name, l_procedure, a_class)
											had_error := has_fatal_error
											check_typed_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
											has_fatal_error := has_fatal_error or had_error
										else
											set_fatal_error
												-- ISE Eiffel 5.4 reports this error as a VEEN,
												-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
											error_handler.report_vpca1b_error (current_class, a_name, a_class)
										end
									end
								end
							end
						end
					end
				elseif a_name.is_tuple_label then
					a_target_type := resolved_formal_parameters (a_target_type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (a_target_type)
						a_class := a_context.base_class
						a_class.process (current_system.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						elseif not a_class.is_tuple_class then
								-- Report internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						else
							check_typed_tuple_label_call_agent_validity (an_expression, a_target, a_context)
						end
					end
				elseif an_expression.is_procedure then
					a_target_type := resolved_formal_parameters (a_target_type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (a_target_type)
						a_class := a_context.base_class
						a_class.process (current_system.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							l_procedure := a_class.seeded_procedure (a_seed)
							if l_procedure = Void then
									-- Internal error: if we got a seed, `l_procedure' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								check_qualified_vape_validity (a_name, l_procedure, a_class)
								had_error := has_fatal_error
								check_typed_procedure_call_agent_validity (an_expression, a_target, l_procedure, a_context)
								has_fatal_error := has_fatal_error or had_error
							end
						end
					end
				else
					a_target_type := resolved_formal_parameters (a_target_type, current_class_impl, current_type)
					if not has_fatal_error then
						a_context.force_last (a_target_type)
						a_class := a_context.base_class
						a_class.process (current_system.interface_checker)
						if not a_class.interface_checked or else a_class.has_interface_error then
							set_fatal_error
						else
							l_query := a_class.seeded_query (a_seed)
							if l_query = Void then
									-- Internal error: if we got a seed, `l_query' should not be void.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								check_qualified_vape_validity (a_name, l_query, a_class)
								had_error := has_fatal_error
								check_typed_query_call_agent_validity (an_expression, a_target, l_query, a_context)
								has_fatal_error := has_fatal_error or had_error
							end
						end
					end
				end
			end
		end

	check_typed_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed query call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			query_call: not an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_result_type: ET_TYPE
			a_seed: INTEGER
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			a_target_type := a_target.type
			if not a_query.is_exported_to (current_class) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vpca2a_error (current_class, current_class_impl, a_name, a_query, a_context.base_class)
			end
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
			else
				create an_open_operands.make_with_capacity (1)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_query, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if not has_fatal_error then
				a_target_type := tokens.like_current
				an_open_operands.put_first (a_target_type)
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_result_type := a_query.type
-- TODO: like argument
				if a_result_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					an_agent_class := current_universe_impl.predicate_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (a_target_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				else
					an_agent_class := current_universe_impl.function_type.named_base_class
					create a_parameters.make_with_capacity (3)
					a_parameters.put_first (a_result_type)
					a_parameters.put_first (a_tuple_type)
					a_parameters.put_first (a_target_type)
					create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_qualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_typed_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed procedure call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			procedure_call: an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_procedure_not_void: a_procedure /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			a_target_type := a_target.type
			if not a_procedure.is_exported_to (current_class) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vpca2a_error (current_class, current_class_impl, a_name, a_procedure, a_context.base_class)
			end
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
			else
				create an_open_operands.make_with_capacity (1)
			end
			had_error := has_fatal_error
			check_agent_arguments_validity (an_expression, a_formal_arguments, a_procedure, an_open_operands, a_context)
			has_fatal_error := has_fatal_error or had_error
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				a_target_type := tokens.like_current
				an_open_operands.put_first (a_target_type)
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (a_target_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				report_qualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_typed_tuple_label_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of typed tuple label call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
			query_call: not an_expression.is_procedure
			tuple_label: an_expression.name.is_tuple_label
			indexed: an_expression.name.seed /= 0
			a_context_not_void: a_context /= Void
		local
			l_name: ET_FEATURE_NAME
			l_index: INTEGER
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_GENERIC_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
			l_target_type: ET_TYPE
			l_open_operands: ET_ACTUAL_PARAMETER_LIST
			l_tuple_type: ET_TUPLE_TYPE
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_index := l_name.seed
			l_actuals := an_expression.arguments
			if l_actuals /= Void and then not l_actuals.is_empty then
					-- A call to a Tuple label cannot have arguments.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vuar1c_error (current_class, l_name)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `current_feature_impl'.
					error_handler.report_giaaa_error
				end
			elseif l_index > a_context.base_type_actual_count then
					-- Report internal error: the index of the labeled
					-- actual parameter cannot be out of bound because
					-- for a Tuple type to conform to another Tuple type
					-- it needs to have more actual parameters.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_type := tokens.formal_parameter (l_index)
				l_target_type := a_target.type
				create l_open_operands.make_with_capacity (1)
				l_open_operands.put_first (l_target_type)
				create l_tuple_type.make (Void, l_open_operands, current_universe_impl.tuple_type.named_base_class)
				if l_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					l_agent_class := current_universe_impl.predicate_type.named_base_class
					create l_parameters.make_with_capacity (2)
					l_parameters.put_first (l_tuple_type)
					l_parameters.put_first (l_target_type)
					create l_agent_type.make (Void, l_agent_class.name, l_parameters, l_agent_class)
				else
					l_agent_class := current_universe_impl.function_type.named_base_class
					create l_parameters.make_with_capacity (3)
					l_parameters.put_first (l_type)
					l_parameters.put_first (l_tuple_type)
					l_parameters.put_first (l_target_type)
					create l_agent_type.make (Void, l_agent_class.name, l_parameters, l_agent_class)
				end
				report_tuple_label_call_agent (an_expression, l_agent_type, a_context)
				a_context.force_last (l_agent_type)
			end
		end

	check_do_function_inline_agent_validity (an_expression: ET_DO_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := an_expression.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_query_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_do_procedure_inline_agent_validity (an_expression: ET_DO_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := an_expression.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_procedure_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_external_function_inline_agent_validity (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_type: ET_TYPE
			l_object_tests: ET_OBJECT_TEST_LIST
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_arguments := an_expression.formal_arguments
			if l_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_query_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_external_procedure_inline_agent_validity (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_arguments := an_expression.formal_arguments
			if l_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_procedure_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_once_function_inline_agent_validity (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_type: ET_TYPE
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := an_expression.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_query_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_once_procedure_inline_agent_validity (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_compound: ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if current_inline_agent /= Void then
				enclosing_inline_agents.force_last (current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Check the associated feature's declaration.
			l_formal_arguments := an_expression.formal_arguments
			if l_formal_arguments /= Void then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := has_fatal_error
			end
			l_object_tests := an_expression.object_tests
			if l_object_tests /= Void then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_locals := an_expression.locals
			if l_locals /= Void then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				l_compound := an_expression.rescue_clause
				if l_compound /= Void then
					check_rescue_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Manage enclosing inline agents.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_procedure_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error
		end

	check_query_inline_agent_validity (an_expression: ET_QUERY_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of call agent equivalent form of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
		do
			has_fatal_error := False
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			check_agent_arguments_validity (an_expression, a_formal_arguments, Void, an_open_operands, a_context)
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
					-- Contrary to the types appearing in the signatures of features, types
					-- in signatures of inline agents in the AST are those found in the
					-- implementation class of `current_feature', and hence need to be
					-- resolved in `current_type'.
				a_type := resolved_formal_parameters (an_expression.type, current_class_impl, current_type)
-- TODO: like argument
				if not has_fatal_error then
					if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
						an_agent_class := current_universe_impl.predicate_type.named_base_class
						create a_parameters.make_with_capacity (2)
						a_parameters.put_first (a_tuple_type)
						a_parameters.put_first (current_type)
						create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
					else
						an_agent_class := current_universe_impl.function_type.named_base_class
						create a_parameters.make_with_capacity (3)
						a_parameters.put_first (a_type)
						a_parameters.put_first (a_tuple_type)
						a_parameters.put_first (current_type)
						create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
					end
					report_query_inline_agent (an_expression, an_agent_type, a_context)
					a_context.force_last (an_agent_type)
				end
			end
		end

	check_procedure_inline_agent_validity (an_expression: ET_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of call agent equivalent form of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
		do
			has_fatal_error := False
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
					-- Make implicit open arguments explicit.
				set_implicit_agent_open_arguments (an_expression, a_formal_arguments)
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
			end
			check_agent_arguments_validity (an_expression, a_formal_arguments, Void, an_open_operands, a_context)
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (current_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				report_procedure_inline_agent (an_expression, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	set_implicit_agent_open_arguments (an_agent: ET_AGENT; a_formals: ET_FORMAL_ARGUMENT_LIST) is
			-- If we have 'agent f' and 'f' has two formal arguments,
			-- then make the open arguments explicit 'agent f (?, ?)'.
			-- Only do that if `current_class' is the class where this
			-- agent has been written. `a_formals' are the corresponding
			-- formal arguments, Void if no formal arguments.
			-- This routine works both with call agents and inline agents.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_implicit_actuals: ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST
			l_implicit_actual: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
			i, nb: INTEGER
		do
			if current_class_impl = current_class then
				l_actuals := an_agent.arguments
				if l_actuals = Void then
					if a_formals /= Void and then not a_formals.is_empty then
						nb := a_formals.count
						create l_implicit_actuals.make_with_capacity (nb)
						from i := 1 until i > nb loop
							create l_implicit_actual.make (an_agent, i)
							l_implicit_actuals.put_last (l_implicit_actual)
							i := i + 1
						end
						an_agent.set_arguments (l_implicit_actuals)
					end
				end
			end
		end

	check_agent_arguments_validity (an_agent: ET_AGENT; a_formals: ET_FORMAL_ARGUMENT_LIST;
		a_feature: ET_FEATURE; an_open_operands: ET_ACTUAL_PARAMETER_LIST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Check validity of actual arguments of `an_agent' with the corresponding formal arguments `a_formals'.
			-- `a_feature' is the feature of the call when `an_agent' is a call agent.
			-- `a_context' represents the type of the target of the agent.
			-- `an_open_operands', when not Void, is where to store the types of open operands.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_agent_not_void: an_agent /= Void
			a_feature_not_void: an_agent.is_call_agent implies a_feature /= Void
			a_context_not_void: a_context /= Void
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual_list: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_formal_type: ET_TYPE
			l_call_agent: ET_CALL_AGENT
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			l_agent_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual: ET_EXPRESSION
			l_formal: ET_FORMAL_ARGUMENT
			had_error, had_type_error: BOOLEAN
			l_actual_named_type: ET_NAMED_TYPE
			l_formal_named_type: ET_NAMED_TYPE
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_argument_comma: ET_AGENT_ARGUMENT_OPERAND_COMMA
			l_agent_type: ET_AGENT_TYPED_OPEN_ARGUMENT
			l_actual_type: ET_TYPE
			l_question_mark: ET_QUESTION_MARK_SYMBOL
		do
			has_fatal_error := False
			l_actuals := an_agent.arguments
			l_actual_list ?= l_actuals
			if l_actual_list = Void then
				if a_formals /= Void and an_open_operands /= Void then
					nb := a_formals.count
					from i := nb until i < 1 loop
						l_formal_type := a_formals.formal_argument (i).type
						if an_agent.is_inline_agent then
								-- Contrary to the types appearing in the signatures of features, types
								-- in signatures of inline agents in the AST are those found in the
								-- implementation class of `current_feature', and hence need to be
								-- resolved in `current_type'.
							had_error := has_fatal_error
							l_formal_type := resolved_formal_parameters (l_formal_type, current_class_impl, current_type)
							has_fatal_error := has_fatal_error or had_error
						end
						an_open_operands.force_first (l_formal_type)
						i := i - 1
					end
				end
			else
				if l_actual_list.is_empty then
					if a_formals /= Void and then not a_formals.is_empty then
						set_fatal_error
						if current_class = current_class_impl then
							l_call_agent ?= an_agent
							if l_call_agent /= Void then
								if l_call_agent.is_qualified_call then
									error_handler.report_vpca3a_error (current_class, l_call_agent.name, a_feature, a_context.base_class)
								else
									error_handler.report_vpca3b_error (current_class, l_call_agent.name, a_feature)
								end
							else
-- TODO: inline agent
							end
						elseif not has_implementation_error (current_feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature_impl' or in
								-- the feature flattener when redeclaring `a_feature' in an
								-- ancestor of the base class of the target.
							error_handler.report_giaaa_error
						end
					end
				elseif a_formals = Void or else a_formals.count /= l_actual_list.count then
					set_fatal_error
					if current_class = current_class_impl then
						l_call_agent ?= an_agent
						if l_call_agent /= Void then
							if l_call_agent.is_qualified_call then
								error_handler.report_vpca3a_error (current_class, l_call_agent.name, a_feature, a_context.base_class)
							else
								error_handler.report_vpca3b_error (current_class, l_call_agent.name, a_feature)
							end
						else
-- TODO: inline agent
						end
					elseif not has_implementation_error (current_feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature_impl' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of the base class of the target.
						error_handler.report_giaaa_error
					end
				else
					l_actual_context := new_context (current_type)
					l_formal_context := a_context
					nb := l_actual_list.count
					from i := nb until i < 1 loop
						had_error := had_error or has_fatal_error
						l_formal := a_formals.formal_argument (i)
						l_agent_actual := l_actual_list.actual_argument (i)
						l_actual ?= l_agent_actual
						if l_actual /= Void then
							l_formal_type := l_formal.type
							had_type_error := False
							if an_agent.is_inline_agent then
									-- Contrary to the types appearing in the signatures of features, types
									-- in signatures of inline agents in the AST are those found in the
									-- implementation class of `current_feature', and hence need to be
									-- resolved in `current_type'.
								l_formal_type := resolved_formal_parameters (l_formal_type, current_class_impl, current_type)
								had_type_error := has_fatal_error
							end
							l_formal_context.force_last (l_formal_type)
							check_expression_validity (l_actual, l_actual_context, l_formal_context)
							has_fatal_error := has_fatal_error or had_type_error
							if has_fatal_error then
								-- Do nothing.
							elseif not l_actual_context.conforms_to_context (l_formal_context) then
									-- The actual type does not conform to the format type.
									-- Try to find out whether it converts to it.
								l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
								if has_fatal_error then
									-- Nothing to be done.
								elseif l_convert_expression /= Void then
										-- Insert the conversion feature call in the AST.
										-- Convertibility should be resolved in the implementation class.
									check implementation_class: current_class = current_class_impl end
									l_argument_comma ?= l_actual_list.item (i)
									if l_argument_comma /= Void then
										l_argument_comma.set_agent_actual_argument (l_convert_expression)
									else
										l_actual_list.put (l_convert_expression, i)
									end
								else
									set_fatal_error
									l_actual_named_type := l_actual_context.named_type
									l_formal_named_type := l_formal_context.named_type
									l_call_agent ?= an_agent
									if l_call_agent /= Void then
										if l_call_agent.is_qualified_call then
												-- Make sure that `a_context' (which is the same object as `l_formal_context') represents
												-- the type of the target of the agent and not the type of the formal argument.
											l_formal_context.remove_last
											error_handler.report_vpca4a_error (current_class, current_class_impl, l_call_agent.name, a_feature, a_context.base_class, i, l_actual_named_type, l_formal_named_type)
											l_formal_context.force_last (l_formal_type)
										else
											error_handler.report_vpca4b_error (current_class, current_class_impl, l_call_agent.name, a_feature, i, l_actual_named_type, l_formal_named_type)
										end
									else
-- TODO: inline agent
									end
								end
							end
							l_formal_context.remove_last
							l_actual_context.wipe_out
						else
							l_agent_type ?= l_agent_actual
							if l_agent_type /= Void then
								l_actual_type := l_agent_type.type
								check_type_validity (l_actual_type)
								if not has_fatal_error then
									l_actual_type := resolved_formal_parameters (l_actual_type, current_class_impl, current_type)
									if has_fatal_error then
										-- Do nothing.
									elseif not l_actual_type.conforms_to_type (l_formal.type, l_formal_context, current_type) then
-- Note: VPCA-5 says nothing about type convertibility.
										set_fatal_error
										l_actual_named_type := l_actual_type.named_type (current_type)
										l_formal_named_type := l_formal.type.named_type (l_formal_context)
										l_call_agent ?= an_agent
										if l_call_agent /= Void then
											if l_call_agent.is_qualified_call then
												error_handler.report_vpca5a_error (current_class, current_class_impl, l_call_agent.name, a_feature, a_context.base_class, i, l_actual_named_type, l_formal_named_type)
											else
												error_handler.report_vpca5b_error (current_class, current_class_impl, l_call_agent.name, a_feature, i, l_actual_named_type, l_formal_named_type)
											end
										else
-- TODO: inline agent
										end
									else
										if an_open_operands /= Void then
											an_open_operands.force_first (l_actual_type)
										end
									end
								end
							else
								l_question_mark ?= l_agent_actual
								if l_question_mark /= Void then
									if an_open_operands /= Void then
										l_formal_type := l_formal.type
										if an_agent.is_inline_agent then
												-- Contrary to the types appearing in the signatures of features, types
												-- in signatures of inline agents in the AST are those found in the
												-- implementation class of `current_feature', and hence need to be
												-- resolved in `current_type'.
											l_formal_type := resolved_formal_parameters (l_formal_type, current_class_impl, current_type)
										end
										an_open_operands.force_first (l_formal_type)
									end
								else
										-- Internal error: no other kind of agent actual arguments.
									set_fatal_error
									error_handler.report_giaaa_error
								end
							end
						end
						i := i - 1
					end
					free_context (l_actual_context)
					has_fatal_error := has_fatal_error or had_error
				end
			end
		end

feature {NONE} -- Event handling

	report_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Report that an assignment instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Report that an assignment attempt instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY) is
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY) is
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_writable_not_void: a_writable /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Report that a bit constant has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
		do
		end

	report_boolean_constant (a_constant: ET_BOOLEAN_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a boolean of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_character_8_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a character_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_character_32_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a character_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_builtin_conversion (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_target_type: ET_TYPE) is
			-- Report that a built-in convert expression has been processed,
			-- where `a_target_type' in  the context of `current_type' is
			-- the type of the expression after the conversion occurred.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
		do
		end

	report_creation_expression (an_expression: ET_CREATION_EXPRESSION; a_creation_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a creation expression, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a creation instruction, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_current (an_expression: ET_CURRENT) is
			-- Report that the current entity has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_current_type_needed is
			-- Report that the current type is needed to execute the feature being analyzed.
			-- This might be needed for optimization purposes.
		require
			no_error: not has_fatal_error
		do
		end

	report_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Report that an equality expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_formal_argument (a_name: ET_IDENTIFIER; a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that a call to formal argument `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_formal_not_void: a_formal /= Void
		do
		end

	report_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that the declaration of the formal
			-- argument `a_formal' of a feature has been processed.
		require
			no_error: not has_fatal_error
			a_formal_not_void: a_formal /= Void
		do
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY) is
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_query_not_void: a_query /= Void
			not_attribute: not a_query.is_attribute
		do
		end

	report_inline_agent_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT) is
			-- Report that the declaration of the formal argument `a_formal'
			-- of an inline agent has been processed.
			-- Note: The type of the formal argument is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		require
			no_error: not has_fatal_error
			a_formal_not_void: a_formal /= Void
		do
		end

	report_inline_agent_local_variable_declaration (a_local: ET_LOCAL_VARIABLE) is
			-- Report that the declaration of the local variable `a_local'
			-- of an inline agent has been processed.
			-- Note: The type of the local variable is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		require
			no_error: not has_fatal_error
			a_local_not_void: a_local /= Void
		do
		end

	report_inline_agent_result_declaration (a_type: ET_TYPE) is
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of an inline agent has been processed.
			-- Note: The type of the "Result" entity is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a integer_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a integer_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a integer_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a integer_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_local_assignment_target (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that the local variable `a_name' has been
			-- processed as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE) is
			-- Report that a call to local variable `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable_declaration (a_local: ET_LOCAL_VARIABLE) is
			-- Report that the declaration of the local variable `a_local'
			-- of a feature has been processed.
			-- Note: The type of the local variable is still viewed from
			-- the implementation class of `current_feature'. Its formal
			-- generic parameters need to be resolved in `current_class'
			-- before using it.
		require
			no_error: not has_fatal_error
			a_local_not_void: a_local /= Void
		do
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE) is
			-- Report that a manifest array of type `a_type' in context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE) is
			-- Report that a manifest tuple of type `a_type' in context of
			-- `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_manifest_type (an_expression: ET_MANIFEST_TYPE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a manifest type of type `a_type'
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_named_object_test (a_object_test: ET_NAMED_OBJECT_TEST; a_local_type: ET_TYPE_CONTEXT) is
			-- Report that the object-test `a_object_test' with local
			-- of type `a_local_type' has been processed.
		require
			no_error: not has_fatal_error
			a_object_test_not_void: a_object_test /= Void
			a_local_type_not_void: a_local_type /= Void
			a_local_type_valid: a_local_type.is_valid_context
		do
		end

	report_natural_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a natural_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a natural_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a natural_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a natural_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Report that an object equality expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_object_test (a_object_test: ET_OBJECT_TEST) is
			-- Report that the object-test `a_object_test' has been processed.
		require
			no_error: not has_fatal_error
			a_object_test_not_void: a_object_test /= Void
		do
		end

	report_object_test_local (a_name: ET_IDENTIFIER; a_object_test: ET_NAMED_OBJECT_TEST) is
			-- Report that a call to object-test local `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_object_test_not_void: a_object_test /= Void
		do
		end

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_CLASS_TYPE) is
			-- Report that a pointer expression of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_query' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_query_not_void: a_query /= Void
		do
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_procedure' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE) is
			-- Report that function `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_procedure_inline_agent (an_expression: ET_PROCEDURE_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that procedure inline agent of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY) is
			-- Report that a qualified call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call: an_expression.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_query_not_void: a_query /= Void
		do
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE) is
			-- Report that a qualified call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			qualified_call: an_instruction.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified procedure call (to `a_procedure') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			a_procedure_not_void: a_procedure /= Void
			an_agent_type_not_void: an_agent_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a qualified query call (to `a_query') agent
			-- of type `an_agent_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			a_query_not_void: a_query /= Void
			an_agent_type_not_void: an_agent_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_query_inline_agent (an_expression: ET_QUERY_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a query inline agent of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_real_32_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE) is
			-- Report that a real_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_real_64_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE) is
		-- Report that a real_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_result (an_expression: ET_RESULT) is
			-- Report that the result entity has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_result_assignment_target (a_result: ET_RESULT) is
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_result_not_void: a_result /= Void
		do
		end

	report_result_declaration (a_type: ET_TYPE) is
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of a feature has been processed.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
		do
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY) is
			-- Report that a static call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_query_not_void: a_query /= Void
		do
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE) is
			-- Report that a static call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_string_8_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE) is
			-- Report that a string_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_string_32_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE) is
			-- Report that a string_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_strip_expression (an_expression: ET_STRIP_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a strip expression of type `a_type'
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_tuple_label_call_agent (an_expression: ET_CALL_AGENT; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a tuple label call agent of type `an_agent_type'
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			tuple_label: an_expression.name.is_tuple_label
			an_agent_type_not_void: an_agent_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_tuple_label_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT) is
			-- Report that a call to a tuple label has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call: an_expression.is_qualified_call
			tuple_label: an_expression.name.is_tuple_label
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
		do
		end

	report_tuple_label_setter (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT) is
			-- Report that a call to the setter of a tuple label has been processed.
		require
			no_error: not has_fatal_error
			an_assigner_not_void: an_assigner /= Void
			tuple_label: an_assigner.call.name.is_tuple_label
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
		do
		end

	report_typed_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that a typed pointer expression of type `a_type'
			-- in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY) is
			-- Report that an unqualified call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call: not an_expression.is_qualified_call
			a_query_not_void: a_query /= Void
		do
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE) is
			-- Report that an unqualified call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			unqualified_call: not an_instruction.is_qualified_call
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified procedure call (to `a_procedure') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			a_procedure_not_void: a_procedure /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT) is
			-- Report that an unqualified query call (to `a_query') agent
			-- of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			a_query_not_void: a_query /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_void_constant (an_expression: ET_VOID) is
			-- Report that a Void has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

feature -- Client/Supplier relationship

	supplier_handler: ET_SUPPLIER_HANDLER
			-- Supplier handler

	set_supplier_handler (a_handler: like supplier_handler) is
			-- Set `supplier_handler' to `a_handler'.
		do
			supplier_handler := a_handler
			type_checker.set_supplier_handler (a_handler)
		ensure
			supplier_handler_set: supplier_handler = a_handler
		end

feature {NONE} -- Client/Supplier relationship

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of an expression
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' may be altered after the execution of
			-- this routine. Therefore if you want to keep a reference to it
			-- you should duplicate it or use its base type for example.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_supplier_valid: a_supplier.is_valid_context
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_expression_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_routine: ET_ROUTINE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of `a_routine' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_routine_not_void: a_routine /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_argument_supplier (a_supplier, a_client, a_routine)
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report the fact that `a_supplier' is the type of the result
			-- of `a_query' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_query_not_void: a_query /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_result_supplier (a_supplier, a_client, a_query)
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a static call
			-- in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_static_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the explicit type of a
			-- creation instruction or expression in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_create_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_inline_agent_argument_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_inline_agent_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of the result of
			-- an inline agent in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_inline_agent_result_supplier (a_supplier, a_client, a_feature)
			end
		end

feature {NONE} -- Conversion

	convert_expression (a_source: ET_EXPRESSION; a_source_type, a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_EXPRESSION is
			-- Conversion expresion to convert `a_source' of type `a_source_type' to `a_target_type';
			-- Void if no such conversion expression.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_source_not_void: a_source /= Void
			a_source_type_not_void: a_source_type /= Void
			a_source_context_valid: a_source_type.is_valid_context
			a_target_type_not_void: a_target_type /= Void
			a_target_context_valid: a_target_type.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			l_convert_feature: ET_CONVERT_FEATURE
			l_convert_class: ET_CLASS
			l_convert_builtin_expression: ET_CONVERT_BUILTIN_EXPRESSION
			l_convert_from_expression: ET_CONVERT_FROM_EXPRESSION
			l_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			l_target_named_type: ET_NAMED_TYPE
			l_conversion_procedure: ET_PROCEDURE
			l_conversion_query: ET_QUERY
		do
			has_fatal_error := False
			if current_class = current_class_impl then
					-- Convertibility should be resolved in the implementation class.
				l_convert_feature := type_checker.convert_feature (a_source_type, a_target_type)
				if l_convert_feature = Void then
						-- Check whether `a_source' is a non-explicitly typed manifest constant which
						-- has a valid value for `a_target_type'. Useful when trying to convert the
						-- left-and-side of a binary expression.
					l_convert_feature := a_source.manifest_constant_convert_feature (a_source_type, a_target_type, current_universe)
				end
				if l_convert_feature /= Void then
					if l_convert_feature.is_convert_from then
						l_convert_class := a_target_type.base_class
						l_convert_class.process (current_system.feature_flattener)
						if not l_convert_class.features_flattened or else l_convert_class.has_flattening_error then
								-- Error already reported by the feature flattener.
							set_fatal_error
						else
							l_target_named_type := a_target_type.named_type
							create l_convert_from_expression.make (l_target_named_type, l_convert_feature, a_source)
							l_conversion_procedure := l_convert_class.seeded_procedure (l_convert_feature.name.seed)
							if l_conversion_procedure /= Void then
								report_creation_expression (l_convert_from_expression, l_target_named_type, l_conversion_procedure)
								Result := l_convert_from_expression
							else
									-- Internal error: the seed of the convert feature should correspond
									-- to a procedure of `l_convert_class'.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					elseif l_convert_feature.is_convert_to then
						l_convert_class := a_source_type.base_class
						l_convert_class.process (current_system.feature_flattener)
						if not l_convert_class.features_flattened or else l_convert_class.has_flattening_error then
								-- Error already reported by the feature flattener.
							set_fatal_error
						else
							create l_convert_to_expression.make (a_source, l_convert_feature)
							l_conversion_query := l_convert_class.seeded_query (l_convert_feature.name.seed)
							if l_conversion_query /= Void then
								report_qualified_call_expression (l_convert_to_expression, a_source_type, l_conversion_query)
								Result := l_convert_to_expression
							else
									-- Internal error: the seed of the convert feature should correspond
									-- to a query of `l_convert_class'.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					else
							-- Built-in conversion.
						l_target_named_type := a_target_type.named_type
						create l_convert_builtin_expression.make (l_target_named_type, l_convert_feature, a_source)
						report_builtin_conversion (l_convert_builtin_expression, l_target_named_type)
						Result := l_convert_builtin_expression
					end
				end
			end
		ensure
			implementation_class: Result /= Void implies (current_class = current_class_impl)
		end

feature {ET_AST_NODE} -- Processing

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_assigner_instruction_validity (an_instruction)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			check_assignment_validity (an_instruction)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			check_assignment_attempt_validity (an_instruction)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			check_attribute_validity (a_feature)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_bang_instruction_validity (an_instruction)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_binary_integer_constant_validity (a_constant, current_context)
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			check_bit_constant_validity (a_constant, current_context)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_bracket_expression_validity (an_expression, current_context)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_c1_character_constant_validity (a_constant, current_context)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_c2_character_constant_validity (a_constant, current_context)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_c3_character_constant_validity (a_constant, current_context)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			check_call_agent_validity (an_expression, current_context)
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_call_expression_validity (an_expression, current_context)
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_call_instruction_validity (an_instruction)
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_check_instruction_validity (an_instruction)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			check_constant_attribute_validity (a_feature)
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_convert_builtin_expression_validity (an_expression, current_context)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_convert_from_expression_validity (an_expression, current_context)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_convert_to_expression_validity (an_expression, current_context)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_create_expression_validity (an_expression, current_context)
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_create_instruction_validity (an_instruction)
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			check_current_validity (an_expression, current_context)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			check_current_address_validity (an_expression, current_context)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_debug_instruction_validity (an_instruction)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
			check_deferred_function_validity (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
			check_deferred_procedure_validity (a_feature)
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
			check_do_function_validity (a_feature)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_do_function_inline_agent_validity (an_expression, current_context)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			check_do_procedure_validity (a_feature)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_do_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			check_dotnet_attribute_validity (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			check_dotnet_constant_attribute_validity (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		do
			check_dotnet_function_validity (a_feature)
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
		do
			check_dotnet_procedure_validity (a_feature)
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_equality_expression_validity (an_expression, current_context)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			check_expression_address_validity (an_expression, current_context)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
			check_external_function_validity (a_feature)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_external_function_inline_agent_validity (an_expression, current_context)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			check_external_procedure_validity (a_feature)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_external_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			check_false_constant_validity (a_constant, current_context)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			check_feature_address_validity (an_expression, current_context)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_hexadecimal_integer_constant_validity (a_constant, current_context)
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
			if an_identifier.is_argument then
				check_formal_argument_validity (an_identifier, current_context)
			elseif an_identifier.is_local then
				check_local_variable_validity (an_identifier, current_context)
			elseif an_identifier.is_object_test_local then
				check_object_test_local_validity (an_identifier, current_context)
			elseif an_identifier.is_instruction then
				check_unqualified_call_instruction_validity (an_identifier)
			else
				check_unqualified_call_expression_validity (an_identifier, current_context)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_if_instruction_validity (an_instruction)
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_infix_cast_expression_validity (an_expression, current_context)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_infix_expression_validity (an_expression, current_context)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_inspect_instruction_validity (an_instruction)
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_loop_instruction_validity (an_instruction)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			check_manifest_array_validity (an_expression, current_context)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			check_manifest_tuple_validity (an_expression, current_context)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			check_manifest_type_validity (an_expression, current_context)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			check_named_object_test_validity (an_expression, current_context)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_object_equality_expression_validity (an_expression, current_context)
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			check_object_test_validity (an_expression, current_context)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_octal_integer_constant_validity (a_constant, current_context)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_old_expression_validity (an_expression, current_context)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			check_named_object_test_validity (an_expression, current_context)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			check_once_function_validity (a_feature)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_once_function_inline_agent_validity (an_expression, current_context)
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			check_once_manifest_string_validity (an_expression, current_context)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
			check_once_procedure_validity (a_feature)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			check_once_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_parenthesized_expression_validity (an_expression, current_context)
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_precursor_expression_validity (an_expression, current_context)
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_precursor_instruction_validity (an_instruction)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_prefix_expression_validity (an_expression, current_context)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_regular_integer_constant_validity (a_constant, current_context)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			check_regular_manifest_string_validity (a_string, current_context)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			check_regular_real_constant_validity (a_constant, current_context)
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			check_result_validity (an_expression, current_context)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			check_result_address_validity (an_expression, current_context)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_retry_instruction_validity (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			has_fatal_error := False
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			check_special_manifest_string_validity (a_string, current_context)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_static_call_expression_validity (an_expression, current_context)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			check_static_call_instruction_validity (an_instruction)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			check_strip_expression_validity (an_expression, current_context)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			check_true_constant_validity (a_constant, current_context)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			check_underscored_integer_constant_validity (a_constant, current_context)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			check_underscored_real_constant_validity (a_constant, current_context)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			check_unique_attribute_validity (a_feature)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			check_verbatim_string_validity (a_string, current_context)
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
			check_void_validity (an_expression, current_context)
		end

feature {NONE} -- Access

	current_feature: ET_STANDALONE_CLOSURE
			-- Feature or invariant being processed

	current_feature_impl: ET_STANDALONE_CLOSURE
			-- Feature where the code being processed has been written;
			-- It might be different from `current_feature' or even from
			-- `current_feature.implementation_feature' when
			-- processing inherited assertions. For example:
			--    deferred class A
			--    feature
			--       f (a: ANY) is
			--           require
			--               pre: g (a)
			--           deferred
			--           end
			--      g (a: ANY): BOOLEAN is deferred end
			--    end
			--    class B
			--    inherit
			--        A
			--    feature
			--        f (a: STRING) is do ... end
			--        g (a: STRING): BOOLEAN is do ... end
			--    end
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_feature' is B.f and `current_feature_impl' is A.f
			-- (where the inherited precondition has been written).

	current_inline_agent: ET_INLINE_AGENT
			-- Inline agent being processed if any, Void otherwise

	enclosing_inline_agents: DS_ARRAYED_LIST [ET_INLINE_AGENT]
			-- Enclosing inline agents of `current_inline_agent' if any

	current_closure: ET_CLOSURE is
			-- Inner closure being processed
		do
			if current_inline_agent /= Void then
				Result := current_inline_agent
			else
				Result := current_feature
			end
		ensure
			current_closure_not_void: Result /= Void
			in_agent: current_inline_agent /= Void implies Result = current_inline_agent
			not_in_agent: current_inline_agent = Void implies Result = current_feature
		end

	current_closure_impl: ET_CLOSURE is
			-- Inner closure where the code being processed has been written
		do
			if current_inline_agent /= Void then
				Result := current_inline_agent
			else
				Result := current_feature_impl
			end
		ensure
			current_closure_impl_not_void: Result /= Void
			in_agent: current_inline_agent /= Void implies Result = current_inline_agent
			not_in_agent: current_inline_agent = Void implies Result = current_feature_impl
		end

	current_type: ET_BASE_TYPE
			-- Type from which `current_feature' is processed;
			-- It may not be the type to which `current_feature'
			-- belong when processing a precursor of a feature
			-- of `current_type'. In that case `current_type' is
			-- the type where the precursor call is processed,
			-- and `current_feature' is the precursor feature
			-- implemented in a proper parent.

	current_class_impl: ET_CLASS
			-- Class where `current_feature_impl' has been written

	current_universe_impl: ET_UNIVERSE is
			-- Universe to which `current_class_impl' belongs
		do
			Result := current_class_impl.universe
		ensure
			current_universe_impl_not_void: Result /= Void
		end

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked

	current_target_type: ET_TYPE_CONTEXT
			-- Type of the target of expression being processed

feature {NONE} -- Object-tests

	current_object_test_types: DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_NAMED_OBJECT_TEST]
			-- Types of object-test locals

	current_expression_object_tests: ET_EXPRESSION_OBJECT_TESTS
			-- Object-tests appearing in the outermost expression being processed

	current_object_test_scope: ET_OBJECT_TEST_SCOPE
			-- Object-tests for which we are currently in the
			-- scope of their locals

	object_test_scope_builder: ET_OBJECT_TEST_SCOPE_BUILDER
			-- Object-tests local scope builder

feature {NONE} -- Status report

	in_rescue: BOOLEAN
			-- Are we processing a rescue clause?

	in_assertion: BOOLEAN
			-- Are we processing an assertion?

	in_precondition: BOOLEAN
			-- Are we processing a precondition?

	in_postcondition: BOOLEAN
			-- Are we processing a postcondition?

	in_invariant: BOOLEAN
			-- Are we processing an invariant?

	in_check_instruction: BOOLEAN
			-- Are we processing a check instruction?

	in_precursor: BOOLEAN
			-- Are we processing a precursor feature?

feature -- Precursors

	precursor_queries: DS_HASH_SET [ET_QUERY]
			-- Queries associated with precursor expressions succesfully processed
			-- will be added to this set when not Void

	precursor_procedures: DS_HASH_SET [ET_PROCEDURE]
			-- Procedures associated with precursor instructions succesfully processed
			-- will be added to this set when not Void

	set_precursor_queries (a_query_set: like precursor_queries) is
			-- Set `precursor_queries' to `a_query_set'.
		do
			precursor_queries := a_query_set
		ensure
			precursor_queries_set: precursor_queries = a_query_set
		end

	set_precursor_procedures (a_procedure_set: like precursor_procedures) is
			-- Set `precursor_procedures' to `a_procedure_set'.
		do
			precursor_procedures := a_procedure_set
		ensure
			precursor_procedures_set: precursor_procedures = a_procedure_set
		end

feature {NONE} -- Overloading (useful in .NET)

	keep_best_overloaded_features (a_features: DS_ARRAYED_LIST [ET_FEATURE]; an_actuals: ET_ACTUAL_ARGUMENTS; a_target_context: ET_NESTED_TYPE_CONTEXT) is
			-- Remove from `a_features' the features whose signature cannot
			-- accommodate `an_actuals'. As a result `a_features' can be
			-- empty if no feature is applicable.
			-- Then keep only the best matches. There can be several
			-- of them, in which case there is an ambiguity that should be
			-- reported by the caller of this feature.
			-- `a_target_context' is the context in which the formal argument
			-- types of features in `a_features' should be considered.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void
			an_actuals_not_void: an_actuals /= Void
			-- same_arguments_count: for all f in a_features, f.arguments_count = an_actuals.count
			a_target_context_not_void: a_target_context /= Void
		local
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context1: ET_NESTED_TYPE_CONTEXT
			l_any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
			j, nb_args: INTEGER
			i, nb: INTEGER
			k: INTEGER
			l_actual: ET_EXPRESSION
			l_type1: ET_TYPE
			l_type2: ET_TYPE
			l_feature1: ET_FEATURE
			l_feature2: ET_FEATURE
			l_same_type_mode: BOOLEAN
			l_conformance_mode: BOOLEAN
			l_conversion_mode: BOOLEAN
			l_to_be_added: BOOLEAN
			l_invalid_found: BOOLEAN
			nb_all: INTEGER
			nb_one: INTEGER
			l_old_overloaded_queries: DS_ARRAYED_LIST [ET_QUERY]
			l_old_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
		do
			has_fatal_error := False
			l_actual_context := new_context (current_type)
			l_any_type := current_universe.any_type
			nb := a_features.count
			nb_args := an_actuals.count
			if nb_args > 0 then
				if not overloaded_queries.is_empty then
						-- We use `overloaded_queries' as a shared object in order to avoid
						-- having to create such list again and again and hence putting too
						-- much stress on the GC. Here `overloaded_queries' is already used
						-- (i.e. it already contains some queries), but the call to
						-- `check_expression_validity' below might end up using it again
						-- to determine the right query if an actual argument is for example
						-- a call expression. Therefore we need to put another unused query
						-- list in place.
					l_old_overloaded_queries := overloaded_queries
					if unused_overloaded_queries_list.is_empty then
						create overloaded_queries.make (20)
					else
						overloaded_queries := unused_overloaded_queries_list.last
						unused_overloaded_queries_list.remove_last
					end
				end
				if not overloaded_procedures.is_empty then
						-- We use `overloaded_procedures' as a shared object in order to avoid
						-- having to create such list again and again and hence putting too
						-- much stress on the GC. Here `overloaded_procedures' is already used
						-- (i.e. it already contains some procedures), but the call to
						-- `check_expression_validity' below might end up using it again
						-- to determine the right creation procedure if an actual argument is
						-- for example a creation expression. Therefore we need to put another
						-- unused procedure list in place.
					l_old_overloaded_procedures := overloaded_procedures
					if unused_overloaded_procedures_list.is_empty then
						create overloaded_procedures.make (20)
					else
						overloaded_procedures := unused_overloaded_procedures_list.last
						unused_overloaded_procedures_list.remove_last
					end
				end
			end
			from j := 1 until j > nb_args loop
				l_actual := an_actuals.actual_argument (j)
				check_expression_validity (l_actual, l_actual_context, l_any_type)
				if has_fatal_error then
					had_error := True
				end
				if not had_error then
					l_same_type_mode := False
					l_conformance_mode := False
					l_conversion_mode := True
					from i := nb until i < 1 loop
						l_feature1 := a_features.item (i)
						l_type1 := l_feature1.arguments.formal_argument (j).type
						if l_actual_context.same_named_type (l_type1, a_target_context) then
								-- The type of the actual argument is the same as
								-- the type of the formal argument of `l_feature'.
							if l_same_type_mode then
								best_overloaded_features.force_last (l_feature1)
							else
								l_same_type_mode := True
								l_conformance_mode := False
								l_conversion_mode := False
								best_overloaded_features.wipe_out
								best_overloaded_features.force_last (l_feature1)
							end
						elseif l_actual_context.conforms_to_type (l_type1, a_target_context) then
								-- The type of the actual argument conforms to
								-- the type of the formal argument of `l_feature1'.
							if l_same_type_mode then
								-- Do nothing.
							elseif l_conformance_mode then
								l_to_be_added := True
								k := best_overloaded_features.count
								from until k < 1 loop
									l_feature2 := best_overloaded_features.item (k)
									l_type2 := l_feature2.arguments.formal_argument (j).type
									if l_type2.same_named_type (l_type1, a_target_context, a_target_context) then
											-- No difference between `l_feature1' and `l_feature2'.
											-- If `l_feature2' is considered as one of the best choices,
											-- `l_feature1' should be as well.
										k := 0 -- Jump out of the loop.
									elseif l_type2.conforms_to_type (l_type1, a_target_context, a_target_context) then
											-- `l_feature2' is a better choice.
										l_to_be_added := False
										k := 0 -- Jump out of the loop.
									elseif l_type1.conforms_to_type (l_type2, a_target_context, a_target_context) then
											-- `l_feature1' is a better choice.
										best_overloaded_features.remove (k)
									end
									k := k - 1
								end
								if l_to_be_added then
									best_overloaded_features.force_last (l_feature1)
								end
							else
								l_same_type_mode := False
								l_conformance_mode := True
								l_conversion_mode := False
								best_overloaded_features.wipe_out
								best_overloaded_features.force_last (l_feature1)
							end
						else
							l_formal_context1 := a_target_context
							l_formal_context1.force_last (l_type1)
							if type_checker.convert_feature (l_actual_context, l_formal_context1) /= Void then
									-- The type of the actual argument converts to
									-- the type of the formal argument of `l_feature1'.
								if l_conversion_mode then
									best_overloaded_features.force_last (l_feature1)
								end
							else
									-- The type of the actual argument does not conform nor
									-- convert to the formal argument of `l_feature1'.
									-- Remove this feature from the list.
								a_features.remove (i)
								nb := nb - 1
								if i <= nb_all then
									l_invalid_found := True
									nb_all := nb_all - 1
									nb_one := nb_one - 1
								elseif i <= nb_one then
									l_invalid_found := True
									nb_one := nb_one - 1
								end
							end
							l_formal_context1.remove_last
						end
						i := i - 1
					end
					if not l_invalid_found then
							-- Features are sorted in `a_features' as follows:
							-- * from 1 to `nb_all': features which were part of the best
							-- overloaded features for all arguments processed so far.
							-- * from `nb_all' + 1 to `nb_one': features which were part
							-- of the best overloaded features for at least one argument
							-- processed so far.
							-- * from `nb_one' + 1 to `nb': features which were not part
							-- of the best overloaded features for none of the arguments
							-- processed so far.
						if j = 1 then
							nb_all := best_overloaded_features.count
							from i := 1 until nb_one = nb_all loop
								if best_overloaded_features.has (a_features.item (i)) then
									nb_one := nb_one + 1
									a_features.swap (i, nb_one)
								end
								i := i + 1
							end
						else
							from i := 1 until i > nb_all loop
								if best_overloaded_features.has (a_features.item (i)) then
									i := i + 1
								else
									a_features.swap (i, nb_all)
									nb_all := nb_all - 1
								end
							end
							from i := nb_one + 1 until i > nb loop
								if best_overloaded_features.has (a_features.item (i)) then
									nb_one := nb_one + 1
									a_features.swap (i, nb_one)
								end
								i := i + 1
							end
						end
					else
							-- We found invalid features (i.e. with wrong signature) which were
							-- selected as one of the best choices for at least one of the previous
							-- arguments. We need to run the process again on all arguments because
							-- other features may qualify as best choice now that we removed these
							-- invalid features.
						l_invalid_found := False
						nb_all := 0
						nb_one := 0
						j := 0
					end
					best_overloaded_features.wipe_out
				end
				l_actual_context.wipe_out
				j := j + 1
			end
			free_context (l_actual_context)
			if l_old_overloaded_queries /= Void then
				unused_overloaded_queries_list.force_last (overloaded_queries)
				overloaded_queries := l_old_overloaded_queries
			end
			if l_old_overloaded_procedures /= Void then
				unused_overloaded_procedures_list.force_last (overloaded_procedures)
				overloaded_procedures := l_old_overloaded_procedures
			end
			if had_error then
				set_fatal_error
				a_features.wipe_out
			elseif nb_args > 0 then
				if nb_all > 0 then
					a_features.keep_first (nb_all)
				elseif nb_one > 0 then
					a_features.keep_first (nb_one)
				else
					a_features.wipe_out
				end
			end
		ensure
			no_void_feature: not a_features.has_void
		end

	overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- List of overloaded procedures for a given name
			-- (useful in .NET)
			-- (`overloaded_procedures' is created once and for all and then used and
			-- reused by which ever feature which need it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- `overloaded_procedures' at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_procedures_list'.)

	unused_overloaded_procedures_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_PROCEDURE]]
			-- List of not currently used lists of overloaded procedures for a given name
			-- (useful in .NET)
			-- (`overloaded_procedures' is created once and for all and then used and
			-- reused by which ever feature which need it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- `overloaded_procedures' at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_procedures_list'.)

	overloaded_queries: DS_ARRAYED_LIST [ET_QUERY]
			-- List of overloaded queries for a given name
			-- (useful in .NET)
			-- (`overloaded_queries' is created once and for all and then used and
			-- reused by which ever feature which need it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- `overloaded_queries' at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_queries_list'.)

	unused_overloaded_queries_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_QUERY]]
			-- List of not currently used lists of overloaded queries for a given name
			-- (useful in .NET)
			-- (`overloaded_queries' is created once and for all and then used and
			-- reused by which ever feature which need it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- `overloaded_queries' at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_queries_list'.)

	best_overloaded_features: DS_ARRAYED_LIST [ET_FEATURE]
			-- List of best overloaded features for a given argument
			-- (useful in .NET)
			-- (This object is created once and for all and then used and reused
			-- by which ever feature which needs it. This avoid putting too much
			-- stress on the GC by creating a new object each time we need one.
			-- Therefore, beware of not having two different feature calls using
			-- this object at the same time.)

feature {NONE} -- Type contexts

	new_context (a_root_context: ET_BASE_TYPE): ET_NESTED_TYPE_CONTEXT is
			-- New nested type context
		require
			a_root_context_not_void: a_root_context /= Void
			a_root_context_valid: a_root_context.is_valid_context
		do
			if unused_contexts.is_empty then
				create Result.make_with_capacity (a_root_context, 10)
			else
				Result := unused_contexts.last
				unused_contexts.remove_last
				Result.reset (a_root_context)
			end
		ensure
			new_context_not_void: Result /= Void
			root_context_set: Result.root_context = a_root_context
			is_empty: Result.is_empty
		end

	free_context (a_context: ET_NESTED_TYPE_CONTEXT) is
			-- Free `a_context' so that it can be reused.
		require
			a_context_not_void: a_context /= Void
		do
			unused_contexts.force_last (a_context)
			a_context.reset (tokens.unknown_class)
		end

	unused_contexts: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			-- Contexts that are not currently used

feature {NONE} -- Constants

	dummy_feature: ET_FEATURE is
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

	dummy_expression: ET_EXPRESSION is
			-- Dummy expression
		once
			create {ET_CURRENT} Result.make
		ensure
			dummy_expression_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void
	current_feature_impl_not_void: current_feature_impl /= Void
	current_feature_impl_constraint: current_feature_impl = current_feature_impl.implementation_feature
	enclosing_inline_agents_not_void: enclosing_inline_agents /= Void
	no_void_enclosing_inline_agent: not enclosing_inline_agents.has_void
	current_type_not_void: current_type /= Void
	current_type_valid: current_type.is_valid_context
	current_class_definition: current_class = current_type.base_class
	current_class_impl_not_void: current_class_impl /= Void
	current_class_impl_definition: current_class_impl = current_feature_impl.implementation_class
	-- implementation_checked: if inherited, then the code being analyzed has already been checked in implementation class of `current_feature_impl'
	type_checker_not_void: type_checker /= Void
	overloaded_procedures_not_void: overloaded_procedures /= Void
	no_void_overloaded_procedure: not overloaded_procedures.has_void
	unused_overloaded_procedures_list_not_void: unused_overloaded_procedures_list /= Void
	no_void_unused_overloaded_procedures: not unused_overloaded_procedures_list.has_void
	-- SE 1.2r7 crashes when compiling this line:
	-- empty_unused_overloaded_procedures: unused_overloaded_procedures_list.for_all (agent {DS_ARRAYED_LIST [ET_PROCEDURE]}.is_empty)
	overloaded_queries_not_void: overloaded_queries /= Void
	no_void_overloaded_queries: not overloaded_queries.has_void
	unused_overloaded_queries_list_not_void: unused_overloaded_queries_list /= Void
	no_void_unused_overloaded_queries: not unused_overloaded_queries_list.has_void
	-- SE 1.2r7 crashes when compiling this line:
	-- empty_unused_overloaded_queries: unused_overloaded_queries_list.for_all (agent {DS_ARRAYED_LIST [ET_QUERY]}.is_empty)
	best_overloaded_features_not_void: best_overloaded_features /= Void
	no_void_best_overloaded_feature: not best_overloaded_features.has_void
	current_context_not_void: current_context /= Void
	unused_contexts_not_void: unused_contexts /= Void
	no_void_unused_context: not unused_contexts.has_void
	current_target_type_not_void: current_target_type /= Void
		-- Object-tests
	current_object_test_types_not_void: current_object_test_types /= Void
	no_void_object_test_type: not current_object_test_types.has_void_item
	current_object_test_scope_not_void: current_object_test_scope /= Void
	object_test_scope_builder_not_void: object_test_scope_builder /= Void
	current_expression_object_tests_not_void: current_expression_object_tests /= Void

end
