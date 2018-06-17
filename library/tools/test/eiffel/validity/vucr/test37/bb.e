class BB

create

	make
	
feature

	make
		do
			h := "gobo"
		end
		
	f: INTEGER
		require
			g
		do
		end

	g: BOOLEAN
		do
			Result := Current.h.out /= Void
		end

	h: STRING
	
end
