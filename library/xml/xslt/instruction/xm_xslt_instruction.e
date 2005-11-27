indexing

	description:

		"Objects that represent an XSLT instruction"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_INSTRUCTION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		undefine
			simplify
		redefine
			promote, native_implementations, evaluate_item, create_iterator, compute_special_properties,
			processed_eager_evaluation, process, system_id_from_module_number, is_tail_call, as_tail_call
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
			-- Executable

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

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		require
			promotion_offer_not_void: an_offer /= Void
		do
			-- Default implementation does nothing
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			an_offer.accept (Current)
			if an_offer.accepted_expression = Void then
				promote_instruction (an_offer)
			else
				set_replacement (an_offer.accepted_expression)
			end
		end

feature -- Evaluation

	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_tail_call: like last_tail_call
		do
			an_evaluation_context ?= a_context
			check
				evaluation_context_not_void: an_evaluation_context /= Void
				-- this is XSLT
			end
			process_leaving_tail (an_evaluation_context)
			from
				a_tail_call := last_tail_call
			until
				a_tail_call = Void or else an_evaluation_context.transformer.is_error
			loop
				a_tail_call.process_leaving_tail (an_evaluation_context)
				a_tail_call := a_tail_call.last_tail_call
			end
			last_tail_call := a_tail_call
		ensure then
			no_tail_calls: not a_context.is_process_error implies last_tail_call = Void
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			a_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				emulation: not is_evaluate_item_supported
			end
			if is_iterator_supported then
				create_iterator (a_context)
				if last_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (last_iterator.error_value)
				else
					last_iterator.start
					if last_iterator.is_error then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (last_iterator.error_value)
					elseif last_iterator.after then
						last_evaluated_item := Void
					else
						last_evaluated_item := last_iterator.item
					end
				end
			else
				another_context ?= a_context.new_minor_context
				check
					evaluation_context: another_context /= Void
					-- This is XSLT
				end
				create a_receiver.make_with_size (1, another_context.transformer)
				another_context.change_to_sequence_output_destination (a_receiver)
				process (another_context)
				a_receiver.close
				last_evaluated_item := a_receiver.first_item
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			a_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				emulation: not is_iterator_supported
			end
			if is_evaluate_item_supported then
				evaluate_item (a_context)
				if last_evaluated_item = Void then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				elseif last_evaluated_item.is_error then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (last_evaluated_item.error_value)
				else
					if not last_evaluated_item.is_node then
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (last_evaluated_item)
					else
						create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (last_evaluated_item.as_node)
					end
				end
			else
				another_context ?= a_context.new_minor_context
				check
					evaluation_context: another_context /= Void
					-- This is XSLT
				end
				create a_receiver.make (another_context.transformer)
				another_context.change_to_sequence_output_destination (a_receiver)
				process (another_context)
				if a_receiver.is_open then a_receiver.close end
				if not another_context.transformer.is_error then
					a_receiver.sequence.create_iterator (another_context)
					last_iterator := a_receiver.sequence.last_iterator
				else
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (another_context.transformer.last_error)
				end
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `process'
		local
			a_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
			another_context: XM_XSLT_EVALUATION_CONTEXT
		do
			another_context ?= a_context.new_minor_context
				check
					evaluation_context: another_context /= Void
					-- This is XSLT
				end
			create a_receiver.make (another_context.transformer)
			another_context.change_to_sequence_output_destination (a_receiver)
			process (another_context)
			if a_receiver.is_document_started then a_receiver.end_document end
			if a_receiver.is_open then a_receiver.close end
			Result := a_receiver.sequence
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
	
