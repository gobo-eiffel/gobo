indexing

	description:

		"Abstract definition of a position in a XML document which has been parsed from a stream"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XM_STREAM_POSITION

inherit

	XM_POSITION
		redefine
			out
		end

feature {ANY} -- Access

	byte_index: INTEGER is
			-- byte index of token in stream.
		deferred
		end

	column: INTEGER is
			-- column of token in stream.
		deferred
		end

	row: INTEGER is
			-- column of token in stream.
		deferred
		end

feature {ANY} -- Debug

	out: STRING is
		do
			Result := clone (" ln: ")
			Result.append_string (row.out)
			Result.append_string (" cl: ")
			Result.append_string (column.out)
			Result.append_string (" byte: ")
			Result.append_string (byte_index.out)
			Result.append_string (" -> ")
			Result.append_string (source.out)
		end

invariant

	byte_index_positive: byte_index > 0
	column_positive: column > 0
	row_positive: row > 0

end -- class XM_STREAM_POSITION

