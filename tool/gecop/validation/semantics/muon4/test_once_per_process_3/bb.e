class BB

inherit

	THREAD

create

	make

feature
	
	execute
		do
			print (f + "%N")
		end

	f: STRING
		once ("PROCESS")
			print ("Calling f%N")
			Result := "foo"
		end
	
end
