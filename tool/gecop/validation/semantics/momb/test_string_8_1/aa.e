class AA

create

	make

feature

	make
		local
			b: STRING_8
		do
			b := "gobo"
			inspect b
			when "eiffel" then
				print ("Failed")
			when "gobo" then
				print ("Passed")
			when "tower" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
