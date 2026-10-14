note

	description:

		"Eiffel choice interval string bounds of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_CHOICE_STRING_BOUNDS

inherit

	ET_CHOICE_BOUNDS

create

	make,
	make_with_lower_value

feature {NONE} -- Initialization

	make (a_lower_value: like lower_value; a_upper_value: like upper_value)
			-- Create a new choice bounds.
		require
			a_lower_value_not_void: a_lower_value /= Void
			a_lower_value_is_string_8: a_lower_value.same_type ({STRING_8} "")
			valid_utf8_lower_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_lower_value)
			a_upper_value_not_void: a_upper_value /= Void
			a_upper_value_is_string_8: a_upper_value.same_type ({STRING_8} "")
			valid_utf8_uppe_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_upper_value)
		do
			lower_value := a_lower_value
			upper_value := a_upper_value
		ensure
			lower_value_set: lower_value = a_lower_value
			upper_value_set: upper_value = a_upper_value
		end

	make_with_lower_value (a_value: like lower_value)
			-- Create a new choice bounds.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			lower_value := a_value
			upper_value := a_value
		ensure
			lower_value_set: lower_value = a_value
			upper_value_set: upper_value = a_value
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no value in `Current`?
		do
			Result := {KL_STRING_ROUTINES}.three_way_comparison (lower_value, upper_value) > 0
		end

	overlaps (other: ET_CHOICE_BOUNDS): BOOLEAN
			-- Does `other` contain values of `Current`?
		do
			if attached {ET_CHOICE_STRING_BOUNDS} other as l_string_bounds then
					-- Note: Sorting of UTF-8 strings as arrays of unsigned bytes will produce
					-- the same results as sorting them based on Unicode code points.
				Result := {KL_STRING_ROUTINES}.three_way_comparison (l_string_bounds.lower_value, upper_value) <= 0 and
					{KL_STRING_ROUTINES}.three_way_comparison (lower_value, l_string_bounds.upper_value) <= 0
			end
		end

feature -- Access

	lower_value: STRING_8
			-- Lower bound value
			-- (using UTF-8 encoding)

	upper_value: STRING_8
			-- Upper bound value
			-- (using UTF-8 encoding)

feature -- Setting

	set_lower_value (a_value: like lower_value)
			-- Set `lower_value` to `a_value`.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			lower_value := a_value
		ensure
			lower_value_set: lower_value = a_value
		end

	set_upper_value (a_value: like upper_value)
			-- Set `upper_value` to `a_value`.
		require
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			upper_value := a_value
		ensure
			upper_value_set: upper_value = a_value
		end

invariant

	lower_value_not_void: lower_value /= Void
	lower_value_is_string_8: lower_value.same_type ({STRING_8} "")
	valid_utf8_lower_value: {UC_UTF8_ROUTINES}.valid_utf8 (lower_value)
	upper_value_not_void: upper_value /= Void
	uppe_value_is_string_8: upper_value.same_type ({STRING_8} "")
	valid_utf8_upper_value: {UC_UTF8_ROUTINES}.valid_utf8 (upper_value)

end
