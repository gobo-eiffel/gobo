class BB

inherit

	CC [DD [BIT name]]

feature

	name: INTEGER is 32

	f is
		local
			d: DD [BIT name]
		do
			create d
			item := d
		end

end -- class BB
