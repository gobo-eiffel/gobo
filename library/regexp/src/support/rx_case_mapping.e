note

	description:

		"Mappings between upper- and lower-case characters"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2019, Harald Erdbruegger and others"
	license: "MIT License"

class RX_CASE_MAPPING

inherit

	ANY
			-- Export features of ANY.

	KL_IMPORTED_SPECIAL_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

create

	make,
	make_default

feature {NONE} -- Initialization

	make_default
			-- Create new mapping between upper- and lower-case characters.
			-- Each character is its own upper- and lower-case version by default.
		do
			lower_table := SPECIAL_NATURAL_32_.make_filled (0, 256)
			flip_table := SPECIAL_NATURAL_32_.make_filled (0, 256)
			clear
		end

	make (an_upper_characters, a_lower_characters: STRING)
			-- Create new mapping between upper- and lower-case characters.
			-- Each character in `an_upper_characters' must have a corresponding
			-- character in `a_lower_characters'.
		require
			upper_characters_not_void: an_upper_characters /= Void
			lower_characters_not_void: a_lower_characters /= Void
			same_count: an_upper_characters.count = a_lower_characters.count
		do
			make_default
			add (an_upper_characters, a_lower_characters)
		end

feature -- Access

	to_lower (a_code: NATURAL_32): NATURAL_32
			-- Code of lower character associated with character of code `a_code'
		require
			a_code_positive: a_code >= 0
		do
			if a_code < 256 then
				Result := lower_table.item (a_code.to_integer_32)
			else
				Result := a_code
			end
		ensure
			to_lower_positive: Result >= 0
		end

	to_upper (a_code: NATURAL_32): NATURAL_32
			-- Code of upper character associated with character of code `a_code'
			-- (Note: not optimized because the the regexp compiler needs only `to_lower'.)
		require
			a_code_positive: a_code >= 0
		local
			a_lower: NATURAL_32
		do
			if a_code < 256 then
				a_lower := lower_table.item (a_code.to_integer_32)
				if a_lower = a_code then
						-- `a_code' is the code of a lower-case character.
					Result := flip_table.item (a_code.to_integer_32)
				else
						-- `a_code' is the code of an upper-case character.
					Result := a_code
				end
			else
				Result := a_code
			end
		ensure
			to_upper_positive: Result >= 0
		end

	flip_case (a_code: NATURAL_32): NATURAL_32
			-- Flip character case of character with code `a_code'
		require
			a_code_positive: a_code >= 0
		do
			if a_code < 256 then
				Result := flip_table.item (a_code.to_integer_32)
			else
				Result := a_code
			end
		ensure
			flip_case_positive: Result >= 0
		end

feature -- Reset

	clear
			-- Reset default mapping: each character is its own
			-- upper- and lower-case version.
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i > 255
			loop
				lower_table.put (i.to_natural_32, i)
				flip_table.put (i.to_natural_32, i)
				i := i + 1
			end
		end

feature -- Element Change

	add (an_upper_characters, a_lower_characters: STRING)
			-- Add mapping between upper- and lower-case characters.
			-- Each character in `an_upper_characters' must have a
			-- corresponding character in `a_lower_characters'.
		require
			upper_characters_not_void: an_upper_characters /= Void
			lower_characters_not_void: a_lower_characters /= Void
			same_count: an_upper_characters.count = a_lower_characters.count
		local
			i, nb: INTEGER
			l, u: CHARACTER
			l_code, u_code: NATURAL_32
		do
			nb := an_upper_characters.count
			from
				i := 1
			until
				i > nb
			loop
				l := a_lower_characters.item (i)
				u := an_upper_characters.item (i)
				l_code := l.natural_32_code
				u_code := u.natural_32_code
				lower_table.put (l_code, u_code.to_integer_32)
				flip_table.put (l_code, u_code.to_integer_32)
				flip_table.put (u_code, l_code.to_integer_32)
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	lower_table: SPECIAL [NATURAL_32]
			-- Lower character codes mapping table

	flip_table: SPECIAL [NATURAL_32]
			-- Flip character case mapping table

invariant

	lower_table_not_void: lower_table /= Void
	lower_table_large_enough: lower_table.count = 256
--	valid_lower_table: forall i in lower_table, 0 <= i and i < 256
	flip_table_not_void: flip_table /= Void
	flip_table_large_enough: flip_table.count = 256
--	valid_flip_table: forall i in flip_table, 0 <= i and i < 256

end
