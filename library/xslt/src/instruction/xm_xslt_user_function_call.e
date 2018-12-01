note

	description:

		"Compile-time references to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_USER_FUNCTION_CALL

inherit

	XM_XPATH_FUNCTION_CALL
		redefine
			pre_evaluate, evaluate_item, create_iterator, display,
			mark_tail_function_calls, compute_intrinsic_dependencies,
			create_node_iterator, native_implementations,
			generate_events, check_static_type, optimize, processed_eager_evaluation,
			contains_recursive_tail_function_calls, is_user_function_call
		end

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION])
			-- Establish invariant.
		require
			strictly_positive_fingerprint: a_fingerprint > 0
			arguments_not_void: some_arguments /= Void
		do
			arguments := some_arguments
			arguments.set_equality_tester (expression_tester)
			fingerprint := a_fingerprint
			compute_static_properties
			initialized := True
		ensure
			arguments_set: arguments = some_arguments
			fingerprint_set: fingerprint = a_fingerprint
		end

feature -- Access

	is_tail_callable: BOOLEAN
			-- Is `Current' to be called as a tail call (not necessarily recusive)?

	function: detachable XM_XSLT_COMPILED_USER_FUNCTION
			-- Compiled function

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where known
		do
			if not attached static_type as l_static_type then

				-- Not known yet

				Result := any_item
			else
				Result := l_static_type.primary_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_type_error: BOOLEAN
			-- Has a type error been detected on an argument?

	is_user_function_call: BOOLEAN
			-- Is `Current' a user function call?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("Call function ")
			std.error.put_string (expanded_name)
			if is_tail_callable then
				std.error.put_string (" (tail call) ")
			end
			std.error.put_new_line
			a_cursor := arguments.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_cursor.item.display (a_level + 1)
				a_cursor.forth
			variant
				arguments.count + 1 - a_cursor.index
			end
		end

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_user_functions
		end

	contains_recursive_tail_function_calls (a_name_code, a_arity: INTEGER): UT_TRISTATE
			-- Does `Current' contains recursive tail calls of stylesheet functions?
			-- `Undecided' means it contains a tail call to another function.
		do
			if fingerprint_from_name_code (a_name_code) = fingerprint and a_arity = arguments.count then
				create Result.make_true
			else
				create Result.make_undefined
			end
		ensure then
			contains_tail_function_calls: not Result.is_false
		end

