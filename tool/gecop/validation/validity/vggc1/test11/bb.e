class BB

inherit

	CC [EE, EE]

create

	make

feature

	make
		local
			e: EE
		do
			create e.make
			item1 := e
			item2 := e
		end

end
