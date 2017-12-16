class BB

inherit

	CC [DD [EE], EE]

feature

	g
		local
			e: EE
			d: DD [EE]
		do
			create d
			item1 := d
			create e
			item2 := e
		end

end -- class BB
