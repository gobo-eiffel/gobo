class BB

inherit

	ITERABLE [detachable ANY]
	
	ITERATION_CURSOR [detachable ANY]

feature {ANY}

	new_cursor: BB
		do
			Result := Current
		end

	item: detachable ANY
		do
		end	

	forth
		do
		end

feature {AA}

	after: BOOLEAN
		do
			Result := True
		end

end
		

