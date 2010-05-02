note

	description:

		"Objects that represent xsl:include elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_INCLUDE

inherit

	XM_XSLT_MODULE

create

	make_style_element

feature -- Status report

	is_import: BOOLEAN
			-- Is this an xsl:import?
		do
			-- False
		end

end

