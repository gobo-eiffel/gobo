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
		require
			a_type_not_void: a_type /= Void
		do
			static_type := a_type
		ensure
			static_type_set: static_type = a_type
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

	targets: DS_LINKABLE [ET_DYNAMIC_TYPE_SET]
			-- Super sets of the current set

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		local
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			l_target: DS_LINKABLE [ET_DYNAMIC_TYPE_SET]
			found: BOOLEAN
		do
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
				from
					l_target := targets
				until
					l_target = Void
				loop
					l_target.item.put_type (a_type, a_system)
					l_target := l_target.right
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are super sets of the current sets.)
		local
			l_target: DS_LINKABLE [ET_DYNAMIC_TYPE_SET]
			l_other_type: DS_LINKABLE [ET_DYNAMIC_TYPE]
			found: BOOLEAN
		do
			from
				l_target := targets
			until
				l_target = Void
			loop
				if l_target.item = a_target then
					found := True
					l_target := Void
				else
					l_target := l_target.right
				end
			end
			if not found then
				create l_target.make (a_target)
				if targets /= Void then
					l_target.put_right (targets)
				end
				targets := l_target
				if first_type /= Void then
					a_target.put_type (first_type, a_system)
					from
						l_other_type := other_types
					until
						l_other_type = Void
					loop
						a_target.put_type (l_other_type.item, a_system)
						l_other_type := l_other_type.right
					end
				end
			end
		end

invariant

	no_void_target: targets /= Void implies targets.item /= Void

end
