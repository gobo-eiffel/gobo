indexing

	description:

		"Eiffel dynamic type sets pushing types to supersets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PUSH_TYPE_SET

inherit

	ET_DYNAMIC_TYPE_SET
		redefine
			put_type_from_type_set
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

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	targets: ET_DYNAMIC_TARGET_LIST
			-- Supersets of the current set

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Subsets of current type set
		do
		ensure then
			no_source: Result = Void
		end

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `a_type_set' to current target.
		local
			old_count: INTEGER
			i, nb: INTEGER
		do
			old_count := count
			precursor (a_type, a_type_set, a_system)
			if old_count < count then
				if targets /= Void then
					nb := targets.count
					from i := 1 until i > nb loop
						targets.item (i).put_type_from_type_set (a_type, Current, a_system)
						i := i + 1
					end
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		local
			found: BOOLEAN
			i, nb: INTEGER
		do
			if targets = Void then
				create targets.make_with_capacity (2)
				targets.put_last (a_target)
			elseif targets.has (a_target) then
				found := True
			else
				targets.force_last (a_target)
			end
			if not found then
				nb := count
				from i := 1 until i > nb loop
					a_target.put_type_from_type_set (dynamic_type (i), Current, a_system)
					i := i + 1
				end
			end
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		do
			-- Do nothing: the current kind of type set is not pulling
			-- types from sources but pushing them to targets.
		end

end
