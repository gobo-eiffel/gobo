class CC [G -> DD [G], H]

feature

	item1: G
	item2: H

	f
		do
			if item1 /= Void then
				item1.put (item1)
				print (item1.item.generating_type)
			end
		end

end -- class CC
