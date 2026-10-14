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
			when "eiffel1Ω" .. "eiffel9Ω", "ecmaΩ" then
				print ("Failed")
			when "gΩ" .. "gΩbΩsΩft" then
				print ("Passed")
			when "towerΩ" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
