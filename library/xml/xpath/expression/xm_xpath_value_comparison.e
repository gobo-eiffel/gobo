indexing

	description:

		"XPath value comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VALUE_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		rename
			make as make_binary_expression
		redefine
			check_static_type, optimize, evaluate_item, calculate_effective_boolean_value
		end

	XM_XPATH_COMPARISON_ROUTINES

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_ROLE

	MA_SHARED_DECIMAL_CONSTANTS

	MA_DECIMAL_CONTEXT_CONSTANTS

	KL_SHARED_PLATFORM

		-- TODO - the rules for a value comparison have changed a little - stop using the comparison checker

create

	make

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION; a_collator: ST_COLLATOR) is
			-- Establish invariant
		require
			operand_1_not_void: an_operand_one /= Void
			operand_2_not_void: an_operand_two /= Void
			value_comparison_operator: is_value_comparison_operator (a_token)
		do
			make_binary_expression (an_operand_one, a_token, an_operand_two)
			create atomic_comparer.make (a_collator)
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			operator_set: operator = a_token
			operand_1_set: first_operand /= Void and then first_operand.same_expression (an_operand_one)
			operand_2_set: second_operand /= Void and then second_operand.same_expression (an_operand_two)
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			set_first_operand (l_replacement.item)
			if first_operand.is_error or else first_operand.is_empty_sequence then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
				set_second_operand (l_replacement.item)
				if second_operand.is_error or else second_operand.is_empty_sequence then
					set_replacement (a_replacement, second_operand)
				else
					check_atomic_types (a_replacement, a_context)
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			set_first_operand (l_replacement.item)
			if first_operand.is_error or else first_operand.is_empty_sequence then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.optimize (l_replacement, a_context, a_context_item_type)
				set_second_operand (l_replacement.item)
				if second_operand.is_error or else second_operand.is_empty_sequence then
					set_replacement (a_replacement, second_operand)
				else
					optimize_stage_2 (a_replacement, a_context, a_context_item_type)
				end
			end
			if a_replacement.item = Void then
				evaluate_now (a_replacement, a_context)
			end
		end


feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			l_item, l_other_item: XM_XPATH_ITEM
			l_atomic_value, l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_result: DS_CELL [XM_XPATH_ITEM]
		do
			create l_result.make (Void)
			first_operand.evaluate_item (l_result, a_context)
			l_item := l_result.item
			if l_item = Void then

				-- empty sequence

				create last_boolean_value.make (False)
			elseif l_item.is_error then
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (l_item.error_value)
			else
				create l_result.make (Void)
				second_operand.evaluate_item (l_result, a_context)
				l_other_item := l_result.item
				if l_other_item = Void then
					create last_boolean_value.make (False)
				elseif l_other_item.is_error then
					create last_boolean_value.make (False)
					last_boolean_value.set_last_error (l_other_item.error_value)
				else
					if not l_item.is_atomic_value then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error_from_string ("Atomization failed for second operand of value comparison", Xpath_errors_uri, "XPTY0004", Type_error)
					elseif not l_other_item.is_atomic_value then
						create last_boolean_value.make (False)
						last_boolean_value.set_last_error_from_string ("Atomization failed for second operand of value comparison", Xpath_errors_uri, "XPTY0004", Type_error)
					else
						l_atomic_value := l_item.as_atomic_value
						if l_atomic_value.is_untyped_atomic then
							l_atomic_value.convert_to_type (type_factory.string_type)
							l_atomic_value := l_atomic_value.converted_value
						end
						l_other_atomic_value := l_other_item.as_atomic_value
						if l_other_atomic_value.is_untyped_atomic then
							l_other_atomic_value.convert_to_type (type_factory.string_type)
							l_other_atomic_value := l_other_atomic_value.converted_value
						end
						if a_context /= Void then atomic_comparer.set_dynamic_context (a_context) end
						check_correct_relation (l_atomic_value, operator, atomic_comparer, l_other_atomic_value)
						if is_error then
							create last_boolean_value.make (False)
							last_boolean_value.set_last_error (error_value)
						elseif last_check_result then
							create last_boolean_value.make (True)
						else
							create last_boolean_value.make (False)
						end
					end
				end
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_atomic_value, l_other_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			first_operand.evaluate_item (a_result, a_context)
			if a_result.item /= Void and then not a_result.item.is_error then
				check
					atomic_value: a_result.item.is_atomic_value
				end
				l_atomic_value := a_result.item.as_atomic_value
				if l_atomic_value.is_untyped_atomic then
					l_atomic_value.convert_to_type (type_factory.string_type)
					l_atomic_value := l_atomic_value.converted_value
				end
				a_result.put (Void)
				second_operand.evaluate_item (a_result, a_context)
				if a_result.item /= Void and then not a_result.item.is_error then
					check
						second_atomic_value: a_result.item.is_atomic_value
					end
					l_other_atomic_value := a_result.item.as_atomic_value
					if l_other_atomic_value.is_untyped_atomic then
						l_other_atomic_value.convert_to_type (type_factory.string_type)
						l_other_atomic_value := l_other_atomic_value.converted_value
					end
					if a_context /= Void then atomic_comparer.set_dynamic_context (a_context) end
					check_correct_relation (l_atomic_value, operator, atomic_comparer, l_other_atomic_value)
					if is_error then
						create l_boolean_value.make (False)
						l_boolean_value.set_last_error (error_value)
					elseif last_check_result then
						create l_boolean_value.make (True)
					else
						create l_boolean_value.make (False)
					end
					a_result.put (l_boolean_value)
				end
			end
		end

