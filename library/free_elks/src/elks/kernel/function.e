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
	date: "$Date$"
	revision: "$Revision$"

class
	FUNCTION [OPEN_ARGS -> detachable TUPLE create default_create end, RESULT_TYPE]

inherit
	ROUTINE [OPEN_ARGS]
		redefine
			is_equal, copy
		end

create {NONE}
	set_rout_disp,
	set_rout_disp_final

feature -- Access

	last_result: detachable RESULT_TYPE
			-- Result of last call, if any

	call (args: detachable separate OPEN_ARGS)
			-- <Precursor>
		do
			last_result := item (args)
		end

	item alias "()" (args: detachable separate OPEN_ARGS): RESULT_TYPE
			-- Result of calling function with `args' as operands.
		require
			valid_operands: valid_operands (args)
		external
			"built_in"
		end

	apply
			-- Call function with `operands' as last set.
		do
			last_result := item (operands)
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
			"Please use `item' instead. [2017-05-31]"
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
			i: INTEGER
		do
			if not attached a then
				Result := item (default_arguments)
			elseif attached {OPEN_ARGS} a as x then
				Result := item (x)
			else
					-- Note: with the precondition `valid_operands`, no need to check for conformance of items
					--	 the following code is similar to `new_tuple_from_tuple`.
				check
					from_precondition: attached {OPEN_ARGS} ({ISE_RUNTIME}.new_tuple_instance_of (({OPEN_ARGS}).type_id)) as x
				then
					if a.object_comparison then
						x.compare_objects
					end
					from
						i := x.count
					until
						i <= 0
					loop
						x [i] := a [i]
						i := i - 1
					end
					Result := item (x)
				end
			end
		end

feature {NONE} -- Implementation

	fast_item (a_rout_disp, a_calc_rout_addr: POINTER
		       a_closed_operands: POINTER; a_operands: POINTER
			   a_routine_id: INTEGER; a_is_basic: BOOLEAN; a_class_id_inline_agent: INTEGER;
			   a_closed_count, a_open_count: INTEGER; a_open_map: POINTER): RESULT_TYPE
		external
			"built_in"
		end

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
