indexing

	description:

		"Objects that represent an OASIS ETRC XML Catalog"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CATALOG

inherit

	XM_SHARED_CATALOG_MANAGER

	XM_STRING_MODE

	XM_CALLBACKS_NULL
		rename
			make as make_null
		redefine
			on_start_tag, on_attribute, on_start_tag_finish, on_end_tag, on_content
		end

	UT_URL_ENCODING

	XM_FORMAL_PUBLIC_IDENTIFIER_ROUTINES

	KL_SHARED_FILE_SYSTEM

	UC_SHARED_STRING_EQUALITY_TESTER

create

	make
	
feature {NONE} -- Initialization

	make (a_base_uri: UT_URI) is
			-- Establish invariant.
		require
			base_uri_not_void: a_base_uri /= Void
		do
			set_string_mode_mixed
			create local_catalog_files.make_default
			local_catalog_files.set_equality_tester (string_equality_tester)
			create system_rewrite_rules.make_default
			create uri_rewrite_rules.make_default
			create system_suffix_rules.make_default
			create uri_suffix_rules.make_default
			create system_delegates.make_default
			create uri_delegates.make_default
			create public_delegates.make_default
			prefer_public := shared_catalog_manager.prefer_public
			base_uri := a_base_uri
			system_id := base_uri.full_reference
			create system_entries.make_with_equality_testers (10, Void, string_equality_tester)
			create uri_entries.make_with_equality_testers (10, Void, string_equality_tester)
			create public_entries.make_with_equality_testers (10, Void, string_equality_tester)
			create prefer_public_entries.make_with_equality_testers (10, Void, string_equality_tester)
			create element_name_stack.make_default
			element_name_stack.set_equality_tester (string_equality_tester)
			read
		ensure
			base_uri_set: base_uri = a_base_uri
		end

feature -- Access

	resolved_fpi (a_public_id: STRING; prefer_public_required: BOOLEAN): STRING is
			-- Resolved URI for `a_public_id'
		require
			public_id_not_void: a_public_id /= Void -- TODO and then is normalized
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_public_entry: XM_PUBLIC_CATALOG_ENTRY
			a_catalog: XM_CATALOG
		do
			if public_entries.has (a_public_id) then
				shared_catalog_manager.debug_message (4, "Public entry found in catalog", a_public_id)
				a_public_entry := public_entries.item (a_public_id)
				check
					public_entry_not_void: a_public_entry /= Void
				end
				shared_catalog_manager.debug_message (6, "Public entry is prefer=public?", a_public_entry.prefer_public.out)
				if not prefer_public_required or else a_public_entry.prefer_public then
					Result := a_public_entry.target
					shared_catalog_manager.debug_message (6, "Public entry found in prefer=system list", a_public_id)
					shared_catalog_manager.debug_message (5, "Public entry resolves to", Result)
				elseif prefer_public_required and then prefer_public_entries.has (a_public_id) then
					Result := prefer_public_entries.item (a_public_id).target
					shared_catalog_manager.debug_message (6, "Public entry found in prefer=public list", a_public_id)
				end
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for delegates for", a_public_id)
				Result := resolved_delegated_fpi (a_public_id, prefer_public_required)
			end
			if Result = Void and then not delegated then
				shared_catalog_manager.debug_message (9, "Checking next catalogs for", a_public_id)
				from
					a_cursor := local_catalog_files.new_cursor; a_cursor.start
				variant
					local_catalog_files.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_catalog := shared_catalog_manager.retrieved_catalog (a_cursor.item)
					if a_catalog /= Void then
						Result := a_catalog.resolved_fpi (a_public_id, prefer_public_required)
					end
					if Result = Void then
						a_cursor.forth
					else
						a_cursor.go_after
					end
				end
			end
			delegated := False
		ensure
			result_may_be_void_if_not_match: True
		end

	resolved_fsi (a_system_id: STRING): STRING is
			-- Resolved URI for `a_system_id'
		require
			system_id_not_void: a_system_id /= Void -- TODO and then is normalized
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			another_cursor: DS_LINKED_LIST_CURSOR [XM_REWRITE_CATALOG_ENTRY]
			a_system_entry: XM_CATALOG_ENTRY
			a_catalog: XM_CATALOG
			a_rewrite_rule: XM_REWRITE_CATALOG_ENTRY
		do
			if system_entries.has (a_system_id) then
				shared_catalog_manager.debug_message (4, "System entry found in catalog", a_system_id)
				a_system_entry := system_entries.item (a_system_id)
				check
					system_entry_not_void: a_system_entry /= Void
				end
				Result := a_system_entry.target
				shared_catalog_manager.debug_message (5, "System entry resolves to", Result)
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for system rewrite rules for", a_system_id)
				from
					another_cursor := system_rewrite_rules.new_cursor; another_cursor.start
				variant
					system_rewrite_rules.count + 1 - another_cursor.index
				until
					another_cursor.after
				loop
					a_rewrite_rule := another_cursor.item
					shared_catalog_manager.debug_message (9, "Next rewrite rule matches", a_rewrite_rule.start_string)
					if a_system_id.substring_index (a_rewrite_rule.start_string, 1) = 1 then
						Result := STRING_.cloned_string (a_system_id)
						Result := STRING_.replaced_substring (Result, a_rewrite_rule.target, 1, a_rewrite_rule.count)
						shared_catalog_manager.debug_message (5, "Rewrite rule resolved to", Result)
						another_cursor.go_after
					else
						another_cursor.forth
					end
				end
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for system suffixes for", a_system_id)
				Result := resolved_suffixed_fsi (a_system_id)
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for system delegates for", a_system_id)
				Result := resolved_delegated_fsi (a_system_id)
			end
			if Result = Void and then not delegated then
				shared_catalog_manager.debug_message (9, "Checking next catalogs for", a_system_id)
				from
					a_cursor := local_catalog_files.new_cursor; a_cursor.start
				variant
					local_catalog_files.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_catalog := shared_catalog_manager.retrieved_catalog (a_cursor.item)
					if a_catalog /= Void then
						Result := a_catalog.resolved_fsi (a_system_id)
					end
					if Result = Void then
						a_cursor.forth
					else
						a_cursor.go_after
					end
				end
			end
			delegated := False
		ensure
			result_may_be_void_if_not_match: True
		end


	resolved_uri (a_uri_reference: STRING): STRING is
			-- Resolved URI for `a_uri_reference'
		require
			uri_reference_not_void: a_uri_reference /= Void -- TODO and then is normalized
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			another_cursor: DS_LINKED_LIST_CURSOR [XM_REWRITE_CATALOG_ENTRY]
			a_uri_entry: XM_CATALOG_ENTRY
			a_catalog: XM_CATALOG
			a_rewrite_rule: XM_REWRITE_CATALOG_ENTRY
		do
			if uri_entries.has (a_uri_reference) then
				shared_catalog_manager.debug_message (4, "Uri entry found in catalog", a_uri_reference)
				a_uri_entry := uri_entries.item (a_uri_reference)
				check
					uri_entry_not_void: a_uri_entry /= Void
				end
				Result := a_uri_entry.target
				shared_catalog_manager.debug_message (5, "Uri entry resolves to", Result)
			end
			if Result = Void then
				shared_catalog_manager.debug_message (4, "Checking for uri rewrite rules for", a_uri_reference)
				from
					another_cursor := uri_rewrite_rules.new_cursor; another_cursor.start
				variant
					uri_rewrite_rules.count + 1 - another_cursor.index
				until
					another_cursor.after
				loop
					a_rewrite_rule := another_cursor.item
					shared_catalog_manager.debug_message (9, "Next rewrite rule matches", a_rewrite_rule.start_string)
					if a_uri_reference.substring_index (a_rewrite_rule.start_string, 1) = 1 then
						Result := STRING_.cloned_string (a_uri_reference)
						Result := STRING_.replaced_substring (Result, a_rewrite_rule.target, 1, a_rewrite_rule.count)
						shared_catalog_manager.debug_message (5, "Rewrite rule resolved to", Result)
						another_cursor.go_after
					else
						another_cursor.forth
					end
				end
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for uri suffixes for", a_uri_reference)
				Result := resolved_suffixed_uri (a_uri_reference)
			end
			if Result = Void then
				shared_catalog_manager.debug_message (9, "Checking for uri delegates for", a_uri_reference)
				Result := resolved_delegated_uri (a_uri_reference)
			end
			if Result = Void and then not delegated then
				shared_catalog_manager.debug_message (9, "Checking next catalogs for", a_uri_reference)
				from
					a_cursor := local_catalog_files.new_cursor; a_cursor.start
				variant
					local_catalog_files.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_catalog := shared_catalog_manager.retrieved_catalog (a_cursor.item)
					if a_catalog /= Void then
						Result := a_catalog.resolved_uri (a_uri_reference)
					end
						if Result = Void then
							a_cursor.forth
						else
							a_cursor.go_after
						end
				end
			end
			delegated := False
		ensure
			result_may_be_void_if_not_match: True
		end

			
feature -- Status report

	is_error: BOOLEAN
			-- Did `read' detect an error?

	delegated: BOOLEAN
			-- Has delegation FROM this catalog taken place?

