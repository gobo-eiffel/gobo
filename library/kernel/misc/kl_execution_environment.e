indexing

	description:

		"Execution environment facilities"

	usage:

		"This class should not be used directly through %
		%inheritance and client/supplier relationship. %
		%Inherit from KL_SHARED_EXECUTION_ENVIRONMENT instead."

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_EXECUTION_ENVIRONMENT

inherit

	KL_STRING_VALUES
		rename
			value as variable_value
		end

feature -- Access

	variable_value (a_variable: STRING): STRING is
			-- Value of environment variable `a_variable',
			-- Void if `a_variable' has not been set;
			-- Note: If `a_variable' is a UC_STRING or descendant, then
			-- the bytes of its associated UTF unicode encoding will
			-- be used to query its value to the environment.
		do
			Result := environment_impl.get (STRING_.as_string (a_variable))
		end

feature -- Setting

	set_variable_value (a_variable, a_value: STRING) is
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
			environment_impl.put (STRING_.as_string (a_value), STRING_.as_string (a_variable))
		ensure
			-- This setting may fail on certain platforms, hence the
			-- following commented postcondition:
			-- variable_set: equal (variable_value (a_variable), STRING_.as_string (a_value))
		end

feature {NONE} -- Implementation

	environment_impl: EXECUTION_ENVIRONMENT is
			-- Execution environment impl
		once
			create Result
		ensure
			environment_impl_not_void: Result /= Void
		end

end
