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
			assert ("valid_scheme", uri.has_valid_scheme)

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

			create uri.make ("a/various.html")
			check_uri (uri, Void, Void, "a/various.html", Void, Void)
			
			create uri.make ("empty:")
			check_uri (uri, "empty", Void, "", Void, Void)

			create uri.make ("g/")
			check_uri (uri, Void, Void, "g/", Void, Void)

			create uri.make ("//www.invalid/abc")
			check_uri (uri, Void, "www.invalid", "/abc", Void, Void)
		end
		
	test_query is
			-- Test query parsing.
		local
			uri: UT_URI
		do
			create uri.make ("/path?query")
			check_uri (uri, Void, Void, "/path", "query", Void)
			
			create uri.make ("/?query")
			check_uri (uri, Void, Void, "/", "query", Void)

			create uri.make ("?q")
			check_uri (uri, Void, Void, "", "q", Void)
			
			create uri.make ("s:?query")
			check_uri (uri, "s", Void, "", "query", Void)
		
			create uri.make ("//invalid?q")
			check_uri (uri, Void, "invalid", Void, "q", Void)

			create uri.make ("?")
			check_uri (uri, Void, Void, "", "", Void)
			
			create uri.make ("abc?")
			check_uri (uri, Void, Void, "abc", "", Void)
		end
		
	test_fragment is
			-- Test fragment.
		local
			uri: UT_URI
		do
			create uri.make ("/#fragment")
			check_uri (uri, Void, Void, "/", Void, "fragment")
			
			create uri.make ("#fragment")
			check_uri (uri, Void, Void, "", Void, "fragment")

			create uri.make ("s:#fragment")
			check_uri (uri, "s", Void, "", Void, "fragment")

			create uri.make ("//www.invalid#fragment")
			check_uri (uri, Void, "www.invalid", Void, Void, "fragment")

			create uri.make ("#")
			check_uri (uri, Void, Void, "", Void, "")

			create uri.make ("abc#")
			check_uri (uri, Void, Void, "abc", Void, "")
		end
		
	test_broken_parsing is
			-- Test parsing of broken URI.
		local
			uri: UT_URI
		do
			-- uri:abc

			create uri.make (":abc")
			check_uri (uri, "", Void, "abc", Void, Void)
			check_invalid_scheme (uri)

			create uri.make (":")
			check_uri (uri, "", Void, "", Void, Void)
			check_invalid_scheme (uri)
			
			create uri.make ("bro,ken:foo")
			check_uri (uri, "bro,ken", Void, "foo", Void, Void)
			check_invalid_scheme (uri)
			assert_equal ("scheme_specific", "foo", uri.scheme_specific_part)
		end
			

feature {NONE} -- Implementation

	check_uri (uri: UT_URI; scheme, authority, path, query, fragment: STRING) is
			-- Check a parsed URI.
		require
			uri_not_void: uri /= Void
		do
			assert_equal ("scheme", scheme, uri.scheme)
			assert_equal ("authority", authority, uri.authority)
			assert ("has_path", uri.has_path = (path /= Void))
			if path /= Void then
				assert_equal ("path", path, uri.path)
			end
			assert_equal ("query", query, uri.query)
			assert_equal ("fragment", uri.fragment, fragment)
		end

	check_invalid_scheme (a_uri: UT_URI) is
			-- Check invalid scheme.
		require
			a_uri_not_void: a_uri /= Void
		do
			assert ("invalid_scheme", not a_uri.has_valid_scheme)
		end
		
end
