note

	description:

		"Eiffel lists of agent implicit open arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2024, Eric Bezault and others"
	license: "MIT License"

class ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST

inherit

	ET_AGENT_ARGUMENT_OPERANDS
		redefine
			is_instance_free
		end

	ET_TAIL_LIST [ET_AGENT_IMPLICIT_OPEN_ARGUMENT]
		rename
			item as actual_argument
		undefine
			is_empty, valid_index
		end

create

	make, make_with_capacity

feature -- Status report

	is_instance_free: BOOLEAN
			-- Are all arguments instance-free (i.e. not dependent
			-- on 'Current' or its attributes)?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := True
		end


feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		do
			-- Result := False
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		do
			-- Result := False
		end

	has_agent: BOOLEAN
			-- Does an agent appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		do
			-- Result := False
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in one of the current operands
			-- or (recursively) in one of their subexpressions?
		do
			-- Result := False
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current expression
			-- and (recursively) in its subexpressions.
		do
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_AGENT_IMPLICIT_OPEN_ARGUMENT]
			-- Fixed array routines
		once
			create Result
		end

end
