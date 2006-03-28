indexing

	description: "Objects that represent an xsl:message,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_MESSAGE

inherit
	
	XM_XSLT_INSTRUCTION
		redefine
			promote_instruction, item_type, compute_cardinality,
			creates_new_nodes, sub_expressions
		end

	XM_XSLT_VALIDATION

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_terminate: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			terminate := a_terminate
			adopt_child_expression (terminate)
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			terminate_set: terminate = a_terminate
			select_expression_set: select_expression = a_select_expression
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := empty_item
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
			Result.put (select_expression, 1)
			if terminate /= Void then Result.put (terminate, 2) end
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("xsl:message%N")
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			select_expression.simplify
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			if terminate /= Void then
				terminate.simplify
				if terminate.was_expression_replaced then
					terminate := terminate.replacement_expression
					adopt_child_expression (terminate)
				end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			if terminate /= Void then
				terminate.check_static_type (a_context, a_context_item_type)
				if terminate.was_expression_replaced then
					terminate := terminate.replacement_expression
					adopt_child_expression (terminate)
				end
			end
		end		

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			if terminate /= Void then
				terminate.optimize (a_context, a_context_item_type)
				if terminate.was_expression_replaced then
					terminate := terminate.replacement_expression
					adopt_child_expression (terminate)
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			if terminate /= Void then
				terminate.promote (an_offer)
				if terminate.was_expression_replaced then
					terminate := terminate.replacement_expression
					adopt_child_expression (terminate)
				end
			end
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_message_emitter: XM_XPATH_RECEIVER
			l_outputter: XM_OUTPUT
			l_output_properties: XM_XSLT_OUTPUT_PROPERTIES
			l_tree_receiver: XM_XSLT_TREE_RECEIVER
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_string_value: XM_XPATH_STRING_VALUE
			l_error: XM_XPATH_ERROR_VALUE
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			last_tail_call := Void
			l_transformer := a_context.transformer
			create l_output_properties.make (-1000000)
			create l_outputter
			l_outputter.set_output_standard_error
			l_output_properties.set_omit_xml_declaration (True, -1000000)
			l_message_emitter := l_transformer.new_message_emitter (l_outputter, l_output_properties)
			create l_tree_receiver.make (l_message_emitter)
			l_new_context := a_context.new_minor_context
			create l_result.make_receiver (l_tree_receiver)
			l_new_context.change_output_destination (l_output_properties, l_result, False, Validation_strip, Void)
			select_expression.create_iterator (a_context)
			l_iterator := select_expression.last_iterator
			if not l_iterator.is_error then
				from
					l_iterator.start
				until
					l_iterator.is_error or else l_iterator.after
				loop
					l_tree_receiver.append_item (l_iterator.item)
					l_iterator.forth
				end
			end
			if l_iterator.is_error then
				if not l_iterator.error_value.is_location_known then l_iterator.error_value.set_location (system_id, line_number) end
				l_transformer.report_fatal_error (l_iterator.error_value)
			else
				l_tree_receiver.close
				if terminate /= Void then
					terminate.evaluate_as_string (a_context)
					l_string_value := terminate.last_evaluated_string
					if l_string_value.is_error then
						if not l_string_value.error_value.is_location_known then l_string_value.error_value.set_location (system_id, line_number) end
						l_transformer.report_fatal_error (l_string_value.error_value)
					elseif STRING_.same_string (l_string_value.string_value, "no") then
						-- do_nothing
					elseif STRING_.same_string (l_string_value.string_value, "yes") then
						create l_error.make_from_string ("Execution terminated owing to xsl:message terminate='yes'.", Gexslt_eiffel_type_uri, "TERMINATE_MESSAGE", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					else
						create l_error.make_from_string (STRING_.concat ("xsl:message terminate attribute must evaluate to 'yes' or 'no'. Found: ", l_string_value.string_value),
																	 Gexslt_eiffel_type_uri, "INVALID_TERMINATE", Dynamic_error)
						l_error.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_error)
					end
				end
			end
		end


feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_empty
		end

feature {NONE} -- Implementation

	terminate: XM_XPATH_EXPRESSION
			-- Value of terminate attribute

	select_expression: XM_XPATH_EXPRESSION
			-- Value of select attribute

invariant

	select_expression_not_void: initialized implies select_expression /= Void

end
	
