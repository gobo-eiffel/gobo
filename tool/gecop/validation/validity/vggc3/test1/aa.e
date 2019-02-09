class AA

create

	make

feature

	make
		local
			b: BB [DD]
		do
			create b
			b.f
			print ("Failed")
		end

end
