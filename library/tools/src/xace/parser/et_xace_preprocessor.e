note

	description:

		"Xace XML preprocessor"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_PREPROCESSOR

inherit

	ANY -- Export ANY's features

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UT_SHARED_TEMPLATE_EXPANDER

create

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler)
			-- Create a new Xace XML preprocessor.
			-- Use `a_variables' for variable expansion.
			-- Use `a_variables' to decide whether "if" and "unless"
			-- elements will be stripped off or not.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	variables: KL_VALUES [STRING, STRING]
			-- Dollar variables defined

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Preprocessing

	preprocess_element (a_composite: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Expand variables in all attributes from `a_composite' and strip
			-- elements if they have "if" or "unless" attributes which do not
			-- evaluate to `True'.
		require
			a_composite_not_void: a_composite /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_NODE]
			should_remove: BOOLEAN
		do
			expand_attribute_variables (a_composite)
			a_cursor := a_composite.new_cursor
			from a_cursor.start until a_cursor.after loop
				should_remove := False
				if attached {XM_ELEMENT} a_cursor.item as a_child_element then

					if should_strip_element (a_child_element, a_position_table) then
						should_remove := True
					else
						preprocess_element (a_child_element, a_position_table)
					end
				end
				if should_remove then
					a_cursor.remove
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Implementation

	should_strip_element (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): BOOLEAN
			-- Does `an_element' contain an "if" attribute which evaluates
			-- to false or an "unless" attribute which evaluates to true?
		require
			an_element_not_void: an_element /= Void
		local
			an_expression: detachable STRING
			is_if: BOOLEAN
		do
			if attached an_element.attribute_by_name (uc_if) as l_if_attribute then
				an_expression := l_if_attribute.value
				is_if := True
			elseif attached an_element.attribute_by_name (uc_unless) as l_unless_attribute then
				an_expression := l_unless_attribute.value
			end

			if an_expression /= Void then
				if is_valid_expression (an_expression) then
					Result := is_expression_true (an_expression)
					if is_if then
						Result := not Result
					end
				else
					error_handler.report_invalid_expression_error (an_expression, an_element.position (a_position_table))
				end
			end
		end

	is_valid_expression (a_string: STRING): BOOLEAN
			-- Is expression `a_string' valid according to the syntax
			-- rules of expressions in "if" and "unless" expresssions?
		require
			a_string_not_void: a_string /= Void
		local
			an_equal_occurrences: INTEGER
		do
			Result := True
			an_equal_occurrences := a_string.occurrences ('=')
			if an_equal_occurrences = 1 then
				-- expression is a comparsion of two constants or variables
			elseif an_equal_occurrences = 0 then
				-- expression is a variable
				if a_string.count > 1 and then a_string.item (1) = '$' then
					if a_string.item (2) = '{' then
						if not (a_string.count > 3 and then a_string.item (a_string.count) = '}') then
							-- missing closing curly brace
							Result := False
						end
					end
				else
					-- non-comparing expression must be variable name
					Result := False
				end
			else
				-- At most one equal sign per expression allowed
				Result := False
			end
		end

	is_expression_true (a_string: STRING): BOOLEAN
			-- Does the expression `a_string' evaluate to `True'?
			-- Use `variables' to look up the values of variables
			-- occurring in `a_string'.
		require
			a_string_not_void: a_string /= Void
			is_valid_expression: is_valid_expression (a_string)
		local
			a_left_side: STRING
			a_right_side: STRING
			a_variable_name: STRING
			equal_index: INTEGER
		do
			if a_string.occurrences ('=') > 0 then
				-- expression is a comparison of two constants or variables
				equal_index := a_string.index_of ('=', 1)
				if equal_index = 1 then
					a_left_side := STRING_.new_empty_string (a_string, 0)
				else
					a_left_side := template_expander.expand_from_values (a_string.substring (1, equal_index - 1), variables)
				end
				if a_string.count > equal_index then
					a_right_side := template_expander.expand_from_values (a_string.substring (equal_index + 1, a_string.count), variables)
				else
					a_right_side := STRING_.new_empty_string (a_string, 0)
				end
				Result := STRING_.same_string (a_right_side, a_left_side)
			else
				-- expression is a variable
				if a_string.count > 1 and then a_string.item (1) = '$' then
					if a_string.item (2) = '{' then
						if a_string.count > 3 and then a_string.item (a_string.count) = '}' then
							-- variable is of the form: ${FOO}
							a_variable_name := a_string.substring (3, a_string.count - 1)
							Result := variables.value (a_variable_name) /= Void
						end
					else
						-- variable is of the form: $FOO
						a_variable_name := a_string.substring (2, a_string.count)
						Result := variables.value (a_variable_name) /= Void
					end
				end
			end
		end

	expand_attribute_variables (a_composite: XM_COMPOSITE)
			-- Replace all variables with their values in all
			-- attributes of `a_composite'.
			-- Use `variables' to look up the values of all variables
			-- that occur in the attributes.
		require
			a_composite_not_void: a_composite /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_string: STRING
		do
			a_cursor := a_composite.new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as an_attribute then
					a_string := template_expander.expand_from_values (an_attribute.value, variables)
					an_attribute.set_value (a_string)
				end
				a_cursor.forth
			end
		end

invariant

	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void

end
