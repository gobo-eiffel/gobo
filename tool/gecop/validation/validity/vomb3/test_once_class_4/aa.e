class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.g
			inspect b
			when {BB}.f .. {BB}.h then
			when {BB}.g .. {BB}.i then
			else
			end
			print ("Failed")
		end
	
end
