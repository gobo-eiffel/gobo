note

	description:

		"Cells containing two hashable items"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2005-2013, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASHABLE_PAIR [G -> HASHABLE, H -> HASHABLE]

inherit

	DS_PAIR [G, H]

	HASHABLE

create

	make

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		do
			if attached first as l_first then
				if attached second as l_second then
					Result := l_first.hash_code // 2 + l_second.hash_code // 2
				else
					Result := l_first.hash_code
				end
			elseif attached second as l_second then
				Result := l_second.hash_code
			else
				Result := 0
			end
		end

end
