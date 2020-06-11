class BB

feature

	f: STRING
		once ("OBJECT")
			print ("Calling f%N")
			Result := "foo"
		end
	
end
