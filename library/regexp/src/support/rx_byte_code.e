﻿note

	description:

		"Byte codes"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"

class RX_BYTE_CODE

inherit

	ANY
			-- Export features of ANY.

	KL_IMPORTED_SPECIAL_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (nb: INTEGER)
			-- Create a new byte code with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			count := 0
			capacity := nb
			byte_code := SPECIAL_NATURAL_32_.make_filled (0, nb)
			create character_sets.make (50)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Access

	opcode_item (i: INTEGER): NATURAL_32
			-- Code at position `i'
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
		do
			Result := byte_code.item (i)
		ensure
			opcode_positive: Result >= 0
		end

	character_item (i: INTEGER): NATURAL_32
			-- Character code at position `i'
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
		do
			Result := byte_code.item (i)
		ensure
			character_code_positive: Result >= 0
		end

	integer_item (i: INTEGER): NATURAL_32
			-- Integer item at position `i'
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
		do
			Result := byte_code.item (i)
		ensure
			integer_positive: Result >= 0
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is current byte code empty?
		do
			Result := (count = 0 and character_sets.count = 0)
		ensure
			byte_code_empty: Result implies count = 0
			character_sets_empty: Result implies character_sets.count = 0
		end

	character_set_has (a_set: INTEGER; a_code: NATURAL_32): BOOLEAN
			-- Is character with code `a_code' included in the character set `a_set'?
		require
			valid_set: valid_character_set (a_set)
			a_cod_positive: a_code >= 0
		do
			Result := character_sets.item (a_set).has (a_code)
		end

	valid_character_set (a_set: INTEGER): BOOLEAN
			-- Is `a_set' a valid character set?
		do
			Result := a_set >= 1 and a_set <= character_sets.count
		ensure
			definition: Result = (a_set >= 1 and a_set <= character_sets.count)
		end

feature -- Measurement

	count: INTEGER
			-- Number of bytes in `byte_code'

	capacity: INTEGER
			-- Maximum number of bytes in `byte_code'

feature -- Setting

	set_count (a_count: INTEGER)
			-- Set `count' to `a_count'.
		require
			a_count_large_enough: a_count >= 0
			a_count_small_enough: a_count <= capacity
		do
			count := a_count
		ensure
			count_set: count = a_count
		end

feature -- Element Change

	put_opcode (a_op: NATURAL_32; i: INTEGER)
			-- Put `a_op' at position `i'.
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
			a_op_positive: a_op >= 0
		do
			byte_code.put (a_op, i)
		ensure
			code_set: opcode_item (i) = a_op
		end

	put_character (a_code: NATURAL_32; i: INTEGER)
			-- Put character with code `a_code' at position `i'.
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
			a_code_positive: a_code >= 0
		do
			byte_code.put (a_code, i)
		ensure
			character_set: character_item (i) = a_code
		end

	put_integer (v: NATURAL_32; i: INTEGER)
			-- Put `v' at position `i'.
		require
			i_large_enough: i >= 0
			i_small_enough: i < count
			v_positive: v >= 0
		do
			byte_code.put (v, i)
		ensure
			integer_set: integer_item (i) = v
		end

	append_opcode (a_op: NATURAL_32)
			-- Append `a_op' to current byte code.
		require
			a_op_positive: a_op >= 0
		local
			i, nb: INTEGER
		do
			i := count
			nb := i + 1
			resize_byte_code (nb)
			count := nb
			put_opcode (a_op, i)
		ensure
			count_set: count = old count + 1
			appended: opcode_item (old count) = a_op
		end

	append_character (a_code: NATURAL_32)
			-- Append character with code `a_code' to current byte code.
		require
			a_code_positive: a_code >= 0
		local
			i, nb: INTEGER
		do
			i := count
			nb := i + 1
			resize_byte_code (nb)
			count := nb
			put_character (a_code, i)
		ensure
			count_set: count = old count + 1
			appended: character_item (old count) = a_code
		end

	append_integer (v: NATURAL_32)
			-- Append `v' to current byte code.
		require
			v_positive: v >= 0
		local
			i, nb: INTEGER
		do
			i := count
			nb := i + 1
			resize_byte_code (nb)
			count := nb
			put_integer (v, i)
		ensure
			count_set: count = old count + 1
			appended: integer_item (old count) = v
		end

	append_character_set (a_set: RX_CHARACTER_SET)
			-- Append `a_set' to current byte code.
		require
			a_set_not_void: a_set /= Void
		do
			character_sets.force_last (a_set)
			append_integer (character_sets.count.to_natural_32)
		ensure
			count_set: count = old count + 1
			valid_character_set: valid_character_set (integer_item (old count).to_integer_32)
		end

	append_subcopy (a_position: INTEGER; nb: INTEGER)
			-- Append to current byte code `nb' slots of
			-- itself at and after position `a_position'.
		require
			a_position_positive: a_position >= 0
			nb_positive: nb >= 0
			nb_small_enough: a_position + nb <= count
		local
			i, j, k: INTEGER
		do
			i := count
			k := i + nb
			resize_byte_code (k)
			count := k
			j := a_position
			from
			until
				i >= k
			loop
				byte_code.put (byte_code.item (j), i)
				j := j + 1
				i := i + 1
			end
		ensure
			count_set: count = old count + nb
		end

	move_right (i, offset: INTEGER)
			-- Move slots at and after `i' position
			-- by `offset' positions to the right.
		require
			valid_index: 1 <= i and i <= count + 1
			positive_offset: offset >= 0
		local
			j: INTEGER
			new_count: INTEGER
		do
			new_count := count + offset
			resize_byte_code (new_count)
			from
				j := count - 1
				count := new_count
			until
				j < i
			loop
				byte_code.put (byte_code.item (j), j + offset)
				j := j - 1
			end
		ensure
			count_set: count = old count + offset
		end

feature -- Removal

	wipe_out
			-- Remove all bytes.
		do
			count := 0
			character_sets.wipe_out
		ensure
			is_empty: is_empty
		end

feature {NONE} -- Resizing

	resize_byte_code (nb: INTEGER)
			-- Resize `byte_code' to accommodate at least `nb' bytes.
		local
			new_capacity: INTEGER
		do
			if capacity < nb then
				new_capacity := 2 * nb
				byte_code := SPECIAL_NATURAL_32_.aliased_resized_area_with_default (byte_code, 0, new_capacity)
				capacity := new_capacity
			end
		ensure
			capacity_set: capacity >= nb
		end

feature {NONE} -- Implementation

	byte_code: SPECIAL [NATURAL_32]
			-- Byte codes

	character_sets: DS_ARRAYED_LIST [RX_CHARACTER_SET]
			-- Character sets

invariant

	byte_code_not_void: byte_code /= Void
	count_positive: count >= 0
	count_small_enough: count <= capacity
	character_sets_not_void: character_sets /= Void
	no_void_character_set: not character_sets.has_void

end
