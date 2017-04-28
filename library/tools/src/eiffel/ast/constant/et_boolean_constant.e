note

	description:

		"Eiffel boolean constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BOOLEAN_CONSTANT

inherit

	ET_CONSTANT
		undefine
			first_position,
			last_position,
			is_false,
			is_true,
			break
		redefine
			is_boolean_constant
		end

	ET_INDEXING_TERM
		undefine
			first_position,
			last_position,
			break
		end

	ET_KEYWORD
		undefine
			process,
			is_current
		end

feature -- Status report

	is_boolean_constant: BOOLEAN = True
			-- Is current constant a BOOLEAN constant?

	has_indexing_term_value (a_value: STRING): BOOLEAN
			-- Does current indexing term have value `a_value'?
			-- (case-insensitive comparison)
		do
			Result := STRING_.same_case_insensitive (text, a_value)
		end

feature -- Access

	indexing_term_value: STRING
			-- Value of current indexing term
		do
			Result := text
		end

end
