class BB [G -> CC rename f as g alias "+", g as f alias "-" end]

feature

	f (c: G)
		local
			i, j: INTEGER
		do
			if c /= Void then
				i := c + 2
				j := c - i
				if j = 13 then
					print ("Passed")
				else
					print ("Failed")
				end
			end
		end

end
