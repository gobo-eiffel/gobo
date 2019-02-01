class AA

create

	make

feature

	make
		local
			b: BB [DD]
			d: DD
		do
			create b
			create d
			b.f (d)
		end

end
