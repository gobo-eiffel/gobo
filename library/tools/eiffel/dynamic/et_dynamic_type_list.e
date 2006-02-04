indexing

	description:

		"Lists of Eiffel dynamic types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE_LIST

inherit

	ET_TAIL_LIST [ET_DYNAMIC_TYPE]

create

	make, make_with_capacity

feature -- Status report

	has_special: BOOLEAN is
			-- Does current type list contain at least one SPECIAL type?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if storage.item (i).is_special then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Access

	special_type: ET_DYNAMIC_TYPE is
			-- One of the SPECIAL types contained in current type
			-- list if any, Void otherwise
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				l_type := storage.item (i)
				if l_type.is_special then
					Result := l_type
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_DYNAMIC_TYPE] is
			-- Fixed array routines
		once
			create Result
		end

end
