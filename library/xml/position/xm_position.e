indexing

	description:

		"Abstract definition of positions in XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_POSITION

inherit

	ANY
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

	source_name: STRING is
			-- Name of source.
		deferred
		end
		
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
			Result.append_string (STRING_.as_string (row.out))
			Result.append_string (" cl: ")
			Result.append_string (STRING_.as_string (column.out))
			Result.append_string (" byte: ")
			Result.append_string (STRING_.as_string (byte_index.out))
			Result.append_string (" -> ")
			Result.append_string (STRING_.as_string (source_name))
		end

feature -- Obsolete
			
	source: XM_SOURCE is
			-- Source from where position is taken
		obsolete "Use source_name"
		do
				-- The ID is likely to be only a relative id or '-', 
				-- but should be sufficient for an obsolete routine.
			create {XM_DEFAULT_URI_SOURCE} Result.make (source_name)
		end

invariant

	source_name_not_void: source_name /= Void
	byte_index_positive: byte_index >= 0
	column_positive: column >= 0
	row_positive: row >= 0
	
end