feature -- Status setting

	mark_tail_function_calls
			-- Mark tail-recursive calls on stylesheet functions.
		do
			is_tail_callable := True
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			if a_replacement.item = Current and attached function as l_function then
				compute_argument_evaluation_modes
				if not attached static_type as l_static_type or else l_static_type.primary_type = any_item then
					-- try and do better
					static_type := l_function.result_type
					reset_static_properties
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			Precursor (a_replacement, a_context, a_context_item_type)
			if  a_replacement.item = Current and function /= Void then
				compute_argument_evaluation_modes
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
		do
			last_iterator := Void
			check
				execution_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_execution_context
				-- as this is an XSLT function
			then
				create l_value.make (Void)
				call (l_value, l_execution_context)
				check postcondition_of_call: attached l_value.item as l_value_item then
					if attached l_value_item.error_value as l_error_value then
						check is_error: l_value_item.is_error end
						if is_node_sequence then
							create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (l_error_value)
						else
							create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
						end
					else
						l_value_item.create_iterator (new_dummy_context)
						last_iterator := l_value_item.last_iterator
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
		do
			last_node_iterator := Void
			check
				execution_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_execution_context
				-- as this is an XSLT function
			then
				create l_value.make (Void)
				call (l_value, l_execution_context)
				check postcondition_of_call: attached l_value.item as l_value_item then
					if attached l_value_item.error_value as l_error_value then
						check is_error: l_value_item.is_error end
						create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
					else
						l_value_item.create_node_iterator (new_dummy_context)
						last_node_iterator := l_value_item.last_node_iterator
					end
				end
			end
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_value: DS_CELL [detachable XM_XPATH_VALUE]
		do
			check
				execution_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_execution_context
				-- as this is an XSLT function
			then
				create l_value.make (Void)
				call (l_value, l_execution_context)
				check postcondition_of_call: attached l_value.item as l_value_item then
					if l_value_item.is_atomic_value then
						a_result.put (l_value_item.as_atomic_value)
					else
						l_value_item.create_iterator (a_context)
						check postcondition_of_create_iterator: attached l_value_item.last_iterator as l_last_iterator then
							l_iterator := l_last_iterator
							if attached l_iterator.error_value as l_error_value then
								check is_error: l_iterator.is_error end
								a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
							else
								l_iterator.start
								if attached l_iterator.error_value as l_error_value then
									check is_error: l_iterator.is_error end
									a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
								elseif not l_iterator.after then
									a_result.put (l_iterator.item)
								end
							end
						end
					end
				end
			end
		end

	pre_evaluate (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_actual_arguments: ARRAY [detachable XM_XPATH_VALUE]
			l_return_value: DS_CELL [detachable XM_XPATH_VALUE]
			l_clean_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				execution_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context as l_context
				-- as this is an XSLT function
			then
				create l_return_value.make (Void)
				create l_actual_arguments.make_filled (Void, 1, arguments.count)
				evaluate_arguments (l_return_value, l_actual_arguments, l_context)
				if attached l_return_value.item as l_return_value_item then
					check attached l_return_value_item.error_value as l_error_value then
						a_context.report_fatal_error (l_error_value)
					end
				else
					check attached function as l_function then
						if is_tail_callable then
							l_context.set_tail_call (l_function, l_actual_arguments)
						else
							l_clean_context := l_context.new_clean_context
							l_clean_context.set_current_receiver (l_context.current_receiver)
							l_function.generate_events (l_actual_arguments, l_clean_context)
						end
					end
				end
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE
			-- Eager evaluation via `generate_events'
		local
			l_receiver: XM_XSLT_SEQUENCE_OUTPUTTER
		do
			check
				evaluation_context: attached {XM_XSLT_EVALUATION_CONTEXT} a_context.new_minor_context as l_other_context
				-- This is XSLT
				attached l_other_context.transformer as l_transformer
			then
				create l_receiver.make (l_transformer)
				l_other_context.change_to_sequence_output_destination (l_receiver)
				generate_events (l_other_context)
				l_receiver.close
				Result := l_receiver.sequence
			end
		end

feature -- Element change

	set_static_type (a_static_type: like static_type)
			-- Set static type.
		require
			static_type_not_void: a_static_type /= Void
		do
			static_type := a_static_type
			reset_static_properties
		ensure
			static_type_set: static_type = a_static_type
		end

	set_function (a_source_function: XM_XSLT_FUNCTION; a_compiled_function: XM_XSLT_COMPILED_USER_FUNCTION; a_context: detachable XM_XPATH_STATIC_CONTEXT)
			-- Create reference to callable function, validate consistency and compute `argument_evaluation_modes'.
		require
			source_function_not_void: a_source_function /= Void
			compiled_function_not_void: a_compiled_function /= Void
		local
			an_argument_count, an_index: INTEGER
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
			some_required_types: DS_ARRAYED_LIST [XM_XPATH_SEQUENCE_TYPE]
		do
			function := a_compiled_function
			some_required_types := a_source_function.argument_types
			from
				an_argument_count := a_source_function.arity; an_index := 1
			until
				is_type_error or else an_index > an_argument_count
			loop
				create a_role.make (Function_role, expanded_name, an_index, Xpath_errors_uri, "XTTE0790")
				create a_type_checker
				a_type_checker.static_type_check (a_context, arguments.item (an_index), some_required_types.item (an_index), False, a_role)
				if a_type_checker.is_static_type_check_error then
					check postcondition_of_static_type_check: attached a_type_checker.static_type_check_error as l_static_type_check_error then
						set_last_error (l_static_type_check_error)
						is_type_error := True
					end
				else
					check postcondition_of_static_type_check: attached a_type_checker.checked_expression as l_checked_expression then
						arguments.replace (l_checked_expression, an_index)
					end
				end
				an_index := an_index + 1
			variant
				an_argument_count + 1 - an_index
			end
			if not is_type_error and argument_evaluation_modes = Void then
				compute_argument_evaluation_modes
			end
		ensure
			fixed_up: function /= Void
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT)
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			-- These checks are in set_function, at the time when the function
			-- call is bound to an actual function.
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			if cardinality_allows_many then
				Result := Supports_iterator + Supports_process
			else
				Result := Supports_evaluate
			end
		end

	compute_cardinality
			-- Compute cardinality.
		do
			if not attached static_type as l_static_type then

				-- actual type is not known yet, so we return an approximation

				set_cardinality_zero_or_more
			else
				set_cardinality (l_static_type.cardinality)
			end
		end

