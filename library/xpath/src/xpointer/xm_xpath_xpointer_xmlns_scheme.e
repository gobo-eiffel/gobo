note

	description:

		"Objects that implement the W3C XPointer xmlns scheme"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_XPOINTER_XMLNS_SCHEME

inherit

	XM_XPATH_XPOINTER_SCHEME

	XM_XPATH_ERROR_TYPES

		--	XM_UNICODE_CHARACTERS_1_0
		-- Commented out on 26/09/2005, as the 1.1 definitions
		--  are now imported via  XM_XPATH_STANDARD_NAMESPACES.
		-- This means not 100% compliant with the XPointer recommendation,
		--  which refers to XML Names 1.0 for the definitions of NCName and QName

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

create

	make

feature {NONE} -- Implementation

	make
		do
		end

feature -- Access

	expanded_name: STRING = "xmlns"
			-- Expanded name of implemented scheme

	value: detachable XM_XPATH_VALUE
			-- Result of last call to `evaluate'

feature -- Status report

	were_resources_found: BOOLEAN
			-- Were any XML resoureces found by last call to `evaluate'?

	is_error: BOOLEAN
			-- Did a syntax or evaluation error occur?

feature -- Element change

	evaluate (a_resource: XM_XPATH_DOCUMENT; a_namespace_context: XM_XPOINTER_NAMESPACE_CONTEXT; some_data: STRING)
			-- Evaluate `some_data' against `a_resource' within `a_namespace_context'.
		local
			a_splitter: ST_SPLITTER
			an_xml_prefix, a_namespace_uri: STRING
			l_components: like components
		do
			evaluated := True
			is_error := False
			create a_splitter.make
			a_splitter.set_separators ("=")
			l_components := a_splitter.split (some_data)
			components := l_components
			if l_components.count /= 2 then
				is_error := True
				create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Scheme data must have exactly one '=' sign", Gexslt_eiffel_type_uri, "XPOINTER_XMLNS_SYNTAX", Static_error)
			else
				an_xml_prefix := l_components.item (1)
				STRING_.right_adjust (an_xml_prefix)
				if not is_ncname (an_xml_prefix) then
					is_error := True
					create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Prefix is not an NCName", Gexslt_eiffel_type_uri, "XPOINTER_XMLNS_SYNTAX", Static_error)
				elseif a_namespace_context.is_prefix_proscribed (an_xml_prefix) then
					is_error := True
					create {XM_XPATH_INVALID_VALUE} value.make_from_string ("'xml' or 'xmlns' may not be defined", Gexslt_eiffel_type_uri, "XPOINTER_XMLNS_SYNTAX", Static_error)
				elseif a_namespace_context.is_prefix_declared (an_xml_prefix) then
					is_error := True
					create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Prefix is already declared", Gexslt_eiffel_type_uri, "XPOINTER_XMLNS_SYNTAX", Static_error)
				else
					a_namespace_uri := l_components.item (2)
					STRING_.left_adjust (a_namespace_uri)
					if a_namespace_context.is_namespace_proscribed (a_namespace_uri) then
						is_error := True
						create {XM_XPATH_INVALID_VALUE} value.make_from_string ("The namespaces 'http:/www.w3.org/XML/1998/namespace' and 'http://www.w3.org/2000/xmlns/' may not be declared",
																								  Gexslt_eiffel_type_uri, "XPOINTER_XMLNS_SYNTAX", Static_error)
					else
						a_namespace_context.bind (an_xml_prefix, a_namespace_uri)
						create {XM_XPATH_EMPTY_SEQUENCE} value.make
					end
				end
			end
		end

feature {NONE} -- Implementation

	components: detachable DS_LIST [STRING]
			-- Components of scheme data

end

