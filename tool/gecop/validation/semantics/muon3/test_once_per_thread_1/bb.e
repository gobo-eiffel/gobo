class BB

inherit

	THREAD
	
create

	make

feature
	
	execute
		do
			print ("First call to f%N")
			f
			print ("Second call to f%N")
			f
		end

	f
		once ("THREAD")
			print ("Calling f%N")
		end
		
end
