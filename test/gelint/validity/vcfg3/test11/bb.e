class BB

inherit

	CC [DD [EE], EE]

feature

	g is
		local
			e: EE
			d: DD [EE]
		do
			!! d
			item1 := d
			!! e
			item2 := e
		end

end -- class BB
