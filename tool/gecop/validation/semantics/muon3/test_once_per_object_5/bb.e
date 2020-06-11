class BB

feature
	
	execute
		do
			print ("First call to f%N")
			f (1)
			print ("Second call to f%N")
			f (2)
		end

	f (i: INTEGER)
		once ("OBJECT")
			print ("Calling f%N")
		end
		
end
