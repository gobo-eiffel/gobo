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

	XM_XSLT_INSTRUCTION
		redefine
			system_id, compute_cardinality,
			evaluate_item, iterator, item_type, compute_dependencies,
			creates_new_nodes, sub_expressions
		end

	-- TODO - this entire class needs re-thinking - it can't work at present

creation

	make

feature {NONE} -- Initialization

	make (a_child: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			base_expression_not_void: a_child /= Void
			-- TODO: executable not set, and line number et al
		do
			child := a_child; adopt_child_expression (child)
			compute_special_properties
			initialize
			create properties.make_with_equality_testers (3, string_equality_tester, string_equality_tester)
		end

feature -- Access
	
	instruction_name: STRING is
			-- Name of instruction, for diagnostics
		do
	--		Result := child.instruction_name
		end

	system_id: STRING is
			--  SYSTEM id
		do
--			Result := child.system_id
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := child.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (child, 1)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
		--	set_dependencies (child)
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			child.simplify
			if child.was_expression_replaced then
				child := child.replacement_expression; adopt_child_expression (child)
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		do
			child.analyze (a_context)
			if child.was_expression_replaced then
				child := child.replacement_expression; adopt_child_expression (child)
			end
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
			--children.item (1).process_leaving_tail (a_context)
			--last_tail_call := children.item (1).last_tail_call
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_exit (details)
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_transformer: XM_XSLT_TRANSFORMER
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- this is XSLT
			end
			a_transformer := an_evaluation_context.transformer
			if a_transformer.is_tracing then
				if details = Void then generate_details end
				a_transformer.trace_listener.trace_instruction_entry (details)
			end
			child.evaluate_item (a_context)
			last_evaluated_item := child.last_evaluated_item
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_exit (details)
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_transformer: XM_XSLT_TRANSFORMER
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context: an_evaluation_context /= Void
				-- this is XSLT
			end
			a_transformer := an_evaluation_context.transformer
			if a_transformer.is_tracing then
				if details = Void then generate_details end
				a_transformer.trace_listener.trace_instruction_entry (details)
			end
			Result := child.iterator (a_context)
			last_evaluated_item := child.last_evaluated_item
			if a_transformer.is_tracing then
				a_transformer.trace_listener.trace_instruction_exit (details)
			end
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

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
--			set_cardinality (child)
		end

feature {NONE} -- Implementation

	child: XM_XPATH_EXPRESSION
			-- Instruction to be traced

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
	child_not_void: child /= Void

end
	
