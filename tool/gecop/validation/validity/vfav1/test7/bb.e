class BB [G -> CC rename f as f alias "+" end]

feature

	f (c: G)
		do
			if c /= Void then
				if c + 5 = 5 then
					print ("Passed")
				end
			end
		end

end
