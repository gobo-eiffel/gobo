indexing

	description:

		"C-like formatters that receive a string and parameters %
		%as input and return the formatted output."

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_CUSTOMIZABLE_FORMATTER

inherit

	ST_FORMATTER
		redefine
			make_with_escape
		end

create

	make,
	make_with_escape

feature {NONE} -- Initialization

	make_with_escape (c: CHARACTER) is
			-- Create new formatter with `c' as escape character.
		do
			precursor (c)
			create parameter_formatters.make (50)
		end

feature -- Parameter formatters

	has_parameter_formatter (a_typechar: CHARACTER): BOOLEAN is
			-- Is there a formatter for parameters of type `a_typechar'?
		require
			valid_typechar: (a_typechar >= 'a' and a_typechar <= 'z') or (a_typechar >= 'A' and a_typechar <= 'Z')
		do
			Result := parameter_formatters.has (a_typechar)
		end

	parameter_formatter (a_typechar: CHARACTER): ST_PARAMETER_FORMATTER is
			-- Formatter for parameters of type `a_typechar'
		require
			valid_typechar: (a_typechar >= 'a' and a_typechar <= 'z') or (a_typechar >= 'A' and a_typechar <= 'Z')
			has_parameter_formatter: has_parameter_formatter (a_typechar)
		do
			Result := parameter_formatters.item (a_typechar)
		ensure
			parameter_formatter_not_void: Result /= Void
		end

	put_parameter_formatter (a_formatter: ST_PARAMETER_FORMATTER; a_typechar: CHARACTER) is
			-- Add `a_formatter' for parameters of type `a_typechar'.
		require
			a_formatter_not_void: a_formatter /= Void
			valid_typechar: (a_typechar >= 'a' and a_typechar <= 'z') or (a_typechar >= 'A' and a_typechar <= 'Z')
		do
			parameter_formatters.force (a_formatter, a_typechar)
		ensure
			has_parameter_formatter: has_parameter_formatter (a_typechar)
		end

	put_scientific_parameter_formatters is
			-- Add scientific parameter formatters.
		local
			a_boolean_formatter: ST_BOOLEAN_FORMATTER
			a_character_formatter: ST_CHARACTER_FORMATTER
			a_floating_point_formatter: ST_FLOATING_POINT_FORMATTER
			a_fixed_point_formatter: ST_FIXED_POINT_FORMATTER
			a_fixed_or_floating_point_formatter: ST_FIXED_OR_FLOATING_POINT_FORMATTER
			a_decimal_formatter: ST_DECIMAL_FORMATTER
			an_octal_formatter: ST_UNSIGNED_OCTAL_FORMATTER
			an_hexadecimal_formatter: ST_UNSIGNED_HEXADECIMAL_FORMATTER
			an_unsigned_decimal_formatter: ST_UNSIGNED_DECIMAL_FORMATTER
			a_pointer_formatter: ST_POINTER_FORMATTER
			a_string_formatter: ST_STRING_FORMATTER
		do
			create a_boolean_formatter.make
			parameter_formatters.force (a_boolean_formatter, 'b')
			parameter_formatters.force (a_boolean_formatter, 'B')
			create a_character_formatter.make
			parameter_formatters.force (a_character_formatter, 'c')
			create a_floating_point_formatter.make
			parameter_formatters.force (a_floating_point_formatter, 'e')
			parameter_formatters.force (a_floating_point_formatter, 'E')
			create a_fixed_point_formatter.make
			parameter_formatters.force (a_fixed_point_formatter, 'f')
			create a_fixed_or_floating_point_formatter.make
			parameter_formatters.force (a_fixed_or_floating_point_formatter, 'g')
			parameter_formatters.force (a_fixed_or_floating_point_formatter, 'G')
			create a_decimal_formatter.make
			parameter_formatters.force (a_decimal_formatter, 'd')
			parameter_formatters.force (a_decimal_formatter, 'i')
			create an_octal_formatter.make
			parameter_formatters.force (an_octal_formatter, 'o')
			create an_hexadecimal_formatter.make
			parameter_formatters.force (an_hexadecimal_formatter, 'x')
			parameter_formatters.force (an_hexadecimal_formatter, 'X')
			create an_unsigned_decimal_formatter.make
			parameter_formatters.force (an_unsigned_decimal_formatter, 'u')
			create a_pointer_formatter.make
			parameter_formatters.force (a_pointer_formatter, 'p')
			parameter_formatters.force (a_pointer_formatter, 'P')
			create a_string_formatter.make
			parameter_formatters.force (a_string_formatter, 's')
		end

	remove_parameter_formatter (a_formatter: ST_PARAMETER_FORMATTER; a_typechar: CHARACTER) is
			-- Added `a_formatter' for parameters of type `a_typechar'.
		require
			valid_typechar: (a_typechar >= 'a' and a_typechar <= 'z') or (a_typechar >= 'A' and a_typechar <= 'Z')
		do
			parameter_formatters.remove (a_typechar)
		ensure
			not_has_parameter_formatter: not has_parameter_formatter (a_typechar)
		end

feature {NONE} -- Parameter formatters

	internal_parameter_formatter (a_typechar: CHARACTER): detachable ST_PARAMETER_FORMATTER is
			-- Formatter for parameter of type `a_typechar';
			-- Void if no such parameter formatter
		do
			parameter_formatters.search (a_typechar)
			if parameter_formatters.found then
				Result := parameter_formatters.found_item
				Result.reset_options
				Result.set_lowercase (a_typechar >= 'a' and a_typechar <= 'z')
			end
		end

	parameter_formatters: DS_HASH_TABLE [ST_PARAMETER_FORMATTER, CHARACTER]
			-- Registered parameter formatters

invariant

	parameter_formatters_not_void: parameter_formatters /= Void
	no_void_parameter_formatter: not parameter_formatters.has_void_item

end
