class CC [G -> G, H]

feature

	item1: G
	item2: H

	f
		do
			if item1 /= Void then
				print (item1.generating_type)
			end
		end

end -- class CC
