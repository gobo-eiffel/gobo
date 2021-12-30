note

	description:

		"Eiffel feature validity checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2021, Eric Bezault and others"
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
		rename
			make as make_ast_processor
		redefine
			process_across_expression,
			process_across_instruction,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_binary_integer_constant,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
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
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_expression_address,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_if_expression,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_expression,
			process_inspect_instruction,
			process_iteration_cursor,
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
			process_parenthesis_expression,
			process_parenthesis_instruction,
			process_parenthesized_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_quantifier_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_repeat_instruction,
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
			process_unqualified_call_expression,
			process_unqualified_call_instruction,
			process_verbatim_string,
			process_void
		end

	ET_SHARED_STANDARD_ONCE_KEYS
		export {NONE} all end

	KL_SHARED_PLATFORM
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new feature validity checker.
		do
			precursor (a_system_processor)
			create type_checker.make (a_system_processor)
			current_type := current_class
			current_feature := dummy_feature
			current_feature_impl := dummy_feature.implementation_feature
			current_class_impl := current_feature_impl.implementation_class
				-- Inline agents.
			create enclosing_inline_agents.make (10)
				-- .NET overloading.
			create unused_overloaded_procedures_list.make (10)
			create unused_overloaded_queries_list.make (10)
			create unused_overloaded_features_list.make (10)
				-- Call infos.
			create unused_call_infos.make (20)
				-- Type contexts.
			create unused_contexts.make (20)
			current_context := new_context (current_type)
			current_target_type := tokens.unknown_class
			free_context (current_context)
				-- Object-tests.
			create current_object_test_types.make_map (50)
			create current_object_test_scope.make
			create object_test_scope_builder.make (a_system_processor)
				-- Iteration components.
			create current_iteration_cursor_types.make_map (50)
			create current_iteration_item_types.make_map (50)
			create current_iteration_item_scope.make
				-- Attachments.
			create current_initialization_scope.make
			create current_attachment_scope.make
			create attachment_scope_builder.make
			create unused_attachment_scopes.make (40)
			create assertions_by_feature.make_map (30)
				-- Common Ancestor Types.
			create common_ancestor_type_list.make (500)
				-- Indexing.
			create indexing_term_list.make (10)
				-- Default creation call.
			create default_creation_call_name.make (tokens.default_create_feature_name.name)
			default_creation_call_name.set_seed (current_system.default_create_seed)
			create default_creation_call.make (default_creation_call_name, Void)
				-- VAPE validity check.
			create vape_non_descendant_clients.make_with_capacity (20)
			create vape_creation_clients.make_with_capacity (20)
			create vape_client.make (current_class.name, current_class)
				-- Adapted classes.
			create unused_adapted_base_classes.make (100)
			create adapted_base_class_checker.make (a_system_processor)
		end

feature -- Status report

	implementation_checked (a_feature: ET_STANDALONE_CLOSURE): BOOLEAN
			-- Has the implementation of `a_feature' been checked?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_precondition then
				if attached a_feature.implementation_feature.preconditions as l_preconditions then
					Result := l_preconditions.validity_checked
				else
					Result := True
				end
			elseif in_postcondition then
				if attached a_feature.implementation_feature.postconditions as l_postconditions then
					Result := l_postconditions.validity_checked
				else
					Result := True
				end
			else
				Result := a_feature.implementation_feature.validity_checked
			end
		end

	has_implementation_error (a_feature: ET_STANDALONE_CLOSURE): BOOLEAN
			-- Has a fatal error occurred during checking
			-- of implementation of `a_feature'?
		require
			a_feature_not_void: a_feature /= Void
		do
			if in_precondition then
				if attached a_feature.implementation_feature.preconditions as l_preconditions then
					Result := l_preconditions.has_validity_error
				end
			elseif in_postcondition then
				if attached a_feature.implementation_feature.postconditions as l_postconditions then
					Result := l_postconditions.has_validity_error
				end
			else
				Result := a_feature.implementation_feature.has_validity_error
			end
		end

feature -- Validity checking

	check_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE)
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
			l_old_has_error: BOOLEAN
			old_in_static_feature: BOOLEAN
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
			elseif l_feature_impl.validity_checked then
					-- This feature has already been checked in the
					-- context of its implementation class.
				if l_feature_impl.has_validity_error then
						-- The error should have already been reported.
					set_fatal_error
				end
			elseif l_class_impl /= l_class or else not a_current_type.same_as_base_class then
					-- Check the validity of this feature in the
					-- context of its implementation class.
				check_feature_validity (l_feature_impl, l_class_impl)
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
				current_class.process (system_processor.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				elseif current_class.implementation_checked and then current_class.has_implementation_error and then not current_class.is_checking_implementation then
						-- An implementation error has already been found when checking
						-- all features of this class. This can happen when calling 'gec'
						-- in full class checking mode. In that case, we don't want flat
						-- Degree 3 errors to be reported twice.
					set_fatal_error
				else
					if current_system.attachment_type_conformance_mode then
						if l_class = l_class_impl then
							if attached l_feature_impl.preconditions as l_preconditions and then not l_preconditions.validity_checked then
									-- Make sure to mark as boolean expression infix and prefix expressions
									-- with target of type BOOLEAN.
								l_old_has_error := has_fatal_error
								feature_checker.check_preconditions_validity (l_preconditions, l_feature_impl, l_feature_impl, l_class_impl)
								has_fatal_error := l_old_has_error
							end
						end
						build_preconditions_attachment_scope (a_feature)
					end
					old_in_static_feature := in_static_feature
					in_static_feature := a_feature.is_static
					a_feature.process (Current)
					in_static_feature := old_in_static_feature
					if current_type = current_class_impl then
						a_feature.set_validity_checked
						if has_fatal_error then
							a_feature.set_validity_error
						end
					end
				end
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				from current_iteration_cursor_types.start until current_iteration_cursor_types.after loop
					free_context (current_iteration_cursor_types.item_for_iteration)
					current_iteration_cursor_types.forth
				end
				current_iteration_cursor_types.wipe_out
				from current_iteration_item_types.start until current_iteration_item_types.after loop
					if not current_iteration_item_types.key_for_iteration.has_cursor_name then
							-- Do not free this context more than once if it
							-- was already in `current_iteration_cursor_types'.
						free_context (current_iteration_item_types.item_for_iteration)
					end
					current_iteration_item_types.forth
				end
				current_iteration_item_types.wipe_out
				current_iteration_item_scope.wipe_out
				current_attachment_scope.wipe_out
				current_initialization_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_precursor_feature_validity (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE)
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
		a_current_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE)
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
			old_in_precondition: BOOLEAN
			old_in_static_feature: BOOLEAN
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
			l_old_object_test_scope: INTEGER
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
			elseif a_preconditions.validity_checked then
					-- These preconditions have already been checked in the
					-- context of their implementation class.
				if a_preconditions.has_validity_error then
						-- The error should have already been reported.
					set_fatal_error
				end
			elseif l_class_impl /= l_current_class or else not a_current_type.same_as_base_class then
				check_preconditions_validity (a_preconditions, l_feature_impl, l_feature_impl, l_class_impl)
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
				old_in_static_feature := in_static_feature
				in_static_feature := not (a_current_feature.is_constant_attribute or a_current_feature.is_unique_attribute) and then a_current_feature.is_static
				old_in_precondition := in_precondition
				in_precondition := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (system_processor.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					l_old_object_test_scope := current_object_test_scope.count
					nb := a_preconditions.count
					from i := 1 until i > nb loop
						if attached a_preconditions.assertion (i).expression as l_expression then
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
							object_test_scope_builder.build_scope (l_expression, current_object_test_scope, current_class_impl)
							has_fatal_error := has_fatal_error or object_test_scope_builder.has_fatal_error
							if current_system.attachment_type_conformance_mode then
								attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
							end
						end
						i := i + 1
					end
					current_object_test_scope.keep_object_tests (l_old_object_test_scope)
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
					if current_type = current_class_impl then
						a_preconditions.set_validity_checked
						if has_fatal_error then
							a_preconditions.set_validity_error
						end
					end
				end
				in_precondition := old_in_precondition
				in_static_feature := old_in_static_feature
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				from current_iteration_cursor_types.start until current_iteration_cursor_types.after loop
					free_context (current_iteration_cursor_types.item_for_iteration)
					current_iteration_cursor_types.forth
				end
				current_iteration_cursor_types.wipe_out
				from current_iteration_item_types.start until current_iteration_item_types.after loop
					if not current_iteration_item_types.key_for_iteration.has_cursor_name then
							-- Do not free this context more than once if it
							-- was already in `current_iteration_cursor_types'.
						free_context (current_iteration_item_types.item_for_iteration)
					end
					current_iteration_item_types.forth
				end
				current_iteration_item_types.wipe_out
				current_iteration_item_scope.wipe_out
				current_attachment_scope.wipe_out
				current_initialization_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_postconditions_validity (a_postconditions: ET_POSTCONDITIONS;
		a_current_feature_impl, a_current_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE)
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
			old_in_postcondition: BOOLEAN
			old_in_static_feature: BOOLEAN
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
			l_old_object_test_scope: INTEGER
			l_old_has_error: BOOLEAN
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
			elseif a_postconditions.validity_checked then
					-- These postconditions have already been checked in the
					-- context of their implementation class.
				if a_postconditions.has_validity_error then
						-- The error should have already been reported.
					set_fatal_error
				end
			elseif l_class_impl /= l_current_class or else not a_current_type.same_as_base_class then
				check_postconditions_validity (a_postconditions, l_feature_impl, l_feature_impl, l_class_impl)
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
				old_in_static_feature := in_static_feature
				in_static_feature := not (a_current_feature.is_constant_attribute or a_current_feature.is_unique_attribute) and then a_current_feature.is_static
				old_in_postcondition := in_postcondition
				in_postcondition := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (system_processor.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					if current_system.attachment_type_conformance_mode then
						if l_current_class = l_class_impl then
							if attached l_feature_impl.preconditions as l_preconditions and then not l_preconditions.validity_checked then
									-- Make sure to mark as boolean expression infix and prefix expressions
									-- with target of type BOOLEAN.
								l_old_has_error := has_fatal_error
								feature_checker.check_preconditions_validity (l_preconditions, l_feature_impl, l_feature_impl, l_class_impl)
								has_fatal_error := l_old_has_error
							end
						end
						build_preconditions_attachment_scope (l_feature_impl)
					end
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					l_old_object_test_scope := current_object_test_scope.count
					nb := a_postconditions.count
					from i := 1 until i > nb loop
						if attached a_postconditions.assertion (i).expression as l_expression then
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
								-- in the same postcondition clause because it's as if they were separated
								-- by "and then" operators.
							object_test_scope_builder.build_scope (l_expression, current_object_test_scope, current_class_impl)
							has_fatal_error := has_fatal_error or object_test_scope_builder.has_fatal_error
							if current_system.attachment_type_conformance_mode then
								attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
							end
						end
						i := i + 1
					end
					current_object_test_scope.keep_object_tests (l_old_object_test_scope)
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
					if current_type = current_class_impl then
						a_postconditions.set_validity_checked
						if has_fatal_error then
							a_postconditions.set_validity_error
						end
					end
				end
				in_postcondition := old_in_postcondition
				in_static_feature := old_in_static_feature
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				from current_iteration_cursor_types.start until current_iteration_cursor_types.after loop
					free_context (current_iteration_cursor_types.item_for_iteration)
					current_iteration_cursor_types.forth
				end
				current_iteration_cursor_types.wipe_out
				from current_iteration_item_types.start until current_iteration_item_types.after loop
					if not current_iteration_item_types.key_for_iteration.has_cursor_name then
							-- Do not free this context more than once if it
							-- was already in `current_iteration_cursor_types'.
						free_context (current_iteration_item_types.item_for_iteration)
					end
					current_iteration_item_types.forth
				end
				current_iteration_item_types.wipe_out
				current_iteration_item_scope.wipe_out
				current_attachment_scope.wipe_out
				current_initialization_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

	check_invariants_validity (an_invariants: ET_INVARIANTS; a_current_type: ET_BASE_TYPE)
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
			old_in_invariant: BOOLEAN
			i, nb: INTEGER
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_class_impl: ET_CLASS
			l_current_class: ET_CLASS
			l_old_object_test_scope: INTEGER
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
			elseif an_invariants.validity_checked then
					-- These invariants have already been checked in the
					-- context of their implementation class.
				if an_invariants.has_validity_error then
						-- The error should have already been reported.
					set_fatal_error
				end
			elseif l_class_impl /= l_current_class or else not a_current_type.same_as_base_class then
				check_invariants_validity (an_invariants, l_class_impl)
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
				old_in_invariant := in_invariant
				in_invariant := True
					-- First, make sure that the interface of `current_type' is valid.
				current_class.process (system_processor.interface_checker)
				if not current_class.interface_checked or else current_class.has_interface_error then
						-- The error should have already been reported.
					set_fatal_error
				else
					boolean_type := current_universe_impl.boolean_type
					l_assertion_context := new_context (current_type)
					l_old_object_test_scope := current_object_test_scope.count
					nb := an_invariants.count
					from i := 1 until i > nb loop
						if attached an_invariants.assertion (i).expression as l_expression then
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
								-- in the same invariant clause because it's as if they were separated
								-- by "and then" operators.
							object_test_scope_builder.build_scope (l_expression, current_object_test_scope, current_class_impl)
							has_fatal_error := has_fatal_error or object_test_scope_builder.has_fatal_error
							if current_system.attachment_type_conformance_mode then
								attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
							end
						end
						i := i + 1
					end
					current_object_test_scope.keep_object_tests (l_old_object_test_scope)
					free_context (l_assertion_context)
					has_fatal_error := has_fatal_error or had_error
					if current_class = current_class_impl then
						an_invariants.set_validity_checked
						if has_fatal_error then
							an_invariants.set_validity_error
						end
					end
				end
				in_invariant := old_in_invariant
				from current_object_test_types.start until current_object_test_types.after loop
					free_context (current_object_test_types.item_for_iteration)
					current_object_test_types.forth
				end
				current_object_test_types.wipe_out
				current_object_test_scope.wipe_out
				from current_iteration_cursor_types.start until current_iteration_cursor_types.after loop
					free_context (current_iteration_cursor_types.item_for_iteration)
					current_iteration_cursor_types.forth
				end
				current_iteration_cursor_types.wipe_out
				from current_iteration_item_types.start until current_iteration_item_types.after loop
					if not current_iteration_item_types.key_for_iteration.has_cursor_name then
							-- Do not free this context more than once if it
							-- was already in `current_iteration_cursor_types'.
						free_context (current_iteration_item_types.item_for_iteration)
					end
					current_iteration_item_types.forth
				end
				current_iteration_item_types.wipe_out
				current_iteration_item_scope.wipe_out
				current_attachment_scope.wipe_out
				current_initialization_scope.wipe_out
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

feature {NONE} -- Feature validity

	check_attribute_validity (a_feature: ET_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
			if not has_fatal_error then
				report_result_declaration (l_type)
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if a_feature.is_static then
					-- Error: attributes cannot be used in static calls.
				set_fatal_error
				error_handler.report_vucr0a_error (current_class, a_feature)
				had_error := True
			end
			has_fatal_error := had_error
		end

	check_constant_attribute_validity (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			l_constant: ET_CONSTANT
			l_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
			if not has_fatal_error then
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_constant := a_feature.constant
				if l_constant.is_boolean_constant then
					if not l_type.same_named_type (current_universe_impl.boolean_type, current_type, current_class_impl) then
						set_fatal_error
						error_handler.report_vqmc1a_error (current_class, current_class_impl, a_feature)
					end
				elseif attached {ET_CHARACTER_CONSTANT} l_constant as l_character_constant then
					if l_character_constant.cast_type /= Void then
							-- Check that the cast type is valid, and that the manifest value
							-- is representable as an instance of the cast type.
						l_context := new_context (current_type)
						check_character_constant_validity (l_character_constant, l_context)
						had_error := had_error or has_fatal_error
						free_context (l_context)
					end
					if current_universe_impl.character_8_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_character_constant.is_character_8 then
							set_fatal_error
							error_handler.report_vqmc2b_error (current_class, current_class_impl, a_feature, l_character_constant)
						end
						l_character_constant.set_type (current_universe_impl.character_8_type)
					elseif current_universe_impl.character_32_type.same_named_type (l_type, current_type, current_class_impl) then
						if not l_character_constant.is_character_32 then
							set_fatal_error
							error_handler.report_vqmc2b_error (current_class, current_class_impl, a_feature, l_character_constant)
						end
						l_character_constant.set_type (current_universe_impl.character_32_type)
					else
						set_fatal_error
						error_handler.report_vqmc2a_error (current_class, current_class_impl, a_feature)
					end
				elseif attached {ET_INTEGER_CONSTANT} l_constant as l_integer_constant then
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
				elseif attached {ET_REAL_CONSTANT} l_constant as l_real_constant then
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
				elseif attached {ET_MANIFEST_STRING} l_constant as l_string_constant then
					if l_string_constant.cast_type /= Void then
							-- Check that the cast type is valid, and that the manifest value
							-- is representable as an instance of the cast type.
						l_context := new_context (current_type)
						check_manifest_string_validity (l_string_constant, l_context)
						had_error := had_error or has_fatal_error
						free_context (l_context)
					end
					if current_universe_impl.string_8_type.same_named_type_with_type_marks (l_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_class_impl) then
						if not l_string_constant.is_string_8 then
							set_fatal_error
							error_handler.report_vqmc5b_error (current_class, current_class_impl, a_feature, l_string_constant)
						end
						l_string_constant.set_type (current_universe_impl.string_8_type)
					elseif current_universe_impl.immutable_string_8_type.same_named_type_with_type_marks (l_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_class_impl) then
						if not l_string_constant.is_string_8 then
							set_fatal_error
							error_handler.report_vqmc5b_error (current_class, current_class_impl, a_feature, l_string_constant)
						end
						l_string_constant.set_type (current_universe_impl.immutable_string_8_type)
					elseif current_universe_impl.string_32_type.same_named_type_with_type_marks (l_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_class_impl) then
						if not l_string_constant.is_string_32 then
							set_fatal_error
							error_handler.report_vqmc5b_error (current_class, current_class_impl, a_feature, l_string_constant)
						end
						l_string_constant.set_type (current_universe_impl.string_32_type)
					elseif current_universe_impl.immutable_string_32_type.same_named_type_with_type_marks (l_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_class_impl) then
						if not l_string_constant.is_string_32 then
							set_fatal_error
							error_handler.report_vqmc5b_error (current_class, current_class_impl, a_feature, l_string_constant)
						end
						l_string_constant.set_type (current_universe_impl.immutable_string_32_type)
					elseif current_universe_impl.system_string_type.base_class.is_dotnet and then current_universe_impl.system_string_type.same_named_type_with_type_marks (l_type, tokens.implicit_attached_type_mark, current_type, tokens.implicit_attached_type_mark, current_class_impl) then
							-- OK: this is an Eiffel for .NET extension.
						l_string_constant.set_type (current_universe_impl.system_string_type)
					else
						set_fatal_error
						error_handler.report_vqmc5a_error (current_class, current_class_impl, a_feature)
					end
				else
						-- Internal error: no other kind of constant.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
			has_fatal_error := has_fatal_error or had_error
		end

	check_deferred_function_validity (a_feature: ET_DEFERRED_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_deferred_procedure_validity (a_feature: ET_DEFERRED_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_do_function_validity (a_feature: ET_DO_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			l_compound: detachable ET_COMPOUND
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.locals as l_locals then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				l_rescue_compound := a_feature.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if current_system.attachment_type_conformance_mode then
					if not l_type.is_type_detachable (current_type) and not l_type.is_type_expanded (current_type) then
						if system_processor.is_ise and then current_attachment_scope.has_result then
								-- In ISE Eiffel, local variables (including 'Result') are considered
								-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								-- Here we know that 'Result' is attached anyway.
						elseif current_initialization_scope.has_result then
								-- 'Result' entity declared as attached is correctly initialized
								-- at the end of the body the function.
						elseif not current_initialization_scope.is_code_unreachable then
								-- Starting with ISE 7.0.8.7345, void-safety errors in
								-- unreachable code are not reported.
							had_error := True
							set_fatal_error
							error_handler.report_vevi0c_error (current_class, current_class_impl, a_feature)
						end
					end
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
			has_fatal_error := had_error
		end

	check_do_procedure_validity (a_feature: ET_DO_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_compound: detachable ET_COMPOUND
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.locals as l_locals then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				l_rescue_compound := a_feature.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
			has_fatal_error := had_error
		end

	check_dotnet_attribute_validity (a_feature: ET_DOTNET_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		do
			check_attribute_validity (a_feature)
		end

	check_dotnet_constant_attribute_validity (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		do
			check_constant_attribute_validity (a_feature)
		end

	check_dotnet_function_validity (a_feature: ET_DOTNET_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_dotnet_procedure_validity (a_feature: ET_DOTNET_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_extended_attribute_validity (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			l_compound: detachable ET_COMPOUND
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.locals as l_locals then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := a_feature.compound
				l_rescue_compound := a_feature.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if current_system.attachment_type_conformance_mode then
					if a_feature.has_self_initializing_code then
							-- Check that the 'Result' entity has been initialized when
							-- declared as attached only when it has code (other than
							-- just pre- and postcondition). Otherwise we consider that
							-- it is not an initialization declaration.
						if not l_type.is_type_detachable (current_type) and not l_type.is_type_expanded (current_type) then
							if system_processor.is_ise and then current_attachment_scope.has_result then
									-- In ISE Eiffel, local variables (including 'Result') are considered
									-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
									-- Here we know that 'Result' is attached anyway.
							elseif not current_initialization_scope.has_result then
									-- Error: 'Result' entity declared as attached is not initialized
									-- at the end of the body of the attribute.
								had_error := True
								set_fatal_error
								error_handler.report_vevi0e_error (current_class, current_class_impl, a_feature)
							end
						end
						if l_type.is_type_self_initializing (current_type) then
								-- The self-initializing code will never be executed
								-- because the type of the attribute type is self-initializing
								-- (see semantics rule MEVS, in ECMA-367 3-36, section 8.19.20).
								-- This is not considered as a fatal error.
							error_handler.report_vwab0a_error (current_class, current_class_impl, a_feature)
						end
					end
				elseif a_feature.has_self_initializing_code and l_type.is_type_self_initializing (current_type) then
						-- The self-initializing code will never be executed
						-- because the type of the attribute type is self-initializing
						-- (see semantics rule MEVS, in ECMA-367 3-36, section 8.19.20).
						-- This is not considered as a fatal error.
					error_handler.report_vwab0a_error (current_class, current_class_impl, a_feature)
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
			if a_feature.is_static then
					-- Error: attributes cannot be used in static calls.
				set_fatal_error
				error_handler.report_vucr0a_error (current_class, a_feature)
				had_error := True
			end
			has_fatal_error := had_error
		end

	check_external_function_validity (a_feature: ET_EXTERNAL_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_external_procedure_validity (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			has_fatal_error := had_error
		end

	check_once_function_validity (a_feature: ET_ONCE_FUNCTION)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			l_compound: detachable ET_COMPOUND
			had_key_error: BOOLEAN
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
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
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.locals as l_locals then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			check_once_keys_validity (a_feature.keys, a_feature.first_indexing)
			had_key_error := has_fatal_error
			if not had_error then
				l_compound := a_feature.compound
				l_rescue_compound := a_feature.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if current_system.attachment_type_conformance_mode then
					if not l_type.is_type_detachable (current_type) and not l_type.is_type_expanded (current_type) then
						if system_processor.is_ise and then current_attachment_scope.has_result then
								-- In ISE Eiffel, local variables (including 'Result') are considered
								-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								-- Here we know that 'Result' is attached anyway.
						elseif current_initialization_scope.has_result then
								-- 'Result' entity declared as attached is correctly initialized
								-- at the end of the body the function.
						elseif not current_initialization_scope.is_code_unreachable then
								-- Starting with ISE 7.0.8.7345, void-safety errors in
								-- unreachable code are not reported.
							had_error := True
							set_fatal_error
							error_handler.report_vevi0c_error (current_class, current_class_impl, a_feature)
						end
					end
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
			if a_feature.is_static and a_feature.is_once_per_object then
					-- Error: once-per-object features cannot be used in static calls.
				set_fatal_error
				error_handler.report_vucr0b_error (current_class, a_feature)
				had_error := True
			end
			has_fatal_error := had_error or had_key_error
		end

	check_once_procedure_validity (a_feature: ET_ONCE_PROCEDURE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_compound: detachable ET_COMPOUND
			had_key_error: BOOLEAN
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			if attached a_feature.arguments as l_arguments then
				check_formal_arguments_validity (l_arguments, a_feature)
				had_error := has_fatal_error
			end
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.locals as l_locals then
				check_locals_validity (l_locals, a_feature)
				had_error := had_error or has_fatal_error
			end
			check_once_keys_validity (a_feature.keys, a_feature.first_indexing)
			had_key_error := has_fatal_error
			if not had_error then
				l_compound := a_feature.compound
				l_rescue_compound := a_feature.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
			if a_feature.is_static and a_feature.is_once_per_object then
					-- Error: once-per-object features cannot be used in static calls.
				set_fatal_error
				error_handler.report_vucr0b_error (current_class, a_feature)
				had_error := True
			end
			has_fatal_error := had_error or had_key_error
		end

	check_unique_attribute_validity (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Check validity of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			l_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_feature.type
			check_query_type_validity (l_type, a_feature)
			if not has_fatal_error then
				if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
				else
					report_result_supplier (l_type, current_class, a_feature)
				end
			end
			had_error := has_fatal_error
			if attached a_feature.object_tests as l_object_tests then
				check_object_tests_validity (l_object_tests, a_feature)
				had_error := had_error or has_fatal_error
			end
			if attached a_feature.iteration_components as l_iteration_components then
				check_iteration_components_validity (l_iteration_components, a_feature)
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

feature {NONE} -- Locals/Formal arguments/query type validity

	check_query_type_validity (a_type: ET_TYPE; a_query: ET_QUERY)
			-- Check validity of `a_type' of `a_query'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_query_not_void: a_query /= Void
			a_query_type: a_query.type = a_type
			consistent: a_query = current_feature
		do
			has_fatal_error := False
			if attached a_query.implementation_feature.type as l_type_impl then
				check_signature_type_validity (l_type_impl)
			else
					-- Internal error: the implementation feature of a query
					-- should be a query.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	check_formal_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST; a_feature: ET_ROUTINE)
			-- Check validity of `an_arguments' of `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_arguments_not_void: an_arguments /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_arguments: a_feature.arguments = an_arguments
			consistent: a_feature = current_feature
		local
			i, nb: INTEGER
			l_type: ET_TYPE
			l_formal: ET_FORMAL_ARGUMENT
			l_formals_impl: detachable ET_FORMAL_ARGUMENT_LIST
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

	check_inline_agent_formal_arguments_validity (an_arguments: ET_FORMAL_ARGUMENT_LIST; an_agent: ET_INLINE_AGENT)
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
			l_enclosing_agent: ET_INLINE_AGENT
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
					if attached current_class.named_feature (l_name) as l_other_feature then
							-- This formal argument has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrfa0b_error (current_class, l_formal, an_agent, current_feature, l_other_feature)
					end
					nb2 := enclosing_inline_agents.count
					from j := 1 until j > nb2 loop
						l_enclosing_agent := enclosing_inline_agents.item (j)
						if attached l_enclosing_agent.formal_arguments as args then
							k := args.index_of (l_name)
							if k /= 0 then
									-- This formal argument has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1a_error (current_class, l_formal, an_agent, args.formal_argument (k))
							end
						end
						if attached l_enclosing_agent.locals as l_locals then
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
					if attached current_feature.arguments as args then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This formal argument has the same name as a formal
								-- argument of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1a_error (current_class, l_formal, an_agent, args.formal_argument (k))
						end
					end
					if attached current_feature.locals as l_locals then
						k := l_locals.index_of (l_name)
						if k /= 0 then
								-- This formal argument has the same name as a
								-- local variable of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1b_error (current_class, l_formal, an_agent, l_locals.local_variable (k))
						end
					end
					if attached current_object_test_scope.hidden_object_test (l_name) as l_object_test then
							-- This formal argument has the same name as an object-test local
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1e_error (current_class, l_formal, an_agent, l_object_test)
					end
					if attached current_iteration_item_scope.hidden_iteration_component (l_name) as l_iteration_component then
							-- This formal argument has the same name as an iteration item
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1g_error (current_class, l_formal, an_agent, l_iteration_component)
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

	check_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST; a_feature: ET_FEATURE)
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
					if attached a_feature.arguments as args then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of `a_feature' in `current_class'.
							set_fatal_error
							error_handler.report_vrle2a_error (current_class, l_local, a_feature, args.formal_argument (k))
						end
					end
					if attached current_class.named_feature (l_name) as l_other_feature then
							-- This local variable has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrle1a_error (current_class, l_local, a_feature, l_other_feature)
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

	check_inline_agent_locals_validity (a_locals: ET_LOCAL_VARIABLE_LIST; an_agent: ET_INLINE_AGENT)
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
			l_enclosing_agent: ET_INLINE_AGENT
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
							error_handler.report_vred0d_error (current_class, other_local, l_local, an_agent, current_feature)
						end
						j := j + 1
					end
					if attached an_agent.formal_arguments as args then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of `an_agent' in `current_class'.
							set_fatal_error
							error_handler.report_vrlv2b_error (current_class, l_local, an_agent, current_feature, args.formal_argument (k))
						end
					end
					if attached current_class.named_feature (l_name) as l_other_feature then
							-- This local variable has the same name as the
							-- final name of a feature in `current_class'.
						set_fatal_error
						error_handler.report_vrlv1b_error (current_class, l_local, an_agent, current_feature, l_other_feature)
					end
					nb2 := enclosing_inline_agents.count
					from j := 1 until j > nb2 loop
						l_enclosing_agent := enclosing_inline_agents.item (j)
						if attached l_enclosing_agent.formal_arguments as args then
							k := args.index_of (l_name)
							if k /= 0 then
									-- This local variable has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vpir1c_error (current_class, l_local, an_agent, args.formal_argument (k))
							end
						end
						if attached l_enclosing_agent.locals as l_locals then
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
					if attached current_feature.arguments as args then
						k := args.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a formal
								-- argument of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1c_error (current_class, l_local, an_agent, args.formal_argument (k))
						end
					end
					if attached current_feature.locals as l_locals then
						k := l_locals.index_of (l_name)
						if k /= 0 then
								-- This local variable has the same name as a
								-- local variable of the enclosing feature.
							set_fatal_error
							error_handler.report_vpir1d_error (current_class, l_local, an_agent, l_locals.local_variable (k))
						end
					end
					if attached current_object_test_scope.hidden_object_test (l_name) as l_object_test then
							-- This local variable has the same name as an object-test local
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1f_error (current_class, l_local, an_agent, l_object_test)
					end
					if attached current_iteration_item_scope.hidden_iteration_component (l_name) as l_iteration_component then
							-- This local variable has the same name as an iteration item
							-- of an enclosing feature or inline agent whose scope contains
							-- the inline agent `an_agent'.
						set_fatal_error
						error_handler.report_vpir1h_error (current_class, l_local, an_agent, l_iteration_component)
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

	check_object_tests_validity (a_object_tests: ET_OBJECT_TEST_LIST; a_feature: ET_FEATURE)
			-- Check validity of `a_object_tests' of `a_feature'.
			-- These are all the named object-tests declared in `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the validity of the declared types of the object-test
			-- locals and scope intersections will be checked when they appear
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
					if system_processor.older_ise_version (ise_6_4_7_7252) then
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

	check_inline_agent_object_tests_validity (a_object_tests: ET_OBJECT_TEST_LIST; an_agent: ET_INLINE_AGENT)
			-- Check validity of `a_object_tests' of `an_agent'.
			-- These are all the object-tests declared in `an_agent'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the validity of the declared types of the object-test
			-- locals and scope intersections will be checked when they appear
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
					if system_processor.older_ise_version (ise_6_4_7_7252) then
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

	check_iteration_components_validity (a_iteration_components: ET_ITERATION_COMPONENT_LIST; a_feature: ET_FEATURE)
			-- Check validity of `a_iteration_components' of `a_feature'.
			-- These are all iteration components declared in `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the scope intersections will be checked when they appear
			-- in the class text.
		require
			a_iteration_components_not_void: a_iteration_components /= Void
			a_feature_not_void: a_feature /= Void
			consistent: a_feature = current_feature
		local
			i, nb: INTEGER
			l_iteration_component: ET_ITERATION_COMPONENT
			l_name: ET_IDENTIFIER
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_iteration_components.count
				from i := 1 until i > nb loop
					l_iteration_component := a_iteration_components.iteration_component (i)
					l_name := l_iteration_component.item_name
					l_name.set_iteration_item (True)
					l_name.set_seed (i)
					l_name := l_iteration_component.unfolded_cursor_name
					l_name.set_iteration_item (True)
					l_name.set_seed (i)
					i := i + 1
				end
			end
		end

	check_inline_agent_iteration_components_validity (a_iteration_components: ET_ITERATION_COMPONENT_LIST; an_agent: ET_INLINE_AGENT)
			-- Check validity of `a_iteration_components' of `an_agent'.
			-- These are all iteration components declared in `an_agent'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the scope intersections will be checked when they appear
			-- in the class text.
		require
			a_iteration_components_not_void: a_iteration_components /= Void
			an_agent_not_void: an_agent /= Void
			consistent: an_agent = current_inline_agent
		local
			i, nb: INTEGER
			l_iteration_component: ET_ITERATION_COMPONENT
			l_name: ET_IDENTIFIER
		do
			has_fatal_error := False
			if current_class = current_class_impl then
				nb := a_iteration_components.count
				from i := 1 until i > nb loop
					l_iteration_component := a_iteration_components.iteration_component (i)
					l_name := l_iteration_component.item_name
					l_name.set_iteration_item (True)
					l_name.set_seed (i)
					l_name := l_iteration_component.unfolded_cursor_name
					l_name.set_iteration_item (True)
					l_name.set_seed (i)
					i := i + 1
				end
			end
		end

feature {NONE} -- Type checking

	check_signature_type_validity (a_type: ET_TYPE)
			-- Check validity of `a_type' when it appears in signatures.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			if in_precursor then
-- TODO: when processing a precursor, its signature should be resolved to the
-- context of `current_class', but it is currently seen in the context of its parent class.
			else
				l_context := new_context (current_type)
				if attached current_inline_agent as l_current_inline_agent then
					type_checker.check_type_validity (a_type, l_current_inline_agent, current_class_impl, l_context)
				else
					type_checker.check_type_validity (a_type, current_feature_impl, current_class_impl, l_context)
				end
				free_context (l_context)
				if type_checker.has_fatal_error then
					set_fatal_error
				else
					l_context := new_context (current_type)
					if a_type.is_type_expanded (l_context) then
						if attached {ET_BASE_TYPE} a_type.shallow_named_type (l_context) as l_base_type then
							type_checker.check_creation_type_validity (l_base_type, current_class_impl, l_context, a_type.position)
							if type_checker.has_fatal_error then
								set_fatal_error
							end
						end
					end
					free_context (l_context)
				end
			end
		end

	check_local_type_validity (a_type: ET_TYPE)
			-- Check validity of `a_type' when it appears
			-- in local variable declarations.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_context := new_context (current_type)
			type_checker.check_type_validity (a_type, current_closure_impl, current_class_impl, l_context)
			free_context (l_context)
			if type_checker.has_fatal_error then
				set_fatal_error
			else
				l_context := new_context (current_type)
				if a_type.is_type_expanded (l_context) then
					if attached {ET_BASE_TYPE} a_type.shallow_named_type (l_context) as l_base_type then
						type_checker.check_creation_type_validity (l_base_type, current_class_impl, l_context, a_type.position)
						if type_checker.has_fatal_error then
							set_fatal_error
						end
					end
				end
				free_context (l_context)
			end
		end

	check_type_validity (a_type: ET_TYPE)
			-- Check validity of `a_type' when it appears in the
			-- body, assertions or rescue clause of a feature.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_context := new_context (current_type)
			type_checker.check_type_validity (a_type, current_closure_impl, current_class_impl, l_context)
			free_context (l_context)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	is_type_valid (a_type: ET_TYPE): BOOLEAN
			-- Is `a_type' valid when viewed from `current_type'?
		require
			a_type_not_void: a_type /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			l_context := new_context (current_type)
			type_checker.set_class_interface_error_only (True)
			type_checker.check_type_validity (a_type, current_closure_impl, current_class_impl, l_context)
			type_checker.set_class_interface_error_only (False)
			free_context (l_context)
			Result := not type_checker.has_fatal_error
		end

	check_creation_type_validity (a_type: ET_BASE_TYPE; a_position: ET_POSITION)
			-- Check validity of `a_type' as a creation type in `current_type'.
			-- Note that `a_type' should already be a valid type by itself
			-- (call `check_type_validity' for that).
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
			a_position_not_void: a_position /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_context := new_context (current_type)
			type_checker.check_creation_type_validity (a_type, current_class_impl, l_context, a_position)
			free_context (l_context)
			if type_checker.has_fatal_error then
				set_fatal_error
			end
		end

	type_checker: ET_TYPE_CHECKER
			-- Type checker

feature {NONE} -- Once key validity

	check_once_keys_validity (a_keys: detachable ET_MANIFEST_STRING_LIST; a_indexing_list: detachable ET_INDEXING_LIST)
			-- Check validity of once keys `a_keys'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_indexing_term_list: like indexing_term_list
			l_indexing_term: ET_INDEXING_TERM
			l_object_key: detachable ET_MANIFEST_STRING
			l_thread_key: detachable ET_MANIFEST_STRING
			l_process_key: detachable ET_MANIFEST_STRING
			l_thread_indexing: detachable ET_INDEXING_TERM
			l_process_indexing: detachable ET_INDEXING_TERM
			i, nb: INTEGER
			l_key: ET_MANIFEST_STRING
		do
			has_fatal_error := False
			if a_indexing_list /= Void then
				l_indexing_term_list := indexing_term_list
				a_indexing_list.append_tagged_indexing_terms_to_list (tokens.once_indexing_tag, l_indexing_term_list)
				nb := l_indexing_term_list.count
				from i := 1 until i > nb loop
					l_indexing_term := l_indexing_term_list.item (i)
					if l_indexing_term.has_indexing_term_value (tokens.global_once_indexing_value) then
						l_process_indexing := l_indexing_term
						if l_thread_indexing /= Void then
								-- Error: once keys "THREAD" and "PROCESS" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1c_error (current_class, l_thread_indexing, l_indexing_term)
						end
					elseif l_indexing_term.has_indexing_term_value (tokens.thread_once_indexing_value) then
						l_thread_indexing := l_indexing_term
						if l_process_indexing /= Void then
								-- Error: once keys "PROCESS" and "THREAD" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1c_error (current_class, l_process_indexing, l_indexing_term)
						end
					else
							-- Error: this once key is not supported. The supported once keys
							-- are "THREAD", "PROCESS" and "OBJECT".
						set_fatal_error
						error_handler.report_vvok2b_error (current_class, l_indexing_term)
					end
					i := i + 1
				end
				l_indexing_term_list.wipe_out
			end
			if a_keys /= Void then
				nb := a_keys.count
				from i := 1 until i > nb loop
					l_key := a_keys.manifest_string (i)
					if standard_once_keys.is_object_key (l_key) then
						l_object_key := l_key
						if l_thread_key /= Void then
								-- Error: once keys "THREAD" and "OBJECT" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_thread_key, l_key)
						elseif l_process_key /= Void then
								-- Error: once keys "PROCESS" and "OBJECT" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_process_key, l_key)
						elseif l_thread_indexing /= Void then
								-- Error: once keys "THREAD" and "OBJECT" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1b_error (current_class, l_thread_indexing, l_key)
						elseif l_process_indexing /= Void then
								-- Error: once keys "PROCESS" and "OBJECT" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1b_error (current_class, l_process_indexing, l_key)
						end
					elseif standard_once_keys.is_thread_key (l_key) then
						l_thread_key := l_key
						if l_object_key /= Void then
								-- Error: once keys "OBJECT" and "THREAD" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_object_key, l_key)
						elseif l_process_key /= Void then
								-- Error: once keys "PROCESS" and "THREAD" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_process_key, l_key)
						elseif l_process_indexing /= Void then
								-- Error: once keys "PROCESS" and "THREAD" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1b_error (current_class, l_process_indexing, l_key)
						end
					elseif standard_once_keys.is_process_key (l_key) then
						l_process_key := l_key
						if l_object_key /= Void then
								-- Error: once keys "OBJECT" and "PROCESS" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_object_key, l_key)
						elseif l_thread_key /= Void then
								-- Error: once keys "THREAD" and "PROCESS" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1a_error (current_class, l_thread_key, l_key)
						elseif l_thread_indexing /= Void then
								-- Error: once keys "THREAD" and "PROCESS" cannot be combined.
							set_fatal_error
							error_handler.report_vvok1b_error (current_class, l_thread_indexing, l_key)
						end
					else
							-- Error: this once key is not supported. The supported once keys
							-- are "THREAD", "PROCESS" and "OBJECT".
						set_fatal_error
						error_handler.report_vvok2a_error (current_class, l_key)
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Instruction validity

	check_across_instruction_validity (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_iteration_instruction_validity (an_instruction)
		end

	check_assigner_instruction_validity (an_instruction: ET_ASSIGNER_INSTRUCTION)
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
			l_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION
			l_call_info: like new_call_info
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_call_context:ET_NESTED_TYPE_CONTEXT
			l_source: ET_EXPRESSION
			l_source_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_CALL_NAME
			l_assigner_seed: INTEGER
			l_assigner_procedure: detachable ET_PROCEDURE
			l_target_base_class: detachable ET_CLASS
			l_expected_type: detachable ET_TYPE
			l_expected_type_context: ET_NESTED_TYPE_CONTEXT
			l_seed: INTEGER
			l_query: detachable ET_QUERY
			l_convert_expression: detachable ET_CONVERT_EXPRESSION
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_call := an_instruction.call
			l_target_context := new_context (current_type)
			l_call_info := new_call_info (l_target_context)
			l_call_context := new_context (current_type)
			if attached l_call.parenthesis_call as l_parenthesis_call then
				check_qualified_call_expression_validity (l_parenthesis_call, l_call_context, l_call_info)
				l_name := l_parenthesis_call.name
			else
				check_qualified_call_expression_validity (l_call, l_call_context, l_call_info)
				l_name := l_call.name
			end
			free_context (l_call_context)
			l_target_base_class := l_call_info.target_class
			l_query := l_call_info.query
			free_call_info (l_call_info)
			if has_fatal_error then
				-- We cannot go further.
			elseif l_query /= Void then
					-- It's either:
					--    target [args] := source
					--    target.f := source
					--    target.f (args) := source
					-- where 'f' is a query.
					-- Check whether the query has an associated assigner procedure.
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
					elseif attached l_query.assigner as l_assigner then
						l_assigner_seed := l_assigner.feature_name.seed
						if l_assigner_seed = 0 then
								-- Internal error: invalid assigner. This error should have
								-- already been reported when flattening features of `l_target_base_class'
								-- (class containing `l_query').
							set_fatal_error
							error_handler.report_giaaa_error
						else
							an_instruction.set_name (l_assigner.feature_name)
						end
					else
							-- Report error: `l_query' should have an assigner command
							-- associated with it. See VBAC-2, ECMA 367-2 p.119.
						set_fatal_error
						error_handler.report_vbac2a_error (current_class, an_instruction, l_query, l_target_base_class)
					end
				end
				if l_assigner_seed /= 0 then
					l_assigner_procedure := l_target_base_class.seeded_procedure (l_assigner_seed)
					if l_assigner_procedure = Void then
							-- Internal error: if we got a seed, the
							-- `l_assigner_procedure' should not be void.
						set_fatal_error
						error_handler.report_giaaa_error
					end
				end
				if system_processor.is_ise then
						-- ECMA 367-2 says that the type of the call and of the first formal argument
						-- of the assigner procedure should have the same deanchored form.
						-- But EiffelStudio 6.8.8.6542 actually only checks that the type of the
						-- formal argument of the assigner procedure conforms to the type of the call.
						-- The conformance in the other direction is checked in the client code,
						-- which is not what ECMA 367-2 suggests (see rules VFAC-3 and VBAC-1).
					if l_assigner_procedure = Void then
						-- Error already reported above.
					elseif not attached l_assigner_procedure.arguments as l_assigner_procedure_arguments or else l_assigner_procedure_arguments.count = 0 then
							-- Internal error: the validity rule VFAC-2 (in class ET_FEATURE_FLATTENER)
							-- already checked that we had the correct number of arguments.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_target_base_class.is_dotnet then
							-- Under .NET the value is passed as the last argument of the assigner.
						l_expected_type := l_assigner_procedure_arguments.formal_argument (l_assigner_procedure.arguments_count).type
					else
						l_expected_type := l_assigner_procedure_arguments.formal_argument (1).type
					end
				else
					l_expected_type := l_query.type
				end
			elseif l_name.is_tuple_label then
					-- This is a tuple label.
					-- For example:
					--     target: TUPLE [f: INTEGER]
					--     target.f := 5
				l_seed := l_name.seed
				an_instruction.set_name (l_name)
				if not l_target_base_class.is_tuple_class then
						-- Internal error: if we got a call to tuple label,
						-- the class has to be TUPLE because it is not possible
						-- to inherit from TUPLE.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed = 0 then
						-- Internal error: at this stage, if we know that `l_name'
						-- is a tuple label, its seed should have been set.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed > l_target_context.base_type_actual_count then
						-- Internal error: the index of the labeled
						-- actual parameter cannot be out of bound because
						-- for a Tuple type to conform to another Tuple type
						-- it needs to have more actual parameters.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_expected_type := l_target_base_class.formal_parameter_type (l_seed)
				end
			else
					-- Internal error: it's either a query or a tuple label.
				set_fatal_error
				error_handler.report_giaaa_error
			end
				-- Check the validity of the source.
			l_source := an_instruction.source
			l_source_context := new_context (current_type)
			if l_expected_type = Void then
					-- The call is not valid. As a consequence its type has not
					-- been computed correctly. We will consider that it is of
					-- type 'detachable ANY' when checking the validity of the source.
				check has_fatal_error: has_fatal_error end
				check_expression_validity (l_source, l_source_context, current_system.detachable_any_type)
				has_fatal_error := True
			else
					-- After this, `l_source_context' will represent the type of the source.
					-- In some cases we need the type of the call in order to determine the
					-- type of the source. For example:
					--    target.f := << "gobo", 'a', 2 >>
					-- where 'f' is declared of type 'ARRAY [COMPARABLE]' in the base class of 'target'.
					-- The type of the manifest array will be 'ARRAY [COMPARABLE]'. Without the
					-- this hint it could have been 'ARRAY [HASHABLE]' or even 'ARRAY [ANY]'.
				l_target_context.force_last (l_expected_type)
				l_expected_type_context := l_target_context
				had_error := has_fatal_error
				check_expression_validity (l_source, l_source_context, l_expected_type_context)
				if not has_fatal_error then
						-- Both source and call have valid types. Check whether the type
						-- of the source conforms or converts to the type of the call.
					if not l_source_context.conforms_to_context (l_expected_type_context, system_processor) then
							-- The source does not conform to the call.
							-- Try to find out whether it converts to it.
						l_convert_expression := convert_expression (l_source, l_source_context, l_expected_type_context)
						if has_fatal_error then
							-- Nothing to be done.
						elseif l_convert_expression /= Void then
								-- Insert the conversion feature call in the AST.
								-- Convertibility should be resolved in the implementation class
								-- (see postcondition of `convert_expression').
							check implementation_class: current_class = current_class_impl end
							an_instruction.set_source (l_convert_expression)
						else
								-- Report error: the type of the source does not conform nor convert
								-- to the type of the call. See VBAC-1, ECMA 367-2 p.119.
							set_fatal_error
							error_handler.report_vbac1a_error (current_class, current_class_impl, an_instruction, l_source_context.named_type, l_expected_type_context.named_type)
						end
					end
				end
				l_target_context.remove_last
				has_fatal_error := has_fatal_error or had_error
				if has_fatal_error then
					-- Nothing to report.
				elseif l_name.is_tuple_label then
					report_tuple_label_setter (an_instruction, l_target_context)
				elseif l_assigner_procedure /= Void then
					report_qualified_call_instruction (an_instruction, l_target_context, l_assigner_procedure)
				end
			end
			free_context (l_source_context)
			free_context (l_target_context)
		end

	check_assignment_validity (an_instruction: ET_ASSIGNMENT)
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
			l_convert_expression: detachable ET_CONVERT_EXPRESSION
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
					-- type 'detachable ANY' when checking the validity of the source.
				had_error := True
				l_target_context.wipe_out
				l_target_context.force_last (current_system.detachable_any_type)
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
				if not l_source_context.conforms_to_context (l_target_context, system_processor) then
						-- The source does not conform to the target.
						-- Try to find out whether it converts to it.
-- TODO: do we need to check for the attachment status of the source and the target when using conversion?
					l_convert_expression := convert_expression (l_source, l_source_context, l_target_context)
					if has_fatal_error then
						-- Nothing to be done.
					elseif l_convert_expression /= Void then
							-- Insert the conversion feature call in the AST.
							-- Convertibility should be resolved in the implementation class.
						check implementation_class: current_class = current_class_impl end
						an_instruction.set_source (l_convert_expression)
					elseif
						system_processor.is_ise and current_class /= current_class_impl and
						(current_class.is_basic or current_class.is_typed_pointer_class)
					then
						-- Compatibility with ISE 5.6.0610.
					else
							-- The type of the source does not conform nor convert to the type of the target.
						set_fatal_error
						error_handler.report_vjar0a_error (current_class, current_class_impl, an_instruction, l_source_context.named_type, l_target_context.named_type)
					end
				end
				if not has_fatal_error then
					if current_system.attachment_type_conformance_mode then
						if attached {ET_RESULT} l_target then
							if not l_target_context.is_type_detachable then
								current_initialization_scope.add_result
							elseif attached current_closure_impl.type as l_result_type and then not l_result_type.is_type_detachable (current_type) then
								if l_result_type.is_type_attached (current_type) then
									if l_source_context.is_type_attached then
										current_initialization_scope.add_result
									else
										current_initialization_scope.remove_result
									end
								else
									if not l_source_context.is_type_detachable then
										current_initialization_scope.add_result
									else
										current_initialization_scope.remove_result
									end
								end
							end
							if not l_target_context.is_type_attached then
								if l_source_context.is_type_attached then
									current_attachment_scope.add_result
								else
									current_attachment_scope.remove_result
								end
							end
						elseif attached {ET_IDENTIFIER} l_target as l_identifier then
							if not l_target_context.is_type_detachable then
								current_initialization_scope.add_name (l_identifier)
							elseif not l_source_context.is_type_attached then
								if l_identifier.is_feature_name and then attached current_class.seeded_query (l_identifier.seed) as l_attribute and then l_attribute.is_stable_attribute then
										-- The target entity of the assignment is a stable attribute
										-- but the source expression is not guaranteed to be attached.
									set_fatal_error
									error_handler.report_vjar0b_error (current_class, current_class_impl, an_instruction, l_source_context.named_type, l_target_context.named_type)
								end
							end
							if not l_target_context.is_type_attached then
								if l_source_context.is_type_attached then
									current_attachment_scope.add_name (l_identifier)
								else
									current_attachment_scope.remove_name (l_identifier)
								end
							end
						end
					end
					report_assignment (an_instruction)
				end
			end
			free_context (l_source_context)
			free_context (l_target_context)
		end

	check_assignment_attempt_validity (an_instruction: ET_ASSIGNMENT_ATTEMPT)
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
					-- type 'detachable ANY' when checking the validity of the source.
				had_error := True
				l_target_context.wipe_out
				l_target_context.force_last (current_system.detachable_any_type)
			elseif not (current_system.is_dotnet or system_processor.newer_or_same_ise_version (ise_5_7_0)) and not l_target_context.is_type_reference then
					-- Assignment attempts with expanded targets are allowed in Eiffel for .NET
					-- and versions of ISE greater than or equal to 5.7. Otherwise, report a
					-- VJRV validity error.
				if current_class = current_class_impl then
					had_error := True
					set_fatal_error
					l_target_named_type := l_target_context.named_type
					error_handler.report_vjrv0a_error (current_class, current_class_impl, l_target, l_target_named_type)
				elseif not current_class_impl.is_any_class or else not system_processor.is_ise then
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

	check_bang_instruction_validity (an_instruction: ET_BANG_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_check_instruction_validity (an_instruction: ET_CHECK_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			i, nb: INTEGER
			l_assertion_context: ET_NESTED_TYPE_CONTEXT
			boolean_type: ET_CLASS_TYPE
			l_named_type: ET_NAMED_TYPE
			had_error: BOOLEAN
			l_old_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			l_has_false: BOOLEAN
		do
			has_fatal_error := False
			boolean_type := current_universe_impl.boolean_type
			l_assertion_context := new_context (current_type)
			in_check_instruction := True
			l_old_object_test_scope := current_object_test_scope.count
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode and an_instruction.then_compound = Void then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
			end
			nb := an_instruction.count
			from i := 1 until i > nb loop
				if attached an_instruction.assertion (i).expression as l_expression then
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
					if l_expression.is_false then
						l_has_false := True
					end
						-- The scope of object-test locals can cover the following assertions
						-- in the same check clause because it's as if they were separated
						-- by "and then" operators.
					object_test_scope_builder.build_scope (l_expression, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					if current_system.attachment_type_conformance_mode then
						attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
					end
				end
				i := i + 1
			end
			in_check_instruction := False
			free_context (l_assertion_context)
			if attached an_instruction.then_compound as l_then_compound then
				if l_has_false then
					current_initialization_scope.set_code_unreachable (True)
					current_attachment_scope.set_code_unreachable (True)
				end
				check_instructions_validity (l_then_compound)
				if has_fatal_error then
					had_error := True
				end
					-- Note that this code:
					--
					--   local
					--      a: detachable A
					--   do
					--      check a /= Void then end
					--      a.f
					--
					-- is accetped as a CAP because if 'a' is Void
					-- then an exception is raise by the 'check'
					-- even when check-monitoring is turned off.
					-- So we don't reset `current_attachment_scope' here.
			else
					-- Note that this code:
					--
					--   local
					--      a: detachable A
					--   do
					--      check a /= Void end
					--      a.f
					--
					-- is not accepted because no exception will be raised by the 'check'
					-- when check-monitoring is turned off.
					-- ISE 6.8.8.6542 used to accept it, but we ended up with
					-- call-on-void-target at run-time.
				if current_system.attachment_type_conformance_mode then
					free_attachment_scope (current_attachment_scope)
					free_attachment_scope (current_initialization_scope)
					current_attachment_scope := l_old_attachment_scope
					current_initialization_scope := l_old_initialization_scope
				end
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			if had_error then
				set_fatal_error
			end
		end

	check_create_instruction_validity (an_instruction: ET_CREATE_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			check_creation_instruction_validity (an_instruction)
		end

	check_creation_instruction_validity (an_instruction: ET_CREATION_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_creation_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
			l_target: ET_WRITABLE
			l_target_context: ET_NESTED_TYPE_CONTEXT
			l_explicit_creation_type: detachable ET_TYPE
			l_seed: INTEGER
			l_creation_call: detachable ET_QUALIFIED_CALL
			l_name: ET_FEATURE_NAME
			l_name_position: ET_POSITION
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			i, nb: INTEGER
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_creation_call := an_instruction.creation_call
			if l_creation_call /= Void then
					-- There is an explicit creation call.
				l_name := l_creation_call.name
				l_seed := l_name.seed
			else
					-- No explicit creation call. Use 'default_create' instead.
				l_creation_call := default_creation_call
				l_name_position := an_instruction.last_position
				default_creation_call_name.set_position (l_name_position.line, l_name_position.column)
				l_name := default_creation_call_name
				l_seed := current_system.default_create_seed
			end
			l_target := an_instruction.target
			l_target_context := new_context (current_type)
			l_explicit_creation_type := an_instruction.type
			l_creation_context := new_context (current_type)
			if l_explicit_creation_type /= Void then
				check_type_validity (l_explicit_creation_type)
			end
			l_had_error := has_fatal_error
			check_writable_validity (l_target, l_target_context)
			reset_fatal_error (l_had_error or has_fatal_error)
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				if l_explicit_creation_type /= Void then
					l_creation_context.force_last (l_explicit_creation_type)
				else
					l_creation_context.force_last (l_target_context.first)
				end
				l_creation_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, l_creation_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (l_creation_call)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				if l_creation_call = default_creation_call then
						-- There is no explicit creation call.
					check_creation_procedure_call_instruction_validity (an_instruction, l_creation_call, Void, l_adapted_base_class, l_has_multiple_constraints, l_target_context, l_creation_context)
				elseif current_class_impl /= current_class then
						-- We need to resolve `l_name' in the implementation
						-- class of `current_feature_impl' first.
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (l_creation_call)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_dotnet_creation_procedure_call_instruction_validity (an_instruction, l_creation_call, l_adapted_base_class, l_has_multiple_constraints, l_target_context, l_creation_context)
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_creation_procedure_call_instruction_validity (an_instruction, l_creation_call, l_procedure, l_adapted_base_class, l_has_multiple_constraints, l_target_context, l_creation_context)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						-- This is not a procedure.
					set_fatal_error
					error_handler.report_vgcc6d_error (current_class, l_name, l_query, l_class)
					check_orphan_actual_arguments_validity (l_creation_call)
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-2 (ETL2 p.368).
					error_handler.report_vuex2a_error (current_class_impl, l_name, l_class)
					check_orphan_actual_arguments_validity (l_creation_call)
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- creation instruction was written. So, if we got a seed, there should
					-- be a procedure for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (l_creation_call)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						check_creation_procedure_call_instruction_validity (an_instruction, l_creation_call, l_procedure, l_adapted_base_class, l_has_multiple_constraints, l_target_context, l_creation_context)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- creation instruction was written. So, if we got a seed, there should
							-- be a procedure for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					end
					i := i + 1
				end
			end
			free_context (l_creation_context)
			free_context (l_target_context)
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_dotnet_creation_procedure_call_instruction_validity (a_instruction: ET_CREATION_INSTRUCTION; a_creation_call: ET_CREATION_CALL; a_adapted_base_class: ET_ADAPTED_CLASS; a_has_multiple_constraints: BOOLEAN; a_target_context, a_creation_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_instruction' with .NET creation type base class.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the creation type and of the target of the creation are
			-- assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_target_context' represents the type of the creation target.
			-- `a_creation_context' represents the creation type of `a_instruction'.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the creation type.
			-- `a_has_multiple_constraints' means that creation type is a formal parameter
			-- with multiple constraints.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_instruction_not_void: a_instruction /= Void
			a_creation_call_not_void: a_creation_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_class_is_dotnet: a_adapted_base_class.base_class.is_dotnet
			a_target_context_not_void: a_target_context /= Void
			a_creation_context_not_void: a_creation_context /= Void
			a_creation_context_count: a_creation_context.count = 1
		local
			l_class: ET_CLASS
			l_procedure: ET_PROCEDURE
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			l_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_creation_call.name
			l_overloaded_procedures := new_overloaded_procedures
			a_adapted_base_class.add_overloaded_procedures (l_name, l_overloaded_procedures)
			if not l_overloaded_procedures.is_empty then
				keep_best_overloaded_features (l_overloaded_procedures, adapted_name (l_name, a_adapted_base_class), a_creation_call.arguments, a_creation_context, False, True)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_creation_call)
				elseif l_overloaded_procedures.count = 1 then
					l_procedure := l_overloaded_procedures.first
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_creation_procedure_call_instruction_validity (a_instruction, a_creation_call, l_procedure, a_adapted_base_class, a_has_multiple_constraints, a_target_context, a_creation_context)
				else
					-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_creation_call)
				end
			elseif attached a_adapted_base_class.named_query (l_name) as l_query then
					-- This is not a procedure.
				set_fatal_error
				error_handler.report_vgcc6d_error (current_class, l_name, l_query, l_class)
				check_orphan_actual_arguments_validity (a_creation_call)
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class_impl, l_name, l_class)
				check_orphan_actual_arguments_validity (a_creation_call)
			end
			free_overloaded_procedures (l_overloaded_procedures)
		end

	check_creation_procedure_call_instruction_validity (a_instruction: ET_CREATION_INSTRUCTION; a_creation_call: ET_CREATION_CALL; a_procedure: detachable ET_PROCEDURE; a_adapted_base_class: ET_ADAPTED_CLASS; a_has_multiple_constraints: BOOLEAN; a_target_context, a_creation_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_instruction' with `a_procedure' as creation procedure.
			-- The validity of the creation type and of the target of the creation are
			-- assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_target_context' represents the type of the creation target.
			-- `a_creation_context' represents the creation type of `a_instruction'.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the creation type.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the creation type.
			-- `a_has_multiple_constraints' means that creation type is a formal parameter
			-- with multiple constraints.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_instruction_not_void: a_instruction /= Void
			a_creation_call_not_void: a_creation_call /= Void
			no_call_if_not_procedure: a_procedure = Void implies a_creation_call = default_creation_call
			no_default_create_if_not_procedure: a_procedure = Void implies current_system.default_create_seed = 0
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_target_context_not_void: a_target_context /= Void
			a_creation_context_not_void: a_creation_context /= Void
			a_creation_context_count: a_creation_context.count = 1
		local
			l_class: ET_CLASS
			l_target: ET_WRITABLE
			l_creation_type: ET_TYPE
			l_creation_named_type: ET_NAMED_TYPE
			l_explicit_creation_type: detachable ET_TYPE
			l_type_position: ET_POSITION
			l_creation_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_target := a_instruction.target
			l_creation_type := a_creation_context.last
			a_creation_context.remove_last
			l_creation_named_type := l_creation_type.shallow_named_type (a_creation_context)
			a_creation_context.put_last (l_creation_type)
			l_explicit_creation_type := a_instruction.type
			if l_explicit_creation_type /= Void then
				if not a_creation_context.conforms_to_context_with_type_marks (tokens.implicit_attached_type_mark, a_target_context, tokens.implicit_attached_type_mark, system_processor) then
					set_fatal_error
					error_handler.report_vgcc3a_error (current_class, current_class_impl, a_instruction, a_creation_context.named_type, a_target_context.named_type)
				else
					report_create_supplier (l_creation_type, current_class, current_feature)
				end
				l_type_position := l_explicit_creation_type.position
			else
				l_type_position := l_target.position
			end
			if attached {ET_BASE_TYPE} l_creation_named_type as l_base_type then
				if l_explicit_creation_type = Void and then not is_type_valid (l_base_type) then
						-- There is no explicit creation type, and the type of the target is not a valid type.
						-- This error should already have been reported when the target was declared.
					set_fatal_error
				else
					had_error := has_fatal_error
					check_creation_type_validity (l_base_type, l_type_position)
				end
			end
			had_error := had_error or has_fatal_error
			if a_procedure = Void then
				check_no_creation_procedure_call_validity (a_instruction, a_creation_call, l_class, a_creation_context)
			elseif attached {ET_FORMAL_PARAMETER_TYPE} l_creation_named_type as l_formal_type then
				if a_has_multiple_constraints then
					l_creation_context := new_context (current_type)
					l_creation_context.copy_type_context (a_creation_context)
					adapted_base_class_checker.reset_context_if_multiple_constraints (a_has_multiple_constraints, a_adapted_base_class, l_creation_context)
					check_formal_creation_procedure_call_validity (a_instruction, a_creation_call, a_procedure, l_class, l_formal_type, l_creation_context)
					free_context (l_creation_context)
				else
					check_formal_creation_procedure_call_validity (a_instruction, a_creation_call, a_procedure, l_class, l_formal_type, a_creation_context)
				end
			else
				check_creation_procedure_call_validity (a_instruction, a_creation_call, a_procedure, l_class, a_creation_context)
			end
			reset_fatal_error (had_error or has_fatal_error)
			if not has_fatal_error then
				if current_system.attachment_type_conformance_mode then
					if attached {ET_RESULT} l_target then
						if not a_target_context.is_type_detachable then
							current_initialization_scope.add_result
						elseif attached current_closure_impl.type as l_result_type and then not l_result_type.is_type_detachable (current_type) then
							current_initialization_scope.add_result
						end
						if not a_target_context.is_type_attached then
							current_attachment_scope.add_result
						end
					elseif attached {ET_IDENTIFIER} l_target as l_identifier then
						if not a_target_context.is_type_detachable then
							current_initialization_scope.add_name (l_identifier)
						end
						if not a_target_context.is_type_attached then
							current_attachment_scope.add_name (l_identifier)
						end
					end
						-- When we have:
						--   local
						--      v: detachable FOO
						--   ...
						--   create v.make
						--
						-- even if 'detachable FOO' is detachable, the type of
						-- the object created is attached.
					l_creation_named_type := l_creation_named_type.type_with_type_mark (tokens.implicit_attached_type_mark)
				end
				report_creation_instruction (a_instruction, l_creation_named_type, a_procedure)
			end
		end

	check_creation_procedure_call_validity (a_creation_component: ET_CREATION_COMPONENT; a_creation_call: ET_CREATION_CALL; a_procedure: ET_PROCEDURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_creation_component' with `a_procedure' as creation procedure.
			-- The validity of the creation type and of the target of the creation are
			-- assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_context' represents the creation type of `a_creation_component'.
			-- `a_class' is the base class of the creation type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_creation_component_not_void: a_creation_component /= Void
			a_creation_call_not_void: a_creation_call /= Void
			a_procedure_not_void: a_procedure /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
			a_context_count: a_context.count = 1
		local
			l_name: ET_FEATURE_NAME
			l_creation_type: ET_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_creation_call.name
			l_creation_type := a_context.first
			if not a_procedure.is_creation_exported_to (current_class, a_class, system_processor) then
					-- The procedure is not a creation procedure exported to `current_class',
					-- and it is not the implicit creation procedure 'default_create'.
				if current_class /= current_class_impl and current_class.is_deferred and l_creation_type.is_like_current then
					-- In case of flat Degree 3, it is OK to create an entity
					-- declared of type 'like Current' in the current class
					-- if the current class is deferred.
				else
					set_fatal_error
					error_handler.report_vgcc6c_error (current_class, current_class_impl, l_name, a_procedure, a_class)
				end
			end
			had_error := has_fatal_error
			check_creation_vape_validity (l_name, a_procedure, a_class)
			had_error := had_error or has_fatal_error
			check_actual_arguments_validity (a_creation_call, a_context, a_procedure, a_class, Void)
			reset_fatal_error (had_error or has_fatal_error)
		end

	check_formal_creation_procedure_call_validity (a_creation_component: ET_CREATION_COMPONENT; a_creation_call: ET_CREATION_CALL; a_procedure: ET_PROCEDURE; a_class: ET_CLASS; a_formal_type: ET_FORMAL_PARAMETER_TYPE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_creation_component' with `a_procedure' as creation procedure.
			-- The validity of the creation type and of the target of the creation are
			-- assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_context' represents the creation type of `a_creation_component'.
			-- `a_formal_type' is the named type of the creation type when viewed
			-- in the context of `current_type'.
			-- `a_class' is the base class of the creation type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_creation_component_not_void: a_creation_component /= Void
			a_creation_call_not_void: a_creation_call /= Void
			a_procedure_not_void: a_procedure /= Void
			a_class_not_void: a_class /= Void
			a_formal_type_not_void: a_formal_type /= Void
			a_context_not_void: a_context /= Void
		local
			l_index: INTEGER
			l_name: ET_FEATURE_NAME
			l_formal_parameter: ET_FORMAL_PARAMETER
			l_creator: detachable ET_CONSTRAINT_CREATOR
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_creation_call.name
				-- The creation type if a formal generic parameter.
				-- We need to find out what creation procedures are
				-- declared with the associated constraint.
			l_index := a_formal_type.index
			if not attached current_class.formal_parameters as l_formal_parameters or else l_index > l_formal_parameters.count then
					-- Internal error: `l_formal_parameter' is supposed
					-- to be a formal parameter of `current_class'.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_formal_parameter := l_formal_parameters.formal_parameter (l_index)
				l_creator := l_formal_parameter.creation_procedures
				if l_creator = Void or else not l_creator.has_feature (a_procedure) then
						-- The creation procedure of the expression is not
						-- one of those declared with the associated constraint.
					set_fatal_error
					error_handler.report_vgcc8a_error (current_class, current_class_impl, l_name, a_procedure, a_class, l_formal_parameter)
				end
				had_error := has_fatal_error
				check_formal_parameter_creation_vape_validity (l_name, a_procedure, l_formal_parameter)
			end
			had_error := had_error or has_fatal_error
			check_actual_arguments_validity (a_creation_call, a_context, a_procedure, a_class, Void)
			reset_fatal_error (had_error or has_fatal_error)
		end

	check_no_creation_procedure_call_validity (a_creation_component: ET_CREATION_COMPONENT; a_creation_call: ET_CREATION_CALL; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_creation_component' when there is no creation procedure.
			-- This happens when there is no creation call, and feature 'default_create' is
			-- not supported by the underlying Eiffel compiler.
			-- The validity of the creation type and of the target of the creation are
			-- assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_context' represents the creation type of `a_creation_component'.
			-- `a_class' is the base class of the creation type.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_creation_component_not_void: a_creation_component /= Void
			a_creation_call_not_void: a_creation_call /= Void
			no_call: a_creation_call = default_creation_call
			no_default_create: current_system.default_create_seed = 0
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if a_class.creators /= Void then
					-- The class explicitly declares creation procedures,
					-- so the creation call was required.
				set_fatal_error
				error_handler.report_vgcc5a_error (current_class, current_class_impl, a_creation_component, a_class)
			elseif a_class.is_deferred then
					-- The class is deferred, so the creation is invalid.
				set_fatal_error
				error_handler.report_vgcc1a_error (current_class, current_class_impl, a_creation_component, a_class)
			end
		end

	check_debug_instruction_validity (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
		do
			if attached an_instruction.compound as l_compound then
				l_old_initialization_scope := current_initialization_scope
				l_old_attachment_scope := current_attachment_scope
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					current_attachment_scope := new_attachment_scope
					current_attachment_scope.copy_scope (l_old_attachment_scope)
				end
				check_instructions_validity (l_compound)
				if current_system.attachment_type_conformance_mode then
					free_attachment_scope (current_attachment_scope)
					free_attachment_scope (current_initialization_scope)
					current_attachment_scope := l_old_attachment_scope
					current_initialization_scope := l_old_initialization_scope
				end
			else
				has_fatal_error := False
			end
		end

	check_if_instruction_validity (an_instruction: ET_IF_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			boolean_type: ET_CLASS_TYPE
			l_conditional: ET_EXPRESSION
			l_conditional_context: ET_NESTED_TYPE_CONTEXT
			l_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			l_old_object_test_scope: INTEGER
			l_old_elseif_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_if_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			l_if_initialization_scope: like current_initialization_scope
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
			l_old_object_test_scope := current_object_test_scope.count
				-- Note: Even when there is no then-compound the object-test scopes
				-- need to be build to detect possible object-test local name overlaps.
				-- This is to be fully compliant with ISE 6.8.
			object_test_scope_builder.build_scope (l_conditional, current_object_test_scope, current_class_impl)
			had_error := had_error or object_test_scope_builder.has_fatal_error
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
				attachment_scope_builder.build_scope (l_conditional, current_attachment_scope)
				attachment_scope_builder.build_negated_scope (l_conditional, l_old_attachment_scope)
			end
			if attached an_instruction.then_compound as l_then_compound then
				check_instructions_validity (l_then_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			l_if_attachment_scope := current_attachment_scope
			l_if_initialization_scope := current_initialization_scope
				-- Note: Even when there is no else-compound the object-test scopes
				-- need to be build to detect possible object-test local name overlaps.
				-- This is to be fully compliant with ISE 6.8.
			object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope, current_class_impl)
			had_error := had_error or object_test_scope_builder.has_fatal_error
			if attached an_instruction.elseif_parts as l_elseif_parts then
				if current_system.attachment_type_conformance_mode then
					current_attachment_scope := new_attachment_scope
					current_initialization_scope := new_attachment_scope
				end
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif := l_elseif_parts.item (i)
					if current_system.attachment_type_conformance_mode then
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						current_attachment_scope.copy_scope (l_old_attachment_scope)
					end
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
						-- Note: Even when there is no then-compound the object-test scopes
						-- need to be build to detect possible object-test local name overlaps.
						-- This is to be fully compliant with ISE 6.8.
					l_old_elseif_object_test_scope := current_object_test_scope.count
					object_test_scope_builder.build_scope (l_conditional, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					if current_system.attachment_type_conformance_mode then
						attachment_scope_builder.build_scope (l_conditional, current_attachment_scope)
						attachment_scope_builder.build_negated_scope (l_conditional, l_old_attachment_scope)
					end
					if attached l_elseif.then_compound as l_then_compound then
						check_instructions_validity (l_then_compound)
						if has_fatal_error then
							had_error := True
						end
					end
					current_object_test_scope.keep_object_tests (l_old_elseif_object_test_scope)
					if current_system.attachment_type_conformance_mode then
						l_if_attachment_scope.merge_scope (current_attachment_scope)
						l_if_initialization_scope.merge_scope (current_initialization_scope)
					end
						-- Note: Even when there is no else-compound the object-test scopes
						-- need to be build to detect possible object-test local name overlaps.
						-- This is to be fully compliant with ISE 6.8.
					object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					i := i + 1
				end
				if current_system.attachment_type_conformance_mode then
					free_attachment_scope (current_initialization_scope)
					free_attachment_scope (current_attachment_scope)
				end
			end
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := l_old_initialization_scope
				current_attachment_scope := l_old_attachment_scope
			end
			if attached an_instruction.else_compound as l_else_compound then
				check_instructions_validity (l_else_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			if current_system.attachment_type_conformance_mode then
				current_attachment_scope.merge_scope (l_if_attachment_scope)
				current_initialization_scope.merge_scope (l_if_initialization_scope)
				free_attachment_scope (l_if_attachment_scope)
				free_attachment_scope (l_if_initialization_scope)
			end
			if had_error then
				set_fatal_error
			end
		end

	check_inspect_instruction_validity (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_expression: ET_EXPRESSION
			l_when_part: ET_WHEN_PART
			l_else_compound: detachable ET_COMPOUND
			i, nb: INTEGER
			had_error: BOOLEAN
			had_value_error: BOOLEAN
			l_value_context: ET_NESTED_TYPE_CONTEXT
			l_value_type: ET_TYPE
			l_detachable_any_type: ET_CLASS_TYPE
			l_value_named_type: ET_NAMED_TYPE
			l_choices: ET_CHOICE_LIST
			l_choice: ET_CHOICE
			l_choice_constant: ET_CHOICE_CONSTANT
			l_choice_context: ET_NESTED_TYPE_CONTEXT
			l_choice_named_type: ET_NAMED_TYPE
			j, nb2: INTEGER
			l_constant: detachable ET_CONSTANT
			l_cast_type: detachable ET_TARGET_TYPE
			l_index: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_inspect_attachment_scope: detachable like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			l_inspect_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
			l_detachable_any_type := current_system.detachable_any_type
			l_value_context := new_context (current_type)
			l_expression := an_instruction.conditional.expression
			check_expression_validity (l_expression, l_value_context, l_detachable_any_type)
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
			if attached an_instruction.when_parts as l_when_parts then
				l_choice_context := new_context (current_type)
				l_value_type := tokens.identity_type
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
								elseif attached {ET_INTEGER_CONSTANT} l_constant as l_integer_constant then
										-- If we use the same object for the constant attribute
										-- when analyzing different client features, each feature
										-- will assign its own index to this object. That's why
										-- we need to reset the index so that the index does not
										-- get corrupted.
									l_index := l_integer_constant.index
									l_integer_constant.set_index (0)
									l_cast_type := l_integer_constant.cast_type
									l_integer_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_integer_constant, l_choice_context, l_value_context)
									l_integer_constant.set_cast_type (l_cast_type)
									l_integer_constant.set_index (l_index)
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
								elseif attached {ET_CHARACTER_CONSTANT} l_constant as l_character_constant then
										-- If we use the same object for the constant attribute
										-- when analyzing different client features, each feature
										-- will assign its own index to this object. That's why
										-- we need to reset the index so that the index does not
										-- get corrupted.
									l_index := l_character_constant.index
									l_character_constant.set_index (0)
									l_cast_type := l_character_constant.cast_type
									l_character_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_character_constant, l_choice_context, l_value_context)
									l_character_constant.set_cast_type (l_cast_type)
									l_character_constant.set_index (l_index)
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
									elseif attached {ET_INTEGER_CONSTANT} l_constant as l_integer_constant2 then
											-- If we use the same object for the constant attribute
											-- when analyzing different client features, each feature
											-- will assign its own index to this object. That's why
											-- we need to reset the index so that the index does not
											-- get corrupted.
										l_index := l_integer_constant2.index
										l_integer_constant2.set_index (0)
										l_cast_type := l_integer_constant2.cast_type
										l_integer_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_integer_constant2, l_choice_context, l_value_context)
										l_integer_constant2.set_cast_type (l_cast_type)
										l_integer_constant2.set_index (l_index)
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
									elseif attached {ET_CHARACTER_CONSTANT} l_constant as l_character_constant2 then
											-- If we use the same object for the constant attribute
											-- when analyzing different client features, each feature
											-- will assign its own index to this object. That's why
											-- we need to reset the index so that the index does not
											-- get corrupted.
										l_index := l_character_constant2.index
										l_character_constant2.set_index (0)
										l_cast_type := l_character_constant2.cast_type
										l_character_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_character_constant2, l_choice_context, l_value_context)
										l_character_constant2.set_cast_type (l_cast_type)
										l_character_constant2.set_index (l_index)
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
				l_old_initialization_scope := current_initialization_scope
				l_old_attachment_scope := current_attachment_scope
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope := new_attachment_scope
					current_attachment_scope := new_attachment_scope
				end
				from i := 1 until i > nb loop
					l_when_part := l_when_parts.item (i)
					if current_system.attachment_type_conformance_mode then
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						current_attachment_scope.copy_scope (l_old_attachment_scope)
					end
					if attached l_when_part.then_compound as l_then_compound then
						check_instructions_validity (l_then_compound)
						if has_fatal_error then
							had_error := True
						end
					end
					if current_system.attachment_type_conformance_mode then
						if l_inspect_attachment_scope = Void then
							l_inspect_attachment_scope := new_attachment_scope
							l_inspect_attachment_scope.copy_scope (current_attachment_scope)
						else
							l_inspect_attachment_scope.merge_scope (current_attachment_scope)
						end
						if l_inspect_initialization_scope = Void then
							l_inspect_initialization_scope := new_attachment_scope
							l_inspect_initialization_scope.copy_scope (current_initialization_scope)
						else
							l_inspect_initialization_scope.merge_scope (current_initialization_scope)
						end
					end
					i := i + 1
				end
				if current_system.attachment_type_conformance_mode then
					free_attachment_scope (current_initialization_scope)
					free_attachment_scope (current_attachment_scope)
					current_initialization_scope := l_old_initialization_scope
					current_attachment_scope := l_old_attachment_scope
				end
			else
				free_context (l_value_context)
			end
			l_else_compound := an_instruction.else_compound
			if l_else_compound /= Void then
				check_instructions_validity (l_else_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			if current_system.attachment_type_conformance_mode then
				if l_inspect_attachment_scope /= Void then
					if l_else_compound /= Void then
						current_attachment_scope.merge_scope (l_inspect_attachment_scope)
					else
						current_attachment_scope.copy_scope (l_inspect_attachment_scope)
					end
					free_attachment_scope (l_inspect_attachment_scope)
				end
				if l_inspect_initialization_scope /= Void then
					if l_else_compound /= Void then
						current_initialization_scope.merge_scope (l_inspect_initialization_scope)
					else
						current_initialization_scope.copy_scope (l_inspect_initialization_scope)
					end
					free_attachment_scope (l_inspect_initialization_scope)
				end
			end
			if had_error then
				set_fatal_error
			end
		end

	choice_constant (a_choice_constant: ET_CHOICE_CONSTANT): detachable ET_CONSTANT
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
			l_query: detachable ET_QUERY
			l_static_type: ET_TYPE
			l_static_class: ET_CLASS
			l_static_context: ET_NESTED_TYPE_CONTEXT
			l_old_has_fatal_error: BOOLEAN
			l_seed: INTEGER
		do
			l_old_has_fatal_error := has_fatal_error
			if attached {ET_CONSTANT} a_choice_constant as l_constant then
				Result := l_constant
			else
				if attached {ET_IDENTIFIER} a_choice_constant as l_identifier then
					if l_identifier.is_argument then
							-- This is not a constant.
					elseif l_identifier.is_local then
							-- This is not a constant.
					elseif l_identifier.is_object_test_local then
							-- This is not a constant.
					elseif l_identifier.is_iteration_item then
							-- This is not a constant.
					else
						l_seed := l_identifier.seed
						l_query := current_class.seeded_query (l_seed)
					end
				elseif attached {ET_UNQUALIFIED_FEATURE_CALL} a_choice_constant as l_unqualified_call and then l_unqualified_call.arguments_count = 0 then
					l_seed := l_unqualified_call.name.seed
					l_query := current_class.seeded_query (l_seed)
				elseif attached {ET_STATIC_CALL_EXPRESSION} a_choice_constant as l_static_call then
					l_static_type := l_static_call.type
					l_static_context := new_context (current_type)
					l_static_context.force_last (l_static_type)
					l_static_class := l_static_context.base_class
					l_query := l_static_class.seeded_query (l_static_call.name.seed)
					free_context (l_static_context)
				end
				if l_query /= Void then
					if attached {ET_CONSTANT_ATTRIBUTE} l_query as l_constant_attribute then
						Result := l_constant_attribute.constant
						if Result.is_character_constant then
							Result := character_choice_constant
						elseif Result.is_integer_constant then
							Result := integer_choice_constant
						end
					elseif attached {ET_UNIQUE_ATTRIBUTE} l_query as l_unique_attribute then
						Result := integer_choice_constant
					end
				end
			end
			has_fatal_error := l_old_has_fatal_error
		end

	check_iteration_instruction_validity (an_instruction: ET_ITERATION_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			had_error: BOOLEAN
		do
			has_fatal_error := False
			check_iteration_component_header_validity (an_instruction)
			if has_fatal_error then
				had_error := True
			end
			current_iteration_item_scope.add_iteration_component (an_instruction)
			if attached an_instruction.from_compound as l_from_compound then
				check_instructions_validity (l_from_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			check_loop_component_no_from_validity (an_instruction)
			current_iteration_item_scope.remove_iteration_components (1)
			current_iteration_item_types.search (an_instruction)
			if current_iteration_item_types.found then
				free_context (current_iteration_item_types.found_item)
				current_iteration_item_types.remove_found_item
			end
			current_iteration_cursor_types.search (an_instruction)
			if current_iteration_cursor_types.found then
				if not an_instruction.has_cursor_name then
						-- Do not free this context more than once if it
						-- was already in `current_iteration_item_types'.
					free_context (current_iteration_cursor_types.found_item)
				end
				current_iteration_cursor_types.remove_found_item
			end
			if had_error then
				set_fatal_error
			end
		end

	check_loop_instruction_validity (an_instruction: ET_LOOP_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			had_error: BOOLEAN
		do
			has_fatal_error := False
			if attached an_instruction.from_compound as l_from_compound then
				check_instructions_validity (l_from_compound)
				if has_fatal_error then
					had_error := True
				end
			end
			check_loop_component_no_from_validity (an_instruction)
			if had_error then
				set_fatal_error
			end
		end

	check_loop_component_no_from_validity (an_instruction: ET_LOOP_COMPONENT)
			-- Check validity of `an_instruction' except for the from-part.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_until_expression: detachable ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			boolean_type: ET_CLASS_TYPE
			l_old_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
		do
			has_fatal_error := False
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
			end
			if attached an_instruction.invariant_part as l_invariant then
				check_loop_invariant_validity (l_invariant)
				if has_fatal_error then
					had_error := True
				end
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					current_attachment_scope.copy_scope (l_old_attachment_scope)
				end
			end
			if attached an_instruction.variant_part as l_variant then
				check_loop_variant_validity (l_variant)
				if has_fatal_error then
					had_error := True
				end
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					current_attachment_scope.copy_scope (l_old_attachment_scope)
				end
			end
			if attached an_instruction.until_conditional as l_until_conditional then
				boolean_type := current_universe_impl.boolean_type
				l_until_expression := l_until_conditional.expression
				l_expression_context := new_context (current_type)
				check_expression_validity (l_until_expression, l_expression_context, boolean_type)
				if has_fatal_error then
					had_error := True
				elseif not l_expression_context.same_named_type (boolean_type, current_class_impl) then
					had_error := True
					set_fatal_error
					l_named_type := l_expression_context.named_type
					error_handler.report_vwbe0a_error (current_class, current_class_impl, l_until_expression, l_named_type)
				end
				free_context (l_expression_context)
			end
			if attached an_instruction.loop_compound as l_loop_compound and then not l_loop_compound.is_empty then
				if current_system.attachment_type_conformance_mode and l_until_expression /= Void then
					attachment_scope_builder.build_negated_scope (l_until_expression, current_attachment_scope)
				end
				l_old_object_test_scope := current_object_test_scope.count
				if l_loop_compound.has_non_null_instruction and l_until_expression /= Void then
						-- Note: With ISE 6.8, the detection of object-test local name overlap is
						-- triggered only when the loop-compound contains at least one instruction.
					object_test_scope_builder.build_negated_scope (l_until_expression, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
				end
				check_instructions_validity (l_loop_compound)
				current_object_test_scope.keep_object_tests (l_old_object_test_scope)
				if has_fatal_error then
					had_error := True
				end
				if current_system.attachment_type_conformance_mode then
					if not had_error and not l_old_attachment_scope.is_subset (current_attachment_scope) then
							-- Some local variables declared as detachable which were attached
							-- before the first execution of the loop invariant, variant, until
							-- condition and loop body have been detached in the loop body.
							-- We need to check whether subsequent iterations will still work
							-- without any attachment problems.
						check_loop_component_no_from_validity (an_instruction)
					end
				end
			end
			if had_error then
				set_fatal_error
			end
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_attachment_scope)
				free_attachment_scope (current_initialization_scope)
				current_attachment_scope := l_old_attachment_scope
				current_initialization_scope := l_old_initialization_scope
				if l_until_expression /= Void then
					attachment_scope_builder.build_scope (l_until_expression, current_attachment_scope)
				end
			end
		end

	check_loop_invariant_validity (an_invariant: ET_LOOP_INVARIANTS)
			-- Check validity of `an_invariant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_invariant_not_void: an_invariant /= Void
		local
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			boolean_type: ET_CLASS_TYPE
			i, nb: INTEGER
			l_named_type: ET_NAMED_TYPE
			l_old_object_test_scope: INTEGER
		do
			has_fatal_error := False
			boolean_type := current_universe_impl.boolean_type
			l_expression_context := new_context (current_type)
			l_old_object_test_scope := current_object_test_scope.count
			nb := an_invariant.count
			from i := 1 until i > nb loop
				if attached an_invariant.assertion (i).expression as l_expression then
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
						-- The scope of object-test locals can cover the following assertions
						-- in the same loop invariant clause because it's as if they were separated
						-- by "and then" operators.
					object_test_scope_builder.build_scope (l_expression, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					if current_system.attachment_type_conformance_mode then
							-- `current_attachment_scope' will be reset in `check_loop_instruction_no_from_validity'
							-- before processing the other parts of the loop, so that the analysis of the
							-- attachment statuses still works even when loop invariant monitoring is turned off.
						attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
					end
				end
				i := i + 1
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			if had_error then
				set_fatal_error
			end
			free_context (l_expression_context)
		end

	check_loop_variant_validity (a_variant: ET_VARIANT)
			-- Check validity of `a_variant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_variant_not_void: a_variant /= Void
		local
			l_expression: ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
		do
			has_fatal_error := False
			l_expression := a_variant.expression
			l_expression_context := new_context (current_type)
			check_expression_validity (l_expression, l_expression_context, current_universe_impl.integer_type)
			if has_fatal_error then
				had_error := True
			elseif l_expression_context.same_named_type (current_universe_impl.integer_8_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.integer_16_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.integer_32_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.integer_64_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.natural_8_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.natural_16_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.natural_32_type, current_type) then
				-- OK.
			elseif l_expression_context.same_named_type (current_universe_impl.natural_64_type, current_type) then
				-- OK.
			else
					-- The type of the loop variant expression is not
					-- a sized variant of "INTEGER".
				had_error := True
				set_fatal_error
				l_named_type := l_expression_context.named_type
				error_handler.report_vave0a_error (current_class, current_class_impl, l_expression, l_named_type)
			end
			free_context (l_expression_context)
			if had_error then
				set_fatal_error
			end
		end

	check_precursor_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_parent_type: ET_BASE_TYPE
			l_ancestor: detachable ET_BASE_TYPE
			l_class: ET_CLASS
			l_context: ET_NESTED_TYPE_CONTEXT
			l_has_parenthesis_call: BOOLEAN
		do
			has_fatal_error := False
			if not attached {ET_FEATURE} current_feature_impl as l_feature_impl then
					-- The Precursor instruction does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1a_error (current_class, an_instruction)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (an_instruction)
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
				check_orphan_actual_arguments_validity (an_instruction)
			elseif attached current_inline_agent as l_current_inline_agent then
					-- The associated feature of inline agents cannot be redefined.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr3e_error (current_class, an_instruction, l_current_inline_agent, l_feature_impl)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-3 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (an_instruction)
			elseif current_feature.first_precursor = Void then
					-- Immediate features cannot have Precursor.
				set_fatal_error
				if current_class_impl /= current_class then
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: Precursor should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					error_handler.report_vdpr3d_error (current_class, an_instruction, l_feature_impl)
				end
				check_orphan_actual_arguments_validity (an_instruction)
			elseif not attached an_instruction.parent_type as l_unresolved_parent_type then
					-- Internal error: the Precursor construct should
					-- already have been resolved when flattening the
					-- features of `current_class_impl'. And the feature flattener
					-- has already been executed on `current_class' at this stage,
					-- and hence on the ancestor class `current_class_impl'.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (an_instruction)
			else
				l_parent_type := l_unresolved_parent_type
				if current_class /= current_class_impl and l_parent_type.is_generic then
						-- Resolve generic parameters in the context of `current_type'.
						-- The ancestor builder has already been executed on `current_class'
						-- at this stage, and therefore there is no need to check it again here.
					l_ancestor := current_class.ancestor (l_parent_type)
					if l_ancestor = Void then
							-- Internal error: `l_parent_type' is an ancestor
							-- of `current_class_impl', and hence of `current_class'.
						set_fatal_error
						error_handler.report_giaaa_error
						check_orphan_actual_arguments_validity (an_instruction)
					else
						l_parent_type := l_ancestor
					end
				end
				if not has_fatal_error then
					l_precursor_keyword := an_instruction.precursor_keyword
					l_class := l_parent_type.base_class
					if attached l_class.seeded_procedure (l_precursor_keyword.seed) as l_procedure then
						check_precursor_procedure_instruction_validity (an_instruction, l_procedure, l_class, l_parent_type)
					elseif attached l_class.seeded_query (l_precursor_keyword.seed) as l_query then
							-- Check for parenthesis alias.
						if current_class = current_class_impl then
							l_context := new_context (current_type)
							check_precursor_parenthesis_call_validity (an_instruction, l_query, l_class, l_parent_type, l_context)
							free_context (l_context)
							if not has_fatal_error and then an_instruction.parenthesis_call /= Void then
								l_has_parenthesis_call := True
							end
						end
						if not has_fatal_error and then not l_has_parenthesis_call then
								-- The precursor in a function cannot be used as an instruction.
							set_fatal_error
							error_handler.report_vkcn1a_error (current_class, l_precursor_keyword, l_query, l_class)
							check_orphan_actual_arguments_validity (an_instruction)
						end
					else
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `current_class_impl'.
						set_fatal_error
						error_handler.report_giaaa_error
						check_orphan_actual_arguments_validity (an_instruction)
					end
				end
			end
		end

	check_precursor_procedure_instruction_validity (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_procedure: ET_PROCEDURE; a_parent_class: ET_CLASS; a_parent_type: ET_BASE_TYPE)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
			a_parent_procedure_not_void: a_parent_procedure /= Void
			a_parent_class_not_void: a_parent_class /= Void
			a_parent_type_not_void: a_parent_type /= Void
		local
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_had_error: BOOLEAN
		do
			if in_static_feature and then not a_parent_procedure.is_static then
					-- Error: we cannot call a non-static precursor from a static feature.
				set_fatal_error
				error_handler.report_vucr0h_error (current_class, current_class_impl, an_instruction.precursor_keyword, a_parent_procedure)
				l_had_error := True
			end
			l_actual_context := new_context (current_type)
			l_actual_context.force_last (a_parent_type)
			check_actual_arguments_validity (an_instruction, l_actual_context, a_parent_procedure, a_parent_class, Void)
			free_context (l_actual_context)
			reset_fatal_error (l_had_error or has_fatal_error)
			if not has_fatal_error then
				report_precursor_instruction (an_instruction, a_parent_type, a_parent_procedure)
				if attached precursor_procedures as l_precursor_procedures then
					l_precursor_procedures.force_last (a_parent_procedure)
				end
			end
		end

	check_qualified_call_instruction_validity (a_call: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Check validity of qualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_target: ET_EXPRESSION
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
		do
			has_fatal_error := False
			l_target := a_call.target
			l_context := new_context (current_type)
			l_name := a_call.name
			l_seed := l_name.seed
			check_expression_validity (l_target, l_context, current_system.detachable_any_type)
			l_context_count := l_context.count
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				l_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, l_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (a_call)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, l_context)
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_qualified_dotnet_procedure_call_instruction_validity (a_call, l_adapted_base_class, l_context)
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_qualified_procedure_call_instruction_validity (a_call, l_procedure, l_class, l_context)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						-- Check for parenthesis alias.
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
					check_query_parenthesis_call_validity (a_call, l_query, l_class, l_context, Void)
					if has_fatal_error then
						-- Do nothing.
					elseif a_call.parenthesis_call = Void then
							-- In a call instruction, the feature has to be a procedure.
						set_fatal_error
						error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
						check_orphan_actual_arguments_validity (a_call)
					end
				else
					if l_class.is_tuple_class and then attached {ET_IDENTIFIER} l_name as l_label then
							-- Check whether this is a tuple label.
						l_seed := l_adapted_base_class.base_type_index_of_label (l_label, l_context)
						if l_seed /= 0 then
							l_label.set_tuple_label (True)
							l_label.set_seed (l_seed)
								-- Check for parenthesis alias.
							check_tuple_label_parenthesis_call_validity (a_call, l_class, l_context, Void)
							if has_fatal_error then
								-- Do nothing.
							elseif a_call.parenthesis_call = Void then
									-- In a call instruction, the feature has to be a procedure.
								set_fatal_error
								error_handler.report_vkcn1b_error (current_class, l_label, l_class)
								check_orphan_actual_arguments_validity (a_call)
							end
						end
					end
					if l_seed = 0 then
						set_fatal_error
							-- ISE Eiffel 5.4 reports this error as a VEEN,
							-- but it is in fact a VUEX-2 (ETL2 p.368).
						error_handler.report_vuex2a_error (current_class, l_name, l_class)
						check_orphan_actual_arguments_validity (a_call)
					end
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- instruction was written. So, if we got a seed, there should be a
					-- procedure for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, l_context)
						check_qualified_procedure_call_instruction_validity (a_call, l_procedure, l_class, l_context)
						l_context.keep_first (l_context_count)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- instruction was written. So, if we got a seed, a procedure should
							-- exist.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					end
					i := i + 1
				end
			end
			free_context (l_context)
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_qualified_dotnet_procedure_call_instruction_validity (a_call: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION; a_adapted_base_class: ET_ADAPTED_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified call `a_call' to a .NET procedure.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_class_is_dotnet: a_adapted_base_class.base_class.is_dotnet
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_class: ET_CLASS
			l_procedure: ET_PROCEDURE
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_call.name
			l_overloaded_procedures := new_overloaded_procedures
			a_adapted_base_class.add_overloaded_procedures (l_name, l_overloaded_procedures)
			if not l_overloaded_procedures.is_empty then
				keep_best_overloaded_features (l_overloaded_procedures, adapted_name (l_name, a_adapted_base_class), a_call.arguments, a_context, False, False)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				elseif l_overloaded_procedures.count = 1 then
					l_procedure := l_overloaded_procedures.first
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_qualified_procedure_call_instruction_validity (a_call, l_procedure, l_class, a_context)
				else
						-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached a_adapted_base_class.named_query (l_name) as l_query then
				check_query_parenthesis_call_validity (a_call, l_query, l_class, a_context, Void)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call = Void then
						-- In a call instruction, the feature has to be a procedure.
					set_fatal_error
					error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
					check_orphan_actual_arguments_validity (a_call)
				end
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class, l_name, l_class)
				check_orphan_actual_arguments_validity (a_call)
			end
			free_overloaded_procedures (l_overloaded_procedures)
		end

	check_qualified_feature_call_instruction_validity (a_call: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION; a_feature: ET_FEATURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified call `a_call' to feature `a_feature'.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			if attached {ET_PROCEDURE} a_feature as l_procedure then
				check_qualified_procedure_call_instruction_validity (a_call, l_procedure, a_class, a_context)
			elseif attached {ET_QUERY} a_feature as l_query then
					-- In a call instruction, the feature has to be a procedure.
				set_fatal_error
				error_handler.report_vkcn1a_error (current_class, a_call.name, l_query, a_class)
				check_orphan_actual_arguments_validity (a_call)
			else
					-- The feature is either a query or a procedure.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			end
		end

	check_qualified_procedure_call_instruction_validity (a_call: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified call `a_call' to feature `a_procedure'.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_procedure_not_void: a_procedure /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_feature_call_validity (a_call, a_procedure, a_class, a_context, Void)
			if not has_fatal_error then
				report_qualified_call_instruction (a_call, a_context, a_procedure)
			end
		end

	check_repeat_instruction_validity (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Check validity of `a_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_instruction_not_void: a_instruction /= Void
		do
			check_iteration_instruction_validity (a_instruction)
		end

	check_retry_instruction_validity (an_instruction: ET_RETRY_INSTRUCTION)
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

	check_static_call_instruction_validity (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Check validity of `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
			l_type: ET_TYPE
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
		do
			has_fatal_error := False
			l_context := new_context (current_type)
			l_type := an_instruction.type
			l_name := an_instruction.name
			l_seed := l_name.seed
			check_type_validity (l_type)
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				l_context.force_last (l_type)
				l_context_count := l_context.count
				l_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, l_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (an_instruction)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, l_context)
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (an_instruction)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_static_dotnet_procedure_call_instruction_validity (an_instruction, l_adapted_base_class, l_context)
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_static_procedure_call_instruction_validity (an_instruction, l_procedure, l_class, l_context)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						-- Check for parenthesis alias.
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
					check_static_parenthesis_call_validity (an_instruction, l_query, l_class, l_context)
					if has_fatal_error then
						-- Do nothing.
					elseif an_instruction.parenthesis_call = Void then
							-- In a call instruction, the feature has to be a procedure.
						set_fatal_error
						error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
						check_orphan_actual_arguments_validity (an_instruction)
					end
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-2 (ETL2 p.368).
					error_handler.report_vuex2a_error (current_class, l_name, l_class)
					check_orphan_actual_arguments_validity (an_instruction)
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- instruction was written. So, if we got a seed, there should be a
					-- procedure for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (an_instruction)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, l_context)
						check_static_procedure_call_instruction_validity (an_instruction, l_procedure, l_class, l_context)
						l_context.keep_first (l_context_count)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- instruction was written. So, if we got a seed, a procedure should
							-- exist.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					end
					i := i + 1
				end
			end
			free_context (l_context)
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_static_dotnet_procedure_call_instruction_validity (a_call: ET_STATIC_CALL_INSTRUCTION; a_adapted_base_class: ET_ADAPTED_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of static call `a_call' to a .NET procedure.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the static type part of the call is assumed to have already been checked.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the static type part of `a_call'.
			-- `a_context' represents the static type part of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_class_is_dotnet: a_adapted_base_class.base_class.is_dotnet
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_class: ET_CLASS
			l_procedure: ET_PROCEDURE
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_call.name
			l_overloaded_procedures := new_overloaded_procedures
			a_adapted_base_class.add_overloaded_procedures (l_name, l_overloaded_procedures)
			if not l_overloaded_procedures.is_empty then
				keep_best_overloaded_features (l_overloaded_procedures, adapted_name (l_name, a_adapted_base_class), a_call.arguments, a_context, True, False)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				elseif l_overloaded_procedures.count = 1 then
					l_procedure := l_overloaded_procedures.first
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_static_procedure_call_instruction_validity (a_call, l_procedure, l_class, a_context)
				else
					-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached a_adapted_base_class.named_query (l_name) as l_query then
				check_static_parenthesis_call_validity (a_call, l_query, l_class, a_context)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call = Void then
						-- In a call instruction, the feature has to be a procedure.
					set_fatal_error
					error_handler.report_vkcn1a_error (current_class, l_name, l_query, l_class)
					check_orphan_actual_arguments_validity (a_call)
				end
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class, l_name, l_class)
				check_orphan_actual_arguments_validity (a_call)
			end
			free_overloaded_procedures (l_overloaded_procedures)
		end

	check_static_procedure_call_instruction_validity (a_call: ET_STATIC_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of static call `a_call' to feature `a_procedure'.
			-- The validity of the static type part of the call is assumed to have already been checked.
			-- `a_class' is the base class of the static type part of the call.
			-- `a_context' represents the static type part of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_procedure_not_void: a_procedure /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_name: ET_CALL_NAME
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
			l_type := a_call.type
			report_static_supplier (l_type, current_class, current_feature)
				-- Check export status.
			if not a_procedure.is_exported_to (current_class, system_processor) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, a_procedure, a_class)
			end
			l_had_error := has_fatal_error
				-- Check that if the call to `a_procedure' appears in a precondition
				-- of `current_feature', then it is exported to all classes to which
				-- `current_feature' is exported.
			check_qualified_vape_validity (l_name, a_procedure, a_class)
			l_had_error := has_fatal_error or l_had_error
				-- Check the validity of the arguments of the call.
			check_actual_arguments_validity (a_call, a_context, a_procedure, a_class, Void)
			l_had_error := has_fatal_error or l_had_error
				-- Check the validity `a_procedure' as a feature of a static call.
			check_static_feature_validity (a_call, a_procedure, a_class)
			reset_fatal_error (has_fatal_error or l_had_error)
			if not has_fatal_error then
				report_static_call_instruction (a_call, l_type, a_procedure)
			end
		end

	check_unqualified_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Check validity of unqualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_context: ET_NESTED_TYPE_CONTEXT
			l_checked: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
			l_seed := l_name.seed
			if attached {ET_IDENTIFIER} l_name as l_identifier then
				if l_identifier.is_argument then
					check_unqualified_formal_argument_call_instruction_validity (a_call, l_identifier)
					l_checked := True
				elseif l_identifier.is_local then
					check_unqualified_local_variable_call_instruction_validity (a_call, l_identifier)
					l_checked := True
				elseif l_identifier.is_iteration_item then
					check_unqualified_iteration_item_call_instruction_validity (a_call, l_identifier)
					l_checked := True
				elseif l_identifier.is_object_test_local then
					check_unqualified_object_test_local_call_instruction_validity (a_call, l_identifier)
					l_checked := True
				end
			end
			if l_checked then
				-- Do nothing.
			elseif l_seed = 0 then
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				elseif attached current_class.named_procedure (l_name) as l_procedure then
						-- Note that we need to check the interface of `current_class' again.
						-- It's already done in `check_feature_validity'.
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_unqualified_procedure_call_instruction_validity (a_call, l_procedure)
				elseif attached current_class.named_query (l_name) as l_query then
						-- Check for parenthesis alias.
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
					l_context := new_context (current_type)
					check_query_parenthesis_call_validity (a_call, l_query, current_class, l_context, Void)
					free_context (l_context)
					if has_fatal_error then
						-- Do nothing.
					elseif a_call.parenthesis_call = Void then
							-- In a call instruction, the feature has to be a procedure.
						set_fatal_error
						error_handler.report_vkcn1c_error (current_class, l_name, l_query)
						check_orphan_actual_arguments_validity (a_call)
					end
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-1 (ETL2 p.368).
					error_handler.report_vuex1a_error (current_class, l_name)
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached current_class.seeded_procedure (l_seed) as l_procedure then
					-- Note that we don't need to check the interface of `current_class' again
					-- before calling `seeded_procedure'. It's already done in `check_feature_validity'.
				check_unqualified_procedure_call_instruction_validity (a_call, l_procedure)
			else
					-- Report internal error: the seed was already computed in a proper
					-- ancestor (or in another generic derivation) of `current_class'
					-- where this instruction was written. So there should be
					-- a procedure for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			end
		end

	check_unqualified_formal_argument_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION; a_name: ET_IDENTIFIER)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be a formal argument.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_argument: a_name.is_argument
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			if current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				l_context := new_context (current_type)
				check_formal_argument_parenthesis_call_validity (a_call, a_name, l_context)
				free_context (l_context)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call /= Void then
					-- The validity checking has already been done with the
					-- unfolded form of the parenthesis call.
				else
					if a_call.arguments /= Void then
							-- Syntax error: a formal argument cannot have arguments.
						set_fatal_error
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_gvuaa0b_error (current_class, a_name, l_current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_gvuaa0a_error (current_class, a_name, current_feature_impl.as_feature)
						else
								-- Internal error: invariants don't have formal arguments.
							error_handler.report_giaaa_error
						end
					end
						-- Syntax error: a formal argument cannot be an instruction.
					set_fatal_error
						-- Note: ISE 5.4 reports a VKCN-1 here. However
						-- `a_name' is not a function nor an attribute name.
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuia0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuia0a_error (current_class, a_name, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have formal arguments.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_iteration_item_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION; a_name: ET_IDENTIFIER)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be an iteration item.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_iteration_item: a_name.is_iteration_item
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			if current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				l_context := new_context (current_type)
				check_iteration_item_parenthesis_call_validity (a_call, a_name, l_context)
				free_context (l_context)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call /= Void then
					-- The validity checking has already been done with the
					-- unfolded form of the parenthesis call.
				else
					if a_call.arguments /= Void then
							-- Syntax error: an across cursor cannot have arguments.
						set_fatal_error
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_gvuac0b_error (current_class, a_name, l_current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_gvuac0a_error (current_class, a_name, current_feature_impl.as_feature)
						elseif current_feature_impl.is_invariants then
							error_handler.report_gvuac0c_error (current_class, a_name, current_feature_impl.as_invariants)
						else
							error_handler.report_giaaa_error
						end
					end
						-- Syntax error: an across cursor cannot be an instruction.
					set_fatal_error
						-- Note: ISE 5.4 reports a VKCN-1 here. However
						-- `a_name' is not a function nor an attribute name.
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuic0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuic0a_error (current_class, a_name, current_feature_impl.as_feature)
					elseif current_feature_impl.is_invariants then
						error_handler.report_gvuic0c_error (current_class, a_name, current_feature_impl.as_invariants)
					else
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_local_variable_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION; a_name: ET_IDENTIFIER)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be a local variable.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_local: a_name.is_local
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			if current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				l_context := new_context (current_type)
				check_local_variable_parenthesis_call_validity (a_call, a_name, l_context)
				free_context (l_context)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call /= Void then
					-- The validity checking has already been done with the
					-- unfolded form of the parenthesis call.
				else
					if a_call.arguments /= Void then
							-- Syntax error: a local variable cannot have arguments.
						set_fatal_error
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_gvual0b_error (current_class, a_name, l_current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_gvual0a_error (current_class, a_name, current_feature_impl.as_feature)
						else
								-- Internal error: invariants don't have local variables.
							error_handler.report_giaaa_error
						end
					end
						-- Syntax error: a local variable cannot be an instruction.
					set_fatal_error
						-- Note: ISE 5.4 reports a VKCN-1 here. However
						-- `a_name' is not a function nor an attribute name.
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuil0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuil0a_error (current_class, a_name, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have local variables.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_object_test_local_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION; a_name: ET_IDENTIFIER)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be an object-test local.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_object_test_local: a_name.is_object_test_local
		local
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			if current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				l_context := new_context (current_type)
				check_object_test_local_parenthesis_call_validity (a_call, a_name, l_context)
				free_context (l_context)
				if has_fatal_error then
					-- Do nothing.
				elseif a_call.parenthesis_call /= Void then
					-- The validity checking has already been done with the
					-- unfolded form of the parenthesis call.
				else
					if a_call.arguments /= Void then
							-- Syntax error: an object-test local cannot have arguments.
						set_fatal_error
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_gvuac0b_error (current_class, a_name, l_current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_gvuac0a_error (current_class, a_name, current_feature_impl.as_feature)
						elseif current_feature_impl.is_invariants then
							error_handler.report_gvuac0c_error (current_class, a_name, current_feature_impl.as_invariants)
						else
							error_handler.report_giaaa_error
						end
					end
						-- Syntax error: an object-test local cannot be an instruction.
					set_fatal_error
						-- Note: ISE 5.4 reports a VKCN-1 here. However
						-- `a_name' is not a function nor an attribute name.
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuio0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuio0a_error (current_class, a_name, current_feature_impl.as_feature)
					elseif current_feature_impl.is_invariants then
						error_handler.report_gvuio0c_error (current_class, a_name, current_feature_impl.as_invariants)
					else
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_procedure_call_instruction_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE)
			-- Check validity of unqualified call `a_call' to feature `a_procedure'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_procedure_not_void: a_procedure /= Void
		local
			l_name: ET_CALL_NAME
			l_had_error: BOOLEAN
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_name := a_call.name
			if in_static_feature and then not a_procedure.is_static then
					-- Error: we cannot have an unqualified call to
					-- non-static feature in a static feature.
				set_fatal_error
				error_handler.report_vucr0d_error (current_class, current_class_impl, l_name, a_procedure)
				l_had_error := True
			end
				-- Check that all features which are called in a precondition of `a_procedure'
				-- are exported to every class to which `a_procedure' is exported.
			check_unqualified_vape_validity (l_name, a_procedure)
			l_had_error := l_had_error or has_fatal_error
				-- Check the validity of the arguments of the call.
			l_context := new_context (current_type)
			check_actual_arguments_validity (a_call, l_context, a_procedure, Void, Void)
			free_context (l_context)
			reset_fatal_error (l_had_error or has_fatal_error)
			if not has_fatal_error then
				report_unqualified_call_instruction (a_call, a_procedure)
			end
		end

	check_instructions_validity (a_compound: ET_COMPOUND)
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

	check_rescue_validity (a_compound: ET_COMPOUND)
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

	check_across_expression_validity (an_expression: ET_ACROSS_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_iteration_expression_validity (an_expression, a_context)
		end

	check_binary_integer_constant_validity (a_constant: ET_BINARY_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_bracket_expression_validity (an_expression: ET_BRACKET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_expression_validity (an_expression, a_context, Void)
		end

	check_c1_character_constant_validity (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_c2_character_constant_validity (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_c3_character_constant_validity (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_character_constant_validity (a_constant: ET_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- A character constant is of the form:
			--    [manifest_type] manifest_value
			-- where the manifest_type is optional.
			-- We have to check that:
			--  * if 'manifest_type' is provided:
			--    * it is a valid type, and is one of the sized variants of "CHARACTER".
			--    * 'manifest_value' is representable as an instance of 'manifest_type'.
			--  * otherwise, try to determine whether 'manifest_value' is representable
			--    as an instance of the type expected in the surrounding context.
			--  * otherwise, the constant will be of type "CHARACTER_8" if 'manifest_value'
			--    is representable as a CHARACTER_8, otherwise of type "CHARACTER_32" if it
			--    is representable as a CHARACTER_32.
			--  * otherwise, report an error.
			--
			-- Note that ECMA 367-2 says that the type of a manifest character constant
			-- with no explicit 'manifest_type' is "CHARACTER" (see 8.29.6 "Definition:
			-- Type of a manifest constant", page 143). So the third bullet above is
			-- not quite compliant with ECMA. But this is the way it is implemented
			-- in ISE (as of 20.05.10.xxxx) to be able to capture Unicode characters.
			--
			-- Note that the sized variants of "CHARACTER" include "CHARACTER" itself, as
			-- indicated in ECMA 367-2, 8.30.1 "Definition: Basic types and their sized
			-- variants", page 147.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: detachable ET_CLASS_TYPE
			l_cast_type: detachable ET_TARGET_TYPE
			l_explicit_type: detachable ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.identity_type
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
				-- Do nothing
			elseif current_universe_impl.character_8_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_character_8 then
					l_type := current_universe_impl.character_8_type
					report_character_8_constant (a_constant, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2b_error (current_class, current_class_impl, a_constant, current_universe_impl.character_8_type)
				end
			elseif current_universe_impl.character_32_type.same_named_type (l_expected_type, l_expected_type_context, current_class_impl) then
				if a_constant.is_character_32 then
					l_type := current_universe_impl.character_32_type
					report_character_32_constant (a_constant, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2b_error (current_class, current_class_impl, a_constant, current_universe_impl.character_32_type)
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "CHARACTER".
				set_fatal_error
				error_handler.report_vwmq0c_error (current_class, current_class_impl, a_constant)
			elseif a_constant.is_character_8 then
				l_type := current_universe_impl.character_8_type
				report_character_8_constant (a_constant, l_type)
			elseif a_constant.is_character_32 then
				l_type := current_universe_impl.character_32_type
				report_character_32_constant (a_constant, l_type)
			else
				set_fatal_error
				error_handler.report_gvwmc2b_error (current_class, current_class_impl, a_constant, current_universe_impl.character_32_type)
			end
			if l_type /= Void then
				a_constant.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_convert_builtin_expression_validity (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
				l_target_type := an_expression.type
				report_builtin_conversion (an_expression, l_target_type)
				a_context.reset (current_type)
				a_context.force_last (l_target_type)
			end
		end

	check_convert_from_expression_validity (an_expression: ET_CONVERT_FROM_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_convert_to_expression_validity (an_expression: ET_CONVERT_TO_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_expression_validity (an_expression, a_context, Void)
		end

	check_converted_target_infix_expression_validity (a_expression: ET_INFIX_EXPRESSION; a_left_class: ET_CLASS; a_left_context, a_right_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check whether it is possible to convert the left-hand-side of `a_expression' to
			-- the type of its right-hand-side and have a valid resulting infix expression.
			-- Update `a_expression' accordingly the resulting infix expression is valid.
			-- `a_left_context' represents the type of the left-hand-side, and `a_right_context'
			-- the type of the right-hand-side.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_left_class_not_void: a_left_class /= Void
			a_left_context_not_void: a_left_context /= Void
			a_right_context_not_void: a_right_context /= Void
			in_implementation_class: current_class = current_class_impl
		local
			l_name: ET_OPERATOR
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_right_class: ET_CLASS
			l_cast_expression: detachable ET_INFIX_CAST_EXPRESSION
			l_left_expression: ET_EXPRESSION
			l_formal: detachable ET_FORMAL_ARGUMENT
			l_new_query: detachable ET_QUERY
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			l_name := a_expression.name
			l_left_expression := a_expression.left
			l_adapted_base_classes := new_adapted_base_classes
			a_right_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
			check_adapted_base_classes_validity (l_name, l_adapted_base_classes, a_right_context)
			l_adapted_base_class := l_adapted_base_classes.first
			l_right_class := l_adapted_base_class.base_class
			if has_fatal_error then
				-- Done.
			elseif a_right_context.same_named_context (a_left_context) then
				-- Done.
			elseif l_right_class = a_left_class then
				-- Done.
			elseif not attached l_adapted_base_class.named_query (l_name) as l_query then
				-- Done.
			elseif not l_query.is_exported_to (current_class, system_processor) then
				-- Done.
			elseif not attached l_query.arguments as l_formal_arguments or else l_formal_arguments.count /= 1 then
				-- Done.
			elseif attached convert_expression (l_left_expression, a_left_context, a_right_context) as l_convert_expression and then not has_fatal_error then
					-- Insert the conversion feature call in the AST.
				create l_cast_expression.make (l_convert_expression, a_right_context.named_type)
				l_cast_expression.set_index (l_convert_expression.index)
				l_formal := l_formal_arguments.formal_argument (1)
				l_new_query := l_query
			elseif has_fatal_error then
				-- Done
			elseif a_left_context.conforms_to_context (a_right_context, system_processor) then
					-- The left-hand-side does not convert to the type
					-- of the right-hand-side, but it conforms to it!
				create l_cast_expression.make (l_left_expression, a_right_context.named_type)
				l_cast_expression.set_index (l_left_expression.index)
				l_new_query := l_query
				l_formal := l_formal_arguments.formal_argument (1)
			end
			free_adapted_base_classes (l_adapted_base_classes)
			if l_cast_expression = Void or l_formal = Void or l_new_query = Void then
				-- Done.
			elseif a_right_context.conforms_to_type (l_formal.type, a_right_context, system_processor) then
-- TODO: should we check for convertibility if no conformance?
-- Check what ECMA Eiffel says.
					-- The right-hand-side is a valid actual argument for
					-- the replacement query.
				if a_call_info /= Void then
					a_call_info.query := l_new_query
					a_call_info.target_class := l_right_class
					a_call_info.target_context.copy_type_context (a_right_context)
				end
					-- Insert the cast expression in the AST.
				a_expression.set_left (l_cast_expression)
				l_name.set_seed (l_new_query.first_seed)
				if l_right_class.is_boolean_class then
						-- It is useful to know which binary expressions are
						-- boolean operators between two boolean expressions
						-- when trying to determine the scope of object-test locals
						-- and CAPs (Certified Attachment Patterns).
					a_expression.set_boolean_operator (True)
						-- We should note that if the left-hand-side contains object-tests
						-- or attachment tests, then the right-hand-side was not in the
						-- scope of object-test locals when we checked earlier with the
						-- previous type for the target (i.e. the left-hand-side)
						-- because at that time the target was not of type boolean.
						-- Now the target is of type boolean, but nothing has changed
						-- with respect to the scope of object-test locals.
						-- For example, in:
						--
						--    (object_of_some_type and attached x as x1 and y /= Void).to_boolean implies f (x1.g, y.h) = 5
						--
						-- If the right-and-side was not in the scope of 'x1' and 'y'
						-- before the conversion, it is still not in the scope despite
						-- the conversion of the target. Therefore we don't need to reprocess
						-- the right-hand-side in this new context.
				elseif a_expression.is_boolean_operator then
					a_expression.set_boolean_operator (False)
						-- We should note that if the left-hand-side contains object-tests
						-- or attachment tests, then the right-hand-side could have been
						-- in the scope of object-test locals when we checked earlier with
						-- the previous type for the target (i.e. the left-hand-side)
						-- because at that time the target was of type boolean.
						-- Now the target is not of type boolean anymore, so the right-hand-side
						-- should not be in the scope of these object-test locals anymore
						-- For example:
						--
						--    (attached x as x1 and y /= Void).to_other_type implies f (x1.g, y.h)
						--
						-- So we need to reprocess the right-hand-side in this new context in
						-- order to check again the scope of 'x1' and 'y'.
					l_context := new_context (current_type)
					a_right_context.force_last (l_formal.type)
					check_expression_validity (a_expression.right, l_context, a_right_context)
					a_right_context.remove_last
					free_context (l_context)
				end
			end
		end

	check_create_expression_validity (an_expression: ET_CREATE_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_creation_expression_validity (an_expression: ET_CREATION_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_class: ET_CLASS
			l_creation_type: ET_TYPE
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			l_name_position: ET_POSITION
			l_creation_call: detachable ET_CREATION_CALL
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			i, nb: INTEGER
		do
			has_fatal_error := False
			l_creation_call := an_expression.creation_call
			if l_creation_call /= Void then
					-- There is an explicit creation call.
				l_name := l_creation_call.name
				l_seed := l_name.seed
			else
					-- No explicit creation call. Use 'default_create' instead.
				l_creation_call := default_creation_call
				l_name_position := an_expression.last_position
				default_creation_call_name.set_position (l_name_position.line, l_name_position.column)
				l_name := default_creation_call_name
				l_seed := current_system.default_create_seed
			end
			l_creation_type := an_expression.type
			a_context.force_last (l_creation_type)
			check_type_validity (l_creation_type)
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, a_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (l_creation_call)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				if l_creation_call = default_creation_call then
						-- There is no explicit creation call.
					check_creation_procedure_call_expression_validity (an_expression, l_creation_call, Void, l_adapted_base_class, l_has_multiple_constraints, a_context)
				elseif current_class_impl /= current_class then
						-- We need to resolve `l_name' in the implementation
						-- class of `current_feature_impl' first.
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (l_creation_call)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_dotnet_creation_procedure_call_expression_validity (an_expression, l_creation_call, l_adapted_base_class, l_has_multiple_constraints, a_context)
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_creation_procedure_call_expression_validity (an_expression, l_creation_call, l_procedure, l_adapted_base_class, l_has_multiple_constraints, a_context)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
						-- This is not a procedure.
					set_fatal_error
					error_handler.report_vgcc6b_error (current_class, l_name, l_query, l_class)
					check_orphan_actual_arguments_validity (l_creation_call)
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-2 (ETL2 p.368).
					error_handler.report_vuex2a_error (current_class, l_name, l_class)
					check_orphan_actual_arguments_validity (l_creation_call)
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- creation expression was written. So, if we got a seed, there should
					-- be a procedure for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (l_creation_call)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						check_creation_procedure_call_expression_validity (an_expression, l_creation_call, l_procedure, l_adapted_base_class, l_has_multiple_constraints, a_context)
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- creation expression was written. So, if we got a seed, there should
							-- be a procedure for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					end
					i := i + 1
				end
			end
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_dotnet_creation_procedure_call_expression_validity (a_expression: ET_CREATION_EXPRESSION; a_creation_call: ET_CREATION_CALL; a_adapted_base_class: ET_ADAPTED_CLASS; a_has_multiple_constraints: BOOLEAN; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression' with .NET creation type base class.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the type of the creation is assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_context' represents the creation type of `a_expression'.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the creation type.
			-- `a_has_multiple_constraints' means that creation type is a formal parameter
			-- with multiple constraints.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_creation_call_not_void: a_creation_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_context_not_void: a_context /= Void
			a_context_count: a_context.count = 1
		local
			l_class: ET_CLASS
			l_procedure: ET_PROCEDURE
			l_seed: INTEGER
			l_name: ET_FEATURE_NAME
			l_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_creation_call.name
			l_overloaded_procedures := new_overloaded_procedures
			a_adapted_base_class.add_overloaded_procedures (l_name, l_overloaded_procedures)
			if not l_overloaded_procedures.is_empty then
				keep_best_overloaded_features (l_overloaded_procedures, adapted_name (l_name, a_adapted_base_class), a_creation_call.arguments, a_context, False, True)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_creation_call)
				elseif l_overloaded_procedures.count = 1 then
					l_procedure := l_overloaded_procedures.first
					l_seed := l_procedure.first_seed
					l_name.set_seed (l_seed)
					check_creation_procedure_call_expression_validity (a_expression, a_creation_call, l_procedure, a_adapted_base_class, a_has_multiple_constraints, a_context)
				else
					-- Ambiguity in overloaded procedures.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_creation_call)
				end
			elseif attached a_adapted_base_class.named_query (l_name) as l_query then
					-- This is not a procedure.
				set_fatal_error
				error_handler.report_vgcc6b_error (current_class, l_name, l_query, l_class)
				check_orphan_actual_arguments_validity (a_creation_call)
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class, l_name, l_class)
				check_orphan_actual_arguments_validity (a_creation_call)
			end
			free_overloaded_procedures (l_overloaded_procedures)
		end

	check_creation_procedure_call_expression_validity (a_expression: ET_CREATION_EXPRESSION; a_creation_call: ET_CREATION_CALL; a_procedure: detachable ET_PROCEDURE; a_adapted_base_class: ET_ADAPTED_CLASS; a_has_multiple_constraints: BOOLEAN; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression' with `a_procedure' as creation procedure.
			-- The validity of the type of the creation is assumed to have already been checked.
			-- `a_creation_call' is the creation call in `current_class_impl'.
			-- `a_context' represents the creation type of `a_expression'.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the creation type.
			-- `a_has_multiple_constraints' means that creation type is a formal parameter
			-- with multiple constraints.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_creation_call_not_void: a_creation_call /= Void
			no_call_if_not_procedure: a_procedure = Void implies a_creation_call = default_creation_call
			no_default_create_if_not_procedure: a_procedure = Void implies current_system.default_create_seed = 0
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_context_not_void: a_context /= Void
			a_context_count: a_context.count = 1
		local
			l_creation_type: ET_TYPE
			l_creation_named_type: ET_NAMED_TYPE
			l_creation_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_class: ET_CLASS
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_creation_type := a_context.last
			a_context.remove_last
			l_creation_named_type := l_creation_type.shallow_named_type (a_context)
			a_context.put_last (l_creation_type)
			report_create_supplier (l_creation_type, current_class, current_feature)
			if attached {ET_BASE_TYPE} l_creation_named_type as l_base_type then
				check_creation_type_validity (l_base_type, a_expression.type_position)
				had_error := has_fatal_error
			end
			if a_procedure = Void then
				check_no_creation_procedure_call_validity (a_expression, a_creation_call, l_class, a_context)
			elseif attached {ET_FORMAL_PARAMETER_TYPE} l_creation_named_type as l_formal_type then
				if a_has_multiple_constraints then
					l_creation_context := new_context (current_type)
					l_creation_context.copy_type_context (a_context)
					adapted_base_class_checker.reset_context_if_multiple_constraints (a_has_multiple_constraints, a_adapted_base_class, l_creation_context)
					check_formal_creation_procedure_call_validity (a_expression, a_creation_call, a_procedure, l_class, l_formal_type, l_creation_context)
					free_context (l_creation_context)
				else
					check_formal_creation_procedure_call_validity (a_expression, a_creation_call, a_procedure, l_class, l_formal_type, a_context)
				end
			else
				check_creation_procedure_call_validity (a_expression, a_creation_call, a_procedure, l_class, a_context)
			end
			reset_fatal_error (had_error or has_fatal_error)
			if not has_fatal_error then
				if current_system.attachment_type_conformance_mode then
						-- When we have:
						--
						--   create {detachable FOO}.make
						--
						-- even if 'detachable FOO' is detachable, the type of
						-- the creation expression is attached.
					if not a_context.is_type_attached then
						a_context.force_last (tokens.attached_like_current)
						l_creation_named_type := l_creation_named_type.type_with_type_mark (tokens.implicit_attached_type_mark)
					end
				end
				report_creation_expression (a_expression, l_creation_named_type, a_procedure)
			end
		end

	check_current_validity (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if in_static_feature then
					-- Error: 'Current' cannot be used in a static feature.
				set_fatal_error
				error_handler.report_vucr0f_error (current_class, current_class_impl, an_expression)
			else
				if not a_context.is_type_attached then
					a_context.force_last (tokens.attached_like_current)
				end
				report_current (an_expression)
			end
		end

	check_current_address_validity (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			if in_static_feature then
					-- Error: '$Current' cannot be used in a static feature.
				set_fatal_error
				error_handler.report_vucr0g_error (current_class, current_class_impl, an_expression)
			else
				l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
				l_typed_pointer_class := l_typed_pointer_type.named_base_class
				if l_typed_pointer_class.actual_class.is_preparsed then
						-- Class TYPED_POINTER has been found in the universe.
						-- Use ISE's implementation: the type of '$Current' is 'TYPED_POINTER [like Current]'.
					if not a_context.is_type_attached then
						a_context.force_last (tokens.attached_like_current)
					end
					report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
					a_context.force_last (l_typed_pointer_type)
				else
						-- Use the ETL2 implementation: the type of '$Current' is POINTER.
					l_pointer_type := current_universe_impl.pointer_type
					a_context.force_last (l_pointer_type)
					report_pointer_expression (an_expression, l_pointer_type)
				end
			end
		end

	check_equality_expression_validity (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_left_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_right_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_detachable_any_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			l_detachable_any_type := current_system.detachable_any_type
			l_left_context := new_context (current_type)
			l_right_context := new_context (current_type)
			l_left_operand := an_expression.left
			l_right_operand := an_expression.right
			check_expression_validity (l_left_operand, l_left_context, l_detachable_any_type)
			if not has_fatal_error then
				check_expression_validity (l_right_operand, l_right_context, l_detachable_any_type)
				if not has_fatal_error then
					if current_class /= current_class_impl then
						-- Possible convertibility should be resolved in the implementation class.
					elseif l_left_context.conforms_to_context_with_type_marks (tokens.attached_keyword, l_right_context, tokens.attached_keyword, system_processor) then
						-- OK.
					elseif l_right_context.conforms_to_context_with_type_marks (tokens.attached_keyword, l_left_context, tokens.attached_keyword, system_processor) then
						-- OK.
					elseif l_left_context.same_named_type (current_system.detachable_none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					elseif l_right_context.same_named_type (current_system.detachable_none_type, current_type) then
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
				check_expression_validity (l_right_operand, l_right_context, l_detachable_any_type)
				set_fatal_error
			end
			free_context (l_right_context)
			free_context (l_left_context)
		end

	check_expression_address_validity (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_detachable_any_type: ET_CLASS_TYPE
			l_expression_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_detachable_any_type := current_system.detachable_any_type
			l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
			l_typed_pointer_class := l_typed_pointer_type.named_base_class
			if l_typed_pointer_class.actual_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation: the type of '$(expr)' is 'TYPED_POINTER [<type-of-expr>]'.
				check_expression_validity (an_expression.expression, a_context, l_detachable_any_type)
				if not has_fatal_error then
					report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
					a_context.force_last (l_typed_pointer_type)
				end
			else
					-- Use the ETL2 implementation: the type of '$(expr)' is POINTER.
					-- Do not use `a_context' when checking the validity of the
					-- expression because we don't want it to be altered and we
					-- don't need the type of 'expr'.
				l_expression_context := new_context (current_type)
				check_expression_validity (an_expression.expression, l_expression_context, l_detachable_any_type)
				free_context (l_expression_context)
				if not has_fatal_error then
					l_pointer_type := current_universe_impl.pointer_type
					a_context.force_last (l_pointer_type)
					report_pointer_expression (an_expression, l_pointer_type)
				end
			end
		end

	check_false_constant_validity (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_feature_address_validity (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_FEATURE_NAME
			l_identifier: ET_IDENTIFIER
			l_seed: INTEGER
			already_checked: BOOLEAN
			l_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_argument: ET_FORMAL_ARGUMENT
			l_type: detachable ET_TYPE
			l_locals: detachable ET_LOCAL_VARIABLE_LIST
			l_local: ET_LOCAL_VARIABLE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
			l_object_tests: detachable ET_OBJECT_TEST_LIST
			l_object_test: detachable ET_NAMED_OBJECT_TEST
			l_iteration_component: detachable ET_ITERATION_COMPONENT
			l_iteration_components: detachable ET_ITERATION_COMPONENT_LIST
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
							l_identifier := l_name.object_test_local_name.identifier
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
								l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
								l_typed_pointer_class := l_typed_pointer_type.named_base_class
								if l_typed_pointer_class.actual_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation: the type of '$object_test_local' is
										-- 'TYPED_POINTER [<type-of-object_test_local>]'.
									current_object_test_types.search (l_object_test)
									if not current_object_test_types.found then
											-- The type of the object-test local should have been determined
											-- when processing the object-test itself. And this should have
											-- already been done since we are in the scope of that object-test.
											-- Here we don't have this type, which means that an error had
											-- occurred (and had been reported) when processing the expression
											-- of the object-test.
										set_fatal_error
									else
										a_context.copy_type_context (current_object_test_types.found_item)
										report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
										a_context.force_last (l_typed_pointer_type)
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
					elseif l_name.is_iteration_item then
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
							l_identifier := l_name.iteration_item_name
							l_iteration_component := current_iteration_item_scope.iteration_component (l_identifier)
							if l_iteration_component = Void then
									-- Error: `l_identifier' is an iteration item that is used outside of its scope.
								set_fatal_error
								if current_feature_impl.is_feature then
									error_handler.report_veen9a_error (current_class, l_identifier, current_feature_impl.as_feature)
								else
									error_handler.report_veen9b_error (current_class, l_identifier)
								end
							else
								report_iteration_item (l_identifier, l_iteration_component)
								l_seed := l_iteration_component.item_name.seed
								l_identifier.set_seed (l_seed)
								l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
								l_typed_pointer_class := l_typed_pointer_type.named_base_class
								if l_typed_pointer_class.actual_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation: the type of '$iteration_item' is
										-- 'TYPED_POINTER [<type-of-iteration-item>]'.
									current_iteration_item_types.search (l_iteration_component)
									if not current_iteration_item_types.found then
											-- The type of the iteration item should have been determined
											-- when processing the header of the iteration component itself.
											-- And this should have already been done since we are in the
											-- scope of that iteration item. Here we don't have this type,
											-- which means that an error had occurred (and had been reported)
											-- when processing the iterable expression of the iteration component.
										set_fatal_error
									else
										a_context.copy_type_context (current_iteration_item_types.found_item)
										report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
										a_context.force_last (l_typed_pointer_type)
									end
								else
										-- Use the ETL2 implementation: the type of '$across_cursor' is POINTER.
									l_pointer_type := current_universe_impl.pointer_type
									a_context.force_last (l_pointer_type)
									report_pointer_expression (an_expression, l_pointer_type)
								end
								already_checked := True
							end
						end
						-- Try to see if it is of the form '$feature_name'.
					elseif attached current_class.named_procedure (l_name) as l_procedure then
							-- Note that we need to check the interface of `current_class' again.
							-- It's already done in `check_feature_validity'
						l_seed := l_procedure.first_seed
						l_name.set_seed (l_seed)
						check_unqualified_vape_validity (l_name, l_procedure)
						report_procedure_address (an_expression, l_procedure)
							-- $feature_name is of type POINTER, even
							-- in ISE and its TYPED_POINTER support.
						l_pointer_type := current_universe_impl.pointer_type
						a_context.force_last (l_pointer_type)
						report_pointer_expression (an_expression, l_pointer_type)
							-- No need to check validity in the context of `current_type' again.
						already_checked := True
					elseif attached current_class.named_query (l_name) as l_query then
						l_seed := l_query.first_seed
						l_name.set_seed (l_seed)
						check_unqualified_vape_validity (l_name, l_query)
						if l_query.is_attribute then
							if in_static_feature then
									-- Error: we cannot access the address of an attribute
									-- from a static feature.
								set_fatal_error
								error_handler.report_vucr0e_error (current_class, current_class_impl, l_name, l_query)
							else
								report_attribute_address (an_expression, l_query)
								l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
								l_typed_pointer_class := l_typed_pointer_type.named_base_class
								if l_typed_pointer_class.actual_class.is_preparsed then
										-- Class TYPED_POINTER has been found in the universe.
										-- Use ISE's implementation: the type of '$attribute' is 'TYPED_POINTER [<type-of-attribute>]'.
									l_type := l_query.type
									if l_type.is_base_type or current_class = current_type then
										a_context.force_last (l_type)
										report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
										a_context.force_last (l_typed_pointer_type)
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
			if not has_fatal_error and not already_checked then
				if l_name.is_argument then
						-- This is of the form '$argument'.
					if current_inline_agent = Void and in_invariant then
							-- VEEN-3: the formal argument appears in an invariant.
							-- Internal error: the invariant has no formal argument.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						if attached current_inline_agent as l_current_inline_agent then
							l_arguments := l_current_inline_agent.formal_arguments
						else
								-- Use arguments of `current_feature' instead of `current_feature_impl'
								-- because when processing inherited assertions the types of signature
								-- should be those of the version of the feature in the current class.
								-- For example:
								--    deferred class A
								--    feature
								--       f (a: ANY)
								--           require
								--               pre: g ($a)
								--           deferred
								--           end
								--      g (a: TYPED_POINTER [ANY]): BOOLEAN deferred end
								--    end
								--    class B
								--    inherit
								--        A
								--    feature
								--        f (a: STRING) do ... end
								--        g (a: TYPED_POINTER [STRING]): BOOLEAN do ... end
								--    end
								-- `a' in the inherited precondition "pre" should be considered
								-- of type STRING (and not ANY) is class B.
							l_arguments := current_feature.arguments
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
							l_identifier := l_name.argument_name.identifier
							report_formal_argument (l_identifier, False, l_argument)
							l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
							l_typed_pointer_class := l_typed_pointer_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$argument' is 'TYPED_POINTER [<type-of-argument>]'.
								l_type := l_argument.type
								a_context.force_last (l_type)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
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
							if attached current_inline_agent as l_current_inline_agent then
								error_handler.report_veen2e_error (current_class, l_name, l_current_inline_agent)
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
							l_identifier := l_name.local_name.identifier
							report_local_variable (l_identifier, False, l_local)
							l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
							l_typed_pointer_class := l_typed_pointer_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$local' is 'TYPED_POINTER [<type-of-local>]'.
								l_type := l_local.type
								a_context.force_last (l_type)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
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
						l_identifier := l_name.object_test_local_name.identifier
						report_object_test_local (l_identifier, l_object_test)
						l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
						l_typed_pointer_class := l_typed_pointer_type.named_base_class
						if l_typed_pointer_class.actual_class.is_preparsed then
								-- Class TYPED_POINTER has been found in the universe.
								-- Use ISE's implementation: the type of '$object_test_local' is
								-- 'TYPED_POINTER [<type-of-object_test_local>]'.
							current_object_test_types.search (l_object_test)
							if not current_object_test_types.found then
									-- Internal error: the type of the object-test local should
									-- have been determined when processing the object-test itself.
									-- And this should have already been done since we are in the
									-- scope of that object-test.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								a_context.copy_type_context (current_object_test_types.found_item)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
							end
						else
								-- Use the ETL2 implementation: the type of '$object_test_local' is POINTER.
							l_pointer_type := current_universe_impl.pointer_type
							a_context.force_last (l_pointer_type)
							report_pointer_expression (an_expression, l_pointer_type)
						end
					end
				elseif l_name.is_iteration_item then
					l_iteration_components := current_closure_impl.iteration_components
					if l_iteration_components = Void then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_seed < 1 or l_seed > l_iteration_components.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_iteration_component := l_iteration_components.iteration_component (l_seed)
						l_identifier := l_name.iteration_item_name
						report_iteration_item (l_identifier, l_iteration_component)
						l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
						l_typed_pointer_class := l_typed_pointer_type.named_base_class
						if l_typed_pointer_class.actual_class.is_preparsed then
								-- Class TYPED_POINTER has been found in the universe.
								-- Use ISE's implementation: the type of '$iteration_item' is
								-- 'TYPED_POINTER [<type-of-iteration-item>]'.
							current_iteration_item_types.search (l_iteration_component)
							if not current_iteration_item_types.found then
									-- Internal error: the type of the iteration item should
									-- have been determined when processing the header of the
									-- across component itself. And this should have already
									-- been done since we are in the scope of that iteration
									-- item.
								set_fatal_error
								error_handler.report_giaaa_error
							else
								a_context.copy_type_context (current_iteration_item_types.found_item)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
							end
						else
								-- Use the ETL2 implementation: the type of '$iteration_item' is POINTER.
							l_pointer_type := current_universe_impl.pointer_type
							a_context.force_last (l_pointer_type)
							report_pointer_expression (an_expression, l_pointer_type)
						end
					end
					-- This is of the form '$feature_name'.
				elseif attached current_class.seeded_procedure (l_seed) as l_procedure then
						-- Note that we need to check the interface of `current_class' again.
						-- It's already done in `check_feature_validity'
					check_unqualified_vape_validity (l_name, l_procedure)
					report_procedure_address (an_expression, l_procedure)
						-- $feature_name is of type POINTER, even
						-- in ISE and its TYPED_POINTER support.
					l_pointer_type := current_universe_impl.pointer_type
					a_context.force_last (l_pointer_type)
					report_pointer_expression (an_expression, l_pointer_type)
				elseif attached current_class.seeded_query (l_seed) as l_query then
					check_unqualified_vape_validity (l_name, l_query)
					if l_query.is_attribute then
						if in_static_feature then
								-- Error: we cannot access the address of an attribute
								-- from a static feature.
							set_fatal_error
							error_handler.report_vucr0e_error (current_class, current_class_impl, l_name, l_query)
						else
							report_attribute_address (an_expression, l_query)
							l_typed_pointer_type := current_universe_impl.typed_pointer_identity_type
							l_typed_pointer_class := l_typed_pointer_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$attribute' is 'TYPED_POINTER [<type-of-attribute>]'.
								l_type := l_query.type
								a_context.force_last (l_type)
								report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
								a_context.force_last (l_typed_pointer_type)
							else
									-- Use the ETL2 implementation: the type of '$attribute' is POINTER.
								l_pointer_type := current_universe_impl.pointer_type
								a_context.force_last (l_pointer_type)
								report_pointer_expression (an_expression, l_pointer_type)
							end
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

	check_formal_argument_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_formal: ET_FORMAL_ARGUMENT
			l_type: ET_TYPE
			l_is_attached: BOOLEAN
		do
			has_fatal_error := False
			if current_inline_agent = Void and in_invariant then
					-- VEEN-3: the formal argument appears in an invariant.
					-- Internal error: the invariant has no formal argument.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				if attached current_inline_agent as l_current_inline_agent then
					l_arguments := l_current_inline_agent.formal_arguments
				else
						-- Use arguments of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f (a: ANY)
						--           require
						--               pre: g (a)
						--           deferred
						--           end
						--      g (a: ANY): BOOLEAN deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f (a: STRING) do ... end
						--        g (a: STRING): BOOLEAN do ... end
						--    end
						-- `a' in the inherited precondition "pre" should be considered
						-- of type STRING (and not ANY) is class B.
					l_arguments := current_feature.arguments
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
					l_type := l_formal.type
					a_context.force_last (l_type)
					if current_system.attachment_type_conformance_mode then
						if not a_context.is_type_attached and then current_attachment_scope.has_formal_argument (a_name) then
								-- Even though this formal argument has not been declared as attached,
								-- we can guarantee that at this stage this entity is attached.
							a_context.force_last (tokens.attached_like_current)
							l_is_attached := True
						end
					end
					report_formal_argument (a_name, l_is_attached, l_formal)
				end
			end
		end

	check_hexadecimal_integer_constant_validity (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_if_expression_validity (a_expression: ET_IF_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_context_not_void: a_context /= Void
		local
			boolean_type: ET_CLASS_TYPE
			l_conditional: ET_EXPRESSION
			l_conditional_context: ET_NESTED_TYPE_CONTEXT
			l_elseif: ET_ELSEIF_EXPRESSION
			i, nb: INTEGER
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			l_old_object_test_scope: INTEGER
			l_old_elseif_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_else_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_result_context_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			l_old_result_context_list_count: INTEGER
		do
			has_fatal_error := False
			boolean_type := current_universe_impl.boolean_type
			l_conditional := a_expression.conditional.expression
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
			l_old_object_test_scope := current_object_test_scope.count
			object_test_scope_builder.build_scope (l_conditional, current_object_test_scope, current_class_impl)
			had_error := had_error or object_test_scope_builder.has_fatal_error
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			l_else_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
				l_else_attachment_scope := new_attachment_scope
				l_else_attachment_scope.copy_scope (l_old_attachment_scope)
				attachment_scope_builder.build_scope (l_conditional, current_attachment_scope)
				attachment_scope_builder.build_negated_scope (l_conditional, l_else_attachment_scope)
			end
			l_result_context_list := common_ancestor_type_list
			l_old_result_context_list_count := l_result_context_list.count
			l_expression_context := new_context (current_type)
			check_expression_validity (a_expression.then_expression, l_expression_context, current_target_type)
			if has_fatal_error then
				had_error := True
				free_context (l_expression_context)
			else
				update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope, current_class_impl)
			had_error := had_error or object_test_scope_builder.has_fatal_error
			if attached a_expression.elseif_parts as l_elseif_parts then
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif := l_elseif_parts.item (i)
					if current_system.attachment_type_conformance_mode then
						current_attachment_scope.copy_scope (l_else_attachment_scope)
					end
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
					l_old_elseif_object_test_scope := current_object_test_scope.count
					object_test_scope_builder.build_scope (l_conditional, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					if current_system.attachment_type_conformance_mode then
						attachment_scope_builder.build_scope (l_conditional, current_attachment_scope)
						attachment_scope_builder.build_negated_scope (l_conditional, l_else_attachment_scope)
					end
					l_expression_context := new_context (current_type)
					check_expression_validity (l_elseif.then_expression, l_expression_context, current_target_type)
					if has_fatal_error then
						had_error := True
						free_context (l_expression_context)
					else
						update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
					end
					current_object_test_scope.keep_object_tests (l_old_elseif_object_test_scope)
					object_test_scope_builder.build_negated_scope (l_conditional, current_object_test_scope, current_class_impl)
					had_error := had_error or object_test_scope_builder.has_fatal_error
					i := i + 1
				end
			end
			if current_system.attachment_type_conformance_mode then
				current_attachment_scope.copy_scope (l_else_attachment_scope)
			end
			l_expression_context := new_context (current_type)
			check_expression_validity (a_expression.else_expression, l_expression_context, current_target_type)
			if has_fatal_error then
				had_error := True
				free_context (l_expression_context)
			else
				update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
			end
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_attachment_scope)
				free_attachment_scope (l_else_attachment_scope)
				free_attachment_scope (current_initialization_scope)
				current_attachment_scope := l_old_attachment_scope
				current_initialization_scope := l_old_initialization_scope
			end
			if had_error then
				set_fatal_error
			else
				if l_result_context_list.count /= l_old_result_context_list_count + 1 then
						-- There is no expression such as the types of all other
						-- expressions conform to its type.
					l_expression_context := new_context (current_type)
					l_expression_context.force_last (current_system.any_type)
					update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
				end
				a_context.copy_type_context (l_result_context_list.last)
				report_if_expression (a_expression, tokens.identity_type, a_context)
			end
			free_common_ancestor_types (l_result_context_list, l_old_result_context_list_count)
		end

	check_infix_cast_expression_validity (an_expression: ET_INFIX_CAST_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
				l_target_type := an_expression.type
				a_context.reset (current_type)
				a_context.force_last (l_target_type)
			end
		end

	check_infix_expression_validity (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_call_info: like new_call_info
			l_target_context: ET_NESTED_TYPE_CONTEXT
		do
			l_target_context := new_context (current_type)
			l_call_info := new_call_info (l_target_context)
			check_qualified_call_expression_validity (an_expression, a_context, l_call_info)
			free_call_info (l_call_info)
			free_context (l_target_context)
		end

	check_integer_constant_validity (a_constant: ET_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_type: detachable ET_CLASS_TYPE
			l_cast_type: detachable ET_TARGET_TYPE
			l_explicit_type: detachable ET_TYPE
			l_sign: detachable ET_SYMBOL_OPERATOR
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.identity_type
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

	check_inspect_expression_validity (a_expression: ET_INSPECT_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_expression: ET_EXPRESSION
			l_when_part: ET_WHEN_EXPRESSION
			i, nb: INTEGER
			had_error: BOOLEAN
			had_value_error: BOOLEAN
			l_value_context: ET_NESTED_TYPE_CONTEXT
			l_value_type: ET_TYPE
			l_detachable_any_type: ET_CLASS_TYPE
			l_value_named_type: ET_NAMED_TYPE
			l_choices: ET_CHOICE_LIST
			l_choice: ET_CHOICE
			l_choice_constant: ET_CHOICE_CONSTANT
			l_choice_context: ET_NESTED_TYPE_CONTEXT
			l_choice_named_type: ET_NAMED_TYPE
			j, nb2: INTEGER
			l_constant: detachable ET_CONSTANT
			l_cast_type: detachable ET_TARGET_TYPE
			l_index: INTEGER
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_result_context_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			l_old_result_context_list_count: INTEGER
		do
			has_fatal_error := False
			l_detachable_any_type := current_system.detachable_any_type
			l_value_context := new_context (current_type)
			l_expression := a_expression.conditional.expression
			check_expression_validity (l_expression, l_value_context, l_detachable_any_type)
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
			l_result_context_list := common_ancestor_type_list
			l_old_result_context_list_count := l_result_context_list.count
			if attached a_expression.when_parts as l_when_parts then
				l_choice_context := new_context (current_type)
				l_value_type := tokens.identity_type
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
								elseif attached {ET_INTEGER_CONSTANT} l_constant as l_integer_constant then
										-- If we use the same object for the constant attribute
										-- when analyzing different client features, each feature
										-- will assign its own index to this object. That's why
										-- we need to reset the index so that the index does not
										-- get corrupted.
									l_index := l_integer_constant.index
									l_integer_constant.set_index (0)
									l_cast_type := l_integer_constant.cast_type
									l_integer_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_integer_constant, l_choice_context, l_value_context)
									l_integer_constant.set_cast_type (l_cast_type)
									l_integer_constant.set_index (l_index)
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
								elseif attached {ET_CHARACTER_CONSTANT} l_constant as l_character_constant then
										-- If we use the same object for the constant attribute
										-- when analyzing different client features, each feature
										-- will assign its own index to this object. That's why
										-- we need to reset the index so that the index does not
										-- get corrupted.
									l_index := l_character_constant.index
									l_character_constant.set_index (0)
									l_cast_type := l_character_constant.cast_type
									l_character_constant.set_cast_type (Void)
									l_choice_context.wipe_out
									check_expression_validity (l_character_constant, l_choice_context, l_value_context)
									l_character_constant.set_cast_type (l_cast_type)
									l_character_constant.set_index (l_index)
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
									elseif attached {ET_INTEGER_CONSTANT} l_constant as l_integer_constant2 then
											-- If we use the same object for the constant attribute
											-- when analyzing different client features, each feature
											-- will assign its own index to this object. That's why
											-- we need to reset the index so that the index does not
											-- get corrupted.
										l_index := l_integer_constant2.index
										l_integer_constant2.set_index (0)
										l_cast_type := l_integer_constant2.cast_type
										l_integer_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_integer_constant2, l_choice_context, l_value_context)
										l_integer_constant2.set_cast_type (l_cast_type)
										l_integer_constant2.set_index (l_index)
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
									elseif attached {ET_CHARACTER_CONSTANT} l_constant as l_character_constant2 then
											-- If we use the same object for the constant attribute
											-- when analyzing different client features, each feature
											-- will assign its own index to this object. That's why
											-- we need to reset the index so that the index does not
											-- get corrupted.
										l_index := l_character_constant2.index
										l_character_constant2.set_index (0)
										l_cast_type := l_character_constant2.cast_type
										l_character_constant2.set_cast_type (Void)
										l_choice_context.wipe_out
										check_expression_validity (l_character_constant2, l_choice_context, l_value_context)
										l_character_constant2.set_cast_type (l_cast_type)
										l_character_constant2.set_index (l_index)
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
					l_expression_context := new_context (current_type)
					check_expression_validity (l_when_part.then_expression, l_expression_context, current_target_type)
					if has_fatal_error then
						had_error := True
						free_context (l_expression_context)
					else
						update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
					end
					i := i + 1
				end
			else
				free_context (l_value_context)
			end
			if attached a_expression.else_part as l_else_part then
				l_expression_context := new_context (current_type)
				check_expression_validity (l_else_part.expression, l_expression_context, current_target_type)
				if has_fatal_error then
					had_error := True
					free_context (l_expression_context)
				else
					update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
				end
			end
			if had_error then
				set_fatal_error
			else
				if l_result_context_list.count = l_old_result_context_list_count then
						-- Empty list of types. Use "NONE".
						-- See https://www.eiffel.org/doc/eiffel/Types
					l_expression_context := new_context (current_type)
					l_expression_context.force_last (current_system.none_type)
					update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
				elseif l_result_context_list.count /= l_old_result_context_list_count + 1 then
						-- There is no expression such as the types of all other
						-- expressions conform to its type.
					l_expression_context := new_context (current_type)
					l_expression_context.force_last (current_system.any_type)
					update_common_ancestor_type_list (l_expression_context, l_result_context_list, l_old_result_context_list_count)
				end
				a_context.copy_type_context (l_result_context_list.last)
				report_inspect_expression (a_expression, tokens.identity_type, a_context)
			end
			free_common_ancestor_types (l_result_context_list, l_old_result_context_list_count)
		end

	check_iteration_component_header_validity (a_iteration_component: ET_ITERATION_COMPONENT)
			-- Check validity of the header of `a_iteration_component'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_iteration_component_not_void: a_iteration_component /= Void
		local
			l_had_error: BOOLEAN
			l_had_iterable_error: BOOLEAN
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_conditional_context: ET_NESTED_TYPE_CONTEXT
			l_item_context: ET_NESTED_TYPE_CONTEXT
			l_item_name: ET_IDENTIFIER
			i, j, nb: INTEGER
			l_enclosing_agent: ET_INLINE_AGENT
			l_iterable_type: ET_CLASS_TYPE
			l_iterable_expression: ET_EXPRESSION
			l_named_type: ET_NAMED_TYPE
			l_boolean_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			l_expression_context := new_context (current_type)
			l_iterable_expression := a_iteration_component.iterable_expression
			l_iterable_type := current_universe_impl.iterable_detachable_separate_any_type
			check_expression_validity (l_iterable_expression, l_expression_context, l_iterable_type)
			if has_fatal_error then
				l_had_error := True
				l_had_iterable_error := True
			elseif not l_expression_context.conforms_to_type (l_iterable_type, current_class_impl, system_processor) then
				l_had_error := True
				l_had_iterable_error := True
				set_fatal_error
				l_named_type := l_expression_context.named_type
				error_handler.report_voit1a_error (current_class, current_class_impl, l_iterable_expression, l_named_type)
			end
			free_context (l_expression_context)
				-- Check iteration item name clashes (see VOIT-2).
			l_item_name := a_iteration_component.item_name
			if current_class = current_class_impl then
				if attached current_class.named_feature (l_item_name) as l_feature then
						-- This iteration item has the same name as the
						-- final name of a feature in `current_class'.
					l_had_error := True
					set_fatal_error
					error_handler.report_voit2a_error (current_class, a_iteration_component, l_feature)
				end
				if attached current_inline_agent as l_current_inline_agent then
					enclosing_inline_agents.force_last (l_current_inline_agent)
					nb := enclosing_inline_agents.count
					from i := 1 until i > nb loop
						l_enclosing_agent := enclosing_inline_agents.item (i)
						if attached l_enclosing_agent.formal_arguments as args then
							j := args.index_of (l_item_name)
							if j /= 0 then
									-- This iteration item has the same name as a formal
									-- argument of an enclosing inline agent.
								l_had_error := True
								set_fatal_error
								error_handler.report_voit2b_error (current_class, a_iteration_component, args.formal_argument (j))
							end
						end
						if attached l_enclosing_agent.locals as l_locals then
							j := l_locals.index_of (l_item_name)
							if j /= 0 then
									-- This iteration item has the same name as a
									-- local variable of an enclosing inline agent.
								l_had_error := True
								set_fatal_error
								error_handler.report_voit2c_error (current_class, a_iteration_component, l_locals.local_variable (j))
							end
						end
						i := i + 1
					end
					enclosing_inline_agents.remove_last
				end
				if attached current_feature.arguments as args then
					j := args.index_of (l_item_name)
					if j /= 0 then
							-- This iteration item has the same name as a formal
							-- argument of the enclosing feature.
						l_had_error := True
						set_fatal_error
						error_handler.report_voit2b_error (current_class, a_iteration_component, args.formal_argument (j))
					end
				end
				if attached current_feature.locals as l_locals then
					j := l_locals.index_of (l_item_name)
					if j /= 0 then
							-- This iteration item has the same name as a
							-- local variable of the enclosing feature.
						l_had_error := True
						set_fatal_error
						error_handler.report_voit2c_error (current_class, a_iteration_component, l_locals.local_variable (j))
					end
				end
				if attached current_object_test_scope.object_test (l_item_name) as l_object_test then
						-- This iteration item appears in the scope of a
						-- object-test local with the same name.
					l_had_error := True
					set_fatal_error
					error_handler.report_voit2d_error (current_class, a_iteration_component, l_object_test)
				elseif attached current_object_test_scope.hidden_object_test (l_item_name) as l_object_test then
						-- Take into account object-tests in enclosing feature or inline agent as
						-- well when in an inline agent.
					l_had_error := True
					set_fatal_error
					error_handler.report_voit2d_error (current_class, a_iteration_component, l_object_test)
				end
				if attached current_iteration_item_scope.iteration_component (l_item_name) as l_other_iteration_component then
						-- This iteration item appears in the scope of an other iteration
						-- item with the same name.
					l_had_error := True
					set_fatal_error
					error_handler.report_voit2e_error (current_class, a_iteration_component, l_other_iteration_component)
				elseif attached current_iteration_item_scope.hidden_iteration_component (l_item_name) as l_other_iteration_component then
						-- Take into account iteration components in enclosing feature or inline agent as
						-- well when in an inline agent.
					l_had_error := True
					set_fatal_error
					error_handler.report_voit2e_error (current_class, a_iteration_component, l_other_iteration_component)
				end
			end
				-- Type of iteration item.
			if not l_had_iterable_error then
				l_expression_context := new_context (current_type)
				a_iteration_component.new_cursor_expression.name.set_seed (current_system.iterable_new_cursor_seed)
				check_expression_validity (a_iteration_component.new_cursor_expression, l_expression_context, current_system.detachable_any_type)
				if has_fatal_error then
					l_had_error := True
					free_context (l_expression_context)
				else
					report_iteration_cursor_declaration (a_iteration_component.unfolded_cursor_name, a_iteration_component)
					current_iteration_cursor_types.force_last (l_expression_context, a_iteration_component)
						-- Record the type of the iteration cursor in `current_iteration_item_types' even
						-- when `a_iteration_component.has_cursor_name` is False so that we can process
						-- 'unfolded_cursor_name.after', 'unfolded_cursor_name.forth' and
						-- 'unfolded_cursor_name.item' below. The type of the iteration item will
						-- be recorded in `current_iteration_item_types` just after if `has_cursor_name`
						-- is False.
					current_iteration_item_types.force_last (l_expression_context, a_iteration_component)
					current_iteration_item_scope.add_iteration_component (a_iteration_component)
						-- Make sure that it is valid to call feature
						-- 'after' on the iteration cursor.
					a_iteration_component.cursor_after_expression.name.set_seed (current_system.iteration_cursor_after_seed)
					l_boolean_type := current_universe_impl.boolean_type
					l_conditional_context := new_context (current_type)
					check_expression_validity (a_iteration_component.cursor_after_expression, l_conditional_context, l_boolean_type)
					if has_fatal_error then
						l_had_error := True
					elseif not l_conditional_context.same_named_type (l_boolean_type, current_class_impl) then
						l_had_error := True
						set_fatal_error
						l_named_type := l_conditional_context.named_type
						error_handler.report_vwbe0a_error (current_class, current_class_impl, a_iteration_component.cursor_after_expression, l_named_type)
					end
					free_context (l_conditional_context)
						-- Make sure that it is valid to call feature
						-- 'forth' on the iteration cursor.
					a_iteration_component.cursor_forth_instruction.name.set_seed (current_system.iteration_cursor_forth_seed)
					check_qualified_call_instruction_validity (a_iteration_component.cursor_forth_instruction)
					if has_fatal_error then
						l_had_error := True
					end
						-- Make sure that it is valid to call feature
						-- 'item' on the iteration cursor.
					if not a_iteration_component.has_cursor_name then
						a_iteration_component.cursor_item_expression.name.set_seed (current_system.iteration_cursor_item_seed)
						l_item_context := new_context (current_type)
						check_expression_validity (a_iteration_component.cursor_item_expression, l_item_context, current_system.detachable_any_type)
						if has_fatal_error then
							l_had_error := True
						end
							-- From now on, use the correct type of the iteration item (and not the
							-- type of the iteration cursor as explained above).
						current_iteration_item_types.force_last (l_item_context, a_iteration_component)
					end
					report_iteration_item_declaration (l_item_name, a_iteration_component)
					current_iteration_item_scope.remove_iteration_components (1)
				end
			end
			if l_had_error then
				set_fatal_error
			end
		end

	check_iteration_cursor_validity (a_iteration_cursor: ET_ITERATION_CURSOR; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_iteration_cursor'.
			-- `a_context' represents the type in which `a_iteration_cursor' appears.
			-- It will be altered on exit to represent the type of `a_iteration_cursor'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_iteration_cursor_not_void: a_iteration_cursor /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_IDENTIFIER
			l_seed: INTEGER
			l_iteration_component: detachable ET_ITERATION_COMPONENT
		do
			has_fatal_error := False
			l_name := a_iteration_cursor.item_name
			l_seed := l_name.seed
			if not l_name.is_iteration_item then
					-- Error: `l_name` is not the name of an iteration item.
				set_fatal_error
				error_handler.report_voit3a_error (current_class, a_iteration_cursor)
			elseif l_seed = 0 then
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
					l_iteration_component := current_iteration_item_scope.iteration_component (l_name)
					if l_iteration_component = Void then
							-- Error: `l_name' is an iteration item that is used outside of its scope.
						set_fatal_error
						if current_feature_impl.is_feature then
							error_handler.report_veen9a_error (current_class, l_name, current_feature_impl.as_feature)
						else
							error_handler.report_veen9b_error (current_class, l_name)
						end
					elseif l_iteration_component.has_cursor_name then
							-- Error: `l_name` is not the name of an iteration item.
						set_fatal_error
						error_handler.report_voit3a_error (current_class, a_iteration_cursor)
					else
						l_seed := l_iteration_component.item_name.seed
						l_name.set_seed (l_seed)
						current_iteration_cursor_types.search (l_iteration_component)
						if not current_iteration_cursor_types.found then
								-- The type of the iteration cursor should have been determined
								-- when processing the header of the iteration component itself.
								-- And this should have already been done since we are in the
								-- scope of the iteration item. Here we don't have this type,
								-- which means that an error had occurred (and had been reported)
								-- when processing the iterable expression of the iteration component.
							set_fatal_error
						else
							a_context.copy_type_context (current_iteration_cursor_types.found_item)
							report_iteration_cursor (a_iteration_cursor, l_iteration_component)
						end
					end
				end
			else
				if not attached current_closure_impl.iteration_components as l_iteration_components then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_iteration_components.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_iteration_component := l_iteration_components.iteration_component (l_seed)
					current_iteration_cursor_types.search (l_iteration_component)
					if not current_iteration_cursor_types.found then
							-- Internal error: the type of the iteration cursor should
							-- have been determined when processing the header of the
							-- iteration component itself. And this should have already
							-- been done since we are in the scope of the iteration item.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						a_context.copy_type_context (current_iteration_cursor_types.found_item)
						report_iteration_cursor (a_iteration_cursor, l_iteration_component)
					end
				end
			end
		end

	check_iteration_item_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of iteration item `a_name'.
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_iteration_item: a_name.is_iteration_item
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_iteration_component: detachable ET_ITERATION_COMPONENT
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
					l_iteration_component := current_iteration_item_scope.iteration_component (a_name)
					if l_iteration_component = Void then
							-- Error: `a_name' is an iteration item that is used outside of its scope.
						set_fatal_error
						if current_feature_impl.is_feature then
							error_handler.report_veen9a_error (current_class, a_name, current_feature_impl.as_feature)
						else
							error_handler.report_veen9b_error (current_class, a_name)
						end
					else
						l_seed := l_iteration_component.item_name.seed
						a_name.set_seed (l_seed)
						current_iteration_item_types.search (l_iteration_component)
						if not current_iteration_item_types.found then
								-- The type of the iteration item should have been determined
								-- when processing the header of the iteration component itself.
								-- And this should have already been done since we are in the
								-- scope of that iteration item. Here we don't have this type, which
								-- means that an error had occurred (and had been reported)
								-- when processing the iterable expression of the iteration component.
							set_fatal_error
						else
							a_context.copy_type_context (current_iteration_item_types.found_item)
							report_iteration_item (a_name, l_iteration_component)
						end
					end
				end
			else
				if not attached current_closure_impl.iteration_components as l_iteration_components then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_iteration_components.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_iteration_component := l_iteration_components.iteration_component (l_seed)
					current_iteration_item_types.search (l_iteration_component)
					if not current_iteration_item_types.found then
							-- Internal error: the type of the iteration item should
							-- have been determined when processing the header of the
							-- iteration component itself. And this should have already
							-- been done since we are in the scope of that iteration item.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						a_context.copy_type_context (current_iteration_item_types.found_item)
						report_iteration_item (a_name, l_iteration_component)
					end
				end
			end
		end

	check_iteration_expression_validity (an_expression: ET_ITERATION_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_until_expression: detachable ET_EXPRESSION
			l_iteration_expression: ET_EXPRESSION
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_named_type: ET_NAMED_TYPE
			l_boolean_type: ET_CLASS_TYPE
			l_old_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
		do
			has_fatal_error := False
			check_iteration_component_header_validity (an_expression)
			if has_fatal_error then
				had_error := True
			end
			current_iteration_item_scope.add_iteration_component (an_expression)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
			end
			if attached an_expression.invariant_part as l_invariant then
				check_loop_invariant_validity (l_invariant)
				if has_fatal_error then
					had_error := True
				end
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					current_attachment_scope.copy_scope (l_old_attachment_scope)
				end
			end
			if attached an_expression.variant_part as l_variant then
				check_loop_variant_validity (l_variant)
				if has_fatal_error then
					had_error := True
				end
				if current_system.attachment_type_conformance_mode then
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					current_attachment_scope.copy_scope (l_old_attachment_scope)
				end
			end
			l_boolean_type := current_universe_impl.boolean_type
			if attached an_expression.until_conditional as l_until_conditional then
				l_until_expression := l_until_conditional.expression
				l_expression_context := new_context (current_type)
				check_expression_validity (l_until_expression, l_expression_context, l_boolean_type)
				if has_fatal_error then
					had_error := True
				elseif not l_expression_context.same_named_type (l_boolean_type, current_class_impl) then
					had_error := True
					set_fatal_error
					l_named_type := l_expression_context.named_type
					error_handler.report_vwbe0a_error (current_class, current_class_impl, l_until_expression, l_named_type)
				end
				free_context (l_expression_context)
			end
			l_iteration_expression := an_expression.iteration_expression
			l_old_object_test_scope := current_object_test_scope.count
			if l_until_expression /= Void then
				if current_system.attachment_type_conformance_mode then
					attachment_scope_builder.build_negated_scope (l_until_expression, current_attachment_scope)
				end
				object_test_scope_builder.build_negated_scope (l_until_expression, current_object_test_scope, current_class_impl)
				had_error := had_error or object_test_scope_builder.has_fatal_error
			end
			l_expression_context := new_context (current_type)
			check_expression_validity (l_iteration_expression, l_expression_context, l_boolean_type)
			if has_fatal_error then
				had_error := True
			elseif not l_expression_context.same_named_type (l_boolean_type, current_class_impl) then
				had_error := True
				set_fatal_error
				l_named_type := l_expression_context.named_type
				error_handler.report_vwbe0a_error (current_class, current_class_impl, l_iteration_expression, l_named_type)
			end
			free_context (l_expression_context)
			current_object_test_scope.keep_object_tests (l_old_object_test_scope)
			current_iteration_item_scope.remove_iteration_components (1)
			current_iteration_item_types.search (an_expression)
			if current_iteration_item_types.found then
				free_context (current_iteration_item_types.found_item)
				current_iteration_item_types.remove_found_item
			end
			current_iteration_cursor_types.search (an_expression)
			if current_iteration_cursor_types.found then
				if not an_expression.has_cursor_name then
						-- Do not free this context more than once if it
						-- was already in `current_iteration_item_types'.
					free_context (current_iteration_cursor_types.found_item)
				end
				current_iteration_cursor_types.remove_found_item
			end
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_attachment_scope)
				free_attachment_scope (current_initialization_scope)
				current_attachment_scope := l_old_attachment_scope
				current_initialization_scope := l_old_initialization_scope
			end
			if had_error then
				set_fatal_error
			end
			if not has_fatal_error then
				a_context.force_last (l_boolean_type)
				report_iteration_expression (an_expression)
			end
		end

	check_local_variable_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of local variable `a_name'.
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_local: a_name.is_local
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_local: ET_LOCAL_VARIABLE
			l_type: ET_TYPE
			l_is_attached: BOOLEAN
		do
			has_fatal_error := False
			if current_inline_agent = Void and (in_precondition or in_postcondition) then
-- TODO: check the case where we are in the pre- or postcondition of an inline agent.
					-- The local entity appears in a pre- or postcondition.
				set_fatal_error
				if current_class_impl = current_class then
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_veen2e_error (current_class, a_name, l_current_inline_agent)
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
				l_seed := a_name.seed
				if not attached current_closure_impl.locals as l_locals then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif l_seed < 1 or l_seed > l_locals.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_local := l_locals.local_variable (l_seed)
					l_type := l_local.type
					a_context.force_last (l_type)
					if current_system.attachment_type_conformance_mode then
						l_is_attached := True
						if not a_context.is_type_attached then
							if current_attachment_scope.has_local_variable (a_name) then
									-- Even though this local variable has not been declared as attached,
									-- we can guarantee that at this stage this entity is attached.
								a_context.force_last (tokens.attached_like_current)
							else
								l_is_attached := False
							end
						elseif not a_context.is_type_detachable and not a_context.is_type_expanded then
							if system_processor.is_ise then
									-- In ISE Eiffel, local variables (including 'Result') are considered
									-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								if not current_attachment_scope.has_local_variable (a_name) then
									a_context.force_last (tokens.detachable_like_current)
									l_is_attached := False
								end
							elseif not current_initialization_scope.has_local_variable (a_name) then
									-- Error: local variable declared as attached and
									-- used before being initialized.
								set_fatal_error
								error_handler.report_vevi0a_error (current_class, current_class_impl, a_name, l_local)
							end
						end
					end
					report_local_variable (a_name, l_is_attached, l_local)
				end
			end
		end

	check_manifest_array_validity (a_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_context_not_void: a_context /= Void
		do
			if attached a_expression.cast_type as l_cast_type then
				check_typed_manifest_array_validity (a_expression, l_cast_type, a_context)
			else
				check_untyped_manifest_array_validity (a_expression, a_context)
			end
		end

	check_typed_manifest_array_validity (a_expression: ET_MANIFEST_ARRAY; a_cast_type: ET_TARGET_TYPE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- A typed manifest array is of the form:
			--    {T} << item_1, ..., item_n>>
			-- We have to check that:
			--  * 'T' is a valid type. For example "ARRAY [X, Y]" is not a valid type.
			--  * all items are valid expressions.
			--  * the named type version of 'T' is of the form "ARRAY [Z]".
			--  * the type of each item conforms or convert to 'Z'.
			-- The type of the manifest array is the attached version of 'T'.
			--
			-- See https://www.eiffel.org/doc/version/trunk/eiffel/Manifest%20array
			-- for more details.
		require
			a_expression_not_void: a_expression /= Void
			a_cast_type_not_void: a_cast_type /= Void
			typed: a_expression.cast_type = a_cast_type
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_array_parameter: ET_TYPE
			i, nb: INTEGER
			l_item_context: ET_NESTED_TYPE_CONTEXT
			l_parameter_context: ET_NESTED_TYPE_CONTEXT
			l_item: ET_EXPRESSION_ITEM
			l_item_expression: ET_EXPRESSION
			l_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_type := a_cast_type.type
			check_type_validity (l_type)
			if has_fatal_error then
				-- Do nothing.
			elseif not attached {ET_CLASS_TYPE} l_type.named_type (a_context) as l_array_type or else not l_array_type.base_class.is_array_class then
					-- Error: invalid cast type, it should be an ARRAY type.
				set_fatal_error
				error_handler.report_vwma1a_error (current_class, current_class_impl, a_expression)
			elseif not attached l_array_type.actual_parameters as l_array_parameters or else l_array_parameters.count /= 1 then
					-- Internal error: we already cheked that the type was valid.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				l_array_parameter := l_array_parameters.type (1)
				l_parameter_context := new_context (current_type)
				l_parameter_context.force_last (l_array_parameter)
				l_item_context := new_context (current_type)
				nb := a_expression.count
				from i := 1 until i > nb loop
					l_item := a_expression.item (i)
					l_item_expression := l_item.expression
					check_expression_validity (l_item_expression, l_item_context, l_parameter_context)
					if has_fatal_error then
						l_had_error := True
					elseif not l_item_context.conforms_to_type (l_array_parameter, current_type, system_processor) then
							-- The type of this item does not conform to the type of
							-- the parameter of the specified array type. Try to see
							-- if it converts to it.
							-- Convertibility should be resolved in the implementation class.
						if current_class = current_class_impl then
							l_convert_expression := convert_expression (l_item_expression, l_item_context, l_parameter_context)
							if has_fatal_error then
								l_had_error := True
							elseif l_convert_expression /= Void then
									-- Insert the conversion feature call in the AST.
								if attached {ET_EXPRESSION_COMMA} l_item as l_expression_comma then
									l_expression_comma.set_expression (l_convert_expression)
								else
									a_expression.put (l_convert_expression, i)
								end
							else
									-- Error: It does not conform nor convert.
								l_had_error := True
								error_handler.report_vwma2a_error (current_class, current_class_impl, l_item_expression, i, l_item_context.named_type, l_parameter_context.named_type)
							end
						end
					end
					l_item_context.wipe_out
					i := i + 1
				end
				free_context (l_item_context)
				free_context (l_parameter_context)
				if l_had_error then
					set_fatal_error
				else
					a_context.force_last (l_type)
					report_manifest_array (a_expression, tokens.attached_like_current, a_context)
					a_context.force_last (tokens.attached_like_current)
				end
			end
		end

	check_untyped_manifest_array_validity (a_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- A untyped manifest array is of the form:
			--    << item_1, ..., item_n>>
			-- We have to check that:
			--  * all items are valid expressions.
			--  * there exists an item of type 'T' such as the types of all other
			--    items conform to 'T' or its detachable version.
			--  * otherwise, 'T' is "ANY".
			-- The type of the manifest array is "ARRAY [T]", or "ARRAY [detachable T]"
			-- if the type of one of the items is not attached.
			-- An empty manifest array "<< >>" is of type "ARRAY [NONE]".
			--
			-- There is a backward compatibility mode when the manifest array is
			-- the source of an attachment and the array type built above does not
			-- conform nor convert to the type of the target of this attachment.
			-- In that case, the type of the manifest array will be the type of
			-- the target of this attachment when this type is an array type and
			-- the types of all items conform or convert to its generic parameter.
			-- Also, for empty manifest arrays, the type will be "ARRAY [ANY]" when
			-- the type of target of the assignment is not an array type and
			-- "ARRAY [NONE]" does not conform nor convert to it but "ARRAY [ANY]" does.
			--
			-- See https://www.eiffel.org/doc/version/trunk/eiffel/Manifest%20array
			-- for more details.
		require
			a_expression_not_void: a_expression /= Void
			untyped: a_expression.cast_type = Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
			l_item_context: ET_NESTED_TYPE_CONTEXT
			l_item: ET_EXPRESSION_ITEM
			l_item_expression: ET_EXPRESSION
			l_had_error: BOOLEAN
			l_result_context_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			l_old_result_context_list_count: INTEGER
			l_array_type: ET_CLASS_TYPE
			l_item_target_context: ET_TYPE_CONTEXT
			l_parameter_context: detachable ET_NESTED_TYPE_CONTEXT
			l_use_target_type: BOOLEAN
			l_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_has_converted_item: BOOLEAN
			l_item_conversion_aborted: BOOLEAN
		do
			has_fatal_error := False
			l_use_target_type := True
			l_item_target_context := current_system.detachable_any_type
				-- Try to find out whether the manifest array is the source of
				-- an attachment whose target is of type "ARRAY [T]". If this is
				-- the case then the expected type for the items of the manifest
				-- array will be the generic parameter "T" of this array type.
			if attached {ET_CLASS_TYPE} current_target_type.named_type as l_expected_array_type and then l_expected_array_type.base_class.is_array_class then
				if attached l_expected_array_type.actual_parameters as l_array_parameters and then l_array_parameters.count = 1 then
					l_parameter_context := new_context (current_type)
					l_parameter_context.force_last (l_array_parameters.type (1))
					l_item_target_context := l_parameter_context
				end
			end
			nb := a_expression.count
			if nb = 0 then
					-- This is an empty manifest array: '<< >>'.
				if l_use_target_type and then l_parameter_context /= Void and then not current_system.none_type.conforms_to_context (l_parameter_context, system_processor) then
						-- Its type is the attachment target array type.
-- TODO: Emit "manifest_array_type" warning as specified in ECF 1.17.0.
					a_context.copy_type_context (l_parameter_context)
				elseif
					l_use_target_type and then l_parameter_context = Void and then
					not (current_system.array_none_type.conforms_to_context (current_target_type, system_processor) or else
					(current_class = current_class_impl and then type_checker.convert_feature (current_system.array_none_type, current_target_type) /= Void)) and then
					(current_system.array_any_type.conforms_to_context (current_target_type, system_processor) or else
					(current_class = current_class_impl and then type_checker.convert_feature (current_system.array_any_type, current_target_type) /= Void))
				then
							-- Its type is 'ARRAY [ANY]'.
-- TODO: Emit "manifest_array_type" warning as specified in ECF 1.17.0.
						a_context.force_last (current_system.any_type)
				else
						-- Its type is 'ARRAY [NONE]'.
					a_context.force_last (current_system.none_type)
				end
				l_array_type := current_system.array_identity_type
				report_manifest_array (a_expression, l_array_type, a_context)
				a_context.force_last (l_array_type)
			else
				l_result_context_list := common_ancestor_type_list
				l_old_result_context_list_count := l_result_context_list.count
				from i := 1 until i > nb loop
					l_item := a_expression.item (i)
					l_item_expression := l_item.expression
					l_item_context := new_context (current_type)
					check_expression_validity (l_item_expression, l_item_context, l_item_target_context)
					if has_fatal_error then
						l_had_error := True
						l_item_conversion_aborted := True
						free_context (l_item_context)
					else
						if l_use_target_type and then l_parameter_context /= Void and then not l_item_conversion_aborted then
							if not l_item_context.conforms_to_context (l_parameter_context, system_processor) then
									-- The type of this item does not conform to the type of
									-- the parameter of the attachment target array type.
									-- Try to see if it converts to it.
									-- Convertibility should be resolved in the implementation class.
								if current_class = current_class_impl then
									l_convert_expression := convert_expression (l_item_expression, l_item_context, l_parameter_context)
									if has_fatal_error then
										l_item_conversion_aborted := True
									elseif l_convert_expression /= Void then
											-- Insert the conversion feature call in the AST.
										if attached {ET_EXPRESSION_COMMA} l_item as l_expression_comma then
											l_expression_comma.set_expression (l_convert_expression)
										else
											a_expression.put (l_convert_expression, i)
										end
										l_has_converted_item := True
									else
										l_item_conversion_aborted := True
									end
								else
									l_item_conversion_aborted := True
								end
							end
						end
						update_common_ancestor_type_list (l_item_context, l_result_context_list, l_old_result_context_list_count)
					end
					i := i + 1
				end
				if l_item_conversion_aborted and l_has_converted_item then
						-- We need to remove the convert features that we might
						-- have added to the AST.
					from i := 1 until i > nb loop
						l_item := a_expression.item (i)
						l_item_expression := l_item.expression
						if attached {ET_CONVERT_EXPRESSION} l_item_expression as l_attached_convert_expression then
							l_item_expression := l_attached_convert_expression.expression
							if attached {ET_EXPRESSION_COMMA} l_item as l_expression_comma then
								l_expression_comma.set_expression (l_item_expression)
							else
								a_expression.put (l_item_expression, i)
							end
						end
						i := i + 1
					end
				end
				if l_had_error then
					set_fatal_error
				else
					if l_use_target_type and then l_parameter_context /= Void and then not l_item_conversion_aborted then
						if l_result_context_list.count = l_old_result_context_list_count + 1 and then l_result_context_list.last.conforms_to_context (l_parameter_context, system_processor) then
								-- There is an item such as the types of all other
								-- items conform to its type, and this type conforms
								-- to the attachment target array type generic parameter.
								-- This means that the types of all items conform to
								-- the attachment target array type generic parameter.
								-- So no conversion was necessary.
							check no_conversion: not l_has_converted_item end
							a_context.copy_type_context (l_result_context_list.last)
						else
-- TODO: Emit "manifest_array_type" warning as specified in ECF 1.17.0.
							a_context.copy_type_context (l_parameter_context)
						end
					elseif l_result_context_list.count = l_old_result_context_list_count + 1 then
							-- There is an item such as the types of all other
							-- items conform to its type.
						a_context.copy_type_context (l_result_context_list.last)
					else
							-- There is no item such as the types of all other
							-- items conform to its type.
							-- In that case the type of the manifest array will be
							-- "ARRAY [ANY]", or "ARRAY [detachable ANY]" if the type
							-- of one of the items not attached.
						l_item_context := new_context (current_type)
						l_item_context.force_last (current_system.any_type)
						update_common_ancestor_type_list (l_item_context, l_result_context_list, l_old_result_context_list_count)
						a_context.copy_type_context (l_result_context_list.last)
					end
					l_array_type := current_system.array_identity_type
					report_manifest_array (a_expression, l_array_type, a_context)
					a_context.force_last (l_array_type)
				end
				free_common_ancestor_types (l_result_context_list, l_old_result_context_list_count)
			end
			if l_parameter_context /= Void then
				free_context (l_parameter_context)
			end
		end

	check_manifest_string_validity (a_string: ET_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_string'.
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- A manifest string is of the form:
			--    [manifest_type] manifest_value
			-- where the manifest_type is optional.
			-- We have to check that:
			--  * if 'manifest_type' is provided:
			--    * it is a valid type, and is one of the sized variants of "STRING".
			--    * 'manifest_value' is representable as an instance of 'manifest_type'.
			--  * otherwise, try to determine whether 'manifest_value' is representable
			--    as an instance of the type expected in the surrounding context.
			--  * otherwise, the constant will be of type "STRING_8" if 'manifest_value'
			--    is representable as a STRING_8, otherwise of type "STRING_32" if it
			--    is representable as a STRING_32.
			--  * otherwise, report an error.
			--
			-- Note that ECMA 367-2 says that the type of a manifest string constant
			-- with no explicit 'manifest_type' is "STRING" (see 8.29.6 "Definition:
			-- Type of a manifest constant", page 143). So the third bullet above is
			-- not quite compliant with ECMA. But this is the way it is implemented
			-- in ISE (as of 20.05.10.xxxx) to be able to capture Unicode characters.
			--
			-- Note that the sized variants of "STRING" include "STRING" itself, as
			-- indicated in ECMA 367-2, 8.30.1 "Definition: Basic types and their sized
			-- variants", page 147.
			--
			-- Note that as of ISE 19.07.10.3368, "IMMUTABLE_STRING_8" and
			-- "IMMUTABLE_STRING_32" are also considered as sized variants of "STRING".
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: detachable ET_CLASS_TYPE
			l_explicit_type: detachable ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.identity_type
			l_expected_type_context := current_target_type
			if attached a_string.cast_type as l_cast_type then
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
			elseif current_universe_impl.string_8_type.same_named_type_with_type_marks (l_expected_type, tokens.implicit_attached_type_mark, l_expected_type_context, tokens.implicit_attached_type_mark, current_class_impl) then
				if a_string.is_string_8 then
					l_type := current_universe_impl.string_8_type
					report_string_8_constant (a_string, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2c_error (current_class, current_class_impl, a_string, current_universe_impl.string_8_type)
				end
			elseif current_universe_impl.immutable_string_8_type.same_named_type_with_type_marks (l_expected_type, tokens.implicit_attached_type_mark, l_expected_type_context, tokens.implicit_attached_type_mark, current_class_impl) then
				if a_string.is_string_8 then
					l_type := current_universe_impl.immutable_string_8_type
					report_immutable_string_8_constant (a_string, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2c_error (current_class, current_class_impl, a_string, current_universe_impl.immutable_string_8_type)
				end
			elseif current_universe_impl.string_32_type.same_named_type_with_type_marks (l_expected_type, tokens.implicit_attached_type_mark, l_expected_type_context, tokens.implicit_attached_type_mark, current_class_impl) then
				if a_string.is_string_32 then
					l_type := current_universe_impl.string_32_type
					report_string_32_constant (a_string, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2c_error (current_class, current_class_impl, a_string, current_universe_impl.string_32_type)
				end
			elseif current_universe_impl.immutable_string_32_type.same_named_type_with_type_marks (l_expected_type, tokens.implicit_attached_type_mark, l_expected_type_context, tokens.implicit_attached_type_mark, current_class_impl) then
				if a_string.is_string_32 then
					l_type := current_universe_impl.string_32_type
					report_immutable_string_32_constant (a_string, l_type)
				else
					set_fatal_error
					error_handler.report_gvwmc2c_error (current_class, current_class_impl, a_string, current_universe_impl.immutable_string_32_type)
				end
			end
			if has_fatal_error then
				-- Do nothing.
			elseif l_type /= Void then
				-- We already found the type.
			elseif l_explicit_type /= Void then
					-- Error: invalid cast type, it should be a sized variant of "STRING".
				set_fatal_error
				error_handler.report_vwmq0d_error (current_class, current_class_impl, a_string)
			elseif a_string.is_string_8 then
				l_type := current_universe_impl.string_8_type
				report_string_8_constant (a_string, l_type)
			elseif a_string.is_string_32 then
				l_type := current_universe_impl.string_32_type
				report_string_32_constant (a_string, l_type)
			else
				set_fatal_error
				error_handler.report_gvwmc2c_error (current_class, current_class_impl, a_string, current_universe_impl.string_32_type)
			end
			if l_type /= Void then
				a_string.set_type (l_type)
				a_context.force_last (l_type)
			end
		end

	check_manifest_tuple_validity (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_tuple_parameters: detachable ET_ACTUAL_PARAMETERS
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_parameter_context: ET_NESTED_TYPE_CONTEXT
			l_detachable_any_type: ET_CLASS_TYPE
			l_tuple_type: ET_TUPLE_TYPE
		do
			has_fatal_error := False
				-- Try to find out whether the expected type (i.e. `current_target_type')
				-- for the manifest tuple is 'TUPLE [...]'. If this is the case then we
				-- use these item types as expected types for the corresponding items
				-- in the manifest tuple. For example if we expect a 'TUPLE [INTEGER_64]'
				-- and we have '[3]' then '3' will be considered as a '{INTEGER_64} 3'.
				-- Likewise, if we expect a 'TUPLE [ARRAY [HASHABLE]]' and we have
				-- '[<<"gobo", 3>>]' then the manifest array '<<"gobo", 3>>' will be
				-- considered of type 'ARRAY [HASHABLE]' (rather than of type 'ARRAY [ANY]'
				-- if it were analyzed out of context).
			if attached {ET_TUPLE_TYPE} current_target_type.named_type as l_attached_tuple_type then
				l_tuple_parameters := l_attached_tuple_type.actual_parameters
				if l_tuple_parameters /= Void then
					nb2 := l_tuple_parameters.count
				end
			end
			l_detachable_any_type := current_system.detachable_any_type
			nb := an_expression.count
			if nb = 0 then
				l_tuple_type := current_universe_impl.tuple_type
				report_manifest_tuple (an_expression, l_tuple_type, a_context)
				a_context.force_last (l_tuple_type)
			elseif nb = 1 then
				if l_tuple_parameters /= Void and nb2 >= 1 then
					l_parameter_context := new_context (current_type)
						-- The expected type for the manifest tuple is 'TUPLE [...]'.
						-- Use these item types as expected types for the corresponding items
						-- in the manifest tuple. For example if we expect a 'TUPLE [INTEGER_64]'
						-- and we have '[3]' then '3' will be considered as a '{INTEGER_64} 3'.
						-- Likewise, if we expect a 'TUPLE [ARRAY [HASHABLE]]' and we have
						-- '[<<"gobo", 3>>]' then the manifest array '<<"gobo", 3>>' will be
						-- considered of type 'ARRAY [HASHABLE]' (rather than of type 'ARRAY [ANY]'
						-- if it were analyzed out of context).
					l_parameter_context.force_last (l_tuple_parameters.type (1))
					check_expression_validity (an_expression.expression (1), a_context, l_parameter_context)
					free_context (l_parameter_context)
				else
					check_expression_validity (an_expression.expression (1), a_context, l_detachable_any_type)
				end
				if not has_fatal_error then
					l_tuple_type := current_universe_impl.tuple_identity_type
					report_manifest_tuple (an_expression, l_tuple_type, a_context)
					a_context.force_last (l_tuple_type)
				end
			else
				l_expression_context := new_context (current_type)
				create l_actuals.make_with_capacity (nb)
				from i := nb until i <= nb2 loop
						-- There is no matching tuple item type.
					check_expression_validity (an_expression.expression (i), l_expression_context, l_detachable_any_type)
					if has_fatal_error then
						had_error := True
					else
						l_actuals.put_first (l_expression_context.named_type)
					end
					l_expression_context.wipe_out
					i := i - 1
				end
				if l_tuple_parameters /= Void then
					l_parameter_context := new_context (current_type)
					from until i < 1 loop
							-- The expected type for the manifest tuple is 'TUPLE [...]'.
							-- Use these item types as expected types for the corresponding items
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
				end
				free_context (l_expression_context)
				if had_error then
					set_fatal_error
				else
					create l_tuple_type.make (tokens.implicit_attached_type_mark, l_actuals, current_universe_impl.tuple_type.named_base_class)
					report_manifest_tuple (an_expression, l_tuple_type, a_context)
					a_context.force_last (l_tuple_type)
				end
			end
		end

	check_manifest_type_validity (an_expression: ET_MANIFEST_TYPE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_type_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			l_type := an_expression.type
			check_type_validity (l_type)
			if not has_fatal_error then
				a_context.force_last (l_type)
				l_type_type := current_universe_impl.type_identity_type
				report_manifest_type (an_expression, l_type_type, a_context)
				a_context.force_last (l_type_type)
			end
		end

	check_named_object_test_validity (an_expression: ET_NAMED_OBJECT_TEST; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_had_error: BOOLEAN
			l_expression_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_IDENTIFIER
			i, j, nb: INTEGER
			l_enclosing_agent: ET_INLINE_AGENT
			l_type_kept: BOOLEAN
		do
			has_fatal_error := False
			l_expression_context := new_context (current_type)
			if attached an_expression.type as l_type then
				check_type_validity (l_type)
				if has_fatal_error then
						-- The type is not valid. We will consider that it is of
						-- type 'detachable ANY' when checking the validity of the expression.
					l_had_error := True
					check_expression_validity (an_expression.expression, l_expression_context, current_system.detachable_any_type)
					has_fatal_error := has_fatal_error or l_had_error
				else
					l_expression_context.force_last (l_type)
					check_expression_validity (an_expression.expression, a_context, l_expression_context)
					a_context.reset (current_type)
				end
			else
				check_expression_validity (an_expression.expression, l_expression_context, current_system.detachable_any_type)
			end
			if current_system.attachment_type_conformance_mode then
				if not l_expression_context.is_type_attached then
						-- The type of the object-test local is attached even
						-- when not explicitly declared as attached.
					l_expression_context.force_last (tokens.attached_like_current)
				end
			end
			if not has_fatal_error then
				current_object_test_types.force_last (l_expression_context, an_expression)
				l_type_kept := True
			end
				-- Check object-test local name clashes (see VUOT-1, in ECMA-367-2 p.127).
			if current_class = current_class_impl then
				l_name := an_expression.name
				if attached current_class.named_feature (l_name) as l_feature then
						-- This object-test local has the same name as the
						-- final name of a feature in `current_class'.
					set_fatal_error
					error_handler.report_vuot1a_error (current_class, an_expression, l_feature)
				end
				if attached current_inline_agent as l_current_inline_agent then
					enclosing_inline_agents.force_last (l_current_inline_agent)
					nb := enclosing_inline_agents.count
					from i := 1 until i > nb loop
						l_enclosing_agent := enclosing_inline_agents.item (i)
						if attached l_enclosing_agent.formal_arguments as args then
							j := args.index_of (l_name)
							if j /= 0 then
									-- This object-test local has the same name as a formal
									-- argument of an enclosing inline agent.
								set_fatal_error
								error_handler.report_vuot1b_error (current_class, an_expression, args.formal_argument (j))
							end
						end
						if attached l_enclosing_agent.locals as l_locals then
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
				if attached current_feature.arguments as args then
					j := args.index_of (l_name)
					if j /= 0 then
							-- This object-test local has the same name as a formal
							-- argument of the enclosing feature.
						set_fatal_error
						error_handler.report_vuot1b_error (current_class, an_expression, args.formal_argument (j))
					end
				end
				if attached current_feature.locals as l_locals then
					j := l_locals.index_of (l_name)
					if j /= 0 then
							-- This object-test local has the same name as a
							-- local variable of the enclosing feature.
						set_fatal_error
						error_handler.report_vuot1c_error (current_class, an_expression, l_locals.local_variable (j))
					end
				end
				if attached current_object_test_scope.object_test (l_name) as l_other_object_test then
						-- This object-test appears in the scope of another
						-- object-test local with the same name.
					set_fatal_error
					error_handler.report_vuot1d_error (current_class, an_expression, l_other_object_test)
				end
				if attached current_iteration_item_scope.iteration_component (l_name) as l_iteration_component then
						-- This object-test appears in the scope of an iteration
						-- cursor with the same name.
					set_fatal_error
					error_handler.report_vuot1e_error (current_class, an_expression, l_iteration_component)
				end
				if system_processor.older_ise_version (ise_6_3_7_5660) then
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
			end
				-- Set the type of the object-test to be BOOLEAN even in case
				-- of fatal error so that the scope of the object-test local
				-- can be computed even if the object-test appears as an operand
				-- of an infix or prefix boolean operator.
			a_context.force_last (current_universe_impl.boolean_type)
			if not has_fatal_error then
				report_named_object_test (an_expression, l_expression_context)
			end
			if not l_type_kept then
				free_context (l_expression_context)
			end
		end

	check_object_equality_expression_validity (an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_left_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_right_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_detachable_any_type: ET_CLASS_TYPE
			l_target_type_context: ET_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			has_fatal_error := False
			an_expression.name.set_seed (current_system.is_equal_seed)
			l_detachable_any_type := current_system.detachable_any_type
			l_left_context := new_context (current_type)
			l_right_context := new_context (current_type)
			l_left_operand := an_expression.left
			l_right_operand := an_expression.right
			check_expression_validity (l_left_operand, l_left_context, l_detachable_any_type)
			l_target_type_context := l_left_context
			if not has_fatal_error then
				check_expression_validity (l_right_operand, l_right_context, l_detachable_any_type)
				if not has_fatal_error then
					if current_class /= current_class_impl then
						-- Possible convertibility should be resolved in the implementation class.
					elseif l_left_context.conforms_to_context_with_type_marks (tokens.attached_keyword, l_right_context, tokens.attached_keyword, system_processor) then
						-- OK.
					elseif l_right_context.conforms_to_context_with_type_marks (tokens.attached_keyword, l_left_context, tokens.attached_keyword, system_processor) then
						-- OK.
					elseif l_left_context.same_named_type (current_system.detachable_none_type, current_type) then
						-- OK: we can compare anything with 'Void'.
						-- This is a breach of VWEQ in case the other operand
						-- is of expanded type or formal generic type.
					elseif l_right_context.same_named_type (current_system.detachable_none_type, current_type) then
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
							l_target_type_context := l_right_context
						else
								-- We consider that VWEQ is not taken into account in flat Degree 3 mode.
								-- This is not considered as a fatal error.
							error_handler.report_vweq0b_error (current_class, current_class_impl, an_expression, l_left_context.named_type, l_right_context.named_type)
						end
					end
					if not has_fatal_error then
						a_context.force_last (current_universe_impl.boolean_type)
						report_object_equality_expression (an_expression, l_target_type_context)
					end
				end
			else
					-- The left expression is not valid. Check the right expression
					-- anyway, and then restore `has_fatal_error' to True.
				check_expression_validity (l_right_operand, l_right_context, l_detachable_any_type)
				set_fatal_error
			end
			free_context (l_right_context)
			free_context (l_left_context)
		end

	check_object_test_validity (an_expression: ET_OBJECT_TEST; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_had_error: BOOLEAN
			l_expression_context: ET_NESTED_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expression_context := new_context (current_type)
			if attached an_expression.type as l_type then
				check_type_validity (l_type)
				if has_fatal_error then
						-- The type is not valid. We will consider that it is of
						-- type 'detachable ANY' when checking the validity of the expression.
					l_had_error := True
					check_expression_validity (an_expression.expression, l_expression_context, current_system.detachable_any_type)
					has_fatal_error := has_fatal_error or l_had_error
				else
					report_object_test_type (an_expression, l_type, a_context)
					l_expression_context.force_last (l_type)
					check_expression_validity (an_expression.expression, a_context, l_expression_context)
					a_context.reset (current_type)
				end
			else
				check_expression_validity (an_expression.expression, l_expression_context, current_system.detachable_any_type)
			end
			free_context (l_expression_context)
			if not has_fatal_error then
				a_context.force_last (current_universe_impl.boolean_type)
				report_object_test (an_expression)
			end
		end

	check_object_test_local_validity (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of object-test local `a_name'.
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_object_test_local: a_name.is_object_test_local
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_object_test: detachable ET_NAMED_OBJECT_TEST
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
								-- The type of the object-test local should have been determined
								-- when processing the object-test itself. And this should have
								-- already been done since we are in the scope of that object-test.
								-- Here we don't have this type, which means that an error had
								-- occurred (and had been reported) when processing the expression
								-- of the object-test.
							set_fatal_error
						else
							a_context.copy_type_context (current_object_test_types.found_item)
							report_object_test_local (a_name, l_object_test)
						end
					end
				end
			else
				if not attached current_closure_impl.object_tests as l_object_tests then
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
							-- The type of the object-test local should have been determined
							-- when processing the object-test itself. And this should have
							-- already been done since we are in the scope of that object-test.
							-- Here we don't have this type, which means that an error had
							-- occurred (and had been reported) when processing the expression
							-- of the object-test.
						set_fatal_error
					else
						a_context.copy_type_context (current_object_test_types.found_item)
						report_object_test_local (a_name, l_object_test)
					end
				end
			end
		end

	check_octal_integer_constant_validity (a_constant: ET_OCTAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_old_expression_validity (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_once_manifest_string_validity (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_parenthesized_expression_validity (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_precursor_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_parent_type: ET_BASE_TYPE
			l_class: ET_CLASS
			l_has_parenthesis_call: BOOLEAN
		do
			has_fatal_error := False
			if not attached {ET_FEATURE} current_feature_impl as l_feature_impl then
					-- The Precursor expression does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1b_error (current_class, an_expression)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (an_expression)
			elseif in_precondition or in_postcondition then
					-- The Precursor expression does not appear in a Routine_body.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr1b_error (current_class, an_expression)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-1 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (an_expression)
			elseif attached current_inline_agent as l_current_inline_agent then
					-- The associated feature of inline agents cannot be redefined.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vdpr3e_error (current_class, an_expression, l_current_inline_agent, l_feature_impl)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: the VDPR-3 error should have been
						-- reported in the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (an_expression)
			elseif current_feature.first_precursor = Void then
					-- Immediate features cannot have Precursor.
				set_fatal_error
				if current_class_impl /= current_class then
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: Precursor should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				else
					error_handler.report_vdpr3d_error (current_class, an_expression, l_feature_impl)
				end
				check_orphan_actual_arguments_validity (an_expression)
			elseif not attached an_expression.parent_type as l_unresolved_parent_type then
					-- Internal error: the Precursor construct should
					-- already have been resolved when flattening the
					-- features of `current_class_impl'. And the feature flattener
					-- has already been executed on `current_class' at this stage,
					-- and hence on the ancestor class `current_class_impl'.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (an_expression)
			else
				l_parent_type := l_unresolved_parent_type
				if current_class /= current_class_impl and l_parent_type.is_generic then
						-- Resolve generic parameters in the context of `current_type'.
						-- The ancestor builder has already been executed on `current_class'
						-- at this stage, and therefore there is no need to check it again here.
					if attached current_class.ancestor (l_parent_type) as l_ancestor then
						l_parent_type := l_ancestor
					else
							-- Internal error: `l_parent_type' is an ancestor
							-- of `current_class_impl', and hence of `current_class'.
						set_fatal_error
						error_handler.report_giaaa_error
						check_orphan_actual_arguments_validity (an_expression)
					end
				end
				if not has_fatal_error then
					l_precursor_keyword := an_expression.precursor_keyword
					l_class := l_parent_type.base_class
					if attached l_class.seeded_query (l_precursor_keyword.seed) as l_query then
							-- Check for parenthesis alias.
						if current_class = current_class_impl then
							check_precursor_parenthesis_call_validity (an_expression, l_query, l_class, l_parent_type, a_context)
							if not has_fatal_error and then attached an_expression.parenthesis_call as l_parenthesis_call then
								an_expression.set_index (l_parenthesis_call.index)
								l_has_parenthesis_call := True
							end
						end
						if not has_fatal_error and then not l_has_parenthesis_call then
							check_precursor_query_expression_validity (an_expression, l_query, l_class, l_parent_type, a_context)
						end
					elseif attached l_class.seeded_procedure (l_precursor_keyword.seed) as l_procedure then
							-- The precursor in a procedure cannot be used as an expression.
						set_fatal_error
						error_handler.report_vkcn2a_error (current_class, l_precursor_keyword, l_procedure, l_class)
						check_orphan_actual_arguments_validity (an_expression)
					else
							-- Internal error: the Precursor construct should
							-- already have been resolved when flattening the
							-- features of `current_class_impl'.
						set_fatal_error
						error_handler.report_giaaa_error
						check_orphan_actual_arguments_validity (an_expression)
					end
				end
			end
		end

	check_precursor_query_expression_validity (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_query: ET_QUERY; a_parent_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_parent_query_not_void: a_parent_query /= Void
			a_parent_class_not_void: a_parent_class /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_had_error: BOOLEAN
		do
			if in_static_feature and then not a_parent_query.is_static then
					-- Error: we cannot call a non-static precursor from a static feature.
				set_fatal_error
				error_handler.report_vucr0h_error (current_class, current_class_impl, an_expression.precursor_keyword, a_parent_query)
				l_had_error := True
			end
			l_actual_context := new_context (current_type)
			l_actual_context.force_last (a_parent_type)
			check_actual_arguments_validity (an_expression, l_actual_context, a_parent_query, a_parent_class, Void)
			free_context (l_actual_context)
			reset_fatal_error (l_had_error or has_fatal_error)
			if not has_fatal_error then
-- TODO: like argument.
				l_type := a_parent_query.type
				a_context.force_last (l_type)
				report_precursor_expression (an_expression, a_parent_type, a_parent_query)
				if attached precursor_queries as l_precursor_queries then
					l_precursor_queries.force_last (a_parent_query)
				end
			end
		end

	check_prefix_expression_validity (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_qualified_call_expression_validity (an_expression, a_context, Void)
		end

	check_qualified_call_expression_validity (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_context_not_void: a_context /= Void
		local
			l_target: ET_EXPRESSION
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_query: detachable ET_QUERY
			l_first_tuple_label: INTEGER
			l_other_query: detachable ET_QUERY
		do
			has_fatal_error := False
			l_target := a_call.target
			l_name := a_call.name
			l_seed := l_name.seed
			check_expression_validity (l_target, a_context, current_system.detachable_any_type)
			l_context_count := a_context.count
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, a_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (a_call)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
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
						-- It is useful to know which binary expressions are
						-- boolean operators between two boolean expressions
						-- when trying to determine the scope of object-test
						-- locals and CAPs (Certified Attachment Patterns),
						-- even when a fatal error occurred in `l_target'.
					if l_class.is_boolean_class then
						if attached {ET_PREFIX_EXPRESSION} a_call as l_prefix_expression then
							l_prefix_expression.set_boolean_operator (True)
						elseif attached {ET_INFIX_EXPRESSION} a_call as l_infix_expression then
							l_infix_expression.set_boolean_operator (True)
						end
					end
				end
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_qualified_dotnet_query_call_expression_validity (a_call, l_adapted_base_class, a_context, a_call_info)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
						-- Check for parenthesis alias.
					check_query_parenthesis_call_validity (a_call, l_query, l_class, a_context, a_call_info)
					if has_fatal_error then
						-- Do nothing.
					elseif attached a_call.parenthesis_call as l_parenthesis_call then
						a_call.set_index (l_parenthesis_call.index)
					else
						check_qualified_query_call_expression_validity (a_call, l_query, l_class, a_context, a_call_info)
					end
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
						-- In a call expression, the feature has to be a query.
					set_fatal_error
					error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
					check_orphan_actual_arguments_validity (a_call)
				else
					if l_class.is_tuple_class and then attached {ET_IDENTIFIER} l_name as l_label then
							-- Check whether this is a tuple label.
						l_seed := l_adapted_base_class.base_type_index_of_label (l_label, a_context)
						if l_seed /= 0 then
							l_label.set_tuple_label (True)
							l_label.set_seed (l_seed)
								-- Check for parenthesis alias.
							check_tuple_label_parenthesis_call_validity (a_call, l_class, a_context, a_call_info)
							if has_fatal_error then
								-- Do nothing.
							elseif attached a_call.parenthesis_call as l_parenthesis_call then
								a_call.set_index (l_parenthesis_call.index)
							else
								check_qualified_tuple_label_call_expression_validity (a_call, l_class, a_context, a_call_info)
							end
						end
					end
					if l_seed = 0 then
						set_fatal_error
							-- ISE Eiffel 5.4 reports this error as a VEEN,
							-- but it is in fact a VUEX-2 (ETL2 p.368).
						error_handler.report_vuex2a_error (current_class, l_name, l_class)
						check_orphan_actual_arguments_validity (a_call)
					end
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- expression was written. So, if we got a seed, a query or tuple label
					-- should exist.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					if l_name.is_tuple_label then
						if l_class.is_tuple_class then
							check_qualified_tuple_label_call_expression_validity (a_call, l_class, a_context, a_call_info)
						elseif l_class.is_none then
-- TODO: "NONE" conforms to "TUPLE".
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Report internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif attached l_class.seeded_query (l_seed) as l_query then
						check_qualified_query_call_expression_validity (a_call, l_query, l_class, a_context, a_call_info)
						l_other_query := l_query
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- expression was written. So, if we got a seed, there should be a
							-- query for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					elseif l_first_context /= Void and l_first_adapted_base_class /= Void then
						if not a_context.same_named_context (l_first_context) then
							set_fatal_error
							if l_first_query /= Void and l_other_query /= Void then
									-- Two queries with the same seed and different result types.
								error_handler.report_vgmc0e_error (current_class, current_class_impl, l_name, l_first_query, l_first_adapted_base_class, l_other_query, l_adapted_base_class)
							else
									-- Two Tuples with different item types at index `l_seed'.
								error_handler.report_vgmc0f_error (current_class, current_class_impl, l_name, l_seed, l_first_adapted_base_class, l_adapted_base_class)
							end
						end
					elseif nb > 1 then
						l_first_context := new_context (current_type)
						l_first_context.copy_type_context (a_context)
						l_first_adapted_base_class := l_adapted_base_class
						l_first_query := l_other_query
						l_first_tuple_label := l_seed
					end
					if i < nb then
						a_context.keep_first (l_context_count)
					end
					i := i + 1
				end
				if l_first_context /= Void then
					free_context (l_first_context)
				end
			end
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_qualified_dotnet_query_call_expression_validity (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_adapted_base_class: ET_ADAPTED_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call `a_call' to a .NET query.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_class_is_dotnet: a_adapted_base_class.base_class.is_dotnet
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_overloaded_queries: DS_ARRAYED_LIST [ET_QUERY]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_call.name
			l_overloaded_queries := new_overloaded_queries
			a_adapted_base_class.add_overloaded_queries (l_name, l_overloaded_queries)
			if not l_overloaded_queries.is_empty then
				keep_best_overloaded_features (l_overloaded_queries, adapted_name (l_name, a_adapted_base_class), a_call.arguments, a_context, False, False)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				elseif l_overloaded_queries.count = 1 then
					l_query := l_overloaded_queries.first
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
					check_query_parenthesis_call_validity (a_call, l_query, l_class, a_context, Void)
					if has_fatal_error then
						-- Do nothing.
					elseif attached a_call.parenthesis_call as l_parenthesis_call then
						a_call.set_index (l_parenthesis_call.index)
					else
						check_qualified_query_call_expression_validity (a_call, l_query, l_class, a_context, a_call_info)
					end
				else
					-- Ambiguity in overloaded queries.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached a_adapted_base_class.named_procedure (l_name) as l_procedure then
					-- In a call expression, the feature has to be a query.
				set_fatal_error
				error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
				check_orphan_actual_arguments_validity (a_call)
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class, l_name, l_class)
				check_orphan_actual_arguments_validity (a_call)
			end
			free_overloaded_queries (l_overloaded_queries)
		end

	check_qualified_feature_call_validity (a_call: ET_QUALIFIED_FEATURE_CALL; a_feature: ET_FEATURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call `a_call' to feature `a_feature'.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
				-- Check that the target of the call is attached.
			if current_system.target_type_attachment_mode then
				if not a_context.is_type_attached then
						-- Error: the target of the call is not attached.
					set_fatal_error
					error_handler.report_vuta2a_error (current_class, current_class_impl, l_name, a_feature, a_context.named_type)
				end
			end
				-- Check export status.
			if not a_feature.is_exported_to (current_class, system_processor) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, a_feature, a_class)
			end
			l_had_error := has_fatal_error
				-- Check that if the call to `a_feature' appears in a precondition
				-- of `current_feature', then it is exported to all classes to which
				-- `current_feature' is exported.
			check_qualified_vape_validity (l_name, a_feature, a_class)
			l_had_error := has_fatal_error or l_had_error
				-- Check the validity of the arguments of the call.
			check_actual_arguments_validity (a_call, a_context, a_feature, a_class, a_call_info)
			reset_fatal_error (l_had_error or has_fatal_error)
		end

	check_qualified_feature_call_expression_validity (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_feature: ET_FEATURE; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call `a_call' to feature `a_feature'.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			if attached {ET_QUERY} a_feature as l_query then
				check_qualified_query_call_expression_validity (a_call, l_query, a_class, a_context, a_call_info)
			elseif attached {ET_PROCEDURE} a_feature as l_procedure then
					-- In a call expression, the feature has to be a query.
				set_fatal_error
				error_handler.report_vkcn2a_error (current_class, a_call.name, l_procedure, a_class)
				check_orphan_actual_arguments_validity (a_call)
			else
					-- The feature is either a query or a procedure.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			end
		end

	check_qualified_query_call_expression_validity (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call `a_call' to feature `a_query'.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		local
			l_had_error: BOOLEAN
			l_query: ET_QUERY
		do
			l_query := a_query
			if a_call_info /= Void then
				a_call_info.query := l_query
				a_call_info.target_class := a_class
				a_call_info.target_context.copy_type_context (a_context)
			end
			check_qualified_feature_call_validity (a_call, a_query, a_class, a_context, a_call_info)
			if not has_fatal_error then
				if a_call_info /= Void and then attached a_call_info.query as l_call_query and then l_call_query /= l_query then
						-- The query has been changed.
						-- This might happen for infix expression when the target
						-- needed to be converted to the type of the argument.
					l_query := l_call_query
					a_context.copy_type_context (a_call_info.target_context)
				end
				report_qualified_call_expression (a_call, a_context, l_query)
				l_had_error := has_fatal_error
					-- Update `a_context' so that it represents the type of `a_call'.
				check_query_call_type_validity (a_call, l_query, a_context)
				reset_fatal_error (l_had_error or has_fatal_error)
			end
		end

	check_qualified_tuple_label_call_expression_validity (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check validity of qualified call `a_call' when it's a call to a tuple label.
			-- The validity of the target of the call is assumed to have already been checked.
			-- `a_class' is the base class of the target of the call.
			-- `a_context' represents the type of the target of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			is_tuple_label: a_call.name.is_tuple_label
			a_class_not_void: a_class /= Void
			a_class_is_tuple: a_class.is_tuple_class
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_type: ET_TYPE
			l_seed: INTEGER
		do
			has_fatal_error := False
			l_name := a_call.name
			l_seed := l_name.seed
			if a_call_info /= Void then
				a_call_info.query := Void
				a_call_info.target_class := a_class
				a_call_info.target_context.copy_type_context (a_context)
			end
				-- Check that the target of the call is attached.
			if current_system.target_type_attachment_mode then
				if not a_context.is_type_attached then
						-- Error: the target of the call is not attached.
					set_fatal_error
					error_handler.report_vuta2b_error (current_class, current_class_impl, l_name, a_context.named_type)
				end
			end
			if a_call.arguments_count > 0 then
					-- A call to a Tuple label cannot have arguments.
				set_fatal_error
				if current_class = current_class_impl then
					error_handler.report_vuar1c_error (current_class, l_name)
				elseif not has_implementation_error (current_feature_impl) then
						-- Internal error: this error should have been reported when
						-- processing the implementation of `current_feature_impl'.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			end
			if l_seed > a_context.base_type_actual_count then
					-- Report internal error: the index of the labeled
					-- actual parameter cannot be out of bound because
					-- for a Tuple type to conform to another Tuple type
					-- it needs to have more actual parameters.
				set_fatal_error
				error_handler.report_giaaa_error
			elseif not has_fatal_error then
				l_type := a_class.formal_parameter_type (l_seed)
				report_tuple_label_expression (a_call, a_context)
				a_context.force_last (l_type)
			end
		end

	check_quantifier_expression_validity (a_expression: ET_QUANTIFIER_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_expression'.
			-- `a_context' represents the type in which `a_expression' appears.
			-- It will be altered on exit to represent the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_context_not_void: a_context /= Void
		do
			check_iteration_expression_validity (a_expression, a_context)
		end

	check_query_call_type_validity (a_call: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of the type of `a_query' when `a_call' is a call to `a_query'.
			-- `a_context' represents the type of the target of the call.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_actual: ET_EXPRESSION
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
		do
			has_fatal_error := False
			l_type := a_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
			if attached {ET_LIKE_FEATURE} l_type as l_like and then l_like.is_like_argument then
				if attached a_call.arguments as l_actuals and then l_actuals.count = 1 and then attached a_query.arguments as l_query_arguments then
					l_class := a_context.base_class
					l_formal_context := new_context (current_type)
					l_formal_context.copy_type_context (a_context)
					l_formal_context.force_last (l_query_arguments.formal_argument (1).type)
					a_context.wipe_out
					l_actual := l_actuals.actual_argument (1)
					check_actual_argument_validity (l_actual, a_context, l_formal_context, a_call, l_class)
					free_context (l_formal_context)
					if not has_fatal_error then
						if attached {ET_CONVERT_EXPRESSION} l_actual as l_convert_expression then
							if attached {ET_BUILTIN_CONVERT_FEATURE} l_convert_expression.convert_feature as l_builtin then
									-- Needed for compatibility with ISE 5.6.0610:
									-- a formal generic parameter either conforms or converts to its constraint,
									-- then the converted version can still be chained with a conformance to
									-- `current_target_type'.
								a_context.reset (current_type)
								a_context.force_last (l_builtin.type)
							end
						end
					end
				else
					a_context.force_last (l_type)
				end
			else
				a_context.force_last (l_type)
			end
		end

	check_real_constant_validity (a_constant: ET_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_constant'.
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: detachable ET_CLASS_TYPE
			l_explicit_type: detachable ET_TYPE
			l_expected_type: ET_TYPE
			l_expected_type_context: ET_TYPE_CONTEXT
		do
			has_fatal_error := False
			l_expected_type := tokens.identity_type
			l_expected_type_context := current_target_type
			if attached a_constant.cast_type as l_cast_type then
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

	check_regular_integer_constant_validity (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_regular_manifest_string_validity (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_regular_real_constant_validity (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_result_validity (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: detachable ET_TYPE
			l_is_attached: BOOLEAN
		do
			has_fatal_error := False
			if current_inline_agent = Void and in_precondition then
-- TODO: check the case where we are in the precondition of an inline agent.
					-- The entity Result appears in a precondition.
				set_fatal_error
				if current_class_impl = current_class then
					if current_feature_impl.is_feature then
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
				if attached current_inline_agent as l_current_inline_agent then
					l_type := l_current_inline_agent.type
				else
						-- Use type of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f: ANY
						--           deferred
						--           ensure
						--              post: g (Result)
						--           end
						--      g (a: ANY): BOOLEAN deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f: STRING do ... end
						--        g (a: STRING): BOOLEAN do ... end
						--    end
						-- 'Result' in the inherited postcondition "post" should be considered
						-- of type STRING (and not ANY) is class B.
					l_type := current_feature.type
				end
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_veen2g_error (current_class, an_expression, l_current_inline_agent)
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
					a_context.force_last (l_type)
					if current_system.attachment_type_conformance_mode then
						l_is_attached := True
						if not a_context.is_type_attached then
							if current_attachment_scope.has_result then
									-- Even though this 'Result' entity has not been declared as attached,
									-- we can guarantee that at this stage it is attached.
								a_context.force_last (tokens.attached_like_current)
							else
								l_is_attached := False
							end
						elseif not (current_inline_agent = Void and in_postcondition) and then (not a_context.is_type_detachable and not a_context.is_type_expanded) then
							if system_processor.is_ise then
									-- In ISE Eiffel, local variables (including 'Result') are considered
									-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								if not current_attachment_scope.has_result then
									a_context.force_last (tokens.detachable_like_current)
									l_is_attached := False
								end
							elseif not current_initialization_scope.has_result then
									-- Error: 'Result' entity declared as attached and
									-- used before being initialized.
								set_fatal_error
								error_handler.report_vevi0b_error (current_class, current_class_impl, an_expression)
							end
						end
					end
					report_result (an_expression, l_is_attached)
				end
			end
		end

	check_result_address_validity (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: detachable ET_TYPE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_CLASS_TYPE
			l_pointer_type: ET_CLASS_TYPE
		do
			has_fatal_error := False
			if current_inline_agent = Void and in_precondition then
-- TODO: check the case where we are in the precondition of an inline agent.
					-- The entity Result appears in a precondition.
				set_fatal_error
				if current_class_impl = current_class then
					if current_feature_impl.is_feature then
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
				if attached current_inline_agent as l_current_inline_agent then
					l_type := l_current_inline_agent.type
				else
						-- Use type of `current_feature' instead of `current_feature_impl'
						-- because when processing inherited assertions the types of signature
						-- should be those of the version of the feature in the current class.
						-- For example:
						--    deferred class A
						--    feature
						--       f: ANY
						--           deferred
						--           ensure
						--              post: g ($Result)
						--           end
						--      g (a: TYPED_POINTER [ANY]): BOOLEAN deferred end
						--    end
						--    class B
						--    inherit
						--        A
						--    feature
						--        f: STRING do ... end
						--        g (a: TYPED_POINTER [STRING]): BOOLEAN do ... end
						--    end
						-- 'Result' in the inherited postcondition "post" should be considered
						-- of type STRING (and not ANY) is class B.
					l_type := current_feature.type
				end
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_veen2f_error (current_class, an_expression.result_keyword, l_current_inline_agent)
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
					l_typed_pointer_type := current_universe_impl.typed_pointer_Identity_type
					l_typed_pointer_class := l_typed_pointer_type.named_base_class
					if l_typed_pointer_class.actual_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation: the type of '$Result' is 'TYPED_POINTER [<type-of-result>]'.
						a_context.force_last (l_type)
						report_typed_pointer_expression (an_expression, l_typed_pointer_type, a_context)
						a_context.force_last (l_typed_pointer_type)
					else
							-- Use the ETL2 implementation: the type of '$argument' is POINTER.
						l_pointer_type := current_universe_impl.pointer_type
						a_context.force_last (l_pointer_type)
						report_pointer_expression (an_expression, l_pointer_type)
					end
				end
			end
		end

	check_special_manifest_string_validity (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_static_call_expression_validity (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_class: ET_CLASS
			l_type: ET_TYPE
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_query: detachable ET_QUERY
			l_other_query: detachable ET_QUERY
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_seed := l_name.seed
			l_type := an_expression.type
			check_type_validity (l_type)
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				a_context.force_last (l_type)
				l_context_count := a_context.count
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_name, l_adapted_base_classes, a_context)
			end
			if has_fatal_error then
				check_orphan_actual_arguments_validity (an_expression)
			elseif l_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				l_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (an_expression)
				elseif l_class.is_dotnet then
						-- A class coming from a .NET assembly can contain overloaded
						-- features (i.e. several features with the same name).
						-- We have to be careful about that here.
					check_static_dotnet_query_call_expression_validity (an_expression, l_adapted_base_class, a_context)
				elseif attached l_adapted_base_class.named_query (l_name) as l_query then
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
						-- Check for parenthesis alias.
					check_static_parenthesis_call_validity (an_expression, l_query, l_class, a_context)
					if has_fatal_error then
						-- Do nothing.
					elseif attached an_expression.parenthesis_call as l_parenthesis_call then
						an_expression.set_index (l_parenthesis_call.index)
					else
						check_static_query_call_expression_validity (an_expression, l_query, l_class, a_context)
					end
				elseif attached l_adapted_base_class.named_procedure (l_name) as l_procedure then
						-- In a call expression, the feature has to be a query.
					set_fatal_error
					error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
					check_orphan_actual_arguments_validity (an_expression)
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-2 (ETL2 p.368).
					error_handler.report_vuex2a_error (current_class, l_name, l_class)
					check_orphan_actual_arguments_validity (an_expression)
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- expression was written. So, if we got a seed, a query should exist.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (an_expression)
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					l_class := l_adapted_base_class.base_class
					adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					if attached l_class.seeded_query (l_seed) as l_query then
						check_static_query_call_expression_validity (an_expression, l_query, l_class, a_context)
						l_other_query := l_query
					elseif l_class.is_none then
-- TODO: "NONE" conforms to all reference types.
						set_fatal_error
						error_handler.report_giaaa_error
					else
							-- Internal error: the seed was already computed in a proper ancestor
							-- (or in another generic derivation) of `current_class' where this
							-- expression was written. So, if we got a seed, there should be a
							-- query for this seed.
						set_fatal_error
						error_handler.report_giaaa_error
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					elseif l_first_context /= Void and l_first_adapted_base_class /= Void and l_first_query /= Void and l_other_query /= Void then
						if not a_context.same_named_context (l_first_context) then
								-- Two queries with the same seed and different result types.
							set_fatal_error
							error_handler.report_vgmc0e_error (current_class, current_class_impl, l_name, l_first_query, l_first_adapted_base_class, l_other_query, l_adapted_base_class)
						end
					elseif nb > 1 then
						l_first_context := new_context (current_type)
						l_first_context.copy_type_context (a_context)
						l_first_adapted_base_class := l_adapted_base_class
						l_first_query := l_other_query
					end
					if i < nb then
						a_context.keep_first (l_context_count)
					end
					i := i + 1
				end
				if l_first_context /= Void then
					free_context (l_first_context)
				end
			end
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_static_dotnet_query_call_expression_validity (a_call: ET_STATIC_CALL_EXPRESSION; a_adapted_base_class: ET_ADAPTED_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of static call `a_call' to a .NET query.
			--
			-- A class coming from a .NET assembly can contain overloaded
			-- features (i.e. several features with the same name).
			-- We have to be careful about that here.
			--
			-- The validity of the static type part of the call is assumed to have already been checked.
			-- `a_adapted_base_class' is the base class (or the best possible constraint in case of multiple
			-- constraint genericity) of the static type part of `a_call'.
			-- `a_context' represents the static type part of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
			a_class_is_dotnet: a_adapted_base_class.base_class.is_dotnet
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_overloaded_queries: DS_ARRAYED_LIST [ET_QUERY]
		do
			has_fatal_error := False
			l_class := a_adapted_base_class.base_class
			l_name := a_call.name
			l_overloaded_queries := new_overloaded_queries
			a_adapted_base_class.add_overloaded_queries (l_name, l_overloaded_queries)
			if not l_overloaded_queries.is_empty then
				keep_best_overloaded_features (l_overloaded_queries, adapted_name (l_name, a_adapted_base_class), a_call.arguments, a_context, True, False)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				elseif l_overloaded_queries.count = 1 then
					l_query := l_overloaded_queries.first
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
					check_static_parenthesis_call_validity (a_call, l_query, l_class, a_context)
					if has_fatal_error then
						-- Do nothing.
					elseif attached a_call.parenthesis_call as l_parenthesis_call then
						a_call.set_index (l_parenthesis_call.index)
					else
						check_static_query_call_expression_validity (a_call, l_query, l_class, a_context)
					end
				else
					-- Ambiguity in overloaded queries.
-- TODO: report VIOF
					set_fatal_error
					error_handler.report_giaaa_error
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached a_adapted_base_class.named_procedure (l_name) as l_procedure then
					-- In a call expression, the feature has to be a query.
				set_fatal_error
				error_handler.report_vkcn2a_error (current_class, l_name, l_procedure, l_class)
				check_orphan_actual_arguments_validity (a_call)
			else
				set_fatal_error
					-- ISE Eiffel 5.4 reports this error as a VEEN,
					-- but it is in fact a VUEX-2 (ETL2 p.368).
				error_handler.report_vuex2a_error (current_class, l_name, l_class)
				check_orphan_actual_arguments_validity (a_call)
			end
			free_overloaded_queries (l_overloaded_queries)
		end

	check_static_query_call_expression_validity (a_call: ET_STATIC_CALL_EXPRESSION; a_query: ET_QUERY; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of static call `a_call' to feature `a_query'.
			-- The validity of the static type part of the call is assumed to have already been checked.
			-- `a_class' is the base class of the static type part of the call.
			-- `a_context' represents the static type part of `a_call'.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_result_type: ET_TYPE
			l_name: ET_CALL_NAME
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
			l_type := a_call.type
			report_static_supplier (l_type, current_class, current_feature)
				-- Check export status.
			if not a_query.is_exported_to (current_class, system_processor) then
					-- The feature is not exported to `current_class'.
				set_fatal_error
				error_handler.report_vuex2b_error (current_class, current_class_impl, l_name, a_query, a_class)
			end
			l_had_error := has_fatal_error
				-- Check that if the call to `a_query' appears in a precondition
				-- of `current_feature', then it is exported to all classes to which
				-- `current_feature' is exported.
			check_qualified_vape_validity (l_name, a_query, a_class)
			l_had_error := has_fatal_error or l_had_error
				-- Check the validity of the arguments of the call.
			check_actual_arguments_validity (a_call, a_context, a_query, a_class, Void)
			l_had_error := has_fatal_error or l_had_error
				-- Check the validity `a_query' as a feature of a static call.
			check_static_feature_validity (a_call, a_query, a_class)
			reset_fatal_error (has_fatal_error or l_had_error)
			if not has_fatal_error then
-- TODO: like argument.
				l_result_type := a_query.type
				a_context.force_last (l_result_type)
				report_static_call_expression (a_call, l_type, a_query)
			end
		end

	check_static_feature_validity (a_call: ET_STATIC_FEATURE_CALL; a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Check validity of `a_feature' as the feature of static call `a_call'.
			-- `a_class' is the base class of the static type part of the call.
			--
			-- To be valid, the feature needs to be explicitly declared as static,
			-- a constant attribute, a unique attribute, an external routine which
			-- is not a built-in non-static routine and whose pre- and postconditions
			-- (even those inherited) are instance-free (i.e. not dependent on 'Current'
			-- or its attributes), or a static .NET feature.
			-- For the assertions in external routines, ECMA says that it's possible to have
			-- assertions provided that they do not involve "Current" or unqualified calls
			-- (see ECMA VUNO-3). But ISE is more strict and does not accept assertions
			-- with Precursors.
			--
			-- Also, the base class of the static type part should not be deferred unless
			-- the feature is a constant attribute, a unique attribute, or an external routine
			-- which is not a built-in non-static routine and whose pre- and postconditions
			-- (even those inherited) are instance-free (i.e. not dependent on 'Current'
			-- or its attributes).
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		do
			has_fatal_error := False
			if not a_feature.is_static then
				set_fatal_error
				error_handler.report_vuno3a_error (current_class, current_class_impl, a_call.name, a_feature, a_class)
			end
			if a_call.type.is_like_current then
				set_fatal_error
				error_handler.report_vuno5b_error (current_class, current_class_impl, a_call.type)
			end
			if a_class.is_deferred then
				if attached {ET_CONSTANT_ATTRIBUTE} a_feature as l_constant_attribute and then l_constant_attribute.is_implicitly_static then
					-- OK
				elseif attached {ET_UNIQUE_ATTRIBUTE} a_feature as l_unique_attribute and then l_unique_attribute.is_implicitly_static then
					-- OK
				elseif attached {ET_EXTERNAL_ROUTINE} a_feature as l_external_routine and then l_external_routine.is_implicitly_static then
					-- OK
				else
					set_fatal_error
					error_handler.report_vuno5a_error (current_class, current_class_impl, a_call.type, a_class)
				end
			end
		end

	check_strip_expression_validity (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
							-- Note that we need to check the interface of `current_class' again.
							-- It's already done in `check_feature_validity'.
						if attached current_class.named_query (l_name) as l_query then
							if not l_query.is_attribute then
								set_fatal_error
								error_handler.report_vwst1b_error (current_class, l_name, l_query)
							else
								l_seed := l_query.first_seed
								l_name.set_seed (l_seed)
								had_error := False
								already_checked := True
							end
						elseif attached current_class.named_procedure (l_name) as l_procedure then
							set_fatal_error
							error_handler.report_vwst1b_error (current_class, l_name, l_procedure)
						else
							set_fatal_error
							error_handler.report_vwst1a_error (current_class, l_name)
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
						-- Note that we need to check the interface of `current_class' again.
						-- It's already done in `check_feature_validity'.
					if not attached current_class.seeded_query (l_seed) as l_query then
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
				i := i + 1
			end
			if not has_fatal_error then
				report_strip_expression (an_expression, current_system.array_detachable_any_type, a_context)
				a_context.force_last (current_system.array_detachable_any_type)
			end
		end

	check_true_constant_validity (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_underscored_integer_constant_validity (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_underscored_real_constant_validity (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_unqualified_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_seed: INTEGER
			l_checked: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
			l_seed := l_name.seed
			if attached {ET_IDENTIFIER} l_name as l_identifier then
				if l_identifier.is_argument then
					check_unqualified_formal_argument_call_expression_validity (a_call, l_identifier, a_context)
					l_checked := True
				elseif l_identifier.is_local then
					check_unqualified_local_variable_call_expression_validity (a_call, l_identifier, a_context)
					l_checked := True
				elseif l_identifier.is_iteration_item then
					check_unqualified_iteration_item_call_expression_validity (a_call, l_identifier, a_context)
					l_checked := True
				elseif l_identifier.is_object_test_local then
					check_unqualified_object_test_local_call_expression_validity (a_call, l_identifier, a_context)
					l_checked := True
				end
			end
			if l_checked then
				-- Do nothing.
			elseif l_seed = 0 then
					-- We need to resolve `l_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `l_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				elseif attached current_class.named_query (l_name) as l_query then
						-- Note that we need to check the interface of `current_class' again.
						-- It's already done in `check_feature_validity'.
					l_seed := l_query.first_seed
					l_name.set_seed (l_seed)
						-- Check for parenthesis alias.
					check_query_parenthesis_call_validity (a_call, l_query, current_class, a_context, Void)
					if has_fatal_error then
						-- Do nothing.
					elseif attached a_call.parenthesis_call as l_parenthesis_call then
						a_call.set_index (l_parenthesis_call.index)
					else
						check_unqualified_query_call_expression_validity (a_call, l_query, a_context)
					end
				elseif attached current_class.named_procedure (l_name) as l_procedure then
						-- In a call expression, the feature has to be a query.
					set_fatal_error
					error_handler.report_vkcn2c_error (current_class, l_name, l_procedure)
					check_orphan_actual_arguments_validity (a_call)
				else
					set_fatal_error
						-- ISE Eiffel 5.4 reports this error as a VEEN,
						-- but it is in fact a VUEX-1 (ETL2 p.368).
					error_handler.report_vuex1a_error (current_class, l_name)
					check_orphan_actual_arguments_validity (a_call)
				end
			elseif attached current_class.seeded_query (l_seed) as l_query then
					-- Note that we don't need to check the interface of `current_class' again
					-- before calling `seeded_query'. It's already done in `check_feature_validity'.
				check_unqualified_query_call_expression_validity (a_call, l_query, a_context)
			else
					-- Report internal error: the seed was already computed in a proper
					-- ancestor (or in another generic derivation) of `current_class'
					-- where this instruction was written. So there should be
					-- a query for this seed.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			end
		end

	check_unqualified_formal_argument_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be a formal argument.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_argument: a_name.is_argument
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if a_call.arguments = Void then
				check_formal_argument_validity (a_name, a_context)
			elseif current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				check_formal_argument_parenthesis_call_validity (a_call, a_name, a_context)
				if has_fatal_error then
					-- Do nothing.
				elseif attached a_call.parenthesis_call as l_parenthesis_call then
					a_call.set_index (l_parenthesis_call.index)
				else
						-- Syntax error: a formal argument cannot have arguments.
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuaa0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuaa0a_error (current_class, a_name, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have arguments.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_iteration_item_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be an iteration item.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_iteration_item: a_name.is_iteration_item
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if a_call.arguments = Void then
				check_iteration_item_validity (a_name, a_context)
			elseif current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				check_iteration_item_parenthesis_call_validity (a_call, a_name, a_context)
				if has_fatal_error then
					-- Do nothing.
				elseif attached a_call.parenthesis_call as l_parenthesis_call then
					a_call.set_index (l_parenthesis_call.index)
				else
						-- Syntax error: an across cursor cannot have arguments.
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuac0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuac0a_error (current_class, a_name, current_feature_impl.as_feature)
					elseif current_feature_impl.is_invariants then
						error_handler.report_gvuac0c_error (current_class, a_name, current_feature_impl.as_invariants)
					else
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_local_variable_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be a local variable.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_local: a_name.is_local
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if a_call.arguments = Void then
				check_local_variable_validity (a_name, a_context)
			elseif current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				check_local_variable_parenthesis_call_validity (a_call, a_name, a_context)
				if has_fatal_error then
					-- Do nothing.
				elseif attached a_call.parenthesis_call as l_parenthesis_call then
					a_call.set_index (l_parenthesis_call.index)
				else
						-- Syntax error: a local variable cannot have arguments.
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvual0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvual0a_error (current_class, a_name, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have local variables.
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_object_test_local_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call `a_call' whose
			-- name `a_name' appears to be an object-test local.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_name_not_void: a_name /= Void
			is_object_test_local: a_name.is_object_test_local
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			if a_call.arguments = Void then
				check_object_test_local_validity (a_name, a_context)
			elseif current_class_impl /= current_class then
				set_fatal_error
				if not has_implementation_error (current_feature_impl) then
						-- Internal error: `a_name' should have been resolved in
						-- the implementation feature.
					error_handler.report_giaaa_error
				end
				check_orphan_actual_arguments_validity (a_call)
			else
				check_object_test_local_parenthesis_call_validity (a_call, a_name, a_context)
				if has_fatal_error then
					-- Do nothing.
				elseif attached a_call.parenthesis_call as l_parenthesis_call then
					a_call.set_index (l_parenthesis_call.index)
				else
						-- Syntax error: an object-test local cannot have arguments.
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_gvuao0b_error (current_class, a_name, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_gvuao0a_error (current_class, a_name, current_feature_impl.as_feature)
					elseif current_feature_impl.is_invariants then
						error_handler.report_gvuao0c_error (current_class, a_name, current_feature_impl.as_invariants)
					else
						error_handler.report_giaaa_error
					end
					check_orphan_actual_arguments_validity (a_call)
				end
			end
		end

	check_unqualified_query_call_expression_validity (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call `a_call' to feature `a_query'.
			-- `a_context' represents the type in which `a_call' appears.
			-- It will be altered on exit to represent the type of `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			l_name := a_call.name
			if in_static_feature and then not a_query.is_static then
					-- Error: we cannot have an unqualified call to
					-- non-static feature in a static feature.
				set_fatal_error
				error_handler.report_vucr0d_error (current_class, current_class_impl, l_name, a_query)
				l_had_error := True
			end
				-- Check that all features which are called in a precondition of `a_query'
				-- are exported to every class to which `a_query' is exported.
			check_unqualified_vape_validity (l_name, a_query)
			l_had_error := l_had_error or has_fatal_error
				-- Check the validity of the arguments of the call.
			check_actual_arguments_validity (a_call, a_context, a_query, Void, Void)
			reset_fatal_error (l_had_error or has_fatal_error)
			if not has_fatal_error then
				report_unqualified_call_expression (a_call, a_query)
				l_had_error := has_fatal_error
					-- Update `a_context' so that it represents the type of `a_call'.
				check_query_call_type_validity (a_call, a_query, a_context)
				if current_system.attachment_type_conformance_mode then
					if not a_context.is_type_attached then
						if attached {ET_IDENTIFIER} l_name as l_identifier and then a_query.is_stable_attribute and then current_attachment_scope.has_attribute (l_identifier) then
								-- Even though this attribute has not been declared as attached,
								-- we can guarantee that at this stage this entity is attached.
							a_context.force_last (tokens.attached_like_current)
						end
					end
				end
				reset_fatal_error (l_had_error or has_fatal_error)
			end
		end

	check_verbatim_string_validity (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT)
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

	check_void_validity (an_expression: ET_VOID; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			has_fatal_error := False
			a_context.force_last (current_system.detachable_none_type)
			report_void_constant (an_expression)
		end

	check_writable_validity (a_writable: ET_WRITABLE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `a_writable' in `current_feature' of `current_class'.
			-- Set `has_fatal_error' is a fatal error occurred. Otherwise
			-- the type of `a_writable' is appended to `a_context', possibly followed
			-- by an attachment mark indicator.
		require
			a_writable_not_void: a_writable /= Void
			a_context_not_void: a_context /= Void
		local
			l_local: ET_LOCAL_VARIABLE
			l_seed: INTEGER
			l_type: detachable ET_TYPE
		do
			has_fatal_error := False
			if attached {ET_RESULT} a_writable as l_result then
					-- Use type of implementation feature because the types of the signature
					-- of `current_feature' might not have been resolved for `current_class'
					-- (when processing precursors in the context of current class).
				l_type := current_closure_impl.type
				if l_type = Void then
					set_fatal_error
					if current_class_impl = current_class then
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_veen2g_error (current_class, l_result, l_current_inline_agent)
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
					a_context.force_last (l_type)
					if current_system.attachment_type_conformance_mode then
						if not a_context.is_type_detachable and not a_context.is_type_expanded then
							if system_processor.is_ise then
									-- In ISE Eiffel, local variables (including 'Result') are considered
									-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								a_context.force_last (tokens.detachable_like_current)
							end
						end
					end
					report_result_assignment_target (l_result)
				end
			elseif attached {ET_IDENTIFIER} a_writable as l_identifier then
				l_seed := l_identifier.seed
				if l_identifier.is_local then
					if not attached current_closure_impl.locals as l_locals then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					elseif l_seed < 1 or l_seed > l_locals.count then
							-- Internal error.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						l_local := l_locals.local_variable (l_seed)
						l_type := l_local.type
						a_context.force_last (l_type)
						if current_system.attachment_type_conformance_mode then
							if not a_context.is_type_detachable and not a_context.is_type_expanded then
								if system_processor.is_ise then
										-- In ISE Eiffel, local variables (including 'Result') are considered
										-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
									a_context.force_last (tokens.detachable_like_current)
								end
							end
						end
						report_local_assignment_target (l_identifier, l_local)
					end
				elseif l_identifier.is_argument then
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_vjaw0c_error (current_class, l_identifier, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_vjaw0b_error (current_class, l_identifier, current_feature_impl.as_feature)
					else
						-- Internal error: invariants don't have writables.
						error_handler.report_giaaa_error
					end
				elseif not l_identifier.is_feature_name then
					set_fatal_error
					if attached current_inline_agent as l_current_inline_agent then
						error_handler.report_veen0b_error (current_class, l_identifier, l_current_inline_agent)
					elseif current_feature_impl.is_feature then
						error_handler.report_veen0a_error (current_class, l_identifier, current_feature_impl.as_feature)
					else
							-- Internal error: invariants don't have writables.
						error_handler.report_giaaa_error
					end
				elseif l_seed /= 0 then
					if not attached current_class.seeded_query (l_seed) as l_attribute then
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
						if in_static_feature then
								-- Error: attributes cannot be used in static features.
							set_fatal_error
							error_handler.report_vucr0c_error (current_class, current_class_impl, l_identifier, l_attribute)
						else
							report_attribute_assignment_target (a_writable, l_attribute)
						end
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
					elseif attached current_class.named_query (l_identifier) as l_attribute then
							-- Note that we need to check the interface of `current_class' again.
							-- It's already done in `check_feature_validity'
						if l_attribute.is_attribute then
							l_seed := l_attribute.first_seed
							l_identifier.set_seed (l_seed)
							l_type := l_attribute.type
							a_context.force_last (l_type)
							if in_static_feature then
									-- Error: attributes cannot be used in static features.
								set_fatal_error
								error_handler.report_vucr0c_error (current_class, current_class_impl, l_identifier, l_attribute)
							else
								report_attribute_assignment_target (a_writable, l_attribute)
							end
						else
								-- There is a feature with that name, but it
								-- it is not an attribute.
							set_fatal_error
							error_handler.report_vjaw0a_error (current_class, l_identifier, l_attribute)
						end
					elseif attached current_class.named_procedure (l_identifier) as l_procedure then
							-- There is a feature with that name, but it
							-- it is not an attribute.
						set_fatal_error
						error_handler.report_vjaw0a_error (current_class, l_identifier, l_procedure)
					else
						set_fatal_error
						if attached current_inline_agent as l_current_inline_agent then
							error_handler.report_veen0b_error (current_class, l_identifier, l_current_inline_agent)
						elseif current_feature_impl.is_feature then
							error_handler.report_veen0a_error (current_class, l_identifier, current_feature_impl.as_feature)
						else
								-- Internal error: invariants don't have writables.
							error_handler.report_giaaa_error
						end
					end
				end
			else
					-- Internal error: a Writable is either a result or an identifier.
				set_fatal_error
				error_handler.report_giaaa_error
			end
			if not has_fatal_error then
				report_expression_supplier (a_context, current_class, current_feature)
			end
		ensure
			type_appended_to_context: not has_fatal_error implies (a_context.count = old (a_context.count) + 1 or a_context.count = old (a_context.count) + 2)
			attachment_mark_appended_to_context: (a_context.count = old (a_context.count) + 2) implies a_context.last.is_like_current
		end

	check_expression_validity (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT)
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
		do
			has_fatal_error := False
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_context := current_context
			current_context := a_context
			an_expression.process (Current)
			if not has_fatal_error then
				report_expression_supplier (a_context, current_class, current_feature)
			end
			current_context := old_context
			current_target_type := old_target_type
		end

	check_actual_argument_validity (a_actual: ET_EXPRESSION; a_actual_context, a_formal_context: ET_NESTED_TYPE_CONTEXT; a_call: ET_CALL_WITH_ACTUAL_ARGUMENTS; a_class: detachable ET_CLASS)
			-- Check validity of actual argument `a_actual' of `a_call'.
			-- `a_actual_context' is the context in which `a_actual' is viewed.
			-- `a_formal_context' represents the type of the corresponding formal argument.
			-- `a_class' is the base class of the target of the call, or void in case of an unqualified call.
			-- The type of `a_actual' will appended to `a_actual_context'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_actual_not_void: a_actual /= Void
			a_actual_context_not_void: a_actual_context /= Void
			a_formal_context_not_void: a_formal_context /= Void
			a_call_not_void: a_call /= Void
		local
			l_target: ET_EXPRESSION
			l_name: ET_CALL_NAME
			l_old_object_test_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_scope_changed: BOOLEAN
			l_had_error: BOOLEAN
		do
				-- Make sure that the scope of object-test locals are handled
				-- correctly for infix expressions with a boolean operator
				-- between two boolean expressions. The right-hand-side of
				-- the infix expression might be part of an object-test local
				-- appearing in the left-hand-side.
			if a_class = Void or else not a_class.is_boolean_class then
				-- Do nothing.
			elseif not attached {ET_INFIX_EXPRESSION} a_call as l_infix_expression or else not l_infix_expression.is_boolean_operator then
				-- Do nothing.
			else
				l_name := a_call.name
				if l_name.is_infix_and_then or l_name.is_infix_and_then_symbol or l_name.is_infix_implies or l_name.is_infix_implies_symbol then
					l_target := l_infix_expression.left
					l_old_object_test_scope := current_object_test_scope.count
					object_test_scope_builder.build_scope (l_target, current_object_test_scope, current_class_impl)
					l_had_error := object_test_scope_builder.has_fatal_error
					l_old_attachment_scope := current_attachment_scope
					if current_system.attachment_type_conformance_mode then
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_old_attachment_scope)
						attachment_scope_builder.build_scope (l_target, current_attachment_scope)
					end
					l_scope_changed := True
				elseif l_name.is_infix_or_else or l_name.is_infix_or_else_symbol then
					l_target := l_infix_expression.left
					l_old_object_test_scope := current_object_test_scope.count
					object_test_scope_builder.build_negated_scope (l_target, current_object_test_scope, current_class_impl)
					l_had_error := object_test_scope_builder.has_fatal_error
					l_old_attachment_scope := current_attachment_scope
					if current_system.attachment_type_conformance_mode then
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_old_attachment_scope)
						attachment_scope_builder.build_negated_scope (l_target, current_attachment_scope)
					end
					l_scope_changed := True
				end
			end
			check_expression_validity (a_actual, a_actual_context, a_formal_context)
			has_fatal_error := l_had_error or has_fatal_error
			if l_scope_changed then
				current_object_test_scope.keep_object_tests (l_old_object_test_scope)
				if l_old_attachment_scope /= Void then
					free_attachment_scope (current_attachment_scope)
					current_attachment_scope := l_old_attachment_scope
				end
			end
		end

	check_actual_arguments_validity (a_call: ET_CALL_WITH_ACTUAL_ARGUMENTS; a_context: ET_NESTED_TYPE_CONTEXT; a_feature: ET_FEATURE; a_class: detachable ET_CLASS; a_call_info: detachable like new_call_info)
			-- Check actual arguments validity of `a_call' when calling `a_feature'
			-- in context of its target `a_context'. `a_class' is the base class of the
			-- target, or void in case of an unqualified call.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called, its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_context_not_void: a_context /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_actuals: detachable ET_ACTUAL_ARGUMENTS
			l_name: ET_CALL_NAME
			l_actual: ET_EXPRESSION
			l_actual_list: detachable ET_ACTUAL_ARGUMENT_LIST
			l_formals: detachable ET_FORMAL_ARGUMENT_LIST
			l_formal: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			l_actual_named_type: ET_NAMED_TYPE
			l_formal_named_type: ET_NAMED_TYPE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
			l_tuple_argument_position: INTEGER
			l_is_not_compatible: BOOLEAN
			l_old_target: ET_EXPRESSION
			l_class: detachable ET_CLASS
		do
			has_fatal_error := False
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_formals := a_feature.arguments
			if l_actuals = Void or else l_actuals.is_empty then
				if l_formals /= Void and then not l_formals.is_empty then
						-- The number of actual arguments is different from
						-- the number of formal arguments.
					if current_class = current_class_impl then
						if
							attached {ET_CALL_WITH_ACTUAL_ARGUMENT_LIST} a_call as l_call and then
							not attached {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST} l_call.arguments and then
							tuple_argument_position (l_formals, a_context) = 1
						then
							l_call.set_arguments (create {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST}.make (Void, 1, 1))
							check_actual_arguments_validity (l_call, a_context, a_feature, a_class, a_call_info)
						else
							set_fatal_error
							if a_class /= Void then
								if l_name.is_precursor then
									error_handler.report_vdpr4a_error (current_class, l_name.precursor_keyword, a_feature, a_class)
								else
									error_handler.report_vuar1a_error (current_class, l_name, a_feature, a_class)
								end
							else
								error_handler.report_vuar1b_error (current_class, l_name, a_feature)
							end
						end
					else
						set_fatal_error
						if not has_implementation_error (current_feature_impl) then
								-- Internal error: this error should have been reported when
								-- processing the implementation of `current_feature_impl' or in
								-- the feature flattener when redeclaring `a_feature' in an
								-- ancestor of `a_class' or `current_class'.
							error_handler.report_giaaa_error
						end
					end
				end
			elseif l_formals = Void or else l_formals.count /= l_actuals.count then
					-- The number of actual arguments is different from
					-- the number of formal arguments.
				if current_class = current_class_impl then
					if
						l_formals /= Void and then l_formals.count <= l_actuals.count + 1 and then
						attached {ET_CALL_WITH_ACTUAL_ARGUMENT_LIST} a_call as l_call and then
						not attached {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST} l_call.arguments and then
						attached tuple_argument_position (l_formals, a_context) as l_tuple_position and then
						l_tuple_position > 0
					then
						l_call.set_arguments (create {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST}.make (l_call.arguments, l_tuple_position, l_formals.count))
						check_actual_arguments_validity (l_call, a_context, a_feature, a_class, a_call_info)
					else
-- TODO: Under .NET, it is possible to have static prefix functions with one argument.
-- In that case the target of the prefix call is passed as argument of this function.
-- TODO: Under .NET, it is possible to have static infix functions with two arguments.
-- In that case the left and right operands of the infix call are passed as arguments
-- of this function.
						set_fatal_error
						if a_class /= Void then
							if l_name.is_precursor then
								error_handler.report_vdpr4a_error (current_class, l_name.precursor_keyword, a_feature, a_class)
							else
								error_handler.report_vuar1a_error (current_class, l_name, a_feature, a_class)
							end
						else
							error_handler.report_vuar1b_error (current_class, l_name, a_feature)
						end
					end
				else
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: this error should have been reported when
							-- processing the implementation of `current_feature_impl' or in
							-- the feature flattener when redeclaring `a_feature' in an
							-- ancestor of `a_class' or `current_class'.
						error_handler.report_giaaa_error
					end
				end
			else
				l_tuple_argument_position := -1
				l_actual_context := new_context (current_type)
				l_formal_context := a_context
				if attached {ET_ACTUAL_ARGUMENT_LIST} l_actuals as l_attached_actual_list then
					l_actual_list := l_attached_actual_list
				end
				nb := l_actuals.count
				from i := 1 until i > nb loop
					l_actual := l_actuals.actual_argument (i)
					l_formal := l_formals.formal_argument (i)
					l_formal_context.force_last (l_formal.type)
					check_actual_argument_validity (l_actual, l_actual_context, l_formal_context, a_call, a_class)
					l_is_not_compatible := False
					if has_fatal_error then
						had_error := True
					elseif l_actual_context.conforms_to_context (l_formal_context, system_processor) then
						-- Done.
					elseif current_class /= current_class_impl then
							-- Convertibility can only be resolved in the implementation class
						l_is_not_compatible := True
					elseif attached convert_expression (l_actual, l_actual_context, l_formal_context) as l_convert_expression and then not has_fatal_error then
							-- The actual type does not conform to the format type, but it converts to it.
							-- Insert the conversion feature call in the AST.
						if l_actual_list /= Void then
							if attached {ET_EXPRESSION_COMMA} l_actual_list.item (i) as l_expression_comma then
								l_expression_comma.set_expression (l_convert_expression)
							else
								l_actual_list.put (l_convert_expression, i)
							end
						elseif attached {ET_INFIX_EXPRESSION} a_call as l_infix_expression then
							l_infix_expression.set_right (l_convert_expression)
						else
							l_is_not_compatible := True
						end
					elseif has_fatal_error then
							-- Error already reported when calling `convert_expression'.
						had_error := True
					elseif attached {ET_INFIX_EXPRESSION} a_call as l_infix_expression then
						l_class := a_class
							-- Use a local variable because ISE does not support
							-- this CAP (i.e. considering `l_class' as attached
							-- after the check-instruction) for formal arguments!
						check qualified_call: l_class /= Void then end
						l_formal_context.remove_last
						l_old_target := l_infix_expression.left
						check_converted_target_infix_expression_validity (l_infix_expression, l_class, a_context, l_actual_context, a_call_info)
						l_formal_context.force_last (l_formal.type)
						if l_old_target = l_infix_expression.left then
							l_is_not_compatible := True
						end
					else
							-- Try Tuple-argument-unfolding.
						if l_tuple_argument_position < 0 and then current_class = current_class_impl then
							l_formal_context.remove_last
							l_tuple_argument_position := tuple_argument_position (l_formals, a_context)
							l_formal_context.force_last (l_formal.type)
						end
						if
							l_tuple_argument_position = i and then
							current_class = current_class_impl and then
							attached {ET_CALL_WITH_ACTUAL_ARGUMENT_LIST} a_call as l_call and then
							not attached {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST} l_call.arguments
						then
							create {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST} l_actual_list.make (l_call.arguments, l_tuple_argument_position, nb)
							l_actuals := l_actual_list
							l_call.set_arguments (l_actual_list)
								-- Reprocess this actual argument now that it has been
								-- converted to a Tuple argument.
							i := i - 1
						else
							l_is_not_compatible := True
						end
					end
					if l_is_not_compatible then
						had_error := True
						set_fatal_error
						l_actual_named_type := l_actual_context.named_type
						l_formal_named_type := l_formal_context.named_type
						if a_class /= Void then
							if l_name.is_precursor then
								error_handler.report_vdpr4b_error (current_class, current_class_impl, l_name.precursor_keyword, a_feature, a_class, i, l_actual_named_type, l_formal_named_type)
							else
								error_handler.report_vuar2a_error (current_class, current_class_impl, l_name, a_feature, a_class, i, l_actual_named_type, l_formal_named_type)
							end
						else
							error_handler.report_vuar2b_error (current_class, current_class_impl, l_name, a_feature, i, l_actual_named_type, l_formal_named_type)
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

	check_orphan_actual_arguments_validity (a_call: ET_CALL_WITH_ACTUAL_ARGUMENTS)
			-- Check validity of actual argument expressions of `a_call' when
			-- an error occurred when trying to determine the feature of the call.
			-- Keep `has_fatal_error' to True.
		require
			a_call_not_void: a_call /= Void
			has_fatal_error: has_fatal_error
		local
			l_context: ET_NESTED_TYPE_CONTEXT
			l_detachable_any_type: ET_CLASS_TYPE
			i, nb: INTEGER
		do
			if attached a_call.arguments as l_actuals and then not l_actuals.is_empty then
				l_detachable_any_type := current_system.detachable_any_type
				l_context := new_context (current_type)
				nb := l_actuals.count
				from i := 1 until i > nb loop
					check_expression_validity (l_actuals.actual_argument (i), l_context, l_detachable_any_type)
					l_context.wipe_out
					i := i + 1
				end
				free_context (l_context)
			end
			set_fatal_error
		ensure
			still_has_fatal_error: has_fatal_error
		end

feature {NONE} -- VAPE validity

	check_qualified_vape_validity (a_name: ET_CALL_NAME; a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Check VAPE validity rule when there is a qualified call to `a_feature'
			-- named `a_name' in a precondition of `current_feature' in `current_class'.
			-- `a_class' is the base class of the type of target of the qualified call.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature `f' should be exported to every class to which `f' is exported.
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
		local
			l_non_descendant_clients: ET_CLIENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_non_descendant_clients := vape_non_descendant_clients
				l_non_descendant_clients.wipe_out
				add_non_descendant_caller_clients_to (current_feature.clients, a_feature.clients, l_non_descendant_clients)
				nb := l_non_descendant_clients.count
				from i := 1 until i > nb loop
					set_fatal_error
					error_handler.report_vape1b_error (current_class, current_class_impl, a_name, a_feature, a_class, current_feature.as_feature, l_non_descendant_clients.client (i))
					i := i + 1
				end
				l_non_descendant_clients.wipe_out
			end
		end

	check_unqualified_vape_validity (a_name: ET_CALL_NAME; a_feature: ET_FEATURE)
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
			l_non_descendant_clients: ET_CLIENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_non_descendant_clients := vape_non_descendant_clients
				l_non_descendant_clients.wipe_out
				add_non_descendant_caller_clients_to (current_feature.clients, a_feature.clients, l_non_descendant_clients)
				nb := l_non_descendant_clients.count
				from i := 1 until i > nb loop
					set_fatal_error
					error_handler.report_vape1a_error (current_class, current_class_impl, a_name, a_feature, current_feature.as_feature, l_non_descendant_clients.client (i))
					i := i + 1
				end
				l_non_descendant_clients.wipe_out
			end
		end

	check_creation_vape_validity (a_name: ET_CALL_NAME; a_procedure: ET_PROCEDURE; a_class: ET_CLASS)
			-- Check VAPE validity rule when there is a creation with creation procedure `a_procedure'
			-- named `a_name' in a precondition of `current_feature' in `current_class'.
			-- `a_class' is the base class of the creation type.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature `f' should be exported to every class to which `f' is exported.
		require
			a_name_not_void: a_name /= Void
			a_procedure_not_void: a_procedure /= Void
			a_class_not_void: a_class /= Void
		local
			l_creation_clients: ET_CLIENT_LIST
			l_non_descendant_clients: ET_CLIENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_creation_clients := vape_creation_clients
				l_creation_clients.wipe_out
				a_procedure.add_creation_clients_to (l_creation_clients, a_class, system_processor)
				l_non_descendant_clients := vape_non_descendant_clients
				l_non_descendant_clients.wipe_out
				add_non_descendant_caller_clients_to (current_feature.clients, l_creation_clients, l_non_descendant_clients)
				l_creation_clients.wipe_out
				nb := l_non_descendant_clients.count
				from i := 1 until i > nb loop
					set_fatal_error
					error_handler.report_vape2a_error (current_class, current_class_impl, a_name, a_procedure, a_class, current_feature.as_feature, l_non_descendant_clients.client (i))
					i := i + 1
				end
				l_non_descendant_clients.wipe_out
			end
		end

	check_formal_parameter_creation_vape_validity (a_name: ET_CALL_NAME; a_procedure: ET_PROCEDURE; a_formal_parameter: ET_FORMAL_PARAMETER)
			-- Check VAPE validity rule when there is a creation with creation procedure `a_procedure'
			-- named `a_name' in a precondition of `current_feature' in `current_class'.
			-- The creation type is the formal generic parameter `a_formal_parameter'.
			-- The only thing we know about `a_procedure' in this case is that it is
			-- exported for creation to `current_class' (see DGCR-1, ECMA 367-2, section
			-- 8.12.12, page 81, 'Generic-creation-ready type').
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature `f' should be exported to every class to which `f' is exported.
		require
			a_name_not_void: a_name /= Void
			a_procedure_not_void: a_procedure /= Void
			a_formal_parameter_not_void: a_formal_parameter /= Void
		local
			l_creation_clients: ET_CLIENT_LIST
			l_client: ET_CLIENT
			l_non_descendant_clients: ET_CLIENT_LIST
			i, nb: INTEGER
		do
			has_fatal_error := False
			if in_precondition and then current_feature.is_feature then
					-- VAPE validity rule only applies to preconditions.
				l_creation_clients := vape_creation_clients
				l_creation_clients.wipe_out
				l_client := vape_client
				l_client.reset (current_class.name, current_class)
				l_creation_clients.force_first (l_client)
				l_non_descendant_clients := vape_non_descendant_clients
				l_non_descendant_clients.wipe_out
				add_non_descendant_caller_clients_to (current_feature.clients, l_creation_clients, l_non_descendant_clients)
				l_creation_clients.wipe_out
				l_client.reset (tokens.unknown_class.name, tokens.unknown_class)
				nb := l_non_descendant_clients.count
				from i := 1 until i > nb loop
					set_fatal_error
					error_handler.report_vape2b_error (current_class, current_class_impl, a_name, a_procedure, a_formal_parameter, current_feature.as_feature, l_non_descendant_clients.client (i))
					i := i + 1
				end
				l_non_descendant_clients.wipe_out
			end
		end

	add_non_descendant_caller_clients_to (a_caller_clients, a_callee_clients, a_non_descendant_clients: ET_CLIENT_LIST)
			-- Add to `a_non_descendant_clients' the clients in `a_caller_clients'
			-- which are not descendants of any of the clients in `a_callee_clients'.
			--
			-- The validity rule VAPE says that all features which are called in a precondition
			-- of a feature 'f' should be exported to every class to which 'f' is exported.
			-- So typically `a_caller_clients' will the clients to which 'f' is_exported,
			-- and `a_callee_clients' will be the clients to which a given feature called
			-- from in a precondition of 'f' are exported.
		require
			a_caller_clients: a_caller_clients /= Void
			a_callee_clients_not_void: a_callee_clients /= Void
			a_non_descendant_clients_not_void: a_non_descendant_clients /= Void
		local
			l_caller_client: ET_CLIENT
			l_caller_client_class: ET_CLASS
			i, nb: INTEGER
			l_callee_clients_is_none_or_unknown: BOOLEAN
		do
			l_callee_clients_is_none_or_unknown := a_callee_clients.is_none_or_unknown
			nb := a_caller_clients.count
			from i := nb until i < 1 loop
				l_caller_client := a_caller_clients.client (i)
				l_caller_client_class := l_caller_client.base_class
				if l_caller_client_class.is_none then
					-- "NONE" is a descendant of all classes.
				elseif l_caller_client_class.is_unknown then
					-- ISE considers client classes which are not known in the
					-- current universe as if they were "NONE".
				elseif a_callee_clients.has_descendant (l_caller_client_class, system_processor) then
					-- The callee is exported to `l_caller_client'.
				elseif not l_caller_client_class.is_parsed and then not l_callee_clients_is_none_or_unknown then
					-- ISE considers that if the client class is known in the current universe
					-- but is not compiled in the system (i.e. we don't know its ancestors),
					-- then we consider any other class known in the current universe
					-- as being one of its ancestors.
				elseif l_caller_client_class.has_ancestors_error then
					-- Another error has already reported.
				else
					a_non_descendant_clients.force_first (l_caller_client)
				end
				i := i - 1
			end
		end

	vape_non_descendant_clients: ET_CLIENT_LIST
			-- List of clients used to determine VAPE validity errors

	vape_creation_clients: ET_CLIENT_LIST
			-- List of clients used to determine VAPE validity errors

	vape_client: ET_CLIENT
			-- Client used to determine VAPE validity errors

feature {NONE} -- Parenthesis call validity

	check_formal_argument_parenthesis_call_validity (a_call: ET_FEATURE_CALL; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether `a_call', whose name `a_name' appears to be a formal argument,
			-- is in fact a parenthesis call.
			-- For example, if `a_name' is 'foo' and `a_call' is 'foo (args)', a parenthesis
			-- call will be 'foo.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- `a_context' represents the type in which `a_call' appears.
			-- If `a_call' is a parenthesis call, it will be altered on exit
			-- to represent the type of `a_call'. Otherwise, it will be
			-- altered on exit to represent the type of the formal argument.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_name_not_void: a_name /= Void
			is_argument: a_name.is_argument
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			has_fatal_error := False
			if not attached {ET_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				-- Do nothing.
			elseif not attached l_regular_call.arguments as l_actuals or else l_actuals.is_empty then
				-- Do nothing.
			else
				check_formal_argument_validity (a_name, a_context)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					check_identifier_parenthesis_call_validity (l_regular_call, a_name, l_actuals, a_context)
				end
			end
		end

	check_identifier_parenthesis_call_validity (a_call: ET_REGULAR_FEATURE_CALL; a_name: ET_IDENTIFIER; a_actuals: ET_ACTUAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether `a_call', whose name `a_name' might be a formal argument, a local
			-- variable, an across cursor or an object-test local, is in fact a parenthesis call.
			-- For example, if `a_name' is 'foo' and `a_call' is 'foo (args)', a parenthesis
			-- call will be 'foo.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- The validity of `a_name' is assumed to have already been checked.
			--
			-- `a_actuals' are the arguments of `a_call'. There must be at least one argument
			-- because features of the form 'g alias "()"' should have at least one formal
			-- argument.
			--
			-- `a_context' represents the type of `a_name'.
			-- If `a_call' is a parenthesis call, it will be altered on exit
			-- to represent the type of `a_call'.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_actuals_not_void: a_actuals /= Void
			a_actuals_not_empty: not a_actuals.is_empty
			a_actuals_definition: a_actuals = a_call.arguments
			a_name_not_void: a_name /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_base_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_parenthesis: ET_PARENTHESIS_SYMBOL
		do
			has_fatal_error := False
			create l_parenthesis.make
			set_parenthesis_call_position (l_parenthesis, a_actuals)
			l_adapted_base_classes := new_adapted_base_classes
			a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
			l_has_multiple_constraints := l_adapted_base_classes.count > 1
			check_adapted_base_classes_validity (l_parenthesis, l_adapted_base_classes, a_context)
			l_adapted_base_class := l_adapted_base_classes.first
			free_adapted_base_classes (l_adapted_base_classes)
			if has_fatal_error then
				check_orphan_actual_arguments_validity (a_call)
			else
				l_base_class := l_adapted_base_class.base_class
					-- Look for a feature with 'alias "()"' in `l_adapted_base_class'.
				l_base_class.process (system_processor.interface_checker)
				if not l_base_class.interface_checked_successfully then
					set_fatal_error
					check_orphan_actual_arguments_validity (a_call)
				elseif attached l_adapted_base_class.named_feature (l_parenthesis) as l_unfolded_feature then
						-- Build the unfolded parenthesis call.
					l_parenthesis.set_seed (l_unfolded_feature.first_seed)
					a_call.set_parenthesis_call (a_name, l_parenthesis, a_actuals)
					adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					if attached {ET_PARENTHESIS_INSTRUCTION} a_call.parenthesis_call as l_parenthesis_call_instruction then
						check_qualified_feature_call_instruction_validity (l_parenthesis_call_instruction, l_unfolded_feature, l_base_class, a_context)
					elseif attached {ET_PARENTHESIS_EXPRESSION} a_call.parenthesis_call as l_parenthesis_call_expression then
						check_qualified_feature_call_expression_validity (l_parenthesis_call_expression, l_unfolded_feature, l_base_class, a_context, Void)
					else
							-- The parenthesis call is either an instruction or an expression.
							-- Check the validity of the arguments of the call despite the error.
						set_fatal_error
						error_handler.report_giaaa_error
						check_orphan_actual_arguments_validity (a_call)
					end
				end
			end
		end

	check_iteration_item_parenthesis_call_validity (a_call: ET_FEATURE_CALL; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether `a_call', whose name `a_name' appears to be an iteration item,
			-- is in fact a parenthesis call.
			-- For example, if `a_name' is 'foo' and `a_call' is 'foo (args)', a parenthesis
			-- call will be 'foo.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- `a_context' represents the type in which `a_call' appears.
			-- If `a_call' is a parenthesis call, it will be altered on exit
			-- to represent the type of `a_call'. Otherwise, it will be
			-- altered on exit to represent the type of the iteration item.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_name_not_void: a_name /= Void
			is_iteration_item: a_name.is_iteration_item
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			has_fatal_error := False
			if not attached {ET_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				-- Do nothing.
			elseif not attached l_regular_call.arguments as l_actuals or else l_actuals.is_empty then
				-- Do nothing.
			else
				check_iteration_item_validity (a_name, a_context)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					check_identifier_parenthesis_call_validity (l_regular_call, a_name, l_actuals, a_context)
				end
			end
		end

	check_query_parenthesis_call_validity (a_call: ET_FEATURE_CALL; a_query: ET_QUERY; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check whether the call `a_call' to feature `a_query' is in fact a parenthesis call.
			-- For example, if `a_query' is 'f' and `a_call' is 'f (args)', a parenthesis call
			-- will be 'f.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- The validity of the target of `a_call' is assumed to have already been checked.
			-- `a_class' is the base class of the target of the `a_call'.
			--
			-- `a_context' represents the type of the target of `a_call'.
			-- If `a_call' is a parenthesis call, it will be altered
			-- on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called (when it's a query), its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_actuals: detachable ET_ACTUAL_ARGUMENT_LIST
			l_base_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_parenthesis: ET_PARENTHESIS_SYMBOL
			l_qualified_unfolded_target: ET_QUALIFIED_CALL_EXPRESSION
			l_unqualified_unfolded_target: ET_UNQUALIFIED_CALL_EXPRESSION
		do
			has_fatal_error := False
			if attached {ET_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				l_actuals := l_regular_call.arguments
				if a_query.arguments_count = 0 and (l_actuals /= Void and then l_actuals.count > 0) then
					create l_parenthesis.make
					set_parenthesis_call_position (l_parenthesis, l_actuals)
					a_context.force_last (a_query.type)
					l_adapted_base_classes := new_adapted_base_classes
					a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
					l_has_multiple_constraints := l_adapted_base_classes.count > 1
					check_adapted_base_classes_validity (l_parenthesis, l_adapted_base_classes, a_context)
					l_adapted_base_class := l_adapted_base_classes.first
					free_adapted_base_classes (l_adapted_base_classes)
					a_context.remove_last
					if has_fatal_error then
						check_orphan_actual_arguments_validity (a_call)
					else
						l_base_class := l_adapted_base_class.base_class
							-- Look for a feature with 'alias "()"' in `l_adapted_base_class'.
						l_base_class.process (system_processor.interface_checker)
						if not l_base_class.interface_checked_successfully then
							set_fatal_error
							check_orphan_actual_arguments_validity (a_call)
						elseif attached l_adapted_base_class.named_feature (l_parenthesis) as l_unfolded_feature then
								-- Build the unfolded parenthesis call.
							l_parenthesis.set_seed (l_unfolded_feature.first_seed)
							if attached l_regular_call.target as l_target then
								create l_qualified_unfolded_target.make (l_target, l_regular_call.name, Void)
								l_regular_call.set_parenthesis_call (l_qualified_unfolded_target, l_parenthesis, l_actuals)
								check_qualified_query_call_expression_validity (l_qualified_unfolded_target, a_query, a_class, a_context, Void)
							else
								create l_unqualified_unfolded_target.make (l_regular_call.name, Void)
								l_regular_call.set_parenthesis_call (l_unqualified_unfolded_target, l_parenthesis, l_actuals)
								check_unqualified_query_call_expression_validity (l_unqualified_unfolded_target, a_query, a_context)
							end
							adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
							if has_fatal_error then
								check_orphan_actual_arguments_validity (a_call)
							elseif attached {ET_PARENTHESIS_INSTRUCTION} l_regular_call.parenthesis_call as l_parenthesis_call_instruction then
								check_qualified_feature_call_instruction_validity (l_parenthesis_call_instruction, l_unfolded_feature, l_base_class, a_context)
							elseif attached {ET_PARENTHESIS_EXPRESSION} l_regular_call.parenthesis_call as l_parenthesis_call_expression then
								check_qualified_feature_call_expression_validity (l_parenthesis_call_expression, l_unfolded_feature, l_base_class, a_context, a_call_info)
							else
									-- The parenthesis call is either an instruction or an expression.
								set_fatal_error
								error_handler.report_giaaa_error
								check_orphan_actual_arguments_validity (a_call)
							end
						end
					end
				end
			end
		end

	check_local_variable_parenthesis_call_validity (a_call: ET_FEATURE_CALL; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether `a_call', whose name `a_name' appears to be a local variable,
			-- is in fact a parenthesis call.
			-- For example, if `a_name' is 'foo' and `a_call' is 'foo (args)', a parenthesis
			-- call will be 'foo.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- `a_context' represents the type in which `a_call' appears.
			-- If `a_call' is a parenthesis call, it will be altered on exit
			-- to represent the type of `a_call'. Otherwise, it will be
			-- altered on exit to represent the type of the local variable.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_name_not_void: a_name /= Void
			is_local: a_name.is_local
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			has_fatal_error := False
			if not attached {ET_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				-- Do nothing.
			elseif not attached l_regular_call.arguments as l_actuals or else l_actuals.is_empty then
				-- Do nothing.
			else
				check_local_variable_validity (a_name, a_context)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					check_identifier_parenthesis_call_validity (l_regular_call, a_name, l_actuals, a_context)
				end
			end
		end

	check_object_test_local_parenthesis_call_validity (a_call: ET_FEATURE_CALL; a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether `a_call', whose name `a_name' appears to be an object-test local,
			-- is in fact a parenthesis call.
			-- For example, if `a_name' is 'foo' and `a_call' is 'foo (args)', a parenthesis
			-- call will be 'foo.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- `a_context' represents the type in which `a_call' appears.
			-- If `a_call' is a parenthesis call, it will be altered on exit
			-- to represent the type of `a_call'. Otherwise, it will be
			-- altered on exit to represent the type of the object-test local.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			unqualified_call: not a_call.is_qualified_call
			a_name_not_void: a_name /= Void
			is_object_test_local: a_name.is_object_test_local
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		do
			has_fatal_error := False
			if not attached {ET_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				-- Do nothing.
			elseif not attached l_regular_call.arguments as l_actuals or else l_actuals.is_empty then
				-- Do nothing.
			else
				check_object_test_local_validity (a_name, a_context)
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					check_identifier_parenthesis_call_validity (l_regular_call, a_name, l_actuals, a_context)
				end
			end
		end

	check_precursor_parenthesis_call_validity (a_call: ET_PRECURSOR_CALL; a_parent_query: ET_QUERY; a_parent_class: ET_CLASS; a_parent_type: ET_BASE_TYPE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether the call `a_call' is in fact a parenthesis call.
			-- For example, `a_call' is 'precursor (args)', a parenthesis call
			-- will be 'precursor.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- `a_context' represents the type in which `a_call' appears.
			-- If `a_call' is a parenthesis call, it will be altered
			-- on exit to represent the type of `a_call'.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_parent_query_not_void: a_parent_query /= Void
			a_parent_class_not_void: a_parent_class /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_actuals: detachable ET_ACTUAL_ARGUMENT_LIST
			l_base_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_parenthesis: ET_PARENTHESIS_SYMBOL
			l_unfolded_target: ET_PRECURSOR_EXPRESSION
		do
			has_fatal_error := False
			l_actuals := a_call.arguments
			if a_parent_query.arguments_count = 0 and (l_actuals /= Void and then l_actuals.count > 0) then
				create l_parenthesis.make
				set_parenthesis_call_position (l_parenthesis, l_actuals)
				a_context.force_last (a_parent_query.type)
				l_adapted_base_classes := new_adapted_base_classes
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_parenthesis, l_adapted_base_classes, a_context)
				l_adapted_base_class := l_adapted_base_classes.first
				free_adapted_base_classes (l_adapted_base_classes)
				a_context.remove_last
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					l_base_class := l_adapted_base_class.base_class
						-- Look for a feature with 'alias "()"' in `l_adapted_base_class'.
					l_base_class.process (system_processor.interface_checker)
					if not l_base_class.interface_checked_successfully then
						set_fatal_error
						check_orphan_actual_arguments_validity (a_call)
					elseif attached l_adapted_base_class.named_feature (l_parenthesis) as l_unfolded_feature then
							-- Build the unfolded parenthesis call.
						create l_unfolded_target.make (a_call.parent_name, Void)
						l_unfolded_target.set_parent_type (a_call.parent_type)
						l_unfolded_target.set_precursor_keyword (a_call.precursor_keyword)
						l_parenthesis.set_seed (l_unfolded_feature.first_seed)
						a_call.set_parenthesis_call (l_unfolded_target, l_parenthesis, l_actuals)
						check_precursor_query_expression_validity (l_unfolded_target, a_parent_query, a_parent_class, a_parent_type, a_context)
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
						if has_fatal_error then
							set_fatal_error
							check_orphan_actual_arguments_validity (a_call)
						elseif attached {ET_PARENTHESIS_INSTRUCTION} a_call.parenthesis_call as l_parenthesis_call_instruction then
							check_qualified_feature_call_instruction_validity (l_parenthesis_call_instruction, l_unfolded_feature, l_base_class, a_context)
						elseif attached {ET_PARENTHESIS_EXPRESSION} a_call.parenthesis_call as l_parenthesis_call_expression then
							check_qualified_feature_call_expression_validity (l_parenthesis_call_expression, l_unfolded_feature, l_base_class, a_context, Void)
						else
								-- The parenthesis call is either an instruction or an expression.
							set_fatal_error
							error_handler.report_giaaa_error
							check_orphan_actual_arguments_validity (a_call)
						end
					end
				end
			end
		end

	check_static_parenthesis_call_validity (a_call: ET_STATIC_FEATURE_CALL; a_query: ET_QUERY; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check whether the static call `a_call' to feature `a_query' is in fact a parenthesis call.
			-- For example, if `a_query' is 'f' and `a_call' is '{T}.f (args)', a parenthesis call
			-- will be '{T}.f.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- The validity of the static type part of `a_call' is assumed to have already been checked.
			-- `a_class' is the base class of the static type part of `a_call'.
			--
			-- `a_context' represents the static type part of `a_call'.
			-- If `a_call' is a parenthesis call, it will be altered
			-- on exit to represent the type of `a_call'.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			a_query_not_void: a_query /= Void
			a_class_not_void: a_class /= Void
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_actuals: detachable ET_ACTUAL_ARGUMENT_LIST
			l_base_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_parenthesis: ET_PARENTHESIS_SYMBOL
			l_unfolded_target: ET_STATIC_CALL_EXPRESSION
		do
			has_fatal_error := False
			l_actuals := a_call.arguments
			if a_query.arguments_count = 0 and (l_actuals /= Void and then l_actuals.count > 0) then
				create l_parenthesis.make
				set_parenthesis_call_position (l_parenthesis, l_actuals)
				a_context.force_last (a_query.type)
				l_adapted_base_classes := new_adapted_base_classes
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (l_parenthesis, l_adapted_base_classes, a_context)
				l_adapted_base_class := l_adapted_base_classes.first
				free_adapted_base_classes (l_adapted_base_classes)
				a_context.remove_last
				if has_fatal_error then
					check_orphan_actual_arguments_validity (a_call)
				else
					l_base_class := l_adapted_base_class.base_class
						-- Look for a feature with 'alias "()"' in `l_adapted_base_class'.
					l_base_class.process (system_processor.interface_checker)
					if not l_base_class.interface_checked_successfully then
						set_fatal_error
						check_orphan_actual_arguments_validity (a_call)
					elseif attached l_adapted_base_class.named_feature (l_parenthesis) as l_unfolded_feature then
							-- Build the unfolded parenthesis call.
						create l_unfolded_target.make (a_call.static_type, a_call.qualified_name, Void)
						l_parenthesis.set_seed (l_unfolded_feature.first_seed)
						a_call.set_parenthesis_call (l_unfolded_target, l_parenthesis, l_actuals)
						check_static_query_call_expression_validity (l_unfolded_target, a_query, a_class, a_context)
						adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
						if has_fatal_error then
							set_fatal_error
							check_orphan_actual_arguments_validity (a_call)
						elseif attached {ET_PARENTHESIS_INSTRUCTION} a_call.parenthesis_call as l_parenthesis_call_instruction then
							check_qualified_feature_call_instruction_validity (l_parenthesis_call_instruction, l_unfolded_feature, l_base_class, a_context)
						elseif attached {ET_PARENTHESIS_EXPRESSION} a_call.parenthesis_call as l_parenthesis_call_expression then
							check_qualified_feature_call_expression_validity (l_parenthesis_call_expression, l_unfolded_feature, l_base_class, a_context, Void)
						else
								-- The parenthesis call is either an instruction or an expression.
							set_fatal_error
							error_handler.report_giaaa_error
							check_orphan_actual_arguments_validity (a_call)
						end
					end
				end
			end
		end

	check_tuple_label_parenthesis_call_validity (a_call: ET_QUALIFIED_FEATURE_CALL; a_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT; a_call_info: detachable like new_call_info)
			-- Check whether the call `a_call' to a tuple label is in fact a parenthesis call.
			-- For example, if `a_call' is 'a_tuple.label (args)', a parenthesis call will be
			-- 'a_tuple.label.g (args)' where 'g' is declared as 'g alias "()"'.
			-- If it's indeed a parenthesis call, check its validity and set
			-- `a_call.parenthesis_call' to its unfolded form.
			--
			-- The validity of the target of `a_call' is assumed to have already been checked.
			-- `a_class' is the base class of the target of `a_call'.
			--
			-- `a_context' represents the type of the target of `a_call'.
			-- If `a_call' is a parenthesis call, it will be altered
			-- on exit to represent the type of `a_call'.
			--
			-- `a_call_info', if provided, is information requested by the caller of this routine
			-- to get information about the routine called (when it's a query), its target class and context.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
			is_tuple_label: a_call.name.is_tuple_label
			a_class_not_void: a_class /= Void
			a_class_is_tuple: a_class.is_tuple_class
			a_context_not_void: a_context /= Void
			in_implementation_class: current_class_impl = current_class
		local
			l_name: ET_CALL_NAME
			l_type: ET_TYPE
			l_seed: INTEGER
			l_actuals: detachable ET_ACTUAL_ARGUMENT_LIST
			l_base_class: ET_CLASS
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_parenthesis: ET_PARENTHESIS_SYMBOL
			l_unfolded_target: ET_QUALIFIED_CALL_EXPRESSION
		do
			has_fatal_error := False
			l_name := a_call.name
			l_seed := l_name.seed
			if l_seed > a_context.base_type_actual_count then
					-- Report internal error: the index of the labeled
					-- actual parameter cannot be out of bound because
					-- for a Tuple type to conform to another Tuple type
					-- it needs to have more actual parameters.
				set_fatal_error
				error_handler.report_giaaa_error
				check_orphan_actual_arguments_validity (a_call)
			elseif attached {ET_QUALIFIED_REGULAR_FEATURE_CALL} a_call as l_regular_call then
				l_actuals := l_regular_call.arguments
				if l_actuals /= Void and then l_actuals.count > 0 then
					create l_parenthesis.make
					set_parenthesis_call_position (l_parenthesis, l_actuals)
					l_type := a_class.formal_parameter_type (l_seed)
					a_context.force_last (l_type)
					l_adapted_base_classes := new_adapted_base_classes
					a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
					l_has_multiple_constraints := l_adapted_base_classes.count > 1
					check_adapted_base_classes_validity (l_parenthesis, l_adapted_base_classes, a_context)
					l_adapted_base_class := l_adapted_base_classes.first
					free_adapted_base_classes (l_adapted_base_classes)
					a_context.remove_last
					if has_fatal_error then
						check_orphan_actual_arguments_validity (a_call)
					else
						l_base_class := l_adapted_base_class.base_class
							-- Look for a feature with 'alias "()"' in `l_adapted_base_class'.
						l_base_class.process (system_processor.interface_checker)
						if not l_base_class.interface_checked_successfully then
							set_fatal_error
							check_orphan_actual_arguments_validity (a_call)
						elseif attached l_adapted_base_class.named_feature (l_parenthesis) as l_unfolded_feature then
								-- Build the unfolded parenthesis call.
							l_parenthesis.set_seed (l_unfolded_feature.first_seed)
							create l_unfolded_target.make (l_regular_call.target, l_regular_call.name, Void)
							l_regular_call.set_parenthesis_call (l_unfolded_target, l_parenthesis, l_actuals)
							check_qualified_tuple_label_call_expression_validity (l_unfolded_target, a_class, a_context, Void)
							adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
							if has_fatal_error then
								set_fatal_error
								check_orphan_actual_arguments_validity (a_call)
							elseif attached {ET_PARENTHESIS_INSTRUCTION} l_regular_call.parenthesis_call as l_parenthesis_call_instruction then
								check_qualified_feature_call_instruction_validity (l_parenthesis_call_instruction, l_unfolded_feature, l_base_class, a_context)
							elseif attached {ET_PARENTHESIS_EXPRESSION} l_regular_call.parenthesis_call as l_parenthesis_call_expression then
								check_qualified_feature_call_expression_validity (l_parenthesis_call_expression, l_unfolded_feature, l_base_class, a_context, a_call_info)
							else
									-- The parenthesis call is either an instruction or an expression.
								set_fatal_error
								error_handler.report_giaaa_error
								check_orphan_actual_arguments_validity (a_call)
							end
						end
					end
				end
			end
		end

	set_parenthesis_call_position (a_parenthesis: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- Set the position of `a_parenthesis' to be the same as the open parenthesis of `a_arguments',
			-- or of its first item is not set.
		require
			a_parenthesis_not_void: a_parenthesis /= Void
			a_arguments_not_void: a_arguments /= Void
			a_arguments_not_empty: a_arguments.count > 0
		local
			l_position: ET_POSITION
		do
			l_position := a_arguments.left_symbol.position
			if l_position.is_null then
				l_position := a_arguments.actual_argument (1).position
			end
			a_parenthesis.set_position (l_position.line, l_position.column)
		end

feature {NONE} -- Agent validity

	check_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_target: ET_AGENT_TARGET
		do
			if not an_expression.is_qualified_call then
				check_unqualified_call_agent_validity (an_expression, a_context)
			else
				a_target := an_expression.target
				if attached {ET_EXPRESSION} a_target as an_expression_target then
					check_qualified_call_agent_validity (an_expression, an_expression_target, a_context)
				elseif attached {ET_AGENT_OPEN_TARGET} a_target as a_type_target then
					check_typed_call_agent_validity (an_expression, a_type_target, a_context)
				else
						-- Internal error: no other kind of targets.
					set_fatal_error
					error_handler.report_giaaa_error
				end
			end
		end

	check_unqualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of unqualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			if in_static_feature then
					-- Error: we cannot use an unqualified call agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0j_error (current_class, current_class_impl, an_expression)
				l_had_error := True
			end
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
					current_class.process (system_processor.interface_checker)
					if not current_class.interface_checked_successfully then
						set_fatal_error
					elseif attached current_class.named_procedure (a_name) as l_procedure then
						a_name.set_seed (l_procedure.first_seed)
						an_expression.set_procedure (True)
						check_unqualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
						reset_fatal_error (l_had_error or has_fatal_error)
					elseif attached current_class.named_query (a_name) as l_query then
						a_name.set_seed (l_query.first_seed)
						an_expression.set_procedure (False)
						check_unqualified_query_call_agent_validity (an_expression, l_query, a_context)
						reset_fatal_error (l_had_error or has_fatal_error)
					else
						set_fatal_error
							-- ISE Eiffel 5.4 reports this error as a VEEN,
							-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
						error_handler.report_vpca1a_error (current_class, a_name)
					end
				end
			else
				current_class.process (system_processor.interface_checker)
				if not current_class.interface_checked_successfully then
					set_fatal_error
				elseif an_expression.is_procedure then
					if not attached current_class.seeded_procedure (a_seed) as l_procedure then
							-- Report internal error: if we got a seed, `l_procedure' should not be void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						check_unqualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
						reset_fatal_error (l_had_error or has_fatal_error)
					end
				else
					if not attached current_class.seeded_query (a_seed) as l_query then
							-- Report internal error: if we got a seed, `l_query' should not be void.
						set_fatal_error
						error_handler.report_giaaa_error
					else
						check_unqualified_query_call_agent_validity (an_expression, l_query, a_context)
						reset_fatal_error (l_had_error or has_fatal_error)
					end
				end
			end
		end

	check_unqualified_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT)
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
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_CLASS_TYPE
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					a_context.force_last (a_tuple_type)
					an_agent_type := current_universe_impl.predicate_identity_type
				else
					an_agent_class := current_universe_impl.function_identity_any_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_type)
					a_parameters.put_first (a_tuple_type)
					create an_agent_type.make_generic (tokens.implicit_attached_type_mark, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_unqualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_unqualified_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT)
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
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			an_agent_type: ET_CLASS_TYPE
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				elseif an_open_operands.count = 1 then
					a_context.force_last (an_open_operands.type (1))
					a_tuple_type := current_universe_impl.tuple_identity_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_context.force_last (a_tuple_type)
				an_agent_type := current_universe_impl.procedure_identity_type
				report_unqualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
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
			a_seed: INTEGER
			had_error: BOOLEAN
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_feature: detachable ET_FEATURE
			l_other_feature: detachable ET_FEATURE
			l_first_tuple_label: INTEGER
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			check_expression_validity (a_target, a_context, current_system.detachable_any_type)
			l_context_count := a_context.count
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (a_name, l_adapted_base_classes, a_context)
			end
			if has_fatal_error then
				-- Do nothing.
			elseif a_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				a_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				elseif attached l_adapted_base_class.named_procedure (a_name) as l_procedure then
					a_name.set_seed (l_procedure.first_seed)
					an_expression.set_procedure (True)
					check_qualified_vape_validity (a_name, l_procedure, a_class)
					had_error := has_fatal_error
					check_qualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
					has_fatal_error := has_fatal_error or had_error
				elseif attached a_class.named_query (a_name) as l_query then
					a_name.set_seed (l_query.first_seed)
					an_expression.set_procedure (False)
					check_qualified_vape_validity (a_name, l_query, a_class)
					had_error := has_fatal_error
					check_qualified_query_call_agent_validity (an_expression, l_query, a_context)
					has_fatal_error := has_fatal_error or had_error
				else
					if a_class.is_tuple_class and then attached {ET_IDENTIFIER} a_name as l_label then
							-- Check whether this is a tuple label.
						a_seed := l_adapted_base_class.base_type_index_of_label (l_label, a_context)
						if a_seed /= 0 then
							l_label.set_tuple_label (True)
							l_label.set_seed (a_seed)
							an_expression.set_procedure (False)
							check_qualified_tuple_label_call_agent_validity (an_expression, a_class, a_context)
						end
					end
					if a_seed = 0 then
						set_fatal_error
							-- ISE Eiffel 5.4 reports this error as a VEEN,
							-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
						error_handler.report_vpca1b_error (current_class, a_name, a_class)
					end
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- expression was written. So, if we got a seed, a feature or tuple label
					-- should exist.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					a_class := l_adapted_base_class.base_class
					adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					if a_name.is_tuple_label then
						if a_class.is_tuple_class then
							check_qualified_tuple_label_call_agent_validity (an_expression, a_class, a_context)
						elseif a_class.is_none then
-- TODO: "NONE" conforms to "TUPLE".
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Report internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif an_expression.is_procedure then
						if attached a_class.seeded_procedure (a_seed) as l_procedure then
							check_qualified_vape_validity (a_name, l_procedure, a_class)
							had_error := has_fatal_error
							check_qualified_procedure_call_agent_validity (an_expression, l_procedure, a_context)
							has_fatal_error := has_fatal_error or had_error
							l_other_feature := l_procedure
						elseif a_class.is_none then
-- TODO: "NONE" conforms to all reference types.
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Internal error: the seed was already computed in a proper ancestor
								-- (or in another generic derivation) of `current_class' where this
								-- agent was written. So, if we got a seed, there should be a
								-- procedure for this seed.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						if attached a_class.seeded_query (a_seed) as l_query then
							check_qualified_vape_validity (a_name, l_query, a_class)
							had_error := has_fatal_error
							check_qualified_query_call_agent_validity (an_expression, l_query, a_context)
							has_fatal_error := has_fatal_error or had_error
							l_other_feature := l_query
						elseif a_class.is_none then
-- TODO: "NONE" conforms to all reference types.
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Internal error: the seed was already computed in a proper ancestor
								-- (or in another generic derivation) of `current_class' where this
								-- agent was written. So, if we got a seed, there should be a
								-- query for this seed.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					elseif l_first_context /= Void and l_first_adapted_base_class /= Void then
						if not a_context.same_named_context (l_first_context) then
							set_fatal_error
							if l_first_feature /= Void and l_other_feature /= Void then
									-- Two features with the same seed and different signatures.
								error_handler.report_vgmc0g_error (current_class, current_class_impl, a_name, l_first_feature, l_first_adapted_base_class, l_other_feature, l_adapted_base_class)
							else
									-- Two Tuples with different item types at index `a_seed'.
								error_handler.report_vgmc0f_error (current_class, current_class_impl, a_name, a_seed, l_first_adapted_base_class, l_adapted_base_class)
							end
						end
					elseif nb > 1 then

						l_first_context := new_context (current_type)
						l_first_context.copy_type_context (a_context)
						l_first_adapted_base_class := l_adapted_base_class
						l_first_feature := l_other_feature
						l_first_tuple_label := a_seed
					end
					if i < nb then
						a_context.keep_first (l_context_count)
					end
					i := i + 1
				end
				if l_first_context /= Void then
					free_context (l_first_context)
				end
			end
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_qualified_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified query call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_type: ET_TYPE
			a_seed: INTEGER
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if current_system.target_type_attachment_mode then
				if not a_context.is_type_attached then
						-- Error: the target of the call is not attached.
					set_fatal_error
					error_handler.report_vuta2a_error (current_class, current_class_impl, a_name, a_query, a_context.named_type)
				end
			end
			if not a_query.is_exported_to (current_class, system_processor) then
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					a_context.force_last (a_tuple_type)
					an_agent_type := current_universe_impl.predicate_identity_type
				else
					an_agent_class := current_universe_impl.function_identity_any_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_type)
					a_parameters.put_first (a_tuple_type)
					create an_agent_type.make_generic (tokens.implicit_attached_type_mark, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_qualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified procedure call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_procedure_not_void: a_procedure /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			an_agent_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if current_system.target_type_attachment_mode then
				if not a_context.is_type_attached then
						-- Error: the target of the call is not attached.
					set_fatal_error
					error_handler.report_vuta2a_error (current_class, current_class_impl, a_name, a_procedure, a_context.named_type)
				end
			end
			if not a_procedure.is_exported_to (current_class, system_processor) then
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				elseif an_open_operands.count = 1 then
					a_context.force_last (an_open_operands.type (1))
					a_tuple_type := current_universe_impl.tuple_identity_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_context.force_last (a_tuple_type)
				an_agent_type := current_universe_impl.procedure_identity_type
				report_qualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_qualified_tuple_label_call_agent_validity (an_expression: ET_CALL_AGENT; a_target_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of qualified tuple label call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_class_not_void: a_target_class /= Void
			a_target_class_is_tuple: a_target_class.is_tuple_class
			query_call: not an_expression.is_procedure
			tuple_label: an_expression.name.is_tuple_label
			indexed: an_expression.name.seed /= 0
			a_context_not_void: a_context /= Void
		local
			l_name: ET_FEATURE_NAME
			l_index: INTEGER
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_index := l_name.seed
			if current_system.target_type_attachment_mode then
				if not a_context.is_type_attached then
						-- Error: the target of the call is not attached.
					set_fatal_error
					error_handler.report_vuta2b_error (current_class, current_class_impl, l_name, a_context.named_type)
				end
			end
			if attached an_expression.arguments as l_actuals and then not l_actuals.is_empty then
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
				l_type := a_target_class.formal_parameter_type (l_index)
				if l_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					a_context.force_last (current_universe_impl.tuple_type)
					l_agent_type := current_universe_impl.predicate_identity_type
				else
					l_agent_class := current_universe_impl.function_identity_any_type.named_base_class
					create l_parameters.make_with_capacity (2)
					l_parameters.put_first (l_type)
					l_parameters.put_first (current_universe_impl.tuple_type)
					create l_agent_type.make_generic (tokens.implicit_attached_type_mark, l_agent_class.name, l_parameters, l_agent_class)
				end
				report_tuple_label_call_agent (an_expression, l_agent_type, a_context)
				a_context.force_last (l_agent_type)
			end
		end

	check_typed_call_agent_validity (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT)
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
			a_seed: INTEGER
			a_target_type: ET_TYPE
			l_adapted_base_class: ET_ADAPTED_CLASS
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			l_has_multiple_constraints: BOOLEAN
			l_context_count: INTEGER
			i, nb: INTEGER
			l_first_context: detachable ET_NESTED_TYPE_CONTEXT
			l_first_adapted_base_class: detachable ET_ADAPTED_CLASS
			l_first_feature: detachable ET_FEATURE
			l_other_feature: detachable ET_FEATURE
			l_first_tuple_label: INTEGER
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			a_target_type := a_target.type
			check_type_validity (a_target_type)
			l_adapted_base_classes := new_adapted_base_classes
			if not has_fatal_error then
				a_context.force_last (a_target_type)
				l_context_count := a_context.count
				a_context.add_adapted_base_classes_to_list (l_adapted_base_classes)
				l_has_multiple_constraints := l_adapted_base_classes.count > 1
				check_adapted_base_classes_validity (a_name, l_adapted_base_classes, a_context)
			end
			if has_fatal_error then
				-- Do nothing.
			elseif a_seed = 0 then
				l_adapted_base_class := l_adapted_base_classes.first
				a_class := l_adapted_base_class.base_class
				adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					-- We need to resolve `a_name' in the implementation
					-- class of `current_feature_impl' first.
				if current_class_impl /= current_class then
					set_fatal_error
					if not has_implementation_error (current_feature_impl) then
							-- Internal error: `a_name' should have been resolved in
							-- the implementation feature.
						error_handler.report_giaaa_error
					end
				elseif attached l_adapted_base_class.named_procedure (a_name) as l_procedure then
					a_name.set_seed (l_procedure.first_seed)
					an_expression.set_procedure (True)
					check_qualified_vape_validity (a_name, l_procedure, a_class)
					had_error := has_fatal_error
					check_typed_procedure_call_agent_validity (an_expression, l_procedure, a_context)
					has_fatal_error := has_fatal_error or had_error
				elseif attached l_adapted_base_class.named_query (a_name) as l_query then
					a_name.set_seed (l_query.first_seed)
					an_expression.set_procedure (False)
					check_qualified_vape_validity (a_name, l_query, a_class)
					had_error := has_fatal_error
					check_typed_query_call_agent_validity (an_expression, l_query, a_context)
					has_fatal_error := has_fatal_error or had_error
				else
					if a_class.is_tuple_class and then attached {ET_IDENTIFIER} a_name as l_label then
							-- Check whether this is a tuple label.
						a_seed := l_adapted_base_class.base_type_index_of_label (l_label, a_context)
						if a_seed /= 0 then
							l_label.set_tuple_label (True)
							l_label.set_seed (a_seed)
							an_expression.set_procedure (False)
							check_typed_tuple_label_call_agent_validity (an_expression, a_class, a_context)
						end
					end
					if a_seed = 0 then
						set_fatal_error
							-- ISE Eiffel 5.4 reports this error as a VEEN,
							-- but it is in fact a VPCA-1 (ETL3-4.82-00-00 p.581).
						error_handler.report_vpca1b_error (current_class, a_name, a_class)
					end
				end
			elseif l_adapted_base_classes.is_empty then
					-- Internal error: the seed was already computed in a proper ancestor
					-- (or in another generic derivation) of `current_class' where this
					-- expression was written. So, if we got a seed, a feature or tuple label
					-- should exist.
				set_fatal_error
				error_handler.report_giaaa_error
			else
				nb := l_adapted_base_classes.count
				from i := 1 until i > nb loop
					l_adapted_base_class := l_adapted_base_classes.item (i)
					a_class := l_adapted_base_class.base_class
					adapted_base_class_checker.reset_context_if_multiple_constraints (l_has_multiple_constraints, l_adapted_base_class, a_context)
					if a_name.is_tuple_label then
						if a_class.is_tuple_class then
							check_typed_tuple_label_call_agent_validity (an_expression, a_class, a_context)
						elseif a_class.is_none then
-- TODO: "NONE" conforms to "TUPLE".
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Report internal error: if we got a call to tuple label,
								-- the class has to be TUPLE because it is not possible
								-- to inherit from TUPLE.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					elseif an_expression.is_procedure then
						if attached a_class.seeded_procedure (a_seed) as l_procedure then
							check_qualified_vape_validity (a_name, l_procedure, a_class)
							had_error := has_fatal_error
							check_typed_procedure_call_agent_validity (an_expression, l_procedure, a_context)
							has_fatal_error := has_fatal_error or had_error
							l_other_feature := l_procedure
						elseif a_class.is_none then
-- TODO: "NONE" conforms to all reference types.
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Internal error: the seed was already computed in a proper ancestor
								-- (or in another generic derivation) of `current_class' where this
								-- agent was written. So, if we got a seed, there should be a
								-- procedure for this seed.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					else
						if attached a_class.seeded_query (a_seed) as l_query then
							check_qualified_vape_validity (a_name, l_query, a_class)
							had_error := has_fatal_error
							check_typed_query_call_agent_validity (an_expression, l_query, a_context)
							has_fatal_error := has_fatal_error or had_error
							l_other_feature := l_query
						elseif a_class.is_none then
-- TODO: "NONE" conforms to all reference types.
							set_fatal_error
							error_handler.report_giaaa_error
						else
								-- Internal error: the seed was already computed in a proper ancestor
								-- (or in another generic derivation) of `current_class' where this
								-- agent was written. So, if we got a seed, there should be a
								-- query for this seed.
							set_fatal_error
							error_handler.report_giaaa_error
						end
					end
					if has_fatal_error then
							-- Avoid reporting several times the same error.
						i := nb -- Jump out of the loop.
					elseif l_first_context /= Void and l_first_adapted_base_class /= Void then
						if not a_context.same_named_context (l_first_context) then
							set_fatal_error
							if l_first_feature /= Void and l_other_feature /= Void then
									-- Two features with the same seed and different signatures.
								error_handler.report_vgmc0g_error (current_class, current_class_impl, a_name, l_first_feature, l_first_adapted_base_class, l_other_feature, l_adapted_base_class)
							else
									-- Two Tuples with different item types at index `a_seed'.
								error_handler.report_vgmc0f_error (current_class, current_class_impl, a_name, a_seed, l_first_adapted_base_class, l_adapted_base_class)
							end
						end
					elseif nb > 1 then

						l_first_context := new_context (current_type)
						l_first_context.copy_type_context (a_context)
						l_first_adapted_base_class := l_adapted_base_class
						l_first_feature := l_other_feature
						l_first_tuple_label := a_seed
					end
					if i < nb then
						a_context.keep_first (l_context_count)
					end
					i := i + 1
				end
				if l_first_context /= Void then
					free_context (l_first_context)
				end
			end
			free_adapted_base_classes (l_adapted_base_classes)
		end

	check_typed_query_call_agent_validity (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of typed query call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_query_not_void: a_query /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_result_type: ET_TYPE
			a_seed: INTEGER
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if not a_query.is_exported_to (current_class, system_processor) then
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
				if an_open_operands.count = 0 then
					a_tuple_type := current_universe_impl.tuple_identity_type
				else
					an_open_operands.put_first (tokens.identity_type)
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_result_type := a_query.type
-- TODO: like argument
				if a_result_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					a_context.force_last (a_tuple_type)
					an_agent_type := current_universe_impl.predicate_identity_type
				else
					an_agent_class := current_universe_impl.function_identity_any_type.named_base_class
					create a_parameters.make_with_capacity (2)
					a_parameters.put_first (a_result_type)
					a_parameters.put_first (a_tuple_type)
					create an_agent_type.make_generic (tokens.implicit_attached_type_mark, an_agent_class.name, a_parameters, an_agent_class)
				end
				report_qualified_query_call_agent (an_expression, a_query, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_typed_procedure_call_agent_validity (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of typed procedure call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			seeded: an_expression.name.seed /= 0
			a_procedure_not_void: a_procedure /= Void
			a_context_not_void: a_context /= Void
		local
			a_name: ET_FEATURE_NAME
			a_seed: INTEGER
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			an_agent_type: ET_CLASS_TYPE
			had_error: BOOLEAN
		do
			has_fatal_error := False
			a_name := an_expression.name
			a_seed := a_name.seed
			if not a_procedure.is_exported_to (current_class, system_processor) then
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
				if an_open_operands.count = 0 then
					a_tuple_type := current_universe_impl.tuple_identity_type
				else
					an_open_operands.put_first (tokens.identity_type)
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_context.force_last (a_tuple_type)
				an_agent_type := current_universe_impl.procedure_identity_type
				report_qualified_procedure_call_agent (an_expression, a_procedure, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	check_typed_tuple_label_call_agent_validity (an_expression: ET_CALL_AGENT; a_target_class: ET_CLASS; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of typed tuple label call agent.
			-- `a_context' represents the type of the target.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_class_not_void: a_target_class /= Void
			a_target_class_is_tuple: a_target_class.is_tuple_class
			query_call: not an_expression.is_procedure
			tuple_label: an_expression.name.is_tuple_label
			indexed: an_expression.name.seed /= 0
			a_context_not_void: a_context /= Void
		local
			l_name: ET_FEATURE_NAME
			l_index: INTEGER
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
			l_tuple_type: ET_TUPLE_TYPE
		do
			has_fatal_error := False
			l_name := an_expression.name
			l_index := l_name.seed
			if attached an_expression.arguments as l_actuals and then not l_actuals.is_empty then
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
				l_type := a_target_class.formal_parameter_type (l_index)
				l_tuple_type := current_universe_impl.tuple_identity_type
				if l_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
					a_context.force_last (l_tuple_type)
					l_agent_type := current_universe_impl.predicate_identity_type
				else
					l_agent_class := current_universe_impl.function_identity_any_type.named_base_class
					create l_parameters.make_with_capacity (2)
					l_parameters.put_first (l_type)
					l_parameters.put_first (l_tuple_type)
					create l_agent_type.make_generic (tokens.implicit_attached_type_mark, l_agent_class.name, l_parameters, l_agent_class)
				end
				report_tuple_label_call_agent (an_expression, l_agent_type, a_context)
				a_context.force_last (l_agent_type)
			end
		end

	check_do_function_inline_agent_validity (an_expression: ET_DO_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_compound: detachable ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_formal_arguments then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.locals as l_locals then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				l_rescue_compound := an_expression.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if current_system.attachment_type_conformance_mode then
					if not l_type.is_type_detachable (current_type) and not l_type.is_type_expanded (current_type) then
						if system_processor.is_ise and then current_attachment_scope.has_result then
								-- In ISE Eiffel, local variables (including 'Result') are considered
								-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								-- Here we know that 'Result' is attached anyway.
						elseif current_initialization_scope.has_result then
								-- 'Result' entity declared as attached is correctly initialized
								-- at the end of the body the function.
						elseif not current_initialization_scope.is_code_unreachable then
								-- Starting with ISE 7.0.8.7345, void-safety errors in
								-- unreachable code are not reported.
							had_error := True
							set_fatal_error
							error_handler.report_vevi0d_error (current_class, current_class_impl, an_expression)
						end
					end
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
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

	check_do_procedure_inline_agent_validity (an_expression: ET_DO_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_compound: detachable ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_formal_arguments then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.locals as l_locals then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			if not had_error then
				l_compound := an_expression.compound
				l_rescue_compound := an_expression.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
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

	check_external_function_inline_agent_validity (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_arguments then
				check_inline_agent_formal_arguments_validity (l_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
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
			if system_processor.is_ise then
					-- ISE does not support inline agent of the external form.
				set_fatal_error
				error_handler.report_vpir3b_error (current_class, an_expression)
			end
		end

	check_external_procedure_inline_agent_validity (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_error: BOOLEAN
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_arguments then
				check_inline_agent_formal_arguments_validity (l_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
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
			if system_processor.is_ise then
					-- ISE does not support inline agent of the external form.
				set_fatal_error
				error_handler.report_vpir3b_error (current_class, an_expression)
			end
		end

	check_once_function_inline_agent_validity (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_compound: detachable ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_key_error: BOOLEAN
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_formal_arguments then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			l_type := an_expression.type
			check_signature_type_validity (l_type)
			if not has_fatal_error then
				report_inline_agent_result_declaration (l_type)
				report_inline_agent_result_supplier (l_type, current_class, current_feature)
			end
			had_error := had_error or has_fatal_error
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.locals as l_locals then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			check_once_keys_validity (an_expression.keys, an_expression.first_indexing)
			had_key_error := has_fatal_error
			if not had_error then
				l_compound := an_expression.compound
				l_rescue_compound := an_expression.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if current_system.attachment_type_conformance_mode then
					if not l_type.is_type_detachable (current_type) and not l_type.is_type_expanded (current_type) then
						if system_processor.is_ise and then current_attachment_scope.has_result then
								-- In ISE Eiffel, local variables (including 'Result') are considered
								-- as 'detachable' (even when the 'attached' keyword is explicitly specified).
								-- Here we know that 'Result' is attached anyway.
						elseif current_initialization_scope.has_result then
								-- 'Result' entity declared as attached is correctly initialized
								-- at the end of the body the function.
						elseif not current_initialization_scope.is_code_unreachable then
								-- Starting with ISE 7.0.8.7345, void-safety errors in
								-- unreachable code are not reported.
							had_error := True
							set_fatal_error
							error_handler.report_vevi0d_error (current_class, current_class_impl, an_expression)
						end
					end
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_query_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error or had_key_error
			if system_processor.is_ise then
					-- ISE does not support inline agent of the once form.
				set_fatal_error
				error_handler.report_vpir3a_error (current_class, an_expression)
			end
		end

	check_once_procedure_inline_agent_validity (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_compound: detachable ET_COMPOUND
			l_old_hidden_object_test_scope: INTEGER
			l_old_hidden_iteration_item_scope: INTEGER
			l_old_attachment_scope: like current_attachment_scope
			l_old_initialization_scope: like current_initialization_scope
			had_key_error: BOOLEAN
			had_error: BOOLEAN
			l_rescue_compound: detachable ET_COMPOUND
			l_rescue_attachment_scope: detachable like current_attachment_scope
			l_rescue_initialization_scope: detachable like current_initialization_scope
			l_main_attachment_scope: detachable like current_attachment_scope
			l_main_initialization_scope: detachable like current_initialization_scope
		do
			has_fatal_error := False
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
				-- Make sure that we do not use object-test locals declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_object_test_scope := current_object_test_scope.hidden_count
			current_object_test_scope.hide_object_tests (current_object_test_scope.count)
				-- Make sure that we do not use iteration items declared
				-- in an enclosing feature or inline agent.
			l_old_hidden_iteration_item_scope := current_iteration_item_scope.hidden_count
			current_iteration_item_scope.hide_iteration_components (current_iteration_item_scope.count)
			l_old_initialization_scope := current_initialization_scope
			l_old_attachment_scope := current_attachment_scope
			if current_system.attachment_type_conformance_mode then
				current_initialization_scope := new_attachment_scope
				current_attachment_scope := new_attachment_scope
			end
			if in_static_feature then
					-- Error: we cannot use an inline agent in a static feature.
				set_fatal_error
				error_handler.report_vucr0i_error (current_class, current_class_impl, an_expression)
				had_error := True
			end
				-- Check the associated feature's declaration.
			if attached an_expression.formal_arguments as l_formal_arguments then
				check_inline_agent_formal_arguments_validity (l_formal_arguments, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.object_tests as l_object_tests then
				check_inline_agent_object_tests_validity (l_object_tests, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.iteration_components as l_iteration_components then
				check_inline_agent_iteration_components_validity (l_iteration_components, an_expression)
				had_error := had_error or has_fatal_error
			end
			if attached an_expression.locals as l_locals then
				check_inline_agent_locals_validity (l_locals, an_expression)
				had_error := had_error or has_fatal_error
			end
			check_once_keys_validity (an_expression.keys, an_expression.first_indexing)
			had_key_error := has_fatal_error
			if not had_error then
				l_compound := an_expression.compound
				l_rescue_compound := an_expression.rescue_clause
				if current_system.attachment_type_conformance_mode then
					if l_rescue_compound /= Void and l_compound /= Void then
						l_rescue_initialization_scope := current_initialization_scope
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_rescue_initialization_scope)
						l_rescue_attachment_scope := current_attachment_scope
						current_attachment_scope := new_attachment_scope
						current_attachment_scope.copy_scope (l_rescue_attachment_scope)
					end
				end
				if l_compound /= Void then
					check_instructions_validity (l_compound)
					had_error := had_error or has_fatal_error
				end
				if l_rescue_compound /= Void then
					if current_system.attachment_type_conformance_mode then
						if l_rescue_attachment_scope /= Void and l_rescue_initialization_scope /= Void then
							l_main_attachment_scope := current_attachment_scope
							l_main_initialization_scope := current_initialization_scope
							current_attachment_scope := l_rescue_attachment_scope
							current_initialization_scope := l_rescue_initialization_scope
						end
					end
					check_rescue_validity (l_rescue_compound)
					had_error := had_error or has_fatal_error
					if current_system.attachment_type_conformance_mode then
						if l_main_attachment_scope /= Void and l_main_initialization_scope /= Void then
							free_attachment_scope (current_attachment_scope)
							free_attachment_scope (current_initialization_scope)
							current_attachment_scope := l_main_attachment_scope
							current_initialization_scope := l_main_initialization_scope
						end
					end
				end
			end
				-- Restore the scope object-test locals declared
				-- in the enclosing feature or inline agent.
			current_object_test_scope.hide_object_tests (l_old_hidden_object_test_scope)
				-- Restore the scope iteration items declared
				-- in the enclosing feature or inline agent.
			current_iteration_item_scope.hide_iteration_components (l_old_hidden_iteration_item_scope)
			if current_system.attachment_type_conformance_mode then
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
			end
				-- Manage enclosing inline agents.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
				-- Check validity of call agent equivalent form.
			check_procedure_inline_agent_validity (an_expression, a_context)
			has_fatal_error := has_fatal_error or had_error or had_key_error
			if system_processor.is_ise then
					-- ISE does not support inline agent of the once form.
				set_fatal_error
				error_handler.report_vpir3a_error (current_class, an_expression)
			end
		end

	check_query_inline_agent_validity (an_expression: ET_QUERY_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of call agent equivalent form of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			a_type: ET_TYPE
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_CLASS_TYPE
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_type := an_expression.type
-- TODO: like argument
				if not has_fatal_error then
					if a_type.same_named_type (current_universe_impl.boolean_type, current_type, a_context) then
						a_context.force_last (a_tuple_type)
						an_agent_type := current_universe_impl.predicate_identity_type
					else
						an_agent_class := current_universe_impl.function_identity_any_type.named_base_class
						create a_parameters.make_with_capacity (2)
						a_parameters.put_first (a_type)
						a_parameters.put_first (a_tuple_type)
						create an_agent_type.make_generic (tokens.implicit_attached_type_mark, an_agent_class.name, a_parameters, an_agent_class)
					end
					report_query_inline_agent (an_expression, an_agent_type, a_context)
					a_context.force_last (an_agent_type)
				end
			end
		end

	check_procedure_inline_agent_validity (an_expression: ET_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Check validity of call agent equivalent form of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			an_agent_type: ET_CLASS_TYPE
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
				if an_open_operands = Void or else an_open_operands.is_empty then
					a_tuple_type := current_universe_impl.tuple_type
				elseif an_open_operands.count = 1 then
					a_context.force_last (an_open_operands.type (1))
					a_tuple_type := current_universe_impl.tuple_identity_type
				else
					create a_tuple_type.make (tokens.implicit_attached_type_mark, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				end
				a_context.force_last (a_tuple_type)
				an_agent_type := current_universe_impl.procedure_identity_type
				report_procedure_inline_agent (an_expression, an_agent_type, a_context)
				a_context.force_last (an_agent_type)
			end
		end

	set_implicit_agent_open_arguments (an_agent: ET_AGENT; a_formals: ET_FORMAL_ARGUMENT_LIST)
			-- If we have 'agent f' and 'f' has two formal arguments,
			-- then make the open arguments explicit 'agent f (?, ?)'.
			-- Only do that if `current_class' is the class where this
			-- agent has been written. `a_formals' are the corresponding
			-- formal arguments, Void if no formal arguments.
			-- This routine works both with call agents and inline agents.
		require
			an_agent_not_void: an_agent /= Void
		local
			l_implicit_actuals: ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST
			l_implicit_actual: ET_AGENT_IMPLICIT_OPEN_ARGUMENT
			i, nb: INTEGER
		do
			if current_class_impl = current_class then
				if an_agent.arguments = Void then
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

	check_agent_arguments_validity (an_agent: ET_AGENT; a_formals: detachable ET_FORMAL_ARGUMENT_LIST;
		a_feature: detachable ET_FEATURE; an_open_operands: detachable ET_ACTUAL_PARAMETER_LIST; a_context: ET_NESTED_TYPE_CONTEXT)
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
			l_formal_type: ET_TYPE
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context: ET_NESTED_TYPE_CONTEXT
			i, nb: INTEGER
			l_agent_actual: ET_AGENT_ARGUMENT_OPERAND
			l_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
			l_actual_named_type: ET_NAMED_TYPE
			l_formal_named_type: ET_NAMED_TYPE
			l_convert_expression: detachable ET_CONVERT_EXPRESSION
			l_actual_type: ET_TYPE
		do
			has_fatal_error := False
			if not attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_agent.arguments as l_actual_list then
				if a_formals /= Void and an_open_operands /= Void then
					nb := a_formals.count
					from i := nb until i < 1 loop
						l_formal_type := a_formals.formal_argument (i).type
						an_open_operands.force_first (l_formal_type)
						i := i - 1
					end
				end
			else
				if l_actual_list.is_empty then
					if a_formals /= Void and then not a_formals.is_empty then
						set_fatal_error
						if current_class = current_class_impl then
							if attached {ET_CALL_AGENT} an_agent as l_call_agent and a_feature /= Void then
								if l_call_agent.is_qualified_call then
									error_handler.report_vpca3a_error (current_class, l_call_agent.name, a_feature, a_context.base_class)
								else
									error_handler.report_vpca3b_error (current_class, l_call_agent.name, a_feature)
								end
							elseif attached {ET_INLINE_AGENT} an_agent as l_inline_agent then
-- TODO: inline agent
							else
									-- Internal error: unknown kind of agent.
								set_fatal_error
								error_handler.report_giaaa_error
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
						if attached {ET_CALL_AGENT} an_agent as l_call_agent and a_feature /= Void then
							if l_call_agent.is_qualified_call then
								error_handler.report_vpca3a_error (current_class, l_call_agent.name, a_feature, a_context.base_class)
							else
								error_handler.report_vpca3b_error (current_class, l_call_agent.name, a_feature)
							end
						elseif attached {ET_INLINE_AGENT} an_agent as l_inline_agent then
-- TODO: inline agent
						else
								-- Internal error: unknown kind of agent.
							set_fatal_error
							error_handler.report_giaaa_error
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
						if attached {ET_EXPRESSION} l_agent_actual as l_actual then
							l_formal_type := l_formal.type
							l_formal_context.force_last (l_formal_type)
							check_expression_validity (l_actual, l_actual_context, l_formal_context)
							if has_fatal_error then
								-- Do nothing.
							elseif not l_actual_context.conforms_to_context (l_formal_context, system_processor) then
									-- The actual type does not conform to the format type.
									-- Try to find out whether it converts to it.
								l_convert_expression := convert_expression (l_actual, l_actual_context, l_formal_context)
								if has_fatal_error then
									-- Nothing to be done.
								elseif l_convert_expression /= Void then
										-- Insert the conversion feature call in the AST.
										-- Convertibility should be resolved in the implementation class.
									check implementation_class: current_class = current_class_impl end
									if attached {ET_AGENT_ARGUMENT_OPERAND_COMMA} l_actual_list.item (i) as l_argument_comma then
										l_argument_comma.set_agent_actual_argument (l_convert_expression)
									else
										l_actual_list.put (l_convert_expression, i)
									end
								else
									set_fatal_error
									l_actual_named_type := l_actual_context.named_type
									l_formal_named_type := l_formal_context.named_type
									if attached {ET_CALL_AGENT} an_agent as l_call_agent and a_feature /= Void then
										if l_call_agent.is_qualified_call then
												-- Make sure that `a_context' (which is the same object as `l_formal_context') represents
												-- the type of the target of the agent and not the type of the formal argument.
											l_formal_context.remove_last
											error_handler.report_vpca4a_error (current_class, current_class_impl, l_call_agent.name, a_feature, a_context.base_class, i, l_actual_named_type, l_formal_named_type)
											l_formal_context.force_last (l_formal_type)
										else
											error_handler.report_vpca4b_error (current_class, current_class_impl, l_call_agent.name, a_feature, i, l_actual_named_type, l_formal_named_type)
										end
									elseif attached {ET_INLINE_AGENT} an_agent as l_inline_agent then
-- TODO: inline agent
									else
											-- Internal error: unknown kind of agent.
										set_fatal_error
										error_handler.report_giaaa_error
									end
								end
							end
							l_formal_context.remove_last
							l_actual_context.wipe_out
						elseif attached {ET_AGENT_TYPED_OPEN_ARGUMENT} l_agent_actual as l_agent_type then
							l_actual_type := l_agent_type.type
							check_type_validity (l_actual_type)
							if not has_fatal_error then
								if not l_actual_type.conforms_to_type (l_formal.type, l_formal_context, current_type, system_processor) then
-- Note: VPCA-5 says nothing about type convertibility.
									set_fatal_error
									l_actual_named_type := l_actual_type.named_type (current_type)
									l_formal_named_type := l_formal.type.named_type (l_formal_context)
									if attached {ET_CALL_AGENT} an_agent as l_call_agent and a_feature /= Void then
										if l_call_agent.is_qualified_call then
											error_handler.report_vpca5a_error (current_class, current_class_impl, l_call_agent.name, a_feature, a_context.base_class, i, l_actual_named_type, l_formal_named_type)
										else
											error_handler.report_vpca5b_error (current_class, current_class_impl, l_call_agent.name, a_feature, i, l_actual_named_type, l_formal_named_type)
										end
									elseif attached {ET_INLINE_AGENT} an_agent as l_inline_agent then
-- TODO: inline agent
									else
											-- Internal error: unknown kind of agent.
										set_fatal_error
										error_handler.report_giaaa_error
									end
								else
									if an_open_operands /= Void then
										an_open_operands.force_first (l_actual_type)
									end
								end
							end
						elseif attached {ET_QUESTION_MARK_SYMBOL} l_agent_actual as l_question_mark then
							if an_open_operands /= Void then
								l_formal_type := l_formal.type
								an_open_operands.force_first (l_formal_type)
							end
						else
								-- Internal error: no other kind of agent actual arguments.
							set_fatal_error
							error_handler.report_giaaa_error
						end
						i := i - 1
					end
					free_context (l_actual_context)
					has_fatal_error := has_fatal_error or had_error
				end
			end
		end

feature {NONE} -- Multiple generic constraints

	check_adapted_base_classes_validity (a_name: ET_CALL_NAME; a_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]; a_context: ET_TYPE_CONTEXT)
			-- Check validity of `a_adapted_base_classes' in case of multiple generic constraints
			-- when they are the possible base classes of a target of call name `a_name'.
			-- `a_context' represents the type of the target of the call.
			-- Keep in that list:
			-- * only one class when processing `a_name' in the class where the call
			--   was written, or
			-- * all applicable classes when `a_name' was already resolved in a proper
			--   ancestor (or in another generic derivation) of `current_class' where
			--   the call was written.
			--
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_adapted_base_classes_not_void: a_adapted_base_classes /= Void
			no_void_adapted_base_class: not a_adapted_base_classes.has_void
			a_context_not_void: a_context /= Void
			a_context_is_valid: a_context.is_valid_context
		do
			has_fatal_error := False
			adapted_base_class_checker.check_adapted_base_classes_validity (a_name, a_adapted_base_classes, a_context, current_class, current_class_impl)
			if adapted_base_class_checker.has_fatal_error then
				set_fatal_error
			end
		ensure
			in_implementation_class: (current_class_impl = current_class or a_name.seed = 0) implies a_adapted_base_classes.count = 1
			not_in_implementation_class: (current_class_impl /= current_class and a_name.seed /= 0) implies across a_adapted_base_classes as i_adapted_base_class all a_name.is_tuple_label or else (not i_adapted_base_class.base_class.is_none implies i_adapted_base_class.base_class.seeded_feature (a_name.seed) /= Void) end
		end

	adapted_base_class_checker: ET_ADAPTED_BASE_CLASS_CHECKER
			-- Adapted base class checker

	adapted_name (a_name: ET_CALL_NAME; a_adapted_base_class: ET_ADAPTED_CLASS): ET_CALL_NAME
			-- Name in `a_adapted_base_class.base_class` corresponding to `a_name' in `a_adapted_base_class'.
			-- Takes into account possible renaming if `a_adapted_base_class' is a generic constraint.
		require
			a_name_not_void: a_name /= Void
			a_adapted_base_class_not_void: a_adapted_base_class /= Void
		local
			i: INTEGER
		do
			Result := a_name
			if attached {ET_BASE_TYPE_CONSTRAINT} a_adapted_base_class as l_constraint and then attached l_constraint.renames as l_renames then
				i := l_renames.index_of_new_name (a_name)
				if i /= 0 then
					Result := l_renames.rename_pair (i).old_name
				end
			end
		ensure
			adapted_name_not_void: Result /= Void
		end

	new_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			-- New empty list of adapted base classes
		do
			if unused_adapted_base_classes.is_empty then
				create Result.make (20)
			else
				Result := unused_adapted_base_classes.last
				unused_adapted_base_classes.remove_last
			end
		ensure
			new_adapted_base_classes_not_void: Result /= Void
			new_adapted_base_classes_is_empty: Result.is_empty
		end

	free_adapted_base_classes (a_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS])
			-- Free `a_adapted_base_classes' so that it can be reused.
		require
			a_adapted_base_classes_not_void: a_adapted_base_classes /= Void
		do
			a_adapted_base_classes.wipe_out
			unused_adapted_base_classes.force_last (a_adapted_base_classes)
		end

	unused_adapted_base_classes: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_ADAPTED_CLASS]]
			-- Adapted base class lists hat are not currently used

feature {NONE} -- Conversion

	convert_expression (a_source: ET_EXPRESSION; a_source_type, a_target_type: ET_NESTED_TYPE_CONTEXT): detachable ET_CONVERT_EXPRESSION
			-- Conversion expresion to convert `a_source' of type `a_source_type' to `a_target_type';
			-- Void if no such conversion expression.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_source_not_void: a_source /= Void
			a_source_type_not_void: a_source_type /= Void
			a_target_type_not_void: a_target_type /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_convert_feature: detachable ET_CONVERT_FEATURE
			l_convert_class: ET_CLASS
			l_convert_builtin_expression: ET_CONVERT_BUILTIN_EXPRESSION
			l_convert_from_expression: ET_CONVERT_FROM_EXPRESSION
			l_convert_to_expression: ET_CONVERT_TO_EXPRESSION
			l_target_named_type: ET_NAMED_TYPE
			l_had_error: BOOLEAN
		do
			has_fatal_error := False
			if current_class /= current_class_impl then
					-- Convertibility should be resolved in the implementation class.
			elseif
				(current_system.attachment_type_conformance_mode or
				current_system.target_type_attachment_mode) and then
				not a_source_type.is_type_attached
			then
					-- With convert-to, the source expression is the target
					-- of a call to the conversion query.
					-- With convert-from, the type of source expression should
					-- be one of the conversion types (after possible generic
					-- parameter substitutions) which are all attached
					-- (see VYCP-9, ECMA-367, 3-36, section 8.15.7, page 880).				
			else
				l_convert_feature := type_checker.convert_feature (a_source_type, a_target_type)
				if l_convert_feature = Void then
						-- Check whether `a_source' is a non-explicitly typed manifest constant which
						-- has a valid value for `a_target_type'. Useful when trying to convert the
						-- left-hand-side of a binary expression.
					l_convert_feature := a_source.manifest_constant_convert_feature (a_source_type, a_target_type, current_universe)
				end
				if l_convert_feature /= Void then
					if l_convert_feature.is_convert_from then
						l_convert_class := a_target_type.base_class
						l_convert_class.process (system_processor.feature_flattener)
						if not l_convert_class.features_flattened or else l_convert_class.has_flattening_error then
								-- Error already reported by the feature flattener.
							set_fatal_error
						else
							l_convert_from_expression := system_processor.ast_factory.new_convert_from_expression (a_source, l_convert_feature, a_source_type, a_target_type)
							if attached l_convert_class.seeded_procedure (l_convert_feature.name.seed) as l_conversion_procedure then
									-- Check creation export status.
									-- There is apparently no such rule in ECMA-367, 3-36.
								if not l_conversion_procedure.is_creation_exported_to (current_class, l_convert_class, system_processor) then
										-- The procedure is not a creation procedure exported to `current_class',
										-- and it is not the implicit creation procedure 'default_create'.
									set_fatal_error
									error_handler.report_vgcc6c_error (current_class, current_class_impl, l_convert_from_expression.name, l_conversion_procedure, l_convert_class)
								end
								l_had_error := has_fatal_error
								check_creation_vape_validity (l_convert_from_expression.name, l_conversion_procedure, l_convert_class)
								reset_fatal_error (l_had_error or has_fatal_error)
									-- Note that ECMA is more contraining, allowing only precondition-free features
									-- or features with statically satisfied preconditions (see VYEC, ECMA-367, 3-36,
									-- section 8.15.14, page 91).
								if not has_fatal_error then
									report_creation_expression (l_convert_from_expression, l_convert_from_expression.type, l_conversion_procedure)
									Result := l_convert_from_expression
								end
							else
									-- Internal error: the seed of the convert feature should correspond
									-- to a procedure of `l_convert_class'.
								set_fatal_error
								error_handler.report_giaaa_error
							end
						end
					elseif l_convert_feature.is_convert_to then
						l_convert_class := a_source_type.base_class
						l_convert_class.process (system_processor.feature_flattener)
						if not l_convert_class.features_flattened or else l_convert_class.has_flattening_error then
								-- Error already reported by the feature flattener.
							set_fatal_error
						else
							l_convert_to_expression := system_processor.ast_factory.new_convert_to_expression (a_source, l_convert_feature, a_source_type, a_target_type)
							if attached l_convert_class.seeded_query (l_convert_feature.name.seed) as l_conversion_query then
									-- Check export status.
									-- There is apparently no such rule in ECMA-367, 3-36.
								if not l_conversion_query.is_exported_to (current_class, system_processor) then
										-- The feature is not exported to `current_class'.
									set_fatal_error
									error_handler.report_vuex2b_error (current_class, current_class_impl, l_convert_to_expression.name, l_conversion_query, l_convert_class)
								end
								l_had_error := has_fatal_error
									-- Check that if the call to `l_conversion_query' appears in a precondition
									-- of `current_feature', then it is exported to all classes to which
									-- `current_feature' is exported.
								check_qualified_vape_validity (l_convert_to_expression.name, l_conversion_query, l_convert_class)
								reset_fatal_error (l_had_error or has_fatal_error)
									-- Note that ECMA is more contraining, allowing only precondition-free features
									-- or features with statically satisfied preconditions (see VYEC, ECMA-367, 3-36,
									-- section 8.15.14, page 91).
								if not has_fatal_error then
									report_qualified_call_expression (l_convert_to_expression, a_source_type, l_conversion_query)
									Result := l_convert_to_expression
								end
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

	tuple_argument_position (a_formals: ET_FORMAL_ARGUMENT_LIST; a_context: ET_NESTED_TYPE_CONTEXT): INTEGER
			-- Position of the formal argument in `a_formals' with a Tuple type
			-- when viewed from `a_context', where there is exactly one (i.e. when
			-- the routine is a single-tuple routine).
			-- Otherwise, 0.
		require
			a_formals_not_void: a_formals /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
			l_adapted_base_classes: DS_ARRAYED_LIST [ET_ADAPTED_CLASS]
			j, l_class_count: INTEGER
			l_has_tuple_class: BOOLEAN
		do
			nb := a_formals.count
			l_adapted_base_classes := new_adapted_base_classes
			from i := 1 until i > nb loop
				l_has_tuple_class := False
				a_formals.formal_argument (i).type.add_adapted_base_classes_to_list (l_adapted_base_classes, a_context)
				l_class_count := l_adapted_base_classes.count
				from j := 1 until j > l_class_count loop
					if l_adapted_base_classes.item (j).base_class.is_tuple_class then
						l_has_tuple_class := True
						j := l_class_count -- Jump out of the loop.
					end
					j := j + 1
				end
				l_adapted_base_classes.wipe_out
				if l_has_tuple_class then
					if Result /= 0 then
							-- This is not a single-tuple routine: there are more than one
							-- formal argument with a Tuple type.
						Result := 0
						i := nb -- Jump out of the loop.
					else
						Result := i
					end
				end
				i := i + 1
			end
			free_adapted_base_classes (l_adapted_base_classes)
		ensure
			tuple_argument_position_large_enough: Result >= 0
			tuple_argument_position_small_enough: Result <= a_formals.count
		end

feature {NONE} -- Event handling

	report_assignment (an_instruction: ET_ASSIGNMENT)
			-- Report that an assignment instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Report that an assignment attempt instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_set: an_instruction /= Void
		do
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY)
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY)
			-- Report that attribute `a_writable' has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_writable_not_void: a_writable /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_boolean_constant (a_constant: ET_BOOLEAN_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a boolean of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_character_8_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a character_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_character_32_constant (a_constant: ET_CHARACTER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a character_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_builtin_conversion (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_target_type: ET_TYPE)
			-- Report that a built-in convert expression has been processed,
			-- where `a_target_type' in  the context of `current_type' is
			-- the type of the expression after the conversion occurred.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
		do
		end

	report_creation_expression (an_expression: ET_CREATION_EXPRESSION; a_creation_type: ET_TYPE; a_procedure: detachable ET_PROCEDURE)
			-- Report that a creation expression, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_creation_type_not_void: a_creation_type /= Void
		do
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE; a_procedure: detachable ET_PROCEDURE)
			-- Report that a creation instruction, with creation type
			-- `a_creation_type' in context of `current_type', has
			-- been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_creation_type_not_void: a_creation_type /= Void
		do
		end

	report_current (an_expression: ET_CURRENT)
			-- Report that the current entity has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Report that an equality expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_formal_argument (a_name: ET_IDENTIFIER; a_is_attached: BOOLEAN; a_formal: ET_FORMAL_ARGUMENT)
			-- Report that a call to formal argument `a_name' has been processed.
			-- `a_is_attached' means that we know (with a CAP, Certified Attachment Pattern)
			-- that this formal argument is attached at this position in the code.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_formal_not_void: a_formal /= Void
		do
		end

	report_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT)
			-- Report that the declaration of the formal
			-- argument `a_formal' of a feature has been processed.
		require
			no_error: not has_fatal_error
			a_formal_not_void: a_formal /= Void
		do
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY)
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_query_not_void: a_query /= Void
			not_attribute: not a_query.is_attribute
		do
		end

	report_if_expression (a_expression: ET_IF_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that an 'if' expression of type `a_type' in context
			-- of `a_context' has been processed.
		require
			no_error: not has_fatal_error
			a_expression_not_void: a_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_inspect_expression (a_expression: ET_INSPECT_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that an 'inspect' expression of type `a_type' in context
			-- of `a_context' has been processed.
		require
			no_error: not has_fatal_error
			a_expression_not_void: a_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_immutable_string_8_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that an immutable string_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_immutable_string_32_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that an immutable string_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_inline_agent_formal_argument_declaration (a_formal: ET_FORMAL_ARGUMENT)
			-- Report that the declaration of the formal argument `a_formal'
			-- of an inline agent has been processed.
		require
			no_error: not has_fatal_error
			a_formal_not_void: a_formal /= Void
		do
		end

	report_inline_agent_local_variable_declaration (a_local: ET_LOCAL_VARIABLE)
			-- Report that the declaration of the local variable `a_local'
			-- of an inline agent has been processed.
		require
			no_error: not has_fatal_error
			a_local_not_void: a_local /= Void
		do
		end

	report_inline_agent_result_declaration (a_type: ET_TYPE)
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of an inline agent has been processed.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a integer_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a integer_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a integer_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_integer_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a integer_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_iteration_cursor (a_iteration_cursor: ET_ITERATION_CURSOR; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report that a call to iteration cursor `a_iteration_cursor' has been processed.
		require
			no_error: not has_fatal_error
			a_iteration_cursor_not_void: a_iteration_cursor /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		do
		end

	report_iteration_cursor_declaration (a_name: ET_IDENTIFIER; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report that the declaration of the iteration cursor `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		do
		end

	report_iteration_expression (a_iteration_expression: ET_ITERATION_EXPRESSION)
			-- Report that the iteration expression `a_iteration_expression' has been processed.
		require
			no_error: not has_fatal_error
			a_iteration_expression_not_void: a_iteration_expression /= Void
		do
		end

	report_iteration_item (a_name: ET_IDENTIFIER; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report that a call to iteration item `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		do
		end

	report_iteration_item_declaration (a_name: ET_IDENTIFIER; a_iteration_component: ET_ITERATION_COMPONENT)
			-- Report that the declaration of the iteration item `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_iteration_component_not_void: a_iteration_component /= Void
		do
		end

	report_local_assignment_target (a_name: ET_IDENTIFIER; a_local: ET_LOCAL_VARIABLE)
			-- Report that the local variable `a_name' has been
			-- processed as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable (a_name: ET_IDENTIFIER; a_is_attached: BOOLEAN; a_local: ET_LOCAL_VARIABLE)
			-- Report that a call to local variable `a_name' has been processed.
			-- `a_is_attached' means that we know (with a CAP, Certified Attachment Pattern)
			-- that this local variable is attached at this position in the code.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_local_not_void: a_local /= Void
		do
		end

	report_local_variable_declaration (a_local: ET_LOCAL_VARIABLE)
			-- Report that the declaration of the local variable `a_local'
			-- of a feature has been processed.
		require
			no_error: not has_fatal_error
			a_local_not_void: a_local /= Void
		do
		end

	report_manifest_array (an_expression: ET_MANIFEST_ARRAY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a manifest array of type `a_type' in context
			-- of `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_manifest_tuple (an_expression: ET_MANIFEST_TUPLE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a manifest tuple of type `a_type' in context of
			-- `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_manifest_type (an_expression: ET_MANIFEST_TYPE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_named_object_test (a_object_test: ET_NAMED_OBJECT_TEST; a_local_type: ET_TYPE_CONTEXT)
			-- Report that the object-test `a_object_test' with local
			-- of type `a_local_type' has been processed.
		require
			no_error: not has_fatal_error
			a_object_test_not_void: a_object_test /= Void
			a_local_type_not_void: a_local_type /= Void
			a_local_type_valid: a_local_type.is_valid_context
		do
		end

	report_natural_8_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_16_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_16 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_32_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_natural_64_constant (a_constant: ET_INTEGER_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a natural_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_target_type: ET_TYPE_CONTEXT)
			-- Report that an object equality expression has been processed.
			-- `a_target_type' is the type of the target of the call to 'is_equal'
			-- internally invoked by the object equality expression.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
		do
		end

	report_object_test (a_object_test: ET_OBJECT_TEST)
			-- Report that the object-test `a_object_test' has been processed.
		require
			no_error: not has_fatal_error
			a_object_test_not_void: a_object_test /= Void
		do
		end

	report_object_test_type (a_object_test: ET_OBJECT_TEST; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that the type `a_type' in context `a_context' appearing
			-- in the object-test `a_object_test' has been processed.
		require
			no_error: not has_fatal_error
			a_object_test_not_void: a_object_test /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_object_test_local (a_name: ET_IDENTIFIER; a_object_test: ET_NAMED_OBJECT_TEST)
			-- Report that a call to object-test local `a_name' has been processed.
		require
			no_error: not has_fatal_error
			a_name_not_void: a_name /= Void
			a_object_test_not_void: a_object_test /= Void
		do
		end

	report_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_CLASS_TYPE)
			-- Report that a pointer expression of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY)
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

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE)
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

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE)
			-- Report that function `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_procedure_inline_agent (an_expression: ET_PROCEDURE_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that procedure inline agent of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_qualified_call_expression (an_expression: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY)
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

	report_qualified_call_instruction (an_instruction: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE)
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

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_query_inline_agent (an_expression: ET_QUERY_INLINE_AGENT; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
			-- Report that a query inline agent of type `a_type' in `a_context' has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		do
		end

	report_real_32_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE)
			-- Report that a real_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_real_64_constant (a_constant: ET_REAL_CONSTANT; a_type: ET_CLASS_TYPE)
		-- Report that a real_64 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_constant_not_void: a_constant /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_result (an_expression: ET_RESULT; a_is_attached: BOOLEAN)
			-- Report that the result entity has been processed.
			-- `a_is_attached' means that we know (with a CAP, Certified Attachment Pattern)
			-- that the result entity is attached at this position in the code.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

	report_result_assignment_target (a_result: ET_RESULT)
			-- Report that the result entity has been processed
			-- as target of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_result_not_void: a_result /= Void
		do
		end

	report_result_declaration (a_type: ET_TYPE)
			-- Report that the declaration of the "Result" entity,
			-- of type `a_type', of a feature has been processed.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
		do
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY)
			-- Report that a static call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_query_not_void: a_query /= Void
		do
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE)
			-- Report that a static call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_string_8_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that a string_8 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_string_32_constant (a_string: ET_MANIFEST_STRING; a_type: ET_CLASS_TYPE)
			-- Report that a string_32 of type `a_type' in the context
			-- of `current_type' has been processed.
		require
			no_error: not has_fatal_error
			a_string_not_void: a_string /= Void
			a_type_not_void: a_type /= Void
		do
		end

	report_strip_expression (an_expression: ET_STRIP_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_tuple_label_call_agent (an_expression: ET_CALL_AGENT; an_agent_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_tuple_label_expression (an_expression: ET_QUALIFIED_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT)
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

	report_tuple_label_setter (an_assigner: ET_ASSIGNER_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT)
			-- Report that a call to the setter of a tuple label has been processed.
		require
			no_error: not has_fatal_error
			an_assigner_not_void: an_assigner /= Void
			tuple_label: an_assigner.call.name.is_tuple_label
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
		do
		end

	report_typed_pointer_expression (an_expression: ET_ADDRESS_EXPRESSION; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY)
			-- Report that an unqualified call expression has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call: not an_expression.is_qualified_call
			a_query_not_void: a_query /= Void
		do
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE)
			-- Report that an unqualified call instruction has been processed.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			unqualified_call: not an_instruction.is_qualified_call
			a_procedure_not_void: a_procedure /= Void
		do
		end

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_type: ET_TYPE; a_context: ET_TYPE_CONTEXT)
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

	report_void_constant (an_expression: ET_VOID)
			-- Report that a Void has been processed.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
		do
		end

feature -- Client/Supplier relationship

	supplier_handler: detachable ET_SUPPLIER_HANDLER
			-- Supplier handler

	set_supplier_handler (a_handler: like supplier_handler)
			-- Set `supplier_handler' to `a_handler'.
		do
			supplier_handler := a_handler
			type_checker.set_supplier_handler (a_handler)
		ensure
			supplier_handler_set: supplier_handler = a_handler
		end

feature {NONE} -- Client/Supplier relationship

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_expression_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_routine: ET_ROUTINE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_argument_supplier (a_supplier, a_client, a_routine)
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_query: ET_QUERY)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_result_supplier (a_supplier, a_client, a_query)
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_static_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_create_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_inline_agent_argument_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_inline_agent_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE)
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
			if attached supplier_handler as l_supplier_handler then
				l_supplier_handler.report_inline_agent_result_supplier (a_supplier, a_client, a_feature)
			end
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		do
			check_across_expression_validity (an_expression, current_context)
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_across_instruction_validity (an_instruction)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_assigner_instruction_validity (an_instruction)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			check_assignment_validity (an_instruction)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			check_assignment_attempt_validity (an_instruction)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_attribute_validity (a_feature)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_bang_instruction_validity (an_instruction)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			check_binary_integer_constant_validity (a_constant, current_context)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			check_bracket_expression_validity (an_expression, current_context)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			check_c1_character_constant_validity (a_constant, current_context)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			check_c2_character_constant_validity (a_constant, current_context)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			check_c3_character_constant_validity (a_constant, current_context)
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		do
			check_call_agent_validity (an_expression, current_context)
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_check_instruction_validity (an_instruction)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_constant_attribute_validity (a_feature)
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `an_expression'.
		do
			check_convert_builtin_expression_validity (an_expression, current_context)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `an_expression'.
		do
			check_convert_from_expression_validity (an_expression, current_context)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `an_expression'.
		do
			check_convert_to_expression_validity (an_expression, current_context)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		do
			check_create_expression_validity (an_expression, current_context)
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_create_instruction_validity (an_instruction)
		end

	process_current (an_expression: ET_CURRENT)
			-- Process `an_expression'.
		do
			check_current_validity (an_expression, current_context)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS)
			-- Process `an_expression'.
		do
			check_current_address_validity (an_expression, current_context)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_debug_instruction_validity (an_instruction)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			check_deferred_function_validity (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			check_deferred_procedure_validity (a_feature)
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			check_do_function_validity (a_feature)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_do_function_inline_agent_validity (an_expression, current_context)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			check_do_procedure_validity (a_feature)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_do_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_dotnet_attribute_validity (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_dotnet_constant_attribute_validity (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		do
			check_dotnet_function_validity (a_feature)
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		do
			check_dotnet_procedure_validity (a_feature)
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			check_equality_expression_validity (an_expression, current_context)
		end

	process_explicit_convert_from_expression (an_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `an_expression'.
		do
			check_convert_from_expression_validity (an_expression, current_context)
		end

	process_explicit_convert_to_expression (an_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `an_expression'.
		do
			check_convert_to_expression_validity (an_expression, current_context)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			check_expression_address_validity (an_expression, current_context)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_extended_attribute_validity (a_feature)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			check_external_function_validity (a_feature)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_external_function_inline_agent_validity (an_expression, current_context)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			check_external_procedure_validity (a_feature)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_external_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Process `a_constant'.
		do
			check_false_constant_validity (a_constant, current_context)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
		do
			check_feature_address_validity (an_expression, current_context)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			check_hexadecimal_integer_constant_validity (a_constant, current_context)
		end

	process_identifier (an_identifier: ET_IDENTIFIER)
			-- Process `an_identifier'.
		do
			if an_identifier.is_argument then
				check_formal_argument_validity (an_identifier, current_context)
			elseif an_identifier.is_local then
				check_local_variable_validity (an_identifier, current_context)
			elseif an_identifier.is_object_test_local then
				check_object_test_local_validity (an_identifier, current_context)
			elseif an_identifier.is_iteration_item then
				check_iteration_item_validity (an_identifier, current_context)
			else
					-- Internal error: invalid kind of identifier.
				set_fatal_error
				error_handler.report_giaaa_error
			end
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		do
			check_if_expression_validity (a_expression, current_context)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_if_instruction_validity (an_instruction)
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `an_expression'.
		do
			check_infix_cast_expression_validity (an_expression, current_context)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			check_infix_expression_validity (an_expression, current_context)
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		do
			check_inspect_expression_validity (a_expression, current_context)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_inspect_instruction_validity (an_instruction)
		end

	process_iteration_cursor (a_iteration_cursor: ET_ITERATION_CURSOR)
			-- Process `a_iteration_cursor'.
		do
			check_iteration_cursor_validity (a_iteration_cursor, current_context)
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_loop_instruction_validity (an_instruction)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		do
			check_manifest_array_validity (an_expression, current_context)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		do
			check_manifest_tuple_validity (an_expression, current_context)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			check_manifest_type_validity (an_expression, current_context)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		do
			check_named_object_test_validity (an_expression, current_context)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			check_object_equality_expression_validity (an_expression, current_context)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		do
			check_object_test_validity (an_expression, current_context)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			check_octal_integer_constant_validity (a_constant, current_context)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		do
			check_old_expression_validity (an_expression, current_context)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			check_named_object_test_validity (an_expression, current_context)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			check_once_function_validity (a_feature)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_once_function_inline_agent_validity (an_expression, current_context)
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `an_expression'.
		do
			check_once_manifest_string_validity (an_expression, current_context)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			check_once_procedure_validity (a_feature)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			check_once_procedure_inline_agent_validity (an_expression, current_context)
		end

	process_parenthesis_expression (an_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `an_expression'.
		do
			check_qualified_call_expression_validity (an_expression, current_context, Void)
		end

	process_parenthesis_instruction (an_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_qualified_call_instruction_validity (an_instruction)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			check_parenthesized_expression_validity (an_expression, current_context)
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached an_expression.parenthesis_call as l_parenthesis_call then
				check_qualified_call_expression_validity (l_parenthesis_call, current_context, Void)
				an_expression.set_index (l_parenthesis_call.index)
			else
				check_precursor_expression_validity (an_expression, current_context)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.parenthesis_call as l_parenthesis_call then
				check_qualified_call_instruction_validity (l_parenthesis_call)
			else
				check_precursor_instruction_validity (an_instruction)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			check_prefix_expression_validity (an_expression, current_context)
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached an_expression.parenthesis_call as l_parenthesis_call then
				check_qualified_call_expression_validity (l_parenthesis_call, current_context, Void)
				an_expression.set_index (l_parenthesis_call.index)
			else
				check_qualified_call_expression_validity (an_expression, current_context, Void)
			end
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.parenthesis_call as l_parenthesis_call then
				check_qualified_call_instruction_validity (l_parenthesis_call)
			else
				check_qualified_call_instruction_validity (an_instruction)
			end
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		do
			check_quantifier_expression_validity (a_expression, current_context)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			check_regular_integer_constant_validity (a_constant, current_context)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		do
			check_regular_manifest_string_validity (a_string, current_context)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			check_regular_real_constant_validity (a_constant, current_context)
		end

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		do
			check_repeat_instruction_validity (a_instruction)
		end

	process_result (an_expression: ET_RESULT)
			-- Process `an_expression'.
		do
			check_result_validity (an_expression, current_context)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS)
			-- Process `an_expression'.
		do
			check_result_address_validity (an_expression, current_context)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION)
			-- Process `an_instruction'.
		do
			check_retry_instruction_validity (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL)
			-- Process `a_symbol'.
		do
			has_fatal_error := False
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		do
			check_special_manifest_string_validity (a_string, current_context)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached an_expression.parenthesis_call as l_parenthesis_call then
				check_qualified_call_expression_validity (l_parenthesis_call, current_context, Void)
				an_expression.set_index (l_parenthesis_call.index)
			else
				check_static_call_expression_validity (an_expression, current_context)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.parenthesis_call as l_parenthesis_call then
				check_qualified_call_instruction_validity (l_parenthesis_call)
			else
				check_static_call_instruction_validity (an_instruction)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
			-- Process `an_expression'.
		do
			check_strip_expression_validity (an_expression, current_context)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Process `a_constant'.
		do
			check_true_constant_validity (a_constant, current_context)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			check_underscored_integer_constant_validity (a_constant, current_context)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			check_underscored_real_constant_validity (a_constant, current_context)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		do
			check_unique_attribute_validity (a_feature)
		end

	process_unqualified_call_expression (an_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached an_expression.parenthesis_call as l_parenthesis_call then
				check_qualified_call_expression_validity (l_parenthesis_call, current_context, Void)
				an_expression.set_index (l_parenthesis_call.index)
			else
				check_unqualified_call_expression_validity (an_expression, current_context)
			end
		end

	process_unqualified_call_instruction (an_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.parenthesis_call as l_parenthesis_call then
				check_qualified_call_instruction_validity (l_parenthesis_call)
			else
				check_unqualified_call_instruction_validity (an_instruction)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		do
			check_verbatim_string_validity (a_string, current_context)
		end

	process_void (an_expression: ET_VOID)
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
			--       f (a: ANY)
			--           require
			--               pre: g (a)
			--           deferred
			--           end
			--      g (a: ANY): BOOLEAN deferred end
			--    end
			--    class B
			--    inherit
			--        A
			--    feature
			--        f (a: STRING) do ... end
			--        g (a: STRING): BOOLEAN do ... end
			--    end
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_feature' is B.f and `current_feature_impl' is A.f
			-- (where the inherited precondition has been written).

	current_inline_agent: detachable ET_INLINE_AGENT
			-- Inline agent being processed if any, Void otherwise

	enclosing_inline_agents: DS_ARRAYED_LIST [ET_INLINE_AGENT]
			-- Enclosing inline agents of `current_inline_agent' if any

	current_closure: ET_CLOSURE
			-- Inner closure being processed
		do
			if attached current_inline_agent as l_current_inline_agent then
				Result := l_current_inline_agent
			else
				Result := current_feature
			end
		ensure
			current_closure_not_void: Result /= Void
			in_agent: current_inline_agent /= Void implies Result = current_inline_agent
			not_in_agent: current_inline_agent = Void implies Result = current_feature
		end

	current_closure_impl: ET_CLOSURE
			-- Inner closure where the code being processed has been written
		do
			if attached current_inline_agent as l_current_inline_agent then
				Result := l_current_inline_agent
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

	current_universe_impl: ET_UNIVERSE
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

	current_object_test_scope: ET_OBJECT_TEST_SCOPE
			-- Object-tests for which we are currently in the
			-- scope of their locals

	object_test_scope_builder: ET_OBJECT_TEST_SCOPE_BUILDER
			-- Object-tests local scope builder

feature {NONE} -- Iteration components

	current_iteration_cursor_types: DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_ITERATION_COMPONENT]
			-- Types of iteration cursors

	current_iteration_item_types: DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_ITERATION_COMPONENT]
			-- Types of iteration items (or of iteration cursors when using obsolete syntax)

	current_iteration_item_scope: ET_ITERATION_ITEM_SCOPE
			-- Iteration components for which we are currently in the
			-- scope of their iteration items

feature {NONE} -- Attachments

	build_assertions_attachment_scope (a_assertions: ET_ASSERTIONS)
			-- Build attachment scope of `a_assertions' in `current_attachment_scope'.
		require
			a_assertions_not_void: a_assertions /= Void
		local
			i, nb: INTEGER
		do
			nb := a_assertions.count
			from i := 1 until i > nb loop
				if attached a_assertions.assertion (i).expression as l_expression then
					attachment_scope_builder.build_scope (l_expression, current_attachment_scope)
				end
				i := i + 1
			end
		end

	build_preconditions_attachment_scope (a_feature: ET_FEATURE)
			-- Build attachment scope of flat version of the preconditions of
			-- `a_feature' in `current_attachment_scope'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_attachment_scope: like current_attachment_scope
			l_preconditions_attachment_scope: like current_attachment_scope
			l_count: INTEGER
			l_set: DS_HASH_TABLE [ET_ASSERTIONS, ET_FEATURE]
		do
			l_set := assertions_by_feature
			add_precursors_with_preconditions_recursive (a_feature, l_set)
			if attached a_feature.preconditions as l_preconditions then
				l_set.force_last (l_preconditions, a_feature)
			end
			l_count := l_set.count
			if l_count = 0 then
				-- No preconditions.
			elseif l_count = 1 then
				build_assertions_attachment_scope (l_set.first)
			else
				l_old_attachment_scope := current_attachment_scope
				current_attachment_scope := new_attachment_scope
				current_attachment_scope.copy_scope (l_old_attachment_scope)
				l_preconditions_attachment_scope := new_attachment_scope
				from
					l_set.start
					build_assertions_attachment_scope (l_set.item_for_iteration)
					l_preconditions_attachment_scope.copy_scope (current_attachment_scope)
				until
					l_set.is_last
				loop
					current_attachment_scope.copy_scope (l_old_attachment_scope)
					build_assertions_attachment_scope (l_set.item_for_iteration)
					l_preconditions_attachment_scope.merge_scope (current_attachment_scope)
					l_set.forth
				end
				free_attachment_scope (current_attachment_scope)
				current_attachment_scope := l_old_attachment_scope
				build_assertions_attachment_scope (l_set.item_for_iteration)
				current_attachment_scope.merge_scope (l_preconditions_attachment_scope)
				free_attachment_scope (l_preconditions_attachment_scope)
				l_set.wipe_out
			end
		end

	current_initialization_scope: ET_ATTACHMENT_SCOPE
			-- Initialization scopes, to determine whether a given entity
			-- (local variable, Result, attribute) can be considered as initialized
			-- (when declared as attached)

	current_attachment_scope: ET_ATTACHMENT_SCOPE
			-- Attachment scopes, to determine whether a given entity
			-- (local variable, Result, formal argument, stable attribute)
			-- can be considered as attached (when declared as detachable)

	attachment_scope_builder: ET_ATTACHMENT_SCOPE_BUILDER
			-- Attachment scope builder

	new_attachment_scope: ET_ATTACHMENT_SCOPE
			-- New attachment scope
		do
			if unused_attachment_scopes.is_empty then
				create Result.make
			else
				Result := unused_attachment_scopes.last
				unused_attachment_scopes.remove_last
			end
		ensure
			new_attachment_scope_not_void: Result /= Void
		end

	free_attachment_scope (a_attachment_scope: ET_ATTACHMENT_SCOPE)
			-- Free `a_attachment_scope' so that it can be reused.
		require
			a_attachment_scope_not_void: a_attachment_scope /= Void
		do
			unused_attachment_scopes.force_last (a_attachment_scope)
		end

	unused_attachment_scopes: DS_ARRAYED_LIST [ET_ATTACHMENT_SCOPE]
			-- Attachment scopes that are not currently used

	assertions_by_feature: DS_HASH_TABLE [ET_ASSERTIONS, ET_FEATURE]
			-- Assertions indexed by features.
			-- Used to collect the inherited preconditions,
			-- indexed by the features they have been written in.

feature {NONE} -- Assertions

	add_precursors_with_preconditions_recursive (a_feature: ET_FEATURE; a_set: DS_HASH_TABLE [ET_ASSERTIONS, ET_FEATURE])
			-- Add to `a_set', recursively, the precursors of `a_feature' which have a precondition.
		require
			a_feature_not_void: a_feature /= Void
			a_set_not_void: a_set /= Void
			no_void_precursors: not a_set.has_void
			no_void_preconditions: not a_set.has_void_item
		local
			i, nb: INTEGER
			l_other_precursor: ET_FEATURE
		do
			if attached a_feature.first_precursor as l_first_precursor then
				add_precursors_with_preconditions_recursive (l_first_precursor, a_set)
				if attached l_first_precursor.preconditions as l_preconditions then
					a_set.force_last (l_preconditions, l_first_precursor)
				end
				if attached a_feature.other_precursors as l_other_precursors then
					from
						i := 1
						nb := l_other_precursors.count
					until
						i > nb
					loop
						l_other_precursor := l_other_precursors.item (i)
						add_precursors_with_preconditions_recursive (l_other_precursor, a_set)
						if attached l_other_precursor.preconditions as l_preconditions then
							a_set.force_last (l_preconditions, l_other_precursor)
						end
						i := i + 1
					end
				end
			end
		ensure
			no_void_precursors: not a_set.has_void
			no_void_preconditions: not a_set.has_void_item
		end

	add_precursors_with_postconditions_recursive (a_feature: ET_FEATURE; a_set: DS_HASH_TABLE [ET_ASSERTIONS, ET_FEATURE])
			-- Add to `a_set', recursively, the precursors of `a_feature' which have a postcondition.
		require
			a_feature_not_void: a_feature /= Void
			a_set_not_void: a_set /= Void
			no_void_precursors: not a_set.has_void
			no_void_preconditions: not a_set.has_void_item
		local
			i, nb: INTEGER
			l_other_precursor: ET_FEATURE
		do
			if attached a_feature.first_precursor as l_first_precursor then
				add_precursors_with_postconditions_recursive (l_first_precursor, a_set)
				if attached l_first_precursor.postconditions as l_postconditions then
					a_set.force_last (l_postconditions, l_first_precursor)
				end
				if attached a_feature.other_precursors as l_other_precursors then
					from
						i := 1
						nb := l_other_precursors.count
					until
						i > nb
					loop
						l_other_precursor := l_other_precursors.item (i)
						add_precursors_with_postconditions_recursive (l_other_precursor, a_set)
						if attached l_other_precursor.postconditions as l_postconditions then
							a_set.force_last (l_postconditions, l_other_precursor)
						end
						i := i + 1
					end
				end
			end
		ensure
			no_void_precursors: not a_set.has_void
			no_void_postconditions: not a_set.has_void_item
		end

feature {NONE} -- Status report

	in_rescue: BOOLEAN
			-- Are we processing a rescue clause?

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

	in_static_feature: BOOLEAN
			-- Are we processing a feature which can be used in static calls
			-- (i.e. of the form {A}.f)?

feature -- Precursors

	precursor_queries: detachable DS_HASH_SET [ET_QUERY]
			-- Queries associated with precursor expressions succesfully processed
			-- will be added to this set when not Void

	precursor_procedures: detachable DS_HASH_SET [ET_PROCEDURE]
			-- Procedures associated with precursor instructions succesfully processed
			-- will be added to this set when not Void

	set_precursor_queries (a_query_set: like precursor_queries)
			-- Set `precursor_queries' to `a_query_set'.
		do
			precursor_queries := a_query_set
		ensure
			precursor_queries_set: precursor_queries = a_query_set
		end

	set_precursor_procedures (a_procedure_set: like precursor_procedures)
			-- Set `precursor_procedures' to `a_procedure_set'.
		do
			precursor_procedures := a_procedure_set
		ensure
			precursor_procedures_set: precursor_procedures = a_procedure_set
		end

feature {NONE} -- Choice constants

	character_choice_constant: ET_C1_CHARACTER_CONSTANT
			-- Character constant
		once
			create Result.make ({CHARACTER_32} 'a')
		ensure
			character_choice_constant_not_void: Result /= Void
		end

	integer_choice_constant: ET_REGULAR_INTEGER_CONSTANT
			-- Integer constant
		once
			create Result.make ("1", 1, False)
		ensure
			integer_choice_constant_not_void: Result /= Void
		end

feature {NONE} -- Indexing

	indexing_term_list: DS_ARRAYED_LIST [ET_INDEXING_TERM]
			-- List to store indexing terms

feature {NONE} -- Overloading (useful in .NET)

	keep_best_overloaded_features (a_features: DS_ARRAYED_LIST [ET_FEATURE]; a_name: ET_CALL_NAME; an_actuals: detachable ET_ACTUAL_ARGUMENTS; a_target_context: ET_NESTED_TYPE_CONTEXT; a_is_static_call, a_is_creation_call: BOOLEAN)
			-- Remove from `a_features' the features whose signature cannot
			-- accommodate `an_actuals'. As a result `a_features' can be
			-- empty if no feature is applicable.
			-- Then keep only the best matches. There can be several
			-- of them, in which case there is an ambiguity that should be
			-- reported by the caller of this feature. In that case, we keep
			-- the feature whose primary name is `a_name', if any.
			-- `a_target_context' is the context in which the formal argument
			-- types of features in `a_features' should be considered.
			-- `a_is_static_call' means that the features are expected to appear in a static call.
			-- `a_is_creation_call' means that the features are expected to appear in a creation call.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_void
			a_name_not_void: a_name /= Void
			a_target_context_not_void: a_target_context /= Void
		local
			l_actual_context: ET_NESTED_TYPE_CONTEXT
			l_formal_context1: ET_NESTED_TYPE_CONTEXT
			l_detachable_any_type: ET_CLASS_TYPE
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
			l_best_overloaded_features: DS_ARRAYED_LIST [ET_FEATURE]
		do
			has_fatal_error := False
			nb := a_features.count
			if an_actuals /= Void then
				nb_args := an_actuals.count
			end
			if nb > 1 then
					-- More than one feature with that name.
					-- Start to remove those with the wrong number of arguments,
					-- or features which are not declared as static in case of a static call.
				from i := nb until i < 1 loop
					if a_features.item (i).arguments_count /= nb_args then
						a_features.remove (i)
						nb := nb - 1
					elseif a_is_static_call and then (not attached {ET_DOTNET_FEATURE} a_features.item (i) as l_dotnet_feature or else not l_dotnet_feature.is_static) then
						a_features.remove (i)
						nb := nb - 1
					elseif a_is_creation_call then
-- TODO: remove non-creators
					end
					i := i - 1
				end
			end
			if nb > 1 and an_actuals /= Void and then nb_args > 0 then
				l_actual_context := new_context (current_type)
				l_detachable_any_type := current_universe.detachable_any_type
				l_best_overloaded_features := new_overloaded_features
				from j := 1 until j > nb_args loop
					l_actual := an_actuals.actual_argument (j)
					check_expression_validity (l_actual, l_actual_context, l_detachable_any_type)
					if has_fatal_error then
							-- Jump out of the loop.
						 j := nb_args + 1
					else
						l_same_type_mode := False
						l_conformance_mode := False
						l_conversion_mode := True
						from i := nb until i < 1 loop
							l_feature1 := a_features.item (i)
							if not attached l_feature1.arguments as l_formal_arguments1 then
									-- Internal error: we already removed from `a_features' all features
									-- which did not have the expected number of arguments.
								set_fatal_error
								error_handler.report_giaaa_error
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
							else
								l_type1 := l_formal_arguments1.formal_argument (j).type
								if l_actual_context.same_named_type (l_type1, a_target_context) then
										-- The type of the actual argument is the same as
										-- the type of the formal argument of `l_feature'.
									if l_same_type_mode then
										l_best_overloaded_features.force_last (l_feature1)
									else
										l_same_type_mode := True
										l_conformance_mode := False
										l_conversion_mode := False
										l_best_overloaded_features.wipe_out
										l_best_overloaded_features.force_last (l_feature1)
									end
								elseif l_actual_context.conforms_to_type (l_type1, a_target_context, system_processor) then
										-- The type of the actual argument conforms to
										-- the type of the formal argument of `l_feature1'.
									if l_same_type_mode then
										-- Do nothing.
									elseif l_conformance_mode then
										l_to_be_added := True
										k := l_best_overloaded_features.count
										from until k < 1 loop
											l_feature2 := l_best_overloaded_features.item (k)
											if not attached l_feature2.arguments as l_formal_arguments2 then
													-- Internal error: we already removed from `a_features' all features
													-- which did not have the expected number of arguments. So
													-- `l_best_overloaded_features' does not contain such features either.
												set_fatal_error
												error_handler.report_giaaa_error
													-- Remove this feature from the list.
												l_best_overloaded_features.remove (k)
											else
												l_type2 := l_formal_arguments2.formal_argument (j).type
												if l_type2.same_named_type (l_type1, a_target_context, a_target_context) then
														-- No difference between `l_feature1' and `l_feature2'.
														-- If `l_feature2' is considered as one of the best choices,
														-- `l_feature1' should be as well.
													k := 0 -- Jump out of the loop.
												elseif l_type2.conforms_to_type (l_type1, a_target_context, a_target_context, system_processor) then
														-- `l_feature2' is a better choice.
													l_to_be_added := False
													k := 0 -- Jump out of the loop.
												elseif l_type1.conforms_to_type (l_type2, a_target_context, a_target_context, system_processor) then
														-- `l_feature1' is a better choice.
													l_best_overloaded_features.remove (k)
												end
											end
											k := k - 1
										end
										if l_to_be_added then
											l_best_overloaded_features.force_last (l_feature1)
										end
									else
										l_same_type_mode := False
										l_conformance_mode := True
										l_conversion_mode := False
										l_best_overloaded_features.wipe_out
										l_best_overloaded_features.force_last (l_feature1)
									end
								else
									l_formal_context1 := a_target_context
									l_formal_context1.force_last (l_type1)
									if type_checker.convert_feature (l_actual_context, l_formal_context1) /= Void then
											-- The type of the actual argument converts to
											-- the type of the formal argument of `l_feature1'.
										if l_conversion_mode then
											l_best_overloaded_features.force_last (l_feature1)
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
								nb_all := l_best_overloaded_features.count
								from i := 1 until nb_one = nb_all loop
									if l_best_overloaded_features.has (a_features.item (i)) then
										nb_one := nb_one + 1
										a_features.swap (i, nb_one)
									end
									i := i + 1
								end
							else
								from i := 1 until i > nb_all loop
									if l_best_overloaded_features.has (a_features.item (i)) then
										i := i + 1
									else
										a_features.swap (i, nb_all)
										nb_all := nb_all - 1
									end
								end
								from i := nb_one + 1 until i > nb loop
									if l_best_overloaded_features.has (a_features.item (i)) then
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
						l_best_overloaded_features.wipe_out
					end
					l_actual_context.wipe_out
					j := j + 1
				end
				free_overloaded_features (l_best_overloaded_features)
				free_context (l_actual_context)
				if has_fatal_error then
					a_features.wipe_out
				elseif nb_all > 0 then
					a_features.keep_first (nb_all)
				elseif nb_one > 0 then
					a_features.keep_first (nb_one)
				else
					a_features.wipe_out
				end
			end
			nb := a_features.count
			if nb > 1 then
					-- Keep the one with the expected feature name.
				nb_all := 0
				from i := 1 until i > nb loop
					if a_features.item (i).extended_name.same_call_name (a_name) then
						nb_all := nb_all + 1
						a_features.swap (i, nb_all)
					end
					i := i + 1
				end
				if nb_all > 0 then
					a_features.keep_first (nb_all)
				end
			end
		ensure
			no_void_feature: not a_features.has_void
		end

	new_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- New list of overloaded procedures for a given name
			-- (useful in .NET)
		do
			if unused_overloaded_procedures_list.is_empty then
				create Result.make (20)
			else
				Result := unused_overloaded_procedures_list.last
				unused_overloaded_procedures_list.remove_last
			end
		ensure
			new_overloaded_procedures_not_void: Result /= Void
			is_empty: Result.is_empty
		end

	free_overloaded_procedures (a_overloaded_procedures: DS_ARRAYED_LIST [ET_PROCEDURE])
			-- Free `a_overloaded_procedures' so that it can be reused.
		require
			a_overloaded_procedures_not_void: a_overloaded_procedures /= Void
		do
			a_overloaded_procedures.wipe_out
			unused_overloaded_procedures_list.force_last (a_overloaded_procedures)
		end

	unused_overloaded_procedures_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_PROCEDURE]]
			-- List of not currently used lists of overloaded procedures for a given name
			-- (useful in .NET)
			-- (Procedure list are created once and for all and then used and
			-- reused by which ever feature which needs it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- a procedure list at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_procedures_list'.)

	new_overloaded_queries: DS_ARRAYED_LIST [ET_QUERY]
			-- New list of overloaded queries for a given name
			-- (useful in .NET)
		do
			if unused_overloaded_queries_list.is_empty then
				create Result.make (20)
			else
				Result := unused_overloaded_queries_list.last
				unused_overloaded_queries_list.remove_last
			end
		ensure
			new_overloaded_queries_not_void: Result /= Void
			is_empty: Result.is_empty
		end

	free_overloaded_queries (a_overloaded_queries: DS_ARRAYED_LIST [ET_QUERY])
			-- Free `a_overloaded_queries' so that it can be reused.
		require
			a_overloaded_queries_not_void: a_overloaded_queries /= Void
		do
			a_overloaded_queries.wipe_out
			unused_overloaded_queries_list.force_last (a_overloaded_queries)
		end

	unused_overloaded_queries_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_QUERY]]
			-- List of not currently used lists of overloaded queries for a given name
			-- (useful in .NET)
			-- (Query lists are created once and for all and then used and
			-- reused by which ever feature which needs it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- a query list at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_queries_list'.)

	new_overloaded_features: DS_ARRAYED_LIST [ET_FEATURE]
			-- New list of overloaded features for a given name
			-- (useful in .NET)
		do
			if unused_overloaded_features_list.is_empty then
				create Result.make (20)
			else
				Result := unused_overloaded_features_list.last
				unused_overloaded_features_list.remove_last
			end
		ensure
			new_overloaded_features_not_void: Result /= Void
			is_empty: Result.is_empty
		end

	free_overloaded_features (a_overloaded_features: DS_ARRAYED_LIST [ET_FEATURE])
			-- Free `a_overloaded_features' so that it can be reused.
		require
			a_overloaded_features_not_void: a_overloaded_features /= Void
		do
			a_overloaded_features.wipe_out
			unused_overloaded_features_list.force_last (a_overloaded_features)
		end

	unused_overloaded_features_list: DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_FEATURE]]
			-- List of not currently used lists of overloaded features for a given name
			-- (useful in .NET)
			-- (Feature lists are created once and for all and then used and
			-- reused by which ever feature which needs it. This avoid putting too
			-- much stress on the GC by creating a new object each time we need one.
			-- However it is possible that two different feature calls try to use
			-- a feature list at the same time. In that case we pick another
			-- one in the pool of unused lists `unused_overloaded_queries_list'.)

feature {NONE} -- Call infos

	new_call_info (a_context: ET_NESTED_TYPE_CONTEXT): TUPLE [query: detachable ET_QUERY; target_class: ET_CLASS; target_context: ET_NESTED_TYPE_CONTEXT]
			-- New call info
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			l_query: detachable ET_QUERY
		do
			if unused_call_infos.is_empty then
				Result := [l_query, tokens.unknown_class, a_context]
			else
				Result := unused_call_infos.last
				unused_call_infos.remove_last
				Result.query := l_query
				Result.target_class := tokens.unknown_class
				Result.target_context := a_context
			end
		ensure
			new_call_info_not_void: Result /= Void
			query_set: Result.query = Void
			target_class_set: Result.target_class = tokens.unknown_class
			target_context_set: Result.target_context = a_context
		end

	free_call_info (a_call_info: like new_call_info)
			-- Free `a_call_info' so that it can be reused.
		require
			a_call_info_not_void: a_call_info /= Void
		do
			unused_call_infos.force_last (a_call_info)
			a_call_info.query := Void
			a_call_info.target_class := tokens.unknown_class
			a_call_info.target_context := current_context
		end

	unused_call_infos: DS_ARRAYED_LIST [like new_call_info]
			-- Call infos that are not currently used

feature {NONE} -- Type contexts

	new_context (a_root_context: ET_BASE_TYPE): ET_NESTED_TYPE_CONTEXT
			-- New nested type context
		require
			a_root_context_not_void: a_root_context /= Void
			a_root_context_valid: a_root_context.is_valid_context
		do
			if unused_contexts.is_empty then
				create Result.make_with_capacity (a_root_context, 100)
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

	free_context (a_context: ET_NESTED_TYPE_CONTEXT)
			-- Free `a_context' so that it can be reused.
		require
			a_context_not_void: a_context /= Void
		do
			debug ("nested_type_context")
				if a_context.count > max_context_count then
					max_context_count := a_context.count
					max_context_capacity := max_context_capacity.max (a_context.capacity)
					error_handler.info_file.put_line (max_context_count.out + "/" + max_context_capacity.out + " " + current_class.upper_name + "." + current_feature.lower_name)
				elseif a_context.capacity > max_context_capacity then
					max_context_capacity := a_context.capacity
					error_handler.info_file.put_line (max_context_count.out + "/" + max_context_capacity.out + " " + current_class.upper_name + "." + current_feature.lower_name)
				end
			end
			unused_contexts.force_last (a_context)
			a_context.reset (tokens.unknown_class)
		end

	unused_contexts: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			-- Contexts that are not currently used

	max_context_count: INTEGER
			-- Maximum count found in nested context so far when calling `free_context'.
			-- Used in 'debug ("nested_type_context")' only.

	max_context_capacity: INTEGER
			-- Maximum capacity found in nested context so far when calling `free_context'.
			-- Used in 'debug ("nested_type_context")' only.

feature {NONE} -- Common ancestor type

	update_common_ancestor_type_list (a_type: ET_NESTED_TYPE_CONTEXT; a_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]; a_ignored: INTEGER)
			-- Add `a_type' to the end of `a_list' if it does not conform
			-- to any of the types already in the list.
			-- Remove from the list other types which conform to `a_type'.
			-- 'detachable' and/or 'separate' type marks can be added to any of the
			-- types involved if it makes conformance possible beween these types.
			-- The first `a_ignored' types in `a_list' are not taken into account
			-- (it's as if the list started at index 'a_ignored + 1').
			-- Free type contexts which have been removed from `a_list', and
			-- `a_type' if it has not beed added to the list.
			--
			-- Note: For more details about Common Ancestor Type, see:
			-- https://www.eiffel.org/doc/version/trunk/eiffel/Types#Common_ancestor_types
		require
			a_type_not_void: a_type /= Void
			a_list_not_void: a_list /= Void
			no_void_type: not a_list.has_void
			a_ignored_large_enough: a_ignored >= 0
			a_ignored_small_enough: a_ignored <= a_list.count
		local
			i, nb: INTEGER
			l_add_type: BOOLEAN
			l_other_type: ET_NESTED_TYPE_CONTEXT
		do
			l_add_type := True
			from
				i := a_ignored + 1
				nb := a_list.count
			until
				i > nb
			loop
				l_other_type := a_list.item (i)
				if a_type.conforms_to_context (l_other_type, system_processor) then
					l_add_type := False
						-- Jump out of the loop.
					i := nb + 1
				elseif l_other_type.conforms_to_context (a_type, system_processor) then
					free_context (l_other_type)
					a_list.remove (i)
					nb := nb - 1
				else
						-- Try with different attachment marks.
-- TODO: do the same thing with separateness marks.
					l_other_type.force_last (tokens.detachable_like_current)
					if a_type.conforms_to_context (l_other_type, system_processor) then
						l_add_type := False
							-- Jump out of the loop.
						i := nb + 1
					else
						l_other_type.remove_last
						a_type.force_last (tokens.detachable_like_current)
						if l_other_type.conforms_to_context (a_type, system_processor) then
							free_context (l_other_type)
							a_list.remove (i)
							nb := nb - 1
						else
							a_type.remove_last
							i := i + 1
						end
					end
				end
			end
			if l_add_type then
				a_list.force_last (a_type)
			else
				free_context (a_type)
			end
		ensure
			not_empty: a_list.count > a_ignored
			no_void_type: not a_list.has_void
		end

	free_common_ancestor_types (a_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]; a_ignored: INTEGER)
			-- Keep only the first `a_ignored' type contexts in `a_list'.
			-- Free all other type contexts.
		require
			a_list_not_void: a_list /= Void
			no_void_type: not a_list.has_void
			a_ignored_large_enough: a_ignored >= 0
			a_ignored_small_enough: a_ignored <= a_list.count
		local
			i, nb: INTEGER
		do
			from
				i := a_ignored + 1
				nb := a_list.count
			until
				i > nb
			loop
				free_context (a_list.item (i))
				i := i + 1
			end
			a_list.keep_first (a_ignored)
		ensure
			new_count: a_list.count = a_ignored
			no_void_type: not a_list.has_void
		end

	common_ancestor_type_list: DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT]
			-- List used when computing Common Ancestor Types
			--
			-- Note: For more details about Common Ancestor Type, see:
			-- https://www.eiffel.org/doc/version/trunk/eiffel/Types#Common_ancestor_types

feature {NONE} -- Default creation call

	default_creation_call: ET_QUALIFIED_CALL
			-- Creation call to 'default_create'

	default_creation_call_name: ET_IDENTIFIER
			-- Call name of `default_creation_call'

feature {NONE} -- Feature checker

	feature_checker: ET_FEATURE_CHECKER
			-- Feature checker to be used when processing preconditions
			-- to get the attachment scope
			--
			-- May be `Current'.
		do
			Result := Current
		ensure
			feature_checker_not_void: Result /= Void
		end

feature {NONE} -- Constants

	dummy_feature: ET_FEATURE
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
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
	indexing_term_list_not_void: indexing_term_list /= Void
	no_void_indexing_term: not indexing_term_list.has_void
	unused_overloaded_procedures_list_not_void: unused_overloaded_procedures_list /= Void
	no_void_unused_overloaded_procedures: not unused_overloaded_procedures_list.has_void
	-- SE 1.2r7 crashes when compiling this line:
	-- empty_unused_overloaded_procedures: unused_overloaded_procedures_list.for_all (agent {DS_ARRAYED_LIST [ET_PROCEDURE]}.is_empty)
	unused_overloaded_queries_list_not_void: unused_overloaded_queries_list /= Void
	no_void_unused_overloaded_queries: not unused_overloaded_queries_list.has_void
	-- SE 1.2r7 crashes when compiling this line:
	-- empty_unused_overloaded_queries: unused_overloaded_queries_list.for_all (agent {DS_ARRAYED_LIST [ET_QUERY]}.is_empty)
	unused_overloaded_features_list_not_void: unused_overloaded_features_list /= Void
	no_void_unused_overloaded_features: not unused_overloaded_features_list.has_void
	-- SE 1.2r7 crashes when compiling this line:
	-- empty_unused_overloaded_features: unused_overloaded_features_list.for_all (agent {DS_ARRAYED_LIST [ET_FEATURE]}.is_empty)
	current_context_not_void: current_context /= Void
	unused_contexts_not_void: unused_contexts /= Void
	no_void_unused_context: not unused_contexts.has_void
	current_target_type_not_void: current_target_type /= Void
	default_creation_call_not_void: default_creation_call /= Void
	default_creation_call_name_not_void: default_creation_call_name /= Void
	default_creation_call_name_definition: default_creation_call_name = default_creation_call.name
		-- Object-tests.
	current_object_test_types_not_void: current_object_test_types /= Void
	no_void_object_test_type: not current_object_test_types.has_void_item
	current_object_test_scope_not_void: current_object_test_scope /= Void
	object_test_scope_builder_not_void: object_test_scope_builder /= Void
		-- Iteration components.
	current_iteration_cursor_types_not_void: current_iteration_cursor_types /= Void
	no_void_iteration_cursor_type: not current_iteration_cursor_types.has_void_item
	no_void_cursor_type_iteration_component: not current_iteration_cursor_types.has_void
	current_iteration_item_types_not_void: current_iteration_item_types /= Void
	no_void_iteration_item_type: not current_iteration_item_types.has_void_item
	no_void_item_type_iteration_component: not current_iteration_item_types.has_void
	current_iteration_item_scope_not_void: current_iteration_item_scope /= Void
		-- Attachments.
	current_initialization_scope_not_void: current_initialization_scope /= Void
	current_attachment_scope_not_void: current_attachment_scope /= Void
	attachment_scope_builder_not_void: attachment_scope_builder /= Void
	unused_attachment_scopes_not_void: unused_attachment_scopes /= Void
	no_void_unused_attachment_scope: not unused_attachment_scopes.has_void
	assertions_by_feature_not_void: assertions_by_feature /= Void
	no_void_assertion_by_feature: not assertions_by_feature.has_void_item
	no_void_fetaure_for_assertion: not assertions_by_feature.has_void
		-- Common Ancestor Types.
	common_ancestor_type_list_not_void: common_ancestor_type_list /= Void
	no_void_common_ancestor_type: not common_ancestor_type_list.has_void
		-- VAPE validity check.
	vape_non_descendant_clients_not_void: vape_non_descendant_clients /= Void
	vape_creation_clients_not_void: vape_creation_clients /= Void
	vape_client_not_void: vape_client /= Void
		-- Adapted base classes.
	unused_adapted_base_classes_not_void: unused_adapted_base_classes /= Void
	no_void_adapted_base_classes: not unused_adapted_base_classes.has_void
	adapted_base_class_checker_not_void: adapted_base_class_checker /= Void
		-- Call infos.
	unused_call_infos_not_void: unused_call_infos /= Void
	no_void_unused_call_info: not unused_call_infos.has_void

end