feature {NONE} -- Implementation

	static_type: detachable XM_XPATH_SEQUENCE_TYPE
			-- Static type of returned result

	argument_evaluation_modes: detachable DS_ARRAYED_LIST [INTEGER]
			-- Methods by which each argument is evaluated

	compute_argument_evaluation_modes
			-- Create and populate `argument_evaluation_modes'.
		require
			fixed_up: function /= Void
		local
			i, l_count, l_reference_count: INTEGER
			l_argument_evaluation_modes: like argument_evaluation_modes
		do
			check
				precondition_fixed_up: attached function as l_function
			then
				l_count := arguments.count
				create l_argument_evaluation_modes.make (l_count)
				argument_evaluation_modes := l_argument_evaluation_modes
				from
					i := 1
				until
					i > l_count
				loop
					check attached l_function.parameter_definitions as l_parameter_definitions then
						l_reference_count := l_parameter_definitions.item (i).reference_count
						if l_reference_count = 0 then
							l_argument_evaluation_modes.put (Create_empty_sequence, i)
						elseif arguments.item (i).depends_upon_user_functions then
							-- If the argument contains a call to a user-defined function, then it might be a recursive call.
							-- It's better to evaluate it now, rather than waiting until we are on a new stack frame, as
							--  that can blow the stack if done repeatedly.
							l_argument_evaluation_modes.put (arguments.item (i).eager_evaluation_mode, i)
						else
							l_argument_evaluation_modes.put (arguments.item (i).lazy_evaluation_mode, i)
						end
					end
					i := i + 1
				end
			end
		ensure
			argument_evaluation_modes_not_void: attached argument_evaluation_modes as l_argument_evaluation_modes2
			correct_count: l_argument_evaluation_modes2.count = arguments.count
		end

	name: STRING
			-- Local name of function
		do
			Result := shared_name_pool.local_name_from_name_code (fingerprint)
		end

	namespace_uri: STRING
			-- Namespace uri for `name'
		do
			Result := shared_name_pool.namespace_uri_from_name_code (fingerprint)
		end

	expanded_name: STRING
			-- Expanded name of function
		do
			if namespace_uri.is_empty then
				Result := name
			else
				Result := expanded_name_from_components (namespace_uri, name)
			end
		end

	call (a_return_value: DS_CELL [detachable XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Call the function.
			-- Result returned as `a_return_value.item'.
		require
			a_return_value_not_void: a_return_value /= Void
			return_value_is_void: a_return_value.item = Void
			context_not_void: a_context /= Void
			fixed_up: function /= Void
		local
			l_actual_arguments: ARRAY [detachable XM_XPATH_VALUE]
			l_clean_context: XM_XSLT_EVALUATION_CONTEXT
		do
			check
				precondition_fixed_up: attached function as l_function
			then
				create l_actual_arguments.make_filled (Void, 1, arguments.count)
				evaluate_arguments (a_return_value, l_actual_arguments, a_context)
				if a_return_value.item /= Void then
					-- error - do nothing
				else
					if is_tail_callable then
						a_context.set_tail_call (l_function, l_actual_arguments)
						a_return_value.put (create {XM_XPATH_EMPTY_SEQUENCE}.make)
					else
						l_clean_context := a_context.new_clean_context
						l_function.call (a_return_value, l_actual_arguments, arguments.count, l_clean_context, True)
					end
				end
			end
		ensure
			called_value_not_void: a_return_value.item /= Void -- but may be an error value
		end

	evaluate_arguments (a_return_value: DS_CELL [detachable XM_XPATH_VALUE]; a_actual_arguments: ARRAY [detachable XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Evaluate `a_arguments'.
		require
			a_return_value_not_void: a_return_value /= Void
			return_value_is_void: a_return_value.item = Void
			arguments_not_void: a_actual_arguments /= Void
			corect_number_of_arguments: a_actual_arguments.count = arguments.count
			context_not_void: a_context /= Void
			fixed_up: function /= Void
			argument_evaluation_modes_not_void: argument_evaluation_modes /= Void
		do
			if argument_evaluation_modes = Void then
				compute_argument_evaluation_modes
			end
			arguments.do_if_with_index (agent evaluate_argument (a_return_value, a_actual_arguments, a_context, ?, ?), agent is_no_error (a_return_value, ?, ?))
		end

	is_no_error (a_return_value: DS_CELL [detachable XM_XPATH_VALUE]; a_expression: XM_XPATH_EXPRESSION; a_index: INTEGER): BOOLEAN
			-- Is `a_return_value' empty?
			-- Iterator passes unwated arguments `a_expression' and `a_index'.
		require
			a_return_value_not_void: a_return_value /= Void
		do
			Result := a_return_value.item = Void
		ensure
			definition: Result implies a_return_value.item = Void
		end

	evaluate_argument (a_return_value: DS_CELL [detachable XM_XPATH_VALUE]; a_actual_arguments: ARRAY [detachable XM_XPATH_VALUE];
		a_context: XM_XSLT_EVALUATION_CONTEXT; a_argument: XM_XPATH_EXPRESSION; a_index: INTEGER)
			-- Evaluate `a_argument'.
		require
			return_value_is_void: a_return_value.item = Void
			a_actual_arguments_not_void: a_actual_arguments /= Void
			corect_number_of_arguments: a_actual_arguments.count = arguments.count
			context_not_void: a_context /= Void
			fixed_up: function /= Void
			a_argument_not_void: a_argument /= Void
			a_index_large_enough: a_index > 0
			a_index_large_enough: a_index <= arguments.count
			argument_evaluation_modes_not_void: argument_evaluation_modes /= Void
		local
			l_reference_count: INTEGER
		do
			check
				precondition_fixed_up: attached function as l_function
				precondition_argument_evaluation_modes_not_void: attached argument_evaluation_modes as l_argument_evaluation_modes
				attached l_function.parameter_definitions as l_parameter_definitions
			then
				l_reference_count := l_parameter_definitions.item (a_index).reference_count
				a_argument.evaluate (a_return_value, l_argument_evaluation_modes.item (a_index),
					l_reference_count, a_context)
				if not attached a_return_value.item as l_return_value_item then
					a_actual_arguments.put (create {XM_XPATH_EMPTY_SEQUENCE}.make, a_index)
				elseif not l_return_value_item.is_error then
					if l_reference_count > 1 and l_return_value_item.is_closure
						and not l_return_value_item.is_memo_closure then
						-- this shouldn't happen, but just in case:
						l_return_value_item.reduce
						check postcondition_of_reduce: attached l_return_value_item.last_reduced_value as l_last_reduced_value then
							a_actual_arguments.put (l_last_reduced_value, a_index)
						end
					else
						a_actual_arguments.put (l_return_value_item, a_index)
					end
					a_return_value.put (Void)
				end
			end
		end

invariant

	strictly_positive_fingerprint: fingerprint > 0
	arguments_not_void: initialized implies arguments /= Void

end

