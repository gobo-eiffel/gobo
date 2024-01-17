note

	description:

		"Error: Unknown child element in element error"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"

class ET_XACE_INVALID_EXPRESSION_ERROR

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_ERROR

create

	make

feature {NONE} -- Initialization

	make (an_invalid_expression: STRING; a_position: XM_POSITION)
			-- Create an error reporting that expression `an_invalid_expression'
			-- is not valid.
		require
			an_invalid_expression_not_void: an_invalid_expression /= Void
			a_position_not_void: a_position /= Void
		do
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (an_invalid_expression, 1)
			parameters.put (a_position.out, 2)
		end

feature -- Access

	default_template: STRING = "found invalid expression '$1' at $2"
			-- Default template used to built the error message

	code: STRING = "XA0008"
			-- Error code

end
