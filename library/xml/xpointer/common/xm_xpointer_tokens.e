indexing

	description:

		"XPointer tokens"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	derivation: "See notice at bottom of file"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPOINTER_TOKENS

feature -- Access

	Unknown_token: INTEGER is 0
			-- Only when a lexical error

	Eof_token: INTEGER is 1
			-- End of input reached

	Left_escaped_parenthesis_token: INTEGER is 2
			-- ^(

	Right_escaped_parenthesis_token: INTEGER is 3
			-- ^)

	Escaped_carat_token: INTEGER is 4
			-- ^^

	Left_parenthesis_token: INTEGER is 5
			-- (
	
	Right_parenthesis_token: INTEGER is 6
			-- )

	String_token: INTEGER is 7
			-- Any string

	Whitespace_token: INTEGER is 8
			-- Ignorable whitespace

end
