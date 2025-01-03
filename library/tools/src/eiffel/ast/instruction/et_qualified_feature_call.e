﻿note

	description:

		"Eiffel qualified feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2014-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_QUALIFIED_FEATURE_CALL

inherit

	ET_FEATURE_CALL
		redefine
			target,
			is_qualified_call,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		end

	ET_SEPARATE_CALL
		undefine
			is_call_agent,
			has_result,
			has_address_expression,
			has_agent,
			has_typed_object_test,
			add_old_expressions
		redefine
			target
		end

feature -- Access

	target: ET_EXPRESSION
			-- Target
		deferred
		ensure then
			target_not_void: Result /= Void
		end

feature -- Status report

	is_qualified_call: BOOLEAN = True
			-- Is current call qualified?

	has_result: BOOLEAN
			-- Does the entity 'Result' appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_result or
				attached arguments as l_arguments and then l_arguments.has_result
		end

	has_address_expression: BOOLEAN
			-- Does an address expression appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_address_expression or
				attached arguments as l_arguments and then l_arguments.has_address_expression
		end

	has_agent: BOOLEAN
			-- Does an agent appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_agent or
				attached arguments as l_arguments and then l_arguments.has_agent
		end

	has_typed_object_test: BOOLEAN
			-- Does a typed object-test appear in current call
			-- or (recursively) in one of its subexpressions?
		do
			Result := target.has_typed_object_test or
				attached arguments as l_arguments and then l_arguments.has_typed_object_test
		end

feature -- Assertions

	add_old_expressions (a_list: DS_ARRAYED_LIST [ET_OLD_EXPRESSION])
			-- Add to `a_list' all old expressions appearing in current call
			-- and (recursively) in its subexpressions.
		do
			target.add_old_expressions (a_list)
			if attached arguments as l_arguments then
				l_arguments.add_old_expressions (a_list)
			end
		end

invariant

	qualified_call: is_qualified_call

end
