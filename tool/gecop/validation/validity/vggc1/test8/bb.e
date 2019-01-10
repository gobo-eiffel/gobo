class BB

inherit

	CC [EE, DD [EE]]

create

	make

feature

	make
		local
			d: DD [EE]
			e: EE
		do
			create e
			item1 := e
			create d.put (e)
			item2 := d
		end

end
