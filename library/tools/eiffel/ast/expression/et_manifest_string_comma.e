indexing

	description:

		"Eiffel manifest strings followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_MANIFEST_STRING_COMMA

inherit

	ET_MANIFEST_STRING_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_manifest_string: like manifest_string_item; a_comma: like comma) is
			-- Create a new manifest_string-comma.
		require
			a_manifest_string_not_void: a_manifest_string /= Void
			a_comma_not_void: a_comma /= Void
		do
			manifest_string_item := a_manifest_string
			comma := a_comma
		ensure
			manifest_string_item_set: manifest_string_item = a_manifest_string
			comma_set: comma = a_comma
		end

feature -- Access

	manifest_string_item: ET_MANIFEST_STRING
			-- Manifest string in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := manifest_string_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_MANIFEST_STRING_COMMA
