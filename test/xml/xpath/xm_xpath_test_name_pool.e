indexing
	
	description:
	
		"Test name pool"
		
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_XPATH_TEST_NAME_POOL

inherit

	TS_TEST_CASE
		redefine
			set_up, tear_down
		end

feature -- Access

	shared_pool: XM_XPATH_SHARED_NAME_POOL
			-- The shared name pool

	default_pool: XM_XPATH_NAME_POOL
			-- The default name pool

	testing_namespace: STRING is "http://colina.demon.co.uk/gobo/xml/xpath/tests"
			-- Namespace-URI for these tests

feature -- Test

	test_a1_allocate_uris is
		local
			uri_code: INTEGER
			counter: INTEGER
			uri: STRING
		do
			from
			variant
				105 - counter
			until
				counter = 105
			loop
				create uri.make_from_string ("a")
				uri.append_string (counter.out)
				uri_code := default_pool.allocate_code_for_uri (uri)
				assert ("URI code", uri_code > 0)
				counter:= counter + 1
			end
		end
	
	test_a2_one_name is
		local
			name_code, uri_code: INTEGER
		do
			name_code := default_pool.allocate_name ("test", testing_namespace, "test")
			assert ("Positive name code", name_code > 0)
			uri_code := default_pool.namespace_code ("test", testing_namespace)
			assert ("Non-negative namespace code", uri_code >= 0)
		end

feature -- Setting

	set_up is
		local
		do
			create shared_pool.make
			if shared_pool.default_pool = Void then
				create default_pool.make
				shared_pool.set_default_pool (default_pool)
			else
				default_pool := shared_pool.default_pool
			end
		end

	tear_down is
		do
			-- Comment this next line out when finished debugging test cases.
			default_pool.diagnostic_dump
		end
end
