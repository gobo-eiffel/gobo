indexing

	description:

		"Eiffel manifest strings preceded by a keyword"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD_MANIFEST_STRING

inherit

	ET_EXTERNAL_LANGUAGE
	ET_EXTERNAL_ALIAS
	ET_OBSOLETE

create

	make

feature {NONE} -- Initialization

	make (a_keyword: like keyword; a_string: like manifest_string) is
			-- Create a new keyword-manifest_string.
		require
			a_keyword_not_void: a_keyword /= Void
			a_string_not_void: a_string /= Void
		do
			keyword := a_keyword
			manifest_string := a_string
		ensure
			keyword_set: keyword = a_keyword
			manifest_string_set: manifest_string = a_string
		end

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := manifest_string
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := manifest_string.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_keyword_manifest_string (Current)
		end

invariant

	keyword_not_void: keyword /= Void
	manifest_string_not_void: manifest_string /= Void

end
