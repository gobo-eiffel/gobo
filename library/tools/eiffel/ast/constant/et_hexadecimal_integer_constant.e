indexing

	description:

		"Eiffel integer constants in hexadecimal format"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_HEXADECIMAL_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT

creation

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_position: like literal_position) is
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: 0x[0-9a-fA-F]+
			a_position_not_void: a_position /= Void
		do
			literal := a_literal
			literal_position := a_position
		ensure
			literal_set: literal = a_literal
			literal_position_set: literal_position = a_position
		end

feature -- Basic operations

	compute_value is
			-- Compute value of current integer constant.
			-- Make result available in `value' or set
			-- `has_value_error' to true if an overflow or
			-- underflow occurred during computation.
		local
			v: INTEGER
			i, nb: INTEGER
		do
			has_value_error := False
			nb := literal.count
				-- TODO: deal with overflow and underflow.
			if is_negative then
				from i := 3 until i > nb loop
					v := 10 * v
					inspect literal.item (i)
					when '0' then
					when '1' then
						v := v - 1
					when '2' then
						v := v - 2
					when '3' then
						v := v - 3
					when '4' then
						v := v - 4
					when '5' then
						v := v - 5
					when '6' then
						v := v - 6
					when '7' then
						v := v - 7
					when '8' then
						v := v - 8
					when '9' then
						v := v - 9
					when 'a', 'A' then
						v := v - 10
					when 'b', 'B' then
						v := v - 11
					when 'c', 'C' then
						v := v - 12
					when 'd', 'D' then
						v := v - 13
					when 'e','E' then
						v := v - 14
					when 'f', 'F' then
						v := v - 15
					end
					i := i + 1
				end
			else
				from i := 3 until i > nb loop
					v := 10 * v
					inspect literal.item (i)
					when '0' then
					when '1' then
						v := v + 1
					when '2' then
						v := v + 2
					when '3' then
						v := v + 3
					when '4' then
						v := v + 4
					when '5' then
						v := v + 5
					when '6' then
						v := v + 6
					when '7' then
						v := v + 7
					when '8' then
						v := v + 8
					when '9' then
						v := v + 9
					when 'a', 'A' then
						v := v + 10
					when 'b', 'B' then
						v := v + 11
					when 'c', 'C' then
						v := v + 12
					when 'd', 'D' then
						v := v + 13
					when 'e','E' then
						v := v + 14
					when 'f', 'F' then
						v := v + 15
					end
					i := i + 1
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_hexadecimal_integer_constant (Current)
		end

invariant

	-- valid_literal: regexp: 0x[0-9a-fA-F]+

end
