class BB

inherit

	CC [DD [BIT name]]

feature

	name: INTEGER is 32

	f is
		local
			d: DD [BIT 32]
		do
			!! d
			item := d
		end

end -- class BB
