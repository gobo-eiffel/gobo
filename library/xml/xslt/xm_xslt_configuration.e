indexing

	description:

		"Objects that hold user-selected configuration options"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CONFIGURATION

inherit

	XM_STRING_MODE

	XM_RESOLVER_FACTORY

	XM_XPATH_SHARED_NAME_POOL

creation

	make, make_with_defaults

feature {NONE} -- Initialization

	make (an_entity_resolver: XM_URI_EXTERNAL_RESOLVER) is
			-- Establish invariant.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
		do
			entity_resolver := an_entity_resolver
			name_pool := default_pool.default_pool
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
		end

	make_with_defaults is
			-- Establish invariant using defaults.
		local
			an_entity_resolver: XM_URI_EXTERNAL_RESOLVER
		do
			set_string_mode_mixed
			entity_resolver := new_file_resolver_current_directory
		end

feature -- Access

	are_external_functions_allowed: BOOLEAN
			-- Are extension functions allowed?

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Error listener

	entity_resolver: XM_URI_EXTERNAL_RESOLVER
			-- Entity resolver

	name_pool: XM_XPATH_NAME_POOL
			-- Name pool

feature -- Status report

	is_line_numbering: BOOLEAN
			-- Is line-numbering turned on?

feature -- Status setting

	set_line_numbering (on_or_off: BOOLEAN) is
			-- Turn line numbering `on_or_off'.
		do
			is_line_numbering := on_or_off
		ensure
			set: is_line_numbering = on_or_off
		end

feature -- Element change

	set_entity_resolver (an_entity_resolver: XM_URI_EXTERNAL_RESOLVER) is
			-- Set `entity_resolver'.
		require
			entity_resolver_not_void: an_entity_resolver /= Void
		do
			entity_resolver := an_entity_resolver
		ensure
			entity_resolver_set: entity_resolver = an_entity_resolver
		end

invariant

	entity_resolver_not_void: entity_resolver /= Void

end
