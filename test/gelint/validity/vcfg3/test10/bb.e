class BB

inherit

	CC [EE, DD]

feature

	g is
		local
			d: DD
			e: EE
		do
			create e
			item1 := e
			create d
			item2 := d
		end

end -- class BB
