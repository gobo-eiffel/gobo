note

	description:

		"Test resolving using examples from RFC2396, appendix C"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Utility Library"
	copyright:"Copyright (c) 2004, Berend de Boer and others"
	license: "MIT License"
	revision: "$Revision$"
	date: "$Date$"

class UT_TEST_URI_RESOLVE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Tests

	test_normal_cases
			-- Test sample cases from RFC.
		local
			uri: UT_URI
			base: UT_URI
		do
			create base.make ("http://a/b/c/d;p?q")

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
			check_uri (uri, "http", "g", "", Void, Void, "http://g")

			create uri.make_resolve (base, "?y")
			check_uri (uri, "http", "a", "/b/c/d;p", "y", Void, "http://a/b/c/d;p?y")

			create uri.make_resolve (base, "g?y")
			check_uri (uri, "http", "a", "/b/c/g", "y", Void, "http://a/b/c/g?y")

			create uri.make_resolve (base, "#s")
			check_uri (uri, "http", "a", "/b/c/d;p", "q", "s", "http://a/b/c/d;p?q#s")

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

	test_rfc293_bis_cases
			-- See http://www.apache.org/~fielding/uri/rev-2002/rfc2396bis.html.
		local
			my_base: UT_URI
			uri: UT_URI
		do
			create my_base.make ("http://a")
			create uri.make_resolve (my_base, "b")
			check_uri (uri, "http", "a", "/b", Void, Void, "http://a/b")
		end

	test_abnormal_cases
			-- Test error cases from standard.
		local
			uri: UT_URI
			base: UT_URI
		do
			create base.make ("http://a/b/c/d;p?q")
				-- Start of current document.
			create uri.make_resolve (base, "")
			check_uri (uri, "http", "a", "/b/c/d;p", "q", Void, "http://a/b/c/d;p?q")

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

	test_empty
			-- Test empty base URI.
		local
			a_base: UT_URI
			uri: UT_URI
		do
			create a_base.make ("sch:")
			create uri.make_resolve (a_base, "x")
			check_uri (uri, "sch", Void, "/x", Void, Void, "sch:/x")
		end

feature {NONE} -- Implementation

	check_uri (uri: UT_URI; scheme, authority, path, query, fragment, a_reference: STRING)
			-- Check parsed URI.
		require
			uri_not_void: uri /= Void
			path_nto_void: path /= Void
		do
				-- Scheme.
			assert_equal ("scheme", scheme, uri.scheme)
				-- Authority.
			assert ("has_authority", uri.has_authority = (authority /= Void))
			if uri.has_authority then
				assert_equal ("authority", authority, uri.authority)
			end
				-- Path.
			assert_equal ("path", path, uri.path)
				-- Query.
			assert ("has_query", uri.has_query = (query /= Void))
			if uri.has_query then
				assert_equal ("query", query, uri.query)
			end
				-- Fragment.
			assert ("has_fragment", uri.has_fragment = (fragment /= Void))
			if uri.has_fragment then
				assert_equal ("fragment", uri.fragment, fragment)
			end
		end

end
