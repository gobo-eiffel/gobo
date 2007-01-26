indexing

	description:

		"Formatters for string parameters, $s"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_STRING_FORMATTER

inherit

	ST_PARAMETER_FORMATTER
		redefine
			reset_options
		end

create

	make

feature -- Initialization

	reset_options is
			-- Reset options to their default values.
		do
			precursor
			set_width (0)
		end

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN is
			-- Is `a_parameter' a valid parameter for current formatter?
		local
			a_string: STRING
		do
			a_string ?= a_parameter
			Result := a_string /= Void
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		local
			a_string: STRING
		do
			a_string ?= a_parameter
			check valid_parameter: a_string /= Void end
			string_format_to (a_string, a_stream)
		end

	string_format_to (a_parameter: STRING; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		require
			a_parameter_not_void: a_parameter /= Void
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		local
			a_string: STRING
		do
			if precision > 0 and then precision < a_parameter.count then
				a_string := a_parameter.substring (1, precision)
			else
				a_string := a_parameter
			end
			justify_format_to (a_string, a_stream)
		end

end
