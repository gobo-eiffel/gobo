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
			when {STRING_32} "b" then
			else
			end
			print ("Failed")
		end
	
end
