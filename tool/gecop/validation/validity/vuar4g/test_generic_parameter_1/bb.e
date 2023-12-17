class BB [G]

create

	make

feature

	make (a_item: G)
		do
			item := a_item
		end

	item: G

	g (c: separate CC [G])
		do
			c.f (item)
		end

end
