class AA

create

	make

feature

	make
		local
			b: STRING_32
		do
			b := "Ω"
			inspect b
			when {STRING_8} "Ω" then
			else
			end
			print ("Failed")
		end
	
end
