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

	XM_XSLT_STRING_ROUTINES

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
		local
			is_local: BOOLEAN
			a_style_element: XM_XSLT_STYLE_ELEMENT
			a_stylesheet: XM_XSLT_STYLESHEET
			a_template: XM_XSLT_TEMPLATE
			a_function: XM_XSLT_FUNCTION
			a_parameter: XM_XSLT_PARAM
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_node: XM_XPATH_NODE
		do
			a_stylesheet ?= parent; a_template ?= parent; a_function ?= parent
			is_local := a_template /= Void or else a_function /= Void
			is_global_variable := a_stylesheet /= Void
			if not is_local and then not is_global_variable then
				report_compile_error ("xsl:param must be immediately within a template, function or stylesheet")
			else
				if not is_global_variable then
					from
						a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
						a_preceding_iterator.start
					until
						any_compile_errors or else a_preceding_iterator.after
					loop
						a_node := a_preceding_iterator.item
						a_parameter ?= a_node
						if a_parameter /= Void then
							if variable_fingerprint = a_parameter.variable_fingerprint then
								report_compile_error ("The name of the parameter is not unique")
							end
						else
							a_style_element ?= a_node
							if a_style_element /= Void then
								report_compile_error ("xsl:param must be the first element within a template or function")
							else

								-- must be a text node - allow it only if all white-space

								if not is_all_whitespace (a_node.string_value) then
									report_compile_error ("xsl:param must not be preceded by text")
								end
							end
						end
						a_preceding_iterator.forth
					end
				end
				if is_required_parameter then
					if select_expression /= Void then

						-- NB, we do this test before setting the default select attribute

						report_compile_error ("The select attribute should be omitted when required='yes'")
					end
					if has_child_nodes then
						report_compile_error ("A parameter specifying required='yes' must have empty content")
					end
				end
				if not any_compile_errors then Precursor end
			end
			validated := True
		end

	compile (compile_to_eiffel: BOOLEAN) is
			-- Compile `Current' to an excutable instruction, 
			--  or to Eiffel code.
		do
			todo ("compile", False)
		end

end
