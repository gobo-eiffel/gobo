note

	description:

		"Special objects of REAL_64 objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SPECIAL_REAL_64_OBJECT

inherit

	SB_SPECIAL_BASIC_OBJECT
		redefine
			is_special_real_64
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address; a_count: like count)
			-- Create a new empty special object of REAL_64s.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
			flags := a_flags
			address := an_address
			count := a_count
			capacity := a_count
			elem_size := 0
			create items.make_filled (0.0, count)
		ensure
			type_set: type = a_type
			flags_set: flags = a_flags
			address_set: address = an_address
			count_set: count = a_count
			capacity_set: capacity = a_count
			elem_size_set: elem_size = 0
		end

feature -- Access

	item (i: INTEGER): REAL_64
			-- Item at index `i'
		require
			valid_index: valid_index (i)
		do
			Result := items.item (i)
		end

	item_type (a_schema: SB_SCHEMA): SB_TYPE
			-- Type of items in `a_schema'
		do
			Result := a_schema.real_64_type
		end

feature -- Output

	item_out (i: INTEGER): STRING
			-- Textual representation of item at index `i'
		do
			Result := item (i).out
			if Result.is_integer then
				Result.append_string (".0")
			end
		end

feature -- Status report

	is_special_real_64: BOOLEAN = True
			-- Is current object a SPECIAL object of REAL_64s?

feature -- Element change

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i'.
		require
			valid_index: valid_index (i)
		do
			items.put (an_item, i)
		end

feature {SB_WRITER} -- Implementation

	items: SPECIAL [REAL_64]
			-- Items

invariant

	items_not_void: items /= Void
	items_count: items.count = count

end
