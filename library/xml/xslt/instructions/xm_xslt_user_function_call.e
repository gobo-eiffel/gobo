indexing

	description:

		"Compile-time references to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_USER_FUNCTION_CALL

inherit

	XM_XPATH_FUNCTION_CALL
		redefine
			pre_evaluate, evaluate_item, create_iterator, display,
			mark_tail_function_calls, compute_intrinsic_dependencies,
			is_tail_recursive
		end

	XM_XPATH_ROLE

create

	make

feature {NONE} -- Initialization

	make (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]) is
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

	is_tail_recursive: BOOLEAN
			-- Is `Current' a tail recursive function call?

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			if static_type = Void then

				-- Not known yet

				Result := any_item
			else
				Result := static_type.primary_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	last_called_value: XM_XPATH_VALUE
			-- Result of last non-tail call

	is_type_error: BOOLEAN
			-- Has a type error been detected on an argument?

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			std.error.put_string (indentation (a_level))
			std.error.put_string ("Call function ")
			std.error.put_string (expanded_name)
			if is_tail_recursive then
				std.error.put_string (" (tail call) ")
			end
			std.error.put_new_line
			a_cursor := arguments.new_cursor
			from
				a_cursor.start
			variant
				arguments.count + 1 - a_cursor.index				
			until
				a_cursor.after
			loop
				a_cursor.item.display (a_level + 1)
				a_cursor.forth
			end
		end

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_user_functions
		end

feature -- Status setting
	
	mark_tail_function_calls is
			-- Mark tail-recursive calls on stylesheet functions.
		do
			is_tail_recursive := True
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_execution_context: XM_XSLT_EVALUATION_CONTEXT
			a_value: XM_XPATH_VALUE
		do
			an_execution_context ?= a_context
			check
				execution_context: an_execution_context /= Void
				-- as this is an XSLT function
			end
			call (an_execution_context)
			if last_called_value.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (last_called_value.error_value)
			elseif last_called_value.is_function_package then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (last_called_value.as_atomic_value)
			else
				a_value := last_called_value -- because `last_called_value' will be changed by recursive calls
				a_value.create_iterator (Void)
				last_iterator := a_value.last_iterator
			end
		end
	
	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_execution_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_execution_context ?= a_context
			check
				execution_context: an_execution_context /= Void
				-- as this is an XSLT function
			end
			call (an_execution_context)
			if last_called_value.is_atomic_value then
				last_evaluated_item := last_called_value.as_atomic_value
			else
				last_called_value.create_iterator (a_context)
				an_iterator := last_called_value.last_iterator
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				else
					an_iterator.start
					if an_iterator.is_error then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
					elseif not an_iterator.after then
						last_evaluated_item := an_iterator.item
					end
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end

