note

	description:

		"ECF external cflag lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_EXTERNAL_CFLAGS

inherit

	ET_ECF_EXTERNAL_FLAGS
		rename
			fill_external_values as fill_external_cflags
		redefine
			external_value
		end

create

	make, make_empty

feature -- Access

	external_value (i: INTEGER): ET_ECF_EXTERNAL_CFLAG
			-- `i'-th external C flag
		do
			Result := external_values.item (i)
		end

end
