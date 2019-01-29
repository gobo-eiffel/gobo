note

	description:
	
		"Adapted Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			Result := base_class.queries.named_feature (a_name)
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
			Result := base_class.procedures.named_feature (a_name)
		ensure
			registered: Result /= Void implies Result.is_registered
		end

end
