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
				first_type := a_type
			end
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies first_type = a_type
		end

feature -- Initialization

	reset (other: ET_DYNAMIC_TYPE_SET) is
			-- Reset current set with using `other''s static type
			-- and dynamic types.
		require
			other_not_void: other /= Void
		local
			l_other_types: ET_DYNAMIC_TYPE_LIST
			nb: INTEGER
		do
			static_type := other.static_type
			first_type := other.first_type
			l_other_types := other.other_types
			if l_other_types = Void then
				other_types := Void
				if internal_other_types /= Void then
					internal_other_types.wipe_out
				end
			else
				nb := l_other_types.count
				if internal_other_types /= Void then
					internal_other_types.wipe_out
					other_types := internal_other_types
				else
					create other_types.make_with_capacity (nb.max (15))
					internal_other_types := other_types
				end
				other_types.append_last (l_other_types)
			end
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: ET_DYNAMIC_TYPE_LIST
			-- Other types in current set;
			-- Void if zero or one type in the set

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Subsets of current set
		do
		ensure then
			no_source: Result = Void
		end

feature -- Element change

	put_standalone_type (a_type: ET_DYNAMIC_TYPE) is
			-- Add `a_type' to current set.
		require
			a_type_not_void: a_type /= Void
		do
			if first_type = Void then
				first_type := a_type
			elseif a_type = first_type then
				-- Done.
			elseif other_types = Void then
				if internal_other_types /= Void then
					internal_other_types.wipe_out
					other_types := internal_other_types
				else
					create other_types.make_with_capacity (15)
					internal_other_types := other_types
				end
				other_types.put_last (a_type)
			elseif other_types.has (a_type) then
				-- Done.
			else
				other_types.force_last (a_type)
			end
		end

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		do
			put_standalone_type (a_type)
		end

	put_type_set (other: ET_DYNAMIC_TYPE_SET) is
			-- Add types of `other' to current set.
		require
			other_not_void: other /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
		do
			l_type := other.first_type
			if l_type /= Void then
				put_standalone_type (l_type)
				l_other_types := other.other_types
				if l_other_types /= Void then
					nb := l_other_types.count
					from i := 1 until i > nb loop
						put_standalone_type (l_other_types.item (i))
						i := i + 1
					end
				end
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

feature {NONE} -- Implementation

	internal_other_types: ET_DYNAMIC_TYPE_LIST
			-- Internal storable of `other_types'
			-- (Useful to recycle memory usage.)

end
