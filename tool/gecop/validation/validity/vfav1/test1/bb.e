class BB [G -> CC rename f as x alias "+", g as z alias "+" end]

feature

	f (c: G)
		local
			i: INTEGER
		do
			if c /= Void then
				i := c + 4
			end
		end

end
