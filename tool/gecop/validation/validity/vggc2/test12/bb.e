class BB [G -> CC rename f as g end, H -> G]

feature

	f (c: H)
		do
			if c /= Void then
				c.g
			end
		end

end
