indexing

	description:

		"Implement the XPath normalize-space() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NORMALIZE_SPACE

inherit

	XM_XPATH_SYSTEM_FUNCTION

feature -- Access

	normalize (s: STRING): STRING is
			-- Normalized version of `s';
		
			-- Strip leading and trailing whitespace;
			-- replace sequences of one or more
			-- whitespace character with a single space, #x20
		require
			string_not_void: s /= Void
		local
			tokenizer: ST_SPLITTER
			tokens: DS_LIST [STRING]
		do
			create tokenizer.make
			tokens := tokenizer.split (s)
			Result := tokenizer.join (tokens)
		ensure
			result_not_void: Result /= Void
		end
	
end
