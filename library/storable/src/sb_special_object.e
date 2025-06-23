note

	description:

		"SPECIAL objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class SB_SPECIAL_OBJECT

inherit

	SB_REFERENCE_OBJECT
		redefine
			type, is_special
		end

feature -- Access

	type: SB_CLASS_TYPE
			-- Type

	storable_class: SB_CLASS
			-- Base class of `type'
		do
			Result := type.storable_class
		end

feature -- Measurement

	count: INTEGER_32
			-- Number of items
			-- (uint32)

	capacity: INTEGER_32
			-- Maximum number of items
			-- (uint32)

	lower: INTEGER_32 = 0
			-- Minimum index

	upper: INTEGER_32
			-- Maximum index
		do
			Result := (count + lower - 1)
		ensure
			definition: Result = (count + lower - 1)
		end

	elem_size: NATURAL_32
			-- Size of each item
			-- (uint32)

feature -- Status report

	is_special: BOOLEAN = True
			-- Is current object a SPECIAL object?

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid item index?
		do
			Result := (i >= 0 and i < count)
		ensure then
			definition: Result = (i >= 0 and i < count)
		end

feature -- Setting

	set_capacity (a_capacity: like capacity)
			-- Set `capacity' to `a_capacity'.
		do
			capacity := a_capacity
		ensure
			capacity_set: capacity = a_capacity
		end

	set_elem_size (a_elem_size: like elem_size)
			-- Set `elem_size' to `a_elem_size'.
		do
			elem_size := a_elem_size
		ensure
			elem_size_set: elem_size = a_elem_size
		end

end
