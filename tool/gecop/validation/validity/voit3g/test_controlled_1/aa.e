class AA

create

	make

feature

	make
		local
			s: separate STRING
		do
			create s.make_from_separate ("G")
			separate s as ss do
				across ss as c loop
					print ("Passed")
				end
			end
		end
	
end
