class AA

create

	make

feature

	make
		local
			b: BB [CC]
			c: CC
		do
			create b
			create c
			b.f (c)
			print ("Passed")
		end

end
