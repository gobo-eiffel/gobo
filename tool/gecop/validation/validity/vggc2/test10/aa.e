class AA

create

	make

feature

	make
		local
			b: BB [TUPLE]
			t: TUPLE
		do
			create b
			t := [2]
			b.f (t, t)
		end

end
