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
			when "eiffelΩ" then
				print ("Failed")
			when "gΩbΩ" then
				print ("Passed")
			when "towerΩ" then
				print ("Failed")
			else
				print ("Failed")
			end
		end

end
