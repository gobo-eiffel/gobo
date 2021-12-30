note

	description:

		"Character sets"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2001-2021, Harald Erdbruegger and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_CHARACTER_SET

create

	make,
	make_empty

feature {NONE} -- Initialization

	make_empty
			-- Create an empty character set.
		do
			is_empty := True
		ensure
			is_empty: is_empty
			not_negated: not is_negated
		end

	make (a_string: READABLE_STRING_GENERAL)
			-- Create new character set and add characters
			-- included in `a_string'.
		require
			a_string_not_void: a_string /= Void
			a_string_valid: across 1 |..| a_string.count as c all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (c.item)) end
		do
			make_empty
			add_string (a_string)
		ensure
			not_empty: a_string.count > 0 implies not is_empty
			not_negated: not is_negated
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is character set empty?
			-- Do not take into account negated status.

	is_negated: BOOLEAN
			-- Is character set negated?

	has (a_code: NATURAL_32): BOOLEAN
			-- Is character with code `a_code' included in character set?
			-- Take into account the negated status.
		local
			l_set_id: NATURAL_32
		do
			if is_empty then
				Result := is_negated and then {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
			elseif a_code < 64 then
				Result := (first_set & masks.item (a_code.to_integer_32) /= 0) /= is_negated
			elseif a_code < 128 then
				Result := (second_set & masks.item ((a_code \\ 64).to_integer_32) /= 0) /= is_negated
			elseif a_code < 192 then
				Result := (third_set & masks.item ((a_code \\ 64).to_integer_32) /= 0) /= is_negated
			elseif a_code < 256 then
				Result := (fourth_set & masks.item ((a_code \\ 64).to_integer_32) /= 0) /= is_negated
			else
				l_set_id := a_code // 64
				if attached other_sets as l_other_sets and then l_other_sets.has (l_set_id) then
					Result := ((l_other_sets.item (l_set_id) & masks.item ((a_code \\ 64).to_integer_32)) /= 0) /= is_negated
				else
					 Result := (is_reverted /= is_negated) and then {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
				end
			end
		ensure
			valid_code: Result implies {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
			not_valid_code: not {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code) implies not Result
			definition: {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code) implies Result = (added (a_code) /= is_negated)
		end

	added (a_code: NATURAL_32): BOOLEAN
			-- Has character with code `a_code' been added to the character set?
			-- Do not take into account the negated status.
		local
			l_set_id: NATURAL_32
		do
			if is_empty then
				Result := False
			elseif a_code < 64 then
				Result := first_set & masks.item (a_code.to_integer_32) /= 0
			elseif a_code < 128 then
				Result := second_set & masks.item ((a_code \\ 64).to_integer_32) /= 0
			elseif a_code < 192 then
				Result := third_set & masks.item ((a_code \\ 64).to_integer_32) /= 0
			elseif a_code < 256 then
				Result := fourth_set & masks.item ((a_code \\ 64).to_integer_32) /= 0
			else
				l_set_id := a_code // 64
				if attached other_sets as l_other_sets and then l_other_sets.has (l_set_id) then
					Result := (l_other_sets.item (l_set_id) & masks.item ((a_code \\ 64).to_integer_32)) /= 0
				else
					 Result := is_reverted and then {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
				end
			end
		ensure
			valid_code: Result implies {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
			not_valid_code: not {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code) implies not Result
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

	add_string (a_string: READABLE_STRING_GENERAL)
			-- Add all characters of `a_string' to character set.
			-- Do not take into account the negated status.
		require
			a_string_not_void: a_string /= Void
			a_string_valid: across 1 |..| a_string.count as c all {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_string.code (c.item)) end
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			from i := 1 until i > nb loop
				add_character (a_string.code (i))
				i := i + 1
			end
		ensure
			not_empty: a_string.count > 0 implies not is_empty
			added: across 1 |..| a_string.count as c all added (a_string.code (c.item)) end
		end

	add_character (a_code: NATURAL_32)
			-- Add character with code `a_code' to character set.
			-- Do not take into account the negated status.
		require
			a_code_valid: {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (a_code)
		local
			l_other_sets: like other_sets
			l_set_id: NATURAL_32
		do
			if a_code < 64 then
				first_set := first_set | masks.item (a_code.to_integer_32)
			elseif a_code < 128 then
				second_set := second_set | masks.item ((a_code \\ 64).to_integer_32)
			elseif a_code < 192 then
				third_set := third_set | masks.item ((a_code \\ 64).to_integer_32)
			elseif a_code < 256 then
				fourth_set := fourth_set | masks.item ((a_code \\ 64).to_integer_32)
			else
				l_set_id := a_code // 64
				l_other_sets := other_sets
				if l_other_sets = Void then
					if not is_reverted then
						create l_other_sets.make_map (50)
						other_sets := l_other_sets
					end
				elseif is_reverted and then not l_other_sets.has (l_set_id) then
					l_other_sets := Void
				end
				if l_other_sets /= Void then
					l_other_sets.force (l_other_sets.value (l_set_id) | masks.item ((a_code \\ 64).to_integer_32), l_set_id)
				end
			end
			is_empty := False
		ensure
			not_empty: not is_empty
			added: added (a_code)
		end

	add_set (other: like Current)
			-- Add characters of `other' to current character set.
			-- Do not take into account negated status of `Current' and `other'.
		require
			other_not_void: other /= Void
		local
			l_current_other_sets: like other_sets
			l_reverted, l_other_reverted: BOOLEAN
		do
			first_set := first_set | other.first_set
			second_set := second_set | other.second_set
			third_set := third_set | other.third_set
			fourth_set := fourth_set | other.fourth_set
			if attached other.other_sets as l_other_other_sets and then not l_other_other_sets.is_empty then
				l_reverted := is_reverted
				l_other_reverted := other.is_reverted
				l_current_other_sets := other_sets
				if l_current_other_sets = Void then
					if not l_reverted then
						other_sets := l_other_other_sets.twin
						is_reverted := l_other_reverted
					end
				elseif l_current_other_sets.is_empty then
					if not l_reverted then
						l_current_other_sets.copy (l_other_other_sets)
						is_reverted := l_other_reverted
					end
				else
					if l_other_reverted then
							-- All sets not in `l_other_other_sets' are considered full of ones.
						from
							l_current_other_sets.start
						until
							l_current_other_sets.after
						loop
							if not l_other_other_sets.has (l_current_other_sets.key_for_iteration) then
								l_current_other_sets.remove (l_current_other_sets.key_for_iteration)
							else
								l_current_other_sets.forth
							end
						end
					end
					across l_other_other_sets as i_other_other_set loop
						l_current_other_sets.search (@i_other_other_set.key)
						if l_current_other_sets.found then
							l_current_other_sets.replace_found_item (l_current_other_sets.found_item | i_other_other_set)
						elseif not l_reverted then
							l_current_other_sets.force_new (i_other_other_set, @i_other_other_set.key)
						end
					end
					is_reverted := l_reverted or l_other_reverted
				end
			elseif other.is_reverted then
				is_reverted := True
				if attached other_sets as l_other_sets then
					l_other_sets.wipe_out
				end
			end
			is_empty := is_empty and other.is_empty
		end

	add_negated_set (other: like Current)
			-- Add characters which are not in `other' to current character set.
			-- Do not take into account negated status of `Current' and `other'.
		require
			other_not_void: other /= Void
		local
			l_current_other_sets: like other_sets
			l_reverted, l_other_reverted: BOOLEAN
		do
			first_set := first_set | other.first_set.bit_not
			second_set := second_set | other.second_set.bit_not
			third_set := third_set | other.third_set.bit_not
			fourth_set := fourth_set | other.fourth_set.bit_not
			if attached other.other_sets as l_other_other_sets and then not l_other_other_sets.is_empty then
				l_reverted := is_reverted
				l_other_reverted := not other.is_reverted
				l_current_other_sets := other_sets
				if l_current_other_sets = Void then
					if not l_reverted then
						l_current_other_sets := l_other_other_sets.twin
						from
							l_current_other_sets.start
						until
							l_current_other_sets.after
						loop
							l_current_other_sets.replace (l_current_other_sets.item_for_iteration.bit_not, l_current_other_sets.key_for_iteration)
							l_current_other_sets.forth
						end
						other_sets := l_current_other_sets
						is_reverted := l_other_reverted
					end
				elseif l_current_other_sets.is_empty then
					if not l_reverted then
						l_current_other_sets.copy (l_other_other_sets)
						from
							l_current_other_sets.start
						until
							l_current_other_sets.after
						loop
							l_current_other_sets.replace (l_current_other_sets.item_for_iteration.bit_not, l_current_other_sets.key_for_iteration)
							l_current_other_sets.forth
						end
						is_reverted := l_other_reverted
					end
				else
					if l_other_reverted then
							-- All sets not in `l_other_other_sets' (after having
							-- been negated) are considered full of ones.
						from
							l_current_other_sets.start
						until
							l_current_other_sets.after
						loop
							if not l_other_other_sets.has (l_current_other_sets.key_for_iteration) then
								l_current_other_sets.remove (l_current_other_sets.key_for_iteration)
							else
								l_current_other_sets.forth
							end
						end
					end
					across l_other_other_sets as i_other_other_set loop
						l_current_other_sets.search (@i_other_other_set.key)
						if l_current_other_sets.found then
							l_current_other_sets.replace_found_item (l_current_other_sets.found_item | i_other_other_set.bit_not)
						elseif not l_reverted then
							l_current_other_sets.force_new (i_other_other_set.bit_not, @i_other_other_set.key)
						end
					end
					is_reverted := l_reverted or l_other_reverted
				end
			elseif not other.is_reverted then
				is_reverted := True
				if attached other_sets as l_other_sets then
					l_other_sets.wipe_out
				end
			end
			if is_empty then
				if first_set /= 0 or second_set /= 0 or third_set /= 0 or fourth_set /= 0 then
					is_empty := False
				elseif attached other_sets as l_other_sets and then not l_other_sets.is_empty then
					if not is_reverted or l_other_sets.count = 17_372 then
						is_empty := across l_other_sets as l_other_sets_cursor all l_other_sets_cursor.item = 0 end
					else
						is_empty := False
					end
				else
					is_empty := not is_reverted
				end
			end
		end

feature -- Removal

	wipe_out
			-- Remove all characters.
		do
			first_set := 0
			second_set := 0
			third_set := 0
			fourth_set := 0
			if attached other_sets as l_other_sets then
				l_other_sets.wipe_out
			end
			is_empty := True
			is_negated := False
			is_reverted := False
		ensure
			is_empty: is_empty
			not_negated: not is_negated
		end

feature {RX_CHARACTER_SET} -- Implementation

	first_set: NATURAL_64
			-- First set of bits

	second_set: NATURAL_64
			-- Second set of bits

	third_set: NATURAL_64
			-- Third set of bits

	fourth_set: NATURAL_64
			-- Fourth set of bits

	other_sets: detachable DS_HASH_TABLE [NATURAL_64, NATURAL_32]
			-- Other sets of bits.
			-- Valid keys as multiples of 64 in the ranges [4-863] and [896-17,407].
			-- That's a total of 17,372 valid keys.
			-- The keys in the range [864-895] are for surrogates.
			-- Sets for valid keys not in this table are considered to be full
			-- of zeros, unless `is_reverted' is True in which case they are
			-- considered to be full of ones.

	is_reverted: BOOLEAN
			-- Are sets not appearing in `other_sets' considered full of ones?
			-- Otherwise they are considered full of zeros.

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
