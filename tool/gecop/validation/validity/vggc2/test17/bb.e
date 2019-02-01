class BB [G -> CC rename f as h, g as h end]

feature

	f (c: G)
		do
			if c /= Void then
				c.h
			end
		end

end
