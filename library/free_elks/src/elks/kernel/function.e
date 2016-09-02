note
	description: "[
		Objects representing delayed calls to a function,
		with some arguments possibly still open.
		
		Note: Features are the same as those of ROUTINE,
			with `apply' made effective, and the addition
			of `last_result' and `item'.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2015-12-17 05:34:17 -0800 (Thu, 17 Dec 2015) $"
	revision: "$Revision: 98279 $"

class
	FUNCTION [OPEN_ARGS -> detachable TUPLE create default_create end, RESULT_TYPE]

inherit
	ROUTINE [OPEN_ARGS]
		redefine
			is_equal, copy
		end

create {NONE}

feature -- Access

	last_result: detachable RESULT_TYPE
			-- Result of last call, if any

	call (args: detachable separate OPEN_ARGS)
			-- <Precursor>
		do
			last_result := item (args)
		end

	item alias "()" (args: detachable OPEN_ARGS): RESULT_TYPE
			-- Result of calling function with `args' as operands.
		require
			valid_operands: valid_operands (args)
		external
			"built_in"
		end

	apply
			-- Call function with `operands' as last set.
		local
			l_args: detachable OPEN_ARGS
		do
--<			last_result := item (operands)
			last_result := item (l_args)
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is associated function the same as the one
			-- associated with `other'?
		do
			Result := Precursor (other) and then (last_result ~ other.last_result)
		end

feature -- Duplication

	copy (other: like Current)
			-- Use same function as `other'.
		do
			if other /= Current then
				Precursor (other)
				last_result := other.last_result
			end
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

feature -- Extended operations

	flexible_item (a: detachable separate TUPLE): RESULT_TYPE
			-- Result of calling function with `a' as arguments.
			-- Compared to `item' the type of `a' may be different from `{OPEN_ARGS}'.
		require
			valid_operands: valid_operands (a)
		local
			default_arguments: detachable OPEN_ARGS
		do
			if not attached a then
				Result := item (default_arguments)
			else
				check
					from_precondition: attached {OPEN_ARGS} new_tuple_from_tuple (({OPEN_ARGS}).type_id, a) as x
				then
					Result := item (x)
				end
			end
		end

end
