class BB

inherit

	ITERABLE [detachable ANY]
	
	ITERATION_CURSOR [detachable ANY]

feature

	new_cursor: ITERATION_CURSOR [detachable ANY]
		do
			Result := Current
		end

feature {AA}

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
		

