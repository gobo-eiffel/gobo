class BB

inherit

	THREAD
	
create

	make

feature
	
	execute
		do
			print ("First call to f%N")
			print ("Value of first call: " + f ("foo") + "%N")
			print ("Second call to f%N")
			print ("Value of second call: " + f ("bar") + "%N")
		end

	f (s: STRING): STRING
		once
			print ("Calling f%N")
			Result := s
		end
		
end
