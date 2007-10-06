indexing

	description:

		"Eiffel dynamic type sets with no sources nor targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_STANDALONE_TYPE_SET

inherit

	ET_DYNAMIC_EXTENDIBLE_TYPE_SET
		redefine
			put_type,
			put_type_from_type_set,
			dynamic_types
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like static_type) is
			-- Create a new empty dynamic type set.
			-- Set `first_type' to `a_type' if it is expanded.
		require
			a_type_not_void: a_type /= Void
		do
			static_type := a_type
			if a_type.is_expanded then
				put_type (a_type)
			end
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies (count = 1 and then dynamic_type (1) = a_type)
		end

feature -- Initialization

	reset (a_static_type: ET_DYNAMIC_TYPE) is
			-- Reset current set.
		require
			a_static_type_not_void: a_static_type /= Void
		do
			is_never_void := False
			static_type := a_static_type
			count := 0
			if dynamic_types /= Void then
				dynamic_types.wipe_out
			end
		ensure
			static_type_set: static_type = a_static_type
			count_set: count = 0
			same_dynamic_types: dynamic_types = old dynamic_types
			not_never_void: not is_never_void
		end

	reset_with_types (a_static_type: like static_type; a_dynamic_types: like dynamic_types) is
			-- Reset current type set using `a_dynamic_types'.
		require
			a_static_type_not_void: a_static_type /= Void
		do
			is_never_void := False
			static_type := a_static_type
			dynamic_types := a_dynamic_types
			if a_dynamic_types /= Void then
				count := a_dynamic_types.count
			else
				count := 0
			end
		ensure
			static_type_set: static_type = a_static_type
			dynamic_types_set: dynamic_types = a_dynamic_types
			not_never_void: not is_never_void
		end

feature -- Setting

	set_static_type (a_static_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Set `static_type' to `a_static_type'.
		require
			a_static_type_not_void: a_static_type /= Void
			a_system_not_void: a_system /= Void
			conformance: static_type.conforms_to_type (a_static_type, a_system)
		do
			static_type := a_static_type
		ensure
			static_type_set: static_type = a_static_type
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE) is
			-- Add `a_type' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		do
			if dynamic_types = Void then
				create dynamic_types.make_with_capacity (15)
				dynamic_types.put_last (a_type)
				count := 1
			elseif not dynamic_types.has_type (a_type) then
				dynamic_types.force_last (a_type)
				count := count + 1
			end
		end

	put_type_from_type_set (a_type: ET_DYNAMIC_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `a_type_set' to current target.
		do
			if a_type.conforms_to_type (static_type, a_system) then
				put_type (a_type)
			end
		end

feature {ET_DYNAMIC_TYPE_SET} -- Implementation

	dynamic_types: ET_DYNAMIC_TYPE_LIST
			-- Dynamic types in current set;
			-- Void if no type in the set

invariant

	dynamic_types_not_readonly: not is_dynamic_types_readonly
	dynamic_types_not_void: dynamic_types /= Void
	consistent_count: dynamic_types /= Void implies count = dynamic_types.count
	empty: dynamic_types = Void implies count = 0

end
