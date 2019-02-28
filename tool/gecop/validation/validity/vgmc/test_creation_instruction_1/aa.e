class AA

create

	make

feature

	make
		local
			b: BB [EE]
		do
			create b
			b.f
			print ("Failed")
		end

end
