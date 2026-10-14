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
			when {STRING_32} "Ω" then
			else
			end
			print ("Failed")
		end
	
end
