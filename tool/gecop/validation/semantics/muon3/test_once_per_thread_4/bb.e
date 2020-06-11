class BB

inherit

	THREAD
	
create

	make

feature
	
	execute
		do
			print ("First call to f%N")
			f (False)
		end

	f (a_recursive_call: BOOLEAN)
		once
			print ("Calling f%N")
			if not a_recursive_call then
				print ("Second (recursive) call to f%N")
				f (True)
			end
		end
		
end
