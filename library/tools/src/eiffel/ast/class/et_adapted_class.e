note

	description:

		"Adapted Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_ADAPTED_CLASS

feature -- Access

	base_class: ET_CLASS
			-- Class being adapted
		deferred
		ensure
			base_class_not_void: Result /= Void
		end

	base_type: ET_BASE_TYPE
			-- Base type, if any;
			-- `base_class' otherwise
		deferred
		ensure
			base_type_not_void: Result /= Void
			is_named_type: Result.is_named_type
			base_class: Result.base_class = base_class
		end

feature -- Features

	named_query (a_name: ET_CALL_NAME): detachable ET_QUERY
			-- Query named `a_name' in `base_class'.
			-- Take into account possible renaming.
			-- Void if no such query.
		require
			a_name_not_void: a_name /= Void
		do
			Result := base_class.named_query (a_name)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	named_procedure (a_name: ET_CALL_NAME): detachable ET_PROCEDURE
			-- Procedure named `a_name' in `base_class'.
			-- Take into account possible renaming.
			-- Void if no such procedure.
		require
			a_name_not_void: a_name /= Void
		do
			Result := base_class.named_procedure (a_name)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	named_feature (a_name: ET_CALL_NAME): detachable ET_FEATURE
			-- Feature named `a_name' in `base_class'.
			-- Take into account possible renaming.
			-- Void if no such feature.
		require
			a_name_not_void: a_name /= Void
		do
			if attached named_procedure (a_name) as l_procedure then
				Result := l_procedure
			else
				Result := named_query (a_name)
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	add_overloaded_queries (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_QUERY])
			-- Add to `a_list' queries whose name or overloaded name is `a_name'.
			-- Take into account possible renaming.
		require
			a_name_not_void: a_name /= Void
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		do
			base_class.add_overloaded_queries (a_name, a_list)
		ensure
			no_void_item: not a_list.has_void
		end

	add_overloaded_procedures (a_name: ET_CALL_NAME; a_list: DS_ARRAYED_LIST [ET_PROCEDURE])
			-- Add to `a_list' procedures whose name or overloaded name is `a_name'.
			-- Take into account possible renaming.
		require
			a_name_not_void: a_name /= Void
			a_list_not_void: a_list /= Void
			no_void_item: not a_list.has_void
		do
			base_class.add_overloaded_procedures (a_name, a_list)
		ensure
			no_void_item: not a_list.has_void
		end

	base_type_index_of_label (a_label: ET_IDENTIFIER; a_context: ET_TYPE_CONTEXT): INTEGER
			-- Index of actual generic parameter with label `a_label'
			-- in `a_context.base_type' when current is an ET_CLASS,
			-- in `base_type' otherwise.
			-- 0 if it does not exist.
		require
			a_label_not_void: a_label /= Void
			a_context_not_void: a_context /= Void
			a_context_is_valid: a_context.is_valid_context
		do
			Result := base_type.index_of_label (a_label)
		end

end
