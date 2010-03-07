indexing

	description:

		"Objects that manage OASIS XML Catalogs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CATALOG_MANAGER

inherit

	XM_FORMAL_PUBLIC_IDENTIFIER_ROUTINES

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	UT_URL_ENCODING

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			reinit
			create bootstrap_resolver.make
			are_processing_instructions_allowed := True
			prefer_public := True
		end

feature -- Access

	System_default_catalog: STRING is "file:///etc/xml/catalog"

	unescaped_uri_characters: DS_HASH_SET [CHARACTER] is
			-- Default character set not to escape
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_extra_reserved_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			a_character_set := STRING_.appended_string (a_character_set, "%%")
			Result := new_character_set (a_character_set)
		end

	bootstrap_resolver: XM_CATALOG_BOOTSTRAP_RESOLVER
			-- Resolver used in bootstrap process, and for resolving catalog names

	resolved_external_entity (a_public_id, a_system_id: STRING): STRING is
			-- Resolved URI reference for the external entity (`a_public_id', `a_system_id')
		require
			public_id_not_void: a_public_id /= Void
			system_id_not_void: a_system_id /= Void
			catalogs_not_disabled: not are_catalogs_disabled
		local
			an_fpi, another_fpi, a_debug_string: STRING
		do
			if debug_level > 2 then
				a_debug_string := STRING_.concat ("PUBLIC ", a_public_id)
				a_debug_string := STRING_.appended_string (", SYSTEM ", a_system_id)
				debug_message (3, "Resolving external entity", a_debug_string)
			end

			-- At this level, there is no re-try from relative URI to absolute URI -
			--  that is left to higher-level callers, such as XM_CATALOG_RESOLVER

			if a_public_id.substring_index ("urn:publicid:", 1) = 1 then
				another_fpi := urn_to_fpi (a_public_id)
			else
				another_fpi := a_public_id
			end
			if a_system_id.substring_index ("urn:publicid:", 1) = 1 then
				an_fpi := urn_to_fpi (a_system_id)
				if another_fpi.count > 0 then
					if STRING_.same_string (an_fpi, another_fpi) then
						Result := resolved_fpi (an_fpi, False)
					else
						debug_message (2, "SYSTEM id is a publicid URN, but differs from PUBLIC id", a_system_id)
						Result := resolved_fpi (another_fpi, False)
					end
				else
					Result := resolved_fpi (an_fpi, False)
				end
				if Result = Void then Result := a_system_id end
			else
				an_fpi := another_fpi
				if a_system_id.count = 0 then
					Result := resolved_fpi (an_fpi, False)
				else
					Result := resolved_fsi (a_system_id)
					if Result = Void then
						if an_fpi.count > 0 then
							Result := resolved_fpi (an_fpi, True)
						end
						if Result = Void then Result := a_system_id end
					end
				end
			end
		ensure
			resulting_uri_reference_not_void: Result /= Void -- but may be the original SYSTEM id, which may be zero length
		end

	resolved_uri_reference (a_uri_reference: STRING): STRING is
			-- Resolved URI reference for `a_uri_reference'
		require
			uri_reference_not_void: a_uri_reference /= Void
			catalogs_not_disabled: not are_catalogs_disabled
		local
			an_fpi: STRING
		do
			debug_message (3, "Resolving URI reference", a_uri_reference)

			-- At this level, there is no re-try from relative URI to absolute URI -
			--  that is left to higher-level callers, such as XM_CATALOG_RESOLVER

			if a_uri_reference.substring_index ("urn:publicid:", 1) = 1 then
				an_fpi := urn_to_fpi (a_uri_reference)
				Result := resolved_fpi (an_fpi, False)
			else
				Result := resolved_uri (a_uri_reference)
				if Result = Void then Result := a_uri_reference end
			end
		ensure
			resulting_uri_reference_not_void: Result /= Void -- but may be the original reference
		end

feature -- Status report

	prefer_public: BOOLEAN
			-- Prefer public or system?

	search_chain_truncated: BOOLEAN
			-- Is this serach chain truncated due to a delegate?

	are_processing_instructions_allowed: BOOLEAN
			-- Are oasis-xml-catalog PIs allowed?

	are_catalogs_disabled: BOOLEAN
			-- Is all usage of catalog files disabled?

	is_system_default_catalog_suppressed: BOOLEAN
			-- Should use of `System_default_catalog' be suppressed?

	debug_level: INTEGER
			-- Debugging level

	has (a_catalog_name: STRING): BOOLEAN is
			-- Does `Current' have a parsed copy of `a_catalog_name'?
		do
			Result := all_known_catalogs.has (a_catalog_name)
		end

feature -- Status setting

	suppress_default_system_catalog_file is
			-- Suppress use of `System_default_catalog'.
		do
			is_system_default_catalog_suppressed := True
			reinit
			debug_message (2, "System default catalog suppressed", System_default_catalog)
		ensure
			suppressed: is_system_default_catalog_suppressed
		end

	set_prefer_system is
			-- Prefer passed fsi to fpi.
		do
			prefer_public := False
			debug_message (3, "System/public preference", "system")
		ensure
			prefer_system: not prefer_public
		end

	suppress_catalogs is
			-- Turn off catalog file access.
		do
			are_catalogs_disabled := True
		end

	suppress_processing_instructions is
			-- Do not allow oasis-xml-catalog PIs to be used.
		do
			are_processing_instructions_allowed := False
			debug_message (3, "Per-document catalogs", "<suppressed>")
		ensure
			processing_instructions_disallowed: not are_processing_instructions_allowed
		end

	set_debug_level (a_level: INTEGER) is
			-- Set debugging level.
		require
			positive_debug_level: a_level >= 0
		do
			debug_level := a_level
		ensure
			debug_level_set: debug_level = a_level
		end

	set_search_chain_truncated is
			-- Indicate delagate catalog truncates serach chain.
		do
			search_chain_truncated := True
		end

feature -- Element change

	reset_pi_catalogs is
			-- Clear `pi_catalog_files'.
		do
			pi_catalog_files.wipe_out
			debug_message (2, "Per-document catalogs reset to", "<empty>")
		ensure
			pi_catalog_list_empty: pi_catalog_files.is_empty
		end

	add_pi_catalog (a_catalog_name: STRING) is
			-- Add `a_catalog_name' to `pi_catalog_files'.
		require
			processing_instructions_allowed: are_processing_instructions_allowed
			catalog_name_not_void: a_catalog_name /= Void
		do
			pi_catalog_files.force_last (a_catalog_name)
			debug_message (2, "Per-document catalog added", a_catalog_name)
		ensure
			catalog_name_added: pi_catalog_files.has (a_catalog_name)
		end

	parse_catalog_file (a_base_uri: UT_URI) is
			-- Parse `a_catalog_file'.
		require
			base_uri_is_absolute: a_base_uri /= Void and then a_base_uri.is_absolute
		local
			a_catalog: XM_CATALOG
			a_system_id: STRING
		do
			a_system_id := a_base_uri.full_reference
			debug_message (7, "Catalog's SYSTEM id is", a_system_id)

			if not all_known_catalogs.has (a_system_id) then

				-- Now try to open the catalog

				bootstrap_resolver.uri_scheme_resolver.resolve (a_system_id)
				if bootstrap_resolver.uri_scheme_resolver.has_error then
					debug_message (3, "Catalog does not exist", a_system_id)
				else
					create a_catalog.make (a_base_uri)
					if a_catalog.is_error then
						debug_message (1, "Failed to parse catalog", a_system_id)
						all_known_catalogs.put (Void, a_system_id)
					else
						all_known_catalogs.put (a_catalog, a_system_id)
					end
				end
			end
		end

	set_bootstrap_resolver (a_resolver: like bootstrap_resolver) is
			-- Set `bootstrap_resolver' to `a_resolver'.
		require
			a_resolver_not_void: a_resolver /= Void
		do
			bootstrap_resolver := a_resolver
		ensure
			bootstrap_resolver_set: bootstrap_resolver = a_resolver
		end

feature -- Output

	debug_message (a_level: INTEGER; a_message, an_argument: STRING) is
			--	Send a debugging message to standard error stream.
			-- TODO better to use log4e, if it ever gets incorporated into gobo
		require
			strictly_positive_debug_level: a_level > 0
			message_not_void: a_message /= Void
			argument_not_void: an_argument /= Void
		do
			if a_level <= debug_level then
				std.error.put_string (a_message)
				std.error.put_string (": ")
				std.error.put_string (an_argument)
				std.error.put_new_line
			end
		end

feature {TS_TEST_CASE} -- initialization

	reinit is
			-- Establish system catalogs
		do
			create {DS_LINKED_LIST [STRING]} system_catalog_files.make_default
			system_catalog_files.set_equality_tester (string_equality_tester)
			create pi_catalog_files.make_default
			pi_catalog_files.set_equality_tester (string_equality_tester)
			create all_known_catalogs.make_with_equality_testers (10, Void, string_equality_tester)
			establish_system_catalog_files
		end

feature {XM_CATALOG, TS_TEST_CASE} -- Implementation

	retrieved_catalog (a_catalog_name: STRING): XM_CATALOG is
			-- Parsed catalog named `a_catalog_name'
		require
			catalog_name_not_void: a_catalog_name /= Void
		local
			a_base_uri: UT_URI
			a_system_id: STRING
		do
			create a_base_uri.make_resolve (current_directory_base, a_catalog_name)
			a_system_id := a_base_uri.full_reference
			if all_known_catalogs.has (a_system_id) then
				Result := all_known_catalogs.item (a_system_id)
			else

				-- parse the catalog

				debug_message (2, "Loading catalog", a_catalog_name)
				parse_catalog_file (a_base_uri)
				if all_known_catalogs.has (a_system_id) then
					Result := all_known_catalogs.item (a_system_id)
				end
			end
		ensure
			retrieved_catalog_may_be_void: True
		end

	resolved_fpi (a_public_id: STRING; prefer_public_required: BOOLEAN): STRING is
			-- Resolved URI reference for `a_public_id'
		require
			public_id_not_void: a_public_id /= Void
		local
			an_fpi: STRING
			a_cursor: DS_LIST_CURSOR [STRING]
			a_cursor_2: DS_ARRAYED_LIST_CURSOR [STRING]
			a_catalog: XM_CATALOG
		do
			an_fpi := normalized_fpi (a_public_id)
			debug_message (8, "Fpi normalized to", an_fpi)

			-- first search the system catalogs

			debug_message (8, "Number of system catalogs", system_catalog_files.count.out)
			from
				a_cursor := system_catalog_files.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_catalog := retrieved_catalog (a_cursor.item)
				if a_catalog /= Void then
					debug_message (7, "Retrieved catalog is ", a_cursor.item)
					Result := a_catalog.resolved_fpi (an_fpi, prefer_public_required)
					if Result = Void and then not search_chain_truncated then
						a_cursor.forth
					else
						a_cursor.go_after
					end
				else
					debug_message (7, "Retrieved catalog failed parsing", a_cursor.item)
					a_cursor.forth -- WAS a_cursor.go_after
				end
			variant
				system_catalog_files.count + 1 - a_cursor.index
			end

			-- now check for catalogs specified by oasis-xml-catalog PIs

			if Result = Void and then are_processing_instructions_allowed and then not search_chain_truncated then
				from
					a_cursor_2 := pi_catalog_files.new_cursor; a_cursor_2.start
				until
					a_cursor_2.after
				loop
					a_catalog := retrieved_catalog (a_cursor_2.item)
					if a_catalog /= Void then
						debug_message (7, "Retrieved catalog is ", a_cursor_2.item)
						Result := a_catalog.resolved_fpi (an_fpi, prefer_public_required)
						if Result = Void and then not search_chain_truncated then
							a_cursor_2.forth
						else
							a_cursor_2.go_after
						end
					else
						debug_message (7, "Retrieved catalog failed parsing", a_cursor_2.item)
						a_cursor_2.forth
					end
				variant
					pi_catalog_files.count + 1 - a_cursor_2.index
				end
			end
			search_chain_truncated := False
		ensure
			result_may_be_void_if_not_match: True
		end

	resolved_fsi (a_system_id: STRING): STRING is
			-- Resolved URI reference for `a_system_id'
		require
			system_id_not_void: a_system_id /= Void
		local
			an_fsi: STRING
			a_cursor: DS_LIST_CURSOR [STRING]
			a_cursor_2: DS_ARRAYED_LIST_CURSOR [STRING]
			a_catalog: XM_CATALOG
		do
			an_fsi := escape_custom (utf8.to_utf8 (a_system_id), unescaped_uri_characters, False)
			debug_message (8, "Fsi normalized to", an_fsi)

			-- first search the system catalogs

			debug_message (8, "Number of system catalogs", system_catalog_files.count.out)
			from
				a_cursor := system_catalog_files.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_catalog := retrieved_catalog (a_cursor.item)
				if a_catalog /= Void then
					debug_message (7, "Retrieved catalog is ", a_cursor.item)
					Result := a_catalog.resolved_fsi (an_fsi)
					if Result = Void and then not search_chain_truncated then
						a_cursor.forth
					else
						a_cursor.go_after
					end
				else
					debug_message (7, "Retrieved catalog failed parsing", a_cursor.item)
					a_cursor.forth -- WAS: go_after
				end
			variant
				system_catalog_files.count + 1 - a_cursor.index
			end

			-- now check for catalogs specified by oasis-xml-catalog PIs

			if Result = Void and then are_processing_instructions_allowed and then not search_chain_truncated then
				from
					a_cursor_2 := pi_catalog_files.new_cursor; a_cursor_2.start
				until
					a_cursor_2.after
				loop
					a_catalog := retrieved_catalog (a_cursor_2.item)
					if a_catalog /= Void then
						debug_message (7, "Retrieved catalog is ", a_cursor_2.item)
						Result := a_catalog.resolved_fsi (an_fsi)
						if Result = Void and then not search_chain_truncated then
							a_cursor_2.forth
						else
							a_cursor_2.go_after
						end
					else
						debug_message (7, "Retrieved catalog failed parsing", a_cursor_2.item)
						a_cursor_2.forth
					end
				variant
					pi_catalog_files.count + 1 - a_cursor_2.index
				end
			end
			search_chain_truncated := False
		ensure
			result_may_be_void_if_not_match: True
		end

	resolved_uri (a_uri_reference: STRING): STRING is
			-- Resolved URI reference for `a_uri_reference'
		require
			system_id_not_void: a_uri_reference /= Void
		local
			a_uri: STRING
			a_cursor: DS_LIST_CURSOR [STRING]
			a_cursor_2: DS_ARRAYED_LIST_CURSOR [STRING]
			a_catalog: XM_CATALOG
		do
			a_uri := escape_custom (utf8.to_utf8 (a_uri_reference), unescaped_uri_characters, False)
			debug_message (8, "URI normalized to", a_uri)

			-- first search the system catalogs

			debug_message (8, "Number of system catalogs", system_catalog_files.count.out)
			from
				a_cursor := system_catalog_files.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_catalog := retrieved_catalog (a_cursor.item)
				if a_catalog /= Void then
					debug_message (7, "Retrieved catalog is ", a_cursor.item)
					Result := a_catalog.resolved_uri (a_uri)
					if Result = Void and then not search_chain_truncated then
						a_cursor.forth
					else
						a_cursor.go_after
					end
				else
					debug_message (7, "Retrieved catalog failed parsing", a_cursor.item)
					a_cursor.forth -- WAS: go_after
				end
			variant
				system_catalog_files.count + 1 - a_cursor.index
			end

			-- now check for catalogs specified by oasis-xml-catalog PIs

			if Result = Void and then are_processing_instructions_allowed and then not search_chain_truncated then
				from
					a_cursor_2 := pi_catalog_files.new_cursor; a_cursor_2.start
				until
					a_cursor_2.after
				loop
					a_catalog := retrieved_catalog (a_cursor_2.item)
					if a_catalog /= Void then
						debug_message (7, "Retrieved catalog is ", a_cursor_2.item)
						Result := a_catalog.resolved_uri (a_uri)
						if Result = Void and then not search_chain_truncated then
							a_cursor_2.forth
						else
							a_cursor_2.go_after
						end
					else
						debug_message (7, "Retrieved catalog failed parsing", a_cursor_2.item)
						a_cursor_2.forth
					end
				variant
					pi_catalog_files.count + 1 - a_cursor_2.index
				end
			end
			search_chain_truncated := False
		ensure
			result_may_be_void_if_not_match: True
		end

feature {NONE} -- Implementation

	system_catalog_files: DS_LIST [STRING]
			-- Names of catalog files from which searches should commence

	pi_catalog_files: DS_ARRAYED_LIST [STRING]
			-- Names of catalog files which are searched after `system_catalog_files'.

	all_known_catalogs: DS_HASH_TABLE [XM_CATALOG, STRING]
			-- Map of catalog names to parsed catalogs.
			-- This will contain `Void' values for catalogs that failed parsing,
			--  so as not to waste time parsing them again.

	current_directory_base: UT_URI is
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
		end

	establish_system_catalog_files is
			-- Establish list of catalogs to be searched for all documents
		local
			xml_catalog_files, l_separator: STRING
			a_splitter: ST_SPLITTER
			a_list: DS_LIST [STRING]
			a_base_uri: UT_URI
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			xml_catalog_files := Execution_environment.variable_value ("XML_CATALOG_FILES")
			if xml_catalog_files /= Void then
				create a_splitter.make
				if operating_system.is_windows then
					l_separator := ";"
				else
					l_separator := ":"
				end
				a_splitter.set_separators (l_separator)
				a_list := a_splitter.split (xml_catalog_files)
			end
			if a_list /= Void then
				system_catalog_files := a_list
				system_catalog_files.set_equality_tester (string_equality_tester)

				-- Now convert the names to absolute URIs

				from
					a_cursor := system_catalog_files.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					create a_base_uri.make_resolve_uri (current_directory_base, File_uri.filename_to_uri (a_cursor.item))
					a_cursor.replace (a_base_uri.full_reference)
					a_cursor.forth
				variant
					system_catalog_files.count + 1 - a_cursor.index
				end
			end
			if not is_system_default_catalog_suppressed and then system_catalog_files.count = 0 then
				system_catalog_files.force_last (System_default_catalog)
			end
			debug_message (8, "Number of system catalog files is", system_catalog_files.count.out)
		end


invariant

	system_catalog_files_not_void: system_catalog_files /= Void
	pi_catalog_files_not_void: pi_catalog_files /= Void
	all_known_catalogs_not_void: all_known_catalogs /= Void
	positive_debug_level: debug_level >= 0

end

