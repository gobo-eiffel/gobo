class BB

inherit

	CC [DD [like name]]

feature

	name: STRING

	f is
		local
			d: DD [like name]
		do
			create d
			item := d
		end

end -- class BB
