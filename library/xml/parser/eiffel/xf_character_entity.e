
indexing
	
	description:
		
		"Handler for character references/ entities"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum Freeware License v1 (see forum.txt)"		
	date: "$Date$"
	revision: "$Revision$"

class XF_CHARACTER_ENTITY

inherit

	ANY
	
	XF_UTF8_PRIVATE_ROUTINES
	
	KL_INTEGER_ROUTINES
		export
			{NONE} all
		end
	
	KL_STRING_ROUTINES
		rename
			make as string_make
		export
			{NONE} all;
			{ANY} is_integer, is_hexadecimal
		end

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
			decimal: is_integer (a_string)
		do
			code := a_string.to_integer
		end

	from_hexadecimal (a_string: STRING) is
			-- Set entity from hexadecimal representation.
		require
			not_void: a_string /= Void
			hexadecimal: is_hexadecimal (a_string)
		do
			code := hexadecimal_to_integer (a_string)
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
			Result := to_character (code)
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
