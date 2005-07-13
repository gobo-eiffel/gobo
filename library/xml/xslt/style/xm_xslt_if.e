indexing

	description:

		"xsl:if element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_IF

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, mark_tail_calls, may_contain_sequence_constructor
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Access

	condition: XM_XPATH_EXPRESSION
			-- Test expression

feature -- Status setting

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: XM_XSLT_STYLE_ELEMENT
		do
			a_last_instruction := last_child_instruction
			if a_last_instruction /= Void then
				a_last_instruction.mark_tail_calls
			end
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
			an_expanded_name, a_test_attribute: STRING
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
				if STRING_.same_string (an_expanded_name, Test_attribute) then
					a_test_attribute := attribute_value_by_index (a_cursor.index)
					STRING_.left_adjust (a_test_attribute)
					STRING_.right_adjust (a_test_attribute)
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if a_test_attribute /= Void then
				generate_expression (a_test_attribute)
				condition := last_generated_expression
			else
				report_absence ("test")
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		do
			check_within_template
			type_check_expression ("test", condition)
			if condition.was_expression_replaced then
				condition := condition.replacement_expression
			end			
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			a_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_action: XM_XPATH_EXPRESSION
			some_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			some_actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			last_generated_expression := Void
			if condition.is_value then

				-- Condition known statically, so we only need compile the code if true.
            -- This can happen with expressions such as test="function-available('abc')".

				a_value := condition.as_value
				a_value.calculate_effective_boolean_value (Void)
				a_boolean_value := a_value.last_boolean_value
				if a_boolean_value.is_error then
					report_compile_error (a_boolean_value.error_value)
				else
					if a_boolean_value.value then
						compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					end
				end
			else
				compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
				if last_generated_expression /= Void then
					an_action := last_generated_expression
					create some_conditions.make (1)
					some_conditions.put (condition, 1)
					create some_actions.make (1)
					some_actions.put (an_action, 1)
					create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, some_conditions, some_actions)
				end
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

end
