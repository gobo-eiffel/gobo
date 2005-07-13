indexing
	
	description:
	
		"XML declaration event filter"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DECLARATION_FILTER

inherit
	
	XM_CALLBACKS_FILTER
		redefine
			on_xml_declaration
		end

create

	make_null, set_next

feature
	
	on_xml_declaration (a_version: STRING; an_encoding: STRING; a_standalone: BOOLEAN) is
			-- XML declaration.
		do
			version := a_version
			encoding := an_encoding
			standalone := a_standalone
			
			Precursor (a_version, an_encoding, a_standalone)
		end
		
feature -- Declaration info

	version: STRING
	encoding: STRING
	standalone: BOOLEAN

end
