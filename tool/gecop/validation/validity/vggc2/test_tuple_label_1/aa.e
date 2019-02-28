class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [INTEGER]]
		do
			create b
			b.f ([4])
		end

end
