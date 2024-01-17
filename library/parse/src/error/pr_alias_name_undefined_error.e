note

	description:

		"Error: Alias name undefined for a given token type"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2009-2011, Eric Bezault and others"
	license: "MIT License"

class PR_ALIAS_NAME_UNDEFINED_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_type: PR_TYPE; a_old_alias_name: STRING)
			-- Create a new error reporting that the alias name for token type `a_type',
			-- which was defined as `a_old_alias_name', is being undefined.
			-- The alias name should be repeated in each %token declaration with a given type.
		require
			filename_not_void: filename /= Void
			a_type_not_void: a_type /= Void
			a_old_alias_name_not_void: a_old_alias_name /= Void
		do
			create parameters.make_filled (empty_string, 1, 4)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_type.name, 3)
			parameters.put (a_old_alias_name, 4)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: alias name '$4' for type '$3' should be repeated in each %%token declaration with that type"
			-- Default template used to built the error message

	code: STRING = "PR0029"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = token type name
--	dollar4: $4 = old alias name

end
