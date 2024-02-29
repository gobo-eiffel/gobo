note

	description:

		"Emitters that write XHTML."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_XHTML_EMITTER

inherit

	XM_XSLT_XML_EMITTER
		redefine
			empty_element_tag_closer
		end

	XM_XPATH_TYPE

create

	make

feature {NONE} -- Implementation

	empty_element_tag_closer (a_name: STRING; a_name_code: INTEGER): STRING
			-- String to close an empty tag
		do
			if is_empty_tag (a_name) and STRING_.same_string (shared_name_pool.namespace_uri_from_name_code (a_name_code), Xhtml_uri) then
				Result := " />"
			else
				Result := STRING_.concat ("></", a_name)
				Result := STRING_.appended_string (Result, ">")
			end
		end

invariant

	empty_tags_set_not_void: empty_tags_set /= Void

end

