indexing

	description:

		"Compiled instructions that produce element output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ELEMENT_CONSTRUCTOR

inherit

	XM_XSLT_EXPRESSION_INSTRUCTION
		redefine
			analyze, evaluate_item
		end
		
	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XSLT_VALIDATION

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := element_node_kind_test
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
		end

feature -- Status report

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string, another_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "element ")
			std.error.put_string (a_string)
			std.error.put_new_line
			a_string := STRING_.appended_string (indentation (a_level + 1), "name ")
			a_string := STRING_.appended_string (a_string, a_pool.display_name_from_name_code (name_code))
			std.error.put_string (a_string)
			std.error.put_new_line			
			if children.count = 0 then
				a_string := STRING_.appended_string (indentation (a_level + 1), "empty content")
				std.error.put_string (a_string)
				std.error.put_new_line
			else
				display_children (a_level + 1, a_pool)
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		do
			todo ("analyze", False)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			todo ("promote_instruction", False)
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		do
			todo ("evaluate_item", False)
		end

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		do
			create Result.make (0)
			Result.set_equality_tester (expression_tester)
		end

feature {NONE} -- Implementation

	name_code: INTEGER
			-- Name code

	validation_action: INTEGER
			-- Validation action

	type: XM_XPATH_SCHEMA_TYPE

invariant

	validation_action: validation_action >= Validation_strict  and then Validation_strip <= validation_action
end
	
