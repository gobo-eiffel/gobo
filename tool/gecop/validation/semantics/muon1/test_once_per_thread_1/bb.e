class BB

inherit

	THREAD
		rename
			make as make_thread
		end
	
create

	make

feature

	make (a_name: STRING)
		do
			name := a_name
			make_thread
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
		once ("THREAD")
			print ("Calling f in " + name + "%N")
			Result := "foo"
		end

	g: STRING
		do
			print ("Calling g in " + name + "%N")
			Result := "foo"
		end
		
end
