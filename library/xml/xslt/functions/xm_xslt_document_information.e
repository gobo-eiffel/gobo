indexing

	description:

		"Objects that support the XSLT document() function"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DOCUMENT_INFORMATION

inherit

	ANY -- SE 2.1

creation

	make

feature {NONE} -- Initialization

	make (a_base_uri, a_stylesheet_base_uri: UT_URI) is
			-- Establish invariant
		require
			stylesheet_base_uri_not_void: a_stylesheet_base_uri /= Void
		do
			base_uri := a_base_uri
			stylesheet_base_uri := a_stylesheet_base_uri
		ensure
			base_uri_set: base_uri = a_base_uri
			stylesheet_base_uri_set: stylesheet_base_uri = a_stylesheet_base_uri
		end

feature -- Access
	
	base_uri, stylesheet_base_uri: UT_URI
			-- Base URIs

invariant

	stylesheet_base_uri_not_void: stylesheet_base_uri /= Void

end
	

