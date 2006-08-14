indexing

	description:

		"XPath values that represent arbitrary Eiffel objects, for creation by extension functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

			-- TODO: This is now only used by XM_XSLT_FUNCTION_CALL_PACKAGE, so remove it.

class XM_XPATH_OBJECT_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE
		redefine
			is_object_value, as_object_value
		end

create

	make

feature {NONE} -- Initialization

	make (an_object: ANY) is
		do
			make_atomic_value
			value := an_object
		ensure
			set: value = an_object
		end

feature -- Access

	value: ANY
			-- Value of expression

	is_object_value: BOOLEAN is
			-- Is `Current' a object value?
		do
			Result := True
		end

	as_object_value: XM_XPATH_OBJECT_VALUE is
			-- `Current' seen as a object value
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression
		do
			Result := type_factory.object_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			-- Value of the item as a string
		do
			if value = Void then
				Result := ""
			else
				Result := value.out
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_object_value then
				if value /= Void then
					Result := value = other.as_object_value.value
				else
					Result := other.as_object_value.value = Void
				end
			end
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Compare `Current' to `other'
		do
			Result := STRING_.three_way_comparison (string_value, other.as_object_value.string_value)
		end

feature -- Status report


feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_object_value
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		local
			a_string_value: XM_XPATH_STRING_VALUE
		do
			if	a_required_type = any_item
				or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.object_type
				or else a_required_type = type_factory.boolean_type
				or else a_required_type = type_factory.string_type then
				Result := True
			else
				create {XM_XPATH_STRING_VALUE} a_string_value.make (string_value)
				Result := a_string_value.is_convertible (a_required_type)
			end	
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "** external object **")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
			if	a_required_type = any_item
				or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.object_type then
				Result := Current
			elseif a_required_type = type_factory.boolean_type then
				if value = Void then
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
				elseif string_value.count > 0 then
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)
				else
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
				end
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			else
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
				Result := Result.convert_to_type (a_required_type)
			end
		end
end
