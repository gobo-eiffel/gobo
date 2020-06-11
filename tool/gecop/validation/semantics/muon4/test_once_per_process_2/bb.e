class BB

feature
	
	execute
		do
			print ("First call to f%N")
			print ("Value of first call: " + f (False) + "%N")
		end

	f (a_recursive_call: BOOLEAN): STRING
		once ("PROCESS")
			print ("Calling f%N")
			Result := "foo"
			if not a_recursive_call then
				print ("Second (recursive) call to f%N")
				print ("Value of second call: " + f (True) + "%N")
			end
			Result := "bar"
		end
		
end
