class AA

create

	make

feature

	make
		do
			print (f)
			print ("%N")
			print (g)
			print ("%N")
		end

	f: STRING
		once ("PROCESS")
			print ("Calling f%N")
			Result := "foo"
		end

	g: STRING
		do
			print ("Calling g%N")
			Result := "foo"
		end
		
end
