indexing

	description:

		"Imported string formatting routines"

	library: "Gobo Eiffel Formatter Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ST_FORMAT_ROUTINES

inherit

	ANY

	ST_SHARED_FORMATTER
		export {NONE} all end

feature -- Status

	is_correct_format_and_parameters (a_format: STRING; a_para: ARRAY [ANY]): BOOLEAN is
			-- Is `a_format' a correct format string and are all
			-- parameters in `a_para', 1) are used in `format', 2) have the
			-- correct type, 3) are not void?
		do
			Result := formatter.is_correct_format_and_parameters (a_format, a_para)
		end

feature -- Access

	format (a_format: STRING; a_para: ARRAY [ANY]): STRING is
			-- String with parameters in `a_format' replaced by
			-- parameters in `a_para'
		require
			parameters_valid: is_correct_format_and_parameters (a_format, a_para)
		do
			Result := formatter.format (a_format, a_para)
		ensure
			format_not_void: Result /= Void
		end

	format_single (a_format: STRING; a_para: ANY): STRING is
			-- String with single parameter in `a_format' replaced by
			-- `a_para'
		require
			parameters_valid: is_correct_format_and_parameters (a_format, <<a_para>>)
		do
			Result := formatter.format_single (a_format, a_para)
		ensure
			format_not_void: Result /= Void
		end

	integer_cell (an_integer: INTEGER): DS_CELL [INTEGER] is
			-- New DS_CELL [INTEGER] for use in input array
		do
			create Result.make (an_integer)
		ensure
			result_not_void: Result /= Void
			item_set: Result.item = an_integer
		end

	double_cell (a_double: DOUBLE): DS_CELL [DOUBLE] is
			-- New DS_CELL [DOUBLE] for use in input array
		do
			create Result.make (a_double)
		ensure
			result_not_void: Result /= Void
			item_set: Result.item = a_double
		end

	character_cell (a_char: CHARACTER): DS_CELL [CHARACTER]  is
			-- New DS_CELL [CHARACTER] for use in input array
		do
			create Result.make (a_char)
		ensure
			result_not_void: Result /= Void
			item_set: Result.item = a_char
		end
	
	boolean_cell (a_boolean: BOOLEAN): DS_CELL [BOOLEAN]  is
			-- New DS_CELL [BOOLEAN] for use in input array
		do
			create Result.make (a_boolean)
		ensure
			result_not_void: Result /= Void
			item_set: Result.item = a_boolean
		end

end
