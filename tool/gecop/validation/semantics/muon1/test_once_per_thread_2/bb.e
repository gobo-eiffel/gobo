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
			f
			g
		end

	f
		once ("THREAD")
			print ("Calling f in " + name + "%N")
		end

	g
		do
			print ("Calling g in " + name + "%N")
		end
		
end
