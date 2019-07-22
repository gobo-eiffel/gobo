note

	description:

		"Classes of symbols"

	storable_version: "20190721"
	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_SYMBOL_CLASS

create

	make_empty

feature {NONE} -- Initialization

	make_empty
			-- Create an empty symbol class.
		do
			is_empty := True
		ensure
			is_empty: is_empty
			not_negated: not is_negated
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is symbol class empty?
			-- Do not take into account negated status.

	is_negated: BOOLEAN
			-- Is character set negated?

	has (a_symbol: INTEGER): BOOLEAN
			-- Is `a_symbol' included in symbol class?
			-- Take into account the negated status.
		require
			a_symbol_valid: a_symbol >= 1 and a_symbol <= {CHARACTER_8}.max_value + 1
		local
			l_symbol: INTEGER
		do
			l_symbol := a_symbol \\ ({CHARACTER_8}.max_value + 1)
			if is_empty then
				Result := is_negated
			elseif l_symbol < 64 then
				Result := (first_set & masks.item (l_symbol) /= 0) /= is_negated
			elseif l_symbol < 128 then
				Result := (second_set & masks.item (l_symbol \\ 64) /= 0) /= is_negated
			elseif l_symbol < 192 then
				Result := (third_set & masks.item (l_symbol \\ 64) /= 0) /= is_negated
			else
				Result := (fourth_set & masks.item (l_symbol \\ 64) /= 0) /= is_negated
			end
		ensure
			definition: Result = (added (a_symbol) /= is_negated)
		end

	added (a_symbol: INTEGER): BOOLEAN
			-- Has `a_symbol' been added to the symbol class?
			-- Do not take into account the negated status.
		require
			a_symbol_valid: a_symbol >= 1 and a_symbol <= {CHARACTER_8}.max_value + 1
		local
			l_symbol: INTEGER
		do
			l_symbol := a_symbol \\ ({CHARACTER_8}.max_value + 1)
			if is_empty then
				Result := False
			elseif l_symbol < 64 then
				Result := first_set & masks.item (l_symbol) /= 0
			elseif l_symbol < 128 then
				Result := second_set & masks.item (l_symbol \\ 64) /= 0
			elseif l_symbol < 192 then
				Result := third_set & masks.item (l_symbol \\ 64) /= 0
			else
				Result := fourth_set & masks.item (l_symbol \\ 64) /= 0
			end
		end

	same_symbol_class (a_other: LX_SYMBOL_CLASS): BOOLEAN
			-- Are `a_other' and `Current' considered to be the same symbol class?
		require
			a_other_not_void: a_other /= Void
		do
			if is_negated /= a_other.is_negated then
				Result := False
			else
				Result := first_set = a_other.first_set and second_set = a_other.second_set and third_set = a_other.third_set and fourth_set = a_other.fourth_set
			end
		end

feature -- Status setting

	set_negated (b: BOOLEAN)
			-- Set `is_negated' to `b'.
		do
			is_negated := b
		ensure
			negated_set: is_negated = b
		end

feature -- Element Change

	add_character (a_symbol: INTEGER)
			-- Add `a_symbol' to symbol class.
			-- Do not take into account the negated status.
		require
			a_symbol_valid: 1 <= a_symbol and a_symbol <= {CHARACTER_8}.max_value + 1
		local
			l_symbol: INTEGER
		do
			l_symbol := a_symbol \\ ({CHARACTER_8}.max_value + 1)
			if l_symbol < 64 then
				first_set := first_set | masks.item (l_symbol)
			elseif l_symbol < 128 then
				second_set := second_set | masks.item (l_symbol \\ 64)
			elseif l_symbol < 192 then
				third_set := third_set | masks.item (l_symbol \\ 64)
			else
				fourth_set := fourth_set | masks.item (l_symbol \\ 64)
			end
			is_empty := False
		ensure
			not_empty: not is_empty
			added: added (a_symbol)
		end

	add_set (other: like Current)
			-- Add symbols of `other' to current symbol class.
			-- Do not take into account negated status of `Current' and `other'.
		require
			other_not_void: other /= Void
		do
			first_set := first_set | other.first_set
			second_set := second_set | other.second_set
			third_set := third_set | other.third_set
			fourth_set := fourth_set | other.fourth_set
			is_empty := is_empty and other.is_empty
		end

	add_negated_set (other: like Current)
			-- Add symbols which are not in `other' to current symbol class.
			-- Do not take into account negated status of `Current' and `other'.
		require
			other_not_void: other /= Void
		do
			first_set := first_set | other.first_set.bit_not
			second_set := second_set | other.second_set.bit_not
			third_set := third_set | other.third_set.bit_not
			fourth_set := fourth_set | other.fourth_set.bit_not
			is_empty := first_set = 0 and second_set = 0 and third_set = 0 and fourth_set = 0
		end

feature -- Removal

	wipe_out
			-- Remove all symbols.
		do
			first_set := 0
			second_set := 0
			third_set := 0
			fourth_set := 0
			is_empty := True
			is_negated := False
		ensure
			is_empty: is_empty
			not_negated: not is_negated
		end

feature -- Convertion

	convert_to_equivalence (classes: LX_EQUIVALENCE_CLASSES)
			-- Convert symbol class to class made of its
			-- symbols' equivalence classes.
		require
			classes_not_void: classes /= Void
			classes_built: classes.built
			valid_symbols: classes.valid_symbol_class (Current)
		local
			l_code: INTEGER
			l_old_first_set: NATURAL_64
			l_old_second_set: NATURAL_64
			l_old_third_set: NATURAL_64
			l_old_fourth_set: NATURAL_64
			l_old_added: BOOLEAN
		do
			l_old_first_set := first_set
			l_old_second_set := second_set
			l_old_third_set := third_set
			l_old_fourth_set := fourth_set
			first_set := 0
			second_set := 0
			third_set := 0
			fourth_set := 0
			is_empty := True
			from
				l_code := {CHARACTER_8}.max_value + 1
				if l_old_first_set & masks.item (0) /= 0 and then classes.is_representative (l_code) then
					add_character (classes.equivalence_class (l_code))
				end
				l_code := 1
			until
				l_code > {CHARACTER_8}.max_value
			loop
				if l_code < 64 then
					l_old_added := l_old_first_set & masks.item (l_code) /= 0
				elseif l_code < 128 then
					l_old_added := l_old_second_set & masks.item (l_code \\ 64) /= 0
				elseif l_code < 192 then
					l_old_added := l_old_third_set & masks.item (l_code \\ 64) /= 0
				else
					l_old_added := l_old_fourth_set & masks.item (l_code \\ 64) /= 0
				end
				if l_old_added and then classes.is_representative (l_code) then
					add_character (classes.equivalence_class (l_code))
				end
				l_code := l_code + 1
			end
		end

feature {LX_SYMBOL_CLASS} -- Implementation

	first_set: NATURAL_64
			-- First set of bits

	second_set: NATURAL_64
			-- Second set of bits

	third_set: NATURAL_64
			-- Third set of bits

	fourth_set: NATURAL_64
			-- Fourth set of bits

	masks: SPECIAL [NATURAL_64]
			-- Bit masks
		local
			i: INTEGER
			v: NATURAL_64
		once
			create Result.make_filled (0, 64)
			from
				v := 1
				Result.put (v, 0)
				i := 1
			until
				i = 64
			loop
				v := v |<< 1
				Result.put (v, i)
				i := i + 1
			end
		ensure
			masks_not_void: Result /= Void
			count_64: Result.count = 64
		end

end
