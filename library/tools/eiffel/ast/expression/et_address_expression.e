indexing

	description:

		"Eiffel address expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ADDRESS_EXPRESSION

inherit

	ET_EXPRESSION

feature -- Access

	dollar: ET_SYMBOL
			-- Dollar symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := dollar.position
		end

invariant

	dollar_not_void: dollar /= Void

end -- class ET_ADDRESS_EXPRESSION
