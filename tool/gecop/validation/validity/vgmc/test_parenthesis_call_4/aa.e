class AA

create

	make

feature

	make
		local
			b: BB [EE]
			e: EE
		do
			create e
			create b.make (e)
			e := b.f
			print ("Failed")
		end

end
