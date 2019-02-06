class BB

feature

	f alias "+" (i: INTEGER): INTEGER
		do
			Result := i
		end

	g alias "+": INTEGER
		do
			Result := 4
		end
		
end
