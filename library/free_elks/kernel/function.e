note
	description: "[
		Objects representing delayed calls to a function,
		with some arguments possibly still open.
		
		Note: Features are the same as those of ROUTINE,
			with `apply' made effective, and the addition
			of `last_result' and `item'.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	FUNCTION [BASE_TYPE, OPEN_ARGS -> detachable TUPLE create default_create end, RESULT_TYPE]

inherit
	ROUTINE [BASE_TYPE, OPEN_ARGS]

feature -- Access

	last_result: detachable RESULT_TYPE
			-- Result of last call, if any

	item (args: detachable OPEN_ARGS): RESULT_TYPE
			-- Result of calling function with `args' as operands.
		require
			valid_operands: valid_operands (args)
		external
			"built_in"
		end

feature -- Calls

	call (args: detachable OPEN_ARGS)
			-- Call routine with operands `args'.
		do
			last_result := item (args)
		end

feature -- Obsolete

	eval (args: detachable OPEN_ARGS): RESULT_TYPE
			-- Result of evaluating function for `args'.
		obsolete
			"Please use `item' instead"
		require
			valid_operands: valid_operands (args)
		do
			Result := item (args)
		end

feature -- Removal

	clear_last_result
			-- Reset content of `last_result' to its default value.
		local
			l_result: detachable RESULT_TYPE
		do
			last_result := l_result
		end

end
