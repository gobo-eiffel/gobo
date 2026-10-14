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
			when {BB}.h .. {BB}.f then
			else
			end
			print ("Failed")
		end

end
