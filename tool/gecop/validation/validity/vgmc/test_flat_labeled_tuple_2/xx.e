class XX [G -> TUPLE [g: INTEGER]]

feature

	f (a: G; i: INTEGER)
		do
			if a.g = i then
				print ("Passed")
			end
		end

end
