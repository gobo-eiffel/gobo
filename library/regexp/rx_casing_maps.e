indexing

	description:

		"Class that do a fast lowercase/flipcase of a character"

	library:		"Gobo Eiffel Regexp Library"
	author:		"Harald Erdbrügger <he@he-me.de>"
	copyright:	"Copyright (c) 2002, Harald Erdbrügger and others"
	license:		"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:			"$Date$"
	revision:	"$Revision$"


class

	RX_CASING_MAPS


inherit

	KL_INTEGER_ROUTINES

	RX_CONSTANTS


creation

	make,
	clear


feature -- Creation / initialisation

	make (a_upper_characters, a_lower_characters: STRING) is
			-- each character in a_upper_characters have a corresponding
			-- character in a_lower_characters
		do
			clear
			add (a_upper_characters, a_lower_characters)
		end

	clear is
		local
			i, u: INTEGER
		do
			if lower_table = Void then
				create lower_table.make (0, Total_eight_bit_characters - 1)
			end
			if flip_table = Void then
				create flip_table.make (0, Total_eight_bit_characters - 1)
			end
			u := lower_table.upper
			from i := lower_table.lower until i > u loop
				lower_table.put (to_character (i), i)
				flip_table.put (to_character (i), i)
				i := i + 1
			end
		end


feature -- Query

	to_lower (a_ch: CHARACTER): CHARACTER is
		do
			Result := lower_table.item (a_ch.code)
		end

	to_upper (a_ch: CHARACTER): CHARACTER is
			-- not optimized (without own table)
			-- the regular expression compiler needs only to lower ;-)
		local
			lc: CHARACTER
		do
			lc := to_lower (a_ch)
			Result := flip_table.item (a_ch.code)
		end

	flip_case (a_ch: CHARACTER): CHARACTER is
		do
			Result := flip_table.item (a_ch.code)
		end


feature -- Command

	add (a_upper_characters, a_lower_characters: STRING) is
		require
			valid_lengths: a_upper_characters.count = a_lower_characters.count
		local
			i: INTEGER
		do
			from i := a_upper_characters.count until i < 1 loop
				lower_table.put (a_lower_characters.item(i), a_upper_characters.item(i).code)
				flip_table.put (a_lower_characters.item(i), a_upper_characters.item(i).code)
				flip_table.put (a_upper_characters.item(i), a_lower_characters.item(i).code)
				i := i - 1
			end
		end


feature {NONE} -- Implementation

	lower_table: ARRAY [CHARACTER]

	flip_table: ARRAY [CHARACTER]


invariant

	have_lower_table: lower_table /= Void
	have_flip_table: flip_table /= Void

end
