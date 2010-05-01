note

	description:

		"Eiffel manifest strings with no special character"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_REGULAR_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: ([^"%\n]*).recognizes (a_literal)
		do
			value := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	value: STRING
			-- String value

	literal: STRING is
			-- Literal value
		do
			Result := value
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + value.count + 1)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_regular_manifest_string (Current)
		end

invariant

	-- valid_literal: ([^"%\n]*).recognizes (literal)

end
