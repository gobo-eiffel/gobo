indexing

	description:

		"Eiffel nested dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_NESTED_DYNAMIC_TYPE_SET

inherit

	ET_DYNAMIC_TYPE_SET

creation

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
				count := 1
			end
		ensure
			static_type_set: static_type = a_type
			first_expanded_type: a_type.is_expanded implies first_type = a_type
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: DS_LINKABLE [ET_DYNAMIC_TYPE]
			-- Other types in current set;
			-- Void if zero or one type in the set

	sources: ET_DYNAMIC_ATTACHMENT
			-- Sub-sets of current set

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		local
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			found: BOOLEAN
		do
			if a_type /= a_system.none_type and then a_type.conforms_to_type (static_type, a_system) then
				if first_type = Void then
					first_type := a_type
					count := count + 1
				elseif a_type /= first_type then
					from
						l_other_type := other_types
					until
						l_other_type = Void
					loop
						if l_other_type.item = a_type then
							found := True
							l_other_type := Void
						else
							l_other_type := l_other_type.right
						end
					end
					if not found then
						count := count + 1
						create l_other_type.make (a_type)
						if other_types /= Void then
							l_other_type.put_right (other_types)
						end
						other_types := l_other_type
					end
				end
			end
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are sub-sets of current set.)
		do
			if sources = Void then
				sources := a_source
			else
				a_source.set_next_attachment (sources)
				sources := a_source
			end
			a_source.propagate_types (Current, a_system)
		end

end
