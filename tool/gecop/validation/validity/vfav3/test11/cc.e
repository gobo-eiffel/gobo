class CC

feature
		
	f (i: INTEGER)
		do
			print ("Failed 1")
		end

	g alias "()" (i: INTEGER)
		do
			print ("Failed 2")
		end

end
