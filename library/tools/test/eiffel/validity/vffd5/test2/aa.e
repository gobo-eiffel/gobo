class AA

create

	make

feature

	make
		local
			b: BB [STRING]
		do
			create b.make ("gobo")
			print (b.f)
		end


end
