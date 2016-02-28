note

	description:

		"Eiffel internal (do or once) procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #8 $"

deferred class ET_INTERNAL_PROCEDURE

inherit

	ET_PROCEDURE
		undefine
			reset_after_interface_checked, locals
		end

	ET_INTERNAL_ROUTINE

end
