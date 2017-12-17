note

	description:

		"ECF external include lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_INCLUDES

inherit

	ET_ECF_EXTERNAL_PATHNAMES
		rename
			fill_external_values as fill_external_includes
		redefine
			external_value
		end
		
create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_INCLUDE
			-- `i'-th external include
		do
			Result := external_values.item (i)
		end
		
end
