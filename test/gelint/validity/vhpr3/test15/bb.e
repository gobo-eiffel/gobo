class BB

inherit

	CC [DD [BIT name]]

feature

	name: INTEGER = 32

	f
		local
			d: DD [BIT 32]
		do
			create d
			item := d
		end

end -- class BB
