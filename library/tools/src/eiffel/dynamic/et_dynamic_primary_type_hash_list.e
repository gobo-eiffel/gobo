note

	description:

		"Lists of Eiffel dynamic primary types with hashing search"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST

inherit

	ET_DYNAMIC_PRIMARY_TYPE_LIST
		undefine
			make,
			make_with_capacity,
			index_of,
			has_type,
			put_last,
			force_last,
			append_list_last,
			put,
			remove_last,
			remove,
			wipe_out,
			resize
		redefine
			append_last
		end

	ET_TAIL_HASH_LIST [ET_DYNAMIC_PRIMARY_TYPE]
		rename
			has as has_type,
			item as dynamic_type,
			append_last as append_list_last
		end

create

	make, make_with_capacity

feature -- Element change

	append_last (other: ET_DYNAMIC_PRIMARY_TYPES)
			-- Add items of `other' to the end of list.
			-- Keep items of `other' in the same order.
			-- Resize list if necessary.
		local
			i, nb: INTEGER
			j, h: INTEGER
			l_item: like dynamic_type
		do
			nb := other.count
			if count + nb > capacity then
				resize (new_capacity (count + nb))
			end
			if count = 0 and other.count > 0 then
					-- Take care of the dummy item at position 0 in `storage'.
				fixed_array.force (storage, other.dynamic_type (1), 0)
			end
			j := count
			from i := 1 until i > nb loop
				j := j + 1
				l_item := other.dynamic_type (i)
				h := hash_position (l_item)
				clashes.put (slots.item (h), j)
				slots.put (j, h)
				fixed_array.force (storage, l_item, j)
				i := i + 1
			end
			count := j
		end

end
