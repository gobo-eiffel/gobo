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
			when "ecma", "eiffel1" .. "eiffel9" then
				print ("Failed")
			when "go1" .. "go9", "gobo" then
				print ("Passed")
			when "tower" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
