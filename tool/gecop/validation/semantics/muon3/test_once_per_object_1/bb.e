class BB

feature
	
	execute
		do
			print ("First call to f%N")
			f
			print ("Second call to f%N")
			f
		end

	f
		once ("OBJECT")
			print ("Calling f%N")
		end
		
end
