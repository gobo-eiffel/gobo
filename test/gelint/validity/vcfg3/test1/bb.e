class BB

inherit

	CC [DD [BB]]

feature

	f is
		local
			d: DD [BB]
		do
			!! d
			item := d
		end

end -- class BB
