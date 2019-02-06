class CC

feature
		
	f (i: INTEGER): INTEGER
		do
			print ("Failed 1")
		end

	g alias "[]" (i: INTEGER): INTEGER
		do
			print ("Failed 2")
		end

end
