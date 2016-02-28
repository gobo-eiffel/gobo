note

	description:

		"xsl:if element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
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

	condition: detachable XM_XPATH_EXPRESSION
			-- Test expression

feature -- Status setting

	mark_tail_calls
			-- Mark tail-recursive calls on templates and functions.
		local
			a_last_instruction: detachable XM_XSLT_STYLE_ELEMENT
		do
			a_last_instruction := last_child_instruction
			if a_last_instruction /= Void then
				a_last_instruction.mark_tail_calls
			end
		end

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
			a_test_attribute: detachable STRING
		do
			if attached attribute_collection as l_attribute_collection then
				from
					a_cursor := l_attribute_collection.name_code_cursor
					a_cursor.start
				until
					a_cursor.after or any_compile_errors
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
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_test_attribute /= Void then
				generate_expression (a_test_attribute)
				condition := last_generated_expression
			else
				report_absence ("test")
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			create l_replacement.make (Void)
			check attached condition as l_condition then
				type_check_expression (l_replacement, "test", l_condition)
			end
			condition := l_replacement.item
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			a_value: XM_XPATH_VALUE
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_action: XM_XPATH_EXPRESSION
			some_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			some_actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			last_generated_expression := Void
			check attached condition as l_condition then
				if l_condition.is_value and then not l_condition.depends_upon_implicit_timezone then

					-- Condition known statically, so we only need compile the code if true.
	            -- This can happen with expressions such as test="function-available('abc')".

					a_value := l_condition.as_value
					a_value.calculate_effective_boolean_value (new_dummy_context)
					check postcondition_of_calculate_effective_boolean_value: attached a_value.last_boolean_value as l_last_boolean_value then
						a_boolean_value := l_last_boolean_value
					end
					if attached a_boolean_value.error_value as l_error_value then
						check is_error: a_boolean_value.is_error end
						report_compile_error (l_error_value)
					else
						if a_boolean_value.value then
							compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
						end
					end
				else
					compile_sequence_constructor (an_executable, new_axis_iterator (Child_axis), True)
					if attached last_generated_expression as l_last_generated_expression then
						an_action := l_last_generated_expression
						create some_conditions.make (1)
						some_conditions.put (l_condition, 1)
						create some_actions.make (1)
						some_actions.put (an_action, 1)
						create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, some_conditions, some_actions)
					end
				end
			end
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

end
