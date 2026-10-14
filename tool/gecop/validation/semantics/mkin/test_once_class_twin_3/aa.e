class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f (1)
			print ("b = {BB}.f (2): " + (b = {BB}.f (2)).out + "%N")
			print ("b.twin = {BB}.f (3): " + (b.twin = {BB}.f (3)).out + "%N")
		end
		
end
