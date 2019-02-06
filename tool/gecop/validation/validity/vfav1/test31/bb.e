class BB

feature

	f alias "+" (i: INTEGER): INTEGER
		do
			Result := i
		end

	infix "+" (i: INTEGER): INTEGER
		do
			Result := i
		end
		
end
