note

	description:

		"Eiffel constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONSTANT

inherit

	ET_EXPRESSION
		redefine
			is_never_void
		end

feature -- Status report

	is_boolean_constant: BOOLEAN
			-- Is current constant a BOOLEAN constant?
		do
			-- Result := False
		end

	is_character_constant: BOOLEAN
			-- Is current constant a CHARACTER constant?
		do
			-- Result := False
		end

	is_integer_constant: BOOLEAN
			-- Is current constant an INTEGER constant?
		do
			-- Result := False
		end

	is_real_constant: BOOLEAN
			-- Is current constant a REAL constant?
		do
			-- Result := False
		end

	is_string_constant: BOOLEAN
			-- Is current constant a STRING constant?
		do
			-- Result := False
		end

	is_type_constant: BOOLEAN
			-- Is current constant a TYPE constant?
		do
			-- Result := False
		end

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

end
