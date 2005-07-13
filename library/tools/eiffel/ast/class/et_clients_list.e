indexing

	description:

		"Eiffel lists of clients indexed by feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLIENTS_LIST

inherit

	KL_IMPORTED_SPECIAL_ROUTINES

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new empty list.
		do
			count := 0
			storage := Void
			keys := Void
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
				keys := SPECIAL_INTEGER_.make (nb)
			else
				storage := Void
			end
		ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	clients (a_feature: ET_FEATURE): ET_CLASS_NAME_LIST is
			-- Clients associated with `a_feature';
			-- Void if not found
		require
			a_feature_not_void: a_feature /= Void
			a_feature_registered: a_feature.is_registered
		local
			i, nb: INTEGER
			an_id: INTEGER
		do
			nb := count
			an_id := a_feature.id
			from i := 0 until i >= nb loop
				if keys.item (i) = an_id then
					Result := storage.item (i)
					i := nb + 1 -- Jump ouyt of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of clients in list

	capacity: INTEGER is
			-- Maximum number of clients in list
		do
			if storage /= Void then
				Result := storage.count
			end
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no clients in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Element change

	put_clients (a_clients: like clients; a_feature: ET_FEATURE) is
			-- Associated `a_clients' with `a_feature'.
		require
			a_clients_not_void: a_clients /= Void
			a_feature_not_void: a_feature /= Void
			a_feature_registered: a_feature.is_registered
			not_full: count < capacity
		do
			storage.put (a_clients, count)
			keys.put (a_feature.id, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			inserted: clients (a_feature) = a_clients
		end

feature {NONE} -- Implementation

	storage: SPECIAL [like clients]
			-- Internal storage

	keys: SPECIAL [INTEGER]
			-- Feature IDs

	fixed_array: KL_SPECIAL_ROUTINES [ET_CLASS_NAME_LIST] is
			-- Fixed array routines
		once
			create Result
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_positive: count >= 0
	same_voidness: (storage /= Void) = (keys /= Void)
	same_count: storage /= Void implies storage.count = keys.count
	storage_not_void: not is_empty implies storage /= Void and keys /= Void
	consistent_count: count <= capacity

end
