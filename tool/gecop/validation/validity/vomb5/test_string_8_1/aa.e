class AA

create

	make

feature

	make
		local
			b: STRING_8
		do
			b := "a"
			inspect b
			when 1 then
			else
			end
			print ("Failed")
		end
	
end
