note

	description:

		"Formatters for boolean parameters, $b and $B"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2013, Object-Tools and others"
	license: "MIT License"

class ST_BOOLEAN_FORMATTER

inherit

	ST_PARAMETER_FORMATTER

create

	make

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN
			-- Is `a_parameter' a valid parameter for current formatter?
		do
			Result := attached {DS_CELL [BOOLEAN]} a_parameter
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
			-- (Use DS_CELL [BOOLEAN] because in SE 2.1
			-- BOOLEAN does not conform to ANY.)
		do
			check
					-- From precondition 'valid_parameter'.
				valid_parameter: attached {DS_CELL [BOOLEAN]} a_parameter as l_cell
			then
				boolean_format_to (l_cell.item, a_stream)
			end
		end

	boolean_format_to (a_parameter: BOOLEAN; a_stream: KI_CHARACTER_OUTPUT_STREAM)
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

	true_lowercase: STRING = "true"

	false_lowercase: STRING = "false"

	true_uppercase: STRING = "True"

	false_uppercase: STRING = "False"

end
