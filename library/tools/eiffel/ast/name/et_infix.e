indexing

	description:

		"Eiffel infix feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

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

end -- class ET_INFIX
