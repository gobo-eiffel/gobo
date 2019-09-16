note

	description:

		"Eiffel integer constants with no underscore"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_REGULAR_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: NATURAL_64; a_has_overflow: BOOLEAN)
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {ET_REGULAR_INTEGER_CONSTANT}.valid_literal (a_literal)
		do
			literal := a_literal
			value := a_value
			has_overflow := a_has_overflow
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
			has_overflow_set: has_overflow = a_has_overflow
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Setting

	set_value (a_value: like value)
			-- Set `value' to `a_value'.
		do
			value := a_value
			literal := a_value.out
			has_overflow := False
		ensure
			value_set: value = a_value
			literal_set: literal ~ a_value.out
			no_overflow: not has_overflow
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_regular_integer_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "[0-9]+"
			-- Regular expression for `literal'

end
