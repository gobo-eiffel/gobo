note

	description:

		"Eiffel creation components (either creation instructions or expressions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_COMPONENT

inherit

	ET_AST_NODE

feature -- Access

	type: detachable ET_TYPE
			-- Creation type
		deferred
		end

	creation_call: detachable ET_CREATION_CALL
			-- Call to creation procedure
		deferred
		end

end
