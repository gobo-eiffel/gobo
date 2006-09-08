indexing

	description: "Objects that represent an xsl:copy-of,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_COPY_OF

inherit

	XM_XSLT_COPY_ROUTINES

	XM_XSLT_INSTRUCTION
		redefine
			creates_new_nodes, native_implementations, item_type,
			compute_cardinality, compute_dependencies, promote_instruction,
			sub_expressions, create_iterator
		end
			
	XM_XSLT_VALIDATION

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; copy_ns: BOOLEAN) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			copy_namespaces := copy_ns
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			copy_namespaces_set: copy_namespaces = copy_ns
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := select_expression.item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (1)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := not is_sub_type (select_expression.item_type, type_factory.any_atomic_type)
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:copy of ")
			std.error.put_string (a_string);
			std.error.put_new_line
			select_expression.display (a_level + 1)
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			set_dependencies (select_expression.dependencies)
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
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			a_new_context: XM_XPATH_CONTEXT
			a_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			a_new_context := a_context.new_minor_context
			another_context ?= a_new_context
			check
				evaluation_context: another_context /= Void
				-- this is XSLT
			end
			create a_receiver.make (another_context.transformer)
			a_new_context.set_current_receiver (a_receiver)
			process (a_new_context)
			a_receiver.sequence.create_iterator (Void)
			last_iterator := a_receiver.sequence.last_iterator
		end

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			which_namespaces: INTEGER
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
		do
			last_tail_call := Void
			a_receiver := a_context.current_receiver
			if copy_namespaces then
				which_namespaces := All_namespaces
			else
				which_namespaces := No_namespaces
			end
			from
				select_expression.create_iterator (a_context)
				a_sequence_iterator := select_expression.last_iterator
				if a_sequence_iterator.is_error then
					a_receiver.on_error (a_sequence_iterator.error_value.error_message)
				else
					a_sequence_iterator.start
				end
			until
				a_sequence_iterator.is_error or else a_sequence_iterator.after
			loop
				an_item := a_sequence_iterator.item
				if an_item.is_node then
					process_node (an_item.as_node, a_receiver, which_namespaces, a_context)
				else
					a_receiver.append_item (an_item)
				end
				a_sequence_iterator.forth
				if a_sequence_iterator.is_error then
					a_receiver.on_error (a_sequence_iterator.error_value.error_message)
				end
			end
		end

	
feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_process + Supports_iterator
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			clone_cardinality (select_expression)
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	copy_namespaces: BOOLEAN
			-- Do we copy namespaces?

	process_node (a_node: XM_XPATH_NODE; a_receiver: XM_XPATH_SEQUENCE_RECEIVER; which_namespaces: INTEGER; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Process a node.
		require
			node_not_void: a_node /= Void
			receiver_not_void: a_receiver /= Void
			context_not_void: a_context /= Void
		local
			a_validator: XM_XPATH_RECEIVER
			l_was_open: BOOLEAN
		do
			inspect
				a_node.node_type
			when Element_node then
				a_validator := a_context.transformer.configuration.element_validator (a_receiver, a_node.name_code, Void, Validation_strip)
				a_node.copy_node (a_validator, which_namespaces, True)
			when Attribute_node then
				copy_attribute (a_node, a_context, Void, Validation_strip)
			when Text_node then
				a_receiver.notify_characters (STRING_.cloned_string (a_node.string_value), 0)
			when Processing_instruction_node then
				a_receiver.notify_processing_instruction (a_node.node_name, STRING_.cloned_string (a_node.string_value), 0)
			when Comment_node then
				a_receiver.notify_comment (STRING_.cloned_string (a_node.string_value), 0)
			when Document_node then
				a_validator := a_context.transformer.configuration.document_validator (a_receiver, a_node.base_uri, Validation_strip)
				l_was_open := a_validator.is_open
				if not l_was_open then
					a_validator.open
					a_validator.start_document
				end
				a_node.copy_node (a_validator, which_namespaces, True)
				if not l_was_open then
					a_validator.end_document
					a_validator.close
				end
			when Namespace_node then
				a_node.copy_node (a_receiver, No_namespaces, False)
			end
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void

end
	
