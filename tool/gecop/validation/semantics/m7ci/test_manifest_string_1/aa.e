class AA

create

	make

feature

	make
		local
			s1, s2: STRING
		do
			s1 := "eiffel"
			s2 := "Eiffel"
			if s1.is_equal (s2) then
				print ("Failed")
			else
				print ("Passed")
			end
		end

end
