class AA

create

	make

feature

	make
		local
			b: BB [TUPLE]
		do
			create b.make
		end

end
