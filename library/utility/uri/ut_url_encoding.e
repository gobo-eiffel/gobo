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

feature -- Escape/unescape data characters

	unescape_string (a_string: STRING): STRING is
			-- Replace the URI hexadecimal escape sequences in `in' with their characters.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
			c: CHARACTER
			d: STRING
		do
			create Result.make_from_string (a_string)
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

	escape_string (a_string: STRING): STRING is
			-- Escape reserved characters in `in' and return a new
			-- string.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER
			c: CHARACTER
		do
			create Result.make_from_string (a_string)
			from
				i := 1
			until
				i > Result.count
			loop
				c := Result.item (i)
				inspect c
				when ' ' then
					Result.put ('+', i)
				when '0'..'9','A'..'Z','a'..'z' then
					-- ok
				when '-','_','.','!','~','*','%'', '(' ,')' then
					-- ok
				else
					Result.put ('%%', i)
					Result.insert_string (to_hexadecimal_2 (c.code), i + 1)
					i := i + 2
				end
				i := i + 1
			end
		ensure
			encoded_string_not_void: Result /= Void
			no_spaces: not Result.has (' ')
			encoded_string_cannot_be_smaller: Result.count >= a_string.count
		end

feature {NONE} -- Implementation

	to_hexadecimal_2 (a_value: INTEGER): STRING is
			-- 2 digit hex version of integer.
		require
			max_value: a_value < 256
			positive_value: a_value >= 0
		do
			Result := INTEGER_.to_hexadecimal (a_value, False)
			if Result.count = 1 then
				STRING_.insert_character (Result, '0', 1)
			end
		ensure
			result_not_void: Result /= Void
			two_digits: Result.count = 2
		end

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
					inspect c
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
			-- Is `scheme' a valid scheme?
		local
			i: INTEGER
			c: CHARACTER
		do
			Result := a_scheme /= Void
			if Result then
				from
					Result := True
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
