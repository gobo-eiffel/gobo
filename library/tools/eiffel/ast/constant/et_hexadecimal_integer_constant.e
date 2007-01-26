indexing

	description:

		"Eiffel integer constants in hexadecimal format"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_HEXADECIMAL_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: (0[xX][0-9a-fA-F]+).recognizes (a_literal)
		do
			literal := a_literal
			make_leaf
		ensure
			literal_set: literal = a_literal
			line_set: line = no_line
			column_set: column = no_column
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
					v := 16 * v
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
					v := 16 * v
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
			value := v
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_hexadecimal_integer_constant (Current)
		end

invariant

	-- valid_literal: (0[xX][0-9a-fA-F]+).recognizes (literal)

end
