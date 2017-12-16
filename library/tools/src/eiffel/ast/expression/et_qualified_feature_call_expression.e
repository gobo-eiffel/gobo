note

	description:

		"Eiffel qualified feature call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_FEATURE_CALL_EXPRESSION

inherit

	ET_FEATURE_CALL_EXPRESSION
		undefine
			is_qualified_call
		redefine
			target
		end

	ET_QUALIFIED_FEATURE_CALL
		undefine
			parenthesis_call
		redefine
			target
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target
		deferred
		end

end
