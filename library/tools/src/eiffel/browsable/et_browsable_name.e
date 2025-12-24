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

	build_definition (a_builder: ET_BROWSABLE_DEFINITION_BUILDER)
			-- Build list of definitions.
		require
			a_builder_not_void: a_builder /= Void
		deferred
		end

	build_type_definition (a_builder: ET_BROWSABLE_TYPE_DEFINITION_BUILDER)
			-- Build list of type definitions.
		require
			a_builder_not_void: a_builder /= Void
		deferred
		end

	build_implementation (a_builder: ET_BROWSABLE_IMPLEMENTATION_BUILDER)
			-- Build list of implementations.
		require
			a_builder_not_void: a_builder /= Void
		do
		end

	build_feature_implementations (a_feature: ET_FEATURE; a_target_type: ET_TYPE; a_builder: ET_BROWSABLE_IMPLEMENTATION_BUILDER)
			-- Build list of implementations of `a_feature' from `a_target_type'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_builder_not_void: a_builder /= Void
		local
			l_target_class: ET_CLASS
			l_precursors: DS_HASH_SET [ET_FEATURE]
			l_implementations: DS_HASH_SET [ET_FEATURE]
			l_feature: ET_FEATURE
			l_feature_impl: ET_FEATURE
			i, nb: INTEGER
			l_descendants: DS_ARRAYED_LIST [ET_CLASS]
			l_descendant: ET_CLASS
			l_seed: INTEGER
		do
			create l_precursors.make (20)
			create l_implementations.make (20)
			l_precursors.put_last (a_feature)
			from l_precursors.start until l_precursors.after loop
				l_feature := l_precursors.item_for_iteration
				l_feature_impl := l_feature.implementation_feature
				if not l_implementations.has (l_feature_impl) and then a_feature.has_seed (l_feature.first_seed) then
					l_implementations.force_last (l_feature_impl)
				end
				if attached l_feature.first_precursor as l_first_precursor then
					if not l_precursors.has (l_first_precursor) then
						l_precursors.force_last (l_first_precursor)
					end
					if attached l_feature.other_precursors as l_other_precursors then
						nb := l_other_precursors.count
						from i := 1 until i > nb loop
							l_feature := l_other_precursors.item (i)
							if not l_precursors.has (l_feature) then
								l_precursors.force_last (l_feature)
							end
							i := i + 1
						end
					end
				end
				l_precursors.forth
			end
				-- Revert order of precursors.
			from l_implementations.finish until l_implementations.before loop
				l_feature := l_implementations.item_for_iteration
				a_builder.add_feature (l_feature, Current)
				l_implementations.back
			end
				-- Look for redeclarations in descendants.
			l_seed := a_feature.first_seed
			l_target_class := a_target_type.base_class (current_class)
			l_descendants := l_target_class.conforming_descendant_classes
			nb := l_descendants.count
			from i := 1 until i > nb loop
				l_descendant := l_descendants.item (i)
				if attached l_descendant.seeded_feature (l_seed) as l_seeded_feature then
					l_feature_impl := l_seeded_feature.implementation_feature
					if not l_implementations.has (l_feature_impl) then
						l_implementations.force_last (l_feature_impl)
						a_builder.add_feature (l_feature_impl, Current)
					end
				end
				i := i + 1
			end
		end

	build_completion (a_builder: ET_BROWSABLE_COMPLETION_BUILDER)
			-- Build list of completion suggestions.
		require
			a_builder_not_void: a_builder /= Void
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

invariant

	current_class_not_void: current_class /= Void

end
