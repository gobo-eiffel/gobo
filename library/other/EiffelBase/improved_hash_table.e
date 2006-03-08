indexing

	description:

		"Improved HASH_TABLE not using `is_equal' to compare keys. %
		%Use a KL_EQUALITY_TESTER instead to avoid CAT-calls."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class IMPROVED_HASH_TABLE [G, H -> HASHABLE]

inherit

	HASH_TABLE [G, H]
		rename
			make_map as ds_make_map
		end

create

	make, make_map

feature -- Initialization

	make_map (n: INTEGER) is
			-- Allocate hash table for at least `n' items.
			-- The table will be resized automatically
			-- if more than `n' items are inserted.
			-- Use `=' to compare keys.
		require
			positive_n: n >= 0
		do
			ds_make_map (n)
			control := Unknown_constant
		end

end
