class BB

inherit

	CC [like name]

feature -- Access

	f
		local
			b: BB
			c: CC [BB]
		do
			c := b
			item := Current
		end

end -- class BB
