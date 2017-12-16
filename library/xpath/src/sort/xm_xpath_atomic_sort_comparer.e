note

	description:

		"Objects that compare two atomic values, treating NaNs as low."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_SORT_COMPARER

inherit

	XM_XPATH_ATOMIC_COMPARER
		redefine
			three_way_comparison
		end

create

	make

feature -- Access

	comparison_key (a_key: XM_XPATH_ATOMIC_VALUE): XM_XPATH_COMPARISON_KEY
			-- Comparison key for `a_key'
		require
			key_not_void: a_key /= Void
		local
			a_primitive_value: XM_XPATH_ATOMIC_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
		do
			a_primitive_value := a_key.primitive_value
			if a_primitive_value.is_numeric_value then
				a_numeric_value := a_primitive_value.as_numeric_value
				if a_numeric_value.is_nan then
					create Result.make_nan
				else
					create Result.make_numeric (a_numeric_value)
				end
			else
				if a_primitive_value.is_string_value then
					create Result.make_with_collation_key (collator.collation_key (a_primitive_value.as_string_value.string_value))
				else
					create result.make (a_primitive_value)
				end
			end
		ensure
			comparison_key_not_void: Result /= Void
		end

feature -- Comparison

	three_way_comparison (an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE): INTEGER
			-- Comparison of two atomic values
		local
			compared: BOOLEAN
		do
			if an_atomic_value.is_untyped_atomic then
				Result := an_atomic_value.as_untyped_atomic.three_way_comparison_using_collator (another_atomic_value, collator)
				compared := True
			else
				if another_atomic_value.is_untyped_atomic then
					Result := - another_atomic_value.as_untyped_atomic.three_way_comparison_using_collator (an_atomic_value, collator)
					compared := True
				end
			end
			if not compared then

				-- treat NaNs specially

				if an_atomic_value.is_numeric_value and then an_atomic_value.as_numeric_value.is_nan then
					if another_atomic_value.is_numeric_value and then another_atomic_value.as_numeric_value.is_nan then
						Result := 0
					else
						Result := -1
					end
					compared := True
				else
					if another_atomic_value.is_numeric_value and then another_atomic_value.as_numeric_value.is_nan then
						Result := +1
						compared := True
					end
				end
			end

			if not compared then

				-- Neither operand is xdt:untypedAtomic

				if not an_atomic_value.is_string_value or else not another_atomic_value.is_string_value then
					Result := an_atomic_value.three_way_comparison (another_atomic_value, dynamic_context)
				else

					-- Both operands are string, so use the collator to do the comparison

					Result := collator.three_way_comparison (an_atomic_value.string_value, another_atomic_value.string_value)
				end
			end
		end

end

