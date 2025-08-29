note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_11 [G]

create

	make

feature -- Initialization

	make (a: separate SB_DATA_12)
		do
			attr2 := a
			create attr1.make (a)
			separate attr1 as l_attr1 do
				l_attr1.run
			end
		end

feature -- Access

	attr1: separate SB_DATA_13

	attr2: separate SB_DATA_12

end
