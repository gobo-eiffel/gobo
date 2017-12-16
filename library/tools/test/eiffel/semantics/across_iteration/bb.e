class BB [G]

inherit

	ITERABLE [G]

create

	make

feature {NONE} -- Initialization

	make (a_items: ARRAY [G])
			-- Create a new container to traverse `a_items'.
		require
			a_items_not_void: a_items /= Void
		do
			items := a_items
		ensure
			items_set: items = a_items
		end
		
feature -- Access

	new_cursor: CC [G]
			-- <Precursor>
		do
			create Result.make (items)
		end

feature {NONE} -- Implementation

	items: ARRAY [G]
			-- Items to be traversed
			
invariant

	items_not_void: items /= Void

end