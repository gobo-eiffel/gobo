class CC [G -> H, H -> G]

feature

	item1: G
	item2: H

	f
		do
			if item1 /= Void then
				print (item1.generator)
			end
			if item2 /= Void then
				print (item2.generator)
			end
		end

end -- class CC
