indexing

	description:

		"Eiffel assignment attempts at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_ASSIGNMENT_ATTEMPT

inherit

	ET_DYNAMIC_TYPE_SET

creation

	make

feature {NONE} -- Initialization

	make (a_type: like target_type) is
			-- Create a new dynamic assignment attempt.
		require
			a_type_not_void: a_type /= Void
		do
			target_type := a_type
			is_direct_assignment := True
		ensure
			target_type_set: target_type = a_type
		end

feature -- Access

	target_type: ET_DYNAMIC_TYPE_SET
			-- Target dynamic type set

	static_type: ET_DYNAMIC_TYPE is
			-- Type at compilation time
		do
			Result := target_type.static_type
		ensure then
			definition: Result = target_type.static_type
		end

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: DS_LINKABLE [ET_DYNAMIC_TYPE]
			-- Other types in current set;
			-- Void if zero or one type in the set

feature -- Status report

	is_direct_assignment: BOOLEAN
			-- Can current assignment attempt be implemented as a direct assignment?

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		local
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			found: BOOLEAN
		do
			if not a_type.conforms_to_type (static_type, a_system) then
				is_direct_assignment := False
			else
				if first_type = Void then
					first_type := a_type
					found := False
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
						create l_other_type.make (a_type)
						if other_types /= Void then
							l_other_type.put_right (other_types)
						end
						other_types := l_other_type
					end
				else
					found := True
				end
				if not found then
					target_type.put_type (a_type, a_system)
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are super sets of the current sets.)
		do
-- TODO: error
		end

feature -- Link

	next: like Current
			-- Next linked assignment attempt if list of assignment attempts

	set_next (a_next: like Current) is
			-- Set `next' to `a_next'.
		do
			next := a_next
		ensure
			next_set: next = a_next
		end

invariant

	target_type_not_void: target_type /= Void

end
