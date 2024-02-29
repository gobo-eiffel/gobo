note

	description:

		"Objects that represent xsl:import elements in the stylesheet."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_IMPORT

inherit

	XM_XSLT_MODULE

create

	make_style_element

feature -- Status report

	is_import: BOOLEAN
			-- Is this an xsl:import?
		do
			Result := True
		end

end

