indexing

	description:

		"Eiffel infix '+' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INFIX_PLUS

inherit

	ET_INFIX
		redefine
			is_infix_plus
		end

feature -- Access

	name: STRING is
			-- Name of feature
		once
			Result := infix_name
		end

	hash_code: INTEGER is
			-- Hash code
		once
			Result := 15
		end

feature -- Status report

	is_infix_plus: BOOLEAN is
			-- Is current feature name of the form 'infix "+"'?
		once
			Result := True
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			Result := other.is_infix_plus
		end

feature {NONE} -- Implementation

	infix_name: STRING is "infix %"+%""
			-- Infix name

end -- class ET_INFIX_PLUS
