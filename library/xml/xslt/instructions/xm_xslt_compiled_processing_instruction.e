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
			xpath_expressions, promote_instruction, display, item_type
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS

	XM_XPATH_ROLE

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			name_not_void: a_name /= Void
		do
			executable := an_executable
			instruction_name := "processing-instruction"
			create children.make (0)
			make_expression_instruction
			set_cardinality_exactly_one
			name := a_name
			merge_dependencies (name.dependencies)
		ensure
			executable_set: executable = an_executable
			name_set: name = a_name
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := processing_instruction_node_kind_test
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
			std.error.put_string (STRING_.appended_string (indentation (a_level), "processing-instruction"))
			std.error.put_new_line
			name.display (a_level + 1)
			Precursor (a_level + 1)
		end

feature -- Optimization

	type_check (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type checking
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			a_required_type: XM_XPATH_SEQUENCE_TYPE
		do
			name.analyze (a_context)
			if name.was_expression_replaced then
				name := name.replacement_expression
			end
			create a_required_type.make_single_string
			create a_role.make (Instruction_role, "processing-instruction:name", 1)
			create a_type_checker
			a_type_checker.static_type_check (a_context, name, a_required_type, False, a_role)
			if a_type_checker.is_static_type_check_error then
				name. set_last_error_from_string (a_type_checker.static_type_check_error_message, "XT0320", Type_error)
			else
				name := a_type_checker.checked_expression
			end			
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
			todo ("process_leaving_tail", False)
			last_tail_call := Void
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		do
			Result := Precursor (an_instruction_list)
			Result.force_last (name)
		end
	
feature {NONE} -- Implementation

	name: XM_XPATH_EXPRESSION
			-- Name

	-- TODO evaluate_name_code needs (re-)defining
invariant

	name_not_void: name /= Void
	
end
	
