note

	description:

		"Routines common to XPath 1.0 and 2.0 arithmetic expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ARITHMETIC_ROUTINES

inherit

	ANY

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

feature -- Access

	is_arithmetic_operator (a_operator: INTEGER): BOOLEAN
			-- Is `a_operator' an arithmetic operator?
		do
			Result := a_operator = Plus_token or
				a_operator = Minus_token or
				a_operator = Unary_minus_token or
				a_operator = Multiply_token or
				a_operator = Division_token or
				a_operator = Modulus_token or
				a_operator = Integer_division_token
		end


feature {NONE} -- Implementation

	Unknown_action: INTEGER = 1
	Numeric_arithmetic_action: INTEGER = 2
	Date_and_duration_action: INTEGER = 3
	Date_difference_action: INTEGER = 4
	Duration_addition_action: INTEGER = 5
	Duration_multiplication_action: INTEGER = 6
	Duration_division_action: INTEGER = 7
			-- Arithmetic action need on operands

	signature_table (a_operator: INTEGER): ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for `a_operator'
		require
			valid_operator: is_arithmetic_operator (a_operator)
		do
			inspect
				a_operator
			when Plus_token then
				Result := plus_table
			when Minus_token, Unary_minus_token then
				Result := minus_table
			when Multiply_token then
				Result := multiply_table
			when Division_token then
				Result := divide_table
			when Modulus_token then
				Result := remainder_table
			when Integer_division_token then
				Result := integer_divide_table
			end
		ensure
			signature_table_not_void: Result /= Void
		end

	signature_table_index (a_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]; a_primitive_type, a_other_primitive_type: INTEGER): INTEGER
			-- Index within `a_table' for `a_primitive_type' and `a_other_primitive_type'
		local
			l_type, l_other_type, i: INTEGER
			l_entry: XM_XPATH_ARITHMETIC_SIGNATURE
		do
			if is_numeric_primitive_type (a_primitive_type) then
				l_type := Numeric_type_code
			else
				l_type := a_primitive_type
			end
			if is_numeric_primitive_type (a_other_primitive_type) then
				l_other_type := Numeric_type_code
			else
				l_other_type := a_other_primitive_type
			end

			from
				i := 1
			until
				i > a_table.count
			loop
				l_entry :=  a_table.item (i)
				if  l_type = l_entry.first_operand_type and l_other_type = l_entry.second_operand_type then
					Result := i
					i := a_table.count + 1
				else
					i := i + 1
				end
			end
		end

	action (a_type, a_other_type: INTEGER; a_operator: INTEGER): INTEGER
			-- Action needed for `t1' and `t2'
		require
			valid_operator: is_arithmetic_operator (a_operator)
		local
			l_type, l_other_type, l_table_index: INTEGER
			l_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
		do
			if a_type = Day_time_duration_type_code or a_type = Year_month_duration_type_code then
				l_type := Duration_type_code
			else
				l_type := a_type
			end
			if a_other_type = Day_time_duration_type_code or a_other_type = Year_month_duration_type_code then
				l_other_type := Duration_type_code
			else
				l_other_type := a_other_type
			end
			l_table :=  signature_table (a_operator)
			l_table_index := signature_table_index (l_table, l_type, l_other_type)
			if l_table_index > 0 then
				Result := l_table.item (l_table_index).operation
			else
				Result := Unknown_action
			end
		ensure
			valid_result_action: Unknown_action <= Result and Result <= Duration_division_action
		end
feature {NONE} -- Signature tables

	plus_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for addition
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_type_code, Duration_type_code, Date_and_duration_action, type_factory.date_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Date_type_code, Date_and_duration_action, type_factory.date_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Time_type_code, Duration_type_code, Date_and_duration_action, type_factory.time_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Time_type_code, Date_and_duration_action, type_factory.time_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_time_type_code, Duration_type_code, Date_and_duration_action, type_factory.date_time_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Date_time_type_code, Date_and_duration_action, type_factory.date_time_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Duration_type_code, Duration_addition_action, type_factory.duration_type)
			>>
		ensure
			plus_table_not_void: Result /= Void
		end

	minus_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for subtraction
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_type_code, Date_type_code, Date_difference_action, type_factory.day_time_duration_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_type_code, Duration_type_code, Date_and_duration_action, type_factory.date_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Time_type_code, Time_type_code, Date_difference_action, type_factory.day_time_duration_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Time_type_code, Duration_type_code, Date_and_duration_action, type_factory.time_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_time_type_code, Date_time_type_code, Date_difference_action, type_factory.day_time_duration_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Date_time_type_code, Duration_type_code, Date_and_duration_action, type_factory.date_time_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Duration_type_code, Duration_addition_action, type_factory.duration_type)
			>>
		ensure
			minus_table_not_void: Result /= Void
		end

	multiply_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for multiplication
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Duration_type_code, Duration_multiplication_action, type_factory.duration_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Numeric_type_code, Duration_multiplication_action, type_factory.duration_type)
			>>
		ensure
			multiply_table_not_void: Result /= Void
		end

	divide_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for division
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),

			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Numeric_type_code, Duration_multiplication_action, type_factory.duration_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Duration_type_code, Duration_type_code, Duration_division_action, type_factory.numeric_type)
			>>
		ensure
			divide_table_not_void: Result /= Void
		end

	integer_divide_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for integer division
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.integer_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.integer_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.integer_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.integer_type)
			>>
		ensure
			integer_divide_table_not_void: Result /= Void
		end

	remainder_table: ARRAY [XM_XPATH_ARITHMETIC_SIGNATURE]
			-- Signature table for remainder
		once
			Result := <<create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Numeric_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Numeric_type_code, Numeric_arithmetic_action, type_factory.numeric_type),
			create {XM_XPATH_ARITHMETIC_SIGNATURE}.make (Untyped_atomic_type_code, Untyped_atomic_type_code, Numeric_arithmetic_action, type_factory.numeric_type)
			>>
		ensure
			remainder_table_not_void: Result /= Void
		end

	end
