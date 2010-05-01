note

	description:

		"Eiffel operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_OPERATOR

inherit

	ET_CALL_NAME

	ET_TOKEN_CODES
		export {NONE} all end

feature -- Access

	lower_name: STRING is
			-- Lower-name of feature call
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := name
		end

end
