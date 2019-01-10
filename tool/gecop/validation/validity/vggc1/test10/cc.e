class CC [G -> H, H -> G]

create

	set

feature

	set (a_item1: G; a_item2: H)
		do
			item1 := a_item1
			item2 := a_item2
		end
		
	item1: G
	item2: H

	f
		do
				-- H conforms to G.
			item1 := item2
				-- G conforms to H.
			item2 := item1
		end

end
