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

	XM_XPATH_STANDARD_NAMESPACES
	
feature -- Access

	shared_pool: XM_XPATH_SHARED_NAME_POOL
			-- The shared name pool

	default_pool: XM_XPATH_NAME_POOL
			-- The default name pool

	testing_namespace: STRING is "http://colina.demon.co.uk/gobo/xml/xpath/tests"
			-- Namespace-URI for these tests

feature -- Test

	test_allocations is
		local
			uri_code, prefix_code: INTEGER -- should be INTEGER_16
			counter, namespace_code: INTEGER
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
				uri_code := default_pool.code_for_uri (uri)
				assert ("URI code", uri_code = -1)
				uri_code := default_pool.allocate_code_for_uri (uri)
				assert ("URI code 2", uri_code = 3 + counter)
				uri_code := default_pool.code_for_uri (uri)
				assert ("URI code 3", uri_code = 3 + counter)				
				counter:= counter + 1
			end
			namespace_code := default_pool.allocate_namespace_code ("test", testing_namespace)
			assert ("Namespace code", namespace_code = 196716)
			prefix_code := default_pool.allocate_code_for_prefix ("xml")
			assert ("Prefix code", prefix_code = 1)
		end
	
	test_conversions is
		local
			name_code, namespace_code, uri_code, prefix_code: INTEGER
			xml_prefix, namespace_uri, local_name, display_name: STRING
		do
			prefix_code := default_pool.code_for_prefix ("test")
			assert ("Prefix code", prefix_code = -1)
			name_code := default_pool.allocate_name ("test", testing_namespace, "test")
			assert ("Positive name code", name_code > 0)
			xml_prefix := default_pool.prefix_from_name_code (name_code)
			assert ("Prefix", xml_prefix /= Void and then xml_prefix.is_equal ("test"))
			prefix_code := default_pool.code_for_prefix ("test")
			assert ("Prefix code 2", prefix_code = 3)			
			namespace_code := default_pool.namespace_code ("test", testing_namespace)
			assert ("Non-negative namespace code", namespace_code >= 0)
			uri_code := default_pool.uri_code_from_name_code (name_code)
			assert ("URI code", uri_code = 3)
			namespace_uri := default_pool.namespace_uri_from_name_code (name_code)
			assert ("Namespace URI", namespace_uri /= Void and then namespace_uri.is_equal (testing_namespace))
			local_name := default_pool.local_name_from_name_code (name_code)
			assert ("Local name", local_name /= Void and then local_name.is_equal ("test"))
			display_name := default_pool.display_name_from_name_code (name_code)
			assert ("Display name", display_name /= Void and then display_name.is_equal ("test:test"))
			namespace_uri := default_pool.uri_from_namespace_code (namespace_code)
			assert ("Namespace URI 2", namespace_uri /= Void and then namespace_uri.is_equal (testing_namespace))
			namespace_uri := default_pool.uri_from_uri_code (uri_code)
			assert ("Namespace URI 3", namespace_uri.is_equal (testing_namespace))						
			xml_prefix := default_pool.prefix_from_namespace_code (namespace_code)
			assert ("Prefix 2",  xml_prefix /= Void and then xml_prefix.is_equal ("test"))
		end

	test_miscellaneous is
		local
			suggestion: STRING
			name_code, fingerprint: INTEGER
		do
			name_code := default_pool.allocate_name ("test", testing_namespace, "test")
			suggestion := default_pool.suggest_prefix_for_uri (Xslt_uri)
			assert ("Suggestion", suggestion.is_equal ("xsl"))
			fingerprint := default_pool.fingerprint (testing_namespace, "test")
			assert ("Fingerprint", fingerprint = 1049)
			fingerprint := default_pool.fingerprint_from_expanded_name ("{http://colina.demon.co.uk/gobo/xml/xpath/tests}test")
			assert ("Fingerprint from expanded name", fingerprint = 1049)
		end

	-- still to test:
	--  allocate_document_number
	
feature -- Setting

	set_up is
		local
		do
			create shared_pool.make_rebuild
			default_pool := shared_pool.default_pool
		end

	tear_down is
		do
			-- Comment this next line out when finished debugging test cases.
			--			default_pool.diagnostic_dump
		end
end
