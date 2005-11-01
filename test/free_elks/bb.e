class BB [G]

feature

	item: G

	set_item (v: G) is
		do
			item := v
		ensure
			item_set: item = v
		end

end
