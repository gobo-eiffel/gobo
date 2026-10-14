class AA

create

	make

feature

	make
		local
			b: CHARACTER_8
		do
			b := 'a'
			inspect b
			when {CHARACTER_32} 'Ω' then
			else
			end
			print ("Failed")
		end
	
end
