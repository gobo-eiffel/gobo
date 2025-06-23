note

	description:

		"Addresses of objects from Storable files not resolved yet"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_UNRESOLVED_ADDRESS

create

	make

feature {NONE} -- Initialization

	make (an_address: like address; an_object: like object; an_index: like index)
			-- Create a new unresolved address.
		require
			an_object_not_void: an_object /= Void
			an_index_valid: an_object.valid_index (an_index)
		do
			address := an_address
			object := an_object
			index := an_index
		ensure
			address_set: address = an_address
			object_set: object = an_object
			index_set: index = an_index
		end

feature -- Access

	address: NATURAL_64
			-- Address

	object: SB_COMPOSITE_OBJECT
			-- Object in which this address appears

	index: INTEGER
			-- Index in `object'

invariant

	object_not_void: object /= Void
	valid_index: object.valid_index (index)

end
