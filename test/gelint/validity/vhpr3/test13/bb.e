class BB [G]

inherit

	CC [like Current]

feature

	f
		do
			item := Current
		end

end -- class BB
