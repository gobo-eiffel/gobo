indexing

	description:

		"Eiffel infix feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INFIX

inherit

	ET_FEATURE_NAME
		redefine
			is_infix
		end

feature -- Status report

	is_infix: BOOLEAN is
			-- Is current feature name of the form 'infix ...'?
		once
			Result := True
		end

end
