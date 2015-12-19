class MY_ITERATOR [G]

inherit

	ITERATION_CURSOR [G]

create

	make
	
feature

	make (a_item: G)
		do
			internal_item := a_item
			index := 1
		end
		
	item: G
			-- Item at current cursor position.
		do
			Result := internal_item
		end
	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		do
			Result := (index > 1)
		end

	forth
			-- Move to next position.
		do
			index := index + 1
		end
		
	internal_item: G
	
	index: INTEGER
	
end
