note

	description:

		"Execution environment facilities"

	usage:

		"This class should not be used directly through %
		%inheritance and client/supplier relationship. %
		%Inherit from KL_SHARED_EXECUTION_ENVIRONMENT instead."

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_EXECUTION_ENVIRONMENT

inherit

	KL_STRING_VALUES
		rename
			value as variable_value
		end

	KL_STRING_8_VALUES
		rename
			value as string_8_variable_value,
			interpreted_string as interpreted_string_8,
			expanded_string as expanded_string_8
		end

feature -- Access

	variable_value (a_variable: STRING): detachable STRING
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set;
			-- Note: If `a_variable' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used to query its value to the environment.
		do
			if attached environment_impl.item (STRING_.as_string_no_uc_string (a_variable)) as l_item then
				if attached {STRING} l_item as l_string then
					Result := l_string
				elseif l_item.is_valid_as_string_8 then
					Result := l_item.to_string_8
				else
					Result := {UC_UTF8_ROUTINES}.string_to_utf8 (l_item)
				end
			end
		ensure then
			instance_free: class
		end

	string_8_variable_value (a_variable: STRING_8): detachable STRING_8
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set;
			-- Note: If `a_variable' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used to query its value to the environment.
		do
			if attached environment_impl.item (STRING_.as_string_8_no_uc_string (a_variable)) as l_item then
				if l_item.is_valid_as_string_8 then
					Result := l_item.to_string_8
				else
					Result := {UC_UTF8_ROUTINES}.string_to_utf8 (l_item)
				end
			end
		ensure then
			instance_free: class
		end

feature -- Setting

	set_variable_value (a_variable, a_value: READABLE_STRING_GENERAL)
			-- Set environment variable `a_variable' to `a_value'.
			-- (This setting may fail on certain platforms.)
			-- Note: If `a_variable' or `a_value' are UC_STRING or
			-- descendant, then the bytes of their associated UTF
			-- unicode encoding will be passed to the environment.
		require
			a_variable_not_void: a_variable /= Void
			a_variable_not_empty: a_variable.count > 0
			a_value_not_void: a_value /= Void
		do
			environment_impl.put (STRING_.as_readable_string_general_no_uc_string (a_value), STRING_.as_readable_string_general_no_uc_string (a_variable))
		ensure
			instance_free: class
			-- This setting may fail on certain platforms, hence the
			-- following commented postcondition:
			-- variable_set: equal (variable_value (a_variable), STRING_.as_readable_string_general_no_uc_string (a_value))
		end

feature -- Basic operations

	sleep (a_nanoseconds: INTEGER_64)
			-- Suspend thread execution for interval specified in
			-- `a_nanoseconds' (1 nanosecond = 10^(-9) second).
		require
			a_nanoseconds_not_negative: a_nanoseconds >= 0
		do
			environment_impl.sleep (a_nanoseconds)
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	environment_impl: EXECUTION_ENVIRONMENT
			-- Execution environment impl
		once
			create Result
		ensure
			instance_free: class
			environment_impl_not_void: Result /= Void
		end

end
