indexing

	description:

		"Objects that wrap another instruction for tracing purposes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TRACE_INSTRUCTION

inherit

	XM_XSLT_EXPRESSION_INSTRUCTION
		redefine
			system_id, simplify, analyze,
			evaluate_item, iterator
		end

creation

	make

feature {NONE} -- Initialization

	make (an_instruction: XM_XSLT_INSTRUCTION) is
			-- Establish invariant.
		require
			base_instruction_not_void: an_instruction /= Void
		local
			a_sub_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]			
		do
			executable := an_instruction.executable
			line_number := an_instruction.line_number
			create children.make (1)
			children.put (an_instruction, 1)
			initialize_special_properties
			initialize_dependencies
			initialize_intrinsic_dependencies
			set_cardinality_zero_or_more
			from
				a_list := sub_expressions
				a_cursor := a_list.new_cursor
				a_cursor.start
			variant
				a_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_sub_expression := a_cursor.item
				merge_dependencies (a_sub_expression.dependencies)
				a_cursor.forth
			end
			create properties.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
		end

feature -- Access
	
	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
			Result := children.item (1).instruction_name
		end

	system_id: STRING is
			--  SYSTEM id
		do
			Result := children.item (1).system_id
		end
	
feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			todo ("simplify", False)
		end

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

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
		do
			a_transformer := a_context.transformer
			if a_transformer.is_tracing then
				if details = Void then generate_details end
				a_transformer.trace_listener.trace_instruction_entry (details)
			end
			children.item (1).process_leaving_tail (a_context)
			last_tail_call := children.item (1).last_tail_call
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_exit (details)
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		do
			todo ("evaluate_item", False)
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			todo ("iterator", False)
		end

feature -- Element change

	add_property (a_value, a_name: STRING) is
			-- Add an additional trce property.
		require
			property_name_not_void: a_name /= Void
			property_value_not_void: a_value /= Void
		do
			properties.force (a_value, a_name)
		ensure
			property_set: properties.has (a_name) and then STRING_.same_string (properties.item (a_name), a_value)
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction;
		local
			an_expression_instruction: XM_XSLT_EXPRESSION_INSTRUCTION
		do
			an_expression_instruction ?= children.item (1)
			if an_expression_instruction /= Void then
				Result := an_expression_instruction.xpath_expressions (an_instruction_list)
			else
				create Result.make (0)
				Result.set_equality_tester (expression_tester)
			end
		end
	
feature {NONE} -- Implementation

	properties: DS_HASH_TABLE [STRING, STRING]
			-- Additional trace properties

	details: XM_XSLT_TRACE_DETAILS
			-- Trace details

	generate_details is
			-- Generate trace details.
		require
			trace_details_not_yet_generated: details = Void
		do
			create details.make (instruction_name, system_id, line_number, properties)
		ensure
			trace_details_generated: details /= Void
		end

invariant

	trace_properties_not_void: properties /= Void
	excatly_one_child: children.count = 1

end
	
