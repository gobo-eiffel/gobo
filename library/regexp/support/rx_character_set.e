note

	description:

		"Character sets"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2002, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_CHARACTER_SET

inherit

	ANY
			-- Export features of ANY.

	KL_IMPORTED_SPECIAL_ROUTINES

create

	make,
	make_empty

feature {ANY} -- Initialization

	make_empty
			-- Create an empty character set.
		do
			set := SPECIAL_BOOLEAN_.make (256)
		ensure
			is_empty: is_empty
		end

	make (a_string: STRING)
			-- Create new character set and add characters
			-- included in `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			make_empty
			add_string (a_string)
		ensure
			not_empty: a_string.count > 0 implies not is_empty
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is character set empty?
		local
			i: INTEGER
		do
			Result := True
			from
				i := 0
			until
				i > 255
			loop
				if set.item (i) then
					Result := False
						-- Jump out of the loop.
					i := 256
				else
					i := i + 1
				end
			end
		end

	has (a_code: INTEGER): BOOLEAN
			-- Is character with code `a_code' included in character set?
		require
			a_code_positive: a_code >= 0
		do
			if a_code < 256 then
				Result := set.item (a_code)
			end
		end

feature -- Element Change

	add_string (a_string: STRING)
			-- Add all characters of `a_string' to character set.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from
				i := 1
			until
				i > nb
			loop
				add_character (a_string.item_code (i))
				i := i + 1
			end
		ensure
			not_empty: a_string.count > 0 implies not is_empty
		end

	add_character (a_code: INTEGER)
			-- Add character with code `a_code' to character set.
		require
			a_code_positive: a_code >= 0
		local
			c: INTEGER
		do
				-- TODO: handler unicode.
			c := a_code \\ 256
			set.put (True, c)
		ensure
			not_empty: not is_empty
		end

	add_set (other: like Current)
			-- Add characters of `other' to current character set.
		require
			other_not_void: other /= Void
		local
			i: INTEGER
			other_set: like set
		do
			other_set := other.set
			from
				i := 0
			until
				i > 255
			loop
				if other_set.item (i) then
					set.put (True, i)
				end
				i := i + 1
			end
		end

	add_negated_set (other: like Current)
			-- Add characters which are not in `other' to current character set.
		require
			other_not_void: other /= Void
		local
			i: INTEGER
			other_set: like set
		do
			other_set := other.set
			from
				i := 0
			until
				i > 255
			loop
				if not other_set.item (i) then
					set.put (True, i)
				end
				i := i + 1
			end
		end

feature -- Removal

	wipe_out
			-- Remove all characters.
		local
			i: INTEGER
		do
			from
				i := 0
			until
				i > 255
			loop
				set.put (False, i)
				i := i + 1
			end
		ensure
			is_empty: is_empty
		end

feature {RX_CHARACTER_SET, RX_BYTE_CODE} -- Implementation

	set: SPECIAL [BOOLEAN]
			-- Mapping character-code -> true/false

invariant

	set_not_void: set /= Void
	set_large_enough: set.count = 256

end
