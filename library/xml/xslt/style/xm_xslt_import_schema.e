note

	description:

		"xsl:import-schema element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date  $"
	revision: "$Revision$"

class XM_XSLT_IMPORT_SCHEMA

inherit

	XM_XSLT_STYLE_ELEMENT

create

	make_style_element

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_error.make_from_string ("Xsl:import-schema is not allowed with a Basic XSLT processor", Xpath_errors_uri, "XTSE1650", Static_error)
			report_compile_error (an_error)
			attributes_prepared := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
		end

end	

