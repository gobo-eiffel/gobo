indexing

	description:

		"xsl:transform or xsl:stylesheet element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STYLESHEET

inherit

	XM_XSLT_STYLE_ELEMENT

creation

	make


feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			todo ("prepare_attributes", False)
		end

end
