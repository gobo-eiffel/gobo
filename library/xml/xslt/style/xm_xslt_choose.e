indexing

	description:

		"xsl:choose element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_CHOOSE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			validate, returned_item_type, mark_tail_calls
		end

create {XM_XSLT_NODE_FACTORY}

	make_style_element

feature -- Status setting

	mark_tail_calls is
			-- Mark tail-recursive calls on templates and functions.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.after
			loop
				a_style_element ?= an_iterator.item
				if a_style_element /= Void then
					a_style_element.mark_tail_calls
				end
				an_iterator.forth
			end
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
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
					check_unknown_attribute (a_name_code)
					a_cursor.forth
				variant
					attribute_collection.number_of_attributes + 1 - a_cursor.index
				end
			end
			attributes_prepared := True
		end

	validate is
			-- Check that the stylesheet element is valid.
		local
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			an_xsl_when: XM_XSLT_WHEN
			an_otherwise: XM_XSLT_OTHERWISE
			an_error: XM_XPATH_ERROR_VALUE
		do
			check_within_template
			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				any_compile_errors or else a_child_iterator.after
			loop
				an_xsl_when ?= a_child_iterator.item
				if an_xsl_when /= Void then
					if otherwise /= Void then
						create an_error.make_from_string ("xsl:otherwise must be immediately within xsl:choose", Xpath_errors_uri, "XTSE0010", Static_error)
						report_compile_error (an_error)
					end
					number_of_whens := number_of_whens + 1
				else
					an_otherwise ?= a_child_iterator.item
					if an_otherwise /= Void then
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

	compile (an_executable: XM_XSLT_EXECUTABLE) is
			-- Compile `Current' to an excutable instruction.
		local
			l_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_when: XM_XSLT_WHEN
			l_otherwise: XM_XSLT_OTHERWISE
			l_condition: XM_XPATH_EXPRESSION
			l_action: XM_XPATH_EXPRESSION
			l_trace_wrapper: XM_XSLT_TRACE_WRAPPER
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
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
				l_when ?= l_child_iterator.item
				if l_when /= Void then
					compile_when (an_executable, l_when)
				else
					l_otherwise ?= l_child_iterator.item
					check
						otherwise: l_otherwise /= Void
						-- validation has already checked for this
					end
					compiled_actions_count := compiled_actions_count + 1
					create {XM_XPATH_BOOLEAN_VALUE} l_condition.make (True)
					compiled_conditions.put_last (l_condition)
					compile_sequence_constructor (an_executable, l_otherwise.new_axis_iterator (Child_axis), True)
					l_action := last_generated_expression
					if l_action = Void then
						create {XM_XPATH_EMPTY_SEQUENCE} l_action.make
					end
					create l_replacement.make (Void)
					l_action.simplify (l_replacement)
					l_action := l_replacement.item
					if l_action.is_error then
						report_compile_error (l_action.error_value)
					else
						if configuration.is_tracing then
							l_trace_wrapper := new_trace_wrapper (l_action, an_executable, l_otherwise)
							l_trace_wrapper.set_parent (l_otherwise)
							l_action := l_trace_wrapper
						end
						compiled_actions.put_last (l_action)
						has_compile_loop_finished := True
					end
				end
				if not has_compile_loop_finished then l_child_iterator.forth end
			end
			if compiled_actions_count = 0 then
				last_generated_expression := Void
			elseif compiled_actions_count = 1 then
				if compiled_conditions.item (1).is_boolean_value then
					if compiled_conditions.item (1).as_boolean_value.value then

						-- only one condition left, and it's known to be true: return the corresponding action

						last_generated_expression := compiled_actions.item (1)
					else

						-- but if it's false, return a no-op

						last_generated_expression := Void
					end
				else
					create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, compiled_conditions, compiled_actions)
				end
			else
				create {XM_XSLT_COMPILED_CHOOSE} last_generated_expression.make (an_executable, compiled_conditions, compiled_actions)
			end
		end


feature {XM_XSLT_STYLE_ELEMENT} -- Restricted

	returned_item_type: XM_XPATH_ITEM_TYPE is
			-- Type of item returned by this instruction
		do
			Result := common_child_item_type
		end

feature {NONE} -- Implementation

	otherwise: XM_XSLT_OTHERWISE
			-- Otherwise clause

	number_of_whens: INTEGER
			-- Number of when clauses

	compiled_actions_count: INTEGER
			-- Number of when's + otherwise that are actually compiled

	has_compile_loop_finished: BOOLEAN
			-- Communication flag between `compile' and `compile_when'

	top_stylesheet:XM_XSLT_STYLESHEET
			-- Prinicpal stylesheet

	compiled_conditions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			--	Conditions present in compiled instruction

	compiled_actions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Actions present in compiled instruction

	compile_when (an_executable: XM_XSLT_EXECUTABLE; l_when: XM_XSLT_WHEN) is
			-- Compile when clause.
		require
			executable_not_void: an_executable /= Void
			when_clause_not_void: l_when /= Void
		local
			l_condition, l_action: XM_XPATH_EXPRESSION
			l_trace_wrapper: XM_XSLT_TRACE_WRAPPER
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			l_condition := l_when.condition
			compile_sequence_constructor (an_executable, l_when.new_axis_iterator (Child_axis), True)
			l_action := last_generated_expression
			if l_action = Void then
				create {XM_XPATH_EMPTY_SEQUENCE} l_action.make
			end
			create l_replacement.make (Void)
			l_action.simplify (l_replacement)
			l_action := l_replacement.item
			if l_action.is_error then
				report_compile_error (l_action.error_value)
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
						compiled_conditions.put_last (l_condition)
						compiled_actions.put_last (l_action)
						has_compile_loop_finished := True
					else

						--  constant false: omit this test

					end
				else
					compiled_actions_count := compiled_actions_count + 1
					compiled_conditions.put_last (l_condition)
					compiled_actions.put_last (l_action)
				end
			end
		end

end
