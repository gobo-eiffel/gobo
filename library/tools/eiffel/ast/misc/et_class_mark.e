indexing

	description:

		"Eiffel class marks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_MARK

inherit

	ET_TOKEN
		undefine
			process
		end

feature -- Status report

	is_deferred: BOOLEAN is
			-- Is mark 'deferred'?
		do
			-- Result := False
		end

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
