﻿note

	description:

		"Formatters for unsigned integer parameters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2013, Object-Tools and others"
	license: "MIT License"

deferred class ST_UNSIGNED_INTEGER_FORMATTER

inherit

	ST_INTEGER_FORMATTER
		redefine
			valid_parameter,
			integer_format_to
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN
			-- Is `a_parameter' a valid parameter for current formatter?
		do
			Result := attached {DS_CELL [INTEGER]} a_parameter as l_cell and then l_cell.item >= 0
		end

feature -- Formatting

	integer_format_to (a_parameter: INTEGER; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
		do
			plus_sign_enabled := False
			space_sign_enabled := False
			precursor (a_parameter, a_stream)
		end

end
