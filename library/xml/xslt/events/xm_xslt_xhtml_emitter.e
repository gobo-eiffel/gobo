indexing

	description:

	"Emitters that write XHTML."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_XHTML_EMITTER

inherit

	XM_XSLT_XML_EMITTER
		redefine
			start_document, start_content, empty_element_tag_closer, output_attribute
		end

	XM_XPATH_TYPE

create

	make

	
feature -- Events

	start_document is
			-- New document
		do
			is_document_started := True
			escape_uri_attributes := output_properties.escape_uri_attributes
			make_url_attributes
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do

			-- Add a meta tag after the head tag if there is one. TODO: or replace and existing one

			if not is_error and then STRING_.same_string (element_qname_stack.item, "head") then
				if output_properties.include_content_type then
					if is_open_start_tag then close_start_tag ("head", False) end
					output_ignoring_error ("%N      <meta http-equiv=%"Content-Type%" content=%"" +
												  output_properties.media_type + "; charset=" + output_properties.encoding + "%"/>%N   ") 
				end
			end
		end

feature {NONE} -- Implementation

	escape_uri_attributes: BOOLEAN
			-- Should the html and xhtml methods escape non-ASCII charaters in URI attribute values?

	empty_element_tag_closer (a_name: STRING): STRING is
			-- String to close an empty tag
		do
			if is_empty_tag (a_name) then 
				Result := "/>"
			else
				Result := STRING_.concat ("></", a_name)
				Result := STRING_.appended_string (Result, ">")
			end
		end

	output_attribute (an_element_name_code: INTEGER; an_attribute_qname: STRING; a_value: STRING; properties: INTEGER) is
			-- Output attribute.
			-- Overrides the XML behaviour if the value is a URL.
		do
			if escape_uri_attributes and then
				shared_name_pool.uri_code_from_name_code (an_element_name_code) = Xhtml_uri_code and then
				is_url_attribute (element_qname_stack.item, an_attribute_qname) and then
				not is_output_escaping_disabled (properties) then
				Precursor (an_element_name_code, an_attribute_qname, escaped_url (a_value), 0)
			else
				Precursor (an_element_name_code, an_attribute_qname, a_value, properties)
			end
		end

invariant

	empty_tags_set_not_void: empty_tags_set /= Void

end
	
