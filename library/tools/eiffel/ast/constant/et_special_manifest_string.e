note

	description:

		"Eiffel manifest strings with special characters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SPECIAL_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: like value) is
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: (([^"%\n]|%([^\n]|\/([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (a_literal)
			a_valid_not_void: a_value /= Void
		do
			literal := a_literal
			value := a_value
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_special_manifest_string (Current)
		end

invariant

	-- valid_literal: (([^"%\n]|%([^\n]|\/([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (literal)

end
