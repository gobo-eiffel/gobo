note

	description:

		"String formatting routines"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_FORMATTING_ROUTINES

inherit

	ANY

	ST_SHARED_FORMATTERS
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	valid_format_and_parameters (a_format: STRING; a_parameters: ARRAY [ANY]): BOOLEAN
			-- Does `a_format' contain valid formatting specifications and
			-- do `a_parameters' comply to these formatting specifications?
		require
			a_format_not_void: a_format /= Void
		do
			Result := formatter.valid_format_and_parameters (a_format, a_parameters)
		end

feature -- Access

	format (a_format: STRING; a_parameters: ARRAY [ANY]): STRING
			-- Copy of `a_format' where the formatting specifications
			-- have been replaced by their corresponding formatted
			-- parameters from `a_parameters'
			--
			-- (`a_parameters' must be an array of references and should
			-- not contain expanded types. SE will core dump if you try
			-- to do that. Furthermore, in SE 2.1 expanded types such as
			-- INTEGER do not conform to ANY anymore. So, instead of
			-- expanded parameters such as INTEGER we should pass a
			-- 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			valid_format_and_parameters: valid_format_and_parameters (a_format, a_parameters)
		do
			Result := formatter.format (a_format, a_parameters)
		ensure
			formatted_string_not_void: Result /= Void
			same_type: ANY_.same_types (a_format, Result)
		end

	format_single (a_format: STRING; a_parameter: ANY): STRING
			-- Copy of `a_format' where the single formatting specification
			-- have been replaced by formatted version of `a_parameter'
			--
			-- (In SE 2.1 expanded types such as INTEGER do not conform
			-- to ANY anymore. So, instead of expanded parameters such
			-- as INTEGER we should pass a 'DS_CELL [INTEGER]'.)
		require
			a_format_not_void: a_format /= Void
			valid_format_and_parameters: valid_format_and_parameters (a_format, <<a_parameter>>)
		do
			Result := formatter.format_single (a_format, a_parameter)
		ensure
			formatted_string_not_void: Result /= Void
			same_type: ANY_.same_types (a_format, Result)
		end

feature -- Convenience

	integer_cell (an_integer: INTEGER): DS_CELL [INTEGER]
			-- New 'DS_CELL [INTEGER]' for use in input array
			-- (Necessary because SE does not support INTEGER_REF
			-- or 'reference INTEGER' anymore.)
		do
			create Result.make (an_integer)
		ensure
			cell_not_void: Result /= Void
			item_set: Result.item = an_integer
		end

	double_cell (a_double: DOUBLE): DS_CELL [DOUBLE]
			-- New 'DS_CELL [DOUBLE]' for use in input array
			-- (Necessary because SE does not support DOUBLE_REF
			-- or 'reference DOUBLE' anymore.)
		do
			create Result.make (a_double)
		ensure
			cell_not_void: Result /= Void
			item_set: Result.item = a_double
		end

	character_cell (a_char: CHARACTER): DS_CELL [CHARACTER]
			-- New 'DS_CELL [CHARACTER]' for use in input array
			-- (Necessary because SE does not support CHARACTER_REF
			-- or 'reference CHARACTER' anymore.)
		do
			create Result.make (a_char)
		ensure
			cell_not_void: Result /= Void
			item_set: Result.item = a_char
		end

	boolean_cell (a_boolean: BOOLEAN): DS_CELL [BOOLEAN]
			-- New 'DS_CELL [BOOLEAN]' for use in input array
			-- (Necessary because SE does not support BOOLEAN_REF
			-- or 'reference BOOLEAN' anymore.)
		do
			create Result.make (a_boolean)
		ensure
			cell_not_void: Result /= Void
			item_set: Result.item = a_boolean
		end

end
