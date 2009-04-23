indexing

	description:

		"Formatters for boolean parameters, $b and $B"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2005, Object-Tools and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_BOOLEAN_FORMATTER

inherit

	ST_PARAMETER_FORMATTER

create

	make

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN is
			-- Is `a_parameter' a valid parameter for current formatter?
		local
			a_cell: ?DS_CELL [BOOLEAN]
		do
			a_cell ?= a_parameter
			Result := a_cell /= Void
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
			-- (Use DS_CELL [BOOLEAN] because in SE 2.1
			-- BOOLEAN does not conform to ANY.)
		local
			a_cell: ?DS_CELL [BOOLEAN]
		do
			a_cell ?= a_parameter
			check
					-- From precondition 'valid_parameter'.
				valid_parameter: a_cell /= Void
			end
			boolean_format_to (a_cell.item, a_stream)
		end

	boolean_format_to (a_parameter: BOOLEAN; a_stream: KI_CHARACTER_OUTPUT_STREAM) is
			-- Format `a_parameter' to `a_stream'.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		do
			if is_lowercase then
				if a_parameter then
					justify_format_to (true_lowercase, a_stream)
				else
					justify_format_to (false_lowercase, a_stream)
				end
			else
				if a_parameter then
					justify_format_to (true_uppercase, a_stream)
				else
					justify_format_to (false_uppercase, a_stream)
				end
			end
		end

feature {NONE} -- Constants

	true_lowercase: STRING is "true"

	false_lowercase: STRING is "false"

	true_uppercase: STRING is "True"

	false_uppercase: STRING is "False"

end
