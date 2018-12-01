note

	description: "Objects that represent an xsl:message,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
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

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; a_terminate: detachable XM_XPATH_EXPRESSION)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			terminate := a_terminate
			select_expression := a_select_expression
			if a_terminate /= Void then
				adopt_child_expression (a_terminate)
			end
			adopt_child_expression (select_expression)
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			terminate_set: terminate = a_terminate
			select_expression_set: select_expression = a_select_expression
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := empty_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (2)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			if attached terminate as l_terminate then
				Result.put (l_terminate, 2)
			end
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("xsl:message%N")
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				elseif attached terminate as l_old_terminate then
					l_replacement.put (Void)
					l_old_terminate.simplify (l_replacement)
					check postcondition_of_simplify: attached l_replacement.item as l_terminate then
						set_terminate (l_terminate)
						if l_terminate.is_error then
							set_replacement (a_replacement, l_terminate)
						else
							a_replacement.put (Current)
						end
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				elseif attached terminate as l_old_terminate then
					l_replacement.put (Void)
					l_old_terminate.check_static_type (l_replacement, a_context, a_context_item_type)
					check postcondition_of_check_static_type: attached l_replacement.item as l_terminate then
						set_terminate (l_terminate)
						if l_terminate.is_error then
							set_replacement (a_replacement, l_terminate)
						else
							a_replacement.put (Current)
						end
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				set_select_expression (l_replacement_item)
				if select_expression.is_error then
					set_replacement (a_replacement, select_expression)
				elseif attached terminate as l_old_terminate then
					l_replacement.put (Void)
					l_old_terminate.optimize (l_replacement, a_context, a_context_item_type)
					check postcondition_of_optimize: attached l_replacement.item as l_terminate then
						set_terminate (l_terminate)
						if l_terminate.is_error then
							set_replacement (a_replacement, l_terminate)
						else
							a_replacement.put (Current)
						end
					end
				else
					a_replacement.put (Current)
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
--			set_select_expression (l_replacement.item)
			if attached terminate as l_terminate then
				l_replacement.put (Void)
				l_terminate.promote (l_replacement, a_offer)
				set_terminate (l_replacement.item)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_message_emitter: XM_XPATH_RECEIVER
			l_output_properties: XM_XSLT_OUTPUT_PROPERTIES
			l_tree_receiver: XM_XSLT_TREE_RECEIVER
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_string_value: XM_XPATH_STRING_VALUE
			l_error: XM_XPATH_ERROR_VALUE
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_result: XM_XSLT_TRANSFORMATION_RESULT
		do
			check attached a_context.transformer as l_context_transformer then
				l_transformer := l_context_transformer
				create l_output_properties.make (-1000000)
				l_output_properties.set_omit_xml_declaration (True, -1000000)
				l_message_emitter := l_transformer.new_message_emitter (l_output_properties)
				create l_tree_receiver.make (l_message_emitter)
				l_new_context := a_context.new_minor_context
				create l_result.make_receiver (l_tree_receiver)
				l_new_context.change_output_destination (l_output_properties, l_result, False, Validation_strip, Void)
				select_expression.create_iterator (a_context)
				check postcondition_of_create_iterator: attached select_expression.last_iterator as l_last_iterator then
					l_iterator := l_last_iterator
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
					if attached l_iterator.error_value as l_error_value then
						check is_error: l_iterator.is_error end
						if not l_error_value.is_location_known then l_error_value.set_location (system_id, line_number) end
						l_transformer.report_fatal_error (l_error_value)
					else
						l_tree_receiver.close
						if attached terminate as l_terminate then
							l_terminate.evaluate_as_string (a_context)
							check postcondition_of_evaluate_as_string: attached l_terminate.last_evaluated_string as l_last_evaluated_string then
								l_string_value := l_last_evaluated_string
								if attached l_string_value.error_value as l_error_value then
									check is_error: l_string_value.is_error end
									if not l_error_value.is_location_known then l_error_value.set_location (system_id, line_number) end
									l_transformer.report_fatal_error (l_error_value)
								elseif STRING_.same_string (l_string_value.string_value, "no") then
									-- do_nothing
								elseif STRING_.same_string (l_string_value.string_value, "yes") then
									create l_error.make_from_string ("Execution terminated owing to xsl:message terminate='yes'.", Xpath_errors_uri, "XTMM9000", Dynamic_error)
									l_error.set_location (system_id, line_number)
									l_transformer.report_fatal_error (l_error)
								else
									create l_error.make_from_string (STRING_.concat ("xsl:message terminate attribute must evaluate to 'yes' or 'no'. Found: ", l_string_value.string_value),
																				 Xpath_errors_uri, "XTDE0030", Dynamic_error)
									l_error.set_location (system_id, line_number)
									l_transformer.report_fatal_error (l_error)
								end
							end
						end
					end
				end
			end
		end


feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_empty
		end

feature {NONE} -- Implementation

	terminate: detachable XM_XPATH_EXPRESSION
			-- Value of terminate attribute

	select_expression: XM_XPATH_EXPRESSION
			-- Value of select attribute

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION)
			-- Ensure `select_expression' = `a_select_expression'.
		do
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				if attached select_expression as l_select_expression then
					adopt_child_expression (l_select_expression)
					reset_static_properties
				end
			end
		ensure
			set: select_expression = a_select_expression
		end

	set_terminate (a_terminate: detachable XM_XPATH_EXPRESSION)
			-- Ensure `terminate' = `a_terminate'.
		do
			if terminate /= a_terminate then
				terminate := a_terminate
				if attached terminate as l_terminate then
					adopt_child_expression (l_terminate)
					reset_static_properties
				end
			end
		ensure
			set: terminate = a_terminate
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void

end

