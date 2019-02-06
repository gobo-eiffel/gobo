class BB

inherit

	CC
		rename
			g as h alias "+"
		end

feature

	f alias "+" (i: INTEGER): INTEGER
		do
			Result := i
		end
		
end
