class CC [G -> H, H]

feature

	item1: G
	item2: H

	f is
		do
			if item1 /= Void then
				print (item1.generator)
			end
		end

end -- class CC
