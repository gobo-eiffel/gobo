indexing

	description:

		"Test bootstrap resolver"

	library: "Gobo Eiffel XML test suite"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TEST_BOOTSTRAP_RESOLVER

inherit

	TS_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES

	XM_SHARED_CATALOG_MANAGER

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Access

	catalog_name: STRING is 
			-- URI of test catalog
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"test", "xml", "general", "data", "test-catalog-2.xml">>)
			Result := Execution_environment.interpreted_string (Result)
			Result := File_uri.filename_to_uri (Result).full_reference
		ensure
			catalog_name_not_void: Result /= Void
			catalog_name_not_empty: not Result.is_empty
		end

feature -- Tests

	test_bootstrap_resolution is
			-- Test parsing a catalog file
		local
			a_catalog: XM_CATALOG
		do
			shared_catalog_manager.set_debug_level (0)
			assert ("Catalog has not been parsed before", not shared_catalog_manager.has (catalog_name))
			a_catalog := shared_catalog_manager.retrieved_catalog (catalog_name)
			assert ("Catalog parsed successfully", a_catalog /= Void)
		end
		
end
	
