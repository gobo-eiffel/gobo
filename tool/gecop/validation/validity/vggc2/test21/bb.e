class BB [G -> CC rename infix "+" as g end]

feature

	f (c: G)
		local
			i: INTEGER
		do
			if c /= Void then
				i := c.g (2)
			end
		end

end
