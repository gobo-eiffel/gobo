note

	description:

		"Eiffel call components (either feature calls or agents)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CALL_COMPONENT

inherit

	ET_AST_NODE

feature -- Access

	target: ET_TARGET_OPERAND is
			-- Target
		deferred
		end

	name: ET_CALL_NAME is
			-- Feature name
		deferred
		ensure
			name_not_void: Result /= Void
		end

	arguments: ET_ARGUMENT_OPERANDS is
			-- Arguments
		deferred
		end

feature -- Status report

	is_qualified_call: BOOLEAN is
			-- Is current call qualified?
		do
			Result := (target /= Void)
		ensure
			definition: Result implies (target /= Void)
		end

	is_tuple_label: BOOLEAN is
			-- Is current call a call to a Tuple label?
		do
			Result := name.is_tuple_label
		ensure
			definition: Result = name.is_tuple_label
		end

end
