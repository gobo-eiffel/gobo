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
			pre_evaluate, simplify,
			evaluate_item, iterator, display, mark_tail_function_calls
		end

	XM_XPATH_ROLE

	XM_XPATH_DEBUGGING_ROUTINES

creation

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
		ensure
			arguments_set: arguments = some_arguments
			fingerprint_set: fingerprint = a_fingerprint
		end

feature -- Access

	fingerprint: INTEGER
			-- Fingerprint of function name

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

	is_tail_recursive: BOOLEAN
			-- Is `Current' tail recursive?

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
			std.error.put_string ("function ")
			std.error.put_string (name)
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

feature -- Status setting
	
	mark_tail_function_calls is
			-- Mark tail-recursive calls on stylesheet functions.
		do
			is_tail_recursive := True
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			simplify_arguments
		end	
feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		local
			an_execution_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_execution_context ?= a_context
			check
				execution_context: an_execution_context /= Void
				-- as this is an XSLT function
			end
			call (an_execution_context)
			if last_called_value.is_error then
				create {XM_XPATH_INVALID_ITERATOR} Result.make (last_called_value.error_value)
			else
				Result := last_called_value.iterator (a_context)
			end
		end
	
	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_execution_context: XM_XSLT_EVALUATION_CONTEXT
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			an_execution_context ?= a_context
			check
				execution_context: an_execution_context /= Void
				-- as this is an XSLT function
			end
			call (an_execution_context)
			an_atomic_value ?= last_called_value
			last_evaluated_item := an_atomic_value
			if an_atomic_value = Void then
				an_iterator := last_called_value.iterator (a_context)
				an_iterator.start
				if not an_iterator.after then
					last_evaluated_item := an_iterator.item
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

	set_function (a_source_function: XM_XSLT_FUNCTION; a_compiled_function: XM_XSLT_CALLABLE_FUNCTION) is
			-- Create reference to callable function, and validate consitency.
		require
			source_function_not_void: a_source_function /= Void
			compiled_function_nit_void: a_compiled_function /= Void
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
				create a_role.make (Function_role, name, an_index)
				create a_type_checker
				a_type_checker.static_type_check (Void, arguments.item (an_index), some_required_types.item (an_index), False, a_role)
				if a_type_checker.is_static_type_check_error then
					set_last_error_from_string (a_type_checker.static_type_check_error_message, "", "XT0320", Type_error)
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
			-- These checks are now done in set_function, at the time when the function
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

	function: XM_XSLT_CALLABLE_FUNCTION
			-- Compiled function

	name: STRING is
			-- Name of function, for use in diagnostics
		do
			if function = Void then
				Result := "*** call to user function ***"
			else
				Result := function.function_name
			end
		end

	call (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Call the function
		require
			context_not_void: a_context /= Void
			fixed_up: function /= Void
		local
			some_actual_arguments: DS_ARRAYED_LIST [XM_XPATH_VALUE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_transformer: XM_XSLT_TRANSFORMER
			a_saved_context: XM_XSLT_SAVED_TRANSFORMER_CONTEXT
			a_function_call: XM_XSLT_FUNCTION_CALL_PACKAGE
			an_expression: XM_XPATH_EXPRESSION
			a_value: XM_XPATH_VALUE
		do
			create some_actual_arguments.make (arguments.count)
			from
				a_cursor := arguments.new_cursor; a_cursor.start
			variant
				arguments.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression := a_cursor.item
				a_value ?= an_expression
				if a_value /= Void then
					some_actual_arguments.put (a_value, a_cursor.index)
				else
					an_expression.lazily_evaluate (a_context, False)
					some_actual_arguments.put (an_expression.last_evaluation, a_cursor.index)
				end
				a_cursor.forth
			end
			if is_tail_recursive then
				create a_function_call.make (function, some_actual_arguments, a_context)
				create {XM_XPATH_OBJECT_VALUE} last_called_value.make (a_function_call)
			else
				a_transformer := a_context.transformer
				a_saved_context := a_transformer.saved_context
				a_transformer.reset_global_context
				a_transformer.set_current_iterator (Void)
				function.call (some_actual_arguments, a_transformer, True)
				last_called_value := function.last_called_value
				a_transformer.restore_context (a_saved_context)
			end
		ensure
			last_called_value: last_called_value /= Void -- but may be in error
		end
	
invariant

	strictly_positive_fingerprint: fingerprint > 0
	arguments_not_void: arguments /= Void

end
	
