class AA

create

	make

feature

	make
		local
			b: BB [CC [INTEGER]]
			c: CC [INTEGER]
		do
			create b
			create c
			b.f (c)
			print ("Failed")
		end

end
