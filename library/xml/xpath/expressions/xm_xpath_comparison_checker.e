indexing

	description:

		"Objects that check for comparison type erros"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMPARISON_CHECKER

inherit

	KL_IMPORTED_STRING_ROUTINES

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_TOKENS

	XM_XPATH_COMPARISON_ROUTINES

feature -- Comparison

	check_correct_general_relation (an_atomic_value: XM_XPATH_ATOMIC_VALUE; an_operator: INTEGER;
										  an_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; another_atomic_value: XM_XPATH_ATOMIC_VALUE; backwards_compatible: BOOLEAN) is
			-- Compare two atomic values
		require
			first_value_not_void: an_atomic_value /= Void
			second_value_not: another_atomic_value /= Void
			valid_value_operator: is_value_comparison_operator (an_operator)
			comparer_not_void: an_atomic_comparer /= Void
		local
			an_atomic_value_one, an_atomic_value_two: XM_XPATH_ATOMIC_VALUE
			an_untyped_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_numeric_value, another_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			is_comparison_type_error := False
			an_atomic_value_one := an_atomic_value
			an_untyped_value ?= an_atomic_value
			if an_untyped_value /= Void then
				a_numeric_value ?= another_atomic_value
				if a_numeric_value /= Void then
					if an_atomic_value.is_convertible (type_factory.double_type) then
						an_atomic_value_one := an_atomic_value.convert_to_type (type_factory.double_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string ("Could not convert first general comparison operand to xs:double", "XP0003", Type_error)
					end
				else
					if an_atomic_value.is_convertible (another_atomic_value.item_type) then
						an_atomic_value_one := an_atomic_value.convert_to_type (another_atomic_value.item_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string (STRING_.appended_string ("Could not convert first general comparison operand to ", another_atomic_value.item_type.conventional_name), "XP0003", Type_error)
					end
				end
			end
			if not is_comparison_type_error then
				an_atomic_value_two := another_atomic_value
				an_untyped_value ?= another_atomic_value
				if an_untyped_value /= Void then
					a_numeric_value ?= an_atomic_value
					if a_numeric_value /= Void then
						if another_atomic_value.is_convertible (type_factory.double_type) then
							an_atomic_value_two := another_atomic_value.convert_to_type (type_factory.double_type)
						else
							is_comparison_type_error := True
							create last_type_error.make_from_string ("Could not convert second general comparison operand to xs:double", "XP0003", Type_error)
						end
					else
						if another_atomic_value.is_convertible (an_atomic_value.item_type) then
							an_atomic_value_two := another_atomic_value.convert_to_type (an_atomic_value.item_type)
						else
							is_comparison_type_error := True
							create last_type_error.make_from_string (STRING_.appended_string ("Could not convert second general comparison operand to ", another_atomic_value.item_type.conventional_name), "XP0006", Type_error)
						end
					end
				end
			end
			if backwards_compatible and not is_comparison_type_error then
				a_numeric_value ?= an_atomic_value_one
				another_numeric_value ?= an_atomic_value_two
				if a_numeric_value /= Void or else another_numeric_value /= Void then
					if a_numeric_value.is_convertible (type_factory.double_type) and then another_numeric_value.is_convertible (type_factory.double_type) then
						an_atomic_value_one := an_atomic_value_one.convert_to_type (type_factory.double_type)
						an_atomic_value_two := an_atomic_value_two.convert_to_type (type_factory.double_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string ("Could not convert both operands of general comparison in XPath 1.0 compatibility mode operand to xs:double", "XP0006", Type_error)
					end
				end
			end
			if not is_comparison_type_error then
				check_correct_value_relation (an_atomic_value_one, an_operator, an_atomic_comparer, an_atomic_value_two)
			end
		end

	check_correct_value_relation (an_atomic_value: XM_XPATH_ATOMIC_VALUE; an_operator: INTEGER;
											an_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; another_atomic_value: XM_XPATH_ATOMIC_VALUE) is
			-- Compare two atomic values
		require
			first_value_not_void: an_atomic_value /= Void
			second_value_not: another_atomic_value /= Void
			valid_value_operator: is_value_comparison_operator (an_operator)
			comparer_not_void: an_atomic_comparer /= Void
		local
			a_message: STRING
		do
			is_comparison_type_error := False
			if an_atomic_comparer.are_comparable (an_atomic_value, another_atomic_value) then
				inspect
					an_operator
				when Fortran_equal_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) = 0
				when Fortran_not_equal_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) /= 0
				when Fortran_greater_than_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) = 1
				when Fortran_less_than_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) = -1
				when Fortran_greater_equal_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) /= -1
				when Fortran_less_equal_token then
					last_check_result := an_atomic_comparer.three_way_comparison (an_atomic_value, another_atomic_value) /= 1
				end
			else
				is_comparison_type_error := True
				a_message := STRING_.appended_string ("Cannot compare ", an_atomic_value.item_type.conventional_name)
				a_message := STRING_.appended_string (a_message, " with ")
				a_message := STRING_.appended_string (a_message, another_atomic_value.item_type.conventional_name)
				create last_type_error.make_from_string (a_message, "XP0006", Type_error)
			end
		end

feature -- Status report

	is_comparison_type_error: BOOLEAN
			-- Did one of these routines detect a type error?

	last_type_error: XM_XPATH_ERROR_VALUE
			-- Error value if `is_comparison_type_error' is `True'

	last_check_result: BOOLEAN
			-- Result from `check_correct_value_relation' if no type error

end
	
