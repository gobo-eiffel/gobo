indexing

	description:

		"xsl:param element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PARAM

inherit

	XM_XSLT_VARIABLE_DECLARATION
		redefine
			make_style_element, validate, allows_required, allows_value
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			cached_variable_fingerprint := -1
			create references.make (5)
			allows_tunnel := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Access

	required_type: XM_XPATH_SEQUENCE_TYPE is
			-- Static type of the variable
		do
			if as_type /= Void then
				Result := as_type
			else
				create Result.make_any_sequence
			end
		end

	allows_required: BOOLEAN is
			-- Is the "required" attribute allowed?
		local
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= Current
			Result := a_function = Void
		end

	allows_value: BOOLEAN is
			-- Is the "select" attribute allowed?
		local
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= Current
			Result := a_function = Void
		end

feature -- Element change

	validate is
			-- Check that the stylesheet element is valid.
			-- This is called once for each element, after the entire tree has been built.
			-- As well as validation, it can perform first-time initialisation.
		do
			todo ("validate", False)
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

end
