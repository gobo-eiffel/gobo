note

	description:

		"Error: Alias name defined twice for a given token type"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_ALIAS_NAME_DEFINED_TWICE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_type: PR_TYPE; a_old_alias_name, a_new_alias_name: STRING)
			-- Create a new error reporting that the alias name for token type `a_type' has been defined twice.
			-- The same alias name should be repeated in each %token declaration with a given type.
		require
			filename_not_void: filename /= Void
			a_type_not_void: a_type /= Void
			a_old_alias_name_not_void: a_old_alias_name /= Void
			a_new_alias_name_not_void: a_new_alias_name /= Void
		do
			create parameters.make (1, 5)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_type.name, 3)
			parameters.put (a_old_alias_name, 4)
			parameters.put (a_new_alias_name, 5)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: each %%token declaration with type '$3' should have the same alias name which has already been defined as '$4'"
			-- Default template used to built the error message

	code: STRING = "PR0028"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = token type name
--	dollar4: $4 = old alias name
--	dollar5: $5 = new alias name

end
