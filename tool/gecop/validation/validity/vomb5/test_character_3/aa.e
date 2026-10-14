class AA

create

	make

feature

	make
		local
			b: CHARACTER_8
		do
			b := 'b'
			inspect b
			when {CHARACTER_32} 'b' then
				print ("Passed")
			else
				print ("Failed")
			end
		end
	
end
