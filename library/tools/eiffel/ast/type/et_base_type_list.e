indexing

	description:

		"Eiffel lists of base-types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BASE_TYPE_LIST

inherit

	ET_TAIL_LIST [ET_BASE_TYPE]

create

	make, make_with_capacity

feature -- Access

	has_class (a_class: ET_CLASS; a_universe: ET_UNIVERSE): BOOLEAN is
			-- Is there a type in the list with `a_class'
			-- as base class in `a_universe'?
		require
			a_class_not_void: a_class /= Void
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if storage.item (i).direct_base_class (a_universe) = a_class then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	base_type (a_class: ET_CLASS; a_universe: ET_UNIVERSE): ET_BASE_TYPE is
			-- Type in the list whose base class is `a_class'
			-- in `a_universe'; Void if no such type
		require
			a_class_not_void: a_class /= Void
			a_universe_not_void: a_universe /= Void
		local
			i, nb: INTEGER
			a_type: ET_BASE_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_type := storage.item (i)
				if a_type.direct_base_class (a_universe) = a_class then
					Result := a_type
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			not_void: has_class (a_class, a_universe) implies Result /= Void
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_BASE_TYPE] is
			-- Fixed array routines
		once
			create Result
		end

end
