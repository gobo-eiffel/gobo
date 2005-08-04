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
			set_up --, tear_down
		end

	XM_XPATH_SHARED_CONFORMANCE

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SHARED_NAME_POOL

feature -- Access
	
	testing_namespace: STRING is "http://colina.demon.co.uk/gobo/xml/xpath/tests"
			-- Namespace-URI for these tests

feature -- Test

	test_allocations is
		local
			a_uri_code, another_uri_code, prefix_code: INTEGER -- should be INTEGER_16
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
				assert ("URI code not allocated", not shared_name_pool.is_code_for_uri_allocated (uri))

				shared_name_pool.allocate_code_for_uri (uri)
				a_uri_code := shared_name_pool.last_uri_code
		
				another_uri_code := shared_name_pool.code_for_uri (uri)
				assert ("Same URI code", a_uri_code = another_uri_code)
				
				counter:= counter + 1
			end
			
			shared_name_pool.allocate_namespace_code ("test", testing_namespace)
			namespace_code := shared_name_pool.last_namespace_code
			assert ("Namespace code", namespace_code = 721012)
			namespace_code := shared_name_pool.namespace_code ("test", testing_namespace)
			assert ("Namespace code 2", namespace_code = 721012)

			shared_name_pool.allocate_code_for_prefix ("test2")
			prefix_code := shared_name_pool.last_prefix_code
			assert ("Prefix code", prefix_code = 12)
			prefix_code := shared_name_pool.code_for_prefix ("test2")
			assert ("Prefix code", prefix_code = 12)
		end
	
	test_conversions is
		local
			name_code, namespace_code, uri_code, prefix_code: INTEGER
			an_xml_prefix, namespace_uri, local_name, display_name: STRING
		do
			assert ("Prefix code", not shared_name_pool.is_code_for_prefix_allocated("test3"))
			shared_name_pool.allocate_name ("test3", testing_namespace, "test3")
			name_code := shared_name_pool.last_name_code
			assert ("Positive name code", name_code > 0)
			an_xml_prefix := shared_name_pool.prefix_from_name_code (name_code)
			assert ("Prefix", an_xml_prefix /= Void and then STRING_.same_string (an_xml_prefix, "test3"))
			prefix_code := shared_name_pool.code_for_prefix ("test3")
			assert ("Prefix code 2", prefix_code > 0)
			namespace_code := shared_name_pool.namespace_code ("test3", testing_namespace)
			assert ("Valid namespace code", shared_name_pool.is_valid_namespace_code (namespace_code))
			uri_code := shared_name_pool.uri_code_from_name_code (name_code)
			assert ("URI code", uri_code > 0)
			namespace_uri := shared_name_pool.namespace_uri_from_name_code (name_code)
			assert ("Namespace URI", namespace_uri /= Void and then STRING_.same_string (namespace_uri, testing_namespace))
			local_name := shared_name_pool.local_name_from_name_code (name_code)
			assert ("Local name", local_name /= Void and then STRING_.same_string (local_name, "test3"))
			display_name := shared_name_pool.display_name_from_name_code (name_code)
			assert ("Display name", display_name /= Void and then STRING_.same_string (display_name, "test3:test3"))
			namespace_uri := shared_name_pool.uri_from_namespace_code (namespace_code)
			assert ("Namespace URI 2", namespace_uri /= Void and then STRING_.same_string (namespace_uri, testing_namespace))
			namespace_uri := shared_name_pool.uri_from_uri_code (uri_code)
			assert ("Namespace URI 3", STRING_.same_string (namespace_uri, testing_namespace))
			an_xml_prefix := shared_name_pool.prefix_from_namespace_code (namespace_code)
			assert ("Prefix 2",  an_xml_prefix /= Void and then STRING_.same_string (an_xml_prefix, "test3"))
		end

	test_name_code_consistency is
		local
			name_code, original_name_code: INTEGER
			local_name: STRING
		do
			local_name := "non-random-name-wHich-wont-occUr-in-OTHer-TesSts"
			assert ("Item not allocated", not shared_name_pool.is_name_code_allocated ("", "", local_name))
			shared_name_pool.allocate_name ("", "", local_name)
			original_name_code := shared_name_pool.last_name_code
			assert ("Item is allocated", shared_name_pool.is_name_code_allocated ("", "", local_name))
			name_code := shared_name_pool.name_code ("", "", local_name)
			assert ("Name codes equal", name_code = original_name_code)
		end
	
	test_miscellaneous is
		local
			suggestion: STRING
			fingerprint, fingerprint2: INTEGER
		do
			suggestion := shared_name_pool.suggested_prefix_for_uri (Xslt_uri)
			assert ("Suggestion", STRING_.same_string (suggestion, "xsl"))
			shared_name_pool.allocate_name ("test4", testing_namespace, "test4")
			fingerprint := shared_name_pool.fingerprint (testing_namespace, "test4")
			assert ("Fingerprint", fingerprint > 0) -- calculation depends upon {STRING}.hash_code, and so differs between compilers
			fingerprint2 := shared_name_pool.fingerprint_from_expanded_name ("{http://colina.demon.co.uk/gobo/xml/xpath/tests}test4")
			assert ("Fingerprint from expanded name", fingerprint2 = fingerprint)
		end

	-- still to test:
	--  allocate_document_number
	
feature -- Setting

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

--	tear_down is
--		do
			-- Comment this next line out when finished debugging test cases.
			--			default_pool.diagnostic_dump
--		end
end
