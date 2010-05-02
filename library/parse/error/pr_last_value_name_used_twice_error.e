note

	description:

		"Error: Same variable name used to pass values for tokens of two different types"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_LAST_VALUE_NAME_USED_TWICE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_last_value_name: STRING; a_type1, a_type2: PR_TYPE)
			-- Create a new error reporting that `a_last_value_name' is the name of the variable
			-- used to pass values for tokens both of type `a_type1' and `a_type2'.
		require
			filename_not_void: filename /= Void
			a_last_value_name_not_void: a_last_value_name /= Void
			a_type1_not_void: a_type1 /= Void
			a_type2_not_void: a_type2 /= Void
		do
			create parameters.make (1, 5)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_last_value_name, 3)
			parameters.put (a_type1.name, 4)
			parameters.put (a_type2.name, 5)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: '$3' is the name of the variable used to pass values for tokens both of type '$4' and '$5'"
			-- Default template used to built the error message

	code: STRING = "PR0031"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = last value name
--	dollar4: $4 = first token type name
--	dollar5: $5 = second token type name

end
