class AA

create

	make

feature

	make
		local
			b: CHARACTER_32
		do
			b := 'b'
			inspect b
			when {CHARACTER_8} 'b' then
			when {CHARACTER_32} 'b' then
			else
			end
			print ("Failed")
		end
	
end
