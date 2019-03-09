class AA

create

	make

feature

	make
		local
			b: BB [EE]
		do
			create b
			b.g
			print ("Failed")
		end

end
