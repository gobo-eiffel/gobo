indexing

	description:

		"Lists of Eiffel dynamic types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE_LIST

inherit

	ET_DYNAMIC_TYPES
		undefine
			index_of,
			has_type, is_empty
		end

	ET_TAIL_LIST [ET_DYNAMIC_TYPE]
		rename
			has as has_type,
			item as dynamic_type,
			append_last as append_list_last
		end

create

	make, make_with_capacity

feature -- Element change

	append_last (other: ET_DYNAMIC_TYPES) is
			-- Add items of `other' to the end of list.
			-- Keep items of `other' in the same order.
			-- Resize list if necessary.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			j: INTEGER
		do
			nb := other.count
			if count + nb > capacity then
				resize (new_capacity (count + nb))
			end
			j := count
			from i := 1 until i > nb loop
				j := j + 1
				storage.put (other.dynamic_type (i), j)
				i := i + 1
			end
			count := j
		ensure
			new_more: count = old (count + other.count)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_DYNAMIC_TYPE] is
			-- Fixed array routines
		once
			create Result
		end

end
