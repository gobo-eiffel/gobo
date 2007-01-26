indexing
	description: "[
		Objects representing delayed calls to a function, with some arguments possibly still open.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	FUNCTION [BASE_TYPE, OPEN_ARGS -> TUPLE create default_create end, RESULT_TYPE]

inherit
	ROUTINE [BASE_TYPE, OPEN_ARGS]

feature -- Access
	
	last_result: RESULT_TYPE
			-- Result of last call, if any.

	item (args: OPEN_ARGS): RESULT_TYPE is
			-- Result of calling function with `args' as operands.
		require
			valid_operands: valid_operands (args)
			callable: callable
		external
			"built_in"
		end

feature -- Calls

	call (args: OPEN_ARGS) is
			-- Call routine with operands `args'.
		do
			last_result := item (args)
		end

feature -- Obsolete

	eval (args: OPEN_ARGS): RESULT_TYPE is
			-- Result of evaluating function for `args'.
		obsolete
			"Please use `item' instead"
		require
			valid_operands: valid_operands (args)
			callable: callable
		do
			Result := item (args)
		end

end
