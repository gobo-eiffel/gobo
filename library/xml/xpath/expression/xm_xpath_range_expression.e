note

	description:

		"XPath range expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RANGE_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			check_static_type, optimize, compute_cardinality, create_iterator, make,
			is_range_expression, as_range_expression
		end

	XM_XPATH_ROLE

	KL_SHARED_PLATFORM
		export {NONE} all end

create

	make

		-- The sequence must be ascending; if the end-point is less
		--  than the start-point, an empty sequence is returned. This is to allow
		--  expressions of the form "for $i in 1 to count($seq) return ...."

feature {NONE} -- Initialization

	make (an_operand_one: XM_XPATH_EXPRESSION; a_token: INTEGER; an_operand_two: XM_XPATH_EXPRESSION)
			-- Establish invariant
		do
			Precursor (an_operand_one, a_token, an_operand_two)
			initialized := True
		end

feature -- Access

	is_range_expression: BOOLEAN
			-- Is `Current' a range expression?
		do
			Result := True
		end

	as_range_expression: XM_XPATH_RANGE_EXPRESSION
			-- `Current' seen as a range expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	lower_bound: XM_XPATH_EXPRESSION
			-- Inclusive lower bound
		do
			Result := first_operand
		end

	upper_bound: XM_XPATH_EXPRESSION
			-- Inclusive upper bound
		do
			Result := second_operand
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_role, l_other_role: XM_XPATH_ROLE_LOCATOR
			l_sequence_type: XM_XPATH_SEQUENCE_TYPE
			l_type_checker: XM_XPATH_TYPE_CHECKER
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.check_static_type (l_replacement, a_context, a_context_item_type)
			set_first_operand (l_replacement.item)
			if first_operand.is_error then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.check_static_type (l_replacement, a_context, a_context_item_type)
				set_second_operand (l_replacement.item)
				if second_operand.is_error then
					set_replacement (a_replacement, second_operand)
				else
					create l_sequence_type.make_optional_integer
					create l_role.make (Binary_expression_role, "to", 1, Xpath_errors_uri, "XPTY0004")
					create l_type_checker
					l_type_checker.static_type_check (a_context, first_operand, l_sequence_type, False, l_role)
					if l_type_checker.is_static_type_check_error then
						set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
					else
						set_first_operand (l_type_checker.checked_expression)
						create l_other_role.make (Binary_expression_role, "to", 2, Xpath_errors_uri, "XPTY0004")
						l_type_checker.static_type_check (a_context, second_operand, l_sequence_type, False, l_other_role)
						if l_type_checker.is_static_type_check_error then
							set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make (l_type_checker.static_type_check_error))
						else
							set_second_operand (l_type_checker.checked_expression)
							a_replacement.put (Current)
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_integer, l_other_integer: INTEGER_64
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_integer_range: XM_XPATH_INTEGER_RANGE
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			first_operand.optimize (l_replacement, a_context, a_context_item_type)
			set_first_operand (l_replacement.item)
			if first_operand.is_error then
				set_replacement (a_replacement, first_operand)
			else
				l_replacement.put (Void)
				second_operand.optimize (l_replacement, a_context, a_context_item_type)
				set_second_operand (l_replacement.item)
				if second_operand.is_error then
					set_replacement (a_replacement, second_operand)
				else
					if first_operand.is_machine_integer_value and second_operand.is_machine_integer_value then
						l_integer := first_operand.as_machine_integer_value.as_integer
						l_other_integer := second_operand.as_machine_integer_value.as_integer
						if l_integer > l_other_integer then
							set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
						elseif l_integer = l_other_integer then
							create l_integer_value.make (l_integer)
							set_replacement (a_replacement, l_integer_value)
						elseif l_integer.abs <=  Platform.Maximum_integer and l_other_integer.abs <=  Platform.Maximum_integer then
							create l_integer_range.make (l_integer.to_integer_32, l_other_integer.to_integer_32)
							set_replacement (a_replacement, l_integer_range)
						else
							a_replacement.put (Current)
						end
					else
						a_replacement.put (Current)
					end
				end
			end
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_integer_value, l_other_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_result: DS_CELL [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
		do
			create l_result.make (Void)
			first_operand.evaluate_item (l_result, a_context)
			if l_result.item = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif l_result.item.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
			else
				if not (l_result.item.is_machine_integer_value or l_result.item.is_integer_value) then
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
				else
					l_item := l_result.item
					create l_result.make (Void)
					second_operand.evaluate_item (l_result, a_context)
					if l_result.item = Void then
						create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
					elseif l_result.item /= Void and then l_result.item.is_error then
						create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.item.error_value)
					else
						if not (l_result.item.is_machine_integer_value or l_result.item.is_integer_value) then
							create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
						else
							if l_item.is_integer_value then
								if l_item.as_integer_value.is_platform_integer then
									create {XM_XPATH_MACHINE_INTEGER_VALUE} l_item.make (l_item.as_integer_value.as_integer)
								end
							end
							if l_result.item.is_integer_value then
								if l_result.item.as_integer_value.is_platform_integer then
									l_result.put (create {XM_XPATH_MACHINE_INTEGER_VALUE}.make (l_result.item.as_integer_value.as_integer))
								end
							end
							if l_item.is_machine_integer_value and l_result.item.is_machine_integer_value then
								l_integer_value := l_item.as_machine_integer_value
								l_other_integer_value := l_result.item.as_machine_integer_value
								if l_integer_value.value > l_other_integer_value.value then
									create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
								else
									create {XM_XPATH_RANGE_ITERATOR} last_iterator.make (l_integer_value.as_integer, l_other_integer_value.as_integer)
								end
							else
								todo ("iterator - large integers", True)
							end
						end
					end
				end
			end
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

end
