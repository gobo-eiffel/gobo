indexing

	description:

		"Eiffel choice constants in when parts of inspect instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHOICE_CONSTANT

inherit

	ET_CHOICE

feature -- Access

	lower: ET_CHOICE_CONSTANT is
			-- Lower bound
		do
			Result := Current
		end

	upper: ET_CHOICE_CONSTANT is
			-- Upper bound
		do
			Result := Current
		end

	expression: ET_EXPRESSION is
			-- Expression version of current choice constant
		deferred
		ensure
			-- Note: the following assertion is commented out
			-- because of VWEQ.
			-- definition: Result = Current
		end

end
