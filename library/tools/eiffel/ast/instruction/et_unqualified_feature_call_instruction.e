note

	description:

		"Eiffel unqualified feature call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION

inherit

	ET_FEATURE_CALL_INSTRUCTION
		undefine
			is_qualified_call
		end

	ET_UNQUALIFIED_FEATURE_CALL

end
