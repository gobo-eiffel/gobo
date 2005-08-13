indexing

	description:

		"Routines common to xsl:output and xsl:result-document"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_ROUTINES

inherit

	XM_XPATH_ERROR_TYPES

	XM_UNICODE_CHARACTERS_1_1
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

feature {NONE} -- Implementation

	cdata_section_expanded_names: DS_ARRAYED_LIST [STRING]
			-- Expanded names of elements whose text children are to be output as CDATA sections

	cdata_validation_error: XM_XPATH_ERROR_VALUE

	validate_cdata_sections (a_cdata_section_elements: STRING; a_namespace_resolver: XM_XPATH_NAMESPACE_RESOLVER) is
			-- Validate cdata-section-elements attribute.
		require
			cdata_section_elements_not_void: a_cdata_section_elements /= Void
			cdata_validation_error_void: cdata_validation_error = Void
		local
			a_string_splitter, another_string_splitter: ST_SPLITTER
			a_cdata_name_list, qname_parts: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_qname, a_local_name, an_xml_prefix, a_uri, an_expanded_name: STRING
		do
			cdata_validation_error := Void
			create a_string_splitter.make
			a_cdata_name_list := a_string_splitter.split (a_cdata_section_elements)
			from
				a_cursor := a_cdata_name_list.new_cursor; a_cursor.start
				create cdata_section_expanded_names.make (a_cdata_name_list.count)
			variant
				a_cdata_name_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_qname := a_cursor.item
				if not is_qname (a_qname) then
					create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element name in xsl:output or xsl:result-document. ", a_qname), Xpath_errors_uri, "XTSE0020", Static_error)
					a_cursor.go_after
				else
					create another_string_splitter.make
					another_string_splitter.set_separators (":")
					qname_parts := another_string_splitter.split (a_qname)
					if qname_parts.count = 1 then
						a_local_name := qname_parts.item (1)
						an_xml_prefix := ""
					else
						a_local_name := qname_parts.item (2)
						an_xml_prefix := qname_parts.item (1)
					end
					a_uri := a_namespace_resolver.uri_for_defaulted_prefix (an_xml_prefix, True)
					if a_uri = Void then
						create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element prefix. in xsl:output or xsl:result-document ", an_xml_prefix), Xpath_errors_uri, "XTSE0020", Static_error)
						a_cursor.go_after
					else
						an_expanded_name := STRING_.concat ("{", a_uri)
						an_expanded_name := STRING_.appended_string (an_expanded_name, "}")
						an_expanded_name := STRING_.appended_string (an_expanded_name, a_local_name)
						cdata_section_expanded_names.put_last (an_expanded_name)
					end
				end
				a_cursor.forth
			end
		ensure
			cdata_section_expanded_names_not_void: cdata_section_expanded_names /= Void
		end

end

