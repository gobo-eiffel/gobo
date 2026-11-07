class AA

create

	make

feature

	make
		local
			b: BB [ANY]
			c: CC [ANY]
		do
			create b
			c := b
			print ("Passed")
		end

end
