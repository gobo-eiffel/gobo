class BB

feature

	f: STRING
		once ("OBJECT")
			print ("Calling f%N")
			Result := "foo"
		end

	g: STRING
		do
			print ("Calling g%N")
			Result := "foo"
		end
		
end
