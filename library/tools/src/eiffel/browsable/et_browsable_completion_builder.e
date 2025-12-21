note

	description:

		"Builders for lists of completion suggestions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_BROWSABLE_COMPLETION_BUILDER

feature -- Basic operations

	add_query (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add query `a_feature` to the list of completion suggestions.
		require
			a_feature_not_void: a_feature /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_procedure (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add procedure `a_feature` to the list of completion suggestions.
		require
			a_feature_not_void: a_feature /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_creation_procedure (a_feature: ET_FEATURE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add creation procedure `a_feature` to the list of completion suggestions.
		require
			a_feature_not_void: a_feature /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_tuple_label (a_tuple_label: ET_LABELED_ACTUAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add tuple label `a_tuple_label` to the list of completion suggestions.
		require
			a_tuple_label_not_void: a_tuple_label /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_formal_argument (a_argument: ET_FORMAL_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal argument `a_argument` to the list of completion suggestions.
		require
			a_argument_not_void: a_argument /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_local_variable (a_local_variable: ET_LOCAL_VARIABLE; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local variable `a_local_variable` to the list of completion suggestions.
		require
			a_local_variable_not_void: a_local_variable /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_object_test_local (a_object_test: ET_NAMED_OBJECT_TEST; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add local of `a_object_test` to the list of completion suggestions.
		require
			a_object_test_not_void: a_object_test /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_iteration_item (a_iteration: ET_ITERATION_COMPONENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add iteration item of `a_iteration` to the list of completion suggestions.
		require
			a_iteration_not_void: a_iteration /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_inline_separate_argument (a_inline_separate_argument: ET_INLINE_SEPARATE_ARGUMENT; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add argument of inline separate instruction `a_inline_separate_argument` to the list of completion suggestions.
		require
			a_inline_separate_argument_not_void: a_inline_separate_argument /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end


	add_keyword (a_keyword: ET_KEYWORD; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add keyword `a_keyword` to the list of completion suggestions.
		require
			a_keyword_not_void: a_keyword /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_class (a_class: ET_CLASS; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add class `a_class` to the list of completion suggestions.
		require
			a_class_not_void: a_class /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

	add_formal_parameter (a_formal_parameter: ET_FORMAL_PARAMETER; a_browsable_name: ET_BROWSABLE_NAME)
			-- Add formal paramater `a_formal_parameter` to the list of completion suggestions.
		require
			a_formal_parameter_not_void: a_formal_parameter /= Void
			a_browsable_name_not_void: a_browsable_name /= Void
		deferred
		end

end
