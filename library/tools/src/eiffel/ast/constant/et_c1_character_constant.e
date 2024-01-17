note

	description:

		"Eiffel character constants of the form 'A'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class ET_C1_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_value: CHARACTER_32)
			-- Create a new character constant.
		require
			valid_value: {ET_C1_CHARACTER_CONSTANT}.valid_value (a_value)
		do
			value := a_value
			make_leaf
		ensure
			value_set: value = a_value
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	literal: CHARACTER_32
			-- Character A such as 'A' is current character
		do
			Result := value
		ensure
			valid_literal: valid_literal ({STRING_32} "'" + create {STRING_32}.make_filled (Result, 1) + {STRING_32} "'")
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + 2)
		end

feature -- Status report

	valid_value (a_value: CHARACTER_32): BOOLEAN
			-- Is `a_value' a valid value for `value'?
		do
			Result := {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_value.natural_32_code)
		ensure
			instance_free: class
			definition: Result = {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_value.natural_32_code)
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
			a_processor.process_c1_character_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\'[^%%\n]\'"
			-- Regular expression for `literal'

invariant

	valid_value: valid_value (value)

end
