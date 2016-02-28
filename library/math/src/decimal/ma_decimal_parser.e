note

	description:

		"Decimal number parsers"

	library: "Gobo Eiffel Decimal Arithmetic Library"
	copyright: "Copyright (c) 2004, Paul G. Crismer and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class MA_DECIMAL_PARSER

feature {NONE} -- Initialization

	make
			-- Create a new decimal parser.
		do
		end

feature -- Access

	last_decimal: detachable MA_DECIMAL
			-- Last decimal parsed

feature -- Status report

	error: BOOLEAN
			-- Has an error occurred during the last call to `parse'?
		deferred
		end

feature -- Basic operations

	parse (a_string: STRING)
			-- Parse `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: not a_string.is_empty
		deferred
		ensure
			last_decimal_not_void_when_no_error: not error implies last_decimal /= Void
		end

end
