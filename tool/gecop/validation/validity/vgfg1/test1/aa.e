class AA

create

	make

feature

	make
		local
			b: BB [ANY]
		do
			create b
			print ("Failed")
		end

end
