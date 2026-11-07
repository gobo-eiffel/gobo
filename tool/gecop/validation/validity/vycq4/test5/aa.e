class AA

create

	make

feature

	make
		local
			b: BB
			c1: CC [STRING]
			c2: CC [ANY]
		do
			create b
			c1 := b
			c2 := b
			print ("Passed")
		end

end
