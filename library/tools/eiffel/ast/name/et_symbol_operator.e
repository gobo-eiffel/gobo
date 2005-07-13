indexing

	description:

		"Eiffel symbol operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYMBOL_OPERATOR

inherit

	ET_SYMBOL
		redefine
			process
		end

	ET_OPERATOR
		undefine
			is_semicolon, first_position, last_position
		end

create

	make_div,
	make_divide,
	make_ge,
	make_gt,
	make_le,
	make_lt,
	make_minus,
	make_mod,
	make_plus,
	make_power,
	make_times

feature -- Status setting

	set_infix_minus is
			-- Set `is_infix_minus'.
		do
			code := tokens.infix_minus_code
		ensure
			is_infix_minus: is_infix_minus
		end

	set_prefix_minus is
			-- Set `is_prefix_minus'.
		do
			code := tokens.prefix_minus_code
		ensure
			is_prefix_minus: is_prefix_minus
		end

	set_infix_plus is
			-- Set `is_infix_plus'.
		do
			code := tokens.infix_plus_code
		ensure
			is_infix_plus: is_infix_plus
		end

	set_prefix_plus is
			-- Set `is_prefix_plus'.
		do
			code := tokens.prefix_plus_code
		ensure
			is_prefix_plus: is_prefix_plus
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_symbol_operator (Current)
		end

end
