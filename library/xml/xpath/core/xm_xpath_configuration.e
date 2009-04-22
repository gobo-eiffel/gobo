indexing

	description:

		"Objects that provide system configuration information"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONFIGURATION

inherit

	UC_SHARED_STRING_EQUALITY_TESTER

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	MA_SHARED_DECIMAL_CONTEXT
		export {NONE} all end

	MA_DECIMAL_CONTEXT_CONSTANTS
		export {NONE} all end

create

	make_configuration

feature {NONE} -- Initialization

	make_configuration is
			-- Initialize `Current' with standard settings.
		local
			l_property_table: DS_HASH_TABLE [STRING, STRING]
		do
			create system_properties.make_with_equality_testers (3, Void, string_equality_tester)
			create l_property_table.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
			register_property_namespace_table (l_property_table, Gexslt_eiffel_type_uri)
			create {XM_XPATH_DEFAULT_COLLECTION_RESOLVER} collection_resolver.make (Current)
			shared_decimal_context.set_digits (18)
			initialized := True
		ensure
			initialized: initialized
			gexslt_properties_table_registered: system_properties.has (Gexslt_eiffel_type_uri)
		end

feature -- Access

	Standard_file_collection: STRING is "standard-file-collection"
			-- Property name for standard implementation of file: URI scheme

	Standard_ftp_collection: STRING is "standard-ftp-collection"
			-- Property name for standard implementation of ftp: URI scheme

	Standard_http_collection: STRING is "standard-http-collection"
			-- Property name for standard implementation of http: URI scheme

	collection_resolver: XM_XPATH_COLLECTION_RESOLVER
			-- URI resolver for fn:collection()

	product_name: STRING
			-- Product name (e.g. "Gexslt" or "Gestalt")

	product_version: STRING
			-- Product version number (e.g. Gobo version number or Gestalt version number)

	vendor_name: STRING
			-- Name of organization or individual responsible for this configuration (e.g. "Gobo" or "Colin Adams")

	vendor_url: STRING
			-- Web page for `vendor_name'

	system_properties: DS_HASH_TABLE [DS_HASH_TABLE [STRING, STRING], STRING]
			-- Tables of additional system properties;
			-- Key is namespace URI;
			-- Value is tables of values keyed by local name.

feature -- Status report

	initialized: BOOLEAN
			-- Has initialization completed?

	is_tracing: BOOLEAN is
			-- Is tracing active?
		do
			Result := False
		end

	is_tracing_suppressed: BOOLEAN
			-- Is output from XPath trace() function suppressed?

	are_all_nodes_untyped: BOOLEAN is
			-- Are all nodes untyped?
		do
			Result := True -- for Basic-level XSLT
		end

	is_uri_written (a_uri: STRING): BOOLEAN is
			-- Has `a_uri' been written to yet?
		require
			a_uri_not_void: a_uri /= Void
		do
			-- To be redefined in XSLT
		end

feature -- Setting

	suppress_trace_output (yes_or_no: BOOLEAN) is
			-- Turn tracing supression on-or-off.
		do
			is_tracing_suppressed := yes_or_no
		ensure
			set: is_tracing_suppressed = yes_or_no
		end

	set_collection_resolver (a_collection_resolver: like collection_resolver) is
			-- Set `collection_resolver'.
			-- This routine also removes system-properties indicating use of the standard implementation.
		require
			collection_resolver_not_void: a_collection_resolver /= Void
		do
			clear_resolver_properties
			collection_resolver := a_collection_resolver
		ensure
			collection_resolver_set: collection_resolver = a_collection_resolver
		end
		
	set_product_name (a_name: STRING) is
			-- Set `product_name'.
		require
			name_not_void: a_name /= Void
		do
			product_name := a_name
		ensure
			name_set: product_name = a_name
		end

	set_product_version (a_version: STRING) is
			-- Set `product_version'.
		require
			version_not_void: a_version /= Void
		do
			product_version := a_version
		ensure
			version_set: product_version = a_version
		end

	set_vendor_name (a_name: STRING) is
			-- Set `vendor_name'.
		require
			name_not_void: a_name /= Void
		do
			vendor_name := a_name
		ensure
			name_set: vendor_name = a_name
		end

	set_vendor_url (a_url: STRING) is
			-- Set `vendor_url'.
		require
			url_not_void: a_url /= Void
		do
			vendor_url := a_url
		ensure
			url_set: vendor_url = a_url
		end

	set_digits (digits: INTEGER) is
			-- Set the preceision for decimal and integer arithmetic.
		require
			sufficient_precision: digits >= 18
		do
			shared_decimal_context.set_digits (digits)
		ensure
			digits_set: shared_decimal_context.digits = digits
		end

	trace (a_label, a_value: STRING) is
			-- Create trace entry.
		require
			tracing_enabled: is_tracing
			value_not_void: a_value /= Void
			label_not_void: a_label /= Void
		do
			-- Default is to do nothing - host language should override.
		end

	register_property_namespace_table (a_table: DS_HASH_TABLE [STRING, STRING]; a_namespace: STRING) is
			-- Register `a_table' as system-properties in `a_namespace'.
		require
			a_table_not_void: a_table /= Void
			a_namespace_not_void: a_namespace /= Void
			a_namespace_not_empty: not a_namespace.is_empty
			new_table: not system_properties.has (a_namespace)
		do
			system_properties.force_new (a_table, a_namespace)
		ensure
			a_namespace_registered: system_properties.has (a_namespace)
			table_registered: system_properties.item (a_namespace) = a_table
		end

feature {NONE} -- Implementation

	clear_resolver_properties is
			-- Remove all standard resolver system-properties.
		local
			l_property_table: DS_HASH_TABLE [STRING, STRING]
		do
			l_property_table := system_properties.item (Gexslt_eiffel_type_uri)
			if l_property_table /= Void then
				if l_property_table.has (Standard_file_collection) then
					l_property_table.remove (Standard_file_collection)
				end
				if l_property_table.has (Standard_ftp_collection) then
					l_property_table.remove (Standard_ftp_collection)
				end
				if l_property_table.has (Standard_http_collection) then
					l_property_table.remove (Standard_http_collection)
				end
			end
		end


invariant

	collection_resolver_not_void: initialized implies collection_resolver /= Void
	system_properties_not_void: initialized implies system_properties /= Void
	no_void_namespace: initialized implies not system_properties.has_void

end