feature -- Element change

	set_static_type (a_static_type: like static_type) is
			-- Set static type.
		require
			static_type_not_void: a_static_type /= Void
		do
			static_type := a_static_type
		ensure
			static_type_set: static_type = a_static_type
		end

	set_function (a_source_function: XM_XSLT_FUNCTION; a_compiled_function: XM_XSLT_COMPILED_USER_FUNCTION; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Create reference to callable function, and validate consitency.
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
			variant
				an_argument_count + 1 - an_index
			until
				is_type_error or else an_index > an_argument_count
			loop
				create a_role.make (Function_role, expanded_name, an_index, Xpath_errors_uri, "XPTY0004")
				create a_type_checker
				a_type_checker.static_type_check (a_context, arguments.item (an_index), some_required_types.item (an_index), False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error (a_type_checker.static_type_check_error)
					is_type_error := True
				else
					 arguments.replace (a_type_checker.checked_expression, an_index)
				end
				an_index := an_index + 1
			end
		end

feature {XM_XPATH_FUNCTION_CALL} -- Local

	check_arguments (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check arguments during parsing, when all the argument expressions have been read.
		do
			-- These checks are in set_function, at the time when the function
			-- call is bound to an actual function.
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			if static_type = Void then

				-- actual type is not known yet, so we return an approximation
				
				set_cardinality_zero_or_more
			else
				set_cardinality (static_type.cardinality)
			end
		end
	
feature {NONE} -- Implementation

	static_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type of returned result

	function: XM_XSLT_COMPILED_USER_FUNCTION
			-- Compiled function

	name: STRING is
			-- Local name of function
		do
			Result := shared_name_pool.local_name_from_name_code (fingerprint)
		end

	namespace_uri: STRING is
			-- Namespace uri for `name'
		do
			Result := shared_name_pool.namespace_uri_from_name_code (fingerprint)
		end

	expanded_name: STRING is
			-- Expanded name of function
		do
			if namespace_uri.is_empty then
				Result := name
			else
				Result := expanded_name_from_components (namespace_uri, name)
			end
		end

	call (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Call the function
		require
			context_not_void: a_context /= Void
			fixed_up: function /= Void
		local
			some_actual_arguments: ARRAY [XM_XPATH_VALUE]
			a_function_call_package: XM_XSLT_FUNCTION_CALL_PACKAGE
			a_clean_context: XM_XSLT_EVALUATION_CONTEXT
		do
			last_called_value := Void
			last_called_error_value := Void
			create some_actual_arguments.make (1, arguments.count)
			process_call_loop (some_actual_arguments, a_context)
			if last_called_error_value /= Void then
				last_called_value := last_called_error_value
			elseif is_tail_recursive then
				create a_function_call_package.make (function, some_actual_arguments, arguments.count, a_context)
				last_called_value := a_function_call_package
			else
				a_clean_context := a_context.new_clean_context
				function.call (some_actual_arguments, arguments.count, a_clean_context, True)
				last_called_value := function.last_called_value
			end
		ensure
			last_called_value: last_called_value /= Void -- but may be in error
		end

	last_called_error_value: XM_XPATH_VALUE
			-- Last error from `process_call_loop'

	process_call_loop (some_actual_arguments: ARRAY [XM_XPATH_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Process body of `call'.
		require
			arguments_not_void: some_actual_arguments /= Void
			corect_number_of_arguments: some_actual_arguments.count = arguments.count
			context_not_void: a_context /= Void
			fixed_up: function /= Void
		local
			a_reference_count, a_parameter_count: INTEGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_EXPRESSION
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			from
				a_parameter_count := function.parameter_definitions.count
				check
					corect_number_of_parameters: a_parameter_count = arguments.count
					-- static_typing
				end
				a_cursor := arguments.new_cursor; a_cursor.start
			variant
				arguments.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				a_reference_count := function.parameter_definitions.item (a_cursor.index).reference_count
				if an_expression.is_value then
					if an_expression.is_error then
						last_called_error_value := an_expression.as_value
						a_cursor.go_after
					else
						some_actual_arguments.put (an_expression.as_value, a_cursor.index)
					end
				else

					-- determine which kind of lazy evaluation to use

					if a_reference_count = 0 then
						create an_empty_sequence.make
						some_actual_arguments.put (an_empty_sequence, a_cursor.index)
					elseif an_expression.depends_upon_user_functions then

						-- If the argument contains a call to a user-defined function, then it might be a recursive call.
                  -- It's better to evaluate it now, rather than waiting until we are on a new stack frame, as
						--  that can blow the stack if done repeatedly.

						an_expression.eagerly_evaluate (a_context)
						if an_expression.last_evaluation.is_error then
							last_called_error_value := an_expression.last_evaluation
							a_cursor.go_after
						else
							some_actual_arguments.put (an_expression.last_evaluation, a_cursor.index)
						end						
					else
						an_expression.lazily_evaluate (a_context, a_reference_count)
						if an_expression.last_evaluation.is_error then
							last_called_error_value := an_expression.last_evaluation
							a_cursor.go_after
						else
							some_actual_arguments.put (an_expression.last_evaluation, a_cursor.index)
						end
					end
				end
				if not a_cursor.after and then a_reference_count > 1 and then some_actual_arguments.item (a_cursor.index).is_closure and then
					not some_actual_arguments.item (a_cursor.index).is_memo_closure then
					some_actual_arguments.item (a_cursor.index).reduce
					some_actual_arguments.put (some_actual_arguments.item (a_cursor.index).last_reduced_value, a_cursor.index)
				end
				if not a_cursor.after then a_cursor.forth end
			end
		end

invariant

	strictly_positive_fingerprint: fingerprint > 0
	arguments_not_void: initialized implies arguments /= Void

end
	
