indexing

	description:

		"Position in a XML document which has been parsed from a stream"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_DEFAULT_POSITION

inherit

	XM_STREAM_POSITION

creation

	make

feature {ANY} -- Initialisation

	make (a_source: XM_SOURCE; a_byte_index, a_column, a_row: INTEGER) is
		require
			a_source_not_void: a_source /= Void
			a_byte_index_positive: a_byte_index >= 0
			a_column_positive: a_column >= 0
			a_row_positive: a_row >= 0
		do
			source := a_source
			byte_index := a_byte_index
			column := a_column
			row := a_row
		ensure
			source_set: source = a_source
			byte_index_set: byte_index = a_byte_index
			column_set: column = a_column
			row_set: row = a_row
		end

feature {ANY} -- Access

	source: XM_SOURCE
			-- file that the element resides in.

	byte_index: INTEGER
			-- character position of token in file.

	column: INTEGER
			-- column of token in file.

	row: INTEGER
			-- column of token in file.

end -- class XM_DEFAULT_POSITION

