note

	description:

		"Eiffel creation instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2023, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CREATION_INSTRUCTION

inherit

	ET_INSTRUCTION
		redefine
			reset
		end

	ET_CREATION_COMPONENT

feature -- Initialization

	reset
			-- Reset instruction as it was just after it was last parsed.
		do
			target.reset
			if attached type as l_type then
				l_type.reset
			end
			if attached creation_call as l_creation_call then
				l_creation_call.reset
			end
			if attached default_create_name as l_default_create_name then
				l_default_create_name.reset
			end
			if attached internal_separate_target as l_internal_separate_target then
				l_internal_separate_target.reset
			end
		end

feature -- Access

	target: ET_WRITABLE
			-- Target of the creation

	creation_call: detachable ET_QUALIFIED_CALL
			-- Call to creation procedure

invariant

	target_not_void: target /= Void

end
