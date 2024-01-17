note

	description:

		"Eiffel character constants of the form '%%/code/'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class ET_C3_CHARACTER_CONSTANT

inherit

	ET_CHARACTER_CONSTANT
		redefine
			has_invalid_code
		end

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: CHARACTER_32; a_has_invalid_code: BOOLEAN)
			-- Create a new character constant.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {ET_C3_CHARACTER_CONSTANT}.valid_literal ("'%%/" + a_literal + "/'")
			valid_value: {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_value.natural_32_code)
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

feature -- Access

	literal: STRING_8
			-- Literal value of character code

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count + 4)
		end

feature -- Status report

	has_invalid_code: BOOLEAN
			-- Does the character code correspond to an invalid or surrogate
			-- code point in the Unicode encoding?

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
			a_processor.process_c3_character_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "'%%/[0-9](_*[0-9]+)*|0[xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|0[cC][0-7](_*[0-7]+)*|0[bB][0-1](_*[0-1]+)*/'"
			-- Regular expression for `literal'

invariant

	literal_not_void: literal /= Void
	valid_literal: valid_literal ("'%%/" + literal + "/'")

end
