class AA

create

	make

feature

	make
		local
			b: BB [AA]
		do
			create b
			print ("Passed")
		end

end
