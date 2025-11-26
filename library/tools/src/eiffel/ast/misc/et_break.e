note

	description:

		"Eiffel breaks"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2025, Eric Bezault and others"
	license: "MIT License"

class ET_BREAK

create

	make

feature {NONE} -- Initialization

	make (a_text: like text)
			-- Create a new break.
		require
			a_text_not_void: a_text /= Void
			a_text_is_string: a_text.same_type ({STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (a_text)
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Access

	text: STRING_8
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
				when 9..13, 32, 45, 160, 5760, 8192..8202, 8239, 8287, 12288 then
					i := i + l_byte_count
				else
					Result := True
						-- Jump out of the loop.
					i := nb + 1
				end
			end
		end

feature -- Output

	append_first_line_comment_to_string (a_indentation: detachable STRING_8; a_string: STRING_8)
			-- Append first line of comment, if any, to `a_string`.
			-- Prepend with `a_indentation` if specified.
		require
			valid_indentation: a_indentation /= Void implies (a_indentation.same_type ({STRING_8} "") and then {UC_UTF8_ROUTINES}.valid_utf8 (a_indentation))
			a_string_not_void: a_string /= Void
		local
			l_text: STRING_8
			i, j: INTEGER
			l_comment: STRING_8
		do
			l_text := text
			i := l_text.index_of ('-', 1)
			if i > 0 then
				j := l_text.index_of ('%N', i + 1)
			end
			if j > 0 then
				l_comment := l_text.substring (i, j - 1)
				l_comment.right_adjust
				if a_indentation /= Void then
					a_string.append_string (a_indentation)
				end
				a_string.append_string (l_comment)
			end
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_comment_to_string (a_indentation: detachable STRING_8; a_string: STRING_8)
			-- Append comment, if any, to `a_string`.
			-- Prepend each line with `a_indentation` if specified.
		require
			valid_indentation: a_indentation /= Void implies (a_indentation.same_type ({STRING_8} "") and then {UC_UTF8_ROUTINES}.valid_utf8 (a_indentation))
			a_string_not_void: a_string /= Void
		local
			l_splitter: ST_SPLITTER
			l_index: INTEGER
		do
			create l_splitter.make_with_separators ("%N%R")
			across l_splitter.split (text) as l_line loop
				l_index := l_line.index_of ('-', 1)
				if l_index > 0 then
					l_line.remove_head (l_index - 1)
					l_line.right_adjust
					if a_indentation /= Void then
						a_string.append_string (a_indentation)
					end
					a_string.append_string (l_line)
				end
			end
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

	append_header_comment_to_string (a_feature: ET_FEATURE; a_indentation: detachable STRING_8; a_string: STRING_8)
			-- Append comment, if any, to `a_string`.
			-- Prepend each line with `a_indentation` if specified.
			-- The comment is expected to be the header comment of `a_feature`.
			-- Replace "-- <Precursor>" with the header comment of the precursors
			-- of `a_feature`.
		require
			a_feature_not_void: a_feature /= Void
			valid_indentation: a_indentation /= Void implies (a_indentation.same_type ({STRING_8} "") and then {UC_UTF8_ROUTINES}.valid_utf8 (a_indentation))
			a_string_not_void: a_string /= Void
		local
			l_splitter: ST_SPLITTER
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_index: INTEGER
			l_precursors: DS_HASH_SET [ET_FEATURE]
			i, nb: INTEGER
		do
			create l_regexp.make
			l_regexp.compile ("(?i)--\s*<precursor/?>")
			create l_splitter.make_with_separators ("%N%R")
			across l_splitter.split (text) as l_line loop
				l_index := l_line.index_of ('-', 1)
				if l_index > 0 then
					l_line.remove_head (l_index - 1)
					l_line.right_adjust
					if l_regexp.recognizes (l_line) then
						if attached a_feature.other_precursors as l_other_precursors then
							create l_precursors.make (l_other_precursors.count + 1)
							if attached a_feature.first_precursor as l_first_precursor then
								l_precursors.put_last (l_first_precursor.implementation_feature)
							end
							nb := l_other_precursors.count
							from i := 1 until i > nb loop
								l_precursors.put_last (l_other_precursors.item (i).implementation_feature)
								i := i + 1
							end
							across l_precursors as l_precursor loop
								l_precursor.append_header_comment_to_string (a_indentation, a_string)
							end
						elseif attached a_feature.first_precursor as l_first_precursor then
							l_first_precursor.implementation_feature.append_header_comment_to_string (a_indentation, a_string)
						end
					else
						if a_indentation /= Void then
							a_string.append_string (a_indentation)
						end
						a_string.append_string (l_line)
					end
				end
			end
		ensure
			valid_utf8: (a_string.same_type ({STRING_8} "") and then old {UC_UTF8_ROUTINES}.valid_utf8 (a_string)) implies {UC_UTF8_ROUTINES}.valid_utf8 (a_string)
		end

invariant

	text_not_void: text /= Void
	text_is_string: text.same_type ({STRING_8} "")
	valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (text)

end
