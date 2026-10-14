class AA

create

	make

feature

	make
		local
			b: CHARACTER_32
		do
			b := 'Ω'
			inspect b
			when {CHARACTER_8} 'Ω' then
			else
			end
			print ("Failed")
		end
	
end
