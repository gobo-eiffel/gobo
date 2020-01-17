class BB [G -> CC rename f as g alias "+" convert end]

feature

	f (c: G)
		do
			if c + 3 = 5 then
				print ("Passed")
			end
		end
		
end
