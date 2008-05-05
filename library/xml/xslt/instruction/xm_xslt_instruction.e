indexing

	description:

		"Objects that represent an XSLT instruction"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_INSTRUCTION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		undefine
			simplify
		redefine
			promote, native_implementations, evaluate_item, create_iterator, compute_special_properties,
			processed_eager_evaluation, generate_events, system_id_from_module_number, is_tail_call, as_tail_call,
			create_node_iterator
		end

	XM_XPATH_TAIL_CALL

	XM_XPATH_LOCATOR

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_ROLE

	XM_XPATH_ERROR_TYPES
	
	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

feature -- Access

	executable: XM_XSLT_EXECUTABLE
			-- Compiled executable xsl:transform/xsl:stylesheet

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		do
			Result := executable.system_id (a_module_number)
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type of items yielded
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	assembled_parameters (a_context:XM_XSLT_EVALUATION_CONTEXT;  a_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]): XM_XSLT_PARAMETER_SET is
			-- Assembled parameter set
		require
			context_not_void: a_context /= Void
			paramter_list_not_void: a_parameter_list /= Void
		local
			a_cursor:  DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			a_param: XM_XSLT_COMPILED_WITH_PARAM
		do
			from
				create Result.make_empty
				a_cursor := a_parameter_list.new_cursor; a_cursor.start
			variant
				a_parameter_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_param := a_cursor.item
				Result.put (a_param.select_value (a_context), a_param.variable_fingerprint)
				a_cursor.forth
			end
		ensure
			assembled_parameters_not_void: Result /= Void
		end

	assembled_tunnel_parameters (a_context:XM_XSLT_EVALUATION_CONTEXT;  a_parameter_list: DS_ARRAYED_LIST [XM_XSLT_COMPILED_WITH_PARAM]):  XM_XSLT_PARAMETER_SET is
			-- Assembled tunnel parameter set
		require
			context_not_void: a_context /= Void
			paramter_list_not_void: a_parameter_list /= Void
		local
			a_cursor:  DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_WITH_PARAM]
			a_param: XM_XSLT_COMPILED_WITH_PARAM
			some_existing_parameters: XM_XSLT_PARAMETER_SET
		do
			some_existing_parameters := a_context.tunnel_parameters
			if some_existing_parameters = Void then
				Result := assembled_parameters (a_context, a_parameter_list)
			else
				create Result.make (some_existing_parameters)
				if a_parameter_list.count > 0 then
					from
						a_cursor := a_parameter_list.new_cursor; a_cursor.start
					variant
						a_parameter_list.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_param := a_cursor.item
						Result.put (a_param.select_value (a_context), a_param.variable_fingerprint)
						a_cursor.forth
					end
				end
			end
		end
		
feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := False
		end

	is_tail_call: BOOLEAN is
			-- Is `Current' an XPath tail call?
		do
			Result := True
		end

feature -- Optimization

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		require
			promotion_offer_not_void: a_offer /= Void
			no_error_yet: not is_error
		do
			-- Default implementation does nothing
		ensure
			still_no_error: not is_error
		end

	promote (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			a_offer.accept (Current)
			if a_offer.accepted_expression = Void then
				promote_instruction (a_offer)
				a_replacement.put (Current)
			else
				set_replacement (a_replacement, a_offer.accepted_expression)
			end
		end

feature -- Evaluation

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_tail: DS_CELL [XM_XPATH_TAIL_CALL]
			l_tail_call: XM_XPATH_TAIL_CALL
		do
			l_evaluation_context ?= a_context
			check
				evaluation_context_not_void: l_evaluation_context /= Void
				-- this is XSLT
			end
			create l_tail.make (Void)
			generate_tail_call (l_tail, l_evaluation_context)
			from
				l_tail_call := l_tail.item
			until
				l_tail_call = Void or else l_evaluation_context.transformer.is_error
			loop
				l_tail.put (Void)
				l_tail_call.generate_tail_call (l_tail, l_evaluation_context)
				l_tail_call := l_tail.item
			end
		ensure then
			no_tail_calls: not a_context.is_process_error implies True -- l_tail_call = Void
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			l_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				emulation: not is_evaluate_supported
			end
			if is_iterator_supported then
				create_iterator (a_context)
				if last_iterator.is_error then
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (last_iterator.error_value))
				else
					last_iterator.start
					if last_iterator.is_error then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (last_iterator.error_value))
					elseif last_iterator.after then
						a_result.put (Void)
					else
						a_result.put (last_iterator.item)
					end
				end
			else
				l_context ?= a_context.new_minor_context
				check
					evaluation_context: l_context /= Void
					-- This is XSLT
				end
				create l_receiver.make_with_size (1, l_context.transformer)
				l_context.change_to_sequence_output_destination (l_receiver)
				generate_events (l_context)
				l_receiver.close
				a_result.put (l_receiver.first_item)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			l_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			l_other_context: XM_XSLT_EVALUATION_CONTEXT
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			check
				emulation: not is_iterator_supported
			end
			if is_evaluate_supported then
				create l_item.make (Void)
				evaluate_item (l_item, a_context)
				if l_item.item = Void then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				elseif l_item.item.is_error then
					if is_node_sequence then
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_item.item.error_value)
					else
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_item.item.error_value)
					end
				else
					if not l_item.item.is_node then
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_item.item)
					else
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_item.item.as_node)
					end
				end
			else
				l_other_context ?= a_context.new_minor_context
				check
					evaluation_context: l_other_context /= Void
					-- This is XSLT
				end
				create l_receiver.make (l_other_context.transformer)
				l_other_context.change_to_sequence_output_destination (l_receiver)
				generate_events (l_other_context)
				if l_receiver.is_open then l_receiver.close end
				if not l_other_context.transformer.is_error then
					l_receiver.sequence.create_iterator (l_other_context)
					last_iterator := l_receiver.sequence.last_iterator
				else
					if is_node_sequence then
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_other_context.transformer.last_error)
					else
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_other_context.transformer.last_error)
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence.
		do
			create_iterator (a_context)
			last_node_iterator := last_iterator.as_node_iterator
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `generate_events'
		local
			l_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			l_other_context: XM_XSLT_EVALUATION_CONTEXT
		do
			l_other_context ?= a_context.new_minor_context
				check
					evaluation_context: l_other_context /= Void
					-- This is XSLT
				end
			create l_receiver.make (l_other_context.transformer)
			l_other_context.change_to_sequence_output_destination (l_receiver)
			generate_events (l_other_context)
			l_receiver.close
			Result := l_receiver.sequence
		end

feature -- Element change

	set_executable (an_executable: XM_XSLT_EXECUTABLE) is
			-- Set executable.
		require
			executable_not_void: an_executable /= Void
		do
			executable := an_executable
		ensure
			set: executable = an_executable
		end

feature -- Conversion

	as_tail_call: XM_XPATH_TAIL_CALL is
			-- `Current' seen as an XPath tail call
		do
			Result := Current
		end

feature {XM_XSLT_INSTRUCTION} -- local

	instruction_indentation (a_level: INTEGER): STRING is
			-- Indentation string prefix, for diagnostic output
		require
			strictly_positive_level: a_level > 0
		local
			counter: INTEGER
		do
			Result := ""
			from
				counter := 1
			variant
				a_level + 1 - counter
			until
				counter > a_level
			loop
				Result := STRING_.appended_string (Result, " ")
				counter := counter + 1
			end
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_process
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			if not creates_new_nodes then
				set_non_creating
			end
		end

invariant

	executable_not_void: initialized implies executable /= Void

end
	
