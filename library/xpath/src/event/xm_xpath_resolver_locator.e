note

	description:

		"Locators implemented with an XM_PARSER and an XM_URI_EXTERNAL_RESOLVER"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_RESOLVER_LOCATOR

inherit

	XM_XPATH_LOCATOR

create

	make

feature {NONE} -- Initialization

	make (a_parser: XM_PARSER)
			-- Establish invariant.
		require
			parser_not_void: a_parser /= Void
		do
			parser := a_parser
			if attached {XM_URI_EXTERNAL_RESOLVER} parser.entity_resolver as l_resolver then
				resolver := l_resolver
			else
				resolver := Void
			end
		ensure
			parser_set: parser = a_parser
		end

feature -- Access

	system_id: STRING
			-- Current SYSTEM ID;
			-- If this is a URL, then it must be fully resolved
		do
			if attached resolver as l_resolver then
				Result := l_resolver.uri.full_reference
			else
				Result := ""
			end
		end

	line_number: INTEGER
			-- Approximate line number of current event, or 0 if unknown
		do
			Result :=  parser.position.row
		end

feature {NONE} -- Implementation

	parser: XM_PARSER
			-- XML parser

	resolver: detachable XM_URI_EXTERNAL_RESOLVER
			-- Entity resolver

invariant

	parser_not_void: parser /= Void

end
