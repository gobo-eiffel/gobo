indexing

	description:

		"Perl-Compatible Regular Expressions written in Eiffel"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Harald Erdbrügger and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	RX_CODER


inherit

	KL_INTEGER_ROUTINES

	RX_CONSTANTS


creation

	make


feature {NONE}

	make (a_code_pool: ARRAY [CHARACTER]) is
		do
			code := a_code_pool
			code_index := code.lower
		end


feature {RX_MATCHER} -- query

	code_index: INTEGER

	int16_code_at (a_code_index: INTEGER): INTEGER is
		do
			Result := code.item(a_code_index).code * 256 + code.item(a_code_index+1).code
		ensure
			Result >= 0 and Result <= 65535
		end


feature {RX_MATCHER} -- command

	put_opcode_at (a_op: INTEGER; a_code_index: INTEGER) is
		require
			a_op >= 0 and a_op <= 255
		do
			code.force (to_character (a_op), a_code_index)
		ensure
			code.item (a_code_index).code = a_op
		end

	put_char_code_at (a_ch: CHARACTER; a_code_index: INTEGER) is
		do
			code.force (a_ch, a_code_index)
		ensure
			code.item (a_code_index) = a_ch
		end

	put_int8_code_at (a_val: INTEGER; a_code_index: INTEGER) is
		require
			a_val >= 0 and a_val <= 255
		do
			code.force (to_character (a_val), a_code_index)
		ensure
			code.item (a_code_index).code = a_val
		end

	put_int16_code_at (a_val: INTEGER; a_code_index: INTEGER) is
		require
			a_val >= 0 and a_val <= 65535
		do
			code.force (to_character (a_val \\ 256), a_code_index + 1)
			code.put (to_character (a_val // 256), a_code_index)
		ensure
			int16_code_at (a_code_index) = a_val
		end

	add_opcode_at (a_op, a_index: INTEGER) is
		local
			i: INTEGER
		do
			-- code.add (a_op.to_character, a_index)
			code.force (code.item (code_index - 1), code_index)
			from
				i := code_index - 2
			until
				i < a_index
			loop
				code.put (code.item (i), i + 1)
				i := i - 1
			end
			code.put (to_character (a_op), a_index)
			code_index := code_index + 1
		ensure
			code.item (a_index).code = a_op
		end

	emit_opcode (a_op: INTEGER) is
		do
			put_opcode_at (a_op, code_index)
			code_index := code_index + 1
		end

	emit_option_bits (a_opt: BIT 8) is
		do
			code.force (to_character (a_opt.to_integer), code_index + 1)
			code.put (to_character (op_opt), code_index)
			code_index := code_index + 2
		end

	emit_character (a_ch: CHARACTER) is
		do
			code.force (a_ch, code_index)
			code_index := code_index + 1
		end

	emit_int8 (a_val: INTEGER) is
		do
			put_int8_code_at (a_val, code_index)
			code_index := code_index + 1
		end

	emit_int16 (a_val: INTEGER) is
		do
			put_int16_code_at (a_val, code_index)
			code_index := code_index + 2
		end

	emit_set (a_set: RX_CHARACTER_SET; a_negate: BOOLEAN) is
		local
			i, j: INTEGER
		do
			i := a_set.upper
			j := code_index + i
			code_index := j + 1
			if a_negate then
				from
				until
					i < 0
				loop
					code.force (to_character ((not a_set.bit_8_item(i)).to_integer), j)
					i := i - 1
					j := j - 1
				end
			else
				from
				until
					i < 0
				loop
					code.force (to_character (a_set.bit_8_item(i).to_integer), j)
					i := i - 1
					j := j - 1
				end
			end
		ensure
			code_index = old code_index + a_set.count
		end

	emit_code_copy (a_from: INTEGER; a_len: INTEGER) is
		local
			i, j: INTEGER
			stop: INTEGER
		do
			stop := code_index
			code_index := stop + a_len
			i := a_from + a_len - 1
			j := code_index - 1
			code.force (code.item(i), j)
			from
			until
				j <= stop
			loop
				j := j - 1
				i := i - 1
				code.put (code.item(i), j)
			end
		ensure
			code_index = old code_index + a_len
		end


feature {NONE}

	code: ARRAY [CHARACTER]


feature {RX_MATCHER} -- debug section

	op_names: ARRAY [STRING] is
		once
			Result :=
				<<	"End", "\A", "\B", "\b", "\D", "\d",
						"\S", "\s", "\W", "\w", "\Z", "\z",
						"Opt", "^", "$", "Any", "chars", "not",
						"*", "*?", "+", "+?", "?", "??", "{", "{", "{",
						"*", "*?", "+", "+?", "?", "??", "{", "{", "{",
						"*", "*?", "+", "+?", "?", "??", "{", "{", "{",
						"*", "*?", "+", "+?", "?", "??", "{", "{",
						"class", "Ref", "Recurse",
						"Alt", "Ket", "KetRmax", "KetRmin", "Assert", "Assert not",
						"AssertB", "AssertB not", "Reverse", "Once", "Cond", "Cref",
						"Brazero", "Braminzero", "Bra">>
		end


end -- class RX_CODER
