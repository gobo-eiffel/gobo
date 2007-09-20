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

	ET_DYNAMIC_TYPE_SET
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

	reset (other: ET_DYNAMIC_TYPE_SET) is
			-- Reset current set with using `other''s static type
			-- and dynamic types.
		require
			other_not_void: other /= Void
		do
			static_type := other.static_type
			count := other.count
			if dynamic_types /= Void then
				dynamic_types.wipe_out
				dynamic_types.resize (count)
				dynamic_types.append_last (other)
			elseif count > 0 then
				create dynamic_types.make_with_capacity (count.max (15))
				dynamic_types.append_last (other)
			end
		ensure
			static_type_set: static_type = other.static_type
			count_set: count = other.count
			same_dynamic_types: is_subset (other)
		end

	reset_with_types (a_static_type: like static_type; a_dynamic_types: like dynamic_types) is
			-- Reset current type set using `a_dynamic_types'.
		require
			a_static_type_not_void: a_static_type /= Void
		do
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
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Subsets of current set
		do
		ensure then
			no_source: Result = Void
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

	put_types (other: ET_DYNAMIC_TYPES) is
			-- Add types of `other' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
		do
			nb := other.count
			from i := 1 until i > nb loop
				put_type (other.dynamic_type (i))
				i := i + 1
			end
		end

	put_type_from_type_set (a_type: ET_DYNAMIC_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `a_type_set' to current target.
		do
			if a_type.conforms_to_type (static_type, a_system) then
				put_type (a_type)
			end
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			-- Do nothing: the current kind of type set is not pushing
			-- types to targets but pulling them from sources.
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		do
			-- Do nothing: the current kind of type set is not pulling
			-- types from sources but pushing them to targets.
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
