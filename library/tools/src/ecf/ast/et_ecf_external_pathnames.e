note

	description:

		"ECF lists of pathnames to be passed for external compilations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_EXTERNAL_PATHNAMES

inherit

	ET_ECF_EXTERNAL_VALUES
		redefine
			external_value
		end

create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_PATHNAME
			-- `i'-th external pathname
		do
			Result := external_values.item (i)
		end

end
