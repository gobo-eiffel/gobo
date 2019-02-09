class AA

create

	make

feature

	make
		local
			b: BB [CC]
		do
			create b
			b.f
			print ("Failed")
		end

end
