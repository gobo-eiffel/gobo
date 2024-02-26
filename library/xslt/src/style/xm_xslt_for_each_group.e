note

	description:

		"xsl:for-each-group element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_FOR_EACH_GROUP

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, may_contain_sequence_constructor,
			is_permitted_child, is_for_each_group
		end

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

	XM_XPATH_ROLE

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status report

	may_contain_sequence_constructor: BOOLEAN
			-- Is `Current' allowed to contain a sequence constructor?
		do
			Result := True
		end

	is_permitted_child (a_style_element: XM_XSLT_STYLE_ELEMENT): BOOLEAN
			-- Is `a_style_element' a permitted child of `Current'?
		do
			Result := a_style_element.is_sort
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name, a_select_attribute, a_group_by_attribute, a_group_adjacent_attribute,
			a_group_starting_with_attribute, a_group_ending_with_attribute, a_collation_attribute: detachable STRING
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
					if STRING_.same_string (an_expanded_name, Select_attribute) then
						a_select_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_select_attribute)
						STRING_.right_adjust (a_select_attribute)
					elseif STRING_.same_string (an_expanded_name, Group_by_attribute) then
						a_group_by_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_group_by_attribute)
						STRING_.right_adjust (a_group_by_attribute)
					elseif STRING_.same_string (an_expanded_name, Group_adjacent_attribute) then
						a_group_adjacent_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_group_adjacent_attribute)
						STRING_.right_adjust (a_group_adjacent_attribute		)
					elseif STRING_.same_string (an_expanded_name, Group_starting_with_attribute) then
						a_group_starting_with_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_group_starting_with_attribute)
						STRING_.right_adjust (a_group_starting_with_attribute	)
					elseif STRING_.same_string (an_expanded_name, Group_ending_with_attribute) then
						a_group_ending_with_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_group_ending_with_attribute)
						STRING_.right_adjust (a_group_ending_with_attribute		)
					elseif STRING_.same_string (an_expanded_name, Collation_attribute) then
						a_collation_attribute := attribute_value_by_index (a_cursor.index)
						STRING_.left_adjust (a_collation_attribute)
						STRING_.right_adjust (a_collation_attribute	)
					else
						check_unknown_attribute (a_name_code)
					end
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			prepare_attributes_2 (a_select_attribute, a_group_by_attribute, a_group_starting_with_attribute,
										 a_group_adjacent_attribute,	a_group_ending_with_attribute, a_collation_attribute)
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_atomic_sequence, a_node_sequence: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check_within_template
			check_sort_comes_first (False)
			create l_replacement.make (Void)
			check attached select_expression as l_select_expression then
				type_check_expression (l_replacement, "select", l_select_expression)
			end
			select_expression := l_replacement.item
			if attached group_by as l_group_by then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "group-by", l_group_by)
				group_by := l_replacement.item
				if not any_compile_errors then
					create l_type_checker
					create l_role.make (Instruction_role, "xsl:for-each-group/group-by", 1, Xpath_errors_uri, "XPTY0004")
					create l_atomic_sequence.make_atomic_sequence
					check attached group_by as l_group_by_2 then
						l_type_checker.static_type_check (static_context, l_group_by_2, l_atomic_sequence, False, l_role)
					end
					if l_type_checker.is_static_type_check_error	then
						check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
							report_compile_error (l_static_type_check_error)
						end
					else
						group_by := l_type_checker.checked_expression
					end
				end
			end
			if attached group_adjacent as l_group_adjacent then
				l_replacement.put (Void)
				type_check_expression (l_replacement, "group-adjacent", l_group_adjacent)
				group_adjacent := l_replacement.item
				if not any_compile_errors then
					create l_type_checker
					create l_role.make (Instruction_role, "xsl:for-each-group/group-adjacent", 1, Xpath_errors_uri, "XTTE1100")
					create l_atomic_sequence.make_single_atomic
					check attached group_adjacent as l_group_adjacent_2 then
						l_type_checker.static_type_check (static_context, l_group_adjacent_2, l_atomic_sequence, False, l_role)
					end
					if l_type_checker.is_static_type_check_error	then
						check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
							report_compile_error (l_static_type_check_error)
						end
					else
						group_adjacent := l_type_checker.checked_expression
					end
				end
			end
			if attached group_starting_with as l_group_starting_with then
				type_check_pattern ("group-starting-with", l_group_starting_with)
			end
			if attached group_ending_with as l_group_ending_with then
				type_check_pattern ("group-ending-with", l_group_ending_with)
			end
			if group_starting_with /= Void or group_ending_with /= Void then
				create l_type_checker
				create l_role.make (Instruction_role, "xsl:for-each-group/select", 1, Xpath_errors_uri, "XTTE1120")
				create a_node_sequence.make_node_sequence
				check attached select_expression as l_select_expression then
					l_type_checker.static_type_check (static_context, l_select_expression, a_node_sequence, False, l_role)
				end
				if l_type_checker.is_static_type_check_error	then
					check postcondition_of_static_type_check: attached l_type_checker.static_type_check_error as l_static_type_check_error then
						report_compile_error (l_static_type_check_error)
					end
				end
			end
			validated := True
		end

	compile (a_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_algorithm: INTEGER
			l_key, l_action: detachable XM_XPATH_EXPRESSION
			l_key_pattern: detachable XM_XSLT_PATTERN
			l_pattern: BOOLEAN
		do
			assemble_sort_keys
			if not any_compile_errors then
				if group_by /= Void then
					l_algorithm := Group_by_algorithm
					l_key := group_by
				elseif group_adjacent /= Void then
					l_algorithm := Group_adjacent_algorithm
					l_key := group_adjacent
				elseif group_starting_with /= Void then
					l_algorithm := Group_starting_with_algorithm
					-- TODO: create l_key_pattern.make (group_starting_with)
					l_key_pattern := group_starting_with
					l_pattern := True
				elseif group_ending_with /= Void then
					l_algorithm := Group_ending_with_algorithm
					-- TODO: create l_key_pattern.make (group_ending_with)
					l_key_pattern := group_ending_with
					l_pattern := True
				end
				compile_sequence_constructor (a_executable, new_axis_iterator (Child_axis), True)
				l_action := last_generated_expression
				if l_action = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} l_action.make
				end
				check
					attached select_expression as l_select_expression
					attached sort_keys as l_sort_keys
				then
					if l_pattern then
						check l_key_pattern /= Void then
							create {XM_XSLT_COMPILED_FOR_EACH_GROUP} last_generated_expression.make_pattern (a_executable, l_select_expression, l_action, l_key_pattern, l_algorithm, l_sort_keys, collation_name, default_collation_name)
						end
					else
						check l_key /= Void then
							create {XM_XSLT_COMPILED_FOR_EACH_GROUP} last_generated_expression.make (a_executable, l_select_expression, l_action, l_key, l_algorithm, l_sort_keys, collation_name, default_collation_name)
						end
					end
				end
			end
		end

