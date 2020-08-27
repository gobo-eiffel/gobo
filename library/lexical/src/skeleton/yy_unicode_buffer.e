note

	description:
	"[
		Lexical analyzer buffers for Unicode inputs.
		The buffer contains 32-bit characters, after possible
		conversion if the input used a different encoding.
		Supported encodings: UTF-8, ISO-8859-1.
	]"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class YY_UNICODE_BUFFER

inherit

	YY_BUFFER
		rename
			make as make_from_iso_8859_1_string,
			set_string as set_iso_8859_1_string
		redefine
			content,
			new_default_buffer
		end

create

	make,
	make_from_iso_8859_1_string,
	make_from_utf8_string,
	make_from_buffer

feature {NONE} -- Initialization

	make (a_string: READABLE_STRING_GENERAL)
			-- Create a new buffer with characters from `a_string'.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
		local
			nb: INTEGER
			l_buffer: like content
		do
			nb := a_string.count
			l_buffer := new_default_buffer (nb + 2)
			l_buffer.fill_from_string (a_string, 1)
			l_buffer.put (End_of_buffer_character, nb + 1)
			l_buffer.put (End_of_buffer_character, nb + 2)
			make_from_buffer (l_buffer)
		ensure
			capacity_set: capacity = a_string.count
			count_set: count = a_string.count
			beginning_of_line: beginning_of_line
		end

	make_from_utf8_string (a_string: STRING_8)
			-- Create a new buffer with characters from `a_string'.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			nb: INTEGER
			l_buffer: like content
		do
			nb := a_string.count
			l_buffer := new_default_buffer (nb + 2)
			nb := l_buffer.fill_from_utf8_string (a_string, 1)
			l_buffer.put (End_of_buffer_character, nb + 1)
			l_buffer.put (End_of_buffer_character, nb + 2)
			make_from_buffer (l_buffer)
			count := nb
		ensure
			capacity_set: capacity = a_string.count
			at_least_one: not a_string.is_empty implies count > 0
			count_small_enough: count <= a_string.count
			beginning_of_line: beginning_of_line
		end

feature -- Access

	content: KL_UNICODE_CHARACTER_BUFFER
			-- Input buffer characters

feature -- Setting

	set_string (a_string: READABLE_STRING_GENERAL)
			-- Reset buffer with characters from `a_string'.
			-- Resize buffer capacity if needed.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
		local
			nb: INTEGER
			l_buffer: like content
		do
			l_buffer := content
			nb := a_string.count
			if nb > capacity then
				l_buffer.resize (nb + 2)
			end
			l_buffer.fill_from_string (a_string, 1)
			l_buffer.put (End_of_buffer_character, nb + 1)
			l_buffer.put (End_of_buffer_character, nb + 2)
			make_from_buffer (l_buffer)
			count := nb
		ensure
			capacity_set: capacity = (old capacity).max (a_string.count)
			count_set: count = a_string.count
			beginning_of_line: beginning_of_line
		end

	set_utf8_string (a_string: STRING_8)
			-- Reset buffer with characters from `a_string'.
			-- `a_string' is expected to be encoded with UTF-8.
			-- Replace invalid UTF-8 sequence by `content.invalid_unicode_charater'.
			-- Resize buffer capacity if needed.
			-- Do not alter `a_string' during the scanning process.
		require
			a_string_not_void: a_string /= Void
			a_string_is_string: a_string.same_type ({STRING_8} "")
		local
			nb: INTEGER
			l_buffer: like content
		do
			l_buffer := content
			nb := a_string.count
			if nb > capacity then
				l_buffer.resize (nb + 2)
			end
			nb := l_buffer.fill_from_utf8_string (a_string, 1)
			l_buffer.put (End_of_buffer_character, nb + 1)
			l_buffer.put (End_of_buffer_character, nb + 2)
			make_from_buffer (l_buffer)
			count := nb
		ensure
			capacity_set: capacity = (old capacity).max (a_string.count)
			at_least_one: not a_string.is_empty implies count > 0
			count_small_enough: count <= a_string.count
			beginning_of_line: beginning_of_line
		end

feature {NONE} -- Implementation

	new_default_buffer (nb: INTEGER): like content
			-- New buffer that can contain `nb' characters;
			-- `nb' should be large enough to make room for
			-- the two end-of-buffer characters
			-- (Note: create a new object at each call.)
		do
			create Result.make (nb)
		end

end
