indexing

	description:

		"The source of an XML document that has been retrieved via an URI"

	library:	"Gobo Eiffel Kernel Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_DEFAULT_URI_SOURCE

inherit

	XM_URI_SOURCE

creation

	make

feature

	make (a_uri: UC_STRING) is
		do
			uri := a_uri
		ensure
			uri_set: equal (uri, a_uri)
		end

feature

	uri: UC_STRING

end -- class XM_DEFAULT_URI_SOURCE