feature -- Conversion

	is_for_each_group: BOOLEAN
			-- Is `Current' an xsl:for-each-group?
		do
			Result := True
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Population selector

	collation_name: detachable XM_XPATH_EXPRESSION
			-- Name of collation

	group_by: detachable XM_XPATH_EXPRESSION
			-- Group-by expression

	group_adjacent: detachable XM_XPATH_EXPRESSION
			-- Group-ajacent expression

	group_starting_with: detachable XM_XSLT_PATTERN
			-- Group-starting-with pattern

	group_ending_with: detachable XM_XSLT_PATTERN
			-- Group-ending-with pattern

	prepare_attributes_2 (a_select_attribute, a_group_by_attribute, a_group_starting_with_attribute,
								 a_group_adjacent_attribute,	a_group_ending_with_attribute, a_collation_attribute: detachable STRING)
			-- Prepare attributes some more.
		local
			count_of_grouping_attributes: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if a_select_attribute /= Void then
				generate_expression (a_select_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_select_expression then
					select_expression := l_new_select_expression
					if attached l_new_select_expression.error_value as l_error_value then
						check is_error: l_new_select_expression.is_error end
						report_compile_error (l_error_value)
					end
				end
			else
				report_absence ("select")
			end
			if a_collation_attribute /= Void then
				check attached static_context as l_static_context then
					generate_attribute_value_template (a_collation_attribute, l_static_context)
				end
				check postcondition_of_generate_attribute_value_template: attached last_generated_expression as l_new_collation_name then
					collation_name := l_new_collation_name
					if attached l_new_collation_name.error_value as l_error_value then
						check is_error: l_new_collation_name.is_error end
						report_compile_error (l_error_value)
					end
				end
			end

			if a_group_by_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_expression (a_group_by_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_group_by then
					group_by := l_new_group_by
					if attached l_new_group_by.error_value as l_error_value then
						check is_error: l_new_group_by.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_group_adjacent_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_expression (a_group_adjacent_attribute)
				check postcondition_of_generate_expression: attached last_generated_expression as l_new_group_adjacent then
					group_adjacent := l_new_group_adjacent
					if attached l_new_group_adjacent.error_value as l_error_value then
						check is_error: l_new_group_adjacent.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_group_starting_with_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_pattern (a_group_starting_with_attribute)
				check postcondition_of_generate_pattern: attached last_generated_pattern as l_new_group_starting_with then
					group_starting_with := l_new_group_starting_with
					if attached l_new_group_starting_with.error_value as l_error_value then
						check is_error: l_new_group_starting_with.is_error end
						report_compile_error (l_error_value)
					end
				end
			end
			if a_group_ending_with_attribute /= Void then
				count_of_grouping_attributes := count_of_grouping_attributes + 1
				generate_pattern (a_group_ending_with_attribute)
				check postcondition_of_generate_pattern: attached last_generated_pattern as l_new_group_ending_with then
					group_ending_with := l_new_group_ending_with
					if attached l_new_group_ending_with.error_value as l_error_value then
						check is_error: l_new_group_ending_with.is_error end
						report_compile_error (l_error_value)
					end
				end
			end

			if count_of_grouping_attributes /= 1 then
				create an_error.make_from_string ("Exactly one of the attributes group-by, group-adjacent, group-starting-with, and group-ending-with must be specified", Xpath_errors_uri, "XTSE1080", Static_error)
				report_compile_error (an_error)
			end
			if a_collation_attribute /= Void and then a_group_by_attribute = Void and then a_group_adjacent_attribute = Void then
				create an_error.make_from_string ("A collation may be specified only if group-by or group-adjacent is specified", Xpath_errors_uri, "XTSE1090", Static_error)
				report_compile_error (an_error)
			end
		end

invariant

	only_one_algorithm: validated implies group_by /= Void xor group_adjacent /= Void xor group_starting_with /= Void xor group_ending_with /= Void
	collation_name: attributes_prepared and collation_name /= Void and not any_compile_errors implies group_by /= Void xor group_adjacent /= Void

end
