indexing

	description:

		"xsl:namespace-alias element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NAMESPACE_ALIAS

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	stylesheet_uri_code: INTEGER
			-- TODO: comment

	result_namespace_code: INTEGER
			-- TODO: comment

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			attributes_prepared := True
			todo ("prepare_attributes", False)
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
