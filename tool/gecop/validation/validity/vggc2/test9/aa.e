class AA

create

	make

feature

	make
		local
			b: BB [ANY]
			c: ANY
		do
			create b
			create c
			b.f (c)
			print ("Failed")
		end

end
