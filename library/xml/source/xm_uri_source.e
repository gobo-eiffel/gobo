indexing

	description:

		"Abstract definition of the source of an XML document that %
		%has been retrieved via an URI"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_URI_SOURCE

inherit

	XM_SOURCE
		redefine
			out
		end

feature

	uri: UC_STRING is
			-- URI for the source of the XML document
		deferred
		end

	out: STRING is
		do
			Result := clone (uri.to_utf8)
		end

end
