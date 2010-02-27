indexing

	description:
	"[
		Eiffel AST lists equiped with a hashing search where insertions to
		and removals from the tail are optimized.
	]"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TAIL_HASH_LIST [G -> HASHABLE]

inherit

	ET_TAIL_LIST [G]
		redefine
			make,
			make_with_capacity,
			has,
			put_last,
			force_last,
			append_last,
			put,
			remove_last,
			remove,
			wipe_out,
			resize
		end

	KL_IMPORTED_SPECIAL_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new empty list.
		do
			count := 0
			storage := Void
			slots := Void
			clashes := Void
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty list with capacity `nb'.
		local
			m: INTEGER
		do
			count := 0
			if nb > 0 then
				storage := fixed_array.make (nb + 1)
				clashes := SPECIAL_INTEGER_.make (nb + 1)
				m := new_modulus (nb)
				slots := SPECIAL_INTEGER_.make (m)
			else
				storage := Void
				slots := Void
				clashes := Void
			end
		end

feature -- Status report

	has (an_item: like item): BOOLEAN is
			-- Does list contain `an_item'?
			-- (Use `=' as comparison criterion.)
		local
			i, h: INTEGER
		do
			if count > 0 then
				from
					h := hash_position (an_item)
					i := slots.item (h)
				until
					i = No_position
				loop
					if an_item = storage.item (i) then
						Result := True
							-- Jump out of the loop.
						i := No_position
					else
						i := clashes.item (i)
					end
				end
			end
		end

feature -- Element change

	put_last (an_item: like item) is
			-- Put `an_item' at last position in list.
		local
			i, h: INTEGER
		do
			i := count + 1
			h := hash_position (an_item)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			storage.put (an_item, i)
			count := i
		end

	force_last (an_item: like item) is
			-- Put `an_item' at last position in list.
			-- Resize list if necessary.
		local
			i, h: INTEGER
		do
			i := count + 1
			if i > capacity then
				resize (new_capacity (i))
			end
			h := hash_position (an_item)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			storage.put (an_item, i)
			count := i
		end

	append_last (other: ET_TAIL_LIST [like item]) is
			-- Add items of `other' to the end of list.
			-- Keep items of `other' in the same order.
			-- Resize list if necessary.
		local
			i, nb: INTEGER
			j, h: INTEGER
			l_item: like item
		do
			nb := other.count
			if count + nb > capacity then
				resize (new_capacity (count + nb))
			end
			j := count
			from i := 1 until i > nb loop
				j := j + 1
				l_item := other.item (i)
				h := hash_position (l_item)
				clashes.put (slots.item (h), j)
				slots.put (j, h)
				storage.put (l_item, j)
				i := i + 1
			end
			count := j
		end

	put (an_item: like item; i: INTEGER) is
			-- Put `an_item' at index `i' in list.
		local
			j: INTEGER
			l_item: like item
			h, l_previous: INTEGER
		do
			l_item := storage.item (i)
			h := hash_position (l_item)
			j := slots.item (h)
			if j = i then
				slots.put (clashes.item (j), h)
			else
				from
					l_previous := j
					j := clashes.item (j)
				until
					j = i
				loop
					l_previous := j
					j := clashes.item (j)
				end
				clashes.put (clashes.item (j), l_previous)
			end
			h := hash_position (an_item)
			clashes.put (slots.item (h), i)
			slots.put (i, h)
			storage.put (an_item, i)
		end

feature -- Removal

	remove_last is
			-- Remove last item.
		local
			j: INTEGER
			dead_item: like item
			l_item: like item
			h, l_previous: INTEGER
		do
			l_item := storage.item (count)
			h := hash_position (l_item)
			j := slots.item (h)
			if j = count then
				slots.put (clashes.item (j), h)
			else
				from
					l_previous := j
					j := clashes.item (j)
				until
					j = count
				loop
					l_previous := j
					j := clashes.item (j)
				end
				clashes.put (clashes.item (j), l_previous)
			end
			storage.put (dead_item, count)
			count := count - 1
		end

	remove (i: INTEGER) is
			-- Remove item at index `i'.
		local
			j, nb: INTEGER
			dead_item: like item
			l_item: like item
			h, l_previous: INTEGER
		do
			l_item := storage.item (i)
			h := hash_position (l_item)
			j := slots.item (h)
			if j = i then
				slots.put (clashes.item (j), h)
			else
				from
					l_previous := j
					j := clashes.item (j)
				until
					j = i
				loop
					l_previous := j
					j := clashes.item (j)
				end
				clashes.put (clashes.item (j), l_previous)
			end
			j := slots.count - 1
			from until j < 0 loop
				if slots.item (j) > i then
					slots.put (slots.item (j) - 1, j)
				end
				j := j - 1
			end
			from j := count until j < 1 loop
				if clashes.item (j) > i then
					clashes.put (clashes.item (j) - 1, j)
				end
				j := j - 1
			end
			j := i
			nb := count - 1
			from until j > nb loop
				storage.put (storage.item (j + 1), j)
				j := j + 1
			end
			storage.put (dead_item, j)
			count := count - 1
		end

	wipe_out is
			-- Remove all items.
		local
			i: INTEGER
			dead_item: like item
		do
			if count > 0 then
				from i := count until i < 1 loop
					storage.put (dead_item, i)
					clashes.put (No_position, i)
					i := i - 1
				end
				i := slots.count - 1
				from until i < 0 loop
					slots.put (No_position, i)
					i := i - 1
				end
				count := 0
			end
		end

feature -- Resizing

	resize (nb: INTEGER) is
			-- Resize to accommodate at least `nb' items.
		local
			m: INTEGER
			i, h: INTEGER
		do
			if nb > capacity then
				m := new_modulus (nb)
				if storage = Void then
					storage := fixed_array.make (nb + 1)
					clashes := SPECIAL_INTEGER_.make (nb + 1)
					slots := SPECIAL_INTEGER_.make (m)
				else
					storage := fixed_array.resize (storage, nb + 1)
					clashes := SPECIAL_INTEGER_.resize (clashes, nb + 1)
					slots := SPECIAL_INTEGER_.resize (slots, m)
				end
				from
					i := slots.count - 1
				until
					i < 0
				loop
					slots.put (No_position, i)
					i := i - 1
				end
				from
					i := count
				until
					i < 1
				loop
					h := hash_position (storage.item (i))
					clashes.put (slots.item (h), i)
					slots.put (i, h)
					i := i - 1
				end
			end
		end

feature {NONE} -- Hashing

	slots: SPECIAL [INTEGER]
			-- Indexes in `storage', indexed by hash codes from 0 to `modulus' - 1

	clashes: SPECIAL [INTEGER]
			-- Indexes in `storage' when there are clashes
			-- in `slots'. Each entry points to the next alternative
			-- until `No_position' is reached.

	modulus: INTEGER is
			-- Upper bound of `slots'
		require
			capacity_positive: capacity > 0
		do
			Result := slots.count
		ensure
			modulus_positive: Result > 0
		end

	hash_position (a_item: like item): INTEGER is
			-- Hash position of `k' in `slots'
		require
			a_item_not_void: a_item /= Void
			capacity_positive: capacity > 0
		do
			Result := a_item.hash_code \\ modulus
		ensure
			valid_position: Result >= 0 and Result < modulus
		end

feature {NONE} -- Configuration

	new_modulus (a_capacity: INTEGER): INTEGER is
			-- Value for `modulus' which can accommodate
			-- `a_capacity' items
		require
			a_capacity_not_negative: a_capacity >= 0
		do
			Result := (a_capacity + 1) * 3 // 2
		ensure
			modulus_large_enough: Result > a_capacity
		end

feature {NONE} -- Constants

	No_position: INTEGER is 0
			-- Not valid position mark

invariant

	capacity_constraint: capacity < modulus
	slots_not_void: capacity > 0 implies slots /= Void
	clashes_not_void: capacity > 0 implies clashes /= Void
	clashes_count: capacity > 0 implies clashes.count = storage.count
	slots_count: capacity > 0 implies slots.count = modulus

end
