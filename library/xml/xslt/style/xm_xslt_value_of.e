note

	description:

		"xsl:value-of element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
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

	select_and_content_error: STRING
			-- Error code when both select expression and content are mutually exclusive
		do
			Result := "XTSE0870"
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_name_code: INTEGER
			l_expanded_name, l_select_attribute, l_disable_attribute, l_separator_attribute: detachable STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if attached attribute_collection as l_attribute_collection then
				from
					l_cursor := l_attribute_collection.name_code_cursor
					l_cursor.start
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
				variant
					l_attribute_collection.number_of_attributes + 1 - l_cursor.index
				end
			end
			if l_select_attribute /= Void then
				generate_expression (l_select_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_select_expression then
					select_expression := l_new_select_expression
					if attached l_new_select_expression.error_value as l_error_value then
						check is_error: l_new_select_expression.is_error end
						report_compile_error (l_error_value)
					end
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
				check precondition_static_context_not_void: attached static_context as l_static_context then
					generate_attribute_value_template (l_separator_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_separator_expression then
					separator_expression := l_new_separator_expression
					if attached l_new_separator_expression.error_value as l_error_value then
						check is_error: l_new_separator_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			Precursor
			check_within_template
			if attached select_expression as l_select_expression then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "select", l_select_expression)
				select_expression := l_replacement.item
			end
			if attached separator_expression as l_separator_expression then
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "separator", l_separator_expression)
				separator_expression := l_replacement.item
			end
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			a_value_of: XM_XSLT_COMPILED_VALUE_OF
			l_select_expression: like select_expression
			l_separator_expression: like separator_expression
		do
			l_select_expression := select_expression
			if separator_expression = Void and then l_select_expression /= Void
				and then is_backwards_compatible_processing_enabled then
				if not l_select_expression.is_error then
					if not is_sub_type (l_select_expression.item_type, type_factory.any_atomic_type) then
						check attached static_context as l_static_context then
							create {XM_XPATH_ATOMIZER_EXPRESSION} l_select_expression.make (l_select_expression, l_static_context.configuration.are_all_nodes_untyped)
						end
						select_expression := l_select_expression
					end
					if l_select_expression.cardinality_allows_many then
						create {XM_XPATH_FIRST_ITEM_EXPRESSION} l_select_expression.make (l_select_expression)
						select_expression := l_select_expression
					end
					if not is_sub_type (l_select_expression.item_type, type_factory.string_type) then
						create {XM_XPATH_ATOMIC_SEQUENCE_CONVERTER} select_expression.make (l_select_expression, type_factory.string_type)
					end
				end
			end
			l_separator_expression := separator_expression
			if l_separator_expression = Void then
				if select_expression = Void then
					create {XM_XPATH_STRING_VALUE} l_separator_expression.make ("")
				else
					create {XM_XPATH_STRING_VALUE} l_separator_expression.make (" ")
				end
				separator_expression := l_separator_expression
			end
			check attached principal_stylesheet as l_principal_stylesheet then
				create a_value_of.make (an_executable, select_expression, False, l_principal_stylesheet.module_number (system_id), line_number)
			end
			compile_content (an_executable, a_value_of, l_separator_expression)
			last_generated_expression := a_value_of
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := text_node_kind_test
		end

feature {NONE} -- Implementation

	separator_expression: detachable XM_XPATH_EXPRESSION
			-- String used to separate adjacent items in the output sequence

end
