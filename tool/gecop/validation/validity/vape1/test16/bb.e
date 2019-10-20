class BB

inherit

	ITERABLE [detachable ANY]
	
	ITERATION_CURSOR [detachable ANY]

feature {AA}

	new_cursor: BB
		do
			Result := Current
		end

feature {ANY}

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
		

