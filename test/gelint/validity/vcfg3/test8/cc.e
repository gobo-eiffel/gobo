class CC [G, H -> G]

feature

	item1: G
	item2: H

	f
		do
			if item2 /= Void then
				print (item2.generating_type)
			end
		end

end -- class CC
