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
		redefine
			validate
		end

feature -- Access

	href: STRING
			-- Value of href mandatory attribute

feature -- Status report

	is_import: BOOLEAN is
			-- Is this an xsl:import?
		deferred
		end

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			todo ("compile", False)
		end

end
	
