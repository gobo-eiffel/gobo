class BB

inherit

	CC [DD [BB]]

feature

	f is
		local
			d: DD [BB]
		do
			create d
			item := d
		end

end -- class BB
