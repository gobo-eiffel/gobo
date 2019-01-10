class BB

inherit

	CC [DD, EE]

create

	make

feature

	make
		local
			d: DD
			e: EE
		do
			create d
			item1 := d
			create e
			item2 := e
		end

end
