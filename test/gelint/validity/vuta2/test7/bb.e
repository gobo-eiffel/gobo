class BB [G -> detachable STRING_8 create make end]

create

	make

feature

	make
		local
			l_item: G
			i: INTEGER
		do
			create l_item.make (0)
			i := l_item.count
		end

end
