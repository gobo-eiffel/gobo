class CC

feature

	f (i: INTEGER): INTEGER
		do
			print ("Failed 1")
			Result := i
		end

	g alias "+" (i: INTEGER): INTEGER
		do
			print ("Failed 2")
			Result := i
		end
		
end
