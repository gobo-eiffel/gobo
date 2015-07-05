note

	description:

		"Eiffel lists of base-types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BASE_TYPE_LIST

inherit

	ET_TAIL_LIST [ET_BASE_TYPE]

create

	make, make_with_capacity

feature -- Access

	has_class (a_class: ET_CLASS): BOOLEAN
			-- Is there a type in the list with `a_class' as base class?
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if storage.item (i).base_class = a_class then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	base_type (a_class: ET_CLASS): detachable ET_BASE_TYPE
			-- Type in the list whose base class is `a_class';
			-- Void if no such type
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_type: ET_BASE_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_type := storage.item (i)
				if a_type.base_class = a_class then
					Result := a_type
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			not_void: has_class (a_class) implies Result /= Void
		end

feature -- Iteration

	base_classes_there_exists (a_test: FUNCTION [ANY, TUPLE [ET_CLASS], BOOLEAN]): BOOLEAN
			-- Is `a_test' true for at least one of the base classes?
			-- (Semantics not guaranteed if `a_test' changes the list.)
		require
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if a_test.item ([storage.item (i).base_class]) then
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_BASE_TYPE]
			-- Fixed array routines
		once
			create Result
		end

end
