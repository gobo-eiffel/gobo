class BB [G -> CC rename f as g, f as g end]

feature

	f (c: G)
		do
			if c /= Void then
				c.g
			end
		end

end
