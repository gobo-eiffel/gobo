note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_21

inherit

	ANY
		redefine
			out
		end

create

	make

feature -- Initalization

	make
		do
			attr := out
		end

feature -- Access

	out: STRING
		do
			Result := "library_2"
		end

	attr: STRING
	
end
