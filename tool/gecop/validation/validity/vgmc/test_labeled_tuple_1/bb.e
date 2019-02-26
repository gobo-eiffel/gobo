class BB [G -> {TUPLE [f: INTEGER], ANY}]

feature

	f (a: G; i: INTEGER)
		do
			if a.f = i then
				print ("Passed")
			end
		end

end
