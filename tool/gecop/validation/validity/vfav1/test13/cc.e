class CC

feature

	f (i: INTEGER): INTEGER
		do
			Result := i
		end

	g alias "+" (i: INTEGER): INTEGER
		do
			Result := i
		end
		
end
