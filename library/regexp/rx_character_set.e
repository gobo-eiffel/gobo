indexing

	description:

		"Fast (?) bit mapped set of 8 bit characters."

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_CHARACTER_SET


inherit

	PLATFORM

	RX_CONSTANTS


creation

	make,
	make_empty,
	make_full


feature {NONE} -- Initialization

	do_make is
		do
			create set.make (lower, upper)
		end

	make (a_string: STRING) is
		do
			make_empty
			add_string (a_string)
		end

	make_empty is
		do
			do_make
			clear
		end

	make_full is
		do
			do_make
			fill
		end


feature -- Query

	count: INTEGER is 32

	bit_8_item (index: INTEGER): BIT 8 is
			-- considers the character set a bit map if 8 bit values,
			-- returns the `index'-th 8-bit value
		require
			valid_index: index >= lower and index <= upper
		do
			Result := set.item (index)
		end

	is_in (a_ch: CHARACTER): BOOLEAN is
		do
			Result := set.item (a_ch.code // 8).item (a_ch.code \\ 8 + 1)
		end

	lower: INTEGER is 0

	upper: INTEGER is 31


feature -- Command

	add_string (a_string: STRING) is
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i > a_string.count
			loop
				add_character (a_string.item (i))
				i := i + 1
			end
		end

	add_character (a_ch: CHARACTER) is
		local
			i: INTEGER
			b: BIT 8
		do
			i := a_ch.code // 8
			b := set.item (i)
			b.put (True, a_ch.code \\ 8 + 1)
			set.put (b, i)
		ensure
			character_in_set: is_in (a_ch)
		end

	add_set (a_set: like Current; a_invert: BOOLEAN) is
			-- all characters in `a_set' are added to this set.
		require
			sets_have_same_items: lower = a_set.lower and upper = a_set.upper
		local
			s: ARRAY [BIT 8]
			i: INTEGER
		do
			-- The following code relies on internal knowledge of set
			-- data structure
			s := a_set.set
			if a_invert then
				from
					i := lower
				until
					i > upper
				loop
					set.put (set.item(i) or not s.item(i), i)
					i := i + 1
				end
			else
				from
					i := lower
				until
					i > upper
				loop
					set.put (set.item(i) or s.item(i), i)
					i := i + 1
				end
			end
		end

	clear is
			--			local
			--				i: INTEGER
		do
			set.clear_all
			--				from
			--					i := set.lower
			--				until
			--					i > set.upper
			--				loop
			--					set.put (False, i)
			--					i := i + 1
			--				end
		end

	fill is
		local
			i: INTEGER
		do
			from
				i := set.lower
			until
				i > set.upper
			loop
				set.put (11111111B, i)
				i := i + 1
			end
		end



feature {RX_CHARACTER_SET}

	set: ARRAY [BIT 8]


invariant

	set_available: set /= Void
	set_keeps_lower: set.lower = 0
	set_keeps_upper: set.upper = 31
	eight_bit_characters_or_die: Character_bits = 8

end -- class RX_CHARACTER_SET
