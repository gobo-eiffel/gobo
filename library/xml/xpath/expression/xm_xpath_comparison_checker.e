indexing

	description:

		"Objects that check for comparison type erros"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMPARISON_CHECKER

inherit

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_TOKENS
		export {NONE} all end

	XM_XPATH_COMPARISON_ROUTINES

feature -- Comparison

	check_correct_general_relation_xpath1 (a_atomic_value: XM_XPATH_ATOMIC_VALUE; a_operator: INTEGER;
		a_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; a_other_atomic_value: XM_XPATH_ATOMIC_VALUE) is
			-- Compare two atomic values for XPath 1.0 compatibility.
		require
			first_value_not_void: a_atomic_value /= Void
			second_value_not: a_other_atomic_value /= Void
			valid_value_operator: is_value_comparison_operator (a_operator)
			comparer_not_void: a_atomic_comparer /= Void
		local		l_atomic_value_one, l_atomic_value_two: XM_XPATH_ATOMIC_VALUE
		do
			is_comparison_type_error := False
			l_atomic_value_one := a_atomic_value
			l_atomic_value_two := a_other_atomic_value
			if a_atomic_value.is_numeric_value and not a_other_atomic_value.is_numeric_value then
				l_atomic_value_one := l_atomic_value_one.convert_to_type (type_factory.double_type)
				if l_atomic_value_two.is_convertible (type_factory.double_type) then
					l_atomic_value_two := l_atomic_value_two.convert_to_type (type_factory.double_type)
				else
					create {XM_XPATH_DOUBLE_VALUE} l_atomic_value_two.make_nan
				end
			elseif not a_atomic_value.is_numeric_value and a_other_atomic_value.is_numeric_value then
				l_atomic_value_two := l_atomic_value_two.convert_to_type (type_factory.double_type)
				if l_atomic_value_one.is_convertible (type_factory.double_type) then
					l_atomic_value_one := l_atomic_value_one.convert_to_type (type_factory.double_type)
				else
					create {XM_XPATH_DOUBLE_VALUE} l_atomic_value_one.make_nan
				end
			end
			if not is_comparison_type_error then
				if l_atomic_value_one.is_string_value and not l_atomic_value_two.is_string_value then
					l_atomic_value_two := l_atomic_value_two.convert_to_type (type_factory.string_type)
				end
				if l_atomic_value_two.is_string_value and not l_atomic_value_one.is_string_value then
					l_atomic_value_one := l_atomic_value_one.convert_to_type (type_factory.string_type)
				end
				if l_atomic_value_one.is_untyped_atomic and not (l_atomic_value_two.is_untyped_atomic or l_atomic_value_two.is_string_value) then
					if l_atomic_value_one.is_convertible (l_atomic_value_two.item_type) then
						l_atomic_value_one := l_atomic_value_one.convert_to_type (l_atomic_value_two.item_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string ("Could not convert first operand of general comparison in XPath 1.0 compatibility mode operand to dynamic type of second operand",
							Xpath_errors_uri, "FORG0001", Type_error)
					end
				end
				if not is_comparison_type_error and l_atomic_value_two.is_untyped_atomic and not (l_atomic_value_one.is_untyped_atomic or l_atomic_value_one.is_string_value) then
					if l_atomic_value_two.is_convertible (l_atomic_value_one.item_type) then
						l_atomic_value_two := l_atomic_value_two.convert_to_type (l_atomic_value_one.item_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string ("Could not convert second operand of general comparison in XPath 1.0 compatibility mode operand to dynamic type of first operand",
							Xpath_errors_uri, "FORG0001", Type_error)
					end
				end					
			end
			if not is_comparison_type_error then
				check_correct_value_relation (l_atomic_value_one, a_operator, a_atomic_comparer, l_atomic_value_two)
			end
		end
	
	check_correct_general_relation_xpath2 (a_atomic_value: XM_XPATH_ATOMIC_VALUE; a_operator: INTEGER;
		a_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; a_other_atomic_value: XM_XPATH_ATOMIC_VALUE) is
			-- Compare two atomic values for XPath 2.0.
		require
			first_value_not_void: a_atomic_value /= Void
			second_value_not: a_other_atomic_value /= Void
			valid_value_operator: is_value_comparison_operator (a_operator)
			comparer_not_void: a_atomic_comparer /= Void
		local
			l_atomic_value_one, l_atomic_value_two: XM_XPATH_ATOMIC_VALUE
		do
			is_comparison_type_error := False
			l_atomic_value_one := a_atomic_value
			if a_atomic_value.is_untyped_atomic then
				if a_other_atomic_value.is_numeric_value then
					if a_atomic_value.is_convertible (type_factory.double_type) then
						l_atomic_value_one := a_atomic_value.convert_to_type (type_factory.double_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string ("Could not convert first general comparison operand to xs:double", Xpath_errors_uri, "FORG0001", Type_error)
					end
				else
					if a_atomic_value.is_convertible (a_other_atomic_value.item_type) then
						l_atomic_value_one := a_atomic_value.convert_to_type (a_other_atomic_value.item_type)
					else
						is_comparison_type_error := True
						create last_type_error.make_from_string (STRING_.appended_string ("Could not convert first general comparison operand to ", a_other_atomic_value.item_type.conventional_name),
																			  Xpath_errors_uri, "FORG0001", Type_error)
					end
				end
			end
			if not is_comparison_type_error then
				l_atomic_value_two := a_other_atomic_value
				if a_other_atomic_value.is_untyped_atomic then
					if a_atomic_value.is_numeric_value then
						if a_other_atomic_value.is_convertible (type_factory.double_type) then
							l_atomic_value_two := a_other_atomic_value.convert_to_type (type_factory.double_type)
						else
							is_comparison_type_error := True
							create last_type_error.make_from_string ("Could not convert second general comparison operand to xs:double", Xpath_errors_uri, "FORG0001", Type_error)
						end
					else
						if a_other_atomic_value.is_convertible (a_atomic_value.item_type) then
							l_atomic_value_two := a_other_atomic_value.convert_to_type (a_atomic_value.item_type)
						else
							is_comparison_type_error := True
							create last_type_error.make_from_string (STRING_.appended_string ("Could not convert second general comparison operand to ", a_other_atomic_value.item_type.conventional_name),
																				  Xpath_errors_uri, "FORG0001", Type_error)
						end
					end
				end
			end
			if not is_comparison_type_error then
				check_correct_value_relation (l_atomic_value_one, a_operator, a_atomic_comparer, l_atomic_value_two)
			end
		end

	check_correct_value_relation (a_atomic_value: XM_XPATH_ATOMIC_VALUE; a_operator: INTEGER;
											a_atomic_comparer: XM_XPATH_ATOMIC_COMPARER; a_other_atomic_value: XM_XPATH_ATOMIC_VALUE) is
			-- Compare two atomic values
		require
			first_value_not_void: a_atomic_value /= Void
			second_value_not: a_other_atomic_value /= Void
			valid_value_operator: is_value_comparison_operator (a_operator)
			comparer_not_void: a_atomic_comparer /= Void
		local
			l_message: STRING
		do
			is_comparison_type_error := False
			if a_atomic_value.is_duration_value and a_other_atomic_value.is_duration_value and a_operator = Fortran_equal_token then
				last_check_result := a_atomic_value.as_duration_value.equal_duration (a_other_atomic_value.as_duration_value)
			elseif a_atomic_comparer.are_comparable (a_atomic_value, a_other_atomic_value) then
				inspect
					a_operator
				when Fortran_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) = 0
				when Fortran_not_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) /= 0
				when Fortran_greater_than_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) = 1
				when Fortran_less_than_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) = -1
				when Fortran_greater_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) /= -1
				when Fortran_less_equal_token then
					last_check_result := a_atomic_comparer.three_way_comparison (a_atomic_value, a_other_atomic_value) /= 1
				end
			else
				is_comparison_type_error := True
				l_message := STRING_.appended_string ("Cannot compare ", a_atomic_value.item_type.conventional_name)
				l_message := STRING_.appended_string (l_message, " with ")
				l_message := STRING_.appended_string (l_message, a_other_atomic_value.item_type.conventional_name)
				create last_type_error.make_from_string (l_message, Xpath_errors_uri, "XPTY0004", Type_error)
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
	
