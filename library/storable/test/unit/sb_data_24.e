note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_24

create

	make

feature -- Initialization

	make
		do
				-- Make sure that the dynamic type sets
				-- of the attributes contain both types.
			attr1 := {SB_DATA_23}.f
			attr2 := {SB_DATA_22}.f
			attr1 := {SB_DATA_22}.f
			attr2 := {SB_DATA_23}.f
		end

feature -- Access

	attr1: ANY

	attr2: ANY

end
