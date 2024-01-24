note

	description:

		"Abstract definition of positions in XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"

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

	source_name: STRING
			-- Name of source.
		deferred
		end

	byte_index: INTEGER
			-- Byte index of token in stream
		deferred
		end

	column: INTEGER
			-- Column of token in stream
		deferred
		end

	row: INTEGER
			-- Row of token in stream
		deferred
		end

feature -- Output

	out: STRING
			-- Textual representation
		do
			create Result.make_empty
			Result := STRING_.appended_string (Result, "line: ")
			Result := STRING_.appended_string (Result, row.out)
			Result := STRING_.appended_string (Result, " column: ")
			Result := STRING_.appended_string (Result, column.out)
			Result := STRING_.appended_string (Result, " byte: ")
			Result := STRING_.appended_string (Result, byte_index.out)
			Result := STRING_.appended_string (Result, " -> ")
			Result := STRING_.appended_string (Result, source_name)
		end

feature -- Obsolete

	source: XM_SOURCE
			-- Source from where position is taken
		obsolete
			"Use source_name. [2017-04-09]"
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
