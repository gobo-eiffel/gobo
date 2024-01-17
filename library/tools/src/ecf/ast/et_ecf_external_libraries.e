note

	description:

		"ECF external library lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_EXTERNAL_LIBRARIES

inherit

	ET_ECF_EXTERNAL_PATHNAMES
		rename
			fill_external_values as fill_external_libraries
		redefine
			external_value
		end
		
create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_LIBRARY
			-- `i'-th external library
		do
			Result := external_values.item (i)
		end

end
