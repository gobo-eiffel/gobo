note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

expanded class SB_DATA_2

feature -- Access

	int: INTEGER_32

feature -- Setting

	set_int (i: INTEGER_32)
		do
			int := i
		end

end
