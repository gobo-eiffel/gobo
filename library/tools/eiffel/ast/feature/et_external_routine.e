indexing

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE

feature -- Access

	language: ET_EXTERNAL_LANGUAGE
			-- External language

	alias_clause: ET_EXTERNAL_ALIAS
			-- Alias clause

feature -- Setting

	set_alias_clause (an_alias: like alias_clause) is
			-- Set `alias_clause' to `an_alias'.
		do
			alias_clause := an_alias
		ensure
			alias_clause_set: alias_clause = an_alias
		end

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

invariant

	language_not_void: language /= Void

end
