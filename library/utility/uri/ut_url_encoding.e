indexing

	description: 
	
		"Routines to encode and decode url encoded (%HH in hex) strings"

	library: "Gobo Eiffel Utility Library"
	author: "Copyright (c) 2004, Berend de Boer and others"
	thanks: "Dustin Sallings for the decoding routines."
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

	unescape_string (a_string: STRING): STRING is
			-- Replace the URI hexadecimal escape sequences in `a_string' 
			-- with the corresponding characters.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
			c: CHARACTER
			d: STRING
		do
			Result := clone (a_string)
			from
				i := 1
			until
				i > Result.count
			loop
				c := Result.item (i)
				if c = '+' then
					Result.put (' ', i)
				elseif c = '%%' then
					if Result.count >= i + 2 then
						-- We skip the character if it is not valid
						d := Result.substring (i + 1, i + 2)
						if STRING_.is_hexadecimal (d) then
							Result.put (INTEGER_.to_character (STRING_.hexadecimal_to_integer (d)), i)
							Result.remove (i + 1)
							Result.remove (i + 1)
						end
					end
				end
				i := i + 1
			end
		ensure
			decoded_string_not_void: Result /= Void
			decoded_string_cannot_be_larger: Result.count <= a_string.count
		end

	unescape_utf8 (a_string: STRING): STRING is
			-- Unescape `a_string', and convert UTF8 encoded result to string.
		require
			a_string_not_void: a_string /= Void
		do
			Result := unescape_string (a_string)
			if maximum_character_code_in_string (Result) > 127 and utf8.valid_utf8 (Result) then
				Result := new_unicode_string_from_utf8 (Result)
			end 
		ensure
			decoded_string_not_void: Result /= Void
			decoded_string_cannot_be_larger: Result.count <= a_string.count
		end
		
	escape_string (a_string: STRING): STRING is
			-- Escape reserved characters in `a_string' and return a new
			-- string.
		require
			a_string_not_void: a_string /= Void
			no_high_characters: maximum_character_code_in_string (a_string) < 256
		do
			Result := escape_custom (a_string, Default_unescaped, True)
		ensure
			encoded_string_not_void: Result /= Void
			no_spaces: not Result.has (' ')
			encoded_string_cannot_be_smaller: Result.count >= a_string.count
		end
		
	escape_utf8 (a_string: STRING): STRING is
			-- Escape reserved characters in `a_string' and return a new
			-- string. Characters above 128 are converted to UTF8 
			-- representation before being encoded.
		require
			a_string_not_void: a_string /= Void
		do
			Result := escape_custom (utf8.to_utf8 (a_string), Default_unescaped, True)
		ensure
			encoded_string_not_void: Result /= Void
			no_spaces: not Result.has (' ')
			encoded_string_cannot_be_smaller: Result.count >= a_string.count
		end
		
	escape_custom (a_string: STRING; unescaped_chars: DS_SET [CHARACTER]; escape_space_as_plus: BOOLEAN): STRING is
			-- Escape all characters except those in `unescaped_chars' in 
			-- `a_string' and return a new string.
		require
			a_string_not_void: a_string /= Void
			unescaped_chars_not_void: unescaped_chars /= Void
			no_high_characters: maximum_character_code_in_string (a_string) < 256
		local
			i: INTEGER
			c: CHARACTER
		do
			Result := clone (a_string)
			from
				i := 1
			until
				i > Result.count
			loop
				c := Result.item (i)
				if escape_space_as_plus and c = ' ' then
					Result.put ('+', i)
				elseif unescaped_chars.has (c) then
					-- ok
				else
					Result.put ('%%', i)
					i := i + 1
					STRING_.insert_character (Result, INTEGER_.to_hexadecimal (c.code // 16 \\ 16, True).item (1), i)
					i := i + 1
					STRING_.insert_character (Result, INTEGER_.to_hexadecimal (c.code \\ 16, True).item (1), i)
				end
				i := i + 1
			end
		ensure
			encoded_string_not_void: Result /= Void
			space_as_plus: escape_space_as_plus implies 
					(not Result.has (' ') and (a_string.has (' ') implies Result.has ('+')))
			encoded_string_cannot_be_smaller: Result.count >= a_string.count
		end
		
feature -- Character sets

	maximum_character_code_in_string (a_string: STRING): INTEGER is
			-- Maximum character code used in string
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > a_string.count
			loop
				if a_string.item_code (i) > Result then
					Result := a_string.item_code (i)
				end
				i := i + 1
			end
		ensure
			positive_result: Result >= 0
			empty_zero: a_string.is_empty implies Result = 0
		end
		
	new_character_set (some_characters: STRING): DS_HASH_SET [CHARACTER] is
			-- Create set of characters for use with `escape_custom'.
		require
			some_characters_not_void: some_characters /= Void
			--occurrences: for all c in some_characters: some_characters.occurrences (c) = 1
		local
			i: INTEGER
		do
			create Result.make_default
			from
				i := 1
			until
				i > some_characters.count
			loop
				Result.force (some_characters.item (i))
				i := i + 1
			end
		ensure
			result_not_void: Result /= Void
			count: some_characters.count = Result.count
		end
		
	Default_unescaped: DS_HASH_SET [CHARACTER] is
			-- Default character set not to escape
		once
			Result := new_character_set (STRING_.concat (
				STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters),
				STRING_.concat (Rfc_digit_characters, Rfc_mark_characters)))
		end
	
	Rfc_lowalpha_characters: STRING is "abcdefghijklmnopqrstuvwxyz"
			-- RFC 2396 'lowalpha' characters
			
	Rfc_upalpha_characters: STRING is "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			-- RFC 2396 'lowalpha' characters
	
	Rfc_digit_characters: STRING is "0123456789"
			-- RFC 2396 'digit' characters
		
	Rfc_mark_characters: STRING is "-_.!~*%'()"
			-- RFC 2396 'mark' characters
			
	Rfc_reserved_characters: STRING is ";/?:@&=+$,"
			-- RFC 2396 'reserved' characters

	Rfc_extra_reserved_characters: STRING is "[]"
			-- RFC 2732 addition to 'reserved' characters
			
feature -- Valid characters

	has_excluded_characters (s: STRING): BOOLEAN is
			-- Does `s' contain excluded characters?
			-- Note that the escape character '%' is not considered
			-- excluded.
		local
			i: INTEGER
			c: CHARACTER
		do
			if s /= Void then
				from
					i := 1
				until
					Result or else
					i > s.count
				loop
					c := s.item (i)
					inspect
						c
					when '%/00/'..'%/31/' then
						-- control characters.
						Result := True
					when ' ', '%/128/'..'%/255/' then
						-- space and non us-ascii characters.
						Result := True
					when '<', '>', '"' then
						-- delimiters, we  allow %, else I can't create
						-- URIs with encoded data.
						Result := True
					when '{', '}', '|', '\', '^', '`' then
						-- unwise, can be modified by gateways and transport
						-- agents.
						Result := True
					else
						-- ok
					end
					i := i + 1
				end
			end
		end

	is_valid_scheme (a_scheme: STRING): BOOLEAN is
			-- Is `a_scheme' a valid scheme?
		local
			i: INTEGER
			c: CHARACTER
		do
			Result := a_scheme /= Void
			if Result then
				from
					i := 1
				until
					not Result or else
					i > a_scheme.count
				loop
					c := a_scheme.item (i)
					inspect c
					when 'A'..'Z','a'..'z' then
						-- ok
					when '0'..'9', '+', '-', '.' then
						Result := i > 1
					else
						Result := False
					end
					i := i + 1
				end
			end
		end

end
