indexing

	description:

		"Eiffel AST lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_LIST [G]

inherit

	KL_IMPORTED_FIXED_ARRAY_TYPE [G]

feature {NONE} -- Initialization

	make is
			-- Create a new empty list.
		do
			count := 0
			storage := Void
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty list with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			count := 0
			if nb > 0 then
				storage := fixed_array.make (nb)
			else
				storage := Void
			end
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): G is
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (count - i)
		ensure
			item_not_void: Result /= Void
		end

	first: G is
			-- First item
		require
			not_empty: not is_empty
		do
			Result := item (1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: G is
			-- Last item
		require
			not_empty: not is_empty
		do
			Result := item (count)
		ensure
			last_not_void: Result /= Void
			definition: Result = item (count)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items in list

	capacity: INTEGER is
			-- Maximum number of items in list
		do
			if storage /= Void then
				Result := storage.count
			end
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no item in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Element change

	put_first (an_item: like item) is
			-- Put `an_item' at first position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			storage.put (an_item, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			first_set: first = an_item
		end

feature {NONE} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Internal storage

	fixed_array: KL_FIXED_ARRAY_ROUTINES [G] is
			-- Fixed array routines
		deferred
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_positive: count >= 0
	consistent_count: count <= capacity
	storage_not_void: not is_empty implies storage /= Void

end
