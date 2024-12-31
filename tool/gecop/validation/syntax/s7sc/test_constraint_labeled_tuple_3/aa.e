class AA

create

	make

feature

	make
		local
			b: BB [TUPLE [INTEGER, INTEGER, INTEGER]]
		do
			create b.make
		end

end
