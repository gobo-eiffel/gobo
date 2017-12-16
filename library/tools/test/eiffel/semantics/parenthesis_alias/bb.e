class BB

inherit

	ITERABLE [INTEGER]
	
	ITERATION_CURSOR [INTEGER]
	
feature

	f alias "()" (i: INTEGER): BOOLEAN
		do
			if i = 1 then
				Result := True
			end
		end

	item: INTEGER
		do
			Result := 0
		end
	
	after: BOOLEAN
		
	forth
		do
			after := True
		end
		
	new_cursor: BB
		do
			Result := Current
		end
		
end