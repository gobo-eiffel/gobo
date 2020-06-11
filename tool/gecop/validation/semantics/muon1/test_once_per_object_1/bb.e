class BB
	
create

	make

feature

	make (a_name: STRING)
		do
			name := a_name
		end
		
	name: STRING
	
	execute
		do
			print (f)
			print ("%N")
			print (g)
			print ("%N")
		end

	f: STRING
		once ("OBJECT")
			print ("Calling f in " + name + "%N")
			Result := "foo"
		end

	g: STRING
		do
			print ("Calling g in " + name + "%N")
			Result := "foo"
		end
		
end
