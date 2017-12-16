note

	description:

		"Eiffel external routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXTERNAL_ROUTINE

inherit

	ET_ROUTINE
		redefine
			is_external, is_static
		end

	ET_EXTERNAL_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			first_indexing,
			implementation_feature
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Status report

	is_external: BOOLEAN = True
			-- Is feature external?

	is_static: BOOLEAN
			-- Can feature be used as a static feature (i.e. in a call of the form {A}.f)?
			--
			-- True even if not explicitly declared as static provided that the external routine
			-- has no assertions and is not a built-in non-static routine.
			-- Note ECMA-367 2nd Edition says that it's possible to have assertions provided
			-- that they do not involve "Current" or unqualified calls (see ECMA VUNO-3).
			-- But ISE is more strict and does not accept any assertions apart from empty ones
			-- or those containing only the expression "True".
		do
			if Precursor then
				Result := True
			elseif is_builtin and then not is_builtin_static then
				Result := False
			elseif not are_preconditions_all_true_recursive then
				Result := False
			elseif not are_postconditions_all_true_recursive then
				Result := False
			else
				Result := True
			end
		end

feature -- Built-in

	is_builtin: BOOLEAN
			-- Is current feature built-in?
		do
			Result := (builtin_class_code /= tokens.builtin_not_builtin)
		end

	is_builtin_static: BOOLEAN
			-- Is current feature a built-in feature declared as static?
		local
			l_external_language: STRING
		do
			l_external_language := language.manifest_string.value
			Result := STRING_.same_case_insensitive (l_external_language, tokens.builtin_static_marker) or STRING_.same_case_insensitive (l_external_language, tokens.static_builtin_marker)
		end

	is_builtin_unknown: BOOLEAN
			-- Is current built-in feature unknown?
		require
			is_builtin: is_builtin
		do
			Result := (builtin_class_code = tokens.builtin_unknown)
		end

	builtin_class_code: NATURAL_8
			-- Built-in class code

	builtin_feature_code: NATURAL_8
			-- Built-in feature code

	set_builtin_code (a_class_code, a_feature_code: NATURAL_8)
			-- Set `builtin_class_code' to `a_class_code'
			-- and `builtin_feature_code' to `a_feature_code'.
		do
			builtin_class_code := a_class_code
			builtin_feature_code := a_feature_code
		ensure
			builtin_class_code_set: builtin_class_code = a_class_code
			builtin_feature_code_set: builtin_feature_code = a_feature_code
		end

end
