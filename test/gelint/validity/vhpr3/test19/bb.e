class BB

inherit

	CC [like name]
		rename
			gobo as name
		end

feature -- Access

	f is
		do
			item := "gobo"
		end

end -- class BB
