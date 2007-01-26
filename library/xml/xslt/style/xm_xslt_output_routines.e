indexing

	description:

		"Routines common to xsl:output and xsl:result-document"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
			a_string_splitter: ST_SPLITTER
			a_cdata_name_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_uri: STRING
			a_parser: XM_XPATH_QNAME_PARSER
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
				create a_parser.make (a_cursor.item)
				if not a_parser.is_valid then
					create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element name in xsl:output or xsl:result-document. ", a_cursor.item), Xpath_errors_uri, "XTSE0020", Static_error)
					a_cursor.go_after
				else
					a_uri := a_namespace_resolver.uri_for_defaulted_prefix (a_parser.optional_prefix, True)
					if a_uri = Void then
						create cdata_validation_error.make_from_string (STRING_.concat ("Invalid CDATA element prefix. in xsl:output or xsl:result-document ",
																											 a_parser.optional_prefix), Xpath_errors_uri, "XTSE0020", Static_error)
						a_cursor.go_after
					else
						cdata_section_expanded_names.put_last (expanded_name_from_components (a_uri, a_parser.local_name))
					end
				end
				a_cursor.forth
			end
		ensure
			cdata_section_expanded_names_not_void: cdata_section_expanded_names /= Void
		end

end

