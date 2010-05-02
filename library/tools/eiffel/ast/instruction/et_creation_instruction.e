note

	description:

		"Eiffel creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		local
			l_type: ET_TYPE
		do
			target.reset
			l_type := type
			if l_type /= Void then
				l_type.reset
			end
			if creation_call /= Void then
				creation_call.reset
			end
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of the creation

	type: ET_TYPE
			-- Creation type
		deferred
		end

	creation_call: ET_QUALIFIED_CALL
			-- Call to creation procedure

	arguments: ET_ACTUAL_ARGUMENT_LIST
			-- Arguments of creation call
		do
			if creation_call /= Void then
				Result := creation_call.arguments
			end
		end

invariant

	target_not_void: target /= Void

end
