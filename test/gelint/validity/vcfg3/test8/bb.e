class BB

inherit

	CC [DD, EE]

feature

	g is
		local
			d: DD
			e: EE
		do
			!! d
			item1 := d
			!! e
			item2 := e
		end

end -- class BB
