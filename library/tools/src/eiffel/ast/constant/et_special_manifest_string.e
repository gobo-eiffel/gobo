note

	description:

		"Eiffel manifest strings with special characters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

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
			a_literal_is_string_8: a_literal.same_type ({STRING_8} "")
			valid_utf8_literal: {UC_UTF8_ROUTINES}.valid_utf8 (a_literal)
			valid_literal: {ET_SPECIAL_MANIFEST_STRING}.valid_literal ({STRING_32} "%"" + {UTF_CONVERTER}.utf_8_string_8_to_string_32 (a_literal) + {STRING_32} "%"")
			a_value_not_void: a_value /= Void
			a_value_is_string_8: a_value.same_type ({STRING_8} "")
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

	value: STRING_8
			-- String value
			-- (using UTF-8 encoding)

	literal: STRING_8
			-- Literal value
			-- (using UTF-8 encoding)

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		local
			l_newlines: INTEGER
			i, nb: INTEGER
		do
			l_newlines := literal.occurrences ('%N')
			if l_newlines = 0 then
				create {ET_COMPRESSED_POSITION} Result.make (line, column + {UC_UTF8_ROUTINES}.unicode_character_count (literal) + 1)
			else
				from
					nb := literal.count
					i := nb
				until
					literal.item (i) = '%N'
				loop
					i := i - 1
				end
				create {ET_COMPRESSED_POSITION} Result.make (line + l_newlines, {UC_UTF8_ROUTINES}.unicode_substring_character_count (literal, i + 1, nb) + 1)
			end
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_special_manifest_string (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "\%"([^%"%%\n]|%%([ABCDFHLNQRSTUV%%'%"()<>]|/(0([xX][0-9a-fA-F](_*[0-9a-fA-F]+)*|[cC][0-7](_*[0-7]+)*|[bB][0-1](_*[0-1]+)*|(_*[0-9]+)*)|[1-9](_*[0-9]+)*)/|[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]*\n[ \t\x0B\f\r\n\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]*%%))*\%""
			-- Regular expression for literal

invariant

	valid_literal: valid_literal ({STRING_32} "%"" + {UTF_CONVERTER}.utf_8_string_8_to_string_32 (literal) + {STRING_32} "%"")

end
