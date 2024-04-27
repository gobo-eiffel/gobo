note

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_FEATURE_CALL

inherit

	ET_CALL_COMPONENT
		redefine
			target, arguments
		end

	ET_CALL_WITH_ACTUAL_ARGUMENTS
		undefine
			is_call_agent
		redefine
			arguments,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test
		end

feature -- Access

	target: detachable ET_EXPRESSION
			-- Target
		deferred
		end

	arguments: detachable ET_ACTUAL_ARGUMENTS
			-- Arguments
		deferred
		end

	parenthesis_call: detachable ET_PARENTHESIS_CALL
			-- Unfolded form when the current call is of the parenthesis alias form;
			-- For example, if the current call is 'f (args)', its parenthesis call
			-- will be 'f.g (args)' where 'g' is declared as 'g alias "()"'.
		do
		end

feature -- Status report

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached target as l_target and then l_target.has_result or precursor
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached target as l_target and then l_target.has_address_expression or precursor
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached target as l_target and then l_target.has_agent or precursor
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := attached target as l_target and then l_target.has_typed_object_test or precursor
		end

end
