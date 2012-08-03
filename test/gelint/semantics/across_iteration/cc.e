class CC [G]

inherit

	ITERATION_CURSOR [G]

create

	make

feature {NONE} -- Initialization

	make (a_items: ARRAY [G])
			-- Create a new cursor to traverse `a_items'.
		require
			a_items_not_void: a_items /= Void
		do
			items := a_items
			index := items.lower
		ensure
			items_set: items = a_items
		end
		
feature -- Access

	item: G
			-- Item at position `index'
		do
			Result := items.item (index)
		end

	index: INTEGER
			-- Index in `items'
			
feature -- Status report	

	after: BOOLEAN
			-- <Precursor>
		do
			Result := index > items.upper
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		do
			index := index + 1
		end

feature {NONE} -- Implementation

	items: ARRAY [G]
			-- Items to be traversed
			
invariant

	items_not_void: items /= Void
	
end