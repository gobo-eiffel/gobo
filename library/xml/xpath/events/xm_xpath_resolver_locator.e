indexing

	description:

		"Locators implemented with an XM_PARSER and an XM_URI_EXTERNAL_RESOLVER"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RESOLVER_LOCATOR

inherit

	XM_XPATH_LOCATOR

create

	make

feature {NONE} -- Initialization

	make (a_parser: XM_PARSER) is
			-- Establish invariant.
		require
			parser_not_void: a_parser /= Void
		do
			parser := a_parser
			resolver ?= parser.entity_resolver
		ensure
			parser_set: parser = a_parser
		end

feature -- Access

	system_id: STRING is
			-- Current SYSTEM ID;
			-- If this is a URL, then it must be fully resolved
		do
			if resolver = Void then
				Result := ""
			else
				Result := resolver.uri.full_reference
			end
		end

	line_number: INTEGER is
			-- Approximate line number of current event, or 0 if unknown
		do
			Result :=  parser.position.row
		end

feature {NONE} -- Implementation

	parser: XM_PARSER
			-- XML parser

	resolver: XM_URI_EXTERNAL_RESOLVER
			-- Entity resolver

invariant

	parser_not_void: parser /= Void

end
