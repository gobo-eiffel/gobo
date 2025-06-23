note

	description:

		"TUPLE objects read from Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TUPLE_OBJECT

inherit

	SB_REFERENCE_OBJECT
		redefine
			type,
			is_tuple,
			has_reference
		end

	SB_COMPOSITE_OBJECT
		undefine
			is_equal
		redefine
			count,
			is_tuple
		end

create

	make

feature {NONE} -- Initialization

	make (a_type: like type; a_flags: like flags; an_address: like address; a_count: like count)
			-- Create a new empty tuple object.
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

	type: SB_TUPLE_TYPE
			-- Type

	storable_class: SB_CLASS
			-- Base class of `type'
		do
			Result := type.storable_class
		end

	item (i: INTEGER): detachable SB_OBJECT
			-- Item at index `i'
		do
			Result := items.item (i - 1)
		end

	object_comparison_attribute: detachable SB_BOOLEAN_OBJECT
			-- 'object_comparison' attribute, if any
			-- (Was introduced in independent_store_6_0.)

feature -- Measurement

	count: INTEGER_32
			-- Number of items
			-- (uint32)

	capacity: INTEGER_32
			-- Maximum number of items
			-- (uint32)

	elem_size: NATURAL_32
			-- Size of each items
			-- (uint32)

feature -- Measurement

	lower: INTEGER_32 = 1
			-- Minimum index

feature -- Status report

	is_tuple: BOOLEAN = True
			-- Is current object a TUPLE object?

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid attribute index?
		do
			Result := (i >= 1 and i <= count)
		ensure then
			definition: Result = (i >= 1 and i <= count)
		end

	has_reference (a_object: SB_REFERENCE_OBJECT): BOOLEAN
			-- Does current object have `a_object' in one of its fields?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i) = a_object then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i'.
		do
			items.put (an_item, i - 1)
		end

feature -- Setting

	set_object_comparison_attribute (a_boolean: like object_comparison_attribute)
			-- Set `object_comparison_attribute' to `a_boolean'.
		do
			object_comparison_attribute := a_boolean
		ensure
			object_comparison_attribute_set: object_comparison_attribute = a_boolean
		end

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
