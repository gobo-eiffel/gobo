indexing

	description:

		"EiffelBase BI_LINKABLE class interface"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class BI_LINKABLE [G]

inherit

	LINKABLE [G]
		undefine
			put_right
		end

	DS_BILINKABLE [G]

create

	make

end
