note

	description:

		"Special objects of INTEGER_8 objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_SPECIAL_INTEGER_8_OBJECT

inherit

	SB_SPECIAL_BASIC_OBJECT
		redefine
			is_special_integer_8
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address; a_count: like count)
			-- Create a new empty special object of INTEGER_8s.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
			flags := a_flags
			address := an_address
			count := a_count
			capacity := a_count
			elem_size := 0
			create items.make_filled (0, count)
		ensure
			type_set: type = a_type
			flags_set: flags = a_flags
			address_set: address = an_address
			count_set: count = a_count
			capacity_set: capacity = a_count
			elem_size_set: elem_size = 0
		end

feature -- Access

	item (i: INTEGER): INTEGER_8
			-- Item at index `i'
		require
			valid_index: valid_index (i)
		do
			Result := items.item (i)
		end

	item_type (a_schema: SB_SCHEMA): SB_TYPE
			-- Type of items in `a_schema'
		do
			Result := a_schema.integer_8_type
		end

feature -- Output

	item_out (i: INTEGER): STRING
			-- Textual representation of item at index `i'
		do
			Result := item (i).out
		end

feature -- Status report

	is_special_integer_8: BOOLEAN = True
			-- Is current object a SPECIAL object of INTEGER_8s?

feature -- Element change

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i'.
		require
			valid_index: valid_index (i)
		do
			items.put (an_item, i)
		end

feature {SB_WRITER} -- Implementation

	items: SPECIAL [INTEGER_8]
			-- Items

invariant

	items_not_void: items /= Void
	items_count: items.count = count

end
