indexing

	description:

		"Eiffel expression type finders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009/10/25 $"
	revision: "$Revision: #6 $"

class ET_EXPRESSION_TYPE_FINDER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_bit_constant,
			process_binary_integer_constant,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_convert_builtin_expression,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_current,
			process_current_address,
			process_do_function_inline_agent,
			process_do_procedure_inline_agent,
			process_equality_expression,
			process_expression_address,
			process_external_function_inline_agent,
			process_external_procedure_inline_agent,
			process_false_constant,
			process_feature_address,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_infix_cast_expression,
			process_infix_expression,
			process_manifest_array,
			process_manifest_tuple,
			process_manifest_type,
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_octal_integer_constant,
			process_old_expression,
			process_old_object_test,
			process_once_function_inline_agent,
			process_once_manifest_string,
			process_once_procedure_inline_agent,
			process_parenthesized_expression,
			process_precursor_expression,
			process_prefix_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_result,
			process_result_address,
			process_special_manifest_string,
			process_static_call_expression,
			process_strip_expression,
			process_true_constant,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_verbatim_string,
			process_void
		end

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
				-- Type contexts.
			create unused_contexts.make (20)
			current_context := new_context (current_type)
			current_target_type := tokens.unknown_class
			free_context (current_context)
		end

feature -- Basic operations

	find_expression_type_in_feature (a_expression: ET_EXPRESSION; a_feature: ET_FEATURE; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Expression `a_expression' (whose possible attachment target is of type
			-- `a_target_type') appears in the body of `a_feature' and is viewed from
			-- `a_context' (`a_feature' is a feature of the root context of `a_context').
			-- Alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_feature' has been successfully checked
			-- in the context of `a_context.root_context' (using ET_FEATURE_CHECKER for example).
			-- Otherwise internal errors may be reported (using ET_ERROR_HANDLER.report_giaaa_error)
			-- if `a_feature' has not been checked or if `internal_error_enabled' has been set.
		require
			a_expression_not_void: a_expression /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_target_type: ET_TYPE_CONTEXT
			old_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			old_feature_impl := current_feature_impl
			current_feature_impl := a_feature.implementation_feature
			old_feature := current_feature
			current_feature := a_feature
			old_type := current_type
			current_type := a_context.root_context
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			old_context := current_context
			current_context := a_context
			old_target_type := current_target_type
			current_target_type := a_target_type
			a_expression.process (Current)
			current_target_type := old_target_type
			current_context := old_context
			current_class := old_class
			current_type := old_type
			current_class_impl := old_class_impl
			current_feature := old_feature
			current_feature_impl := old_feature_impl
		end

	find_expression_type_in_agent (a_expression: ET_EXPRESSION; a_agent: ET_INLINE_AGENT; a_feature: ET_STANDALONE_CLOSURE; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Expression `a_expression' (whose possible attachment target is of type
			-- `a_target_type') appears in inline agent `a_agent' in the body of feature
			-- or invariant `a_feature' and is viewed from `a_context' (`a_feature' is
			-- a feature of the root context of `a_context').
			-- Alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_feature' has been successfully checked
			-- in the context of `a_context.root_context' (using ET_FEATURE_CHECKER for example).
			-- Otherwise internal errors may be reported (using ET_ERROR_HANDLER.report_giaaa_error)
			-- if `a_feature' has not been checked or if `internal_error_enabled' has been set.
		require
			a_expression_not_void: a_expression /= Void
			a_agent_not_void: a_agent /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_target_type: ET_TYPE_CONTEXT
			old_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			current_inline_agent := a_agent
			old_feature_impl := current_feature_impl
			current_feature_impl := a_feature.implementation_feature
			old_feature := current_feature
			current_feature := a_feature
			old_type := current_type
			current_type := a_context.root_context
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_feature.implementation_class
			old_context := current_context
			current_context := a_context
			old_target_type := current_target_type
			current_target_type := a_target_type
			a_expression.process (Current)
			current_target_type := old_target_type
			current_context := old_context
			current_class := old_class
			current_type := old_type
			current_class_impl := old_class_impl
			current_feature := old_feature
			current_feature_impl := old_feature_impl
			current_inline_agent := Void
		end

	find_expression_type_in_precondition (a_expression: ET_EXPRESSION; a_feature_impl, a_feature: ET_FEATURE; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Expression `a_expression' (whose possible attachment target is of type
			-- `a_target_type') appears in the precondition of `a_feature' (written in
			-- `a_feature_impl') and is viewed from `a_context' (`a_feature' is a feature
			-- of the root context of `a_context').
			-- `a_feature' and `a_feature_impl' are assumed to have been successfully
			-- checked (using ET_FEATURE_CHECKER for example).
			-- Alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_feature' has been successfully checked
			-- in the context of `a_context.root_context' as well as `a_feature_impl'
			-- in the context of `a_feature_impl.implementation_class' (using
			-- ET_FEATURE_CHECKER for example). Otherwise internal errors may be
			-- reported (using ET_ERROR_HANDLER.report_giaaa_error) if `a_feature' or
			-- `a_feature_impl' has not been checked or if `internal_error_enabled'
			-- has been set.
		require
			a_expression_not_void: a_expression /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_target_type: ET_TYPE_CONTEXT
			old_context: ET_NESTED_TYPE_CONTEXT
			old_in_assertion: BOOLEAN
			old_in_precondition: BOOLEAN
		do
			reset_fatal_error (False)
			old_feature_impl := current_feature_impl
			current_feature_impl := a_feature_impl.implementation_feature
			old_feature := current_feature
			current_feature := a_feature
			old_type := current_type
			current_type := a_context.root_context
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_feature_impl.implementation_class
			old_context := current_context
			current_context := a_context
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_in_assertion := in_assertion
			in_assertion := True
			old_in_precondition := in_precondition
			in_precondition := True
			a_expression.process (Current)
			in_assertion := old_in_assertion
			in_precondition := old_in_precondition
			current_target_type := old_target_type
			current_context := old_context
			current_class := old_class
			current_type := old_type
			current_class_impl := old_class_impl
			current_feature := old_feature
			current_feature_impl := old_feature_impl
		end

	find_expression_type_in_postcondition (a_expression: ET_EXPRESSION; a_feature_impl, a_feature: ET_FEATURE; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Expression `a_expression' (whose possible attachment target is of type
			-- `a_target_type') appears in the postcondition of `a_feature' (written in
			-- `a_feature_impl') and is viewed from `a_context' (`a_feature' is a feature
			-- of the root context of `a_context').
			-- Alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_feature' has been successfully checked
			-- in the context of `a_context.root_context' as well as `a_feature_impl'
			-- in the context of `a_feature_impl.implementation_class' (using
			-- ET_FEATURE_CHECKER for example). Otherwise internal errors may be
			-- reported (using ET_ERROR_HANDLER.report_giaaa_error) if `a_feature' or
			-- `a_feature_impl' has not been checked or if `internal_error_enabled'
			-- has been set.
		require
			a_expression_not_void: a_expression /= Void
			a_feature_impl_not_void: a_feature_impl /= Void
			a_feature_not_void: a_feature /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_target_type: ET_TYPE_CONTEXT
			old_context: ET_NESTED_TYPE_CONTEXT
			old_in_assertion: BOOLEAN
			old_in_postcondition: BOOLEAN
		do
			reset_fatal_error (False)
			old_feature_impl := current_feature_impl
			current_feature_impl := a_feature_impl.implementation_feature
			old_feature := current_feature
			current_feature := a_feature
			old_type := current_type
			current_type := a_context.root_context
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_feature_impl.implementation_class
			old_context := current_context
			current_context := a_context
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_in_assertion := in_assertion
			in_assertion := True
			old_in_postcondition := in_postcondition
			in_postcondition := True
			a_expression.process (Current)
			in_assertion := old_in_assertion
			in_postcondition := old_in_postcondition
			current_target_type := old_target_type
			current_context := old_context
			current_class := old_class
			current_type := old_type
			current_class_impl := old_class_impl
			current_feature := old_feature
			current_feature_impl := old_feature_impl
		end

	find_expression_type_in_invariant (a_expression: ET_EXPRESSION; a_invariant: ET_INVARIANTS; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Expression `a_expression' (whose possible attachment target is of type
			-- `a_target_type') appears in `a_invariant' and is viewed from `a_context'
			-- (`a_invariant' is an invariant of the root context of `a_context').
			-- Alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_invariant' has been successfully checked
			-- in the context of `a_context.root_context' (using ET_FEATURE_CHECKER for example).
			-- Otherwise internal errors may be reported (using ET_ERROR_HANDLER.report_giaaa_error)
			--  if `a_invariant' has not been checked or if `internal_error_enabled' has been set.
		require
			a_expression_not_void: a_expression /= Void
			a_invariant_not_void: a_invariant /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
			a_target_type_not_void: a_target_type /= Void
			valid_target_context: a_target_type.is_valid_context
		local
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
			old_target_type: ET_TYPE_CONTEXT
			old_context: ET_NESTED_TYPE_CONTEXT
			old_in_assertion: BOOLEAN
			old_in_invariant: BOOLEAN
		do
			reset_fatal_error (False)
			old_feature_impl := current_feature_impl
			current_feature_impl := a_invariant
			old_feature := current_feature
			current_feature := a_invariant
			old_type := current_type
			current_type := a_context.root_context
			old_class := current_class
			current_class := current_type.base_class
			old_class_impl := current_class_impl
			current_class_impl := a_invariant.implementation_class
			old_context := current_context
			current_context := a_context
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_in_assertion := in_assertion
			in_assertion := True
			old_in_invariant := in_invariant
			in_invariant := True
			a_expression.process (Current)
			in_assertion := old_in_assertion
			in_invariant := old_in_invariant
			current_target_type := old_target_type
			current_context := old_context
			current_class := old_class
			current_type := old_type
			current_class_impl := old_class_impl
			current_feature := old_feature
			current_feature_impl := old_feature_impl
		end

feature -- Status report

	internal_error_enabled: BOOLEAN
			-- Should an internal error be reported even when errors have already
			-- been reported on the feature being processed?

feature -- Status setting

	set_internal_error_enabled (b: BOOLEAN) is
			-- Set `internal_error_enabled' to `b'.
		do
			internal_error_enabled := b
		ensure
			internal_error_enabled_set: internal_error_enabled = b
		end

feature {NONE} -- Expression processing

	find_binary_integer_constant_type (a_constant: ET_BINARY_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_integer_constant_type (a_constant, a_context)
		end

	find_bit_constant_type (a_constant: ET_BIT_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			reset_fatal_error (False)
			create l_integer_constant.make ((a_constant.literal.count - 1).out)
			create l_type.make (l_integer_constant, tokens.unknown_class)
			a_context.force_last (l_type)
		end

	find_bracket_expression_type (an_expression: ET_BRACKET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_qualified_call_expression_type (an_expression, a_context)
		end

	find_c1_character_constant_type (a_constant: ET_C1_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_character_constant_type (a_constant, a_context)
		end

	find_c2_character_constant_type (a_constant: ET_C2_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_character_constant_type (a_constant, a_context)
		end

	find_c3_character_constant_type (a_constant: ET_C3_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_character_constant_type (a_constant, a_context)
		end

	find_call_expression_type (an_expression: ET_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			if an_expression.is_qualified_call then
				find_qualified_call_expression_type (an_expression, a_context)
			else
				find_unqualified_call_expression_type (an_expression, a_context)
			end
		end

	find_character_constant_type (a_constant: ET_CHARACTER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			reset_fatal_error (False)
			l_type := a_constant.type
			if l_type = Void then
				l_type := current_universe_impl.character_type
			end
			a_context.force_last (l_type)
		end

	find_convert_builtin_expression_type (an_expression: ET_CONVERT_BUILTIN_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
		do
			reset_fatal_error (False)
			l_type := an_expression.type
			a_context.force_last (l_type)
		end

	find_convert_from_expression_type (an_expression: ET_CONVERT_FROM_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_creation_expression_type (an_expression, a_context)
		end

	find_convert_to_expression_type (an_expression: ET_CONVERT_TO_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_qualified_call_expression_type (an_expression, a_context)
		end

	find_create_expression_type (an_expression: ET_CREATION_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_creation_expression_type (an_expression, a_context)
		end

	find_creation_expression_type (an_expression: ET_CREATION_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_creation_type: ET_TYPE
		do
			reset_fatal_error (False)
			l_creation_type := an_expression.type
			a_context.force_last (l_creation_type)
		end

	find_current_type (an_expression: ET_CURRENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_type)
		end

	find_current_address_type (an_expression: ET_CURRENT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			reset_fatal_error (False)
			l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
			if l_typed_pointer_class.actual_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation: the type of '$Current' is 'TYPED_POINTER [like Current]'.
				create l_actuals.make_with_capacity (1)
-- TODO: shouldn't we use `tokens.like_current' instead of `current_type'.
				l_actuals.put_first (current_type)
				create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
				a_context.force_last (l_typed_pointer_type)
			else
					-- Use the ETL2 implementation: the type of '$Current' is POINTER.
				a_context.force_last (current_universe_impl.pointer_type)
			end
		end

	find_equality_expression_type (an_expression: ET_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_universe_impl.boolean_type)
		end

	find_expression_address_type (an_expression: ET_EXPRESSION_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			reset_fatal_error (False)
			l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
			if l_typed_pointer_class.actual_class.is_preparsed then
					-- Class TYPED_POINTER has been found in the universe.
					-- Use ISE's implementation: the type of '$(expr)' is 'TYPED_POINTER [<type-of-expr>]'.
				find_expression_type (an_expression.expression, a_context, current_system.any_type)
				if not has_fatal_error then
					if not a_context.is_empty then
-- TODO: the type might not be accurate if a_context.count /= 1
-- Same thing in ET_FEATURE_CHECKER
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (a_context.last)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						a_context.remove_last
						a_context.put_last (l_typed_pointer_type)
					else
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (a_context.root_context)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						a_context.force_last (l_typed_pointer_type)
					end
				end
			else
					-- Use the ETL2 implementation: the type of '$(expr)' is POINTER.
				a_context.force_last (current_universe_impl.pointer_type)
			end
		end

	find_false_constant_type (a_constant: ET_FALSE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_universe_impl.boolean_type)
		end

	find_feature_address_type (an_expression: ET_FEATURE_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			l_identifier: ET_IDENTIFIER
			l_arguments: ET_FORMAL_ARGUMENT_LIST
			l_argument: ET_FORMAL_ARGUMENT
			l_type: ET_TYPE
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_local: ET_LOCAL_VARIABLE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
			l_object_test: ET_NAMED_OBJECT_TEST
			l_object_tests: ET_OBJECT_TEST_LIST
			l_class_impl: ET_CLASS
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif l_name.is_argument then
					-- This is of the form '$argument'.
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
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				elseif l_seed < 1 or l_seed > l_arguments.count then
						-- Internal error.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_argument := l_arguments.formal_argument (l_seed)
					l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
					if l_typed_pointer_class.actual_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation: the type of '$argument' is 'TYPED_POINTER [<type-of-argument>]'.
						l_type := l_argument.type
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (l_type)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						a_context.force_last (l_typed_pointer_type)
					else
							-- Use the ETL2 implementation: the type of '$argument' is POINTER.
						a_context.force_last (current_universe_impl.pointer_type)
					end
				end
			elseif l_name.is_local then
					-- This is of the form '$local'.
				l_locals := current_closure_impl.locals
				if l_locals = Void then
						-- Internal error.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				elseif l_seed < 1 or l_seed > l_locals.count then
						-- Internal error.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_local := l_locals.local_variable (l_seed)
					l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
					if l_typed_pointer_class.actual_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation: the type of '$local' is 'TYPED_POINTER [<type-of-local>]'.
						l_type := l_local.type
						create l_actuals.make_with_capacity (1)
						l_actuals.put_first (l_type)
						create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
						a_context.force_last (l_typed_pointer_type)
					else
							-- Use the ETL2 implementation: the type of '$local' is POINTER.
						a_context.force_last (current_universe_impl.pointer_type)
					end
				end
			elseif l_name.is_object_test_local then
				l_object_tests := current_closure_impl.object_tests
				if l_object_tests = Void then
						-- Internal error.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				elseif l_seed < 1 or l_seed > l_object_tests.count then
						-- Internal error.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_object_test := l_object_tests.object_test (l_seed)
					l_identifier ?= l_name
					check is_object_test_local: l_identifier /= Void end
					l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
					if l_typed_pointer_class.actual_class.is_preparsed then
							-- Class TYPED_POINTER has been found in the universe.
							-- Use ISE's implementation: the type of '$object_test_local' is
							-- 'TYPED_POINTER [<type-of-object_test_local>]'.
						l_type := l_object_test.type
						if l_type /= Void then
							create l_actuals.make_with_capacity (1)
							l_actuals.put_first (l_type)
							create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
							a_context.force_last (l_typed_pointer_type)
						else
							find_expression_type (l_object_test.expression, a_context, current_system.any_type)
							if not has_fatal_error then
								create l_actuals.make_with_capacity (1)
								l_actuals.put_first (tokens.like_current)
								create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
								a_context.force_last (l_typed_pointer_type)
							end
						end
					else
							-- Use the ETL2 implementation: the type of '$object_test_local' is POINTER.
						a_context.force_last (current_universe_impl.pointer_type)
					end
				end
			else
					-- This is of the form '$feature_name'.
				l_procedure := current_class.seeded_procedure (l_seed)
				if l_procedure /= Void then
						-- $feature_name is of type POINTER, even
						-- in ISE and its TYPED_POINTER support.
					a_context.force_last (current_universe_impl.pointer_type)
				else
					l_query := current_class.seeded_query (l_seed)
					if l_query /= Void then
						if l_query.is_attribute then
							l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
							if l_typed_pointer_class.actual_class.is_preparsed then
									-- Class TYPED_POINTER has been found in the universe.
									-- Use ISE's implementation: the type of '$attribute' is 'TYPED_POINTER [<type-of-attribute>]'.
								l_type := l_query.type
								create l_actuals.make_with_capacity (1)
								l_actuals.put_first (l_type)
								create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
								a_context.force_last (l_typed_pointer_type)
							else
									-- Use the ETL2 implementation: the type of '$attribute' is POINTER.
								a_context.force_last (current_universe_impl.pointer_type)
							end
						else
								-- $feature_name is of type POINTER, even
								-- in ISE and its TYPED_POINTER support.
							a_context.force_last (current_universe_impl.pointer_type)
						end
					else
							-- Internal error: if we got a seed, `l_query' should not be void.
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			end
		end

	find_formal_argument_type (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
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
		do
			reset_fatal_error (False)
			if current_inline_agent /= Void then
				l_arguments := current_inline_agent.formal_arguments
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
				l_arguments := current_feature.arguments
			end
			l_seed := a_name.seed
			if l_arguments = Void then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif l_seed < 1 or l_seed > l_arguments.count then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_formal := l_arguments.formal_argument (l_seed)
				l_type := l_formal.type
				a_context.force_last (l_type)
			end
		end

	find_hexadecimal_integer_constant_type (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_integer_constant_type (a_constant, a_context)
		end

	find_infix_cast_expression_type (an_expression: ET_INFIX_CAST_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
		do
			reset_fatal_error (False)
			l_type := an_expression.type
			a_context.force_last (l_type)
		end

	find_infix_expression_type (an_expression: ET_INFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_name: ET_CALL_NAME
			l_target: ET_EXPRESSION
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_type: ET_TYPE
			l_seed: INTEGER
			l_actual: ET_EXPRESSION
			l_like: ET_LIKE_FEATURE
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_target := an_expression.left
			l_seed := l_name.seed
			find_expression_type (l_target, a_context, current_system.any_type)
			if has_fatal_error then
				-- Do nothing.
			elseif l_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_class := a_context.base_class
				l_query := l_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, the `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
					l_type := l_query.type
					l_like ?= l_type
					if l_like /= Void and then l_like.is_like_argument and l_query.arguments_count = 1 then
						l_formal_context := new_context (current_type)
						l_formal_context.copy_type_context (a_context)
						l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
						a_context.wipe_out
						l_actual := an_expression.right
						find_expression_type (l_actual, a_context, l_formal_context)
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
						end
					else
						a_context.force_last (l_type)
					end
				end
			end
		end

	find_integer_constant_type (a_constant: ET_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			reset_fatal_error (False)
			l_type := a_constant.type
			if l_type = Void then
				l_type := current_universe_impl.integer_type
			end
			a_context.force_last (l_type)
		end

	find_local_variable_type (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
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
			reset_fatal_error (False)
			l_locals := current_closure_impl.locals
			l_seed := a_name.seed
			if l_locals = Void then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif l_seed < 1 or l_seed > l_locals.count then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_local := l_locals.local_variable (l_seed)
				l_type := l_local.type
				a_context.force_last (l_type)
			end
		end

	find_manifest_array_type (an_expression: ET_MANIFEST_ARRAY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			i, nb: INTEGER
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
		do
			reset_fatal_error (False)
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
					find_expression_type (an_expression.expression (i), l_expression_context, l_parameter_context)
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
							if type_checker.convert_feature (l_expression_context, l_parameter_context) = Void then
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
-- TODO: remove convert features from AST.
								l_array_type := Void
							else
-- TODO: insert convert feature in AST.
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
					find_expression_type (an_expression.expression (i), l_expression_context, any_type)
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
				a_context.force_last (l_array_type)
			elseif l_item_type = Void then
					-- This is an empty manifest array: '<< >>'. We have no way to
					-- find out the type of the parameter, so we use 'ARRAY [ANY]'.
				l_array_type := current_system.array_any_type
				a_context.force_last (l_array_type)
			elseif hybrid_type then
					-- There are at least two items which don't have the same type.
					-- Use 'ARRAY [ANY]' in that type.
-- TODO: we could do better that 'ARRAY [ANY]', for example choosing one of the
-- common ancestors of these two types. But which one to choose? ETL2 does not say.
				l_array_type := current_system.array_any_type
				a_context.force_last (l_array_type)
			else
					-- All items of the same type. So the manifest array will be
					-- an array of that type.
				create l_actuals.make_with_capacity (1)
				l_actuals.put_first (l_item_type)
				create l_generic_class_type.make (Void, array_class.name, l_actuals, array_class)
				a_context.force_last (l_generic_class_type)
			end
		end

	find_manifest_string_type (a_string: ET_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			reset_fatal_error (False)
			l_type := a_string.type
			if l_type = Void then
				l_type := current_universe_impl.string_type
			end
			a_context.force_last (l_type)
		end

	find_manifest_tuple_type (an_expression: ET_MANIFEST_TUPLE; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			reset_fatal_error (False)
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
				find_expression_type (an_expression.expression (i), l_expression_context, any_type)
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
				find_expression_type (an_expression.expression (i), l_expression_context, l_parameter_context)
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
				a_context.force_last (l_tuple_type)
			end
		end

	find_manifest_type_type (an_expression: ET_MANIFEST_TYPE; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			reset_fatal_error (False)
			l_type := an_expression.type
-- TODO: I think that the formal generic parameters of `l_type' need to
-- be resolved in the context of `current_type'.
			l_type_class := current_universe_impl.type_any_type.named_base_class
			create l_actuals.make_with_capacity (1)
			l_actuals.put_first (l_type)
			create l_type_type.make (Void, l_type_class.name, l_actuals, l_type_class)
			a_context.force_last (l_type_type)
		end

	find_object_equality_expression_type (an_expression: ET_OBJECT_EQUALITY_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_universe_impl.boolean_type)
		end

	find_object_test_type (an_expression: ET_OBJECT_TEST; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_universe_impl.boolean_type)
		end

	find_object_test_local_type (a_name: ET_IDENTIFIER; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_name' appears.
			-- It will be altered on exit to represent the type of `a_name'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_name_not_void: a_name /= Void
			a_name_object_test_local: a_name.is_object_test_local
			a_context_not_void: a_context /= Void
		local
			l_seed: INTEGER
			l_type: ET_TYPE
			l_object_test: ET_NAMED_OBJECT_TEST
			l_object_tests: ET_OBJECT_TEST_LIST
		do
			reset_fatal_error (False)
			l_seed := a_name.seed
			l_object_tests := current_closure_impl.object_tests
			if l_object_tests = Void then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif l_seed < 1 or l_seed > l_object_tests.count then
					-- Internal error.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_object_test := l_object_tests.object_test (l_seed)
				l_type := l_object_test.type
				if l_type /= Void then
					a_context.force_last (l_type)
				else
					find_expression_type (l_object_test.expression, a_context, current_system.any_type)
				end
			end
		end

	find_octal_integer_constant_type (a_constant: ET_OCTAL_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_integer_constant_type (a_constant, a_context)
		end

	find_old_expression_type (an_expression: ET_OLD_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			find_expression_type (l_expression, a_context, current_target_type)
		end

	find_once_manifest_string_type (an_expression: ET_ONCE_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			find_expression_type (l_string, a_context, current_target_type)
		end

	find_parenthesized_expression_type (an_expression: ET_PARENTHESIZED_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			find_expression_type (l_expression, a_context, current_target_type)
		end

	find_precursor_expression_type (an_expression: ET_PRECURSOR_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_query: ET_QUERY
			l_parent_type: ET_BASE_TYPE
			l_class: ET_CLASS
			l_type: ET_TYPE
		do
			reset_fatal_error (False)
			l_parent_type := an_expression.parent_type
			if l_parent_type = Void then
					-- Internal error: the Precursor construct should already have been
					-- resolved when flattening the features of `current_class_impl'.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_precursor_keyword := an_expression.precursor_keyword
				l_class := l_parent_type.base_class
				l_query := l_class.seeded_query (l_precursor_keyword.seed)
				if l_query = Void then
						-- Internal error: the Precursor construct should already have been
						-- resolved when flattening the features of `current_class_impl'.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
-- TODO: like argument.
					l_type := l_query.type
					a_context.force_last (l_type)
				end
			end
		end

	find_prefix_expression_type (an_expression: ET_PREFIX_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_qualified_call_expression_type (an_expression, a_context)
		end

	find_qualified_call_expression_type (a_call: ET_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			l_actuals: ET_ACTUAL_ARGUMENTS
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_type: ET_TYPE
			l_seed: INTEGER
			l_like: ET_LIKE_FEATURE
			l_actual: ET_EXPRESSION
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			l_target := a_call.target
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_seed := l_name.seed
			find_expression_type (l_target, a_context, current_system.any_type)
			if has_fatal_error then
				-- Do nothing.
			elseif l_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif l_name.is_tuple_label then
				if l_seed > a_context.base_type_actual_count then
						-- Internal error: the index of the labeled
						-- actual parameter cannot be out of bound because
						-- for a Tuple type to conform to another Tuple type
						-- it needs to have more actual parameters.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_class := a_context.base_class
					l_type := l_class.formal_parameter_type (l_seed)
					a_context.force_last (l_type)
				end
			else
				l_class := a_context.base_class
				l_query := l_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_type := l_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
					l_like ?= l_type
					if l_like /= Void and then l_like.is_like_argument and l_query.arguments_count = 1 then
						if l_actuals /= Void and then l_actuals.count = 1 then
							l_formal_context := new_context (current_type)
							l_formal_context.copy_type_context (a_context)
							l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
							a_context.wipe_out
							l_actual := l_actuals.actual_argument (1)
							find_expression_type (l_actual, a_context, l_formal_context)
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
							end
						else
							a_context.force_last (l_type)
						end
					else
						a_context.force_last (l_type)
					end
				end
			end
		end

	find_real_constant_type (a_constant: ET_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_CLASS_TYPE
		do
			reset_fatal_error (False)
			l_type := a_constant.type
			if l_type = Void then
				l_type := current_universe_impl.real_type
			end
			a_context.force_last (l_type)
		end

	find_regular_integer_constant_type (a_constant: ET_REGULAR_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_integer_constant_type (a_constant, a_context)
		end

	find_regular_manifest_string_type (a_string: ET_REGULAR_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			find_manifest_string_type (a_string, a_context)
		end

	find_regular_real_constant_type (a_constant: ET_REGULAR_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_real_constant_type (a_constant, a_context)
		end

	find_result_type (an_expression: ET_RESULT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
		do
			reset_fatal_error (False)
			if current_inline_agent /= Void then
				l_type := current_inline_agent.type
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
				l_type := current_feature.type
			end
			if l_type = Void then
					-- The entity 'Result' has to appear in a query.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				a_context.force_last (l_type)
			end
		end

	find_result_address_type (an_expression: ET_RESULT_ADDRESS; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_type: ET_TYPE
			l_typed_pointer_class: ET_NAMED_CLASS
			l_typed_pointer_type: ET_GENERIC_CLASS_TYPE
			l_actuals: ET_ACTUAL_PARAMETER_LIST
		do
			reset_fatal_error (False)
			if current_inline_agent /= Void then
				l_type := current_inline_agent.type
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
				l_type := current_feature.type
			end
			if l_type = Void then
					-- The entity 'Result' has to appear in a query.
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_typed_pointer_class := current_universe_impl.typed_pointer_any_type.named_base_class
				if l_typed_pointer_class.actual_class.is_preparsed then
						-- Class TYPED_POINTER has been found in the universe.
						-- Use ISE's implementation: the type of '$Result' is 'TYPED_POINTER [<type-of-result>]'.
					create l_actuals.make_with_capacity (1)
					l_actuals.put_first (l_type)
					create l_typed_pointer_type.make (Void, l_typed_pointer_class.name, l_actuals, l_typed_pointer_class)
					a_context.force_last (l_typed_pointer_type)
				else
						-- Use the ETL2 implementation: the type of '$argument' is POINTER.
					a_context.force_last (current_universe_impl.pointer_type)
				end
			end
		end

	find_special_manifest_string_type (a_string: ET_SPECIAL_MANIFEST_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			find_manifest_string_type (a_string, a_context)
		end

	find_static_call_expression_type (an_expression: ET_STATIC_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		local
			l_class: ET_CLASS
			l_query: ET_QUERY
			l_type: ET_TYPE
			l_result_type: ET_TYPE
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
		do
			reset_fatal_error (False)
			l_type := an_expression.type
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				a_context.force_last (l_type)
				l_class := a_context.base_class
				l_query := l_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
-- TODO: check that `l_query' is a constant attribute or an external function.
-- TODO: like argument.
					l_result_type := l_query.type
					a_context.force_last (l_result_type)
				end
			end
		end

	find_strip_expression_type (an_expression: ET_STRIP_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_system.array_any_type)
		end

	find_true_constant_type (a_constant: ET_TRUE_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_universe_impl.boolean_type)
		end

	find_underscored_integer_constant_type (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_integer_constant_type (a_constant, a_context)
		end

	find_underscored_real_constant_type (a_constant: ET_UNDERSCORED_REAL_CONSTANT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_constant' appears.
			-- It will be altered on exit to represent the type of `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
			a_context_not_void: a_context /= Void
		do
			find_real_constant_type (a_constant, a_context)
		end

	find_unqualified_call_expression_type (a_call: ET_FEATURE_CALL_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
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
			l_type: ET_TYPE
			l_seed: INTEGER
			l_like: ET_LIKE_FEATURE
			l_actual: ET_EXPRESSION
			l_convert_expression: ET_CONVERT_EXPRESSION
			l_builtin: ET_BUILTIN_CONVERT_FEATURE
			l_formal_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			l_name := a_call.name
			l_actuals := a_call.arguments
			l_seed := l_name.seed
			if l_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_query := current_class.seeded_query (l_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					l_type := l_query.type
-- TODO: like argument (the following is just a workaround
-- which works only in a limited number of cases, in particular
-- for ANY.clone).
					l_like ?= l_type
					if l_like /= Void and then l_like.is_like_argument and l_query.arguments_count = 1 then
						if l_actuals /= Void and then l_actuals.count = 1 then
							l_formal_context := new_context (current_type)
							l_formal_context.force_last (l_query.arguments.formal_argument (1).type)
							a_context.wipe_out
							l_actual := l_actuals.actual_argument (1)
							find_expression_type (l_actual, a_context, l_formal_context)
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
							end
						else
							a_context.force_last (l_type)
						end
					else
						a_context.force_last (l_type)
					end
				end
			end
		end

	find_verbatim_string_type (a_string: ET_VERBATIM_STRING; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `a_string' appears.
			-- It will be altered on exit to represent the type of `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
			a_context_not_void: a_context /= Void
		do
			find_manifest_string_type (a_string, a_context)
		end

	find_void_type (an_expression: ET_VOID; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			reset_fatal_error (False)
			a_context.force_last (current_system.none_type)
		end

	find_expression_type (an_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT) is
			-- Find type of `an_expression' (whose possible attachment target
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
			reset_fatal_error (False)
			old_target_type := current_target_type
			current_target_type := a_target_type
			old_context := current_context
			current_context := a_context
			an_expression.process (Current)
			current_context := old_context
			current_target_type := old_target_type
		end

feature {NONE} -- Agent validity

	find_call_agent_type (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
				find_unqualified_call_agent_type (an_expression, a_context)
			else
				a_target := an_expression.target
				an_expression_target ?= a_target
				if an_expression_target /= Void then
					find_qualified_call_agent_type (an_expression, an_expression_target, a_context)
				else
					a_type_target ?= a_target
					if a_type_target /= Void then
						find_typed_call_agent_type (an_expression, a_type_target, a_context)
					else
							-- Internal error: no other kind of targets.
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			end
		end

	find_unqualified_call_agent_type (an_expression: ET_CALL_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			if a_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif an_expression.is_procedure then
				l_procedure := current_class.seeded_procedure (a_seed)
				if l_procedure = Void then
						-- Internal error: if we got a seed, `l_procedure' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_unqualified_procedure_call_agent_type (an_expression, l_procedure, a_context)
				end
			else
					-- We still need to find `l_query'.
				l_query := current_class.seeded_query (a_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_unqualified_query_call_agent_type (an_expression, l_query, a_context)
				end
			end
		end

	find_unqualified_query_call_agent_type (an_expression: ET_CALL_AGENT; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, a_query, an_open_operands)
			end
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
				a_context.force_last (an_agent_type)
			end
		end

	find_unqualified_procedure_call_agent_type (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, a_procedure, an_open_operands)
			end
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (current_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				a_context.force_last (an_agent_type)
			end
		end

	find_qualified_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			find_expression_type (a_target, a_context, current_system.any_type)
			if has_fatal_error then
				-- Do nothing.
			elseif a_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif a_name.is_tuple_label then
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				find_qualified_tuple_label_call_agent_type (an_expression, a_target, a_context)
			elseif an_expression.is_procedure then
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				a_class := a_context.base_class
				l_procedure := a_class.seeded_procedure (a_seed)
				if l_procedure = Void then
						-- Internal error: if we got a seed, `l_procedure' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_qualified_procedure_call_agent_type (an_expression, a_target, l_procedure, a_context)
				end
			else
-- TODO: when `a_target' is an identifier, check whether it is either
-- a local variable, a formal argument or the name of an attribute.
				a_class := a_context.base_class
				l_query := a_class.seeded_query (a_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_qualified_query_call_agent_type (an_expression, a_target, l_query, a_context)
				end
			end
		end

	find_qualified_query_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
			a_target_type: ET_TYPE
			an_open_operands: ET_ACTUAL_PARAMETER_LIST
			a_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			a_tuple_type: ET_TUPLE_TYPE
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			an_agent_type: ET_GENERIC_CLASS_TYPE
			an_agent_class: ET_NAMED_CLASS
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, a_query, an_open_operands)
			end
			if not has_fatal_error then
				a_target_type := tokens.like_current
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_type := a_query.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
				a_context.force_last (an_agent_type)
			end
		end

	find_qualified_procedure_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, a_procedure, an_open_operands)
			end
			if not has_fatal_error then
				a_target_type := tokens.like_current
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (a_target_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				a_context.force_last (an_agent_type)
			end
		end

	find_qualified_tuple_label_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_GENERIC_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
			l_target_type: ET_TYPE
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_index := l_name.seed
			l_type := a_context.base_class.formal_parameter_type (l_index)
			l_target_type := tokens.like_current
			if l_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
			a_context.force_last (l_agent_type)
		end

	find_typed_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_target_type := a_target.type
			a_seed := a_name.seed
			if a_seed <= 0 then
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			elseif a_name.is_tuple_label then
				a_context.force_last (a_target_type)
				find_typed_tuple_label_call_agent_type (an_expression, a_target, a_context)
			elseif an_expression.is_procedure then
				a_context.force_last (a_target_type)
				a_class := a_context.base_class
				l_procedure := a_class.seeded_procedure (a_seed)
				if l_procedure = Void then
						-- Internal error: if we got a seed, `l_procedure' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_typed_procedure_call_agent_type (an_expression, a_target, l_procedure, a_context)
				end
			else
				a_context.force_last (a_target_type)
				a_class := a_context.base_class
				l_query := a_class.seeded_query (a_seed)
				if l_query = Void then
						-- Internal error: if we got a seed, `l_query' should not be void.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					find_typed_query_call_agent_type (an_expression, a_target, l_query, a_context)
				end
			end
		end

	find_typed_query_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_query: ET_QUERY; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			a_target_type := a_target.type
			a_formal_arguments := a_query.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
				fill_open_operands (an_expression, a_query, an_open_operands)
			else
				create an_open_operands.make_with_capacity (1)
			end
			if not has_fatal_error then
				a_target_type := tokens.like_current
				an_open_operands.put_first (a_target_type)
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_result_type := a_query.type
-- TODO: like argument
				if a_result_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
				a_context.force_last (an_agent_type)
			end
		end

	find_typed_procedure_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_procedure: ET_PROCEDURE; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
		do
			reset_fatal_error (False)
			a_name := an_expression.name
			a_seed := a_name.seed
			a_target_type := a_target.type
			a_formal_arguments := a_procedure.arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count + 1)
				fill_open_operands (an_expression, a_procedure, an_open_operands)
			else
				create an_open_operands.make_with_capacity (1)
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
				a_context.force_last (an_agent_type)
			end
		end

	find_typed_tuple_label_call_agent_type (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type of the target.
			-- It will be altered on exit to represent the type of `an_expression'.
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
			l_type: ET_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_agent_type: ET_GENERIC_CLASS_TYPE
			l_agent_class: ET_NAMED_CLASS
			l_target_type: ET_TYPE
			l_open_operands: ET_ACTUAL_PARAMETER_LIST
			l_tuple_type: ET_TUPLE_TYPE
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_index := l_name.seed
			l_type := a_context.base_class.formal_parameter_type (l_index)
			l_target_type := a_target.type
			create l_open_operands.make_with_capacity (1)
			l_open_operands.put_first (l_target_type)
			create l_tuple_type.make (Void, l_open_operands, current_universe_impl.tuple_type.named_base_class)
			if l_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
			a_context.force_last (l_agent_type)
		end

	find_do_function_inline_agent_type (an_expression: ET_DO_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_query_inline_agent_type (an_expression, a_context)
		end

	find_do_procedure_inline_agent_type (an_expression: ET_DO_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_procedure_inline_agent_type (an_expression, a_context)
		end

	find_external_function_inline_agent_type (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_query_inline_agent_type (an_expression, a_context)
		end

	find_external_procedure_inline_agent_type (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_procedure_inline_agent_type (an_expression, a_context)
		end

	find_once_function_inline_agent_type (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_query_inline_agent_type (an_expression, a_context)
		end

	find_once_procedure_inline_agent_type (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			a_context_not_void: a_context /= Void
		do
			find_procedure_inline_agent_type (an_expression, a_context)
		end

	find_query_inline_agent_type (an_expression: ET_QUERY_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
			reset_fatal_error (False)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, an_expression, an_open_operands)
			end
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				a_type := an_expression.type
-- TODO: like argument
				if a_type.same_named_type (current_universe_impl.boolean_type, current_type, current_type) then
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
				a_context.force_last (an_agent_type)
			end
		end

	find_procedure_inline_agent_type (an_expression: ET_PROCEDURE_INLINE_AGENT; a_context: ET_NESTED_TYPE_CONTEXT) is
			-- `a_context' represents the type in which `an_expression' appears.
			-- It will be altered on exit to represent the type of `an_expression'.
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
			reset_fatal_error (False)
			a_formal_arguments := an_expression.formal_arguments
			if a_formal_arguments /= Void then
				create an_open_operands.make_with_capacity (a_formal_arguments.count)
				fill_open_operands (an_expression, an_expression, an_open_operands)
			end
			if not has_fatal_error then
				create a_tuple_type.make (Void, an_open_operands, current_universe_impl.tuple_type.named_base_class)
				an_agent_class := current_universe_impl.procedure_type.named_base_class
				create a_parameters.make_with_capacity (2)
				a_parameters.put_first (a_tuple_type)
				a_parameters.put_first (current_type)
				create an_agent_type.make (Void, an_agent_class.name, a_parameters, an_agent_class)
				a_context.force_last (an_agent_type)
			end
		end

	fill_open_operands (an_agent: ET_AGENT; a_closure: ET_CLOSURE; an_open_operands: ET_ACTUAL_PARAMETER_LIST) is
			-- Fill in `an_open_operands' the types of the open arguments of `an_agent'
			-- where the corresponding formal arguments are those of `a_closure'.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that the target of `an_agent' is an open operand, it will be
			-- inserted in `an_open_operands' elsewhere.
		require
			an_agent_not_void: an_agent /= Void
			a_closure_not_void: a_closure /= Void
			an_open_operands_not_void: an_open_operands /= Void
			an_open_operands_empty: an_open_operands.is_empty
		local
			l_actuals: ET_AGENT_ARGUMENT_OPERANDS
			l_actual_list: ET_AGENT_ARGUMENT_OPERAND_LIST
			l_formal_type: ET_TYPE
			i, nb: INTEGER
			l_agent_actual: ET_AGENT_ARGUMENT_OPERAND
			l_actual: ET_EXPRESSION
			l_formal: ET_FORMAL_ARGUMENT
			had_error: BOOLEAN
			l_agent_type: ET_AGENT_TYPED_OPEN_ARGUMENT
			l_actual_type: ET_TYPE
			l_question_mark: ET_QUESTION_MARK_SYMBOL
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
			reset_fatal_error (False)
			l_formals := a_closure.arguments
			l_actuals := an_agent.arguments
			l_actual_list ?= l_actuals
			if l_actual_list = Void then
				if l_formals /= Void then
					nb := l_formals.count
					from i := nb until i < 1 loop
						l_formal_type := l_formals.formal_argument (i).type
						an_open_operands.force_first (l_formal_type)
						i := i - 1
					end
				end
			else
				if l_actual_list.is_empty then
					if l_formals /= Void and then not l_formals.is_empty then
							-- Invalid number of actual arguments.
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				elseif l_formals = Void or else l_formals.count /= l_actual_list.count then
						-- Invalid number of actual arguments.
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					nb := l_actual_list.count
					from i := nb until i < 1 loop
						had_error := had_error or has_fatal_error
						l_formal := l_formals.formal_argument (i)
						l_agent_actual := l_actual_list.actual_argument (i)
						l_actual ?= l_agent_actual
						if l_actual /= Void then
							-- Closed operands.
						else
							l_agent_type ?= l_agent_actual
							if l_agent_type /= Void then
								l_actual_type := l_agent_type.type
								an_open_operands.force_first (l_actual_type)
							else
								l_question_mark ?= l_agent_actual
								if l_question_mark /= Void then
									l_formal_type := l_formal.type
									an_open_operands.force_first (l_formal_type)
								else
										-- Internal error: no other kind of agent actual arguments.
										-- This error should have already been reported when checking
										-- `current_feature' (using ET_FEATURE_CHECKER for example).
									set_fatal_error
								end
							end
						end
						i := i - 1
					end
					reset_fatal_error (has_fatal_error or had_error)
				end
			end
		end

feature {ET_AST_NODE} -- Processing

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_binary_integer_constant_type (a_constant, current_context)
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			find_bit_constant_type (a_constant, current_context)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_bracket_expression_type (an_expression, current_context)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_c1_character_constant_type (a_constant, current_context)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_c2_character_constant_type (a_constant, current_context)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_c3_character_constant_type (a_constant, current_context)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			find_call_agent_type (an_expression, current_context)
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_call_expression_type (an_expression, current_context)
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_convert_builtin_expression_type (an_expression, current_context)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_convert_from_expression_type (an_expression, current_context)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_convert_to_expression_type (an_expression, current_context)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_create_expression_type (an_expression, current_context)
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			find_current_type (an_expression, current_context)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			find_current_address_type (an_expression, current_context)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_do_function_inline_agent_type (an_expression, current_context)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_do_procedure_inline_agent_type (an_expression, current_context)
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_equality_expression_type (an_expression, current_context)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			find_expression_address_type (an_expression, current_context)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_external_function_inline_agent_type (an_expression, current_context)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_external_procedure_inline_agent_type (an_expression, current_context)
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			find_false_constant_type (a_constant, current_context)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			find_feature_address_type (an_expression, current_context)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_hexadecimal_integer_constant_type (a_constant, current_context)
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
			if an_identifier.is_argument then
				find_formal_argument_type (an_identifier, current_context)
			elseif an_identifier.is_local then
				find_local_variable_type (an_identifier, current_context)
			elseif an_identifier.is_object_test_local then
				find_object_test_local_type (an_identifier, current_context)
			elseif not an_identifier.is_instruction then
				find_unqualified_call_expression_type (an_identifier, current_context)
			end
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_infix_cast_expression_type (an_expression, current_context)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_infix_expression_type (an_expression, current_context)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			find_manifest_array_type (an_expression, current_context)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			find_manifest_tuple_type (an_expression, current_context)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			find_manifest_type_type (an_expression, current_context)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			find_object_test_type (an_expression, current_context)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_object_equality_expression_type (an_expression, current_context)
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			find_object_test_type (an_expression, current_context)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_octal_integer_constant_type (a_constant, current_context)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_old_expression_type (an_expression, current_context)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			find_object_test_type (an_expression, current_context)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_once_function_inline_agent_type (an_expression, current_context)
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			find_once_manifest_string_type (an_expression, current_context)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			find_once_procedure_inline_agent_type (an_expression, current_context)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_parenthesized_expression_type (an_expression, current_context)
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_precursor_expression_type (an_expression, current_context)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_prefix_expression_type (an_expression, current_context)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_regular_integer_constant_type (a_constant, current_context)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			find_regular_manifest_string_type (a_string, current_context)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			find_regular_real_constant_type (a_constant, current_context)
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			find_result_type (an_expression, current_context)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			find_result_address_type (an_expression, current_context)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			find_special_manifest_string_type (a_string, current_context)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_static_call_expression_type (an_expression, current_context)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			find_strip_expression_type (an_expression, current_context)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			find_true_constant_type (a_constant, current_context)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			find_underscored_integer_constant_type (a_constant, current_context)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			find_underscored_real_constant_type (a_constant, current_context)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			find_verbatim_string_type (a_string, current_context)
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
			find_void_type (an_expression, current_context)
		end

feature {NONE} -- Access

	current_feature: ET_STANDALONE_CLOSURE
			-- Feature or invariant being processed

	current_feature_impl: ET_STANDALONE_CLOSURE
			-- Feature or invariant where the code being processed has been written;
			-- It might be different from `current_feature' or even from
			-- `current_feature.implementation_feature' when
			-- processing inherited assertions. For example:
			--
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
			--
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_feature' is B.f and `current_feature_impl' is A.f
			-- (where the inherited precondition has been written).

	current_inline_agent: ET_INLINE_AGENT
			-- Inline agent being processed if any, Void otherwise

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
			universe_impl_not_void: Result /= Void
		end

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked

	current_target_type: ET_TYPE_CONTEXT
			-- Type of the target of expression being processed

feature {NONE} -- Status report

	in_assertion: BOOLEAN
			-- Are we processing an assertion?

	in_precondition: BOOLEAN
			-- Are we processing a precondition?

	in_postcondition: BOOLEAN
			-- Are we processing a postcondition?

	in_invariant: BOOLEAN
			-- Are we processing an invariant?

feature {NONE} -- Type checking

	type_checker: ET_TYPE_CHECKER
			-- Type checker

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

invariant

	current_feature_not_void: current_feature /= Void
	current_feature_impl_not_void: current_feature_impl /= Void
	current_feature_impl_constraint: current_feature_impl = current_feature_impl.implementation_feature
	current_type_not_void: current_type /= Void
	current_type_valid: current_type.is_valid_context
	current_class_definition: current_class = current_type.base_class
	current_class_impl_not_void: current_class_impl /= Void
	current_class_impl_definition: current_class_impl = current_feature_impl.implementation_class
	-- implementation_checked: if inherited, then the code being analyzed has already been checked in implementation class of `current_feature_impl'
	type_checker_not_void: type_checker /= Void
	current_context_not_void: current_context /= Void
	unused_contexts_not_void: unused_contexts /= Void
	no_void_unused_context: not unused_contexts.has_void
	current_target_type_not_void: current_target_type /= Void

end
