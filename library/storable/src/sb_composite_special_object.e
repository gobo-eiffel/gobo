note

	description:

		"Special objects containing non-basic objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_COMPOSITE_SPECIAL_OBJECT

inherit

	SB_SPECIAL_OBJECT
		redefine
			has_reference,
			is_composite_special
		end

	SB_COMPOSITE_OBJECT
		undefine
			is_equal, count, is_special, upper
		redefine
			is_composite_special
		end

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address; a_count: like count)
			-- Create a new empty composite special object.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
			flags := a_flags
			address := an_address
			count := a_count
			capacity := a_count
			elem_size := 0
			create items.make_filled (Void, count)
		ensure
			type_set: type = a_type
			flags_set: flags = a_flags
			address_set: address = an_address
			count_set: count = a_count
			capacity_set: capacity = a_count
			elem_size_set: elem_size = 0
		end

feature -- Access

	item (i: INTEGER): detachable SB_REFERENCE_OBJECT
			-- Item at index `i'
		do
			Result := items.item (i)
		end

feature -- Status report

	has_reference (a_object: SB_REFERENCE_OBJECT): BOOLEAN
			-- Does current object have `a_object' in one of its fields?
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if item (i) = a_object then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	is_composite_special: BOOLEAN = True
			-- Is current object a SPECIAL object of objects of non-basic type?

feature -- Element change

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i'.
		do
			items.put (an_item, i)
		end

end
