class BB [G -> H rename f as g end, H -> CC]

feature

	f (c1: G; c2: H)
		do
			if c1 /= Void then
				c1.g
			end
			if c2 /= Void then
				c2.f
			end
		end

end
