indexing

	description:

		"The  double  argument  is converted in style f or e %
		%(or F or E for G conversions)."

	conversion_rules:

		"The precision specifies the number of significant digits. If%
		%the precision is missing, 6 digits are given; if the precision%
		%is zero, it is treated as 1.  Style e is used if the exponent%
		%from its conversion is less than -4 or greater than or equal to%
		%the precision. A decimal point appears only if it is%
		%followed by at least one digit."

	library: "Gobo Eiffel Formatter Library"
	origins: "Based on code from Object Tools."
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_E_OR_F_FORMATTER

inherit

	ST_ABSTRACT_FORMATTER
		rename
			make as make_abstract
		redefine
			reset_options,
			set_precision
		end

	KL_DOUBLE_ROUTINES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_use_uppercase_digit: BOOLEAN) is
		do
			make_abstract
			create e_formatter.make (a_use_uppercase_digit)
			create f_formatter.make
		end

feature -- Set

	reset_options is
		do
			set_precision (6)
		end

	set_precision (p: INTEGER) is
			-- Change the precision, a formatter specific truncating option.
		do
			if p = 0 then
				precursor (1)
			else
				precursor (p)
			end
		end

feature {ST_SCIENTIFIC_FORMAT} -- Type that can be formatted

	anchor: DOUBLE_REF is
		once
			create Result
		end

feature -- Output

	output: STRING is
			-- Formatted `value'
		local
			fa: DOUBLE
			exponent: INTEGER
			formatter: ST_ABSTRACT_FORMATTER
			fsign: INTEGER
			use_style_e: BOOLEAN
		do
			fa := value.item.abs
			fsign := e_formatter.double_sign (value.item)
			if value.item /= 0 then
				exponent := fsign * (log10 (fa)).floor
			else
				exponent := 0
			end
			use_style_e := (exponent < -4) or else (exponent >= precision)
			if use_style_e then
				formatter := e_formatter
			else
				formatter := f_formatter
			end
			formatter.set_value (value)
			formatter.set_width (width)
			formatter.set_precision (precision)
			Result := formatter.output
		end

feature {NONE} -- Implementation

	e_formatter: ST_FLOATING_POINT_FORMATTER
			-- Format to use then ?e output is desired

	f_formatter: ST_FIXED_POINT_FORMATTER
			-- Format to use then ?f output is desired

invariant

	e_formatter_not_void: e_formatter /= Void
	f_formatter_not_void: f_formatter /= Void

end
