note

	description:

		"Eiffel internal (do or once) functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/05/03 $"
	revision: "$Revision: #8 $"

deferred class ET_INTERNAL_FUNCTION

inherit

	ET_FUNCTION
		undefine
			reset_after_interface_checked, locals
		end

	ET_INTERNAL_ROUTINE
		undefine
			reset, type, is_prefixable, is_infixable,
			is_bracketable, is_function
		end

end
