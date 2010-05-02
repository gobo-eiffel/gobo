note

	description:

		"Comparsion keys for use by XM_XPATH_ATOMIC_SORT_COMPARER"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMPARISON_KEY

inherit

	HASHABLE

	XM_XPATH_TYPE

create

	make, make_nan, make_numeric, make_with_collation_key

feature {NONE} -- Initialization

	make_nan
			-- Establish invariant.
		do
			category := Numeric_type_code
			create {XM_XPATH_DOUBLE_VALUE} value.make_nan
			is_nan := True
		ensure
			nan: is_nan
		end

	make_numeric (a_numeric_value: XM_XPATH_NUMERIC_VALUE)
			-- Establish invariant.
		require
			value_not_void: a_numeric_value /= Void
		do
			category := Numeric_type_code
			value := a_numeric_value
		ensure
			value_set: value = a_numeric_value
			not_nan: not is_nan
		end

	make_with_collation_key (a_collation_key: ST_COLLATION_KEY)
			-- Establish invariant.
		require
			collation_key_not_void: a_collation_key /= Void
		do
			collation_key := a_collation_key
		ensure
			collation_key_set: collation_key = a_collation_key
			not_nan: not is_nan
		end

	make (a_atomic_value: XM_XPATH_ATOMIC_VALUE)
		require
			value_not_void: a_atomic_value /= Void
		do
			category := a_atomic_value.item_type.primitive_type
			value := a_atomic_value
		ensure
			value_set: value = a_atomic_value
			not_nan: not is_nan
		end

feature -- Access

	hash_code: INTEGER
			-- Hash code value
		do
			if is_nan then
				Result := 0
			elseif collation_key /= Void then
				Result := collation_key.hash_code
			else
				Result := value.hash_code
			end
		end

feature -- Comparison

	same_key (other: XM_XPATH_COMPARISON_KEY): BOOLEAN
			-- Are `Current' and `other' considered equal?
		require
			other_not_void: other /= Void
		do
			if is_nan then
				Result := other.is_nan
			elseif collation_key /= Void then
				Result := other.collation_key /= Void and then collation_key.three_way_comparison (other.collation_key) = 0
			elseif category = other.category then
				Result := value.same_atomic_value (other.value)
			end
		end

feature {XM_XPATH_COMPARISON_KEY} -- Implementation

	category: INTEGER
			-- Category of keys being compared

	value: XM_XPATH_ATOMIC_VALUE
			-- Value

	collation_key: ST_COLLATION_KEY
			-- Collation key

	is_nan: BOOLEAN
			-- is this NaN?

invariant

	nan: is_nan implies value /= Void and then category = Numeric_type_code
	value: collation_key = Void implies value /= Void
	collation_key: collation_key /= Void implies value = Void

end

