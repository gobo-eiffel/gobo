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

	shared_pool: XM_XPATH_SHARED_NAME_POOL is
			-- The shared name pool
		once
			create Result.make
		end

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
				assert ("URI code not allocated", not default_pool.is_code_for_uri_allocated (uri))

				default_pool.allocate_code_for_uri (uri)
				uri_code := default_pool.last_uri_code
				assert ("URI code 2", uri_code = 7 + counter)
		
				uri_code := default_pool.code_for_uri (uri)
				assert ("URI code 3", uri_code = 7 + counter)
				
				counter:= counter + 1
			end
			
			default_pool.allocate_namespace_code ("test", testing_namespace)
			namespace_code := default_pool.last_namespace_code
			assert ("Namespace code", namespace_code = 458864)
			namespace_code := default_pool.namespace_code ("test", testing_namespace)
			assert ("Namespace code 2", namespace_code = 458864)

			default_pool.allocate_code_for_prefix ("test2")
			prefix_code := default_pool.last_prefix_code
			assert ("Prefix code", prefix_code = 8)
			prefix_code := default_pool.code_for_prefix ("test2")
			assert ("Prefix code", prefix_code = 8)
		end
	
	test_conversions is
		local
			name_code, namespace_code, uri_code, prefix_code: INTEGER
			xml_prefix, namespace_uri, local_name, display_name: STRING
		do
			assert ("Prefix code", not default_pool.is_code_for_prefix_allocated("test3"))
			default_pool.allocate_name ("test3", testing_namespace, "test3")
			name_code := default_pool.last_name_code
			assert ("Positive name code", name_code > 0)
			xml_prefix := default_pool.prefix_from_name_code (name_code)
			assert ("Prefix", xml_prefix /= Void and then xml_prefix.is_equal ("test3"))
			prefix_code := default_pool.code_for_prefix ("test3")
			assert ("Prefix code 2", prefix_code > 0)			
			namespace_code := default_pool.namespace_code ("test3", testing_namespace)
			assert ("Valid namespace code", default_pool.is_valid_namespace_code (namespace_code))
			uri_code := default_pool.uri_code_from_name_code (name_code)
			assert ("URI code", uri_code > 0)
			namespace_uri := default_pool.namespace_uri_from_name_code (name_code)
			assert ("Namespace URI", namespace_uri /= Void and then namespace_uri.is_equal (testing_namespace))
			local_name := default_pool.local_name_from_name_code (name_code)
			assert ("Local name", local_name /= Void and then local_name.is_equal ("test3"))
			display_name := default_pool.display_name_from_name_code (name_code)
			assert ("Display name", display_name /= Void and then display_name.is_equal ("test3:test3"))
			namespace_uri := default_pool.uri_from_namespace_code (namespace_code)
			assert ("Namespace URI 2", namespace_uri /= Void and then namespace_uri.is_equal (testing_namespace))
			namespace_uri := default_pool.uri_from_uri_code (uri_code)
			assert ("Namespace URI 3", namespace_uri.is_equal (testing_namespace))						
			xml_prefix := default_pool.prefix_from_namespace_code (namespace_code)
			assert ("Prefix 2",  xml_prefix /= Void and then xml_prefix.is_equal ("test3"))
		end

	test_name_code_consistency is
		local
			name_code, original_name_code: INTEGER
			local_name: STRING
		do
			local_name := "ITEM"
			assert ("Item not allocated", not default_pool.is_name_code_allocated ("", "", local_name))
			default_pool.allocate_name ("", "", local_name)
			original_name_code := default_pool.last_name_code
			assert ("Item is allocated", default_pool.is_name_code_allocated ("", "", local_name))
			name_code := default_pool.name_code ("", "", local_name)
			assert ("Name codes equal", name_code = original_name_code)
		end
	
	test_miscellaneous is
		local
			suggestion: STRING
			name_code, fingerprint, fingerprint2: INTEGER
		do
			suggestion := default_pool.suggested_prefix_for_uri (Xslt_uri)
			assert ("Suggestion", suggestion.is_equal ("xsl"))
			default_pool.allocate_name ("test4", testing_namespace, "test4")
			fingerprint := default_pool.fingerprint (testing_namespace, "test4")
			assert ("Fingerprint", fingerprint > 0) -- calculation depends upon {STRING}.hash_code, and so differs between compilers
			fingerprint2 := default_pool.fingerprint_from_expanded_name ("{http://colina.demon.co.uk/gobo/xml/xpath/tests}test4")
			assert ("Fingerprint from expanded name", fingerprint2 = fingerprint)
		end

	-- still to test:
	--  allocate_document_number
	
feature -- Setting

	set_up is
		do
			default_pool := shared_pool.default_pool
		end

	tear_down is
		do
			-- Comment this next line out when finished debugging test cases.
			--			default_pool.diagnostic_dump
		end
end
