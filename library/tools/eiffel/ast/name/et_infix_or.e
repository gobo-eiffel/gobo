indexing

	description:

		"Eiffel infix 'or' feature names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INFIX_OR

inherit

	ET_INFIX
		redefine
			is_infix_or
		end

feature -- Access

	name: STRING is "infix %"or%""
			-- Name of feature

	hash_code: INTEGER is 13
			-- Hash code

feature -- Status report

	is_infix_or: BOOLEAN is True
			-- Is current feature name of the form 'infix "or"'?

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := other.is_infix_or
		end

end -- class ET_INFIX_OR
