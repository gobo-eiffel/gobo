indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_AST_NODE

feature -- Access

	target: ET_EXPRESSION is
			-- Target
		deferred
		end

	name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		deferred
		end

feature -- Status report

	is_qualified_call: BOOLEAN is
			-- Is current call qualified?
		do
			Result := (target /= Void)
		ensure
			definition: Result = (target /= Void)
		end

end
