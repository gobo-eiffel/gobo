indexing

	description:

		"Interface for character output streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_CHARACTER_OUTPUT_STREAM

inherit

	KI_OUTPUT_STREAM [CHARACTER]
		rename
			put as put_character
		redefine
			append
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Output

	put_string (a_string: STRING) is
			-- Write `a_string' to output stream.
		require
			is_open_write: is_open_write
			a_string_not_void: a_string /= Void
		deferred
		end

	put_substring (a_string: STRING; s, e: INTEGER) is
			-- Write substring of `a_string' between indexes
			-- `s' and `e' to output stream.
		require
			is_open_write: is_open_write
			a_string_not_void: a_string /= Void
			s_large_enough: s >= 1
			e_small_enough: e <= a_string.count
			valid_interval: s <= e + 1
		do
			if s <= e then
				put_string (a_string.substring (s, e))
			end
		end

	put_integer (i: INTEGER) is
			-- Write decimal representation
			-- of `i' to output stream.
			-- Regexp: 0|(-?[1-9][0-9]*)
		require
			is_open_write: is_open_write
		local
			k, j: INTEGER
		do
			if i = 0 then
				put_character ('0')
			elseif i < 0 then
				put_character ('-')
					-- Avoid overflow.
				k := -(i + 1)
				j := k // 10
				inspect k \\ 10
				when 0 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('1')
				when 1 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('2')
				when 2 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('3')
				when 3 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('4')
				when 4 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('5')
				when 5 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('6')
				when 6 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('7')
				when 7 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('8')
				when 8 then
					if j /= 0 then
						put_integer (j)
					end
					put_character ('9')
				when 9 then
					put_integer (j + 1)
					put_character ('0')
				end
			else
				k := i
				j := k // 10
				if j /= 0 then
					put_integer (j)
				end
				inspect k \\ 10
				when 0 then
					put_character ('0')
				when 1 then
					put_character ('1')
				when 2 then
					put_character ('2')
				when 3 then
					put_character ('3')
				when 4 then
					put_character ('4')
				when 5 then
					put_character ('5')
				when 6 then
					put_character ('6')
				when 7 then
					put_character ('7')
				when 8 then
					put_character ('8')
				when 9 then
					put_character ('9')
				end
			end
		end

	put_boolean (b: BOOLEAN) is
			-- Write "True" to output stream if
			-- `b' is true, "False" otherwise.
		require
			is_open_write: is_open_write
		do
			if b then
				put_string (True_constant)
			else
				put_string (False_constant)
			end
		end

	append (an_input_stream: KI_INPUT_STREAM [CHARACTER]) is
			-- Read items of `an_input_stream' until the end
			-- of input is reached, and write these items to
			-- current output stream.
		local
			a_character_input: ?KI_CHARACTER_INPUT_STREAM
		do
			a_character_input ?= an_input_stream
			if a_character_input /= Void then
				from
					if not a_character_input.end_of_input then
						a_character_input.read_string (512)
					end
				until
					a_character_input.end_of_input
				loop
					put_string (a_character_input.last_string)
					a_character_input.read_string (512)
				end
			else
				precursor (an_input_stream)
			end
		end

feature -- Basic operations

	flush is
			-- Flush buffered data to disk.
		require
			is_open_write: is_open_write
		deferred
		end

feature {NONE} -- Implementation

	True_constant: STRING is "True"
			-- String representation of boolean value 'True'

	False_constant: STRING is "False"
			-- String representation of boolean value 'False'

end
