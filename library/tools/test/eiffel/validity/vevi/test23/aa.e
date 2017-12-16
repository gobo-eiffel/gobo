class AA

inherit

	ITERABLE [detachable ANY]
	
	ITERATION_CURSOR [detachable ANY]

create

	make

feature

	make
		do
			create b.make (Current)
		end
		
	b: BB

	new_cursor: ITERATION_CURSOR [detachable ANY]
		local
			s: ANY
		do
			s := b.out
			Result := Current
		end
		
	item: detachable ANY
		do
		end
	
	after: BOOLEAN
		do
			Result := True
		end
		
	forth
		do
		end
		
end
