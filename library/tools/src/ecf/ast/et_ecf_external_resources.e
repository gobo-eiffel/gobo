note

	description:

		"ECF external resource lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_RESOURCES

inherit

	ET_ECF_EXTERNAL_VALUES
		rename
			fill_external_values as fill_external_resources
		redefine
			external_value
		end

create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_RESOURCE
			-- `i'-th external resource
		do
			Result := external_values.item (i)
		end

end
