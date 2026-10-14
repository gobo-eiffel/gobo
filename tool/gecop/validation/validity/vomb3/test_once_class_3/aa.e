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
			when {BB}.g then
			when {BB}.f .. {BB}.h then
			else
			end
			print ("Failed")
		end
	
end
