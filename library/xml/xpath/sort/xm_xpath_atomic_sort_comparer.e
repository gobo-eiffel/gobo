indexing

	description:

		"Objects that compare two atomic values, treating NaNs as low."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_SORT_COMPARER

inherit

	XM_XPATH_ATOMIC_COMPARER
		redefine
			three_way_comparison
		end

	XM_XPATH_DEBUGGING_ROUTINES

creation

	make

feature -- Access

	comparison_key (a_key: XM_XPATH_ATOMIC_VALUE): XM_XPATH_COMPARISON_KEY is
			-- Comparison key for `a_key'
		require
			key_not_void: a_key /= Void
		local
			a_primitive_value: XM_XPATH_ATOMIC_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			a_string_value: XM_XPATH_STRING_VALUE
		do
			a_primitive_value := a_key.primitive_value
			a_numeric_value ?= a_primitive_value
			if a_numeric_value /= Void then
				if a_numeric_value.is_nan then
					create Result.make_nan
				else
					create Result.make_numeric (a_numeric_value)
				end
			else
				a_string_value ?= a_primitive_value
				if a_string_value /= Void then
					create Result.make_with_collation_key (collator.collation_key (a_string_value.string_value))
				else
					create result.make (a_primitive_value)
				end
			end
		ensure
			comparison_key_not_void: Result /= Void
		end

feature -- Comparison

	three_way_comparison (an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Comparison of two atomic values
		local
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
			a_string_value, another_string_value: XM_XPATH_STRING_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			compared: BOOLEAN
		do
			an_untyped_atomic_value ?= an_atomic_value
			if an_untyped_atomic_value /= Void then
				Result := an_untyped_atomic_value.three_way_comparison_using_collator (another_atomic_value, collator)
				compared := True
			else
				an_untyped_atomic_value ?= another_atomic_value
				if an_untyped_atomic_value /= Void then
					Result := - an_untyped_atomic_value.three_way_comparison_using_collator (an_atomic_value, collator)
					compared := True
				end
			end
			if not compared then

				-- treat NaNs specially

				a_numeric_value ?= an_atomic_value
				if a_numeric_value /= Void and then a_numeric_value.is_nan then
					a_numeric_value ?= another_atomic_value
					if a_numeric_value /= Void and then a_numeric_value.is_nan then
						Result := 0
					else
						Result := -1
					end
					compared := True
				else
					a_numeric_value ?= another_atomic_value
					if a_numeric_value /= Void and then a_numeric_value.is_nan then
						Result := +1
						compared := True
					end
				end
			end
			
			if not compared then

				-- Neither operand is xdt:untypedAtomic

				a_string_value ?= an_atomic_value
				another_string_value ?= another_atomic_value
				
				if a_string_value = Void or else another_string_value = Void then
					Result := an_atomic_value.three_way_comparison (another_atomic_value)
				else

					-- Both operands are string, so use the collator to do the comparison

					Result := collator.three_way_comparison (an_atomic_value.string_value, another_atomic_value.string_value)
				end
			end
		end
	
end
	
