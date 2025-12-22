note

	description:

		"Names in the AST which can point to browsable information"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_NAME

inherit

	ANY

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Access

	current_class: ET_CLASS
			-- Class whose text contains the browsable name

	name: ET_AST_NODE
			-- AST node corresponding to the browsable name
		deferred
		ensure
			name_not_void: Result /= Void
		end

feature -- Context

	is_completion_disabled: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is completion disabled?
			-- (For example when type a new name for feature.)

	is_only_feature_name_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a feature name expected (no arguments)?
			-- (For example in anchored types.)

	is_only_class_name_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a class name expected (no type mark,
			-- no formal paramater)?
			-- (For example in client clauses.)

	is_only_query_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a query expected?

	is_only_procedure_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a query expected?

	is_only_creation_procedure_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a creation procedure expected?

	is_only_static_call_expected: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is only a static call expected?

	is_non_exported_feature_allowed: BOOLEAN
			-- In the current context in the Eiffel code,
			-- is a non-exported feature allowed?

feature -- Context setting

	set_completion_disabled (b: BOOLEAN)
			-- Set `is_completion_disabled` to `b`.
		do
			is_completion_disabled := b
		ensure
			completion_disabled_set: is_completion_disabled = b
		end

	set_only_feature_name_expected (b: BOOLEAN)
			-- Set `is_only_feature_name_expected` to `b`.
		do
			is_only_feature_name_expected := b
		ensure
			only_feature_name_expected_set: is_only_feature_name_expected = b
		end

	set_only_class_name_expected (b: BOOLEAN)
			-- Set `is_only_class_name_expected` to `b`.
		do
			is_only_class_name_expected := b
		ensure
			only_class_name_expected_set: is_only_class_name_expected = b
		end

	set_only_query_expected (b: BOOLEAN)
			-- Set `is_only_query_expected` to `b`.
		do
			is_only_query_expected := b
		ensure
			only_query_expected_set: is_only_query_expected = b
		end

	set_only_procedure_expected (b: BOOLEAN)
			-- Set `is_only_procedure_expected` to `b`.
		do
			is_only_procedure_expected := b
		ensure
			only_procedure_expected_set: is_only_procedure_expected = b
		end

	set_only_creation_procedure_expected (b: BOOLEAN)
			-- Set `is_only_creation_procedure_expected` to `b`.
		do
			is_only_creation_procedure_expected := b
		ensure
			only_creation_procedure_expected_set: is_only_creation_procedure_expected = b
		end

	set_only_static_call_expected (b: BOOLEAN)
			-- Set `is_only_static_call_expected` to `b`.
		do
			is_only_static_call_expected := b
		ensure
			only_static_call_expected_set: is_only_static_call_expected = b
		end

	set_non_exported_feature_allowed (b: BOOLEAN)
			-- Set `is_non_exported_feature_allowed` to `b`.
		do
			is_non_exported_feature_allowed := b
		ensure
			non_exported_feature_allowed_set: is_non_exported_feature_allowed = b
		end
feature -- Basic operations

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER; a_system_processor: ET_SYSTEM_PROCESSOR)
			-- Build list of completion suggestions.
		require
			a_builder_not_void: a_builder /= Void
			a_system_processor_not_void: a_system_processor /= Void
		deferred
		end

feature -- Output

	description: STRING_8
			-- Description of current browsable name
		do
			create Result.make (15)
			append_description_to_string (Result)
		ensure
			description_not_void: Result /= Void
			description_is_string_8: Result.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	append_description_to_string (a_string: STRING_8)
			-- Append `description' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_feature_description_to_string (a_feature: ET_FEATURE; a_string: STRING_8)
			-- Append description of `a_feature` to `a_string'.
		require
			a_feature_not_void: a_feature /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_tuple_label_description_to_string (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_tuple_label` to `a_string'.
		require
			a_tuple_label_not_void: a_tuple_label /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_formal_agument_description_to_string (a_argument: ET_FORMAL_ARGUMENT; a_string: STRING_8)
			-- Append description of `a_argument` to `a_string'.
		require
			a_argument_not_void: a_argument /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_local_variable_description_to_string (a_local_variable: ET_LOCAL_VARIABLE; a_string: STRING_8)
			-- Append description of `a_local_variable` to `a_string'.
		require
			a_local_variable_not_void: a_local_variable /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_class_description_to_string (a_class: ET_CLASS; a_string: STRING_8)
			-- Append description of `a_class` to `a_string'.
		require
			a_class_not_void: a_class /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_formal_parameter_description_to_string (a_formal_parameter: ET_FORMAL_PARAMETER; a_string: STRING_8)
			-- Append description of `a_formal_parameter` to `a_string'.
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
			a_string_not_void: a_string /= Void
		deferred
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the current browsable name is defined
		deferred
		end

	type_definition_ast_node: detachable TUPLE [ast_node: ET_AST_NODE; class_impl: ET_CLASS]
			-- AST node, and its implementation class, where
			-- the type of the current browsable name is defined
		deferred
		end

invariant

	current_class_not_void: current_class /= Void

end
