note
	date: "$Date$"
	revision: "$Revision$"

class
	DESCRIPTOR_CACHE

create {ENCODING_IMP}
	make

feature {NONE} -- Initialization

	make
			-- Create
		do
			create cache.make (2)
			create converted_pair.make (2)
		end

feature -- Operation

	put (a_cd: POINTER; a_conv_pair: READABLE_STRING_8)
			-- Cache `a_cd' by `a_conv_pair' as a key.
		do
			cache.force (a_cd, a_conv_pair)
		end

	search (a_conv_pair: READABLE_STRING_8)
			-- Search
		do
			cache.search (a_conv_pair)
		end

	record_converted_pair (a_to, a_from: READABLE_STRING_8)
			-- Record converted pair.
		local
			l_s: READABLE_STRING_8
		do
			l_s := a_to + a_from
			converted_pair.force (l_s, l_s)
		end

feature -- Querry

	found: BOOLEAN
			-- Found item by `search'?
		do
			Result := cache.found
		end

	found_item: POINTER
			-- Found item by `search' if `found'.
		require
			found: found
		do
			Result := cache.found_item
		end

	converted (a_to, a_from: READABLE_STRING_8): BOOLEAN
			-- Has `a_to' to `a_from' been converted once?
		do
			Result := converted_pair.has (a_to + a_from)
		end

feature {NONE} -- Implementation

	cache: HASH_TABLE [POINTER, READABLE_STRING_8]
			-- Cache for descriptor pointers.

	converted_pair: HASH_TABLE [READABLE_STRING_8, READABLE_STRING_8]
			-- Converted pairs.

feature -- Clean up

	clean_up
			-- Call `iconv_close' on all open descriptors.
		do
			cache.linear_representation.do_all (agent c_iconv_close)
			converted_pair.wipe_out
		end

feature {NONE} -- Externals

	c_iconv_close (a_cd: POINTER)
			-- Close `a_dc'
		external
			"C inline use <iconv.h>"
		alias
			"[
				if ($a_cd != NULL) {
					iconv_close((iconv_t) $a_cd);
				}
			]"
		end

invariant
	cache_not_void: cache /= Void

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
