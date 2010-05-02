note

	description:

		"Compiled instructions that produce element output"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ELEMENT_CONSTRUCTOR

inherit

	XM_XSLT_ATTRIBUTE_SET_ROUTINES

	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, evaluate_item, item_type, compute_cardinality, compute_special_properties,
			creates_new_nodes, native_implementations, promote_instruction
		end

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_NODE_KIND_ROUTINES
		export {NONE} all end

	XM_XSLT_VALIDATION

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := element_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (content, 1)
		end

	validation_action: INTEGER
			-- Validation action

	name_code (a_context: XM_XSLT_EVALUATION_CONTEXT): INTEGER
			-- Name code
		require
			context_not_void: a_context /= Void
		deferred
		end

	base_uri: STRING
			-- Base URI for constructed element

	new_base_uri (a_context: XM_XPATH_CONTEXT): STRING
			-- Re-calculated base URI
		require
			a_context_not_void: a_context /= Void
		deferred
		ensure
			may_be_empty: Result /= Void
		end

feature -- Status report

	creates_new_nodes: BOOLEAN
			-- Can `Current' create new nodes?
		do
			Result := True
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-free optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if content.is_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (content.error_value))
			else
				create l_replacement.make (Void)
				content.simplify (l_replacement)
				set_content (l_replacement.item)
				if content.is_error then
					set_replacement (a_replacement, content)
				else
					a_replacement.put (Current)
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if content.is_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (content.error_value))
			else
				create l_replacement.make (Void)
				content.check_static_type (l_replacement, a_context, a_context_item_type)
				set_content (l_replacement.item)
				if content.is_error then
					set_replacement (a_replacement, content)
				else
					check_contents_for_attributes (a_replacement, a_context)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if content.is_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (content.error_value))
			else
				create l_replacement.make (Void)
				content.optimize (l_replacement, a_context, a_context_item_type)
				set_content (l_replacement.item)
				if content.is_error then
					set_replacement (a_replacement, content)
				else
					a_replacement.put (Current)
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			content.promote (l_replacement, a_offer)
			set_content (l_replacement.item)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_old_receiver, l_receiver: XM_XPATH_SEQUENCE_RECEIVER
			l_validator: XM_XPATH_RECEIVER
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_outputter: XM_XSLT_SEQUENCE_OUTPUTTER
			l_name_code, l_properties: INTEGER
		do
			l_new_context ?= a_context.new_minor_context
			check
				evaluation_context: l_new_context /= Void
				-- This is XSLT
			end
			l_transformer := l_new_context.transformer
			l_old_receiver := l_new_context.current_receiver
			l_outputter ?= l_old_receiver
			if l_outputter = Void or else l_outputter.is_under_construction then
				create l_outputter.make_with_size (1, l_transformer)
			end
			l_receiver := l_outputter
			l_name_code := name_code (l_new_context)
			if not l_transformer.is_error then
				l_validator := l_transformer.configuration.element_validator (l_receiver, l_name_code, Void, validation_action)
				if l_validator = l_receiver then
					l_new_context.change_to_sequence_output_destination (l_receiver)
					if l_receiver.base_uri.is_empty then
						l_receiver.set_base_uri (new_base_uri (a_context))
					end
				else
					check
						schema_aware: False
						-- Only Basic XSLT processor is supported now
					end
				end
				if not is_inherit_namespaces then l_properties := Disinherit_namespaces end
				-- N.B. The element is constructed as a parentless element
				l_receiver.start_element (l_name_code, -1, l_properties)
				output_namespace_nodes (l_new_context, l_receiver)
				content.generate_events (l_new_context)
				if not l_transformer.is_error then
					l_receiver.end_element
					l_receiver.close
					l_outputter.pop_last_item
					a_result.put (l_outputter.last_popped_item)
				else
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_transformer.last_error))
				end
			end
		end

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_name_code, some_properties: INTEGER
			a_transformer: XM_XSLT_TRANSFORMER
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			l_validator: XM_XPATH_RECEIVER
			an_error: XM_XPATH_ERROR_VALUE
		do
			a_name_code := name_code (a_context)
			a_transformer := a_context.transformer
			if not a_transformer.is_error then
				if a_name_code = -1 then
					create an_error.make_from_string ("Name is not a valid QName", Xpath_errors_uri, "XTDE0830", Dynamic_error)
					an_error.set_location (system_id, line_number)
					a_context.transformer.report_fatal_error (an_error)
				else
					a_receiver := a_context.current_receiver
					l_validator := a_transformer.configuration.element_validator (a_receiver, a_name_code, Void, validation_action)
					if l_validator /= a_receiver then
						check
							schema_aware: False
							-- Only Basic XSLT processor is supported now
						end
					end
					if a_receiver.base_uri.is_empty then
						a_receiver.set_base_uri (new_base_uri (a_context))
					end
					if not is_inherit_namespaces then some_properties := Disinherit_namespaces end
					a_receiver.start_element (a_name_code, -1, some_properties)

					-- Output the required namespace nodes via a call-back

					output_namespace_nodes (a_context, a_receiver)
					if not a_transformer.is_error then

						-- Apply the content of any attribute sets mentioned in use-attribute-sets.

						if attribute_sets /= Void and then not attribute_sets.is_empty then
							expand_attribute_sets (a_transformer.executable, attribute_sets, a_context)
						end
						if not a_transformer.is_error then
							content.generate_events (a_context)
						end

						if not a_transformer.is_error then

							-- Output the element end tag (which will fail if validation fails)

							a_receiver.end_element
						end
					end
				end
			end
		end

	skip_element (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Take recovery action when the element name is invalid.
			-- We need to tell the receiver about this,
			--  so that it can ignore attributes in the content
		require
			context_not_void: a_context /= Void
		do

			-- Sending a namecode of -10 to the receiver is a special signal to ignore
			--  this element and the attributes that follow it

			a_context.current_receiver.start_element (-10, 0, 0)
			content.generate_events (a_context)

			-- Note, we don't bother with an end_element call.

		end

feature -- Element change

	set_base_uri (a_uri: STRING)
			-- Set `base_uri' to `a_uri'.
		do
			base_uri := a_uri
		ensure
			base_uri_set: base_uri = a_uri
		end

