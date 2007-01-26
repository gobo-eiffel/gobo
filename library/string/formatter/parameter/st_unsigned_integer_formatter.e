indexing

	description:

		"Formatters for unsigned integer parameters"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_UNSIGNED_INTEGER_FORMATTER

inherit

	ST_INTEGER_FORMATTER
		redefine
			valid_parameter, integer_format_to
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN is
			-- Is `a_parameter' a valid parameter for current formatter?
		local
			a_cell: DS_CELL [INTEGER]
		do
			a_cell ?= a_parameter
			Result := a_cell /= Void and then a_cell.item >= 0
		end

feature -- Formatting

	integer_format_to (a_parameter: INTEGER; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		do
			plus_sign_enabled := False
			precursor (a_parameter, a_stream)
		end

end
