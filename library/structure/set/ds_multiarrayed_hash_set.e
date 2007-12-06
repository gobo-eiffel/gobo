indexing

	description:

		"Sets implemented with multi-arrays. Items are hashed %
		%using `hash_code' from HASHABLE."

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_MULTIARRAYED_HASH_SET [G -> HASHABLE]

inherit

	DS_MULTIARRAYED_SPARSE_SET [G]
		redefine
			new_cursor
		end

create

	make, make_equal, make_default,
	make_with_chunk_size,
	make_equal_with_chunk_size

feature -- Access

	new_cursor: DS_MULTIARRAYED_HASH_SET_CURSOR [G] is
			-- New external cursor for traversal
		do
			create Result.make (Current)
		end

feature {NONE} -- Implementation

	initialize_hash_function is
			-- Initialize `hash_function'.
		do
-- Not accepted by ISE 6.1.
--			set_hash_function (agent {G}.hash_code)
			set_hash_function (agent hash_code)
		end

	hash_code (v: G): INTEGER is
			-- Hash code of `v'
		require
			v_not_void: v /= Void
		do
			Result := v.hash_code
		ensure
			hash_code_not_negative: Result >= 0
		end

end
