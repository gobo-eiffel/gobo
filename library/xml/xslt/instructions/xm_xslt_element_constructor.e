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

	validation_action: INTEGER
			-- Validation action

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER is
			-- Name code
		require
			context_not_void: a_context /= Void
		deferred
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := False
			todo ("same_expression", True)
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

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_name_code: INTEGER
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver, a_saved_receiver: XM_XSLT_SEQUENCE_RECEIVER
			a_validator: XM_XPATH_RECEIVER
		do
			a_name_code := name_code (a_context)
			if a_name_code = -1 then

				-- XSLT recovery action when the computed name is invalid

				skip_element (a_context)
				last_tail_call := Void
			else
				a_transformer := a_context.transformer
				a_receiver := a_transformer.current_receiver
				a_validator := a_transformer.configuration.element_validator (a_receiver, a_name_code, Void, validation_action, Void)
				if a_validator /= a_receiver then
					check
						schema_aware: False
						-- Only Basic XSLT processor is supported now
					end
				end
				a_receiver.start_element (a_name_code, -1, 0)

				-- Output the required namespace nodes via a call-back

				output_namespace_nodes (a_context, a_validator)
				if not a_transformer.is_error then

					-- Apply the content of any attribute sets mentioned in use-attribute-sets.
					todo ("process_leaving_tail - use-attribute-sets", True)

					process_children (a_context)

					if not a_transformer.is_error then
						
						-- Output the element end tag (which will fail if validation fails)

						a_validator.end_element
					end
				end
				if a_saved_receiver /= void then
					todo ("process_leaving_tail - saved receiver", True)
				end
			end
			last_tail_call := Void
		end

	skip_element (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Take recovery action when the element name is invalid.
			-- We need to tell the receiver about this,
			--  so that it can ignore attributes in the content
		require
			context_not_void: a_context /= Void
		do

			-- Sending a namecode of -1 to the receiver is a special signal to ignore
			--  this element and the attributes that follow it

			a_context.transformer.current_receiver.start_element (-1, 0, 0)
			process_children (a_context)

			-- Note, we don't bother with an end_element call.
			
		end

feature {XM_XSLT_ELEMENT_CREATOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER) is
			-- Output namespace nodes for the new element.
		require
			context_not_void: a_context /= Void
			receiver_not_void: a_receiver /= Void
		deferred
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		do
			create Result.make (0)
			Result.set_equality_tester (expression_tester)
		end

feature {NONE} -- Implementation

	type: XM_XPATH_SCHEMA_TYPE

invariant

	validation_action: validation_action >= Validation_strict  and then Validation_strip <= validation_action
end
	
