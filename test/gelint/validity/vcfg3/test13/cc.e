class CC [G -> DD [H], H -> DD [G]]

feature

	item1: G
	item2: H

	f
		do
			if item2 /= Void and item1 /= Void then
				item1.put (item2)
				print (item1.item.generator)
				item2.put (item1)
				print (item2.item.generator)
			end
		end

end -- class CC
