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
		end

end
