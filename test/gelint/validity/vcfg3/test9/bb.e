class BB

inherit

	CC [EE, DD [EE]]

feature

	g is
		local
			e: EE
			d: DD [EE]
		do
			!! e
			item1 := e
			!! d
			item2 := d
		end

end -- class BB
