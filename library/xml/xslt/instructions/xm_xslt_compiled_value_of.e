indexing

	description:

		"Compiled xsl:value-of elements"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_VALUE_OF

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			display, promote_instruction, evaluate_item, item_type
		end

	XM_XPATH_RECEIVER_OPTIONS

	XM_XPATH_SHARED_NODE_KIND_TESTS

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; disabled: BOOLEAN) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			instruction_name := "value-of"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
			select_expression := a_select_expression
			if disabled then
				receiver_options := Disable_escaping
			end
		ensure
			executable_set: executable = an_executable
			select_set: select_expression = a_select_expression
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := text_node_kind_test
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "value-of")
			std.error.put_string (a_string)
			std.error.put_new_line
			select_expression.display (a_level + 1)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		do
			do_nothing
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

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			a_context.transformer.current_receiver.notify_characters (expanded_string_value (a_context), receiver_options)
			last_tail_call := Void
		end


feature {NONE} -- Implementation

	receiver_options: INTEGER
			-- Receiver options

end
	
