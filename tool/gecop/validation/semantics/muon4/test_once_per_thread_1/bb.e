class BB

inherit

	THREAD
	
create

	make

feature
	
	execute
		do
			print ("First call to f%N")
			print ("Value of first call: " + f + "%N")
			print ("Second call to f%N")
			print ("Value of second call: " + f + "%N")
		end

	f: STRING
		once ("THREAD")
			print ("Calling f%N")
			Result := "foo"
		end
		
end
