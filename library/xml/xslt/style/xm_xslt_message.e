indexing

	description:

		"xsl:message element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_MESSAGE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make_style_element, validate, may_contain_sequence_constructor
		end

creation {XM_XSLT_NODE_FACTORY}

	make_style_element


feature {NONE} -- Initialization
	
	make_style_element (an_error_listener: XM_XSLT_ERROR_LISTENER;  a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		do
			is_instruction := True
			Precursor (an_error_listener, a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number)
			end


feature -- Status report

	may_contain_sequence_constructor: BOOLEAN is
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_terminate_attribute, a_select_attribute: STRING
			a_string_value: XM_XPATH_STRING_VALUE
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			variant
				attribute_collection.number_of_attributes + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := shared_name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Terminate_attribute) then
					a_terminate_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_terminate_attribute)
					STRING_.right_adjust (a_terminate_attribute)
				elseif STRING_.same_string (an_expanded_name, Select_attribute) then
					a_select_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_select_attribute)
					STRING_.right_adjust (a_select_attribute)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				select_expression := last_generated_expression
			end
			if a_terminate_attribute = Void then a_terminate_attribute := "no" end
			generate_attribute_value_template (a_terminate_attribute, static_context)
			terminate := last_generated_expression
			a_string_value ?= terminate
			if a_string_value /= Void then
				a_terminate_attribute := a_string_value.string_value
				if STRING_.same_string (a_terminate_attribute, "no") then
					-- OK
				elseif STRING_.same_string (a_terminate_attribute, "yes") then
					-- OK
				else
					report_compile_error ("xsl:message terminate attribute must be 'yes' or 'no'")
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			an_xsl_choose: XM_XSLT_CHOOSE
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= parent_node
			if a_function = Void then
				check_within_template
			end
			type_check_expression ("select", select_expression)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			type_check_expression ("terminate", terminate)
			if terminate.was_expression_replaced then
				terminate := terminate.replacement_expression
			end						
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			create {XM_XSLT_COMPILED_MESSAGE} last_generated_instruction.make (an_executable, select_expression, terminate)
			compile_children (an_executable, last_generated_instruction)
		end

feature {NONE} -- Implementation

	terminate: XM_XPATH_EXPRESSION
			-- Value of terminate attribute

	select_expression: XM_XPATH_EXPRESSION
			-- Value of select attribute

end
