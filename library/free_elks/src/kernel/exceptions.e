note
	description: "[
		Facilities for adapting the exception handling mechanism.
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class EXCEPTIONS

inherit

	EXCEP_CONST

	EXCEPTION_MANAGER_FACTORY

feature -- Status report

	meaning (except: INTEGER): ?STRING
			-- A message in English describing what `except' is
		external
			"C use %"eif_except.h%""
		alias
			"eename"
		end

	assertion_violation: BOOLEAN
			-- Is last exception originally due to a violated
			-- assertion or non-decreasing variant?
		do
			Result :=
				(original_exception = Check_instruction) or else
				(original_exception = Class_invariant) or else
				(original_exception = Loop_invariant) or else
				(original_exception = Loop_variant) or else
				(original_exception = Postcondition) or else
				(original_exception = Precondition)
		end

	is_developer_exception: BOOLEAN
			-- Is the last exception originally due to
			-- a developer exception?
		do
			Result := (original_exception = Developer_exception)
		end

	is_developer_exception_of_name (name: STRING): BOOLEAN
			-- Is the last exception originally due to a developer
			-- exception of name `name'?
		do
			if is_developer_exception then
				Result := developer_exception_name ~ name
			end
		end

	developer_exception_name: ?STRING
			-- Name of last developer-raised exception
		require
			applicable: is_developer_exception
		do
			Result := original_tag_name
		end

	is_signal: BOOLEAN
			-- Is last exception originally due to an external
			-- event (operating system signal)?
		do
			Result := (original_exception = Signal_exception)
		end

	is_system_exception: BOOLEAN
			-- Is last exception originally due to an
			-- external event (operating system error)?
		do
			Result :=
				(original_exception = External_exception) or else
				(original_exception = Operating_system_exception)
		end

	tag_name: ?STRING
			-- Tag of last violated assertion clause
		external
			"C use %"eif_except.h%""
		alias
			"eeltag"
		end

	recipient_name: ?STRING
			-- Name of the routine whose execution was
			-- interrupted by last exception
		external
			"C use %"eif_except.h%""
		alias
			"eelrout"
		end

	class_name: ?STRING
			-- Name of the class that includes the recipient
			-- of original form of last exception
		external
			"C use %"eif_except.h%""
		alias
			"eelclass"
		end

	exception: INTEGER
			-- Code of last exception that occurred
		external
			"C use %"eif_except.h%""
		alias
			"eelcode"
		end

	exception_trace: ?STRING
			-- String representation of the exception trace
		external
			"C use %"eif_except.h%""
		alias
			"stack_trace_string"
		end

	original_tag_name: ?STRING
			-- Assertion tag for original form of last
			-- assertion violation.
		external
			"C use %"eif_except.h%""
		alias
			"eeotag"
		end

	original_exception: INTEGER
			-- Original code of last exception that triggered
			-- current exception
		external
			"C use %"eif_except.h%""
		alias
			"eeocode"
		end

	original_recipient_name: STRING
			-- Name of the routine whose execution was
			-- interrupted by original form of last exception
		external
			"C use %"eif_except.h%""
		alias
			"eeorout"
		end

	original_class_name: ?STRING
			-- Name of the class that includes the recipient
			-- of original form of last exception
		external
			"C use %"eif_except.h%""
		alias
			"eeoclass"
		end

feature -- Status setting

	catch (code: INTEGER)
			-- Make sure that any exception of code `code' will be
			-- caught. This is the default.
		external
			"C use %"eif_except.h%""
		alias
			"eecatch"
		end

	ignore (code: INTEGER)
			-- Make sure that any exception of code `code' will be
			-- ignored. This is not the default.
		external
			"C use %"eif_except.h%""
		alias
			"eeignore"
		end

	raise (name: STRING)
			-- Raise a developer exception of name `name'.
		local
			str: ANY
		do
			if name /= Void then
				str := name.to_c
			end
			eraise ($str, Developer_exception)
		end

	raise_retrieval_exception (name: STRING)
			-- Raise a retrieval exception of name `name'.
		local
			str: ANY
		do
			if name /= Void then
				str := name.to_c
			end
			eraise ($str, Retrieve_exception)
		end

	die (code: INTEGER)
			-- Terminate execution with exit status `code',
			-- without triggering an exception.
		external
			"C use %"eif_except.h%""
		alias
			"esdie"
		end

	new_die (code: INTEGER) obsolete "Use ``die''"
			-- Terminate execution with exit status `code',
			-- without triggering an exception.
		external
			"C use %"eif_except.h%""
		alias
			"esdie"
		end

	message_on_failure
			-- Print an exception history table
			-- in case of failure.
			-- This is the default.
		do
			c_trace_exception (True)
		end

	no_message_on_failure
			-- Do not print an exception history table
			-- in case of failure.
		do
			c_trace_exception (False)
		end

feature {NONE} -- Implementation

	eraise (str: POINTER; code: INTEGER)
			-- Raise an exception
		external
			"C signature (char *, long) use %"eif_except.h%""
		end

	c_trace_exception (b: BOOLEAN)
		external
			"C use %"eif_except.h%""
		alias
			"eetrace"
		end

end
