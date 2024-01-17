note

	description:

		"Error: Left-hand-side symbol is a token %
		%instead of a nonterminal symbol"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"

class PR_LHS_SYMBOL_TOKEN_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_name: STRING)
			-- Create a new error reporting that the left-hand-side
			-- symbol `a_name' in a rule is a token instead of a
			-- nonterminal symbol.
		require
			filename_not_void: filename /= Void
			a_name_not_void: a_name /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_name, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: left-hand-side symbol $3 is a token"
			-- Default template used to built the error message

	code: STRING = "PR0003"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = token name

end
