note

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

	Unknown_token: INTEGER = 0
			-- Only when a lexical error

	Eof_token: INTEGER = 1
			-- End of input reached

	Left_escaped_parenthesis_token: INTEGER = 2
			-- ^(

	Right_escaped_parenthesis_token: INTEGER = 3
			-- ^)

	Escaped_carat_token: INTEGER = 4
			-- ^^

	Left_parenthesis_token: INTEGER = 5
			-- (

	Right_parenthesis_token: INTEGER = 6
			-- )

	String_token: INTEGER = 7
			-- Any string

	Whitespace_token: INTEGER = 8
			-- Ignorable whitespace

end
