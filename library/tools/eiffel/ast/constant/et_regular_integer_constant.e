indexing

	description:

		"Eiffel integer constants with no underscore"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_REGULAR_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT

	UT_CHARACTER_CODES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal) is
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: ([0-9]+).recognizes (a_literal)
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
			v, d: INTEGER
			i, nb: INTEGER
		do
			has_value_error := False
				-- TODO: deal with overflow and underflow.
			nb := literal.count
			if is_negative then
				from i := 1 until i > nb loop
					d := literal.item (i).code - Zero_code
					v := 10 * v - d
					i := i + 1
				end
			else
				from i := 1 until i > nb loop
					d := literal.item (i).code - Zero_code
					v := 10 * v + d
					i := i + 1
				end
			end
			value := v
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_regular_integer_constant (Current)
		end

invariant

	-- valid_literal: ([0-9]+).recognizes (literal)

end