feature {XM_XSLT_ELEMENT_CONSTRUCTOR} -- Local

	output_namespace_nodes (a_context: XM_XSLT_EVALUATION_CONTEXT; a_receiver: XM_XPATH_RECEIVER)
			-- Output namespace nodes for the new element.
		require
			context_not_void: a_context /= Void
			receiver_not_void: a_receiver /= Void
		deferred
		end


feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_single_document_nodeset
		end

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			Result := INTEGER_.bit_or (Supports_process, Supports_evaluate)
		end

feature {NONE} -- Implementation

	type: XM_XPATH_SCHEMA_TYPE

	attribute_sets: DS_ARRAYED_LIST [INTEGER]
			-- Used attribute sets

	is_inherit_namespaces: BOOLEAN
			-- Are namespaces inherited

	content: XM_XPATH_EXPRESSION
			-- Element content

	set_content (a_content: XM_XPATH_EXPRESSION)
			-- Ensure `content' = `a_content'.
		require
			content_not_void: a_content /= Void
		do
			if content /= a_content then
				content := a_content
				adopt_child_expression (content)
				reset_static_properties
			end
		ensure
			set: content = a_content
		end

	check_contents_for_attributes (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check no attributes or namespaces are created after child nodes.
		require
			a_context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_children: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			l_component: XM_XPATH_EXPRESSION
			l_value_of: XM_XSLT_COMPILED_VALUE_OF
			l_ok, l_found_child, l_finished: BOOLEAN
			l_mask: INTEGER
			l_error: XM_XPATH_ERROR_VALUE
		do
			if content.is_sequence_expression then
				from
					l_children := content.as_sequence_expression.children.new_cursor
					l_children.start
				until
					l_children.after or l_finished
				loop
					l_component := l_children.item
					-- Need to ignore a zero-length text node, which is included to prevent space-separation in a construct like <a>{@x}{@y}</b>
					if l_component.is_value_of then
						l_value_of ?= l_component
						if l_value_of.select_expression.is_string_value and then l_value_of.select_expression.as_string_value.string_value.is_empty then
							l_ok := True
						end
					end
					if not l_ok then
						if l_component.item_type.is_node_test then
							l_mask := l_component.item_type.as_node_test.node_kind_mask
							if INTEGER_.bit_and (l_mask, INTEGER_.bit_not (child_kinds)) = 0 then
								l_found_child := True
							elseif l_found_child and l_mask = INTEGER_.bit_shift_left (1, Attribute_node) then
								l_finished := True
								create l_error.make_from_string ("May not create an attribute node after creating a child of the containing element", Xpath_errors_uri, "XTDE0410", Dynamic_error)
							elseif l_found_child and l_mask = INTEGER_.bit_shift_left (1, Namespace_node) then
								l_finished := True
								create l_error.make_from_string ("May not create a namespace node after creating a child of the containing element", Xpath_errors_uri, "XTDE0410", Dynamic_error)
							end
						end
					end
					if not l_finished then
						l_children.forth
					end
				end
			end
			if l_error = Void then
				a_replacement.put (Current)
			else
				a_replacement.put (create {XM_XPATH_INVALID_VALUE}.make (l_error))
			end
		ensure
			replaced: a_replacement.item /= Void
		end

invariant

	validation_action: initialized implies validation_action >= Validation_strict  and then Validation_strip >= validation_action
	content_not_void: initialized implies content /= Void

end

