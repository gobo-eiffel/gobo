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
			validate, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

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
			an_error: XM_XPATH_ERROR_VALUE
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
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			if a_terminate_attribute = Void then a_terminate_attribute := "no" end
			generate_attribute_value_template (a_terminate_attribute, static_context)
			terminate := last_generated_expression
			if terminate.is_error then
				report_compile_error (terminate.error_value)
			end
			if terminate.is_string_value then
				a_terminate_attribute := terminate.as_string_value.string_value
				if STRING_.same_string (a_terminate_attribute, "no") then
					-- OK
				elseif STRING_.same_string (a_terminate_attribute, "yes") then
					-- OK
				else
					create an_error.make_from_string ("xsl:message terminate attribute must be 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
					report_compile_error (an_error)
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_function: XM_XSLT_FUNCTION
		do
			a_function ?= parent_node
			if a_function = Void then
				check_within_template
			end
			if select_expression /= Void then
				type_check_expression ("select", select_expression)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
			end
			if terminate /= Void then
				type_check_expression ("terminate", terminate)
				if terminate.was_expression_replaced then
					terminate := terminate.replacement_expression
				end
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
			compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), true)
			if last_generated_expression /= Void then
				if select_expression = Void then
					select_expression := last_generated_expression
				else
					create {XM_XSLT_BLOCK} select_expression.make (an_executable, select_expression, last_generated_expression, principal_stylesheet.module_number (system_id), line_number)
				end
			end
			if select_expression = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} select_expression.make
			end
			create {XM_XSLT_COMPILED_MESSAGE} last_generated_expression.make (an_executable, select_expression, terminate)
		end

feature {NONE} -- Implementation

	terminate: XM_XPATH_EXPRESSION
			-- Value of terminate attribute

	select_expression: XM_XPATH_EXPRESSION
			-- Value of select attribute

end
