class BB [G -> CC rename f as g, f as h end]

feature

	f (c: G)
		do
			if c /= Void then
				c.g
				c.h
			end
		end

end
