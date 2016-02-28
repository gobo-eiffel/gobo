note

	description:

		"Eiffel writable entities"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_WRITABLE

inherit

	ET_EXPRESSION

feature -- Status report

	is_result: BOOLEAN
			-- Is current expression the 'Result' entity?
		do
			-- Result := False
		end

end
