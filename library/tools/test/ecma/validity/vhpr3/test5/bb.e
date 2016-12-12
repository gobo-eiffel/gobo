class BB

inherit

	CC [DD [like name]]

feature

	name: STRING

	f
		local
			d: DD [like name]
		do
			create d
			item := d
		end

end -- class BB
