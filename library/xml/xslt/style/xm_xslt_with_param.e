note

	description:

		"xsl:with-param element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_WITH_PARAM

inherit

	XM_XSLT_GENERAL_VARIABLE
		redefine
			make_style_element, validate
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature {NONE} -- Initialization

	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER; a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER; a_configuration: like configuration)
			-- Establish invariant.
		do
			cached_variable_fingerprint := -1
			allows_tunnel := True
			create slot_manager.make
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_configuration)
		end

feature -- Element change

	validate
			-- Check that the stylesheet element is valid.
		local
			a_preceding_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_with_param: XM_XSLT_WITH_PARAM
			an_error: XM_XPATH_ERROR_VALUE
		do
			Precursor

			-- Check for duplicate parameter names

			a_preceding_iterator := new_axis_iterator (Preceding_sibling_axis)
			from
			   a_preceding_iterator.start
			until
			   any_compile_errors or else a_preceding_iterator.after
			loop
				a_with_param ?= a_preceding_iterator.item
				if a_with_param /= Void and then a_with_param.variable_fingerprint = variable_fingerprint then
					create an_error.make_from_string ("Duplicate parameter name", Xpath_errors_uri, "XTSE0670", Static_error)
					report_compile_error (an_error)
				end
			   a_preceding_iterator.forth
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			a_with_param: XM_XSLT_COMPILED_WITH_PARAM
		do
			create a_with_param.make (an_executable, variable_name)
			initialize_instruction (an_executable, a_with_param)
			last_generated_expression := a_with_param
		end

end
