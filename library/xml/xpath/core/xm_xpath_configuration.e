indexing

	description:

		"Objects that provide system configuration information"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONFIGURATION

create

	make_configuration

feature {NONE} -- Initialization

	make_configuration is
			-- Establish invariant.
		do
			create {XM_XPATH_DEFAULT_COLLECTION_RESOLVER} collection_resolver.make
			product_name := "Gexslt"
		end

feature -- Access

	collection_resolver: XM_XPATH_COLLECTION_RESOLVER
			-- URI resolver for fn:collection()

	product_name: STRING
			-- Product name ("Gexslt" or "Gestalt")

feature -- Status report

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

feature -- Status setting

	suppress_trace_output (yes_or_no: BOOLEAN) is
			-- Turn tracing supression on-or-off.
		do
			is_tracing_suppressed := yes_or_no
		ensure
			set: is_tracing_suppressed = yes_or_no
		end

feature -- Element change

	set_collection_resolver (a_collection_resolver: like collection_resolver) is
			-- Set `collection_resolver'.
		require
			collection_resolver_not_void: a_collection_resolver /= Void
		do
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

	trace (a_label, a_value: STRING) is
			-- Create trace entry.
		require
			tracing_enabled: is_tracing
			value_not_void: a_value /= Void
			label_not_void: a_label /= Void
		do
			-- Default is to do nothing - host language should override.
		end

invariant

	collection_resolver_not_void: collection_resolver /= Void
	product_name_not_void: product_name /= Void

end
