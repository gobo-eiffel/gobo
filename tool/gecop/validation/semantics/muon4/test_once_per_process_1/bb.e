class BB

feature
	
	execute
		do
			print ("First call to f%N")
			print ("Value of first call: " + f + "%N")
			print ("Second call to f%N")
			print ("Value of second call: " + f + "%N")
		end

	f: STRING
		once ("PROCESS")
			print ("Calling f%N")
			Result := "foo"
		end
		
end
