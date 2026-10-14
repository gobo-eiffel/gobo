class AA

create

	make

feature

	make
		local
			b: BB [INTEGER]
		do
			create b.f
			print ("Failed")
		end
		
end
