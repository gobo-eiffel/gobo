class BB

inherit

	CC [EE, DD]

feature

	g is
		local
			d: DD
			e: EE
		do
			!! e
			item1 := e
			!! d
			item2 := d
		end

end -- class BB
