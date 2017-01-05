class BB

inherit

	CC [DD [like Current]]

feature

	f
		local
			d: DD [like Current]
		do
			create d
			item := d
		end

end -- class BB
