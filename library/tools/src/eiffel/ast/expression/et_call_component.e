note

	description:

		"Eiffel call components (either feature calls or agents)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2023, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CALL_COMPONENT

inherit

	ET_AST_NODE

feature -- Access

	target: detachable ET_TARGET_OPERAND
			-- Target
		deferred
		end

	name: ET_CALL_NAME
			-- Call name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: detachable ET_ARGUMENT_OPERANDS
			-- Arguments
		deferred
		end

feature -- Status report

	is_qualified_call: BOOLEAN
			-- Is current call qualified?
		do
			Result := (target /= Void)
		ensure
			definition: Result implies (target /= Void)
		end

	is_tuple_label: BOOLEAN
			-- Is current call a call to a Tuple label?
		do
			Result := name.is_tuple_label
		ensure
			definition: Result = name.is_tuple_label
		end

	is_call_agent: BOOLEAN
			-- Is current call a call agent?
		do
			Result := False
		end

	is_instance_free: BOOLEAN
			-- Does current call not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := (attached target as l_target and then l_target.is_instance_free) and
				(attached arguments as l_arguments implies l_arguments.is_instance_free)
		end

end
