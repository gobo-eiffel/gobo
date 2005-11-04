indexing

	description:

		"Cells containing two hashable items"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASHABLE_PAIR [G -> HASHABLE, H -> HASHABLE]

inherit

	DS_PAIR [G, H]

	HASHABLE

create

	make

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := first.hash_code // 2 + second.hash_code // 2
		end

end
