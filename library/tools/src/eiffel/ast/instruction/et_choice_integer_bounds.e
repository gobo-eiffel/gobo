note

	description:

		"Eiffel choice interval integer bounds of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_CHOICE_INTEGER_BOUNDS

inherit

	ET_CHOICE_BOUNDS

create

	make,
	make_with_lower_value,
	make_with_lower_integer_constant,
	make_with_lower_character_constant

feature {NONE} -- Initialization

	make (a_lower_value: NATURAL_64; a_is_lower_negative: BOOLEAN; a_upper_value: NATURAL_64; a_is_upper_negative: BOOLEAN)
			-- Create a new choice bounds.
		do
			lower_value := a_lower_value
			is_lower_negative := a_is_lower_negative
			upper_value := a_upper_value
			is_upper_negative := a_is_upper_negative
		ensure
			lower_value_set: lower_value = a_lower_value
			is_lower_negative_set: is_lower_negative = a_is_lower_negative
			upper_value_set: upper_value = a_upper_value
			is_upper_negative_set: is_upper_negative = a_is_upper_negative
		end

	make_with_lower_value (a_lower_value: NATURAL_64; a_is_lower_negative: BOOLEAN)
			-- Create a new choice bounds.
		do
			lower_value := a_lower_value
			is_lower_negative := a_is_lower_negative
			upper_value := a_lower_value
			is_upper_negative := a_is_lower_negative
		ensure
			lower_value_set: lower_value = a_lower_value
			is_lower_negative_set: is_lower_negative = a_is_lower_negative
			upper_value_set: upper_value = a_lower_value
			is_upper_negative_set: is_upper_negative = a_is_lower_negative
		end

	make_with_lower_integer_constant (a_integer_constant: ET_INTEGER_CONSTANT)
			-- Create a new choice bounds.
		require
			a_character_constant_not_void: a_integer_constant /= Void
		do
			lower_value := a_integer_constant.value
			is_lower_negative := a_integer_constant.is_negative
			upper_value := lower_value
			is_upper_negative := is_lower_negative
		ensure
			lower_value_set: lower_value = a_integer_constant.value
			is_lower_negative_set: is_lower_negative = a_integer_constant.is_negative
			upper_value_set: upper_value = lower_value
			is_upper_negative_set: is_upper_negative = is_lower_negative
		end

	make_with_lower_character_constant (a_character_constant: ET_CHARACTER_CONSTANT)
			-- Create a new choice bounds.
		require
			a_integer_constant_not_void: a_character_constant /= Void
		do
			lower_value := a_character_constant.value.natural_32_code
			is_lower_negative := False
			upper_value := lower_value
			is_upper_negative := is_lower_negative
		ensure
			lower_value_set: lower_value = a_character_constant.value.natural_32_code
			is_lower_negative_set: not is_lower_negative
			upper_value_set: upper_value = lower_value
			is_upper_negative_set: is_upper_negative = is_lower_negative
		end

feature -- Status report

	is_lower_negative: BOOLEAN
			-- Is lower bound value negative?

	is_upper_negative: BOOLEAN
			-- Is upper bound value negative?

	is_empty: BOOLEAN
			-- Is there no value in `Current`?
		do
			if is_lower_negative then
				if is_upper_negative then
					Result := lower_value < upper_value
				else
					Result := False
				end
			elseif is_upper_negative then
				Result := lower_value /= 0 or upper_value /= 0
			else
				Result := upper_value < lower_value
			end
		end

	overlaps (other: ET_CHOICE_BOUNDS): BOOLEAN
			-- Does `other` contain values of `Current`?
		do
			if attached {ET_CHOICE_INTEGER_BOUNDS} other as l_integer_bounds then
				if l_integer_bounds.is_lower_negative then
					if is_upper_negative then
						Result := l_integer_bounds.lower_value >= upper_value
					else
						Result := l_integer_bounds.lower_value = 0 and upper_value = 0
					end
				elseif is_upper_negative then
					Result := l_integer_bounds.lower_value = 0 and upper_value = 0
				else
					Result := l_integer_bounds.lower_value <= upper_value
				end
				if not Result then
					-- Done.
				elseif is_lower_negative then
					if l_integer_bounds.is_upper_negative then
						Result := lower_value >= l_integer_bounds.upper_value
					else
						Result := lower_value = 0 and l_integer_bounds.upper_value = 0
					end
				elseif l_integer_bounds.is_upper_negative then
					Result :=  lower_value = 0 and l_integer_bounds.upper_value = 0
				else
					Result := lower_value <= l_integer_bounds.upper_value
				end
			end
		end

feature -- Access

	lower_value: NATURAL_64
			-- Lower bound absolute value

	upper_value: NATURAL_64
			-- Upper bound absolute value

feature -- Setting

	set_lower_value (a_value: NATURAL_64; a_is_negative: BOOLEAN)
			-- Set `lower_value` to `a_value` and
			-- `is_lower_negative` to `a_is_lower_negative`.
		do
			lower_value := a_value
			is_lower_negative := a_is_negative
		ensure
			lower_value_set: lower_value = a_value
			is_lower_negative_set: is_lower_negative = a_is_negative
		end

	set_lower_integer_constant (a_integer_constant: ET_INTEGER_CONSTANT)
			-- Set `lower_value` to `a_integer_constant.value` and
			-- `is_lower_negative` to `a_integer_constant.is_negative`.
		require
			a_integer_constant_not_void: a_integer_constant /= Void
		do
			lower_value := a_integer_constant.value
			is_lower_negative := a_integer_constant.is_negative
		ensure
			lower_value_set: lower_value = a_integer_constant.value
			is_lower_negative_set: is_lower_negative = a_integer_constant.is_negative
		end

	set_lower_character_constant (a_character_constant: ET_CHARACTER_CONSTANT)
			-- Set `lower_value` to `a_character_constant.value.natural_32_code`
			-- and `is_lower_negative` to False.
		require
			a_character_constant_not_void: a_character_constant /= Void
		do
			lower_value := a_character_constant.value.natural_32_code
			is_lower_negative := False
		ensure
			lower_value_set: lower_value = a_character_constant.value.natural_32_code
			is_lower_negative_set: not is_lower_negative
		end

	set_upper_value (a_value: NATURAL_64; a_is_negative: BOOLEAN)
			-- Set `upper_value` to `a_value` and
			-- `is_upper_negative` to `a_is_lower_negative`.
		do
			upper_value := a_value
			is_upper_negative := a_is_negative
		ensure
			upper_value_set: upper_value = a_value
			is_upper_negative_set: is_upper_negative = a_is_negative
		end

	set_upper_integer_constant (a_integer_constant: ET_INTEGER_CONSTANT)
			-- Set `upper_value` to `a_integer_constant.value` and
			-- `is_upper_negative` to `a_integer_constant.is_negative`.
		require
			a_integer_constant_not_void: a_integer_constant /= Void
		do
			upper_value := a_integer_constant.value
			is_upper_negative := a_integer_constant.is_negative
		ensure
			upper_value_set: upper_value = a_integer_constant.value
			is_upper_negative_set: is_upper_negative = a_integer_constant.is_negative
		end

	set_upper_character_constant (a_character_constant: ET_CHARACTER_CONSTANT)
			-- Set `upper_value` to `a_character_constant.value.natural_32_code`
			-- and `is_upper_negative` to False.
		require
			a_character_constant_not_void: a_character_constant /= Void
		do
			upper_value := a_character_constant.value.natural_32_code
			is_upper_negative := False
		ensure
			upper_value_set: lower_value = a_character_constant.value.natural_32_code
			is_upper_negative_set: not is_upper_negative
		end

end
