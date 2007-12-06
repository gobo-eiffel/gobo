indexing

	description:

		"Hash tables, implemented with single arrays. %
		%Keys are hashed using `hash_code' from HASHABLE."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2000-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_HASH_TABLE [G, K -> HASHABLE]

inherit

	DS_ARRAYED_SPARSE_TABLE [G, K]
		redefine
			new_cursor
		end

create

	make, make_equal, make_default,
	make_map, make_map_equal, make_map_default,
	make_with_equality_testers

feature -- Access

	new_cursor: DS_HASH_TABLE_CURSOR [G, K] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	initialize_hash_function is
			-- Initialize `hash_function'.
		do
-- Not accepted by ISE 6.1.
--			set_hash_function (agent {K}.hash_code)
			set_hash_function (agent hash_code)
		end

	hash_code (k: K): INTEGER is
			-- Hash code of `k'
		require
			k_not_void: k /= Void
		do
			Result := k.hash_code
		ensure
			hash_code_not_negative: Result >= 0
		end

end
