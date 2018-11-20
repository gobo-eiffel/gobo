note

	description:

		"XML declaration event filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_DECLARATION_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_xml_declaration
		end

create

	make_null,
	make_next

feature -- Document

	on_xml_declaration (a_version: STRING; an_encoding: detachable STRING; a_standalone: BOOLEAN)
			-- XML declaration.
		do
			version := a_version
			encoding := an_encoding
			standalone := a_standalone
			Precursor (a_version, an_encoding, a_standalone)
		end

feature -- Declaration info

	version: detachable STRING
			-- Version

	encoding: detachable STRING
			-- Encoding

	standalone: BOOLEAN
			-- Is standalone?

invariant

	version_not_empty: attached version as l_version implies l_version.count > 0

end
