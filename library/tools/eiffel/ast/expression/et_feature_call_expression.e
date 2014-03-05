note

	description:

		"Eiffel feature call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL_EXPRESSION

inherit

	ET_FEATURE_CALL
		redefine
			parenthesis_call
		end

	ET_EXPRESSION

feature -- Access

	parenthesis_call: detachable ET_CALL_EXPRESSION
			-- <Precursor>
		do
		end
end
