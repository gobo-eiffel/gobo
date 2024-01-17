note

	description:

		"Formatters for character parameters, $c"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2013, Object-Tools and others"
	license: "MIT License"

class ST_CHARACTER_FORMATTER

inherit

	ST_PARAMETER_FORMATTER

create

	make

feature -- Status report

	valid_parameter (a_parameter: ANY): BOOLEAN
			-- Is `a_parameter' a valid parameter for current formatter?
		do
			Result := attached {DS_CELL [CHARACTER]} a_parameter
		end

feature -- Formatting

	format_to (a_parameter: ANY; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
			-- (Use DS_CELL [CHARACTER] because in SE 2.1
			-- CHARACTER does not conform to ANY.)
		do
			check
					-- From precondition 'valid_parameter'.
				valid_parameter: attached {DS_CELL [CHARACTER]} a_parameter as l_cell
			then
				character_format_to (l_cell.item, a_stream)
			end
		end

	character_format_to (a_parameter: CHARACTER; a_stream: KI_CHARACTER_OUTPUT_STREAM)
			-- Format `a_parameter' to `a_stream'.
		require
			a_stream_not_void: a_stream /= Void
			a_stream_open_write: a_stream.is_open_write
		do
			character_buffer.put (a_parameter, 1)
			justify_format_to (character_buffer, a_stream)
		end

feature {NONE} -- Constants

	character_buffer: STRING = "#"
			-- Buffer used in `character_format_to'

end
