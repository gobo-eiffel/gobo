indexing

	description: 
	
		"Test URI parsing."

	library: "Gobo Eiffel Utility Library"
	copyright:"Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	revision: "$Revision$"
	date: "$Date$"

deferred class UT_TEST_URI_PARSER

inherit

	TS_TEST_CASE

feature -- Tests

	test_parsing is
			-- Test URI parsing.
		local
			uri: UT_URI
		do
			create uri.make ("http://www.ics.uci.edu/pub/ietf/uri/#Related")
			check_uri (uri, "http", "www.ics.uci.edu", "/pub/ietf/uri/", Void, "Related")

			create uri.make ("http://www.ics.uci.edu/cgi-bin/test?id=1")
			check_uri (uri, "http", "www.ics.uci.edu", "/cgi-bin/test", "id=1", Void)

			create uri.make ("http:/cgi-bin/test?id=1")
			check_uri (uri, "http", Void, "/cgi-bin/test", "id=1", Void)

			create uri.make ("http:/cgi-bin/test")
			check_uri (uri, "http", Void, "/cgi-bin/test", Void, Void)

			create uri.make ("various.html")
			check_uri (uri, Void, Void, "various.html", Void, Void)

			create uri.make ("various.html#index")
			check_uri (uri, Void, Void, "various.html", Void, "index")
		end

feature {NONE} -- Implementation

	check_uri (uri: UT_URI; scheme, authority, path, query, fragment: STRING) is
			-- Check a parsed URI.
		require
			uri_not_void: uri /= Void
		do
			assert_equal ("scheme", uri.scheme, scheme)
			assert_equal ("authority", uri.authority, authority)
			assert_equal ("path", uri.path, path)
			assert_equal ("query", uri.query, query)
			assert_equal ("fragment", uri.fragment, fragment)
		end

end
