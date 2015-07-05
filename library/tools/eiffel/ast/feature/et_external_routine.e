note

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2008/12/01 $"
	revision: "$Revision: #8 $"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE
		redefine
			is_external
		end

	ET_EXTERNAL_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			implementation_feature
		end

feature -- Status report

	is_external: BOOLEAN = True
			-- Is feature external?

feature -- Built-in

	is_builtin: BOOLEAN
			-- Is current feature built-in?
		do
			Result := (builtin_code /= tokens.builtin_not_builtin)
		end

	is_builtin_unknown: BOOLEAN
			-- Is current built-in feature unknown?
		require
			is_builtin: is_builtin
		do
			Result := (builtin_code = tokens.builtin_unknown)
		end

	builtin_code: INTEGER
			-- Built-in feature code

	set_builtin_code (a_code: INTEGER)
			-- Set `builtin_code' to `a_code'.
		do
			builtin_code := a_code
		ensure
			builtin_code_set: builtin_code = a_code
		end

end
