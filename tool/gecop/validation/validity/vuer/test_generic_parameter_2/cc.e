class CC [expanded G -> ANY]

create

	make

feature

	make (a_item: G)
		do
			item := a_item
		end

	item: G

	f: G
		do
			Result := item
		end

end
