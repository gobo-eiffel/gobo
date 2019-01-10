class BB

inherit

	CC [DD, DD]

create

	make

feature

	make
		local
			d: DD
		do
			create d
			item1 := d
			item2 := d
		end

end
