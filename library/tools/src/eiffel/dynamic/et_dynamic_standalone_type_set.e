note

	description:

		"Eiffel dynamic type sets with no sources nor targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2019, Eric Bezault and others"
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

	make, make_empty

feature {NONE} -- Initialization

	make (a_type: like static_type)
			-- Create a new empty dynamic type set.
			-- Set `first_type' to `a_type' if it is expanded.
		require
			a_type_not_void: a_type /= Void
		do
			static_type := a_type
			if a_type.is_expanded then
				put_type (a_type.primary_type)
			end
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies (count = 1 and then dynamic_type (1) = a_type)
		end

	make_empty (a_type: like static_type)
			-- Create a new empty dynamic type set.
		require
			a_type_not_void: a_type /= Void
		do
			static_type := a_type
		ensure
			static_type_set: static_type = a_type
		end

feature -- Initialization

	reset (a_static_type: ET_DYNAMIC_TYPE)
			-- Reset current set.
		require
			a_static_type_not_void: a_static_type /= Void
		do
			is_never_void := False
			static_type := a_static_type
			count := 0
			if attached dynamic_types as l_dynamic_types then
				l_dynamic_types.wipe_out
			end
		ensure
			static_type_set: static_type = a_static_type
			count_set: count = 0
			same_dynamic_types: dynamic_types = old dynamic_types
			not_never_void: not is_never_void
		end

	reset_with_types (a_static_type: like static_type; a_dynamic_types: like dynamic_types)
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

feature -- Access

	dynamic_types: detachable ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST
			-- Dynamic types in current set;
			-- Void if no type in the set

feature -- Setting

	set_static_type (a_static_type: ET_DYNAMIC_TYPE)
			-- Set `static_type' to `a_static_type'.
		require
			a_static_type_not_void: a_static_type /= Void
			conformance: static_type.conforms_to_type (a_static_type)
		do
			static_type := a_static_type
		ensure
			static_type_set: static_type = a_static_type
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Add `a_type' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		local
			l_dynamic_types: like dynamic_types
		do
			l_dynamic_types := dynamic_types
			if l_dynamic_types = Void then
				create l_dynamic_types.make_with_capacity (15)
				l_dynamic_types.put_last (a_type)
				dynamic_types := l_dynamic_types
				count := 1
			elseif not l_dynamic_types.has_type (a_type) then
				l_dynamic_types.force_last (a_type)
				count := count + 1
			end
		end

	put_type_from_type_set (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		do
			if a_type.conforms_to_primary_type (static_type.primary_type) then
				put_type (a_type)
			end
		end

invariant

	dynamic_types_not_readonly: not is_dynamic_types_readonly
	consistent_count: attached dynamic_types as l_dynamic_types implies count = l_dynamic_types.count
	empty: dynamic_types = Void implies count = 0

end