feature -- Events

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		do
			if not is_error then
				if ignoring_depth = 0 then
					if STRING_.same_string (a_namespace, oasis_etrc_namespace) then
						if current_element_name = Void or else STRING_.same_string (current_element_name, Catalog_entry)
							or else STRING_.same_string (current_element_name, Group_entry) then
							create attribute_namespaces.make_default
							create attribute_local_parts.make_default
							create attribute_values.make_default
						else
							is_error := True
							shared_catalog_manager.debug_message (1, "Element must be empty", current_element_name)
						end
					elseif not in_catalog then
						is_error := True
						shared_catalog_manager.debug_message (1, "Document element is not catalog", current_element_name)
						-- TODO terminate the parse
					else
						
						-- ignore this element, and all it's descendants
						
						ignoring_depth := 1
					end
				else
					ignoring_depth := ignoring_depth + 1
				end
				element_name_stack.force (a_local_part)
			end
		end

	on_start_tag_finish is
			-- End of start tag.
		do
			if not is_error and then ignoring_depth = 0 then
				if	STRING_.same_string (current_element_name, Catalog_entry) then
					if in_catalog then
						is_error := True
						shared_catalog_manager.debug_message (1, "Nested catalog elements not allowed", system_id)
					else
						in_catalog := True
						set_catalog_attributes (True)
					end
				elseif STRING_.same_string (current_element_name, Group_entry) then
					set_catalog_attributes (False)
					if group_depth = 0 then
						group_depth := 1
					else
						shared_catalog_manager.debug_message (1, "Nested group elements not allowed", system_id)
					end
				elseif STRING_.same_string (current_element_name, System_entry) then
					add_system_entry
				elseif STRING_.same_string (current_element_name, Public_entry) then
					add_public_entry
				elseif STRING_.same_string (current_element_name, Uri_entry) then
					add_uri_entry
				elseif STRING_.same_string (current_element_name, Rewrite_system_entry) then
					add_rewrite_rule (True)
				elseif STRING_.same_string (current_element_name, Rewrite_uri_entry) then
					add_rewrite_rule (False)			
				elseif STRING_.same_string (current_element_name, Delegate_public_entry) then
					add_public_delegate
				elseif STRING_.same_string (current_element_name, Delegate_system_entry) then
					add_system_delegate
				elseif STRING_.same_string (current_element_name, Delegate_uri_entry) then
					add_uri_delegate
				elseif STRING_.same_string (current_element_name, System_suffix_entry) then
					add_suffix (True)
				elseif STRING_.same_string (current_element_name, Uri_suffix_entry) then
					add_suffix (False)
				elseif STRING_.same_string (current_element_name, Next_catalog_entry) then
					add_next_catalog
				end				
			end
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute
		do
			if not is_error and then ignoring_depth = 0 then
				attribute_namespaces.force_last (a_namespace)
				attribute_local_parts.force_last (a_local_part)
				attribute_values.force_last (a_value)
			end
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
			if not is_error then
				if ignoring_depth > 0 then
					ignoring_depth := ignoring_depth - 1
				end
				if STRING_.same_string (current_element_name, Group_entry) then
					check
						in_group: group_depth = 1
					end
					group_depth := 0
				elseif STRING_.same_string (current_element_name, Catalog_entry) then
					in_catalog := False
				end
				element_name_stack.remove
			end
		end

	on_content (a_content: STRING) is
			-- Text content.
		do
			if not is_error and then in_catalog and then ignoring_depth = 0 then
				if	STRING_.same_string (current_element_name, Catalog_entry) or else
					STRING_.same_string (current_element_name, Group_entry) then
					-- OK if it's whitespace - add a check?
				else
					shared_catalog_manager.debug_message (1, "Character content is not allowed", current_element_name)
					is_error := True
				end
			end
		end

