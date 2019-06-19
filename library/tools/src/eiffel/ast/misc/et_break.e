note

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BREAK

create

	make

feature {NONE} -- Initialization

	make (a_text: like text)
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string: {KL_ANY_ROUTINES}.same_types (a_text, "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Access

	text: STRING
			-- Text of break
			-- (using UTF-8 encoding)

feature -- Status report

	has_comment: BOOLEAN
			-- Does current break contain a comment?
		do
			Result := text.has ('-')
		end

	has_non_empty_comment: BOOLEAN
			-- Does current break contain a non-empty comment?
			-- (Comments only made up of white characters or minus signs are not taken into account.)
		local
			i, nb: INTEGER
			l_byte_count: INTEGER
			l_code: NATURAL_32
			c1: CHARACTER_8
		do
			nb := text.count
			from i := 1 until i > nb loop
				c1 := text.item (i)
				l_byte_count := {UC_UTF8_ROUTINES}.encoded_byte_count (c1)
				inspect l_byte_count
				when 1 then
						-- 0xxxxxxx
					l_code := text.item (i).natural_32_code
				when 2 then
						-- 110xxxxx 10xxxxxx
					l_code := {UC_UTF8_ROUTINES}.two_byte_character_code (c1, text.item (i + 1))
				when 3 then
						-- 1110xxxx 10xxxxxx 10xxxxxx
					l_code := {UC_UTF8_ROUTINES}.three_byte_character_code (c1, text.item (i + 1), text.item (i + 2))
				when 4 then
						-- 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
					l_code := {UC_UTF8_ROUTINES}.four_byte_character_code (c1, text.item (i + 1), text.item (i + 2), text.item (i + 3))
				else
						-- Should never happen.
						-- Return True.
					l_code := ('a').natural_32_code
				end
				inspect l_code
				when 9, 10, 11, 13, 32, 45, 160, 5760, 8192..8202, 8239, 8287, 12288 then
					i := i + l_byte_count
				else
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
			end
		end

invariant

	text_not_void: text /= Void
	text_is_string: {KL_ANY_ROUTINES}.same_types (text, "")
	valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (text)

end
