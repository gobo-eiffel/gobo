indexing

	description:

		"Eiffel comma-separated list of feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FEATURE_NAME_LIST

inherit

	ET_AST_NODE

	KL_IMPORTED_FIXED_ARRAY_TYPE [ET_FEATURE_NAME_ITEM]

feature {NONE} -- Initialization

	make is
			-- Create a new empty feature name list.
		do
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty feature name list with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			storage := fixed_array.make (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): ET_FEATURE_NAME_ITEM is
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (count - i)
		ensure
			item_not_void: Result /= Void
		end

	feature_name (i: INTEGER): ET_FEATURE_NAME is
			-- Feature name at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).feature_name_item
		ensure
			feature_name_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of feature names in list

	capacity: INTEGER is
			-- Maximum number of feature names in list
		do
			if storage /= Void then
				Result := storage.count
			end
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no feature name in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current list?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if a_name.same_feature_name (feature_name (i)) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
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
			first: item (1) = an_item
		end

feature {NONE} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Internal storage

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_FEATURE_NAME_ITEM] is
			-- Fixed array routines
		once
			!! Result
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_positive: count >= 0
	consistent_count: count <= capacity
	storage_not_void: not is_empty implies storage /= Void

end -- class ET_FEATURE_NAME_LIST
