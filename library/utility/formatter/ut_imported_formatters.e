indexing

	description:

		"Formatting routines"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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

	BOOLEAN_FORMATTER_: UT_BOOLEAN_FORMATTER is
			-- Formatting routines that ought
			-- to be in class BOOLEAN
		once
			!! Result
		ensure
			boolean_formatter_not_void: Result /= Void
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
