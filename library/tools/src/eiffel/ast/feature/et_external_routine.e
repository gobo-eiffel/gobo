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
			is_external
		end

	ET_EXTERNAL_ROUTINE_CLOSURE
		rename
			implementation_closure as implementation_feature
		undefine
			first_indexing,
			implementation_feature
		end

feature -- Status report

	is_external: BOOLEAN = True
			-- Is feature external?

feature -- Built-in

	is_builtin: BOOLEAN
			-- Is current feature built-in?
		do
			Result := (builtin_class_code /= tokens.builtin_not_builtin)
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
