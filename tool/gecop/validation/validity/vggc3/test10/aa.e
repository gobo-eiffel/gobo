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
		end

end
