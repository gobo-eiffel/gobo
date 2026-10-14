class AA

create

	make

feature

	make
		local
			b: STRING_8
		do
			b := "b"
			inspect b
			when {STRING_32} "b" then
				print ("Passed")
			else
				print ("Failed")
			end
		end
	
end
