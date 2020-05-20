note
	description: "[
			Facilities for adapting the exception handling mechanism.
			This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class EXCEPTIONS

inherit

	EXCEP_CONST

	EXCEPTION_MANAGER_FACTORY

feature -- Status report

	meaning (except: INTEGER): detachable STRING_8
			-- A message in English describing what `except' is
		do
			if attached exception_manager.exception_from_code (except) as e then
				Result := {UTF_CONVERTER}.string_32_to_utf_8_string_8 (e.tag)
			end
		ensure
			instance_free: class
		end

	assertion_violation: BOOLEAN
			-- Is last exception originally due to a violated
			-- assertion or non-decreasing variant?
		do
			Result := attached exception_manager.last_exception as l_exception and then
						attached {ASSERTION_VIOLATION} l_exception.original
		ensure
			instance_free: class
		end

	is_developer_exception: BOOLEAN
			-- Is the last exception originally due to
			-- a developer exception?
		do
			Result := attached exception_manager.last_exception as l_exception and then
						attached {DEVELOPER_EXCEPTION} l_exception.original
		ensure
			instance_free: class
		end

	is_developer_exception_of_name (name: detachable STRING_8): BOOLEAN
			-- Is the last exception originally due to a developer
			-- exception of name `name'?
		do
			if is_developer_exception then
				Result := developer_exception_name ~ name
			end
		ensure
			instance_free: class
		end

	developer_exception_name: detachable STRING_8
			-- Name of last developer-raised exception
		require
			applicable: is_developer_exception
		do
			if attached exception_manager.last_exception as e and then attached e.original.description as d then
				Result := {UTF_CONVERTER}.escaped_utf_32_string_to_utf_8_string_8 (d)
			end
		ensure
			instance_free: class
		end

	is_signal: BOOLEAN
			-- Is last exception originally due to an external
			-- event (operating system signal)?
		do
			Result := attached exception_manager.last_exception as l_exception and then
						attached {OPERATING_SYSTEM_SIGNAL_FAILURE} l_exception.original
		ensure
			instance_free: class
		end

	is_system_exception: BOOLEAN
			-- Is last exception originally due to an
			-- external event (operating system error)?
		do
			if
				attached exception_manager.last_exception as l_exception and
				attached exception_manager.exception_from_code (external_exception) as l_external
			then
				Result := l_exception.original.conforms_to (l_external) or else
						attached {OPERATING_SYSTEM_FAILURE} l_exception.original
			end
		ensure
			instance_free: class
		end

	tag_name: detachable STRING_8
			-- Tag of last violated assertion clause
		do
			if attached exception_manager.last_exception as e and then attached e.description as d then
				Result := {UTF_CONVERTER}.escaped_utf_32_string_to_utf_8_string_8 (d)
			end
		ensure
			instance_free: class
		end

	recipient_name: detachable STRING_8
			-- Name of the routine whose execution was
			-- interrupted by last exception
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.recipient_name
			end
		ensure
			instance_free: class
		end

	class_name: detachable STRING_8
			-- Name of the class that includes the recipient
			-- of original form of last exception
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.type_name
			end
		ensure
			instance_free: class
		end

	exception: INTEGER
			-- Code of last exception that occurred
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.code
			end
		ensure
			instance_free: class
		end

	exception_trace: detachable STRING_8
			-- String representation of the exception trace
		do
			if attached exception_manager.last_exception as e and then attached e.original.trace as t then
				Result := {UTF_CONVERTER}.escaped_utf_32_string_to_utf_8_string_8 (t)
			end
		ensure
			instance_free: class
		end

	original_tag_name: detachable STRING_8
			-- Assertion tag for original form of last
			-- assertion violation.
		do
			if attached exception_manager.last_exception as e and then attached e.cause.original.description as d then
				Result := {UTF_CONVERTER}.escaped_utf_32_string_to_utf_8_string_8 (d)
			end
		ensure
			instance_free: class
		end

	original_exception: INTEGER
			-- Original code of last exception that triggered
			-- current exception
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.cause.original.code
			end
		ensure
			instance_free: class
		end

	original_recipient_name: detachable STRING_8
			-- Name of the routine whose execution was
			-- interrupted by original form of last exception
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.cause.original.recipient_name
			end
		ensure
			instance_free: class
		end

	original_class_name: detachable STRING_8
			-- Name of the class that includes the recipient
			-- of original form of last exception
		do
			if attached exception_manager.last_exception as l_exception then
				Result := l_exception.cause.original.type_name
			end
		ensure
			instance_free: class
		end

feature -- Status setting

	catch (code: INTEGER)
			-- Make sure that any exception of code `code' will be
			-- caught. This is the default.
		do
			if attached exception_manager.type_of_code (code) as l_type then
				exception_manager.catch (l_type)
			end
		ensure
			instance_free: class
		end

	ignore (code: INTEGER)
			-- Make sure that any exception of code `code' will be
			-- ignored. This is not the default.
		do
			if attached exception_manager.type_of_code (code) as l_type then
				exception_manager.ignore (l_type)
			end
		ensure
			instance_free: class
		end

	raise (name: detachable READABLE_STRING_GENERAL)
			-- Raise a developer exception of name `name'.
		local
			l_exception: DEVELOPER_EXCEPTION
		do
			create l_exception
			l_exception.set_description (name)
			l_exception.raise
		ensure
			instance_free: class
		end

	raise_retrieval_exception (name: detachable READABLE_STRING_GENERAL)
			-- Raise a retrieval exception of name `name'.
		do
			if attached exception_manager.exception_from_code (serialization_exception) as l_exception then
				l_exception.set_description (name)
				l_exception.raise
			end
		ensure
			instance_free: class
		end

	die (code: INTEGER)
			-- Terminate execution with exit status `code',
			-- without triggering an exception.
		external
			"C use %"eif_except.h%""
		alias
			"esdie"
		ensure
			False
			instance_free: class
		end

	new_die (code: INTEGER) obsolete "Use `die'. [2017-05-31]"
			-- Terminate execution with exit status `code',
			-- without triggering an exception.
		external
			"C use %"eif_except.h%""
		alias
			"esdie"
		ensure
			False
			instance_free: class
		end

	message_on_failure
			-- Print an exception history table
			-- in case of failure.
			-- This is the default.
		do
			c_trace_exception (True)
		ensure
			instance_free: class
		end

	no_message_on_failure
			-- Do not print an exception history table
			-- in case of failure.
		do
			c_trace_exception (False)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	c_trace_exception (b: BOOLEAN)
		external
			"C use %"eif_except.h%""
		alias
			"eetrace"
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
