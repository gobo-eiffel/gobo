class BB

inherit

	CC [like name]
		redefine
			name
		end

feature -- Access

	name: BB

	f is
		do
			item := Current
		end

end -- class BB
