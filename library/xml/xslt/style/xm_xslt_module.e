indexing

	description:

		"Objects that represent xsl:include or xsl:import elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_MODULE

inherit

	XM_XSLT_STYLE_ELEMENT

feature -- Access

	href: STRING
			-- Value of href mandatory attribute

feature -- Status report

	is_import: BOOLEAN is
			-- Is this an xsl:import?
		deferred
		end

end
	
