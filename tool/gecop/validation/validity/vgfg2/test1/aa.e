class AA

create

	make

feature

	make
		local
			b: BB [ANY, ANY]
		do
			create b
			print ("Failed")
		end

end
