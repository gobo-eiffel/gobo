class BB

inherit

	CC [DD, EE]

feature

	g is
		local
			d: DD
			e: EE
		do
			create d
			item1 := d
			create e
			item2 := e
		end

end -- class BB
