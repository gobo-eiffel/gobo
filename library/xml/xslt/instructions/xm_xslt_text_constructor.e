indexing

	description:

		"Compiled instructions that produce text output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TEXT_CONSTRUCTOR

inherit

	XM_XSLT_EXPRESSION_INSTRUCTION
		redefine
			analyze, evaluate_item
		end

	XM_XPATH_ROLE

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			if select_expression /= Void then
				select_expression.display (a_level, a_pool)
			elseif children.count = 0 then
				a_string := STRING_.appended_string (indentation (a_level), "empty content")
				std.error.put_string (a_string)
				std.error.put_new_line
			else
				display_children (a_level + 1, a_pool)
			end
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		require
			static_context_not_void: a_context /= Void
		deferred
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		local
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_role: XM_XPATH_ROLE_LOCATOR
			a_name: STRING
			a_single_string: XM_XPATH_SEQUENCE_TYPE
			an_expression: XM_XSLT_EXPRESSION_INSTRUCTION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]	
		do
			type_check (a_context)
			if separator_expression /= Void then
				separator_expression.analyze (a_context)
				if separator_expression.was_expression_replaced then
					separator_expression := separator_expression.replacement_expression
				end
				create a_type_checker
				a_name := STRING_.concat ("xsl:", instruction_name)
				create a_role.make (Instruction_role, STRING_.appended_string (a_name, "/separator"), 1)
				create a_single_string.make_single_string
				a_type_checker.static_type_check (a_context, separator_expression, a_single_string, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					set_separator_expression (a_type_checker.checked_expression)
				end				
			end
			if select_expression /= Void then
				select_expression.analyze (a_context)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression
				end
				create a_type_checker
				a_name := STRING_.concat ("xsl:", instruction_name)
				create a_role.make (Instruction_role, STRING_.appended_string (a_name, "/select"), 1)
				create a_single_string.make_single_string
				a_type_checker.static_type_check (a_context, select_expression, a_single_string, False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
				else
					set_select_expression (a_type_checker.checked_expression)
				end
			elseif children.count > 0 then
				from
					a_cursor := children.new_cursor
					a_cursor.start
				variant
					children.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_expression ?= a_cursor.item
					if an_expression /= Void then
						an_expression.analyze (a_context)
						a_cursor.replace (an_expression)
					else
						set_last_error_from_string ("BUG: Children of an XM_XSLT_EXPRESSION_INSTRUCTION must themselves be Expressions", 0, Type_error)
					end
					a_cursor.forth
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			todo ("promote_instruction", False)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
	
		do
			todo ("evaluate_item", False)	
		end

feature -- Element change

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			select_expression_not_void: a_select_expression /= Void
		do
			select_expression := a_select_expression
		ensure
			set: select_expression = a_select_expression
		end

	set_separator_expression (a_separator_expression: XM_XPATH_EXPRESSION) is
			-- Set `separator_expression'.
		require
			separator_expression_not_void: a_separator_expression /= Void
		do
			separator_expression := a_separator_expression
		ensure
			set: separator_expression = a_separator_expression
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		local
			n: INTEGER
			a_string_value: XM_XPATH_STRING_VALUE
		do
			if select_expression /= Void then n := n + 1 end
			if separator_expression /= Void then
				a_string_value ?= separator_expression
				if a_string_value /= Void then
					n := n + 1
				end
			end
			create Result.make (n)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then
				Result.put_last (select_expression)
			end
			if separator_expression /= Void then
				a_string_value ?= separator_expression
				if a_string_value /= Void then
					Result.put_last (separator_expression)
				end
			end
		end

feature {NONE} -- Implementation

	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	separator_expression: XM_XPATH_EXPRESSION
			-- Seperator expression

end
	
