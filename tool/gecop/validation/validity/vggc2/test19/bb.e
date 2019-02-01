class BB [G -> CC rename f as g, g as f end]

feature

	f (c: G)
		do
			if c /= Void then
				c.g
				c.f
			end
		end

end
