class BB

inherit

	CC [EE, DD [EE]]

feature

	g
		local
			e: EE
			d: DD [EE]
		do
			create e
			item1 := e
			create d
			item2 := d
		end

end -- class BB
