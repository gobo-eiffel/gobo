class BB

inherit

	THREAD

create

	make

feature
	
	execute
		do
			f
		end

	f
		once ("PROCESS")
			print ("Calling f%N")
		end
	
end
