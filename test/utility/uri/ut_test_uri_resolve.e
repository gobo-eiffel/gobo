indexing

	description:
	
		"Test resolving using examples from RFC2396, appendix C"

	library: "Gobo Eiffel Utility Library"
	copyright:"Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	revision: "$Revision$"
	date: "$Date$"

deferred class UT_TEST_URI_RESOLVE

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

feature -- Tests

	base: UT_URI

	set_up is
			-- Create base URI.
		do
			create base.make ("http://a/b/c/d;p?q")
		end

	test_normal_cases is
			-- Test sample cases from RFC.
		local
			uri: UT_URI
		do
			create uri.make_resolve (base, "g:h")
			check_uri (uri, "g", Void, "h", Void, Void, "g:h")

			create uri.make_resolve (base, "g")
			check_uri (uri, "http", "a", "/b/c/g", Void, Void, "http://a/b/c/g")

			create uri.make_resolve (base, "./g")
			check_uri (uri, "http", "a", "/b/c/g", Void, Void, "http://a/b/c/g")

			create uri.make_resolve (base, "g/")
			check_uri (uri, "http", "a", "/b/c/g/", Void, Void, "http://a/b/c/g/")

			create uri.make_resolve (base, "/g")
			check_uri (uri, "http", "a", "/g", Void, Void, "http://a/g")

			create uri.make_resolve (base, "//g")
			check_uri (uri, "http", "g", Void, Void, Void, "http://g")

			create uri.make_resolve (base, "?y")
			check_uri (uri, "http", "a", "/b/c/d;p", "y", Void, "http://a/b/c/d;p?y")

			create uri.make_resolve (base, "g?y")
			check_uri (uri, "http", "a", "/b/c/g", "y", Void, "http://a/b/c/g?y")

			create uri.make_resolve (base, "#s")
			-- current document is this?
			check_uri (uri, "http", "a", "/b/c/d;p", Void, "s", "http://a/b/c/d;p#s")

			create uri.make_resolve (base, "g#s")
			check_uri (uri, "http", "a", "/b/c/g", Void, "s", "http://a/b/c/g#s")

			create uri.make_resolve (base, "g?y#s")
			check_uri (uri, "http", "a", "/b/c/g", "y", "s", "http://a/b/c/g?y#s")

			create uri.make_resolve (base, ";x")
			check_uri (uri, "http", "a", "/b/c/;x", Void, Void, "http://a/b/c/;x")

			create uri.make_resolve (base, "g;x")
			check_uri (uri, "http", "a", "/b/c/g;x", Void, Void, "http://a/b/c/g;x")

			create uri.make_resolve (base, "g;x?y#s")
			check_uri (uri, "http", "a", "/b/c/g;x", "y", "s", "http://a/b/c/g;x?y#s")

			create uri.make_resolve (base, ".")
			check_uri (uri, "http", "a", "/b/c/", Void, Void, "http://a/b/c/")

			create uri.make_resolve (base, "./")
			check_uri (uri, "http", "a", "/b/c/", Void, Void, "http://a/b/c/")

			create uri.make_resolve (base, "..")
			check_uri (uri, "http", "a", "/b/", Void, Void, "http://a/b/")

			create uri.make_resolve (base, "../")
			check_uri (uri, "http", "a", "/b/", Void, Void, "http://a/b/")

			create uri.make_resolve (base, "../g")
			check_uri (uri, "http", "a", "/b/g", Void, Void, "http://a/b/g")

			create uri.make_resolve (base, "../..")
			check_uri (uri, "http", "a", "/", Void, Void, "http://a/")

			create uri.make_resolve (base, "../../")
			check_uri (uri, "http", "a", "/", Void, Void, "http://a/")

			create uri.make_resolve (base, "../../g")
			check_uri (uri, "http", "a", "/g", Void, Void, "http://a/g")
		end

	test_rfc293_bis_cases is
			-- See http://www.apache.org/~fielding/uri/rev-2002/rfc2396bis.html
		local
			my_base: UT_URI
			uri: UT_URI
		do
			create my_base.make ("http://a")
			create uri.make_resolve (my_base, "b")
			check_uri (uri, "http", "a", "/b", Void, Void, "http://a/b")
		end

	test_abnormal_cases is
			-- Test error cases from standard.
		require
			have_base: base /= Void
		local
			uri: UT_URI
		do
			-- start of current document
			create uri.make_resolve (base, "")
			check_uri (uri, "http", "a", "/b/c/d;p", Void, Void, "http://a/b/c/d;p")

			create uri.make_resolve (base, "../../../g")
			check_uri (uri, "http", "a", "/g", Void, Void, "http://a/g")

			create uri.make_resolve (base, "../../../../g")
			check_uri (uri, "http", "a", "/g", Void, Void, "http://a/g")

			create uri.make_resolve (base, "/./g")
			check_uri (uri, "http", "a", "/./g", Void, Void, "http://a/./g")

			create uri.make_resolve (base, "/../g")
			check_uri (uri, "http", "a", "/../g", Void, Void, "http://a/../g")

			create uri.make_resolve (base, "g.")
			check_uri (uri, "http", "a", "/b/c/g.", Void, Void, "http://a/b/c/g.")

			create uri.make_resolve (base, ".g")
			check_uri (uri, "http", "a", "/b/c/.g", Void, Void, "http://a/b/c/.g")

			create uri.make_resolve (base, "g..")
			check_uri (uri, "http", "a", "/b/c/g..", Void, Void, "http://a/b/c/g..")

			create uri.make_resolve (base, "..g")
			check_uri (uri, "http", "a", "/b/c/..g", Void, Void, "http://a/b/c/..g")

			create uri.make_resolve (base, "./../g")
			check_uri (uri, "http", "a", "/b/g", Void, Void, "http://a/b/g")

			create uri.make_resolve (base, "./g/.")
			check_uri (uri, "http", "a", "/b/c/g/", Void, Void, "http://a/b/c/g/")

			create uri.make_resolve (base, "g/./h")
			check_uri (uri, "http", "a", "/b/c/g/h", Void, Void, "http://a/b/c/g/h")

			create uri.make_resolve (base, "g/../h")
			check_uri (uri, "http", "a", "/b/c/h", Void, Void, "http://a/b/c/h")

			create uri.make_resolve (base, "g;x=1/./y")
			check_uri (uri, "http", "a", "/b/c/g;x=1/y", Void, Void, "http://a/b/c/g;x=1/y")

			create uri.make_resolve (base, "g;x=1/../y")
			check_uri (uri, "http", "a", "/b/c/y", Void, Void, "http://a/b/c/y")

			create uri.make_resolve (base, "g?y/./x")
			check_uri (uri, "http", "a", "/b/c/g", "y/./x", Void, "http://a/b/c/g?y/./x")

			create uri.make_resolve (base, "g?y/../x")
			check_uri (uri, "http", "a", "/b/c/g", "y/../x", Void, "http://a/b/c/g?y/../x")

			create uri.make_resolve (base, "g#s/./x")
			check_uri (uri, "http", "a", "/b/c/g", Void, "s/./x", "http://a/b/c/g#s/./x")

			create uri.make_resolve (base, "g#s/../x")
			check_uri (uri, "http", "a", "/b/c/g", Void, "s/../x", "http://a/b/c/g#s/../x")

		end

feature {NONE} -- Implementation

	check_uri (uri: UT_URI; a_scheme, a_authority, a_path, a_query, a_fragment, a_reference: STRING) is
			-- Check parsed URI.
		require
			uri_not_void: uri /= Void
		do
			assert_equal ("scheme", a_scheme, uri.scheme)
			assert_equal ("authority", a_authority, uri.authority)
			if a_path /= Void then
				assert_equal ("path", a_path, uri.path)
			end
			assert_equal ("query", a_query, uri.query)
			assert_equal ("fragment", a_fragment, uri.fragment)
			assert_equal ("reference", a_reference, uri.full_reference)
		end

end
