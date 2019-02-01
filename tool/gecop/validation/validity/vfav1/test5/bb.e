class BB [G -> CC rename f as x alias "+", g as z alias "+" end]

feature

	f (c: G)
		local
			i, j: INTEGER
		do
			if c /= Void then
				i := + c
				j := c + i
				if j = 4 then
					print ("Passed")
				else
					print ("Failed")
				end
			end
		end

end
