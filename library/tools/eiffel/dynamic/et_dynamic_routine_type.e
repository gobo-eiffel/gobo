note

	description:

		"Eiffel dynamic ROUTINE types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_ROUTINE_TYPE

inherit

	ET_DYNAMIC_TYPE
		redefine
			is_agent_type
		end

feature -- Status report

	is_agent_type: BOOLEAN = True
			-- Is current type an agent type?

feature -- Access

	open_operand_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Type sets of open operands

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type set of result, if any
		deferred
		end

invariant

	open_operand_type_sets_not_void: open_operand_type_sets /= Void

end
