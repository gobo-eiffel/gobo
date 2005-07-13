indexing

	description:

		"Positions in an XML document which has been parsed from a stream"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DEFAULT_POSITION

inherit

	XM_POSITION
	
	XM_STREAM_POSITION -- obsolete
		
create

	make

feature {NONE} -- Initialization

	make (a_source: like source_name; a_byte_index, a_column, a_row: INTEGER) is
			-- Create a new position.
		require
			a_source_not_void: a_source /= Void
			a_byte_index_positive: a_byte_index >= 0
			a_column_positive: a_column >= 0
			a_row_positive: a_row >= 0
		do
			source_name := a_source
			byte_index := a_byte_index
			column := a_column
			row := a_row
		ensure
			source_set: source_name = a_source
			byte_index_set: byte_index = a_byte_index
			column_set: column = a_column
			row_set: row = a_row
		end

feature -- Access

	source_name: STRING
			-- Name of source.

	byte_index: INTEGER
			-- Byte position of token in file

	column: INTEGER
			-- Column of token in file

	row: INTEGER
			-- Row of token in file

end
