indexing

	description:

		"Formatting routines"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_IMPORTED_FORMATTERS

feature -- Access

	INTEGER_FORMATTER_: UT_INTEGER_FORMATTER is
			-- Formatting routines that ought
			-- to be in class INTEGER
		once
			!! Result
		ensure
			integer_formatter_not_void: Result /= Void
		end

	CHARACTER_FORMATTER_: UT_CHARACTER_FORMATTER is
			-- Formatting routines that ought
			-- to be in class CHARACTER
		once
			!! Result
		ensure
			character_formatter_not_void: Result /= Void
		end

	STRING_FORMATTER_: UT_STRING_FORMATTER is
			-- Formatting routines that ought
			-- to be in class STRING
		once
			!! Result
		ensure
			string_formatter_not_void: Result /= Void
		end

	ARRAY_FORMATTER_: UT_ARRAY_FORMATTER is
			-- Formatting routines that ought
			-- to be in class ARRAY
		once
			!! Result
		ensure
			array_formatter_not_void: Result /= Void
		end

end -- class UT_IMPORTED_FORMATTERS
