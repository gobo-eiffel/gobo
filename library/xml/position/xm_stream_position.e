indexing

	description:

		"Abstract definition of a position in a XML document which has been parsed from a stream"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			Result := string_.concat (
				" ln: " + row.out + " cl: " + column.out + 
					" byte: " + byte_index.out + " -> ",
				source.out)
		end

invariant

	byte_index_positive: byte_index > 0
	column_positive: column > 0
	row_positive: row > 0

end
