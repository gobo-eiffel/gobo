note
	description: "Helper routines for encoding conversion."
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	ENCODING_HELPER

feature -- Conversion

	multi_byte_to_pointer (a_string: READABLE_STRING_8): MANAGED_POINTER
			-- Managed pointer of `a_string`.
		require
			a_string_not_void: a_string /= Void
		do
			Result := (create {C_STRING}.make (a_string)).managed_data
		ensure
			instance_free: class
			result_not_void: Result /= Void
		end

	wide_string_to_pointer (a_string: READABLE_STRING_32): MANAGED_POINTER
			-- Managed pointer of `a_string` which is taken as
			-- 16bits string. High 16bits of characters of `a_string` are discarded.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			nb := a_string.count
			create Result.make ((nb + 1) * 2)
			from
				i := 0
			until
				i = nb
			loop
				Result.put_natural_16 (a_string.code (i + 1).to_natural_16, i * 2)
				i := i +  1
			end
			Result.put_natural_16 (0, i * 2)
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	pointer_to_multi_byte (a_multi_string: POINTER; a_count: INTEGER): STRING_8
			-- STRING_8 read from `a_multi_string`.
		require
			a_multi_string_not_default: a_multi_string /= default_pointer
			a_count_non_negative: a_count >= 0
		local
			i: INTEGER
			l_managed_pointer: MANAGED_POINTER
		do
			create l_managed_pointer.share_from_pointer (a_multi_string, a_count)
			create Result.make (a_count)
			from
				i := 0
			until
				i >= a_count
			loop
				Result.append_code (l_managed_pointer.read_natural_8 (i))
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	pointer_to_wide_string (a_w_string: POINTER; a_count: INTEGER): STRING_32
			-- STRING_32 read from `a_w_string` of `a_count` bytes.
		require
			a_w_string_not_default: a_w_string /= default_pointer
			a_count_non_negative: a_count >= 0
		local
			i: INTEGER
			l_managed_pointer: MANAGED_POINTER
			l_size: INTEGER
		do
			create l_managed_pointer.share_from_pointer (a_w_string, a_count)
			l_size := (a_count + 1) // 2
			create Result.make (l_size)
			from
				i := 0
			until
				i >= l_size
			loop
				if i * 2 <= a_count then
					Result.append_code (l_managed_pointer.read_natural_16 (i * 2))
				end
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	pointer_to_string_32 (a_w_string: POINTER; a_count: INTEGER_32): STRING_32
			-- STRING_32 read from `a_w_string` of `a_count` bytes.
		require
			a_w_string_not_default: a_w_string /= default_pointer
			a_count_non_negative: a_count >= 0
		local
			i: INTEGER_32
			l_managed_pointer: MANAGED_POINTER
			l_size: INTEGER_32
		do
			create l_managed_pointer.share_from_pointer (a_w_string, a_count)
			l_size := a_count // 4
			create Result.make (l_size)
			from
				i := 0
			until
				i >= l_size
			loop
				if i * 4 <= a_count then
					Result.append_code (l_managed_pointer.read_natural_32 (i * 4))
				end
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	string_32_to_multi_byte (a_string: STRING_32): STRING_8
			-- Byte stream of `a_string` in endianness of the current platform.
		require
			a_string_not_void: a_string /= Void
		local
			i: INTEGER_32
			l_code: NATURAL_32
			l_count: INTEGER
			l_is_little_endian: BOOLEAN
		do
			l_count := a_string.count
			if l_count > 0 then
				create Result.make (l_count * 4)
				from
					i := 1
					l_is_little_endian := is_little_endian
				until
					i > l_count
				loop
					l_code := a_string.code (i)
					if l_is_little_endian then
						Result.append_code (l_code & 0x000000FF)
						Result.append_code (l_code & 0x0000FF00 |>> 8)
						Result.append_code (l_code & 0x00FF0000 |>> 16)
						Result.append_code (l_code & 0xFF000000 |>> 24)
					else
						Result.append_code (l_code & 0xFF000000 |>> 24)
						Result.append_code (l_code & 0x00FF0000 |>> 16)
						Result.append_code (l_code & 0x0000FF00 |>> 8)
						Result.append_code (l_code & 0x000000FF)
					end
					i := i + 1
				end
			else
				create Result.make_empty
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	string_8_to_wide_string (a_w_string: STRING_8): STRING_32
			-- Interpret `a_w_string` as a sequence of 2-byte characters into a STRING_32
			-- in endianness of the current platform.
		require
			a_w_string_not_void: a_w_string /= Void
		local
			i: INTEGER
			l_size, l_count: INTEGER
			l_is_little_endian: BOOLEAN
			l_code: NATURAL_32
		do
			l_count := a_w_string.count
			l_size := (l_count + 1) // 2
			l_is_little_endian := is_little_endian
			create Result.make (l_size)
			from
				i := 1
			until
				i > l_count
			loop
				if i + 1 <= l_count then
					if l_is_little_endian then
						l_code := a_w_string.code (i) | (a_w_string.code (i + 1) |<< 8)
					else
						l_code := (a_w_string.code (i) |<< 8) | a_w_string.code (i + 1)
					end
					Result.append_code (l_code)
				end
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	string_16_to_stream (a_string: STRING_32): STRING_8
			-- We use `a_string` as 2 bytes encoding string, the first two bytes are not used.
			-- in the endianness of the current platform.
		require
			a_string_not_void: a_string /= Void
		local
			l_managed_pointer: MANAGED_POINTER
			i, l_count: INTEGER
		do
			l_managed_pointer := wide_string_to_pointer (a_string)
			create Result.make (l_managed_pointer.count)
			from
				i := 0
				l_count := l_managed_pointer.count - 2
			until
				i = l_count
			loop
				Result.append_character (l_managed_pointer.read_natural_8 (i).to_character_8)
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
			valid_count: Result.count = a_string.count * 2
		end

	string_general_to_stream (a_string: READABLE_STRING_GENERAL): STRING_8
			-- Streamize `a_string`.
		require
			a_string_not_void: a_string /= Void
		do
			if a_string.is_string_8 then
				Result := a_string.to_string_8
			else
				Result := string_32_to_multi_byte (a_string.as_string_32)
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

