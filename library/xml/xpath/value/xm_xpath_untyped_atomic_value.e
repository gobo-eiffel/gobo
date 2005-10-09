indexing

	description:

	"XPath untyped atomic values"

library: "Gobo Eiffel XPath Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XPATH_UNTYPED_ATOMIC_VALUE

inherit

	XM_XPATH_STRING_VALUE
		redefine
			display, convert_to_type, item_type, is_comparable, is_string_value, as_string_value,
			is_untyped_atomic, as_untyped_atomic, same_expression, same_atomic_value
		end

	-- N.B. Inheritance from XM_XPATH_STRING_VALUE is an implementation convenience;
	-- xdt:untypedAtomic is NOT a sub-type of xs:string
	-- TODO - factor out the common implementation (all of string-value??) to remove the sub-typing relationship ? - maybe not, as is_string_value = False
	
create

	make

feature -- Access
	
	is_string_value: BOOLEAN is
			-- Is `Current' a string value?
		do
			Result := False
		end

	as_string_value: XM_XPATH_STRING_VALUE is
			-- `Current' seen as a string value
		do
		end

	is_untyped_atomic: BOOLEAN is
			-- Is `Current' an untyped atomic value?
		do
			Result := True
		end

	as_untyped_atomic: XM_XPATH_UNTYPED_ATOMIC_VALUE is
			-- `Current' seen as an untyped atomic
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type
		do
			Result := type_factory.untyped_atomic_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_untyped_atomic then
				Result := STRING_.same_string (string_value, other.as_untyped_atomic.string_value)
			end
		end

	three_way_comparison_using_collator (other: XM_XPATH_ATOMIC_VALUE; a_collator: ST_COLLATOR): INTEGER is
			-- Comparison with `an_atomic_value'
		require
			atomic_value_valid: other /= Void and then is_comparable (other)
			collator_not_void: a_collator /= Void
		do
			if other.is_numeric_value then
				if double_value = Void then
					double_value := convert_to_type (type_factory.double_type).as_double_value
				end
				Result := double_value.three_way_comparison (other.as_numeric_value, Void)
			else
				Result := a_collator.three_way_comparison (string_value, other.string_value)
			end
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end
	
	same_atomic_value (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Are `Current' and `other' the same value?

		do
			if other.is_string_value then
				Result := STRING_.same_string (value, other.as_string_value.string_value)
			else
				Result := Precursor (other)
			end
		end
		
feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			if other.is_numeric_value then
				if double_value /= Void then
					Result := True
				else
					Result := is_convertible (type_factory.double_type)
				end
			else
				Result := True -- Is this correct?
			end
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "untyped (%"")
			a_string := STRING_.appended_string (a_string, value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end
	
feature -- Conversion
	
	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
		do
			if	a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (value)
			elseif a_required_type = type_factory.double_type then
				if double_value /= Void then
					Result := double_value
				else
					
					-- Cache the result
					
					double_value := Precursor (type_factory.double_type).as_double_value
					Result := double_value 
				end
			else
				Result := Precursor (a_required_type)
			end
		end

feature {NONE} -- Implementation

	double_value: XM_XPATH_DOUBLE_VALUE
			-- Cached result

end