feature {NONE} -- Implementation

	atomic_comparer: XM_XPATH_ATOMIC_COMPARER
			-- Comparer for atomic values

	is_zero (an_expression: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `an_expression' a constant zero?
		require
			expression_not_void: an_expression /= Void
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			if an_expression.is_atomic_value then
				an_atomic_value := an_expression.as_atomic_value
				if an_atomic_value.is_numeric_value then
					Result := an_atomic_value.as_numeric_value.is_zero
				elseif an_atomic_value.is_convertible (type_factory.integer_type) then
					an_atomic_value.convert_to_type (type_factory.integer_type)
					Result := an_atomic_value.converted_value.as_integer_value.is_zero
				end
			end
		end

	check_atomic_types (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Check static typing for two atomic types.
		require
			a_context_not_void: a_context /= Void
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_atomic_type: XM_XPATH_SEQUENCE_TYPE
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_type_checker: XM_XPATH_TYPE_CHECKER
		do
			create l_type_checker
			create l_atomic_type.make (type_factory.any_atomic_type, Required_cardinality_optional)
			create l_role.make (Binary_expression_role, token_name (operator), 1, Xpath_errors_uri, "XPTY0004")
			l_type_checker.static_type_check (a_context, first_operand, l_atomic_type, False, l_role)
			if l_type_checker.is_static_type_check_error then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
			else
				set_first_operand (l_type_checker.checked_expression)
				create l_other_role.make (Binary_expression_role, token_name (operator), 2, Xpath_errors_uri, "XPTY0004")
				l_type_checker.static_type_check (a_context, second_operand, l_atomic_type, False, l_role)
				if l_type_checker.is_static_type_check_error then
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
				else
					set_second_operand (l_type_checker.checked_expression)
					check_type_comparison (a_replacement, a_context, first_operand.item_type.atomized_item_type, second_operand.item_type.atomized_item_type)
				end
			end
		ensure
			replaced: a_replacement.item /= Void			
		end

	check_type_comparison (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT
		a_type, a_other_type: XM_XPATH_ATOMIC_TYPE)
			-- Check types are comparable.
		require
			a_context_not_void: a_context /= Void
			a_type_not_void: a_type /= Void
			a_other_type_not_void: a_other_type /= Void
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_first_optional, l_second_optional: BOOLEAN
			l_primitive_type, l_other_primitive_type: INTEGER
			l_message: STRING
		do
			if a_type.primitive_type = Untyped_atomic_type_code then
				l_primitive_type := String_type_code
			else
				l_primitive_type := a_type.primitive_type
			end
			if a_other_type.primitive_type = Untyped_atomic_type_code then
				l_other_primitive_type := String_type_code
			else
				l_other_primitive_type := a_other_type.primitive_type
			end
			if not are_types_comparable (l_primitive_type, l_other_primitive_type) then
				l_first_optional := first_operand.cardinality_allows_zero
				l_second_optional := second_operand.cardinality_allows_zero
				if l_first_optional or else l_second_optional then
					warn_comparison_failure (a_context, l_first_optional, l_second_optional, a_type, a_other_type)
				else
					l_message := STRING_.concat ("Cannot compare ", a_type.conventional_name)
					l_message := STRING_.appended_string (l_message, " with ")
					l_message := STRING_.appended_string (l_message, a_other_type.conventional_name)
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error))
				end
			end
			if a_replacement.item = Void and not (operator = Fortran_equal_token or else operator = Fortran_not_equal_token) then
				if not is_ordered (l_primitive_type) then
					l_message := STRING_.concat ("Type ", a_type.conventional_name)
					l_message := STRING_.appended_string (l_message, " is not an ordered type")
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error))
				elseif not is_ordered (l_other_primitive_type) then
					l_message := STRING_.concat ("Type ", a_other_type.conventional_name)
					l_message := STRING_.appended_string (l_message, " is not an ordered type")
					set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error))
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void			
		end

	optimize_stage_2 (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform context-dependent optimizations.
		require
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		do
			optimize_count (a_replacement, a_context, a_context_item_type)
			if a_replacement.item = Void then

				-- We haven't managed to optimize anything yet, so:

				if second_operand.is_count_function and is_zero (first_operand) then
					optimize_count_second_operand (a_replacement, a_context, second_operand.as_count_function, a_context_item_type)
				else

					-- Optimise string-length(x) = 0, >0, !=0 etc.

					if first_operand.is_string_length_function and then is_zero (second_operand) then
						first_operand.as_string_length_function.set_test_for_zero
					else

						-- Optimise 0 = string-length(x), etc.

						if second_operand.is_string_length_function and then is_zero (first_operand) then
							second_operand.as_string_length_function.set_test_for_zero
						end
					end
					optimize_position (a_replacement, a_context)
					if a_replacement.item = Void then
						optimize_last (a_replacement, a_context)
						if a_replacement.item = Void then

							-- We haven't managed to optimize anything yet, so:

							optimize_generate_id (a_replacement, a_context, a_context_item_type)
						end
					end
				end
			end
		end

	optimize_generate_id (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimize generate-id(X) eq generate-id(Y) as "X is Y".
			-- This construct is often used in XSLT 1.0 stylesheets.
			-- Only do this if we know the arguments are singletons, because "is" doesn't
			-- do first-value extraction.
		require
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void		
		local
			l_function, l_other_function: XM_XPATH_SYSTEM_FUNCTION
			l_identity_comparison: XM_XPATH_IDENTITY_COMPARISON
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if operator = Fortran_equal_token then
				if first_operand.is_generate_id_function and then second_operand.is_generate_id_function then
					l_function := first_operand.as_system_function
					l_other_function := second_operand.as_system_function
					if l_function.supplied_argument_count = 1 and l_other_function.supplied_argument_count = 1 and
						not l_function.arguments.item (1).cardinality_allows_many and
						not l_other_function.arguments.item (1).cardinality_allows_many then
						create l_identity_comparison.make (l_function.arguments.item (1), Is_token, l_other_function.arguments.item (1))
						l_identity_comparison.set_generate_id_emulation
						create l_replacement.make (Void)
						l_identity_comparison.simplify (l_replacement)
						l_expression := l_replacement.item
						l_replacement.put (Void)
						l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
						l_expression := l_replacement.item
						l_replacement.put (Void)
						l_expression.optimize (l_replacement, a_context, a_context_item_type)
						set_replacement (a_replacement, l_expression)
					end
				end
			end
		end

	optimize_count (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimise count(x) eq 0 (or gt 0, ne 0, eq 0, etc).
		require
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void		
		local
			l_count_function: XM_XPATH_COUNT
			l_expression: XM_XPATH_EXPRESSION
			l_function_library: XM_XPATH_FUNCTION_LIBRARY
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			if first_operand.is_count_function and second_operand.is_atomic_value then
				l_count_function := first_operand.as_count_function
				if l_count_function.arguments.count = 1 then
					l_function_library := a_context.available_functions
					if is_zero (second_operand.as_atomic_value) then
						l_expression := count_equals_zero_expression (l_function_library, l_count_function)
					else
						if second_operand.is_machine_integer_value and (operator = Fortran_greater_than_token or operator = Fortran_greater_equal_token) then
							l_expression := count_greater_expression (l_function_library, l_count_function)
						end
					end
					if l_expression /= Void then
						create l_replacement.make (Void)
						l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
						l_expression := l_replacement.item
						l_replacement.put (Void)
						l_expression.optimize (l_replacement, a_context, a_context_item_type)
						set_replacement (a_replacement, l_replacement.item)
					end
				end
			end
		end

	count_equals_zero_expression (a_function_library: XM_XPATH_FUNCTION_LIBRARY; a_count_function: XM_XPATH_COUNT): XM_XPATH_EXPRESSION is
			-- Optimized expression for count(x) rel-op 0
		require
			a_function_library_not_void: a_function_library /= Void
			a_count_function_not_void: a_count_function /= Void
		do
			if operator = Fortran_equal_token or operator = Fortran_less_equal_token then
				-- Rewrite count(x)=0 as empty(x).
				a_function_library.bind_function (Empty_function_type_code, a_count_function.arguments, False)
				Result := a_function_library.last_bound_function.as_empty_function
			elseif operator = Fortran_not_equal_token or operator = Fortran_greater_than_token then
				-- Rewrite count(x)!=0, count(x)>0 as exists(x)
				a_function_library.bind_function (Exists_function_type_code, a_count_function.arguments, False)
				Result := a_function_library.last_bound_function.as_exists_function
			elseif operator = Fortran_greater_equal_token then
				-- Rewrite count(x)>=0 as true()
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)
			else
				-- Rewrite count(x)<0 as false()
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
			end
		ensure
			count_equals_zero_expression_not_void: Result /= Void
		end

	count_greater_expression (a_function_library: XM_XPATH_FUNCTION_LIBRARY; a_count_function: XM_XPATH_COUNT): XM_XPATH_EXPRESSION is
			-- Optimized expression for count(x) gt/ge n
		require
			a_function_library_not_void: a_function_library /= Void
			a_count_function_not_void: a_count_function /= Void
		local
			l_integer: INTEGER_64
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_new_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			l_filter_expression: XM_XPATH_FILTER_EXPRESSION
		do
			-- Rewrite count(x) gt n as exists(x[n+1])
			--  and count(x) ge n as exists(x[n])
			l_integer := second_operand.as_machine_integer_value.value
			if operator = Fortran_greater_than_token then
				l_integer := l_integer + 1
			end
			create l_new_arguments.make (1)
			create l_integer_value.make (l_integer)
			create l_filter_expression.make (a_count_function.arguments.item(1), l_integer_value)
			l_new_arguments.put (l_filter_expression, 1)
			a_function_library.bind_function (Exists_function_type_code, l_new_arguments, False)
			Result := a_function_library.last_bound_function.as_exists_function
		ensure
			count_greater_expression_not_void: Result /= Void
		end
							
	optimize_count_second_operand (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT;
		a_count_function: XM_XPATH_COUNT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Optimise (0 eq count(x)), etc. by inversion.
		require
			context_not_void: a_context /= Void
			context_item_may_not_be_set: True
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void		
		local
			l_expression: XM_XPATH_EXPRESSION
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create {XM_XPATH_VALUE_COMPARISON} l_expression.make (a_count_function, inverse_operator (operator), first_operand, atomic_comparer.collator)
			create l_replacement.make (Void)
			l_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			l_expression := l_replacement.item
			l_replacement.put (Void)
			l_expression.optimize (l_replacement, a_context, a_context_item_type)
			set_replacement (a_replacement, l_replacement.item)
		ensure
			replaced: a_replacement.item /= Void
		end

	optimize_position (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Optimise position() < n etc.
		require
			context_not_void: a_context /= Void
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_position: INTEGER_64
			l_integer: INTEGER
			l_expression: XM_XPATH_EXPRESSION
		do
			if first_operand.is_position_function and second_operand.is_machine_integer_value then
				l_position := second_operand.as_machine_integer_value.value
				if l_position <= Platform.Maximum_integer then
					l_integer := l_position.to_integer.max (0)
					l_expression := first_position_range_expression (l_integer)
				end
			elseif second_operand.is_position_function and then first_operand.is_machine_integer_value then
				l_position := first_operand.as_machine_integer_value.value.to_integer
				if l_position <= Platform.Maximum_integer then
					l_integer := l_position.to_integer.max (0)
					l_expression := second_position_range_expression (l_integer)
				end
			end
			if l_expression /= Void then
				set_replacement (a_replacement, l_expression)
			end
		end

	second_position_range_expression (a_integer: INTEGER): XM_XPATH_POSITION_RANGE is
			-- Second argument position range expression for `a_integer'
		require
			a_integer_non_negative: a_integer >= 0
		do
			inspect
				operator
			when Fortran_equal_token then
				create Result.make (a_integer, a_integer)
			when Fortran_less_equal_token then
				create Result.make (a_integer, Platform.Maximum_integer)
			when Fortran_not_equal_token then
				if a_integer.to_integer = 1 then
					create Result.make (2, Platform.Maximum_integer)
				end
			when Fortran_greater_than_token then
				create Result.make (1, a_integer - 1)
			when Fortran_less_than_token then
				create Result.make (a_integer + 1, Platform.Maximum_integer)
			when Fortran_greater_equal_token then
				create Result.make (1, a_integer)
			end
		end

	first_position_range_expression (a_integer: INTEGER): XM_XPATH_POSITION_RANGE is
			-- First argument position range expression for `a_integer'
		require
			a_integer_non_negative: a_integer >= 0
		do
			inspect
				operator
			when Fortran_equal_token then
				create Result.make (a_integer, a_integer)
			when Fortran_greater_equal_token then
				create Result.make (a_integer, Platform.Maximum_integer)
			when Fortran_not_equal_token then
				if a_integer = 1 then
					create Result.make (2, Platform.Maximum_integer)
				end
			when Fortran_less_than_token then
				create Result.make (1, a_integer - 1)
			when Fortran_greater_than_token then
				create Result.make (a_integer + 1, Platform.Maximum_integer)
			when Fortran_less_equal_token then
				create Result.make (1, a_integer)
			end
		end

	optimize_last (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Optimize position()=last(), last()=position(), etc.
		require
			context_not_void: a_context /= Void
			no_previous_error: not is_error
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_expression: XM_XPATH_EXPRESSION
		do
			if first_operand.is_position_function and second_operand.is_last_function then

				-- Optimise position()=last() etc.

				inspect
					operator
				when Fortran_equal_token, Fortran_greater_equal_token then
					create {XM_XPATH_IS_LAST_EXPRESSION} l_expression.make (True)
				when Fortran_not_equal_token, Fortran_less_than_token then
					create {XM_XPATH_IS_LAST_EXPRESSION} l_expression.make (False)
				when Fortran_greater_than_token then
					create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (False)
				when Fortran_less_equal_token then
					create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (True)
				end
				set_replacement (a_replacement, l_expression)
			elseif second_operand.is_position_function and first_operand.is_last_function then

				-- Optimise last()=position() etc.

				inspect
					operator
				when Fortran_equal_token, Fortran_less_equal_token then
					create {XM_XPATH_IS_LAST_EXPRESSION} l_expression.make (True)
				when Fortran_not_equal_token, Fortran_greater_than_token then
					create {XM_XPATH_IS_LAST_EXPRESSION} l_expression.make (False)
				when Fortran_less_than_token then
					create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (False)
				when Fortran_greater_equal_token then
					create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (True)
				end
				set_replacement (a_replacement, l_expression)
			end
		end

	evaluate_now (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Evaluate the expression now if both arguments are constant.
		require
			a_context_not_void: a_context /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_result: DS_CELL [XM_XPATH_ITEM]
			l_invalid_value: XM_XPATH_INVALID_VALUE
		do
			if first_operand.is_value and not first_operand.depends_upon_implicit_timezone and
				second_operand.is_value and not second_operand.depends_upon_implicit_timezone then
				create l_result.make (Void)
				evaluate_item (l_result, a_context.new_compile_time_context)
				check
					empty_sequence_not_possible: l_result.item /= Void
					-- boolean comparison
				end
				if l_result.item.is_error then
					create l_invalid_value.make (l_result.item.error_value)
					set_replacement (a_replacement, l_invalid_value)
				else
					set_replacement (a_replacement, l_result.item.as_boolean_value)
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void						
		end

	warn_comparison_failure (a_context: XM_XPATH_STATIC_CONTEXT;
									 is_first_optional, is_second_optional: BOOLEAN;
									 a_type, a_other_type: XM_XPATH_ATOMIC_TYPE) is
			-- Warn of probable comparison failure.
		require
			context_not_void: a_context /= Void
			first_type_not_void: a_type /= Void
			second_type_not_void: a_other_type /= Void
		local
			l_message: STRING
		do

			-- This is a comparison such as (xs:integer? eq xs:date?).
			-- This is almost certainly an error, but we need to let it through
			--  because it will work if one of the operands is an empty sequence.

			l_message := STRING_.concat ("Comparison of ", a_type.conventional_name)
			if is_first_optional then
				l_message := STRING_.appended_string (l_message, "?")
			end
			l_message := STRING_.appended_string (l_message, " with ")
			l_message := STRING_.appended_string (l_message, a_other_type.conventional_name)
			if is_second_optional then
				l_message := STRING_.appended_string (l_message, "?")
			end
			l_message := STRING_.appended_string (l_message, " will fail unless ")
			if is_first_optional and then is_second_optional then
				l_message := STRING_.appended_string (l_message, "one or both operands are")
			elseif is_first_optional then
				l_message := STRING_.appended_string (l_message, "the first operand is")
			else
				l_message := STRING_.appended_string (l_message, "the second operand is")
			end
			l_message := STRING_.appended_string (l_message, " empty.")
			a_context.issue_warning (l_message)
		end

	check_correct_relation (a_atomic_value: XM_XPATH_ATOMIC_VALUE; a_operator: INTEGER;
											a_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; a_other_value: XM_XPATH_ATOMIC_VALUE) is
			-- Compare two atomic values
		require
			first_value_not_void: a_atomic_value /= Void
			second_value_not: a_other_value /= Void
			valid_value_operator: is_value_comparison_operator (a_operator)
			comparer_not_void: a_atomic_comparer /= Void
			no_previous_error: not is_error
		local
			l_message: STRING
		do
			if a_atomic_value.is_numeric_value and then a_atomic_value.as_numeric_value.is_nan then
				last_check_result := (a_operator = Fortran_not_equal_token)
			elseif a_other_value.is_numeric_value and then a_other_value.as_numeric_value.is_nan then
				last_check_result := (a_operator = Fortran_not_equal_token)
			elseif a_atomic_comparer.are_comparable (a_atomic_value, a_other_value) then
				inspect
					a_operator
				when Fortran_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) = 0
				when Fortran_not_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) /= 0
				when Fortran_greater_than_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) = 1
				when Fortran_less_than_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) = -1
				when Fortran_greater_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) /= -1
				when Fortran_less_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_value) /= 1
				end
			elseif a_operator = Fortran_equal_token and a_atomic_value.is_duration_value and a_other_value.is_duration_value then
				last_check_result := a_atomic_value.as_duration_value.equal_duration (a_other_value.as_duration_value)
			else
				l_message := STRING_.appended_string ("Cannot compare ", a_atomic_value.item_type.conventional_name)
				l_message := STRING_.appended_string (l_message, " with ")
				l_message := STRING_.appended_string (l_message, a_other_value.item_type.conventional_name)
				create error_value.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error)
			end
		end

	last_check_result: BOOLEAN
			-- Result from `check_correct_relation' if no type error

invariant

	value_comparison_operator: is_value_comparison_operator (operator)

end

