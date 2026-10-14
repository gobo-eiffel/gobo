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
			when "eiffel1" .. "eiffel9", "ecma" then
				print ("Failed")
			when "go" .. "gobosoft" then
				print ("Passed")
			when "tower" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
