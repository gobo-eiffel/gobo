class AA

create

	make

feature

	make
		local
			b: BB [STRING_8]
		do
			create b.make ("gobo")
			b.f
		end

end
