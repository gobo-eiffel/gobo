class BB

inherit

	CC [DD [BIT 32]]

feature

	f is
		local
			d: DD [BIT name]
		do
			!! d
			item := d
		end

end -- class BB
