class AA

create

	make

feature

	make
		local
			b: STRING_32
		do
			b := "b"
			inspect b
			when {STRING_8} "b" then
				print ("Passed")
			else
				print ("Failed")
			end
		end
	
end
