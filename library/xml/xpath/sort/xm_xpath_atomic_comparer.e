note

	description:

		"Objects that compare two atomic values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_COMPARER

inherit

	KL_PART_COMPARATOR  [XM_XPATH_ATOMIC_VALUE]

	XM_XPATH_EXCEPTION_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_collator: ST_COLLATOR) is
			-- Establish invariant.
		require
			collator_not_void: a_collator /= void
		do
			collator := a_collator
		ensure
			collator_set: collator = a_collator
		end

feature -- Access

	collator: ST_COLLATOR
			-- Collator for string comparisons

	dynamic_context: XM_XPATH_CONTEXT
			-- Dynamic context for use in calendar-values comparisons

feature -- Comparison

	three_way_comparison (an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Comparison of two atomic values
		require
			first_value_not_void: an_atomic_value /= Void
			second_value_not: another_atomic_value /= Void
			values_are_comparable: are_comparable (an_atomic_value, another_atomic_value)
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

				-- Neither operand is xdt:untypedAtomic

				if not an_atomic_value.is_string_value or else not another_atomic_value.is_string_value then
					Result := an_atomic_value.three_way_comparison (another_atomic_value, dynamic_context)
				else

					-- Both operands are string, so use the collator to do the comparison

					Result := collator.three_way_comparison (an_atomic_value.string_value, another_atomic_value.string_value)
				end
			end
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

	less_than (u, v: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `u' considered less than `v'?
		do
			if are_comparable (u, v) then
				Result := three_way_comparison (u, v) = -1
			else
				raise_non_comparable_exception
			end
		end

feature -- Status report

	are_comparable (an_atomic_value, another_atomic_value: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Are `an_atomic_value' and `another_atomic_value' comparable?
		require
			first_value_not_void: an_atomic_value /= Void
			second_value_not: another_atomic_value /= Void
		do
			Result := an_atomic_value.is_comparable (another_atomic_value)
		end

feature -- Element change

	set_dynamic_context (a_context: XM_XPATH_CONTEXT) is
			-- Set dynamic context for use in calendar-values comparisons.
		require
			context_not_void: a_context /= Void
		do
			dynamic_context := a_context
		ensure
			context_set: dynamic_context = a_context
		end

invariant

	collator_not_void: collator /= void

end

