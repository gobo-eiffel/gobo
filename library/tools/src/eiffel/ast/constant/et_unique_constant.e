note

	description:

		"Eiffel integer constants for unique attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_UNIQUE_CONSTANT

inherit

	ET_REGULAR_INTEGER_CONSTANT
		rename
			make as make_regular_integer_constant
		end

create

	make

feature {NONE} -- Initialization

	make (a_class: like implementation_class)
			-- Create a new Integer constant for unique attributes.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
			make_regular_integer_constant (one_literal, 1, False)
		ensure
			implementation_class_set: implementation_class = a_class
			literal_set: literal = one_literal
			value_set: value = 1
			has_overflow_set: not has_overflow
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	implementation_class: ET_CLASS

feature -- Setting

	set_implementation_class (a_class: ET_CLASS)
			-- Set `implementation_class` to `a_class`.
		require
			a_class_not_void: a_class /= Void
		do
			implementation_class := a_class
		ensure
			implementation_class_set: implementation_class = a_class
		end

feature {NONE} -- Implementation

	one_literal: STRING = "1"
			-- Literal value of '1'

invariant

	implementation_class_not_void: implementation_class /= Void

end
