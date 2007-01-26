indexing

	description:

		"Eiffel integer constants with underscores"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNDERSCORED_INTEGER_CONSTANT

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
			-- valid_literal: ((_*[0-9]+_*)+).recognizes (a_literal)
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
			c: CHARACTER
		do
			has_value_error := False
			nb := literal.count
				-- TODO: deal with overflow and underflow.
			if is_negative then
				from i := 1 until i > nb loop
					c := literal.item (i)
					if c /= '_' then
						d := c.code - Zero_code
						v := 10 * v - d
					end
					i := i + 1
				end
			else
				from i := 1 until i > nb loop
					c := literal.item (i)
					if c /= '_' then
						d := c.code - Zero_code
						v := 10 * v + d
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
			a_processor.process_underscored_integer_constant (Current)
		end

invariant

	-- valid_literal: ((_*[0-9]+_*)+).recognizes (literal)

end
