indexing

	description:

		"Eiffel dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET

feature -- Access

	static_type: ET_DYNAMIC_TYPE is
			-- Type at compilation time
		deferred
		ensure
			static_type_not_void: Result /= Void
		end

	first_type: ET_DYNAMIC_TYPE is
			-- First type in current set;
			-- Void if no type in the set
		deferred
		end

	other_types: DS_LINKABLE [ET_DYNAMIC_TYPE] is
			-- Other types in current set;
			-- Void if zero or one type in the set
		deferred
		ensure
			no_void_type: Result /= Void implies Result.item /= Void
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		require
			a_type_not_void: a_type /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

	put_target (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are super sets of the current sets.)
		require
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

end
