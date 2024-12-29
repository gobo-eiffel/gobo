note
	description: "[
			Equivalent of HASH_TABLE [NATURAL_32, ANY], since this type cannot be written
			as ANY does not inherit from HASHABLE
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date: 2018-01-22 11:21:50 +0000 (Mon, 22 Jan 2018) $"
	revision: "$Revision: 101254 $"

class
	SED_OBJECTS_TABLE

inherit
	SED_ABSTRACT_OBJECTS_TABLE
		undefine
			copy, is_equal
		end

	HASH_TABLE [NATURAL_32, POINTER]
		rename
			make as table_make,
			capacity as table_capacity,
			count as capacity,
			wipe_out as table_wipe_out
		export
			{SED_OBJECTS_TABLE} all
		redefine
			hash_code_of
		end

create
	make

create {SED_OBJECTS_TABLE}
	table_make

feature {NONE} -- Initialization

	make (n: NATURAL_32)
			-- Initialize current instance
		do
			table_make (n.to_integer_32)
			last_index := 0
		end

feature -- Access

	index (an_obj: separate ANY): NATURAL_32
			-- Index of `an_obj' in Current
		local
			hash_value, increment, l_pos, l_new_pos, l_item_pos, l_capacity: INTEGER
			stop: INTEGER
			l_keys: like keys
			l_indexes: like indexes_map
			l_key: POINTER
		do
			from
				l_key := $an_obj
				l_keys := keys
				l_indexes := indexes_map
				l_capacity := table_capacity
				stop := l_capacity
				hash_value := hash_code_of (l_key)
				increment := 1 + hash_value \\ (l_capacity - 1)
				l_item_pos := (hash_value \\ l_capacity) - increment
			until
				stop = 0
			loop
					-- Go to next increment.
				l_item_pos := (l_item_pos + increment) \\ l_capacity
				l_pos := l_indexes [l_item_pos]
				if l_pos >= 0 and then l_keys.item (l_pos) = l_key then
					stop := 1
					Result := content.item (l_pos)
				elseif l_pos = ht_impossible_position then
					stop := 1
					Result := last_index + 1
					last_index := Result
					l_new_pos := l_keys.count
						-- Temporary fix until reference with copy semantics are properly
						-- handled (they actually causes the table to grow even if we
						-- allocated Current with the right capacity.)
					if l_new_pos < l_keys.capacity then
						l_indexes.put (l_new_pos, l_item_pos)
						content.force (Result, l_new_pos)
						l_keys.force ($an_obj, l_new_pos)
						capacity := capacity + 1
					else
						put (Result, l_key)
					end
				end
				stop := stop - 1
			end
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		do
			last_index := 0
			table_wipe_out
		end

feature {NONE} -- Implementation

	hash_code_of (p: POINTER): INTEGER
			-- Efficient implementation of {POINTER}.hash_code where we assume that POINTER
			-- values are aligned to the size of the POINTER, this will reduce the number
			-- of conflicts.
		do
			Result := c_hash_code_of (p)
		end

	c_hash_code_of (p: POINTER): INTEGER
			-- C implementation of `hash_code_of`.
		external
			"C inline"
		alias
			"return (EIF_INTEGER_32) (0x7FFFFFF & (((rt_uint_ptr) $p) / sizeof(rt_uint_ptr)));"
		end

invariant
	not_is_dotnet: not {PLATFORM}.is_dotnet

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2018, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
