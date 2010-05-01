note

	description:

		"Formatting routines"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_IMPORTED_FORMATTERS

feature -- Access

	INTEGER_FORMATTER_: UT_INTEGER_FORMATTER is
			-- Formatting routines that ought
			-- to be in class INTEGER
		once
			create Result
		ensure
			integer_formatter_not_void: Result /= Void
		end

	CHARACTER_FORMATTER_: UT_CHARACTER_FORMATTER is
			-- Formatting routines that ought
			-- to be in class CHARACTER
		once
			create Result
		ensure
			character_formatter_not_void: Result /= Void
		end

	BOOLEAN_FORMATTER_: UT_BOOLEAN_FORMATTER is
			-- Formatting routines that ought
			-- to be in class BOOLEAN
		once
			create Result
		ensure
			boolean_formatter_not_void: Result /= Void
		end

	STRING_FORMATTER_: UT_STRING_FORMATTER is
			-- Formatting routines that ought
			-- to be in class STRING
		once
			create Result
		ensure
			string_formatter_not_void: Result /= Void
		end

	ARRAY_FORMATTER_: UT_ARRAY_FORMATTER is
			-- Formatting routines that ought
			-- to be in class ARRAY
		once
			create Result
		ensure
			array_formatter_not_void: Result /= Void
		end

end
