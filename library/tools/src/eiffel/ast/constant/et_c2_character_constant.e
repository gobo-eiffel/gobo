note

	description:

		"Eiffel character constants of the form '%%A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class ET_C2_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_value: CHARACTER_8)
			-- Create a new character constant.
		require
			a_value_valid: {ET_C2_CHARACTER_CONSTANT}.valid_value (a_value.to_character_32)
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	literal: CHARACTER_8
			-- Character A such as '%A' is current character
		do
			inspect value
			when '%A' then
				Result := 'A'
			when '%B' then
				Result := 'B'
			when '%C' then
				Result := 'C'
			when '%D' then
				Result := 'D'
			when '%F' then
				Result := 'F'
			when '%H' then
				Result := 'H'
			when '%L' then
				Result := 'L'
			when '%N' then
				Result := 'N'
			when '%Q' then
				Result := 'Q'
			when '%R' then
				Result := 'R'
			when '%S' then
				Result := 'S'
			when '%T' then
				Result := 'T'
			when '%U' then
				Result := 'U'
			when '%V' then
				Result := 'V'
			when '%%' then
				Result := '%%'
			when '%'' then
				Result := '%''
			when '%"' then
				Result := '%"'
			when '%(' then
				Result := '('
			when '%)' then
				Result := ')'
			when '%<' then
				Result := '<'
			when '%>' then
				Result := '>'
			else
					-- Should never happen.
				Result := 'A'
			end
		ensure
			valid_literal: valid_literal ("'%%" + create {STRING_8}.make_filled (Result, 1) + "'")
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 3)
		end

feature -- Status report

	valid_value (a_value: CHARACTER_32): BOOLEAN
			-- Is `a_value' a valid value for `value'?
		do
			inspect a_value
			when '%A', '%B', '%C', '%D', '%F', '%H', '%L', '%N', '%Q', '%R', '%S', '%T', '%U', '%V', '%%', '%'', '%"', '%(', '%)', '%<', '%>' then
				Result := True
			else
				Result := False
			end
		ensure
			instance_free: class
		end

	valid_literal (a_literal: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_literal' a valid value for literal?
		require
			a_literal_not_void: a_literal /= Void
		do
			Result := {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		ensure
			instance_free: class
			definition: Result = {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_c2_character_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\'%%[ABCDFHLNQRSTUV%%'%"()<>]\'"
			-- Regular expression for `literal'

invariant

	value_is_character_8: value.is_character_8
	valid_value: valid_value (value)

end
