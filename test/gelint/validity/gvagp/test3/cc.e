class CC [G]

feature

	item: G
			-- Item

	put (v: G) is
			-- Set `item' to `v'.
		do
			item := v
		end

end -- class CC
