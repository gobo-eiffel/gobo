class BB [G -> CC rename f as f end]

feature

	f (c: G)
		do
			if c /= Void then
				c.f
			end
		end

end
