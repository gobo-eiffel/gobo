indexing

	description:

		"Names of Eiffel infix features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_INFIX_NAME

inherit

	ET_INFIX

feature {NONE} -- Initialization

	make (an_infix: like infix_keyword; an_operator: like operator_name) is
			-- Create a new infix feature name.
		require
			an_infix_not_void: an_infix /= Void
			an_operator_not_void: an_operator /= Void
		do
			infix_keyword := an_infix
			operator_name := an_operator
		ensure
			infix_keyword_set: infix_keyword = an_infix
			operator_name_set: operator_name = an_operator
		end

feature -- Access

	infix_keyword: ET_TOKEN
			-- Infix keyword

	operator_name: ET_MANIFEST_STRING
			-- Name of prefix operator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := infix_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := operator_name.break
		end

invariant

	infix_keyword_not_void: infix_keyword /= Void
	operator_name_not_void: operator_name /= Void

end -- class ET_INFIX_NAME
