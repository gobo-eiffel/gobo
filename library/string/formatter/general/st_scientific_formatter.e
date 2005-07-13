indexing

	description:

		"C-like formatters that receive a string and parameters %
		%as input and return the formatted output."

	usage: "Inherit from ST_FORMATTING_ROUTINES and use its format routines."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class ST_SCIENTIFIC_FORMATTER

inherit

	ST_FORMATTER
		redefine
			make_with_escape
		end

create

	make, make_with_escape

feature {NONE} -- Initialization

	make_with_escape (c: CHARACTER) is
			-- Create new scientific formatter with `c' as escape character.
		do
			precursor (c)
			create boolean_formatter.make
			create character_formatter.make
			create floating_point_formatter.make
			create fixed_point_formatter.make
			create fixed_or_floating_point_formatter.make
			create decimal_formatter.make
			create octal_formatter.make
			create hexadecimal_formatter.make
			create unsigned_decimal_formatter.make
			create pointer_formatter.make
			create string_formatter.make
		end

feature {NONE} -- Parameter formatters

	internal_parameter_formatter (a_typechar: CHARACTER): ST_PARAMETER_FORMATTER is
			-- Formatter for parameter of type `a_typechar';
			-- Void if no such parameter formatter
		local
			a_lowercase: BOOLEAN
		do
			a_lowercase := True
			inspect a_typechar
			when 'b' then
				Result := boolean_formatter
			when 'B' then
				Result := boolean_formatter
				a_lowercase := False
			when 'c' then
				Result := character_formatter
			when 'e' then
				Result := floating_point_formatter
			when 'E' then
				Result := floating_point_formatter
				a_lowercase := False
			when 'f' then
				Result := fixed_point_formatter
			when 'g' then
				Result := fixed_or_floating_point_formatter
			when 'G' then
				Result := fixed_or_floating_point_formatter
				a_lowercase := False
			when 'd', 'i' then
				Result := decimal_formatter
			when 'o' then
				Result := octal_formatter
			when 'x' then
				Result := hexadecimal_formatter
			when 'X' then
				Result := hexadecimal_formatter
				a_lowercase := False
			when 'u' then
				Result := unsigned_decimal_formatter
			when 'p' then
				Result := pointer_formatter
			when 'P' then
				Result := pointer_formatter
				a_lowercase := False
			when 's' then
				Result := string_formatter
			else
				set_error ("Unknown typechar '" + a_typechar.out + "'")
			end
			if Result /= Void then
				Result.reset_options
				Result.set_lowercase (a_lowercase)
			end
		end

	boolean_formatter: ST_BOOLEAN_FORMATTER
	character_formatter: ST_CHARACTER_FORMATTER
	floating_point_formatter: ST_FLOATING_POINT_FORMATTER
	fixed_point_formatter: ST_FIXED_POINT_FORMATTER
	fixed_or_floating_point_formatter: ST_FIXED_OR_FLOATING_POINT_FORMATTER
	decimal_formatter: ST_DECIMAL_FORMATTER
	octal_formatter: ST_UNSIGNED_OCTAL_FORMATTER
	hexadecimal_formatter: ST_UNSIGNED_HEXADECIMAL_FORMATTER
	unsigned_decimal_formatter: ST_UNSIGNED_DECIMAL_FORMATTER
	pointer_formatter: ST_POINTER_FORMATTER
	string_formatter: ST_STRING_FORMATTER
			-- Parameter formatters

invariant

	boolean_formatter_not_void: boolean_formatter /= Void
	character_formatter_not_void: character_formatter /= Void
	floating_point_formatter_not_void: floating_point_formatter /= Void
	fixed_point_formatter_not_void: fixed_point_formatter /= Void
	fixed_or_floating_point_formatter_not_void: fixed_or_floating_point_formatter /= Void
	decimal_formatter_not_void: decimal_formatter /= Void
	octal_formatter_not_void: octal_formatter /= Void
	hexadecimal_formatter_not_void: hexadecimal_formatter /= Void
	unsigned_decimal_formatter_not_void: unsigned_decimal_formatter /= Void
	pointer_formatter_not_void: pointer_formatter /= Void
	string_formatter_not_void: string_formatter /= Void

end
