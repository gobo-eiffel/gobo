﻿note

	description:

		"Abstract definition of the source of an XML document that %
		%has been retrieved via an URI"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"

deferred class XM_URI_SOURCE

inherit

	XM_SOURCE

feature -- Access

	uri: STRING
			-- URI for the source of the XML document
		deferred
		end

feature -- Output

	out: STRING
			-- Textual representation
		do
			Result := uri
		end

invariant

	uri_not_void: uri /= Void

end
