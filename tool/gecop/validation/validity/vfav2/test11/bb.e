class BB [G -> CC rename f as h alias "[]" end]

feature

	f (c: G)
		local
			i: INTEGER
		do
			i := c [4]
		end
end
