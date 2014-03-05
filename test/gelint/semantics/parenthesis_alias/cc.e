class CC

inherit

	ITERABLE [INTEGER]
	
	ITERATION_CURSOR [INTEGER]
	
feature

	f alias "()" (i: INTEGER)
		do
			item := i
		end
		
	item: INTEGER
	
	after: BOOLEAN
		
	forth
		do
			after := True
		end
		
	new_cursor: CC
		do
			Result := Current
		end
		
end