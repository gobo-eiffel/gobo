note

	description:

		"Eiffel manifest strings with special characters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SPECIAL_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING
		redefine
			has_invalid_code
		end

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: like value; a_has_invalid_code: BOOLEAN)
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			a_literal_is_string: {KL_ANY_ROUTINES}.same_types (a_literal, "")
			valid_utf8_literal: {UC_UTF8_ROUTINES}.valid_utf8 (a_literal)
			-- valid_literal: (([^"%\n\x80-\xFF]|{NON_ASCII}|%([^\n\x08-\xFF]|\/([[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*)\/|{HORIZONTAL_BREAK}*\n{BREAK}*%))*).recognizes (a_literal)
			a_value_not_void: a_value /= Void
			a_value_is_string: {KL_ANY_ROUTINES}.same_types (a_value, "")
			valid_utf8_value: {UC_UTF8_ROUTINES}.valid_utf8 (a_value)
		do
			literal := a_literal
			value := a_value
			has_invalid_code := a_has_invalid_code
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
			has_invalid_code_set: has_invalid_code = a_has_invalid_code
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Status report

	has_invalid_code: BOOLEAN
			-- Does the manifest string contain a character code which corresponds
			-- to an invalid or surrogate code point in the Unicode encoding?

feature -- Access

	value: STRING
			-- String value
			-- (using UTF-8 encoding)

	literal: STRING
			-- Literal value
			-- (using UTF-8 encoding)

	last_position: ET_POSITION
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

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_special_manifest_string (Current)
		end

invariant

	-- valid_literal: (([^"%\n\x80-\xFF]|{NON_ASCII}|%([^\n\x08-\xFF]|\/([[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*)\/|{HORIZONTAL_BREAK}*\n{BREAK}*%))*).recognizes (literal)

end
