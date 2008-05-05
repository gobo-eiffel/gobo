indexing

	description:

		"xsl:value-of element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_VALUE_OF

inherit

	XM_XSLT_STRING_CONSTRUCTOR
		redefine
			validate, returned_item_type
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	select_and_content_error: STRING is
			-- Error code when both select expression and content are mutually exclusive
		do
			Result := "XTSE0870"
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name, l_select_attribute, l_disable_attribute, l_separator_attribute: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attribute_collection /= Void then
				from
					l_cursor := attribute_collection.name_code_cursor
					l_cursor.start
				variant
					attribute_collection.number_of_attributes + 1 - l_cursor.index				
				until
					l_cursor.after or any_compile_errors
				loop
					l_name_code := l_cursor.item
					l_expanded_name := shared_name_pool.expanded_name_from_name_code (l_name_code)
					if STRING_.same_string (l_expanded_name, Select_attribute) then
						l_select_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_select_attribute)
						STRING_.left_adjust (l_select_attribute)
					elseif STRING_.same_string (l_expanded_name, Disable_output_escaping_attribute) then
						l_disable_attribute := attribute_value_by_index (l_cursor.index)
						STRING_.left_adjust (l_disable_attribute)
						STRING_.right_adjust (l_disable_attribute)
					elseif STRING_.same_string (l_expanded_name, Separator_attribute) then
						l_separator_attribute := attribute_value_by_index (l_cursor.index)
					else
						check_unknown_attribute (l_name_code)
					end
					l_cursor.forth
				end
			end
			if l_select_attribute /= Void then
				generate_expression (l_select_attribute)
				select_expression := last_generated_expression
				if select_expression.is_error then
					report_compile_error (select_expression.error_value)
				end
			end
			if l_disable_attribute /= Void then
				if STRING_.same_string (l_disable_attribute, "no") then
					-- do nothing
				elseif STRING_.same_string (l_disable_attribute, "yes") then
					if STRING_.same_string (l_disable_attribute, "yes") then
						create l_error.make_from_string ("disable-output-escaping is not supported", Xpath_errors_uri, "XTRE1620", Dynamic_error)
						report_compile_error (l_error)
					elseif not STRING_.same_string (l_disable_attribute, "no") then
						create l_error.make_from_string ("disable-output-escaping attribute must be either 'yes' or 'no'", Xpath_errors_uri, "XTSE0020", Static_error)
						report_compile_error (l_error)
					end
				end
			end

			if l_separator_attribute /= Void then
				generate_attribute_value_template (l_separator_attribute, static_context)
				separator_expression := last_generated_expression
				if separator_expression.is_error then
					report_compile_error (separator_expression.error_value)
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			Precursor
			check_within_template
			if select_expression /= Void then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", select_expression)
				select_expression := l_replacement.item
			end
			if separator_expression /= Void then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "separator", separator_expression)
				separator_expression := l_replacement.item
			end			
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_value_of: XM_XSLT_COMPILED_VALUE_OF
		do
			if separator_expression = Void and then select_expression /= Void
				and then is_backwards_compatible_processing_enabled then
				if not select_expression.is_error then
					if not is_sub_type (select_expression.item_type, type_factory.any_atomic_type) then
						create {XM_XPATH_ATOMIZER_EXPRESSION} select_expression.make (select_expression, static_context.configuration.are_all_nodes_untyped)
					end
					if select_expression.cardinality_allows_many then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} select_expression.make (select_expression)
					end
					if not is_sub_type (select_expression.item_type, type_factory.string_type) then
						create {XM_XPATH_ATOMIC_SEQUENCE_CONVERTER} select_expression.make (select_expression, type_factory.string_type)
					end
				end
			end
			if separator_expression = Void then
				if select_expression = Void then
					create {XM_XPATH_STRING_VALUE} separator_expression.make ("")
				else
					create {XM_XPATH_STRING_VALUE} separator_expression.make (" ")
				end
			end
			create a_value_of.make (an_executable, select_expression, False, principal_stylesheet.module_number (system_id), line_number)
			compile_content (an_executable, a_value_of, separator_expression)
			last_generated_expression := a_value_of
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

	separator_expression: XM_XPATH_EXPRESSION
			-- String used to separate adjacent items in the output sequence

end
