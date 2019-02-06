class BB [G -> CC rename f as g alias "[]" end]

feature

	f (c: G)
		local
			i: INTEGER
		do
			if c /= Void then
				i := c [5]
			end
		end

end
