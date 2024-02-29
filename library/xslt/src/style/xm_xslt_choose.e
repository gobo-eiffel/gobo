note

	description:

		"xsl:choose element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_CHOOSE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, mark_tail_calls
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status setting

	mark_tail_calls
			-- Mark tail-recursive calls on templates and functions.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				if attached {XM_XSLT_STYLE_ELEMENT} an_iterator.item as a_style_element then
					a_style_element.mark_tail_calls
				end
				an_iterator.forth
			end
		end

feature -- Element change

	prepare_attributes
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
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
					check_unknown_attribute (a_name_code)
					a_cursor.forth
				variant
					l_attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			attributes_prepared := True
		end

	validate
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_within_template
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				any_compile_errors or else a_child_iterator.after
			loop
				if attached {XM_XSLT_WHEN} a_child_iterator.item then
					if otherwise /= Void then
						create an_error.make_from_string ("xsl:otherwise must be immediately within xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
					number_of_whens := number_of_whens + 1
				else
					if attached {XM_XSLT_OTHERWISE} a_child_iterator.item as an_otherwise then
						if otherwise /= Void then
							create an_error.make_from_string ("Only one xsl:otherwise is allowed within an xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
							report_compile_error (an_error)
						else
							otherwise := an_otherwise
						end
					elseif a_child_iterator.item.node_type = Text_node and then not is_all_whitespace (a_child_iterator.item.string_value) then
						create an_error.make_from_string ("Text node is not allowed inside xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					else
						create an_error.make_from_string ("Only xsl:when and xsl:otherwise are allowed within an xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
				end
				a_child_iterator.forth
			end
			if number_of_whens = 0 then
				create an_error.make_from_string ("xsl:choose must contain at least one xsl:when", Xpath_errors_uri, "XTSE0010", Static_error)
				report_compile_error (an_error)
			end
			validated := True
		end

	compile (an_executable: XM_XSLT_EXECUTABLE)
			-- Compile `Current' to an excutable instruction.
		local
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_condition: XM_XPATH_EXPRESSION
			l_action: detachable XM_XPATH_EXPRESSION
			l_trace_wrapper: XM_XSLT_TRACE_WRAPPER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			top_stylesheet := principal_stylesheet
			compiled_actions_count := number_of_whens
			if otherwise /= Void then
				compiled_actions_count := compiled_actions_count + 1
			end
			create compiled_conditions.make (compiled_actions_count)
			create compiled_actions.make (compiled_actions_count)
			from
				compiled_actions_count := 0
				l_child_iterator := new_axis_iterator (Child_axis); l_child_iterator.start
			until
				has_compile_loop_finished or else l_child_iterator.after
			loop
				if attached {XM_XSLT_WHEN} l_child_iterator.item as l_when then
					compile_when (an_executable, l_when)
				else
					check
						otherwise: attached {XM_XSLT_OTHERWISE} l_child_iterator.item as l_otherwise
						-- validation has already checked for this
					then
						compiled_actions_count := compiled_actions_count + 1
						create {XM_XPATH_BOOLEAN_VALUE} l_condition.make (True)
						check attached compiled_conditions as l_compiled_conditions then
							l_compiled_conditions.put_last (l_condition)
						end
						compile_sequence_constructor (an_executable, l_otherwise.new_axis_iterator (Child_axis), True)
						l_action := last_generated_expression
						if l_action = Void then
							create {XM_XPATH_EMPTY_SEQUENCE} l_action.make
						end
						create l_replacement.make (Void)
						l_action.simplify (l_replacement)
						check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
							l_action := l_replacement_item
						end
						if attached l_action.error_value as l_error_value then
							check is_error: l_action.is_error end
							report_compile_error (l_error_value)
						else
							if configuration.is_tracing then
								l_trace_wrapper := new_trace_wrapper (l_action, an_executable, l_otherwise)
								l_trace_wrapper.set_parent (l_otherwise)
								l_action := l_trace_wrapper
							end
							check attached compiled_actions as l_compiled_actions then
								l_compiled_actions.put_last (l_action)
							end
							has_compile_loop_finished := True
						end
					end
				end
				if not has_compile_loop_finished then l_child_iterator.forth end
			end
			if compiled_actions_count = 0 then
				last_generated_expression := Void
			elseif compiled_actions_count = 1 then
				check attached compiled_conditions as l_compiled_conditions then
					if l_compiled_conditions.item (1).is_boolean_value then
						if l_compiled_conditions.item (1).as_boolean_value.value then

							-- only one condition left, and it's known to be true: return the corresponding action

							check attached compiled_actions as l_compiled_actions then
								last_generated_expression := l_compiled_actions.item (1)
							end
						else

							-- but if it's false, return a no-op

							last_generated_expression := Void
						end
					else
						check attached compiled_actions as l_compiled_actions then
							create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, l_compiled_conditions, l_compiled_actions)
						end
					end
				end
			else
				check
					attached compiled_conditions as l_compiled_conditions
					attached compiled_actions as l_compiled_actions
				then
					create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, l_compiled_conditions, l_compiled_actions)
				end
			end
		end


feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature {NONE} -- Implementation

	otherwise: detachable XM_XSLT_OTHERWISE
			-- Otherwise clause

	number_of_whens: INTEGER
			-- Number of when clauses

	compiled_actions_count: INTEGER
			-- Number of when's + otherwise that are actually compiled

	has_compile_loop_finished: BOOLEAN
			-- Communication flag between `compile' and `compile_when'

	top_stylesheet: detachable XM_XSLT_STYLESHEET
			-- Prinicpal stylesheet

	compiled_conditions: detachable DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			--	Conditions present in compiled instruction

	compiled_actions: detachable DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actions present in compiled instruction

	compile_when (an_executable: XM_XSLT_EXECUTABLE; l_when: XM_XSLT_WHEN)
			-- Compile when clause.
		require
			executable_not_void: an_executable /= Void
			when_clause_not_void: l_when /= Void
		local
			l_condition: XM_XPATH_EXPRESSION
			l_action: detachable XM_XPATH_EXPRESSION
			l_trace_wrapper: XM_XSLT_TRACE_WRAPPER
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			check attached l_when.condition as l_when_condition then
				l_condition := l_when_condition
			end
			compile_sequence_constructor (an_executable, l_when.new_axis_iterator (Child_axis), True)
			l_action := last_generated_expression
			if l_action = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} l_action.make
			end
			create l_replacement.make (Void)
			l_action.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				l_action := l_replacement_item
			end
			if attached l_action.error_value as l_error_value then
				check is_error: l_action.is_error end
				report_compile_error (l_error_value)
			else
				if configuration.is_tracing then
					l_trace_wrapper := new_trace_wrapper (l_action, an_executable, l_when)
					l_trace_wrapper.set_parent (l_when)
					l_action := l_trace_wrapper
				end

				-- Optimize for constant conditions (true or false)

				if l_condition.is_boolean_value then
					if l_condition.as_boolean_value.value then
						compiled_actions_count := compiled_actions_count + 1
						check attached compiled_conditions as l_compiled_conditions then
							l_compiled_conditions.put_last (l_condition)
						end
						check attached compiled_actions as l_compiled_actions then
							l_compiled_actions.put_last (l_action)
						end
						has_compile_loop_finished := True
					else

						--  constant false: omit this test

					end
				else
					compiled_actions_count := compiled_actions_count + 1
					check attached compiled_conditions as l_compiled_conditions then
						l_compiled_conditions.put_last (l_condition)
					end
					check attached compiled_actions as l_compiled_actions then
						l_compiled_actions.put_last (l_action)
					end
				end
			end
		end

end
