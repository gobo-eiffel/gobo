indexing

	description:

		"Compiled xsl:processing-instructions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
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
			merge_dependencies (name)
		end

feature -- Optimization

	type_check (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type checking
		local
			l_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_required_type: XM_XPATH_SEQUENCE_TYPE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			name.check_static_type (l_replacement, a_context, a_context_item_type)
			set_name (l_replacement.item)
			if name.is_error then
				set_replacement (a_replacement, name)
			else
				create l_required_type.make_single_string
				create l_role.make (Instruction_role, "processing-instruction:name", 1, Xpath_errors_uri, "XPTY0004")
				create l_type_checker
				l_type_checker.static_type_check (a_context, name, l_required_type, False, l_role)
				if l_type_checker.is_static_type_check_error then
				 set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_name (l_type_checker.checked_expression)
				end
			end
		end

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]		
		do
			create l_replacement.make (Void)
			name.simplify (l_replacement)
			set_name (l_replacement.item)
			if name.is_error then
				set_replacement (a_replacement, name)
			else
				Precursor (a_replacement)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			name.promote (l_replacement, a_offer)
			set_name (l_replacement.item)
			Precursor (a_offer)
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			evaluate_name (a_context)
			if not is_error then
				expand_children (a_context)
				if not is_error then
					check_content (last_string_value, a_context)
					a_context.current_receiver.notify_processing_instruction (evaluated_name, last_string_value, 0)
				end
			else
				a_context.report_fatal_error (error_value)
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	name: XM_XPATH_EXPRESSION
			-- Name

	evaluated_name: STRING
			-- Result of calling `evaluate_name'

	set_name (a_name: XM_XPATH_EXPRESSION) is
			-- Ensure `name' = `a_name'.
		do
			if name /= a_name then
				name := a_name
				if name /= Void then
					adopt_child_expression (name)
					reset_static_properties
				end
			end
		ensure
			set: name = a_name
		end

	check_content (a_content: STRING; a_context: XM_XPATH_CONTEXT) is
			-- Check and possibly modify `a_content' for conformance to node kind.
		do
			last_string_value := STRING_.replaced_all_substrings (a_content, "?>", "? >")
		end

	evaluate_name_code (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name code.
		do
			evaluate_name (a_context)
			if not is_error then
				if not shared_name_pool.is_name_code_allocated ("", "", evaluated_name) then
					shared_name_pool.allocate_name ("", "", evaluated_name)
					last_name_code := shared_name_pool.last_name_code
				else
					last_name_code := shared_name_pool.name_code ("", "", evaluated_name)
				end
			else
				a_context.report_fatal_error (error_value)
			end
		end

	evaluate_name (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate name of PI.
		require
			a_context_not_void: a_context /= Void
			no_error: not is_error
		local
			l_message: STRING
		do
			name.evaluate_as_string (a_context)
			if name.last_evaluated_string.is_error then
				set_last_error (name.last_evaluated_string.error_value)
			else
				evaluated_name := name.last_evaluated_string.string_value
				if not is_ncname (evaluated_name) then
					l_message := STRING_.concat ("Invalid processing instruction name ", evaluated_name)
					set_last_error_from_string (l_message, Xpath_errors_uri, "XTDE0890", Dynamic_error)
				elseif STRING_.same_case_insensitive (Xml_prefix, evaluated_name) then
					set_last_error_from_string ("Processing instructions cannot be named 'xml' in any combination of upper/lower case", Xpath_errors_uri, "XTDE0890", Dynamic_error)
				end
			end
		ensure
			no_error_implies_evaluated_name_not_void: not is_error implies evaluated_name /= Void
		end

invariant

	name_not_void: initialized implies name /= Void
	
end
	
