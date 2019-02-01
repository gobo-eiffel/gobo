class BB [G -> TUPLE rename count as g end]

feature

	f (a: G; t: TUPLE)
		do
			if a /= Void and then t /= Void and then a = t and then a.g = t.count then
				print ("Passed")
			end
		end

end
