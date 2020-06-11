class BB

feature
	
	execute
		do
			print ("First call to f%N")
			print ("Value of first call: " + f (False) + "%N")
		end

	f (a_recursive_call: BOOLEAN): STRING
		once ("OBJECT")
			print ("Calling f%N")
			Result := "foo"
			if not a_recursive_call then
				print ("Second (recursive) call to f%N")
				print ("Value of second call: " + void_or_out (f (True)) + "%N")
			end
			Result := "bar"
		end

	void_or_out (a: detachable ANY): STRING
		do
			if a /= Void then
				Result := a.out
			else
				Result := "Void"
			end
		end
		
end
