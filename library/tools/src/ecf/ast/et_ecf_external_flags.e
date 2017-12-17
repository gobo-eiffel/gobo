note

	description:

		"ECF external flag lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_FLAGS

inherit

	ET_ECF_EXTERNAL_VALUES
		redefine
			external_value
		end

create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_FLAG
			-- `i'-th external flag
		do
			Result := external_values.item (i)
		end

end
