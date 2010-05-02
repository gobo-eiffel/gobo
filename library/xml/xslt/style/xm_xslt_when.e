note

	description:

		"xsl:when element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_WHEN

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

	mark_tail_calls
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
			an_expanded_name, a_test_attribute: STRING
		do
			if attribute_collection /= Void then
				from
					a_cursor := attribute_collection.name_code_cursor
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
					attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			if a_test_attribute /= Void then
				generate_expression (a_test_attribute)
				condition := last_generated_expression
				if condition.is_error then
					report_compile_error (condition.error_value)
				end
			else
				report_absence ("test")
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_xsl_choose: XM_XSLT_CHOOSE
			l_error: XM_XPATH_ERROR_VALUE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_xsl_choose ?= parent
			if l_xsl_choose = Void then
				create l_error.make_from_string ("xsl:when must be immediately within xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (l_error)
			else
				create l_replacement.make (Void)
				type_check_expression (l_replacement, "test", condition)
				condition := l_replacement.item
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		do
			last_generated_expression := Void
		end

feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

end
