indexing

	description:

		"Eiffel manifest strings which appear in a comma-separated list of manifest strings"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_MANIFEST_STRING_ITEM

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_string: like string) is
			-- Create a new manifest string item.
		require
			a_string_not_void: a_string /= Void
		do
			string := a_string
		ensure
			string_set: string = a_string
		end

feature -- Access

	string: ET_MANIFEST_STRING
			-- Manifest string

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := string.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if comma /= Void then
				Result := comma.break
			else
				Result := string.break
			end
		end

feature -- Setting

	set_comma (a_comma: like comma) is
			-- Set `comma' to `a_comma'.
		do
			comma := a_comma
		ensure
			comma_set: comma = a_comma
		end

invariant

	string_not_void: string /= Void

end -- class ET_MANIFEST_STRING_ITEM
