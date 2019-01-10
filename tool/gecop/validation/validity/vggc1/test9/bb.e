class BB

inherit

	CC [DD [EE], EE]

create

	make

feature

	make
		local
			d: DD [EE]
			e: EE
		do
			create e
			item2 := e
			create d.put (e)
			item1 := d
		end

end
