indexing

	description:

		"Compiled xsl:processing-instructions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_PROCESSING_INSTRUCTION

inherit

	XM_XSLT_TEXT_CONSTRUCTOR
		redefine
			promote_instruction, display, item_type, compute_cardinality,
			compute_dependencies, sub_expressions, check_content,
			evaluate_name_code, simplify
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: a_name /= Void
		do
			executable := an_executable
			name := a_name;  adopt_child_expression (name)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_set: name = a_name
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := processing_instruction_node_kind_test
		end

	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then Result.put_last (select_expression) end
			Result.put_last (name)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "xsl:processing-instruction"))
			std.error.put_new_line
			name.display (a_level + 1)
			Precursor (a_level + 1)
		end
	
feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
			Precursor
			merge_dependencies (name.dependencies)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_required_type: XM_XPATH_SEQUENCE_TYPE
		do
			name.check_static_type (a_context, a_context_item_type)
			if name.was_expression_replaced then
				name := name.replacement_expression
			end
			create a_required_type.make_single_string
			create a_role.make (Instruction_role, "processing-instruction:name", 1, Xpath_errors_uri, "XPTY0004")
			create a_type_checker
			a_type_checker.static_type_check (a_context, name, a_required_type, False, a_role)
			if a_type_checker.is_static_type_check_error then
				name.set_last_error (a_type_checker.static_type_check_error)
			else
				name := a_type_checker.checked_expression; adopt_child_expression (name)
			end			
		end

	simplify is
			-- Perform context-independent static optimizations
		do
			name.simplify
			if name.was_expression_replaced then
				name := name.replacement_expression;  adopt_child_expression (name)
			end
			Precursor
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			name.promote (an_offer)
			if name.was_expression_replaced then
				name := name.replacement_expression;  adopt_child_expression (name)
			end
			Precursor (an_offer)
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
			-- TODOevaluate_name (a_context)
			last_tail_call := Void
		end

feature {NONE} -- Implementation

	name: XM_XPATH_EXPRESSION
			-- Name

	check_content (a_content: STRING; a_context: XM_XPATH_CONTEXT) is
			-- Check and possibly modify `a_content' for conformance to node kind.
		do
			todo ("check_content", False)
		end

	evaluate_name_code (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name code.
		do
			todo ("evaluate_name_code", False)
		end

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

invariant

	name_not_void: initialized implies name /= Void
	
end
	
