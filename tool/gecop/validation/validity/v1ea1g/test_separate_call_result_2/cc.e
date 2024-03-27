class CC [G]

create

	make

feature

	make (a_item: DD [G])
		do
			item := a_item
		end

	item: DD [G]

	f: DD [G]
		do
			Result := item
		end

end
