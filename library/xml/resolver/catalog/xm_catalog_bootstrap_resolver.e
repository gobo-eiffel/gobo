indexing

	description:

		"Resolvers used in parsing OASIS XML Catalogs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class  XM_CATALOG_BOOTSTRAP_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER
		redefine
			resolve_public, resolve_finish
		end

	XM_URI_REFERENCE_RESOLVER

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_FILE_SYSTEM

	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER

creation

	make

feature {NONE} -- Initialization
	
	make is
			-- Establish invariant.
		local
			a_resolver_factory: XM_RESOLVER_FACTORY
		do
			create a_resolver_factory
			uri_scheme_resolver := a_resolver_factory.new_file_resolver_current_directory
			create well_known_system_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_system_ids.put (Xml_catalog_dtd, Xml_catalog_system_id)
			create well_known_public_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_public_ids.put (Xml_catalog_dtd, Xml_catalog_public_id)
			create well_known_uri_references.make_with_equality_testers (2, string_equality_tester, string_equality_tester)
			well_known_uri_references.put (Xml_catalog_xsd, Xml_catalog_xsd_id)
			well_known_uri_references.put (Xml_catalog_rng, Xml_catalog_rng_id)
		end

feature -- Access

	uri_scheme_resolver: XM_URI_EXTERNAL_RESOLVER
			-- Resolver used for opening streams

	Xml_catalog_xsd_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.xsd"
			-- URI of the W3C XML Schema for OASIS XML Catalog files

	Xml_catalog_rng_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.rng"
			-- URI of the RELAX NG Grammar for OASIS XML Catalog files

	Xml_catalog_public_id: STRING is "-//OASIS//DTD XML Catalogs V1.0//EN"
			-- Public identifier for OASIS XML Catalog files

	Xml_catalog_system_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd"
			-- System identifier for OASIS XML Catalog files

	Reserved_directory_path: STRING is
			-- Path to  directory
		once
			Result := Execution_environment.variable_value ("GOBO")
			Result := unix_file_system.pathname_from_file_system (Result, file_system)
			if Result /= Void and then Result.item (Result.count) = '/' then
				Result := STRING_.appended_string (Result, "misc/")
			else
				Result := STRING_.appended_string (Result, "/misc/")
			end
			Result := file_system.pathname_from_file_system (Result, unix_file_system)
		end

	Xml_catalog_dtd: STRING is
			-- Path to OASIS XML Catalogs DTD
		once
			Result := STRING_.concat (Reserved_directory_path, "catalog.dtd")
		ensure
			xml_catalog_dtd_not_void: Result /= Void
		end

	Xml_catalog_xsd: STRING is
			-- Path to OASIS XML Catalogs W3C schema
		once
			Result := STRING_.concat (Reserved_directory_path, "catalog.xsd")
		ensure
			xml_catalog_xsd_not_void: Result /= Void
		end

	Xml_catalog_rng: STRING is
			-- Path to OASIS XML Catalogs RELAX NG grammar
		once
			Result := STRING_.concat (Reserved_directory_path, "catalog.rng")
		ensure
			xml_catalog_rng_not_void: Result /= Void
		end

	well_known_system_ids: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known system ids to file names

	well_known_public_ids: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known public ids to file names

	well_known_uri_references: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known URI references to file names

feature -- Action(s)

	resolve (a_system: STRING) is
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		local
			a_system_id: STRING
		do
			if well_known_system_ids.has (a_system) then
				a_system_id := well_known_system_ids.item (a_system)
			else
				a_system_id := a_system -- best effort
			end
			uri_scheme_resolver.resolve (a_system_id)
			resolve_finish
		end
		
	resolve_public (a_public: STRING; a_system: STRING) is
			-- Resolve a public/system identified pair to an input stream.
			-- (Default implementation: resolve using system ID only.)
		local
			a_public_id, a_system_id: STRING		
		do
			if well_known_system_ids.has (a_system) then
				a_system_id := well_known_system_ids.item (a_system)
				uri_scheme_resolver.resolve (a_system_id)
			elseif well_known_public_ids.has (a_public) then
				a_public_id := well_known_public_ids.item (a_public)
				uri_scheme_resolver.resolve (a_public_id)
			else
				uri_scheme_resolver.resolve_public (a_public, a_system) -- best effort
			end
			resolve_finish
		end
		
	resolve_finish is
			-- The parser has finished with the last resolved entity.
			-- The previously resolved entity becomes the last resolved one.
			-- Note: `last_stream' is not required to be restored accordingly.
		do
			uri_scheme_resolver.resolve_finish
		end

	resolve_uri (a_uri_reference: STRING) is
			-- Resolve `a_uri_reference' on behalf of an application.
		local
			a_system_id: STRING
		do
			if well_known_uri_references.has (a_uri_reference) then
				a_system_id := well_known_uri_references.item (a_uri_reference)
			else
				a_system_id := a_uri_reference
			end
			uri_scheme_resolver.resolve (a_uri_reference)
			resolve_finish
		end

feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from external entity.
		do
			Result := uri_scheme_resolver.last_stream
		end

	has_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := uri_scheme_resolver.has_error
		end
		
	last_error: STRING is
			-- Last error message.
		do
			Result := uri_scheme_resolver.last_error
		end

	last_uri_reference_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from URI reference.
		do
			Result := uri_scheme_resolver.last_stream
		end
	
	has_uri_reference_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := uri_scheme_resolver.has_error
		end
		
	last_uri_reference_error: STRING is
			-- Last error message.
		do
			Result := uri_scheme_resolver.last_error
		end

end

	
