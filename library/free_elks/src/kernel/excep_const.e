note
	description: "[
		Constants used for exception handling.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	EXCEP_CONST

feature -- Access

	Void_call_target: INTEGER = 1
			-- Exception code for feature applied to void reference

	No_more_memory: INTEGER = 2
			-- Exception code for failed memory allocation

	Precondition: INTEGER = 3
			-- Exception code for violated precondition

	Postcondition: INTEGER = 4
			-- Exception code for violated postcondition

	Floating_point_exception: INTEGER = 5
			-- Exception code for floating point exception

	Class_invariant: INTEGER = 6
			-- Exception code for violated class invariant

	Check_instruction: INTEGER = 7
			-- Exception code for violated check

	Routine_failure: INTEGER = 8
			-- Exception code for failed routine

	Incorrect_inspect_value: INTEGER =	9
			-- Exception code for inspect value which is not one
			-- of the inspect constants, if there is no Else_part

	Loop_variant: INTEGER = 10
			-- Exception code for non-decreased loop variant

	Loop_invariant: INTEGER = 11
			-- Exception code for violated loop invariant

	Signal_exception: INTEGER = 12
			-- Exception code for operating system signal

	Eiffel_runtime_panic: INTEGER = 13
			-- Eiffel run-time panic

	Rescue_exception: INTEGER = 14
			-- Exception code for exception in rescue clause

	Out_of_memory: INTEGER = 15
			-- Out of memory (cannot be ignored)

	Resumption_failed: INTEGER = 16
			-- Resumption failed (retry did not succeed)

	Create_on_deferred: INTEGER = 17
			-- Create on deferred

	External_exception: INTEGER = 18
			-- Exception code for operating system error
			-- which does not set the `errno' variable
			-- (Unix-specific)

	Void_assigned_to_expanded: INTEGER = 19
			-- Exception code for assignment of void value
			-- to expanded entity

	Exception_in_signal_handler: INTEGER = 20
			-- Exception in signal handler

	Io_exception: INTEGER = 21
			-- Exception code for I/O error

	Operating_system_exception: INTEGER = 22
			-- Exception code for operating system error
			-- which sets the `errno' variable
			-- (Unix-specific)

	Retrieve_exception: INTEGER = 23
			-- Exception code for retrieval error
			-- may be raised by `retrieved' in `IO_MEDIUM'.

	Developer_exception: INTEGER = 24
			-- Exception code for developer exception

	Eiffel_runtime_fatal_error: INTEGER = 25
			-- Eiffel run-time fatal error

	Dollar_applied_to_melted_feature: INTEGER = 26
			-- $ applied to melted feature

	Runtime_io_exception: INTEGER = 27
			-- Exception code for I/O error raised by runtime functions
			-- such as store/retrieve, file access...

	Com_exception: INTEGER = 28
			-- Exception code for a COM error.

	Runtime_check_exception: INTEGER = 29
			-- Exception code for runtime check being violated.

	old_exception: INTEGER = 30
			-- Old exception code.

	serialization_exception: INTEGER = 31
			-- Serialization exception code.

	number_of_codes: INTEGER = 31
			-- How many codes are there to represent exceptions?

	valid_code (c: INTEGER): BOOLEAN
			-- Is `c' a valid code to represent some kind of exceptions?
		do
			Result := c >= 1 and c <= number_of_codes
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
