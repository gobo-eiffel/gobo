class BB

inherit

	CC [EE, DD]

create

	make

feature

	make
		local
			d: DD
			e: EE
		do
			create e
			item1 := e
			create d
			item2 := d
		end

end
