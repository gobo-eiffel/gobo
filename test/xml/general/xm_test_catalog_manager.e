indexing

	description:

		"Test interfaces to XM_CATALOG_MANAGER"

	library: "Gobo Eiffel XML test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_TEST_CATALOG_MANAGER

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	KL_SHARED_FILE_SYSTEM

	XM_SHARED_CATALOG_MANAGER

feature -- Tests

	test_resolve_system is
			-- Test call to `resolved_external_entity' with a SYSTEM id.
		local
			a_uri: STRING
		do
			a_uri := shared_catalog_manager.resolved_external_entity ("", "http://www.gobosoft.com/test/system-id-one")
			assert ("SYSTEM resolved", a_uri /= Void and then STRING_.same_string (a_uri, "http://colina.demon.co.uk/gobo/system-id-one"))
		end

	test_resolve_public is
			-- Test call to `resolved_external_entity' without a SYSTEM id.
		local
			a_uri: STRING
		do
			a_uri := shared_catalog_manager.resolved_external_entity ("-//OASIS//ENTITIES DocBook XML Character Entities V4.1.2//EN", "")
			assert ("PUBLIC resolved via delegation", a_uri /= Void and then a_uri.count > 32 and then STRING_.same_string (a_uri.substring (a_uri.count - 32, a_uri.count), "/xml-dtd-4.1.2-1.0-24/dbcentx.mod"))
		end

	test_resolve_uri is
			-- Test call to `resolved_uri_reference'.
		local
			a_uri: STRING
		do
			a_uri := shared_catalog_manager.resolved_uri_reference ("http://www.oasis-open.org/docbook/xml/4.1.2/test.system")
			assert ("URI reference resolved via rewrite", a_uri /= Void and then STRING_.same_string (a_uri, "ftp://ftp.gobosoft.com/pub/xml-dtd-4.1.2-1.0-24/test.system"))
		end
		
feature -- Setting

	set_up is
		do
			Execution_environment.set_variable_value ("XML_CATALOG_FILES", file_system.pathname_from_file_system ("./data/test-catalog-1.xml", unix_file_system))
			shared_catalog_manager.reinit
		end

end
	
