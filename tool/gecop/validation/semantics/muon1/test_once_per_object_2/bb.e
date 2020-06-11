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
			f
			g
		end

	f
		once ("OBJECT")
			print ("Calling f in " + name + "%N")
		end

	g
		do
			print ("Calling g in " + name + "%N")
		end
		
end
