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
			display, convert_to_type, item_type, effective_boolean_value, is_comparable
		end

	-- N.B. Inheritance from XM_XPATH_STRING_VALUE is an implementation convenience;
	-- xdt:untypedAtomic is NOT a sub-type of xs:integer
	-- TODO - factor out the common implementation (all of string-value??) to tremove the sub-typing relationship
	
creation

	make

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type, if possible;
		do
			Result := type_factory.untyped_atomic_type
		end

feature -- Comparison

	three_way_comparison_using_collator (other: XM_XPATH_ATOMIC_VALUE; a_collator: ST_COLLATOR): INTEGER is
			-- Comparison with `an_atomic_value'
		require
			atomic_value_valid: other /= Void and then is_comparable (other)
			collator_not_void: a_collator /= Void
		local
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			a_numeric_value ?= other
			if a_numeric_value /= Void then
				if double_value = Void then
					double_value ?= convert_to_type (type_factory.double_type)
						check
							double_value_not_void: double_value /= Void
							-- because is_comparable
						end
				end
				Result := double_value.three_way_comparison (a_numeric_value)
			else
				Result := a_collator.three_way_comparison (string_value, other.string_value)
			end
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end
			
feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		local
			a_string_value: XM_XPATH_STRING_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			a_numeric_value ?= other
			if a_numeric_value /= Void then
				if double_value /= Void then
					Result := True
				else
					Result := is_convertible (type_factory.double_type)
				end
			else
				Result := True -- Is this correct?
			end
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "untyped (%"")
			a_string := STRING_.appended_string (a_string, value)
			a_string := STRING_.appended_string (a_string, "%")")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
			end
		end


feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (True)
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
					
					double_value ?= Precursor (type_factory.double_type)
						check
							double_value_not_void: double_value /= Void
							-- As is_convertible (Double_type) will return the same result for both String_type and Untyped_atomic_type
						end
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
