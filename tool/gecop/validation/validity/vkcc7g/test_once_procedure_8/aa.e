class AA

create

	make

feature

	make
		local
			b: BB
		do
			create b.f
			b.g
			print ("{BB}.f = {BB}.g: ")
			print ({BB}.f = {BB}.g)
			print ("%N")
		end
		
end
