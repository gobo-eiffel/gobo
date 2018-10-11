note

	description:

		"Routines to encode and decode url encoded (%HH in hex) strings"

	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004-2018, Berend de Boer and others"
	date: "$Date$"
	revision: "$Revision$"

class UT_URL_ENCODING

inherit

	ANY

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_UNICODE_FACTORY
		export {NONE} all end

feature -- Escape/unescape data characters

	unescape_string (a_string: STRING): STRING
			-- Replace the URI hexadecimal escape sequences in `a_string'
			-- with the corresponding Latin-1 characters.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
			d: STRING
		do
			Result := STRING_.cloned_string (a_string)
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c = '+' then
					Result.put (' ', i)
				elseif c = '%%' then
					if nb >= i + 2 then
							-- We skip the character if it is not valid.
						d := Result.substring (i + 1, i + 2)
						if STRING_.is_hexadecimal (d) then
							Result.put (INTEGER_.to_character (STRING_.hexadecimal_to_integer (d)), i)
							Result.remove (i + 1)
							Result.remove (i + 1)
							nb := nb - 2
						end
					end
				end
				i := i + 1
			end
		ensure
			instance_free: class
			unescaped_string_not_void: Result /= Void
			unescaped_string_cannot_be_larger: Result.count <= a_string.count
		end

	unescape_utf8 (a_string: STRING): detachable STRING
			-- Unescaped version of `a_string';
			-- It is assumed that non-ASCII characters are represented by
			--  percent-encoding their UTF-8 byte sequence.
		require
			a_string_not_void: a_string /= Void
			ascii_string: maximum_character_code_in_string (a_string) <= 127
		local
			l_high_code: INTEGER
		do
			Result := unescape_string (a_string)
			l_high_code := maximum_character_code_in_string (Result)
			if l_high_code > 255 then
				-- Not a (unescaped UTF-8) byte sequence
				Result := Void
			elseif l_high_code > 127 then
				-- Contains UTF-8 bytes
				if not ANY_.same_types (a_string, "") then
					-- We need dynamic type of STRING for the test for valid UTF-8
					Result := Result.string
				end
				if utf8.valid_utf8 (Result) then
					Result := new_unicode_string_from_utf8 (Result)
				else
					-- Original string was not an escaped UTF-8 string;
					-- E.g. A percent-encoded Latin-1 string.
					Result := Void
				end
			end
		ensure
			instance_free: class
			unescape_utf8_may_be_void: True
			unescape_utf8_cannot_be_larger: Result /= Void implies Result.count <= a_string.count
		end

	escape_string (a_string: STRING): STRING
			-- Escape reserved characters in `a_string' and return a new string.
		require
			a_string_not_void: a_string /= Void
			no_high_characters: maximum_character_code_in_string (a_string) < 256
		local
			l_default_unescaped: DS_HASH_SET [CHARACTER]
		do
				-- Bug in ISE 5.6.1103 for .NET: if we don't put
				-- `Default_unescaped' in a local variable before
				-- passing it to `escape_custom' then Void is
				-- passed instead.
			l_default_unescaped := Default_unescaped
			Result := escape_custom (a_string, l_default_unescaped, True)
		ensure
			instance_free: class
			escape_string_not_void: Result /= Void
			no_spaces: not Result.has (' ')
			escape_string_cannot_be_smaller: Result.count >= a_string.count
		end

	escape_utf8 (a_string: STRING): STRING
			-- Escape reserved characters in `a_string' and return a new
			-- string. Characters above 128 are converted to UTF8
			-- representation before being encoded.
		require
			a_string_not_void: a_string /= Void
		local
			l_default_unescaped: DS_HASH_SET [CHARACTER]
		do
				-- Bug in ISE 5.6.1103 for .NET: if we don't put
				-- `Default_unescaped' in a local variable before
				-- passing it to `escape_custom' then Void is
				-- passed instead.
			l_default_unescaped := Default_unescaped
			Result := escape_custom (utf8.to_utf8 (a_string), l_default_unescaped, True)
		ensure
			instance_free: class
			escape_utf8_not_void: Result /= Void
			no_spaces: not Result.has (' ')
			escape_utf8_cannot_be_smaller: Result.count >= a_string.count
		end

	escape_custom (a_string: STRING; unescaped_chars: DS_SET [CHARACTER]; escape_space_as_plus: BOOLEAN): STRING
			-- Escape all characters except those in `unescaped_chars' in
			-- `a_string' and return a new string.
		require
			a_string_not_void: a_string /= Void
			unescaped_chars_not_void: unescaped_chars /= Void
			no_high_characters: maximum_character_code_in_string (a_string) < 256
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := STRING_.cloned_string (a_string)
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if escape_space_as_plus and c = ' ' then
					Result.put ('+', i)
				elseif unescaped_chars.has (c) then
					-- OK.
				else
					Result.put ('%%', i)
					i := i + 1
					Result.insert_character (INTEGER_.to_hexadecimal (c.code // 16 \\ 16, True).item (1), i)
					i := i + 1
					Result.insert_character (INTEGER_.to_hexadecimal (c.code \\ 16, True).item (1), i)
					nb := nb + 2
				end
				i := i + 1
			end
		ensure
			instance_free: class
			escape_custom_not_void: Result /= Void
			space_as_plus: escape_space_as_plus implies (not Result.has (' ') and (a_string.has (' ') implies Result.has ('+')))
			escape_custom_cannot_be_smaller: Result.count >= a_string.count
		end

feature -- Character sets

	maximum_character_code_in_string (a_string: STRING): INTEGER
			-- Maximum character code used in string
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			a_code: INTEGER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				a_code := a_string.item_code (i)
				if a_code > Result then
					Result := a_code
				end
				i := i + 1
			end
		ensure
			instance_free: class
			positive_result: Result >= 0
			empty_zero: a_string.is_empty implies Result = 0
		end

	new_character_set (some_characters: STRING): DS_HASH_SET [CHARACTER]
			-- New set of characters for use with `escape_custom'
		require
			some_characters_not_void: some_characters /= Void
			-- occurrences: for all c in some_characters: some_characters.occurrences (c) = 1
		local
			i, nb: INTEGER
		do
			create Result.make_default
			nb := some_characters.count
			from i := 1 until i > nb loop
				Result.force (some_characters.item (i))
				i := i + 1
			end
		ensure
			instance_free: class
			set_not_void: Result /= Void
			count_set: Result.count = some_characters.count
		end

	Default_unescaped: DS_HASH_SET [CHARACTER]
			-- Default character set not to escape
		local
			l_default_unescaped: DS_HASH_SET [CHARACTER]
		once
				-- Bug in ISE 5.6 for .NET: use a local variable rather
				-- than directly `Result', otherwise Result is set to Void.
			l_default_unescaped := new_character_set (STRING_.concat (
				STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters),
				STRING_.concat (Rfc_digit_characters, Rfc_mark_characters)))
			Result := l_default_unescaped
		ensure
			instance_free: class
		end

	Rfc_lowalpha_characters: STRING = "abcdefghijklmnopqrstuvwxyz"
			-- RFC 2396 'lowalpha' characters

	Rfc_upalpha_characters: STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			-- RFC 2396 'lowalpha' characters

	Rfc_digit_characters: STRING = "0123456789"
			-- RFC 2396 'digit' characters

	Rfc_mark_characters: STRING = "-_.!~*%'()"
			-- RFC 2396 'mark' characters

	Rfc_reserved_characters: STRING = ";/?:@&=+$,"
			-- RFC 2396 'reserved' characters

	Rfc_extra_reserved_characters: STRING = "[]"
			-- RFC 2732 addition to 'reserved' characters

feature -- Valid characters

	has_excluded_characters (s: STRING): BOOLEAN
			-- Does `s' contain excluded characters?
			-- Note that the escape character '%' is not considered excluded.
		require
			s_not_void: s /= Void
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			nb := s.count
			from i := 1 until i > nb loop
				c := s.item (i)
				inspect
					c
				when '%/0/'..'%/31/' then
						-- Control characters.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when ' ', '%/128/'..'%/255/' then
						-- Space and non us-ascii characters.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when '<', '>', '"' then
						-- Delimiters, we allow %, else we can't create
						-- URIs with encoded data.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when '{', '}', '|', '\', '^', '`' then
						-- Unwise, can be modified by gateways and transport agents.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					-- OK.
				end
				i := i + 1
			end
		ensure
			instance_free: class
		end

	has_excluded_iri_codes (s: STRING): BOOLEAN
			-- Does `s' contain code points dis-allowed in IRIs?
		require
			s_not_void: s /= Void
		local
			i,c, nb: INTEGER
		do
			nb := s.count
			from i := 1 until i > nb loop
				c := s.item_code (i)
				inspect
					c
				when 0 .. 32 then
					-- Control characters and space.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 128 .. 159 then
					-- Latin-1 non-alpahbetic
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 34, 60, 62 then
					-- Delimiters ("<>), we allow %, else we can't create
					-- URIs with encoded data.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 40, 41, 92, 94, 96, 124 then
					-- ({,},|,\,^,`)Unwise, can be modified by gateways and transport agents.
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 55296 .. 57343 then
					-- UTF-16 surrogate codes
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 64976 .. 65007  then
					-- UTF-16 surrogate codes
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 65520 .. 65536 then
					-- ?? (last two are non-characters)
					Result := True
					i := nb + 1 -- Jump out of the loop.
				when 131070 .. 131071, 196606 .. 196607,
					262142 .. 262143, 327678 .. 327679,
					393214 .. 393215, 458750 .. 458751,
					524286 .. 524287, 589822 .. 589823,
					655358 .. 655359, 720894 .. 720895,
					786430 .. 786431, 851966 .. 851967,
					917502 .. 917503, 983038 .. 983039,
					1048574 .. 1048575, 1114110 .. 1114111 then
					-- non-characters
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					-- OK.
				end
			end
		ensure
			instance_free: class
		end

	is_valid_scheme (a_scheme: detachable STRING): BOOLEAN
			-- Is `a_scheme' a valid scheme?
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			if a_scheme = Void then
				Result := False
			else
				Result := True
				nb := a_scheme.count
				from i := 1 until i > nb loop
					c := a_scheme.item (i)
					inspect c
					when 'A'..'Z','a'..'z' then
						-- OK.
					when '0'..'9', '+', '-', '.' then
						if i = 1 then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						end
					else
						Result := False
						i := nb + 1 -- Jump out of the loop.
					end
					i := i + 1
				end
			end
		ensure
			instance_free: class
		end

end
