note

	description:

		"Eiffel once manifest strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ONCE_MANIFEST_STRING

inherit

	ET_INLINE_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_string: like manifest_string)
			-- Create a new once manifest string.
		require
			a_string_not_void: a_string /= Void
		do
			once_keyword := tokens.once_keyword
			manifest_string := a_string
		ensure
			manifest_string_set: manifest_string = a_string
		end

feature -- Access

	once_keyword: ET_KEYWORD
			-- 'once' keyword

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string

	constant: ET_CONSTANT
			-- Constant value
		do
			Result := manifest_string
		ensure then
			definition: Result = manifest_string
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := once_keyword.position
			if Result.is_null then
				Result := manifest_string.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := once_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := manifest_string
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := manifest_string.break
		end

feature -- Setting

	set_once_keyword (a_once: like once_keyword)
			-- Set `once_keyword' to `a_once'.
		require
			a_once_not_void: a_once /= Void
		do
			once_keyword := a_once
		ensure
			once_keyword_set: once_keyword = a_once
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_once_manifest_string (Current)
		end

invariant

	once_keyword_not_void: once_keyword /= Void
	manifest_string_not_void: manifest_string /= Void

end
