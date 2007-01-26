indexing

	description:

	"Receivers that indent XHTML by adding whitespace to character data"

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2005, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_XHTML_INDENTER

inherit

	XM_XSLT_HTML_INDENTER
		redefine
			tag_properties
		end

create

	make

feature {NONE} -- Implementation

	tag_properties (a_name_code: INTEGER): INTEGER is
			-- Properties for element named by `a_name_code'
		local
			is_formatted, is_inline: BOOLEAN
			a_local_name: STRING
		do
			if shared_name_pool.namespace_code_from_name_code (a_name_code) = Xhtml_uri_code then
				a_local_name := shared_name_pool.local_name_from_name_code (a_name_code)
				is_inline := inline_tags.has (a_local_name)
				is_formatted := formatted_tags.has (a_local_name)
				if is_inline then Result := Result + Inline_tag end
				if is_formatted then Result := Result + Formatted_tag end
			end
		end

end
	
