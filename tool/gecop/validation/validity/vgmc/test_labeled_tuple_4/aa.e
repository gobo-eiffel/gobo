class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [INTEGER, BOOLEAN]]
		do
			create b
			b.f ([4, True])
		end

end
