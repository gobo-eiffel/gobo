indexing

	description:

		"Eiffel once manifest strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ONCE_MANIFEST_STRING

inherit

	ET_EXPRESSION

creation

	make

feature {NONE} -- Initialization

	make (a_once: like once_keyword; a_string: like manifest_string) is
			-- Create a new once manifest string.
		require
			a_once_not_void: a_once /= Void
			a_string_not_void: a_string /= Void
		do
			once_keyword := a_once
			manifest_string := a_string
		ensure
			once_keyword_set: once_keyword = a_once
			manifest_string_set: manifest_string = a_string
		end

feature -- Access

	once_keyword: ET_TOKEN
			-- 'once' keyword

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := once_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := manifest_string.break
		end

invariant

	once_keyword_not_void: once_keyword /= Void
	manifest_string_not_void: manifest_string /= Void

end
