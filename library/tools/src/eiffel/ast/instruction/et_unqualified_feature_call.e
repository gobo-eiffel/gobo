note

	description:

		"Eiffel unqualified feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_UNQUALIFIED_FEATURE_CALL

inherit

	ET_FEATURE_CALL
		redefine
			is_qualified_call
		end

feature -- Access

	target: detachable ET_EXPRESSION
			-- Target
		do
			-- Result := Void
		ensure then
			no_target: Result = Void
		end

feature -- Status report

	is_qualified_call: BOOLEAN = False
			-- Is current call qualified?

invariant

	unqualified_call: not is_qualified_call

end
