indexing

	description: "Format unsigned integers."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_UNSIGNED_INTEGER_FORMATTER

inherit

	GF_ABSTRACT_FORMATTER
		redefine
			is_valid_value,
			make,
			reset_options,
			set_value
		end


creation

	make


feature {NONE} -- Initialization

	make is
			-- Set `value', `align_char' and `base' to some defaults.
		do
			precursor
			align_char := ' '
			base := 10
		end


feature {GF_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: INTEGER_REF is
		once
			create Result
		end


feature -- Access

	base: INTEGER
			-- Octal, decimal, hex, ...


feature -- Set

	reset_options is
		do
			precursor
			set_precision (1)
		end


feature {GF_ABSTRACT_FORMATTER} -- Implementation

	lower_digits: STRING is "0123456789abcdefghijklmnopqrstuvwxyz"

	upper_digits: STRING is "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	use_uppercase_digits: BOOLEAN
			-- Should `upper_digits' be used instead of `lower_digits'?

	get_plain_number_image (i: INTEGER): STRING is
		local
			s: STRING
			n: INTEGER
			index: INTEGER
			c: CHARACTER
		do
			s := ""
			from
				n := i
			until
				n = 0
			loop
				index := (n \\ base) + 1
				if use_uppercase_digits then
					c := upper_digits.item (index)
				else
					c := lower_digits.item (index)
				end
				s.precede (c)
				n := n // base
			end
			if (i = 0) then
				Result := "0"
			else
				Result := s
			end
		end

feature -- Value

	is_valid_value (a_value: like value): BOOLEAN is
			-- Is `a_value' not void and not negative?
		do
			Result :=
				(a_value /= Void) and then
				(a_value.item >=0)
		end

	set_value (a_value: like value) is
		do
			precursor (a_value)
			-- reset alignment char
			set_align_char (' ')
		end


feature -- Output

	output: STRING is
			-- Formatted `value'
		do
			if (not is_precision_given) and then (value.item = 0) then
				Result := ""
			else
				Result := get_plain_number_image (value.item)
				if is_precision_given then
					left_pad (Result, '0', precision)
				end
				justify (Result)
			end
		end

end
