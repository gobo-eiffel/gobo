indexing

	description:

		"Eiffel types which appear in a comma-separated list of types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_TYPE_ITEM

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type) is
			-- Create a new type item.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Access

	type: ET_TYPE
			-- Type

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if comma /= Void then
				Result := comma.break
			else
--				Result := type.break
			end
		end

feature -- Setting

	set_type (a_type: like type) is
			-- Set `type' to `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

	set_comma (a_comma: like comma) is
			-- Set `comma' to `a_comma'.
		do
			comma := a_comma
		ensure
			comma_set: comma = a_comma
		end

invariant

	type_not_void: type /= Void

end -- class ET_TYPE_ITEM
