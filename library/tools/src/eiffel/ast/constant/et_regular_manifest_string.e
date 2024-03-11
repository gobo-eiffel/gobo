note

	description:

		"Eiffel manifest strings with no special character"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_REGULAR_MANIFEST_STRING

inherit

	ET_MANIFEST_STRING

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal)
			-- Create a new manifest string.
		require
			a_literal_not_void: a_literal /= Void
			a_literal_is_string_8: a_literal.same_type ({STRING_8} "")
			valid_utf8_literal: {UC_UTF8_ROUTINES}.valid_utf8 (a_literal)
			valid_literal: {ET_REGULAR_MANIFEST_STRING}.valid_literal ({STRING_32} "%"" + {UTF_CONVERTER}.utf_8_string_8_to_string_32 (a_literal) + {STRING_32} "%"")
		do
			value := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	value: STRING_8
			-- String value
			-- (using UTF-8 encoding)

	literal: STRING_8
			-- Literal value
			-- (using UTF-8 encoding)
		do
			Result := value
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + {UC_UTF8_ROUTINES}.unicode_character_count (value) + 1)
		end

feature -- Status report

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

feature -- Setting

	set_literal (a_literal: like literal)
			-- Set `literal' to `a_literal'.
		require
			a_literal_not_void: a_literal /= Void
			a_literal_is_string_8: a_literal.same_type ({STRING_8} "")
			valid_utf8_literal: {UC_UTF8_ROUTINES}.valid_utf8 (a_literal)
			valid_literal: {ET_REGULAR_MANIFEST_STRING}.valid_literal ({STRING_32} "%"" + {UTF_CONVERTER}.utf_8_string_8_to_string_32 (a_literal) + {STRING_32} "%"")
		do
			value := a_literal
		ensure
			literal_set: literal = a_literal
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_regular_manifest_string (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\%"[^%%\n%"]*\%""
			-- Regular expression for literal

invariant

	valid_literal: valid_literal ({STRING_32} "%"" + {UTF_CONVERTER}.utf_8_string_8_to_string_32 (literal) + {STRING_32} "%"")

end
