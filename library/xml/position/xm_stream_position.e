indexing

	description:

		"Abstract definition of positions in XML documents which have been parsed from streams"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_STREAM_POSITION

inherit

	XM_POSITION
		redefine
			out
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			out
		end

feature -- Access

	byte_index: INTEGER is
			-- Byte index of token in stream
		deferred
		end

	column: INTEGER is
			-- Column of token in stream
		deferred
		end

	row: INTEGER is
			-- Row of token in stream
		deferred
		end

feature -- Output

	out: STRING is
			-- Textual representation
		do
			Result := STRING_.make (40)
			Result.append_string (" ln: ")
			Result := STRING_.appended_string (Result, row.out)
			Result.append_string (" cl: ")
			Result := STRING_.appended_string (Result, column.out)
			Result.append_string (" byte: ")
			Result := STRING_.appended_string (Result, byte_index.out)
			Result.append_string (" -> ")
			Result := STRING_.appended_string (Result, source.out)
		end

invariant

	byte_index_positive: byte_index >= 0
	column_positive: column >= 0
	row_positive: row >= 0

end
