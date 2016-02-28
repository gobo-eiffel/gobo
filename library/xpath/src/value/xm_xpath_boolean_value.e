note

	description:

		"Objects that represent an XPath boolean value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_BOOLEAN_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			calculate_effective_boolean_value, hash_code,
			is_boolean_value, as_boolean_value
		end

create

	make

feature {NONE} -- Initialization

	make (a_value: BOOLEAN)
		do
			make_atomic_value
			value := a_value
		ensure
			set: value = a_value
		end

feature -- Access

	value: BOOLEAN
			-- Value of expression

	is_boolean_value: BOOLEAN
			-- Is `Current' a boolean value?
		do
			Result := True
		end

	as_boolean_value: XM_XPATH_BOOLEAN_VALUE
			-- `Current' seen as a boolean value
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, where know
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING
			--Value of the item as a string
		do
			if value then
				Result := "true"
			else
				Result := "false"
			end
		end

	hash_code: INTEGER
			-- Hash code value
		do
			if not value then Result := 1 end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			if other.is_boolean_value then
				Result := value = other.as_boolean_value.value
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER
			-- Compare `Current' to `other'
		do
			if value = other.as_boolean_value.value then
				Result := 0
			elseif value = True then
				Result := 1
			else
				Result := -1
			end
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_boolean_value
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or
				a_required_type = type_factory.any_atomic_type or
				a_required_type = type_factory.boolean_type or
				a_required_type = type_factory.string_type or
				a_required_type = type_factory.untyped_atomic_type or
				a_required_type = type_factory.numeric_type or
				a_required_type = type_factory.integer_type or
				a_required_type = type_factory.decimal_type or
				a_required_type = type_factory.float_type or
				a_required_type = type_factory.double_type then
				Result := True
			else
				Result := False
			end
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "boolean (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Evaluation

	calculate_effective_boolean_value (context: XM_XPATH_CONTEXT)
			-- Effective boolean value of the expression
		do
			last_boolean_value := Current
		end

feature -- Conversions

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE)
			-- Convert `Current' to `a_required_type'
		local
			l_value: INTEGER
			l_integer: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			if value then l_value := 1 end
			if	a_required_type = type_factory.boolean_type  then
				converted_value := Current
			elseif a_required_type = type_factory.any_atomic_type  then
				converted_value := Current
			elseif a_required_type = any_item  then
				converted_value := Current
			elseif a_required_type = type_factory.numeric_type then
				create {XM_XPATH_MACHINE_INTEGER_VALUE} converted_value.make (l_value)
			elseif a_required_type = type_factory.integer_type then
				create {XM_XPATH_MACHINE_INTEGER_VALUE} converted_value.make (l_value)
			elseif a_required_type = type_factory.decimal_type then
				create {XM_XPATH_DECIMAL_VALUE} converted_value.make_from_integer (l_value)
			elseif a_required_type = type_factory.double_type then
				create l_integer.make (l_value)
				l_integer.convert_to_type (a_required_type)
				converted_value := l_integer.converted_value
			elseif a_required_type = type_factory.float_type then
				create l_integer.make (l_value)
				l_integer.convert_to_type (a_required_type)
				converted_value := l_integer.converted_value
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			end
		end

end