feature {NONE} -- Implementation	

	base_uri: UT_URI
			-- Base URI of `Current';
			-- This can change during parsing.

	group_base: UT_URI
			-- Base URI of current group;
			-- (Only relevant when group_depth > 0)

	prefer_public: BOOLEAN
			-- Prefer PUBLIC or SYSTEM entries?
	
	group_prefer_public: BOOLEAN
			-- Prefer PUBLIC or SYSTEM entries for current group?
	
	system_id: STRING
			-- Name of catalog file
	
	in_catalog: BOOLEAN
			-- Are we within `catalog' document element?

	ignoring_depth: INTEGER
			-- Nesting depth of ignored elements (element at depth 1 is in a foreign namespace)

	group_depth: INTEGER
			-- Nesting depth of elements within a group element

	element_name_stack: DS_ARRAYED_STACK [STRING]
			-- Stack of element local names

	current_element_name: STRING is
			-- Name of start tag currently being parsed
		do
			if not element_name_stack.is_empty then
				Result := element_name_stack.item
			end
		end

	attribute_namespaces, attribute_local_parts, attribute_values: DS_ARRAYED_LIST [STRING]
			-- Triples for the attributes on current element

	oasis_etrc_namespace: STRING is "urn:oasis:names:tc:entity:xmlns:xml:catalog"

	xml_namespace: STRING is "http://www.w3.org/XML/1998/namespace"
			-- namespace for "xml" prefix

	parser: XM_EIFFEL_PARSER is
			-- XML Parser
		local
			a_namespace_resolver: XM_NAMESPACE_RESOLVER
		do
			create Result.make
			Result.set_resolver (shared_catalog_manager.bootstrap_resolver)
			Result.copy_string_mode (Current)

			-- TODO - need to conditionally add in an XM_OASIS_XML_CATALOG_FILTER
			create a_namespace_resolver.set_next (Current)
			Result.set_callbacks (a_namespace_resolver)
		end

	local_catalog_files: DS_ARRAYED_LIST [STRING]
			-- Names of catalog files included by `nextCatalog' entries in `Current'

	public_delegates: DS_LINKED_LIST [XM_PUBLIC_DELEGATE_CATALOG_ENTRY]
			-- Delegated catalogs for PUBLIC identifiers
	
	system_delegates: DS_LINKED_LIST [XM_DELEGATE_CATALOG_ENTRY]
			-- Delegated catalogs for SYSTEM identifiers
	
	uri_delegates: DS_LINKED_LIST [XM_DELEGATE_CATALOG_ENTRY]
			-- Delegated catalogs for URI references
	
	system_rewrite_rules: DS_LINKED_LIST [XM_REWRITE_CATALOG_ENTRY]
			-- Rewrite rules for SYSTEM identifiers
	
	uri_rewrite_rules: DS_LINKED_LIST [XM_REWRITE_CATALOG_ENTRY]
			-- Rewrite rules for URI references
	
	system_suffix_rules: DS_LINKED_LIST [XM_SUFFIX_CATALOG_ENTRY]
			-- Suffix rules for SYSTEM identifiers
	
	uri_suffix_rules: DS_LINKED_LIST [XM_SUFFIX_CATALOG_ENTRY]
			-- Suffix rules for URI references
	
	public_entries: DS_HASH_TABLE [XM_PUBLIC_CATALOG_ENTRY, STRING]
			-- Map of `public' entries

	system_entries: DS_HASH_TABLE [XM_CATALOG_ENTRY, STRING]
			-- Map of `system' entries

	uri_entries: DS_HASH_TABLE [XM_CATALOG_ENTRY, STRING]
			-- Map of `uri' entries

	prefer_public_entries: DS_HASH_TABLE [XM_PUBLIC_CATALOG_ENTRY, STRING]
			-- Map of `public' entries which have `prefer_public' set to `True';
			-- This will only have an entry for a given key if `public_entries'
			--  also has an entry for the same key, with `prefer_public' set to `False'.

	read is
			-- Read in catalog file, changing internals accordingly.
		do
			is_error := False
			parser.parse_from_system (system_id)
		end

	set_catalog_attributes (is_document_element: BOOLEAN) is
			-- Set `base_uri' and `prefer_public' at catalog or group level.
		require
			current_element_is_catalog_or_group: STRING_.same_string (current_element_name, Catalog_entry)
				or else STRING_.same_string (current_element_name, Group_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri: STRING
		do
			if not is_document_element then
				group_prefer_public := prefer_public
				group_base := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					if is_document_element then
						create base_uri.make (attribute_values.item (a_cursor.index))
						shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
					else
						create group_base.make (attribute_values.item (a_cursor.index))
					end
				elseif STRING_.same_string (a_local_part, Prefer_attribute) and then a_namespace_uri = Void then
					if STRING_.same_string (attribute_values.item (a_cursor.index), System_entry) then
						if is_document_element then
							prefer_public := False
						else
							group_prefer_public := False
						end
					elseif STRING_.same_string (attribute_values.item (a_cursor.index), Public_entry) then
						if is_document_element then
							prefer_public := True
						else
							group_prefer_public := True
						end
					else
						shared_catalog_manager.debug_message (1, "Invalid prefer: must be 'system' or 'public'", attribute_values.item (a_cursor.index))
						is_error := True
					end
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri = Void then
					-- OK
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition", a_local_part)
				end
				a_cursor.forth
			end
		end

	add_system_entry is
			-- Add a `system' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_system: STRING_.same_string (current_element_name, System_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_system_id, a_target_uri: STRING
			a_system_entry: XM_CATALOG_ENTRY
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, System_id_attribute) and then a_namespace_uri.count = 0 then
					a_system_id := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, Uri_attribute) and then a_namespace_uri.count = 0 then
					a_target_uri := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'system'", system_id)
				end
				a_cursor.forth
			end
			if a_system_id = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'systemId' attribute from 'system'", system_id)
			else
				a_system_id := escape_custom (utf8.to_utf8 (a_system_id), shared_catalog_manager.unescaped_uri_characters, False)
			end
			if a_target_uri = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'uri' attribute from 'system'", system_id)
			else
				a_target_uri := escape_custom (utf8.to_utf8 (a_target_uri), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_target_uri)
				if a_target.has_fragment then
					is_error := True
					shared_catalog_manager.debug_message (1, "Fragment identifier present in  'uri' attribute from 'system'", system_id)
				end
			end
			if not is_error then
				if not system_entries.has (a_system_id) then -- only the first eligible entry encountered is checked
					create a_system_entry.make (a_target)
					system_entries.force (a_system_entry, a_system_id)
					shared_catalog_manager.debug_message (4, "System URI added is", a_system_id)
				else
					shared_catalog_manager.debug_message (6, "System URI is a duplicate", a_system_id)
				end
			end
		end

	add_uri_entry is
			-- Add a `uri' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_uri: STRING_.same_string (current_element_name, Uri_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_uri, a_target_uri: STRING
			a_uri_entry: XM_CATALOG_ENTRY
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Name_attribute) and then a_namespace_uri.count = 0 then
					a_uri := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, Uri_attribute) and then a_namespace_uri.count = 0 then
					a_target_uri := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'uri'", system_id)
				end
				a_cursor.forth
			end
			if a_uri = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'name' attribute from 'uri'", system_id)
			else
				a_uri := escape_custom (utf8.to_utf8 (a_uri), shared_catalog_manager.unescaped_uri_characters, False)
			end
			if a_target_uri = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'uri' attribute from 'uri'", system_id)
			else
				a_target_uri := escape_custom (utf8.to_utf8 (a_target_uri), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_target_uri)
			end
			if not is_error then
				if not uri_entries.has (a_uri) then -- only the first eligible entry encountered is checked
					create a_uri_entry.make (a_target)
					uri_entries.force (a_uri_entry, a_uri)
					shared_catalog_manager.debug_message (4, "URI added is", a_uri)
				else
					shared_catalog_manager.debug_message (6, "URI is a duplicate", a_uri)
				end
			end
		end

	add_public_entry is
			-- Add a `public' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_public: STRING_.same_string (current_element_name, Public_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_public_id, a_target_uri: STRING
			a_public_entry: XM_PUBLIC_CATALOG_ENTRY
			a_prefer_public: BOOLEAN
		do
			if group_depth = 1 then
				a_base_uri := group_base
				a_prefer_public := group_prefer_public
			else
				a_base_uri := base_uri
				a_prefer_public := prefer_public
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Public_id_attribute) and then a_namespace_uri.count = 0 then
					a_public_id := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, Uri_attribute) and then a_namespace_uri.count = 0 then
					a_target_uri := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'public'", system_id)
				end
				a_cursor.forth
			end
			if a_public_id = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'publicId' attribute from 'public'", system_id)
			else
				a_public_id := normalized_fpi (a_public_id)
			end
			if a_target_uri = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'uri' attribute from 'public'", system_id)
			else
				a_target_uri := escape_custom (utf8.to_utf8 (a_target_uri), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_target_uri)
				if a_target.has_fragment then
					is_error := True
					shared_catalog_manager.debug_message (1, "Fragment identifier present in  'uri' attribute from 'public'", system_id)
				end
			end
			if not is_error then
				if not public_entries.has (a_public_id) then -- only the first eligible entry encountered is checked
					create a_public_entry.make (a_target, a_prefer_public)
					public_entries.force (a_public_entry, a_public_id)
					shared_catalog_manager.debug_message (4, "Public URI added is", a_public_id)
				elseif a_prefer_public then

					-- If `public_entries' contains an entry, but it is for prefer="system" only,
					--  then we need another entry for when no fsi is presented.
					
					a_public_entry := public_entries.item (a_public_id)
					if not a_public_entry.prefer_public and then not prefer_public_entries.has (a_public_id) then
						create a_public_entry.make (a_target, True)
						prefer_public_entries.force (a_public_entry, a_public_id)
						shared_catalog_manager.debug_message (4, "Public URI added is", a_public_id)
					else
						shared_catalog_manager.debug_message (6, "Public URI is a duplicate", a_public_id)
					end
				else
					shared_catalog_manager.debug_message (6, "Public URI is a duplicate", a_public_id)
				end
			end
		end

	add_next_catalog is
			-- Add a `nextCatalog' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_next_catalog: STRING_.same_string (current_element_name, Next_catalog_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_catalog_name: STRING
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Catalog_attribute) and then a_namespace_uri.count = 0 then
					a_catalog_name := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'nextCatalog'", system_id)
				end
				a_cursor.forth
			end
			if a_catalog_name = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'catalog' attribute from 'nextCatalog'", system_id)
			else
				create a_target.make_resolve (a_base_uri, a_catalog_name)
			end
			if not is_error then
				local_catalog_files.force_last (a_target.full_reference)
				shared_catalog_manager.debug_message (4, "Next catalog URI added is", a_target.full_reference)
			end
		end

	add_rewrite_rule (is_system_rule: BOOLEAN) is
			-- Add a `rewriteSystem' or `rewriteURI' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_rewrite_system: is_system_rule implies STRING_.same_string (current_element_name, Rewrite_system_entry)
			current_element_is_rewrite_uri: not is_system_rule implies STRING_.same_string (current_element_name, Rewrite_uri_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_rewrite_prefix, a_start_string, a_message: STRING
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)					
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Rewrite_prefix_attribute) and then a_namespace_uri.count = 0 then
					a_rewrite_prefix := attribute_values.item (a_cursor.index)
				elseif is_system_rule and then STRING_.same_string (a_local_part, System_id_start_string_attribute) and then a_namespace_uri.count = 0 then
					a_start_string := attribute_values.item (a_cursor.index)
				elseif not is_system_rule and then STRING_.same_string (a_local_part, Uri_start_string_attribute) and then a_namespace_uri.count = 0 then
					a_start_string := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					a_message := "Reserved attribute in the per-element-partition of '"
					if is_system_rule then
						a_message := STRING_.concat (a_message, Rewrite_system_entry)
					else
						a_message := STRING_.concat (a_message, Rewrite_uri_entry)
					end
					shared_catalog_manager.debug_message (2, STRING_.appended_string (a_message, "'"), system_id)
				end
				a_cursor.forth
			end
			if a_rewrite_prefix = Void then
				is_error := True; write_missing_rewrite_prefix_attribute (is_system_rule)
			elseif a_start_string = Void then
				is_error := True; write_missing_start_string_attribute (is_system_rule)
			else
				a_start_string := escape_custom (utf8.to_utf8 (a_start_string), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_rewrite_prefix)
				write_rewrite_rule_debug_message (a_start_string, a_target, is_system_rule)
			end
			if not is_error then
				if is_system_rule then
					insert_system_rewrite_rule (a_start_string, a_target)
				else
					insert_uri_rewrite_rule (a_start_string, a_target)
				end
			end
		end

	add_suffix (is_system_rule: BOOLEAN) is
			-- Add a `systemSuffix' or `uriSuffix' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_system_suffix: is_system_rule implies STRING_.same_string (current_element_name, System_suffix_entry)
			current_element_is_uri_suffix: not is_system_rule implies STRING_.same_string (current_element_name, Uri_suffix_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_suffix_string, a_uri_reference, a_message: STRING
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)					
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Uri_attribute) and then a_namespace_uri.count = 0 then
					a_uri_reference := attribute_values.item (a_cursor.index)
				elseif is_system_rule and then STRING_.same_string (a_local_part, System_id_suffix_attribute) and then a_namespace_uri.count = 0 then
					a_suffix_string := attribute_values.item (a_cursor.index)
				elseif not is_system_rule and then STRING_.same_string (a_local_part, Uri_suffix_attribute) and then a_namespace_uri.count = 0 then
					a_suffix_string := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					a_message := "Reserved attribute in the per-element-partition of '"
					if is_system_rule then
						a_message := STRING_.concat (a_message, System_suffix_entry)
					else
						a_message := STRING_.concat (a_message, Uri_suffix_entry)
					end
					shared_catalog_manager.debug_message (2, STRING_.appended_string (a_message, "'"), system_id)
				end
				a_cursor.forth
			end
			if a_uri_reference = Void then
				is_error := True; write_missing_suffix_reference_attribute (is_system_rule)
			elseif a_suffix_string = Void then
				is_error := True; write_missing_suffix_string_attribute (is_system_rule)
			else
				a_suffix_string := escape_custom (utf8.to_utf8 (a_suffix_string), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_uri_reference)
				write_suffix_debug_message (a_suffix_string, a_target, is_system_rule)
			end
			if not is_error then
				if is_system_rule then
					insert_system_suffix_rule (a_suffix_string, a_target)
				else
					insert_uri_suffix_rule (a_suffix_string, a_target)
				end
			end
		end

	add_system_delegate is
			-- Add a `delegateSystem' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_system_delegate: STRING_.same_string (current_element_name, Delegate_system_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_catalog_name, a_start_string: STRING
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Catalog_attribute) and then a_namespace_uri.count = 0 then
					a_catalog_name := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, System_id_start_string_attribute) and then a_namespace_uri.count = 0 then
					a_start_string := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'delagateSystem'", system_id)
				end
				a_cursor.forth
			end
			if a_catalog_name = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'catalog' attribute from 'delegateSystem'", system_id)
			elseif a_start_string = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'systemIdStartString' attribute from 'delegateSystem'", system_id)
			else
				a_start_string := escape_custom (utf8.to_utf8 (a_start_string), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_catalog_name)
				shared_catalog_manager.debug_message (5, "Catalog name from 'delegateSystem'", a_catalog_name)
			end
			if not is_error then
				insert_system_delegate (a_start_string, a_target)
			end
		end

	add_uri_delegate is
			-- Add a `delegateUri' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_uri_delegate: STRING_.same_string (current_element_name, Delegate_uri_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_catalog_name, a_start_string: STRING
		do
			if group_depth = 1 then
				a_base_uri := group_base
			else
				a_base_uri := base_uri
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, "id") and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Catalog_attribute) and then a_namespace_uri.count = 0 then
					a_catalog_name := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, Uri_start_string_attribute) and then a_namespace_uri.count = 0 then
					a_start_string := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'delagateUri'", system_id)
				end
				a_cursor.forth
			end
			if a_catalog_name = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'catalog' attribute from 'delegateSystem'", system_id)
			elseif a_start_string = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'uriStartString' attribute from 'delegateSystem'", system_id)
			else
				a_start_string := escape_custom (utf8.to_utf8 (a_start_string), shared_catalog_manager.unescaped_uri_characters, False)
				create a_target.make_resolve (a_base_uri, a_catalog_name)
				shared_catalog_manager.debug_message (5, "Catalog name from 'delegateSystem'", a_catalog_name)
			end
			if not is_error then
				insert_uri_delegate (a_start_string, a_target)
			end
		end

	add_public_delegate is
			-- Add a `delegatePublic' entry.
		require
			within_catalog_or_group: in_catalog and then (group_depth = 0 or else group_depth = 1)
			current_element_is_public_delegate: STRING_.same_string (current_element_name, Delegate_public_entry)
			attributes_available: attribute_namespaces /= Void
		local
			a_base_uri, a_target: UT_URI
			a_cursor: DS_ARRAYED_LIST_CURSOR [STRING]
			a_local_part, a_namespace_uri, a_catalog_name, a_start_string: STRING
			a_prefer_public: BOOLEAN
		do
			if group_depth = 1 then
				a_base_uri := group_base
				a_prefer_public := group_prefer_public
			else
				a_base_uri := base_uri
				a_prefer_public := prefer_public
			end
			from
				a_cursor := attribute_local_parts.new_cursor; a_cursor.start
			variant
				attribute_local_parts.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_local_part := a_cursor.item
				a_namespace_uri := attribute_namespaces.item (a_cursor.index)
				if STRING_.same_string (a_local_part, Base_attribute) and then
					STRING_.same_string (a_namespace_uri, xml_namespace) then
					create a_base_uri.make (attribute_values.item (a_cursor.index))
					shared_catalog_manager.debug_message (5, "xml:base set to", base_uri.full_reference)
				elseif STRING_.same_string (a_local_part, Id_attribute) and then a_namespace_uri.count = 0 then
					-- OK
				elseif STRING_.same_string (a_local_part, Catalog_attribute) and then a_namespace_uri.count = 0 then
					a_catalog_name := attribute_values.item (a_cursor.index)
				elseif STRING_.same_string (a_local_part, Public_id_start_string_attribute) and then a_namespace_uri.count = 0 then
					a_start_string := attribute_values.item (a_cursor.index)
				elseif a_namespace_uri = Void then
					shared_catalog_manager.debug_message (2, "Reserved attribute in the per-element-partition of 'delegateSystem'", system_id)
				end
				a_cursor.forth
			end
			if a_catalog_name = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'catalog' attribute from 'delegatePublic'", system_id)
			elseif a_start_string = Void then
				is_error := True
				shared_catalog_manager.debug_message (1, "Missing 'publicIdStartString' attribute from 'delegatePublic'", system_id)
			else
				a_start_string := normalized_fpi (a_start_string)
				create a_target.make_resolve (a_base_uri, a_catalog_name)
				shared_catalog_manager.debug_message (5, "Catalog name from 'delegatePublic'", a_catalog_name)
			end
			if not is_error then
				insert_public_delegate (a_start_string, a_target, a_prefer_public)
			end
		end

	insert_system_delegate (a_start_string: STRING; a_target: UT_URI) is
			-- Insert a system delegate entry.
		require
			system_id_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_system_delegate, an_existing_delegate: XM_DELEGATE_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_DELEGATE_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if system_delegates.count = 0 then
				create a_system_delegate.make (a_start_string, a_target)
				system_delegates.put_first (a_system_delegate)
				shared_catalog_manager.debug_message (4, "System delegation catalog URI added is", a_target.full_reference)
			else
				from
					a_count := a_start_string.count
					a_cursor := system_delegates.new_cursor; a_cursor.start
				variant
					system_delegates.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_delegate := a_cursor.item
					if STRING_.same_string (an_existing_delegate.start_string, a_start_string) then
						shared_catalog_manager.debug_message (6, "System delegation catalog is a duplicate for systemIdStartString", an_existing_delegate.start_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_delegate.count then
						create a_system_delegate.make (a_start_string, a_target)
						a_cursor.force_left (a_system_delegate)
						shared_catalog_manager.debug_message (4, "System delegation catalog URI added is", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "System delegation prefix string is", a_start_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_system_delegate.make (a_start_string, a_target)
							system_delegates.put_last (a_system_delegate)
							shared_catalog_manager.debug_message (4, "System delegation catalog URI added is", a_target.full_reference)
						end
					end
				end
			end
		end

	insert_uri_delegate (a_start_string: STRING; a_target: UT_URI) is
			-- Insert a uri delegate entry.
		require
			uri_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_uri_delegate, an_existing_delegate: XM_DELEGATE_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_DELEGATE_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if uri_delegates.count = 0 then
				create a_uri_delegate.make (a_start_string, a_target)
				uri_delegates.put_first (a_uri_delegate)
				shared_catalog_manager.debug_message (4, "Uri delegation catalog URI added is", a_target.full_reference)
			else
				from
					a_count := a_start_string.count
					a_cursor := uri_delegates.new_cursor; a_cursor.start
				variant
					uri_delegates.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_delegate := a_cursor.item
					if STRING_.same_string (an_existing_delegate.start_string, a_start_string) then
						shared_catalog_manager.debug_message (6, "Uri delegation catalog is a duplicate for uriStartString", an_existing_delegate.start_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_delegate.count then
						create a_uri_delegate.make (a_start_string, a_target)
						a_cursor.force_left (a_uri_delegate)
						shared_catalog_manager.debug_message (4, "Uri delegation catalog URI added is", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "Uri delegation prefix string is", a_start_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_uri_delegate.make (a_start_string, a_target)
							uri_delegates.put_last (a_uri_delegate)
							shared_catalog_manager.debug_message (4, "Uri delegation catalog URI added is", a_target.full_reference)
						end
					end
				end
			end
		end

	insert_public_delegate (a_start_string: STRING; a_target: UT_URI; a_prefer_public: BOOLEAN) is
			-- Insert a public delegate entry.
		require
			public_id_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_public_delegate, an_existing_delegate: XM_PUBLIC_DELEGATE_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_PUBLIC_DELEGATE_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if public_delegates.count = 0 then
				create a_public_delegate.make (a_start_string, a_target, a_prefer_public)
				public_delegates.put_first (a_public_delegate)
				shared_catalog_manager.debug_message (4, "Public delegation catalog URI added is", a_target.full_reference)
			else
				from
					a_count := a_start_string.count
					a_cursor := public_delegates.new_cursor; a_cursor.start
				variant
					public_delegates.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_delegate := a_cursor.item
					if STRING_.same_string (an_existing_delegate.start_string, a_start_string) then
						if not an_existing_delegate.prefer_public = a_prefer_public then
							create a_public_delegate.make (a_start_string, a_target, a_prefer_public)
							if a_prefer_public then
								a_cursor.put_right (a_public_delegate)
								shared_catalog_manager.debug_message (4, "Public delegation catalog URI added is", a_target.full_reference)
								shared_catalog_manager.debug_message (10, "Public delegation prefix string is", a_start_string)
							else
								a_cursor.put_left (a_public_delegate)
								shared_catalog_manager.debug_message (4, "Public delegation catalog URI added is", a_target.full_reference)
								shared_catalog_manager.debug_message (10, "Public delegation prefix string is", a_start_string)
							end
						else
							shared_catalog_manager.debug_message (6, "Public delegation catalog is a duplicate for publicIdStartString", an_existing_delegate.start_string)
						end
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_delegate.count then
						create a_public_delegate.make (a_start_string, a_target, a_prefer_public)
						a_cursor.force_left (a_public_delegate)
						shared_catalog_manager.debug_message (4, "Public delegation catalog URI added is", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "Public delegation prefix string is", a_start_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_public_delegate.make (a_start_string, a_target, a_prefer_public)
							public_delegates.put_last (a_public_delegate)
							shared_catalog_manager.debug_message (4, "Public delegation catalog URI added is", a_target.full_reference)
						end
					end
				end
			end
		end

	insert_system_rewrite_rule (a_start_string: STRING; a_target: UT_URI) is
			-- Insert a rewrite sytem entry.
		require
			system_id_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_rewrite_rule, an_existing_rewrite_rule: XM_REWRITE_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_REWRITE_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if system_rewrite_rules.count = 0 then
				create a_rewrite_rule.make (a_start_string, a_target)
				system_rewrite_rules.put_first (a_rewrite_rule)
				shared_catalog_manager.debug_message (4, "System rewrite rule added towards", a_target.full_reference)
			else
				from
					a_count := a_start_string.count
					a_cursor := system_rewrite_rules.new_cursor; a_cursor.start
				variant
					system_rewrite_rules.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_rewrite_rule := a_cursor.item
					if STRING_.same_string (an_existing_rewrite_rule.start_string, a_start_string) then
						shared_catalog_manager.debug_message (6, "System rewrite rule is a duplicate for systemIdStartString", a_start_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_rewrite_rule.count then
						create a_rewrite_rule.make (a_start_string, a_target)
						a_cursor.force_left (a_rewrite_rule)
						shared_catalog_manager.debug_message (4, "System rewrite rule added targetted on", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "System rewrite prefix string is", a_start_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_rewrite_rule.make (a_start_string, a_target)
							system_rewrite_rules.put_last (a_rewrite_rule)
							shared_catalog_manager.debug_message (4, "System rewrite rule added towards", a_target.full_reference)
						end
					end
				end
			end
		end

	insert_uri_rewrite_rule (a_start_string: STRING; a_target: UT_URI) is
			-- Insert a rewrite sytem entry.
		require
			uri_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_rewrite_rule, an_existing_rewrite_rule: XM_REWRITE_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_REWRITE_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if uri_rewrite_rules.count = 0 then
				create a_rewrite_rule.make (a_start_string, a_target)
				uri_rewrite_rules.put_first (a_rewrite_rule)
				shared_catalog_manager.debug_message (4, "Uri rewrite rule added towards", a_target.full_reference)
			else
				from
					a_count := a_start_string.count
					a_cursor := uri_rewrite_rules.new_cursor; a_cursor.start
				variant
					uri_rewrite_rules.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_rewrite_rule := a_cursor.item
					if STRING_.same_string (an_existing_rewrite_rule.start_string, a_start_string) then
						shared_catalog_manager.debug_message (6, "Uri rewrite rule is a duplicate for uriStartString", a_start_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_rewrite_rule.count then
						create a_rewrite_rule.make (a_start_string, a_target)
						a_cursor.force_left (a_rewrite_rule)
						shared_catalog_manager.debug_message (4, "Uri rewrite rule added targetted on", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "Uri rewrite prefix string is", a_start_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_rewrite_rule.make (a_start_string, a_target)
							uri_rewrite_rules.put_last (a_rewrite_rule)
							shared_catalog_manager.debug_message (4, "Uri rewrite rule added towards", a_target.full_reference)
						end
					end
				end
			end
		end

	insert_system_suffix_rule (a_suffix_string: STRING; a_target: UT_URI) is
			-- Insert a system suffix entry.
		require
			system_suffix_string_not_void: a_suffix_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_suffix_rule, an_existing_suffix_rule: XM_SUFFIX_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_SUFFIX_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if system_suffix_rules.count = 0 then
				create a_suffix_rule.make (a_suffix_string, a_target)
				system_suffix_rules.put_first (a_suffix_rule)
				shared_catalog_manager.debug_message (4, "System suffix rule added towards", a_target.full_reference)
			else
				from
					a_count := a_suffix_string.count
					a_cursor := system_suffix_rules.new_cursor; a_cursor.start
				variant
					system_suffix_rules.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_suffix_rule := a_cursor.item
					if STRING_.same_string (an_existing_suffix_rule.suffix_string, a_suffix_string) then
						shared_catalog_manager.debug_message (6, "System suffix rule is a duplicate for systemIdSuffix", a_suffix_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_suffix_rule.count then
						create a_suffix_rule.make (a_suffix_string, a_target)
						a_cursor.force_left (a_suffix_rule)
						shared_catalog_manager.debug_message (4, "System suffix rule added targetted on", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "System suffix string is", a_suffix_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_suffix_rule.make (a_suffix_string, a_target)
							system_suffix_rules.put_last (a_suffix_rule)
							shared_catalog_manager.debug_message (4, "System suffix rule added towards", a_target.full_reference)
						end
					end
				end
			end
		end


	insert_uri_suffix_rule (a_suffix_string: STRING; a_target: UT_URI) is
			-- Insert a URI  suffix entry.
		require
			system_suffix_string_not_void: a_suffix_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_suffix_rule, an_existing_suffix_rule: XM_SUFFIX_CATALOG_ENTRY
			a_cursor: DS_LINKED_LIST_CURSOR [XM_SUFFIX_CATALOG_ENTRY]
			a_count: INTEGER
		do
			if uri_suffix_rules.count = 0 then
				create a_suffix_rule.make (a_suffix_string, a_target)
				uri_suffix_rules.put_first (a_suffix_rule)
				shared_catalog_manager.debug_message (4, "URI suffix rule added towards", a_target.full_reference)
			else
				from
					a_count := a_suffix_string.count
					a_cursor := uri_suffix_rules.new_cursor; a_cursor.start
				variant
					uri_suffix_rules.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_existing_suffix_rule := a_cursor.item
					if STRING_.same_string (an_existing_suffix_rule.suffix_string, a_suffix_string) then
						shared_catalog_manager.debug_message (6, "URI suffix rule is a duplicate for systemIdSuffix", a_suffix_string)
						a_cursor.go_after -- duplicate entry
					elseif a_count > an_existing_suffix_rule.count then
						create a_suffix_rule.make (a_suffix_string, a_target)
						a_cursor.force_left (a_suffix_rule)
						shared_catalog_manager.debug_message (4, "URI suffix rule added targetted on", a_target.full_reference)
						shared_catalog_manager.debug_message (10, "URI suffix string is", a_suffix_string)
						a_cursor.go_after
					else
						a_cursor.forth
						if a_cursor.after then
							create a_suffix_rule.make (a_suffix_string, a_target)
							uri_suffix_rules.put_last (a_suffix_rule)
							shared_catalog_manager.debug_message (4, "URI suffix rule added towards", a_target.full_reference)
						end
					end
				end
			end
		end

	resolved_suffixed_fsi (a_system_id: STRING): STRING is
			-- Resolved URI for `a_system_id' from suffix rules
		require
			system_id_not_void: a_system_id /= Void -- TODO and then is normalized
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_SUFFIX_CATALOG_ENTRY]
			a_suffix_rule: XM_SUFFIX_CATALOG_ENTRY
		do
			from
				a_cursor := system_suffix_rules.new_cursor; a_cursor.start
			variant
				system_suffix_rules.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_suffix_rule := a_cursor.item
				shared_catalog_manager.debug_message (9, "Next suffix rule matches", a_suffix_rule.suffix_string)
				if a_system_id.count >= a_suffix_rule.count and then
					STRING_.same_string (a_system_id.substring (a_system_id.count - a_suffix_rule.count + 1, a_system_id.count), a_suffix_rule.suffix_string) then
					Result :=  (a_suffix_rule.target)
					shared_catalog_manager.debug_message (5, "Suffix rule provisionally resolved to", Result)
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

	resolved_suffixed_uri (a_uri: STRING): STRING is
			-- Resolved URI for `a_uri' from suffix rules
		require
			uri_reference_not_void: a_uri /= Void -- TODO and then is normalized
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_SUFFIX_CATALOG_ENTRY]
			a_suffix_rule: XM_SUFFIX_CATALOG_ENTRY
		do
			from
				a_cursor := uri_suffix_rules.new_cursor; a_cursor.start
			variant
				uri_suffix_rules.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_suffix_rule := a_cursor.item
				shared_catalog_manager.debug_message (9, "Next suffix rule matches", a_suffix_rule.suffix_string)
				if a_uri.count >= a_suffix_rule.count and then
					STRING_.same_string (a_uri.substring (a_uri.count - a_suffix_rule.count + 1, a_uri.count), a_suffix_rule.suffix_string) then
					Result :=  (a_suffix_rule.target)
					shared_catalog_manager.debug_message (5, "Suffix rule provisionally resolved to", Result)
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

	resolved_delegated_fsi (a_system_id: STRING): STRING is
			-- Resolved URI for `a_system_id' from delegate catalogs
		require
			system_id_not_void: a_system_id /= Void -- TODO and then is normalized
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_DELEGATE_CATALOG_ENTRY]
			a_delegate: XM_DELEGATE_CATALOG_ENTRY
			a_catalog: XM_CATALOG
		do
			shared_catalog_manager.debug_message (8, "Number of system delegate catalogs is", system_delegates.count.out)
			from
				a_cursor := system_delegates.new_cursor; a_cursor.start
			variant
				system_delegates.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_delegate := a_cursor.item
				shared_catalog_manager.debug_message (9, "Examining system delegation with systemIdStartString", a_delegate.start_string)
				if a_system_id.substring_index (a_delegate.start_string, 1) = 1 then
					shared_catalog_manager.debug_message (10, "Candidate match for systemIdStartString against", a_system_id)
					shared_catalog_manager.set_search_chain_truncated
					delegated := True
					a_catalog := shared_catalog_manager.retrieved_catalog (a_delegate.target)
					if a_catalog /= Void then
						Result := a_catalog.resolved_fsi (a_system_id)
					end
					if Result = Void then
						shared_catalog_manager.debug_message (9, "No delegated match found for", a_system_id)
						a_cursor.forth
					else
						shared_catalog_manager.debug_message (9, "Delegated match found for", a_system_id)
						a_cursor.go_after
					end
				else
					a_cursor.forth
				end
			end
		end

	resolved_delegated_uri (a_uri_reference: STRING): STRING is
			-- Resolved URI for `a_uri_reference' from delegate catalogs
		require
			uri_id_not_void: a_uri_reference /= Void -- TODO and then is normalized
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_DELEGATE_CATALOG_ENTRY]
			a_delegate: XM_DELEGATE_CATALOG_ENTRY
			a_catalog: XM_CATALOG
		do
			shared_catalog_manager.debug_message (8, "Number of uri delegate catalogs is", uri_delegates.count.out)
			from
				a_cursor := uri_delegates.new_cursor; a_cursor.start
			variant
				uri_delegates.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_delegate := a_cursor.item
				shared_catalog_manager.debug_message (9, "Examining uri delegation with uriStartString", a_delegate.start_string)
				if a_uri_reference.substring_index (a_delegate.start_string, 1) = 1 then
					shared_catalog_manager.debug_message (10, "Candidate match for uriStartString against", a_uri_reference)
					shared_catalog_manager.set_search_chain_truncated
					delegated := True
					a_catalog := shared_catalog_manager.retrieved_catalog (a_delegate.target)
					if a_catalog /= Void then
						Result := a_catalog.resolved_fsi (a_uri_reference)
					end
					if Result = Void then
						shared_catalog_manager.debug_message (9, "No delegated match found for", a_uri_reference)
						a_cursor.forth
					else
						shared_catalog_manager.debug_message (9, "Delegated match found for", a_uri_reference)
						a_cursor.go_after
					end
				else
					a_cursor.forth
				end
			end
		end

	resolved_delegated_fpi (a_public_id: STRING; prefer_public_required: BOOLEAN): STRING is
			-- Resolved URI for `a_public_id' from delegate catalogs
		require
			public_id_not_void: a_public_id /= Void -- TODO and then is normalized
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_PUBLIC_DELEGATE_CATALOG_ENTRY]
			a_delegate: XM_PUBLIC_DELEGATE_CATALOG_ENTRY
			a_catalog: XM_CATALOG
		do
			shared_catalog_manager.debug_message (8, "Number of public delegate catalogs is", public_delegates.count.out)
			from
				a_cursor := public_delegates.new_cursor; a_cursor.start
			variant
				public_delegates.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_delegate := a_cursor.item
				shared_catalog_manager.debug_message (9, "Examining public delegation with publicIdStartString", a_delegate.start_string)
				if a_public_id.substring_index (a_delegate.start_string, 1) = 1 then
					shared_catalog_manager.debug_message (10, "Candidate match for publicIdStartString against", a_public_id)
					if not prefer_public_required or else a_delegate.prefer_public then
						shared_catalog_manager.debug_message (10, "Match for publicIdStartString against", a_public_id)
						shared_catalog_manager.set_search_chain_truncated
						delegated := True
						a_catalog := shared_catalog_manager.retrieved_catalog (a_delegate.target)
						if a_catalog /= Void then
							Result := a_catalog.resolved_fpi (a_public_id, prefer_public_required)
						end
						if Result = Void then
							shared_catalog_manager.debug_message (9, "No delegated match found for", a_public_id)
							a_cursor.forth
						else
							shared_catalog_manager.debug_message (9, "Delegated match found for", a_public_id)
							a_cursor.go_after
						end
					end
				else
					a_cursor.forth
				end
			end
		end

	write_missing_rewrite_prefix_attribute (is_system_rule: BOOLEAN) is
			-- Write a missing-rewrite-prefix error
		local
			a_message: STRING
		do
			a_message := STRING_.concat ("Missing '", Rewrite_prefix_attribute)
			a_message := STRING_.appended_string (a_message, "' attribute from '")
			if is_system_rule then
				a_message := STRING_.appended_string (a_message, Rewrite_system_entry)
			else
				a_message := STRING_.appended_string (a_message, Rewrite_uri_entry)
			end
			shared_catalog_manager.debug_message (1, STRING_.appended_string (a_message, "'"), system_id)
		end
	
	write_missing_start_string_attribute (is_system_rule: BOOLEAN) is
			-- Write a missing-start-string error
		local
			a_message: STRING
		do
			if is_system_rule then
				a_message := STRING_.concat ("Missing '", System_id_start_string_attribute)
			else
				a_message := STRING_.concat ("Missing '", Uri_start_string_attribute)
			end
			a_message := STRING_.appended_string (a_message, "' attribute from '")
			if is_system_rule then
				a_message := STRING_.appended_string (a_message, Rewrite_system_entry)
			else
				a_message := STRING_.appended_string (a_message, Rewrite_uri_entry)
			end
			a_message := STRING_.appended_string (a_message, "'")
			shared_catalog_manager.debug_message (1, a_message, system_id)
		end

	write_rewrite_rule_debug_message (a_start_string: STRING; a_target: UT_URI; is_system_rule: BOOLEAN) is
			-- Write debug messages for adding rewrite rule.
		require
			system_id_start_string_not_void: a_start_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_message: STRING
		do
			a_message := "Rewrite prefix from '"
			if is_system_rule then
				a_message := STRING_.concat (a_message, Rewrite_system_entry)
			else
				a_message := STRING_.concat (a_message, Rewrite_uri_entry) 
			end
			a_message := STRING_.appended_string (a_message, "'")
			shared_catalog_manager.debug_message (5, a_message, a_target.full_reference)
			if is_system_rule then
				a_message := STRING_.concat ("SystemIdStartString from '", Rewrite_system_entry)
			else
				a_message := STRING_.concat ("UriStartString from '", Rewrite_uri_entry)
			end
			shared_catalog_manager.debug_message (5, a_message, a_start_string)
		end

	write_missing_suffix_reference_attribute (is_system_rule: BOOLEAN) is
			-- Write a missing-suffix-uri error
		local
			a_message: STRING
		do
			a_message := STRING_.concat ("Missing '", Uri_attribute)
			a_message := STRING_.appended_string (a_message, "' attribute from '")
			if is_system_rule then
				a_message := STRING_.appended_string (a_message, System_suffix_entry)
			else
				a_message := STRING_.appended_string (a_message, Uri_suffix_entry)
			end
			shared_catalog_manager.debug_message (1, STRING_.appended_string (a_message, "'"), system_id)
		end
			
	write_missing_suffix_string_attribute (is_system_rule: BOOLEAN) is
			-- Write a missing-suffix-string error
		local
			a_message: STRING
		do
			if is_system_rule then
				a_message := STRING_.concat ("Missing '", System_id_suffix_attribute)
			else
				a_message := STRING_.concat ("Missing '", Uri_suffix_attribute)
			end
			a_message := STRING_.appended_string (a_message, "' attribute from '")
			if is_system_rule then
				a_message := STRING_.appended_string (a_message, System_suffix_entry)
			else
				a_message := STRING_.appended_string (a_message, Uri_suffix_entry)
			end
			shared_catalog_manager.debug_message (1, STRING_.appended_string (a_message, "'"), system_id)
		end

	
	write_suffix_debug_message (a_suffix_string: STRING; a_target: UT_URI; is_system_rule: BOOLEAN) is
			-- Write debug messages for adding suffix rule.
		require
			suffix_string_not_void: a_suffix_string /= Void
			target_uri_not_void: a_target /= Void
		local
			a_message: STRING
		do
			a_message := "Rewrite suffix from '"
			if is_system_rule then
				a_message := STRING_.concat (a_message, System_suffix_entry)
			else
				a_message := STRING_.concat (a_message, Uri_suffix_entry) 
			end
			a_message := STRING_.appended_string (a_message, "'")
			shared_catalog_manager.debug_message (5, a_message, a_target.full_reference)
			if is_system_rule then
				a_message := STRING_.concat ("SystemIdSuffix from '", System_suffix_entry)
			else
				a_message := STRING_.concat ("UriSuffix from '", Uri_suffix_entry)
			end
			shared_catalog_manager.debug_message (5, a_message, a_suffix_string)
		end

	-- Element and attribute names follow:

	Catalog_entry, Catalog_attribute: STRING is "catalog"
	Group_entry: STRING is "group"
	System_entry: STRING is "system"
	Public_entry: STRING is "public"
	Uri_entry, Uri_attribute: STRING is "uri"
	Uri_suffix_entry, Uri_suffix_attribute: STRING is "uriSuffix"
	System_suffix_entry: STRING is "systemSuffix"
	System_id_suffix_attribute: STRING is "systemIdSuffix"
	Rewrite_prefix_attribute: STRING is "rewritePrefix"
	Rewrite_system_entry: STRING is "rewriteSystem"
	Rewrite_uri_entry: STRING is "rewriteURI"
	System_id_start_string_attribute: STRING is "systemIdStartString"
	Uri_start_string_attribute: STRING is "uriStartString"
	Public_id_start_string_attribute: STRING is "publicIdStartString"
	Delegate_system_entry: STRING is "delegateSystem"
	Delegate_uri_entry: STRING is "delegateUri"
	Delegate_public_entry: STRING is "delegatePublic"
	Next_catalog_entry: STRING is "nextCatalog"
	Base_attribute: STRING is "base"
	Prefer_attribute: STRING is "prefer"
	Id_attribute: STRING is "id"
	System_id_attribute: STRING is "systemId"
	Public_id_attribute: STRING is "publicId"
	Name_attribute: STRING is "name"

invariant

	local_catalog_files_not_void: local_catalog_files /= Void
	system_rewrite_rules_not_void: system_rewrite_rules /= Void
	uri_rewrite_rules_not_void: uri_rewrite_rules /= Void
	uri_delegates_not_void: uri_delegates /= Void
	system_delegates_not_void: system_delegates /= Void
	public_delegates_not_void: public_delegates /= Void
	base_uri_not_void: base_uri /= Void
	system_id_not_void: system_id /= Void
	mixed_mode: is_string_mode_mixed
	attribute_triples: attribute_namespaces /= Void implies attribute_local_parts /= Void
		and then attribute_values /= Void and then attribute_values.count = attribute_local_parts.count
		and then attribute_local_parts.count = attribute_namespaces.count
	system_entries_not_void: system_entries /= Void
	uri_entries_not_void: uri_entries /= Void
	public_entries_not_void: public_entries /= Void
	prefer_public_entries_not_void: prefer_public_entries /= Void
	element_name_stack_not_void: element_name_stack /= Void

end
	