feature -- Endian

	string_32_switch_endian (a_str: STRING_32): STRING_32
			-- Switch endian of `a_str` for both high and low bits.
		require
			a_str_not_void: a_str /= Void
		local
			l_code: NATURAL_32
			i, l_count: INTEGER
		do
			l_count := a_str.count
			create Result.make (l_count)
			from
				i := 1
			until
				i > l_count
			loop
				l_code := a_str.code (i)
				Result.append_code (l_code & 0xFF |<< 24 & 0xFF000000 +
									l_code & 0xFF00 |<< 8 +
									l_code & 0xFF0000 |>> 8 +
									l_code & 0xFF000000 |>> 24 & 0xFF)
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	string_16_switch_endian (a_str: STRING_32): STRING_32
			-- Switch endian of `a_str` for low bits.
			-- High bits are cleaned.
		require
			a_str_not_void: a_str /= Void
		local
			l_code: NATURAL_32
			i, l_count: INTEGER
		do
			l_count := a_str.count
			create Result.make (l_count)
			from
				i := 1
			until
				i > l_count
			loop
				l_code := a_str.code (i)
				Result.append_code (l_code & 0xFF |<< 8 & 0xFF00 +
									l_code & 0xFF00 |>> 8 & 0xFF)
				i := i + 1
			end
		ensure
			instance_free: class
			Result_not_void: Result /= Void
		end

	is_little_endian: BOOLEAN
			-- Is this system little endian?
		once
			Result := {PLATFORM}.is_little_endian
		ensure
			instance_free: class
		end

note
	library:   "Encoding: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
