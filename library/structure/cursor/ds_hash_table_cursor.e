indexing

	description:

		"Cursors for hash table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_HASH_TABLE_CURSOR [G, K -> HASHABLE]

inherit

	DS_BILINEAR_CURSOR [G]

	DS_DYNAMIC_CURSOR [G]

creation

	make

feature {NONE} -- Initialization

	make (hash_table: like container) is
			-- Create a new cursor for `hash_table'.
		require
			hash_table_not_void: hash_table /= Void
		do
			container := hash_table
			position := -1
		ensure
			container_set: container = hash_table
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
		do
			Result := container.storage.item (position).first
		end

	key: K is
			-- Key at cursor position
		do
			Result := container.storage.item (position).second
		end

	index: INTEGER is
			-- Current cursor position
		local
			i, nb: INTEGER
			hash_table: like container
		do
			if before then
				Result := 0
			elseif after then
				Result := container.count + 1
			else
				from
					nb := position
					hash_table := container
				until
					i > nb
				loop
					if hash_table.valid_position (i) then
						Result := Result + 1
					end
					i := i + 1
				end
			end
		end

	container: DS_HASH_TABLE [G, K]
			-- Hash table traversed

feature -- Status report

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		do
			Result := position > container.capacity
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		do
			Result := position < 0
		end

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		local
			i: INTEGER
			hash_table: like container
		do
			if not container.is_empty then
				from
					hash_table := container
				until
					hash_table.valid_position (i)
				loop
					i := i + 1
				end
				Result := position = i
			end
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		local
			i: INTEGER
			hash_table: like container
		do
			if not container.is_empty then
				from
					hash_table := container
					i := hash_table.capacity
				until
					hash_table.valid_position (i)
				loop
					i := i - 1
				end
				Result := position = i
			end
		end

	is_valid: BOOLEAN is
			-- Is cursor valid?
		do
			Result := off or else
				container.valid_position (position)
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		local
			i: INTEGER
			hash_table: like container
		do
			if container.is_empty then
				position := container.capacity + 1
			else
				from
					hash_table := container
				until
					hash_table.valid_position (i)
				loop
					i := i + 1
				end
				position := i
			end
		end

	finish is
			-- Move cursor to last position.
		local
			i: INTEGER
			hash_table: like container
		do
			if container.is_empty then
				position := -1
			else
				from
					hash_table := container
					i := hash_table.capacity
				until
					hash_table.valid_position (i)
				loop
					i := i - 1
				end
				position := i
			end
		end

	forth is
			-- Move cursor to next position.
		local
			i, nb: INTEGER
			hash_table: like container
		do
			from
				i := position + 1
				hash_table := container
				nb := hash_table.capacity
			until
				i > nb or else hash_table.valid_position (i)
			loop
				i := i + 1
			end
			position := i
		end

	back is
			-- Move cursor to previous position.
		local
			i: INTEGER
			hash_table: like container
		do
			from
				i := position - 1
				hash_table := container
			until
				i < 0 or else hash_table.valid_position (i)
			loop
				i := i - 1
			end
			position := i
		end

	go_to (i: INTEGER) is
			-- Move cursor to `i'-th position.
		local
			j, k: INTEGER
			hash_table: like container
		do
			if i = 0 then
				position := -1
			elseif i = container.count + 1 then
				position := container.capacity + 1
			else
				from
					hash_table := container
				until
					j = i
				loop
					if hash_table.valid_position (k) then
						j := j + 1
					end
					k := k + 1
				end
				position := k - 1
			end
		end

feature -- Element change

	put (v: G) is
			-- Replace item at cursor position by `v'.
		do
			container.storage.item (position).put_first (v)
		end

feature {DS_HASH_TABLE} -- Implementation

	position: INTEGER
			-- Internal position in hash table

end -- class DS_HASH_TABLE_CURSOR
