indexing

	description:

		"Handler for character references/ entities"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XF_CHARACTER_ENTITY

inherit

	ANY

	XF_UTF8_PRIVATE_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Creation

	make is
			-- Initialise.
		do
		end

feature -- Setting

	from_decimal (a_string: STRING) is
			-- Set entity from decimal representation.
		require
			not_void: a_string /= Void
			decimal: STRING_.is_integer (a_string)
		local
			i, nb: INTEGER
		do
				-- TODO: There is a bug in VE 4.0 (build 4001).
				-- STRING.is_integer (the precondition of STRING.to_integer)
				-- returns false when the number of characters in `a_string'
				-- is greater than PLATFORM.Maximum_integer.out.count. So
				-- "00000000000000000000000000000000065" is not considered
				-- as an integer even though it is valid according to ELKS 2001.
				-- Workaround: strip the leading zeros. (ericb)
			check is_integer: a_string.count > 0 end
			nb := a_string.count
			if a_string.item (1) /= '0' or else nb = 1 then
				code := a_string.to_integer
			else
				from
					i := 1
				until
					i > nb or else
					a_string.item (i) /= '0'
				loop
					i := i + 1
				end
				if i > nb then
					code := 0
				else
					code := a_string.substring (i, nb).to_integer
				end
			end
		end

	from_hexadecimal (a_string: STRING) is
			-- Set entity from hexadecimal representation.
		require
			not_void: a_string /= Void
			hexadecimal: STRING_.is_hexadecimal (a_string)
		do
			code := STRING_.hexadecimal_to_integer (a_string)
		end

	from_code (a_code: INTEGER) is
			-- From integer code.
		require
			positive: a_code >= 0
		do
			code := a_code
		end

feature -- Access

	code: INTEGER
			-- Character code for entity.

	is_valid: BOOLEAN is
			-- Is this entity representing a valid XML character?
		do
			-- non conforming: excluded >32 unicode character
			Result := (code = 9) or -- tab
				(code = 10) or (code = 13) or -- cr/lf
				(code >= 32 and 
					(code /= 65279) and -- #xFEFF
					(code /= 65535) -- #xFFFF
				)
		end

	as_character: CHARACTER is
			-- Character represented by entity.
		require
			is_valid: is_valid
		do
			-- problem: if CHARACTER is too small...
			Result := INTEGER_.to_character (code)
		ensure
			code: Result.code = code
		end

	as_string: STRING is
			-- UTF-8 String from character code.
		require
			valid: is_valid
		do
			Result := single_string (code)
		ensure
			not_void: Result /= Void
			--done: utf8_decode (Result).count = 1
			--code: utf8_string (Result).first.code = code
		end

invariant

	code_positive: code >= 0

end
