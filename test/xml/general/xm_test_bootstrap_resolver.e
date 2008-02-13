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

create

	make_default

feature -- Access

	catalog_name: STRING is "./data/test-catalog-2.xml"
			-- Name of test catalog

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
	
