note

	description:

		"Lists of Eiffel attributes used in Storable files"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_ATTRIBUTE_LIST

inherit

	ANY

	SB_SHARED_CONSTANTS
		export {NONE} all end

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new empty list.
		do
			make_with_capacity (0)
		ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new empty list with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			count := 0
			create storage.make_empty (nb)
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): SB_ATTRIBUTE
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i - 1)
		ensure
			item_not_void: Result /= Void
		end

	attribute_by_name (a_name: STRING): detachable like item
			-- Attribute with name `a_name';
			-- Void if none
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_attribute: like item
		do
			nb := count
			from i := 1 until i > nb loop
				l_attribute := item (i)
				if l_attribute.has_name (a_name) then
					Result := l_attribute
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	first: like item
			-- First item
		require
			not_empty: not is_empty
		do
			Result := item (1)
		ensure
			first_not_void: Result /= Void
			definition: Result = item (1)
		end

	last: like item
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

	capacity: INTEGER
			-- Maximum number of items in list
		do
			Result := storage.capacity
		end

feature -- Status report

	has_unknown: BOOLEAN
			-- Is the type of one of the attributes based on some
			-- classes which are not known by the schema?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).type.has_unknown then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	is_empty: BOOLEAN
			-- Is there no item in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Element change

	put_last (an_item: like item)
			-- Put `an_item' at last position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			storage.force (an_item, count)
			count := count + 1
			an_item.set_index (count)
		ensure
			one_more: count = old count + 1
			last_set: last = an_item
		end

	put (an_item: like item; i: INTEGER)
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			storage.put (an_item, i - 1)
			an_item.set_index (i)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

feature -- Initialization

	reset
			-- Reset current attributes.
		local
			i, nb: INTEGER
			l_attribute: like item
		do
			nb := count
			from i := 1 until i > nb loop
				l_attribute := item (i)
				if l_attribute.is_added then
						-- All attributes following this one
						-- are also added attributes (that's
						-- the way we inserted them).
					count := i - 1
					storage.keep_head (count)
					i := nb + 1
				else
					l_attribute.reset
				end
				i := i + 1
			end
		end

feature -- Resizing

	resize (n: INTEGER)
			-- Resize attribute list.
		require
			n_large_enough: n > capacity
		do
			storage := storage.aliased_resized_area (n)
		ensure
			capacity_set: capacity = n
			same_count: count = old count
		end

feature {NONE} -- Implementation

	storage: SPECIAL [like item]
			-- Internal storage

invariant

	count_positive: count >= 0
	consistent_count: count <= capacity
	storage_not_void: storage /= Void

end
