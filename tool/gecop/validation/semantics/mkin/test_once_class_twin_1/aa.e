class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			print ("b = {BB}.f: " + (b = {BB}.f).out + "%N")
			print ("b.twin = {BB}.f: " + (b.twin = {BB}.f).out + "%N")
		end
		
end
