note

	description:

		"Eiffel assertions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSERTION

inherit

	ET_ASSERTION_ITEM

feature -- Initialization

	reset
			-- Reset assertion as it was when it was last parsed.
		do
		end

feature -- Status report

	is_class_assertion: BOOLEAN
			-- Does current assertion indicate that the associated feature is a class routine?
			-- A class routine is an instance-free feature which can be used in Non-object-calls
			-- of the form '{A}.f'.
		do
			-- Result := False
		end

feature -- Access

	expression: detachable ET_EXPRESSION
			-- Expression (may be Void)
		deferred
		end

	assertion: ET_ASSERTION
			-- Assertion in list of assertions
		do
			Result := Current
		end

end
