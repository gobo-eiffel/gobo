indexing

	description:

		"Eiffel type marks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TYPE_MARK

inherit

	ET_TOKEN

creation

feature -- Status report

	is_expanded: BOOLEAN is
			-- Is mark 'expanded'?
		do
			-- Result := False
		end

	is_reference: BOOLEAN is
			-- Is mark 'reference'?
		do
			-- Result := False
		end

	is_separate: BOOLEAN is
			-- Is mark 'separate'?
		do
			-- Result := False
		end

end
