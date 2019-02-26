class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [INTEGER, STRING]]
		do
			create b
			b.f ([4, "gobo"], 4)
		end

end
