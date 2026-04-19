note

	description:

		"Eiffel current operands"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CURRENT_OPERAND

inherit

	ET_OPERAND
		redefine
			is_current,
			is_instance_free
		end

	HASHABLE

feature -- Status report

	is_current: BOOLEAN = True
			-- Is current operand the 'Current' entity (possibly parenthesized)?

	is_instance_free: BOOLEAN
			-- Does current operand not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := False
		end

invariant

	is_current: is_current

end
