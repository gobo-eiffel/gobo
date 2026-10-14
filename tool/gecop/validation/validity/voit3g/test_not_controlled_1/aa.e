class AA

create

	make

feature

	make
		local
			s: separate STRING
		do
			create s.make_from_separate ("eiffel")
			across s as c loop end
			print ("Failed")
		end
	
end
