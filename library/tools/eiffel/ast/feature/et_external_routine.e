indexing

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE

	ET_EXTERNAL_ROUTINE_CLOSURE

feature -- Built-in

	is_builtin: BOOLEAN is
			-- Is current feature built-in?
		do
			Result := (builtin_code /= tokens.builtin_not_builtin)
		end

	is_builtin_unknown: BOOLEAN is
			-- Is current built-in feature unknown?
		require
			is_builtin: is_builtin
		do
			Result := (builtin_code = tokens.builtin_unknown)
		end

	builtin_code: INTEGER
			-- Built-in feature code

	set_builtin_code (a_code: INTEGER) is
			-- Set `builtin_code' to `a_code'.
		do
			builtin_code := a_code
		ensure
			builtin_code_set: builtin_code = a_code
		end

end
