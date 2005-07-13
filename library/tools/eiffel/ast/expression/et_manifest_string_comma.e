indexing

	description:

		"Eiffel manifest strings followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_MANIFEST_STRING_COMMA

inherit

	ET_MANIFEST_STRING_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_manifest_string: like manifest_string; a_comma: like comma) is
			-- Create a new manifest_string-comma.
		require
			a_manifest_string_not_void: a_manifest_string /= Void
			a_comma_not_void: a_comma /= Void
		do
			manifest_string := a_manifest_string
			comma := a_comma
		ensure
			manifest_string_set: manifest_string = a_manifest_string
			comma_set: comma = a_comma
		end

feature -- Access

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := manifest_string.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := manifest_string
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := comma
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_manifest_string_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
