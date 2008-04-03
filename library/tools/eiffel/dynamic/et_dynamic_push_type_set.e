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

	ET_DYNAMIC_EXTENDIBLE_TYPE_SET
		redefine
			put_target,
			put_type_from_type_set,
			propagate_can_be_void
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

	targets: ET_DYNAMIC_TARGET_LIST
			-- Supersets of the current set

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM) is
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

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_DYNAMIC_SYSTEM) is
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
				if not is_never_void then
					a_target.propagate_can_be_void (Current)
				end
			end
		end

	propagate_can_be_void (a_type_set: ET_DYNAMIC_TYPE_SET) is
			-- Propagate the information that `a_type_set', from which types
			-- are propagated, is the dynamic type set of an expression which
			-- can be void at some point during execution.
		local
			i, nb: INTEGER
		do
			if is_never_void then
				is_never_void := False
				if targets /= Void then
					nb := targets.count
					from i := 1 until i > nb loop
						targets.item (i).propagate_can_be_void (Current)
						i := i + 1
					end
				end
			end
		end

end
