
indexing

	description:

		"XML Error code contstants"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_ERROR_CODES

feature {ANY} -- Constants

	Xml_err_none: INTEGER is 0
			-- no error occurred

	Xml_err_unknown: INTEGER is 1
			-- an unknown error occurred

end -- class XM_ERROR_CODES

