class AA

create

	make

feature

	make
		local
			b1: BB
			b2: BB
		do
			create b1.f
			print ("b1 = {BB}.f: " + (b1 = {BB}.f).out + "%N")
			create b2.f
			print ("b2 = {BB}.f: " + (b2 = {BB}.f).out + "%N")
			print ("b1 = b2: " + (b1 = b2).out + "%N")
		end
		
end
