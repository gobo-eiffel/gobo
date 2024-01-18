note

	description:

		"Test XM_CATALOG"

	library: "Gobo Eiffel XML test suite"
	copyright: "Copyright (c) 2004-2016, Colin Adams and others"
	license: "MIT License"

class XM_TEST_CATALOG

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_CATALOG_MANAGER_HANDLER

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_FILE_SYSTEM

	XM_SHARED_CATALOG_MANAGER

create

	make_default

feature -- Tests

	test_resolve_public
			-- Test resolving an fpi via nextCatalog
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fpi ("ISO 8879:1986//ENTITIES Box and Line Drawing//EN", True)
			assert ("PUBLIC resolved", a_uri /= Void and then a_uri.count > 34 and then STRING_.same_string (a_uri.substring (a_uri.count - 34, a_uri.count), "/xml-dtd-4.2-1.0-24/ent/iso-box.ent"))
		end

	test_resolve_public_delegate
			-- Test resolving an fpi via delegated catalog
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fpi ("-//OASIS//ENTITIES DocBook XML Character Entities V4.1.2//EN",True)
			assert ("PUBLIC resolved via delegation", a_uri /= Void and then a_uri.count > 32 and then STRING_.same_string (a_uri.substring (a_uri.count - 32, a_uri.count), "/xml-dtd-4.1.2-1.0-24/dbcentx.mod"))
		end

	--  TODO - add tests for prefer=public versus prefer=system (requires more complex test catalog structure)

	test_resolve_system
			-- Test resolving an fsi via nextCatalog with base URI
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fsi ("http://www.gobosoft.com/test/system-id-one")
			assert ("SYSTEM resolved", a_uri /= Void and then STRING_.same_string (a_uri, "http://colina.demon.co.uk/gobo/system-id-one"))
		end

	test_rewrite_system
			-- Test resolving an fsi via nextCatalog with rewriteSystem and group base URI
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fsi ("http://www.oasis-open.org/docbook/xml/4.1.2/test.system")
			assert ("SYSTEM resolved via rewrite", a_uri /= Void and then STRING_.same_string (a_uri, "ftp://ftp.gobosoft.com/pub/xml-dtd-4.1.2-1.0-24/test.system"))
		end

	test_system_suffix
			-- Test resolving an fsi based on systemSuffix records.
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fsi ("file:///local/backup/4.3/docbookx.dtd")
			assert ("SYSTEM resolved via suffix", a_uri /= Void and then STRING_.same_string (a_uri, "file:///share/doctypes/xml/4.3/docbookx.dtd"))
		end

	test_uri_suffix
			-- Test resolving a uri reference based on uriSuffix records.
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_uri ("file:///local/backup/4.3/docbookx.dtd")
			assert ("SYSTEM resolved via suffix", a_uri /= Void and then STRING_.same_string (a_uri, "file:///share/doctypes/xml/4.3/docbookx.dtd"))
		end

	test_resolve_system_delegate
			-- Test resolving an fsi via delegated catalog
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_fsi ("http://www.colina.demon.co.uk/test/system-id-two")
			assert ("SYSTEM resolved via delegation", a_uri /= Void and then STRING_.same_string (a_uri, "ftp://colina.demon.co.uk/gobo/system-id-two"))
		end

	test_resolve_uri
			-- Test resolving a uri reference via nextCatalog with base URI
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_uri ("http://www.gobosoft.com/test/system-id-one")
			assert ("URI reference resolved", a_uri /= Void and then STRING_.same_string (a_uri, "http://colina.demon.co.uk/gobo/system-id-one"))
		end

	test_rewrite_uri
			-- Test resolving a uri reference via nextCatalog with rewriteuri and group base URI
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_uri ("http://www.oasis-open.org/docbook/xml/4.1.2/test.system")
			assert ("URI reference resolved via rewrite", a_uri /= Void and then STRING_.same_string (a_uri, "ftp://ftp.gobosoft.com/pub/xml-dtd-4.1.2-1.0-24/test.system"))
		end

	test_resolve_uri_delegate
			-- Test resolving a uri reference via delegated catalog
		local
			a_uri: STRING
		do
			shared_catalog_manager.set_debug_level (0)
			a_uri := shared_catalog_manager.resolved_uri ("http://www.colina.demon.co.uk/test/system-id-two")
			assert ("URI reference resolved via delegation", a_uri /= Void and then STRING_.same_string (a_uri, "ftp://colina.demon.co.uk/gobo/system-id-two"))
		end


feature -- Setting

	set_up
			-- <Precursor>.
		local
			l_path: STRING
		do
			l_path := Execution_environment.interpreted_string (
				file_system.nested_pathname ("${GOBO}", <<"library", "xml", "test", "unit", "general", "data", "test-catalog-1.xml">>))
			Execution_environment.set_variable_value ("XML_CATALOG_FILES", l_path)
			shared_catalog_manager.reinit
		end

end

