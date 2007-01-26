indexing

	description:

		"Routines common to XPath 1.0 and 2.0 arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ARITHMETIC_ROUTINES

inherit

	ANY

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

feature {NONE} -- Implementation

	Unknown_action: INTEGER is 1
	Numeric_arithmetic_action: INTEGER is 2
	Date_and_duration_action: INTEGER is 3
	Date_difference_action: INTEGER is 4
	Duration_addition_action: INTEGER is 5
	Duration_multiplication_action: INTEGER is 6
	Duration_division_action: INTEGER is 7
			-- Arithmetic action need on operands

	action (t1, t2: XM_XPATH_ITEM_TYPE; a_operator: INTEGER): INTEGER is
			-- Action needed for `t1' and `t2'
		require
			first_type_not_void: t1 /= Void
			second_type_not_void: t2 /= Void
		do
			if (is_sub_type (t1, type_factory.numeric_type) or is_sub_type (t1, type_factory.untyped_atomic_type))
					and (is_sub_type (t2, type_factory.numeric_type) or is_sub_type (t2, type_factory.untyped_atomic_type)) then
					Result := Numeric_arithmetic_action
			else
				inspect
					a_operator
				when Modulus_token, Integer_division_token then
					Result := Unknown_action
				when Division_token then
					if (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
						if is_sub_type (t2, type_factory.numeric_type) then
							Result := Duration_multiplication_action
						elseif (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
							Result := Duration_division_action
						end
					else
						Result := Unknown_action
					end
				when Multiply_token then
					if (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) and is_sub_type (t2, type_factory.numeric_type) then
						Result := Duration_multiplication_action
					elseif (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) and is_sub_type (t1, type_factory.numeric_type) then
						Result := Duration_multiplication_action
					else
						Result := Unknown_action
					end
				when Plus_token, Minus_token then
					if t1= type_factory.year_month_duration_type and t2 = type_factory.year_month_duration_type then
						Result := Duration_addition_action
					elseif t1 = type_factory.day_time_duration_type and t2 = type_factory.day_time_duration_type then
						Result := Duration_addition_action
					elseif t1 = t2 and a_operator = Minus_token then
						Result := Date_difference_action
					elseif t1 = type_factory.date_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = type_factory.date_type and (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = type_factory.time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t2 = type_factory.time_type and (t1 = type_factory.year_month_duration_type or t1 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					elseif t1 = type_factory.date_time_type and t2 = type_factory.date_time_type then
						Result := Date_and_duration_action
					elseif t1 = type_factory.date_time_type and (t2 = type_factory.year_month_duration_type or t2 = type_factory.day_time_duration_type) then
						Result := Date_and_duration_action
					else
						Result := Unknown_action
					end
				end
			end
		ensure
			valid_result_action: Unknown_action <= Result and Result <= Duration_division_action
		end

	end
