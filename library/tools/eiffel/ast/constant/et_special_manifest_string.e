indexing

	description:

		"Eiffel manifest strings with special characters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SPECIAL_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

creation

	make

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: (([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	value: STRING
			-- String value

	literal: STRING
			-- Literal value

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		local
			l_newlines: INTEGER
			l_column: INTEGER
			i, nb: INTEGER
		do
			l_newlines := literal.occurrences ('%N')
			if l_newlines = 0 then
				create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count + 1)
			else
				from
					nb := literal.count
					i := nb
				until
					literal.item (i) = '%N'
				loop
					i := i - 1
				end
				l_column := nb - i
				create {ET_COMPRESSED_POSITION} Result.make (line + l_newlines, l_column)
			end
		end

feature -- Status report

	computed: BOOLEAN is
			-- Has manifest string been succesfully computed?
		do
			Result := value /= Void
		end

feature -- Compilation

	compute (error_handler: ET_ERROR_HANDLER) is
			-- Compute manifest string, expand special characters.
			-- Make result available in `value'.
		do
			-- TODO.
			value := ""
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_special_manifest_string (Current)
		end

invariant

	-- valid_literal: (([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (literal)

end
