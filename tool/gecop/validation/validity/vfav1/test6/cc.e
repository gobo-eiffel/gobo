class CC

feature

	f alias "-" (i: INTEGER): INTEGER
		do
			Result := 5 - i
		end

	g alias "+" (i: INTEGER): INTEGER
		do
			Result := 10 + i
		end

end
