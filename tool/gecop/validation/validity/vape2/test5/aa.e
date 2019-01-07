class AA

create

	make

feature

	make
		local
			b: BB [CC]
		do
			create b.make
			b.f
		end

end
