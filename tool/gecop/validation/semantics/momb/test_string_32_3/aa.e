class AA

create

	make

feature

	make
		local
			b: STRING_32
		do
			b := "gΩbΩ"
			inspect b
			when "ecmaΩ", "eiffel1Ω" .. "eiffel9Ω" then
				print ("Failed")
			when "gΩ1" .. "gΩ9", "gΩbΩ" then
				print ("Passed")
			when "towerΩ" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
